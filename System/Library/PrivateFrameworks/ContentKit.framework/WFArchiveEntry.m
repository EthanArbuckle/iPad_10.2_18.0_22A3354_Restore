@implementation WFArchiveEntry

- (WFArchiveEntry)initWithDirectoryName:(id)a3
{
  return -[WFArchiveEntry initWithFilename:fileType:filePermission:fileSize:modificationDate:creationDate:dataProvider:](self, "initWithFilename:fileType:filePermission:fileSize:modificationDate:creationDate:dataProvider:", a3, 0x4000, 493, 0, 0, 0, 0);
}

- (WFArchiveEntry)initWithFilename:(id)a3 fileRepresentation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  WFArchiveEntry *v19;
  id *v21;
  int v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    objc_msgSend(v7, "filename");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v8, "representationType") == 1
    && (objc_msgSend(v8, "fileURL"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "wf_fileIsDirectory"),
        v9,
        (v10 & 1) != 0))
  {
    v22 = 0;
    v11 = 0;
    v12 = 0x4000;
    v13 = 493;
  }
  else
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __54__WFArchiveEntry_initWithFilename_fileRepresentation___block_invoke;
    v23[3] = &unk_24C4DFC98;
    v11 = v23;
    v21 = &v24;
    v24 = v8;
    v12 = 0x8000;
    v13 = 420;
    v22 = 1;
  }
  v14 = _Block_copy(v11);
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(v8, "filename");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = objc_msgSend(v8, "fileSize");
  objc_msgSend(v8, "modificationDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "creationDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[WFArchiveEntry initWithFilename:fileType:filePermission:fileSize:modificationDate:creationDate:dataProvider:](self, "initWithFilename:fileType:filePermission:fileSize:modificationDate:creationDate:dataProvider:", v15, v12, v13, v16, v17, v18, v14);

  if (!v6)
  if (v22)

  return v19;
}

- (WFArchiveEntry)initWithFilename:(id)a3 fileType:(unsigned __int16)a4 filePermission:(unsigned __int16)a5 fileSize:(int64_t)a6 modificationDate:(id)a7 creationDate:(id)a8 dataProvider:(id)a9
{
  int v11;
  id v14;
  id v15;
  id v16;
  id v17;
  WFArchiveEntry *v18;
  uint64_t v19;
  id dataProvider;
  uint64_t v21;
  WFArchiveEntry *v22;
  void *v24;
  objc_super v25;

  v11 = a4;
  v14 = a3;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLibArchive.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filename"));

  }
  v25.receiver = self;
  v25.super_class = (Class)WFArchiveEntry;
  v18 = -[WFArchiveEntry init](&v25, sel_init);
  if (v18)
  {
    v18->_entry = (archive_entry *)archive_entry_new();
    v19 = objc_msgSend(v17, "copy");
    dataProvider = v18->_dataProvider;
    v18->_dataProvider = (id)v19;

    if (v11 == 0x4000 && (objc_msgSend(v14, "hasSuffix:", CFSTR("/")) & 1) == 0)
    {
      objc_msgSend(v14, "stringByAppendingString:", CFSTR("/"));
      v21 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v21;
    }
    v14 = objc_retainAutorelease(v14);
    objc_msgSend(v14, "fileSystemRepresentation");
    archive_entry_set_pathname();
    archive_entry_set_filetype();
    archive_entry_set_perm();
    archive_entry_set_size();
    if (v15)
    {
      objc_msgSend(v15, "timeIntervalSince1970");
      archive_entry_set_mtime();
    }
    if (v16)
    {
      objc_msgSend(v16, "timeIntervalSince1970");
      archive_entry_set_ctime();
    }
    v22 = v18;
  }

  return v18;
}

- (void)dealloc
{
  objc_super v3;

  archive_entry_free();
  v3.receiver = self;
  v3.super_class = (Class)WFArchiveEntry;
  -[WFArchiveEntry dealloc](&v3, sel_dealloc);
}

- (archive_entry)entry
{
  return self->_entry;
}

- (id)dataProvider
{
  return self->_dataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataProvider, 0);
}

uint64_t __54__WFArchiveEntry_initWithFilename_fileRepresentation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "inputStream");
}

+ (id)archiveEntriesWithTopLevelFileRepresentation:(id)a3 usedFilenames:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v34;
  id v35;
  id obj;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "representationType") == 1
    && (objc_msgSend(v5, "fileURL"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "wf_fileIsDirectory"),
        v7,
        v8))
  {
    v37 = v6;
    objc_msgSend(v5, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    v11 = objc_alloc((Class)a1);
    objc_msgSend(v9, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v5;
    v13 = objc_msgSend(v11, "initWithFilename:fileRepresentation:", v12, v5);

    v14 = v10;
    v34 = (void *)v13;
    objc_msgSend(v10, "addObject:", v13);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "subpathsOfDirectoryAtPath:error:", v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v17;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v40 != v20)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v9, "URLByAppendingPathComponent:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFFileRepresentation fileWithURL:options:](WFFileRepresentation, "fileWithURL:options:", v23, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastPathComponent");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringByAppendingPathComponent:", v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = objc_alloc((Class)a1);
          WFAvailableArchiveFilename(v26, v37);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v27, "initWithFilename:fileRepresentation:", v28, v24);

          objc_msgSend(v14, "addObject:", v29);
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v19);
    }
    v30 = obj;

    v31 = v34;
    v5 = v35;
    v6 = v37;
  }
  else
  {
    v32 = objc_alloc((Class)a1);
    objc_msgSend(v5, "filename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WFAvailableArchiveFilename(v9, v6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v32, "initWithFilename:fileRepresentation:", v31, v5);
    v43 = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

@end
