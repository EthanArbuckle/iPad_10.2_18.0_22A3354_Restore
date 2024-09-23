@implementation MCMContainerSchemaActionUnlink

- (MCMContainerSchemaActionUnlink)initWithPathArgument:(id)a3 context:(id)a4
{
  id v6;
  MCMContainerSchemaActionUnlink *v7;
  uint64_t v8;
  NSURL *url;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMContainerSchemaActionUnlink;
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
  NSURL *url;
  BOOL v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x1E0C80C00];
  url = self->_url;
  v11[0] = 0;
  v5 = -[MCMContainerSchemaActionBase fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:](self, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", url, v11, &__block_literal_global_2319);
  v6 = v11[0];
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {
    v8 = objc_msgSend(v6, "code");

    if (v8 == 2)
    {

      v6 = 0;
      v5 = 1;
      goto LABEL_10;
    }
  }
  else
  {

  }
  if (a3)
    v9 = v5;
  else
    v9 = 1;
  if ((v9 & 1) == 0)
  {
    v6 = objc_retainAutorelease(v6);
    v5 = 0;
    *a3 = v6;
  }
LABEL_10:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

uint64_t __51__MCMContainerSchemaActionUnlink_performWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a2;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "removeItemAtURL:error:", v4, a3);

  return v6;
}

+ (id)actionIdentifier
{
  __CFString *v2;

  v2 = CFSTR("unlink");
  return CFSTR("unlink");
}

@end
