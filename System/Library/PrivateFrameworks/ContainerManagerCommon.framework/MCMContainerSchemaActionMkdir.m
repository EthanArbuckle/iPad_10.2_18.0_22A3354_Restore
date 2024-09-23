@implementation MCMContainerSchemaActionMkdir

- (MCMContainerSchemaActionMkdir)initWithPathArgument:(id)a3 context:(id)a4
{
  id v6;
  MCMContainerSchemaActionMkdir *v7;
  uint64_t v8;
  NSURL *url;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMContainerSchemaActionMkdir;
  v7 = -[MCMContainerSchemaActionBase initWithContext:](&v11, sel_initWithContext_, a4);
  if (v7)
  {
    objc_msgSend(v6, "fileURL");
    v8 = objc_claimAutoreleasedReturnValue();
    url = v7->_url;
    v7->_url = (NSURL *)v8;

    if (!v7->_url)
    {

      v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "actionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_url, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" [%@]"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)performWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  NSURL *url;
  BOOL v11;
  id v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17[2];

  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  -[NSURL URLByDeletingLastPathComponent](self->_url, "URLByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v16[4] = self;
  v17[0] = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__MCMContainerSchemaActionMkdir_performWithError___block_invoke;
  v16[3] = &unk_1E8CB6768;
  v7 = -[MCMContainerSchemaActionBase fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:](self, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", v5, v17, v16);
  v8 = v17[0];
  v9 = v8;
  if (v7)
  {
    url = self->_url;
    v14[4] = self;
    v15 = v8;
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __50__MCMContainerSchemaActionMkdir_performWithError___block_invoke_2;
    v14[3] = &unk_1E8CB6768;
    v11 = -[MCMContainerSchemaActionBase fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:](self, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", url, &v15, v14);
    v12 = v15;

    v9 = v12;
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    v11 = 0;
    if (!a3)
      goto LABEL_7;
  }
  if (!v11)
    *a3 = objc_retainAutorelease(v9);
LABEL_7:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

uint64_t __50__MCMContainerSchemaActionMkdir_performWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "makedirAtURL:followTerminalSymlink:error:", a2, 1, a3);
}

uint64_t __50__MCMContainerSchemaActionMkdir_performWithError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "makedirAtURL:followTerminalSymlink:error:", a2, 0, a3);
}

+ (id)actionIdentifier
{
  __CFString *v2;

  v2 = CFSTR("mkdir");
  return CFSTR("mkdir");
}

@end
