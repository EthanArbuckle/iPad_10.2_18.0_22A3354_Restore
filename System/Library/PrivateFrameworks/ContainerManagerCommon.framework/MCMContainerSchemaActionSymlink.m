@implementation MCMContainerSchemaActionSymlink

- (MCMContainerSchemaActionSymlink)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  MCMContainerSchemaActionSymlink *v13;
  uint64_t v14;
  NSURL *linkURL;
  uint64_t v16;
  NSURL *finalLinkURL;
  uint64_t v18;
  NSString *targetPath;
  objc_super v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MCMContainerSchemaActionSymlink;
  v13 = -[MCMContainerSchemaActionBase initWithContext:](&v21, sel_initWithContext_, a6);
  if (v13)
  {
    objc_msgSend(v11, "fileURL");
    v14 = objc_claimAutoreleasedReturnValue();
    linkURL = v13->_linkURL;
    v13->_linkURL = (NSURL *)v14;

    objc_msgSend(v12, "fileURL");
    v16 = objc_claimAutoreleasedReturnValue();
    finalLinkURL = v13->_finalLinkURL;
    v13->_finalLinkURL = (NSURL *)v16;

    objc_msgSend(v10, "string");
    v18 = objc_claimAutoreleasedReturnValue();
    targetPath = v13->_targetPath;
    v13->_targetPath = (NSString *)v18;

    if (!v13->_linkURL || !v13->_targetPath)
    {

      v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "actionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_linkURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" [%@] → [%@]"), v4, self->_targetPath);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)performWithError:(id *)a3
{
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSString *v15;
  NSString *targetPath;
  NSString *v17;
  NSURL *v18;
  NSURL *linkURL;
  NSURL *v20;
  NSString *v21;
  BOOL v22;
  id v23;
  void *v24;
  _QWORD v27[5];
  NSURL *v28;
  NSString *v29;
  id v30[2];

  v30[1] = *(id *)MEMORY[0x1E0C80C00];
  -[NSURL path](self->_finalLinkURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_targetPath;
  v6 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v4, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99DE8];
  -[NSString pathComponents](v5, "pathComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {

    if (!objc_msgSend(v8, "count") || !objc_msgSend(v11, "count"))
      break;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v12) & 1) == 0)
    {

      break;
    }
    objc_msgSend(v8, "removeObjectAtIndex:", 0);
    objc_msgSend(v11, "removeObjectAtIndex:", 0);

  }
  if (objc_msgSend(v8, "count"))
    objc_msgSend(v8, "removeObjectAtIndex:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v14 = 0;
    do
    {
      objc_msgSend(v13, "addObject:", CFSTR(".."));
      ++v14;
    }
    while (v14 < objc_msgSend(v8, "count"));
  }
  objc_msgSend(v13, "addObjectsFromArray:", v11);
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v13);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();

  targetPath = self->_targetPath;
  self->_targetPath = v15;

  v17 = self->_targetPath;
  v18 = self->_finalLinkURL;
  linkURL = self->_linkURL;
  v30[0] = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __52__MCMContainerSchemaActionSymlink_performWithError___block_invoke;
  v27[3] = &unk_1E8CB5C18;
  v27[4] = self;
  v20 = v18;
  v28 = v20;
  v21 = v17;
  v29 = v21;
  v22 = -[MCMContainerSchemaActionBase fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:](self, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", linkURL, v30, v27);
  v23 = v30[0];
  v24 = v23;
  if (a3 && !v22)
    *a3 = objc_retainAutorelease(v23);

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetPath, 0);
  objc_storeStrong((id *)&self->_finalLinkURL, 0);
  objc_storeStrong((id *)&self->_linkURL, 0);
}

uint64_t __52__MCMContainerSchemaActionSymlink_performWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(a1 + 32), "makedirAtURL:followTerminalSymlink:error:", v6, 1, a3))
  {
    v8 = 0;
    v9 = 0;
    goto LABEL_7;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "isEqual:", v5))
  {
    v8 = 0;
    v9 = 0;
    goto LABEL_9;
  }
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = 0;
  objc_msgSend(v7, "targetOfSymbolicLinkAtURL:error:", v5, v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18[0];

  if (!v8)
  {
    objc_msgSend(v9, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0CB2FE0];
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v15 = objc_msgSend(v9, "code");

      if (v15 == 17)
      {
        v8 = 0;
        if ((objc_msgSend(*(id *)(a1 + 32), "backupFileURL:error:", v5, a3) & 1) == 0)
          goto LABEL_7;
LABEL_9:
        +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v11, "symbolicallyLinkURL:toSymlinkTarget:error:", v5, *(_QWORD *)(a1 + 48), a3);

        goto LABEL_10;
      }
    }
    else
    {

    }
    objc_msgSend(v9, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", v14))
    {
      v17 = objc_msgSend(v9, "code");

      if (v17 == 2)
      {
        v8 = 0;
        goto LABEL_9;
      }
    }
    else
    {

    }
    v9 = objc_retainAutorelease(v9);
    v8 = 0;
    v10 = 0;
    *a3 = v9;
    goto LABEL_10;
  }
  if ((objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "backupFileURL:error:", v5, a3))
      goto LABEL_9;
LABEL_7:
    v10 = 0;
    goto LABEL_10;
  }
  v10 = 1;
LABEL_10:

  return v10;
}

+ (id)actionIdentifier
{
  __CFString *v2;

  v2 = CFSTR("symlink");
  return CFSTR("symlink");
}

@end
