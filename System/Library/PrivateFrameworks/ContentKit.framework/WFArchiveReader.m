@implementation WFArchiveReader

- (WFArchiveReader)initWithArchiveFile:(id)a3 error:(id *)a4
{
  id v6;
  WFArchiveReader *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  WFArchiveReader *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  int open_filename;
  objc_super v23;

  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WFArchiveReader;
  v7 = -[WFArchiveReader init](&v23, sel_init);
  if (v7)
  {
    v7->_archive = (archive *)archive_read_new();
    MEMORY[0x20BD3D460]();
    objc_msgSend(v6, "filename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("gz")) & 1) == 0
      && !objc_msgSend(v9, "isEqualToString:", CFSTR("xz")))
    {
      goto LABEL_6;
    }
    objc_msgSend(v8, "stringByDeletingPathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      v12 = (void *)MEMORY[0x24BEC14A0];
      objc_msgSend(v8, "stringByDeletingPathExtension");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeFromFilename:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "conformsToUTType:", *MEMORY[0x24BDF82C0]);

      if ((v15 & 1) != 0)
      {
LABEL_6:
        archive_read_support_format_all();
        goto LABEL_10;
      }
    }
    else
    {

    }
    archive_read_support_format_raw();
LABEL_10:
    v17 = objc_msgSend(v6, "representationType");
    if (v17 == 1)
    {
      objc_msgSend(v6, "fileURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "path");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v20, "fileSystemRepresentation");
      open_filename = archive_read_open_filename();

      if (open_filename)
      {
        if (a4)
        {
          WFLastArchiveError();
          v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

          goto LABEL_23;
        }
LABEL_19:
        v16 = 0;
        goto LABEL_22;
      }
    }
    else if (!v17)
    {
      objc_msgSend(v6, "data");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v18, "bytes");
      objc_msgSend(v18, "length");
      if (archive_read_open_memory())
      {
        if (a4)
        {
          WFLastArchiveError();
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_19;
      }

    }
    v16 = v7;
    goto LABEL_22;
  }
  v16 = 0;
LABEL_23:

  return v16;
}

- (id)extractArchiveToDestinationURL:(id)a3 error:(id *)a4
{
  id v4;
  int next_header;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void *v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27 = (void *)objc_opt_new();
  v25 = *MEMORY[0x24BDD0B88];
  v24 = *MEMORY[0x24BDD0FC8];
  while (1)
  {
    next_header = archive_read_next_header();
    if (next_header)
      break;
    WFPathFromArchiveEntry();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "hasPrefix:", CFSTR("__MACOSX")) & 1) != 0
      || (objc_msgSend(v7, "lastPathComponent"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqualToString:", CFSTR(".DS_Store")),
          v8,
          v9))
    {
      archive_read_data_skip();
      goto LABEL_23;
    }
    getWFLibArchiveLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[WFArchiveReader extractArchiveToDestinationURL:error:]";
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_20BBAD000, v10, OS_LOG_TYPE_DEFAULT, "%s Reading archive entry for %@", buf, 0x16u);
    }

    if (!v6)
    {
      v12 = 0;
LABEL_31:
      if (a4)
      {
        v20 = (void *)MEMORY[0x24BDD1540];
        v28 = v24;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The item couldn't be extracted because the file path \"%@\" is invalid."), v6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v21;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", v25, 514, v22);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_35:
      v18 = v27;

      v19 = 0;
      goto LABEL_36;
    }
    objc_msgSend(v4, "URLByAppendingPathComponent:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11 || (objc_msgSend(v11, "wf_proposedFileIsContainedByDirectoryAtURL:", v4) & 1) == 0)
      goto LABEL_31;
    objc_msgSend(v12, "path");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "fileSystemRepresentation");
    archive_entry_set_pathname();

    if (archive_read_extract())
    {
      if (a4)
      {
        WFLastArchiveError();
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_35;
    }
    objc_msgSend(v6, "pathComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("/")))
    {
      if ((unint64_t)objc_msgSend(v14, "count") < 2)
      {

        v15 = 0;
        goto LABEL_21;
      }
      objc_msgSend(v14, "objectAtIndex:", 1);
      v16 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v16;
    }
    if (v15)
    {
      objc_msgSend(v4, "URLByAppendingPathComponent:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        if ((objc_msgSend(v27, "containsObject:", v17) & 1) == 0)
          objc_msgSend(v27, "addObject:", v17);
      }
      goto LABEL_22;
    }
LABEL_21:
    v17 = 0;
LABEL_22:

LABEL_23:
  }
  if (next_header == 1)
  {
    v18 = v27;
    v19 = v27;
  }
  else
  {
    if (a4)
    {
      WFLastArchiveError();
      v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    v18 = v27;
  }
LABEL_36:

  return v19;
}

- (archive)archive
{
  return self->_archive;
}

@end
