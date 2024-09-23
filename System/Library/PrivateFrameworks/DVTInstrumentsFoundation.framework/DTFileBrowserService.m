@implementation DTFileBrowserService

+ (void)registerCapabilities:(id)a3
{
  id v4;

  v4 = a3;
  if (+[DTInstrumentServer isAppleInternal](DTInstrumentServer, "isAppleInternal"))
    objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.filebrowser"), 2, a1);

}

- (id)entriesAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31[2];

  v3 = a3;
  v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v3, v31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v31[0];
  if (!v6)
  {
    v7 = objc_msgSend(v5, "count");
    if (v7)
    {
      v8 = v7;
      v6 = 0;
      v9 = 0;
      v23 = v5;
      v24 = v3;
      v22 = v7;
      while (1)
      {
        objc_msgSend(v5, "objectAtIndex:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "stringByAppendingPathComponent:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v6;
        objc_msgSend(v4, "attributesOfItemAtPath:error:", v11, &v30);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v30;

        if (!v13)
          break;
        v6 = 0;
LABEL_12:

        if (v8 == ++v9)
          goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/Info.plist"), v11);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v14;
      if (v14)
      {
        v28 = 0;
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v14, 0, &v29, &v28);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v28;
        v16 = 0x24BDBC000;
        if (v15)
        {
LABEL_11:
          v27 = 0;
          objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v11, &v27);
          v17 = *(void **)(v16 + 3696);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v27);
          v18 = v4;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v11, CFSTR("DTFileBrowserEntryPath"), v10, CFSTR("DTFileBrowserEntryName"), v12, CFSTR("DTFileBrowserEntryAttributes"), v15, CFSTR("DTFileBrowserEntryPList"), v19, CFSTR("DTFileBrowserEntryIsDirectory"), 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v4 = v18;
          objc_msgSend(v25, "addObject:", v20);

          v5 = v23;
          v3 = v24;
          v8 = v22;
          goto LABEL_12;
        }
      }
      else
      {
        v6 = 0;
        v16 = 0x24BDBC000uLL;
      }
      objc_msgSend(*(id *)(v16 + 3696), "dictionaryWithObjectsAndKeys:", CFSTR("simple_executable"), CFSTR("DTFileBrowserEntryType"), v11, CFSTR("CFBundleIdentifier"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v6 = 0;
  }
LABEL_15:

  return v25;
}

- (id)entriesInPathsArray:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  uint64_t v26;
  id v27[2];

  v3 = a3;
  v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0x24BDBC000uLL;
    v20 = v5;
    v21 = v3;
    while (1)
    {
      objc_msgSend(v3, "objectAtIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v7;
      objc_msgSend(v4, "attributesOfItemAtPath:error:", v10, v27);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v27[0];

      if (!v12)
        break;
      v7 = 0;
LABEL_11:

      if (v6 == ++v8)
      {

        goto LABEL_13;
      }
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/Info.plist"), v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v13;
    if (v13)
    {
      v25 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v13, 0, &v26, &v25);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v25;
      if (v14)
      {
LABEL_10:
        v24 = 0;
        objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v10, &v24);
        v15 = *(void **)(v9 + 3696);
        objc_msgSend(v10, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v24);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v10, CFSTR("DTFileBrowserEntryPath"), v16, CFSTR("DTFileBrowserEntryName"), v11, CFSTR("DTFileBrowserEntryAttributes"), v14, CFSTR("DTFileBrowserEntryPList"), v17, CFSTR("DTFileBrowserEntryIsDirectory"), 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = 0x24BDBC000;
        objc_msgSend(v22, "addObject:", v18);

        v6 = v20;
        v3 = v21;
        goto LABEL_11;
      }
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(*(id *)(v9 + 3696), "dictionaryWithObjectsAndKeys:", CFSTR("simple_executable"), CFSTR("DTFileBrowserEntryType"), v10, CFSTR("CFBundleIdentifier"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_13:

  return v22;
}

- (id)dataFromFileAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", v3))
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v3, 2, &v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)contentsOfDirectoryAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v15;
  id v16;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v3, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  if (!v6)
    goto LABEL_8;
  v15 = 0;
  if (objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v15))
    v7 = v15 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v9 = objc_alloc(MEMORY[0x24BDBCE88]);
    objc_msgSend(v6, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithName:reason:userInfo:", CFSTR("XRFileSystemException"), v10, v11);

    objc_msgSend(v12, "raise");
LABEL_8:
    v8 = v5;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v13 = v8;

  return v13;
}

- (id)updateAttributesForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v9;
  uint64_t v10;

  v3 = a3;
  objc_msgSend(v3, "valueForKey:", CFSTR("DTFileBrowserEntryPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "attributesOfItemAtPath:error:", v4, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v9 = 0;
    objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v9);
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("DTFileBrowserEntryAttributes"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("DTFileBrowserEntryIsDirectory"));

  }
  return v3;
}

- (id)fileExistsAtPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v11);

  v12[0] = CFSTR("fileExists");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("isDirectory");
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
