@implementation MCMResultWithURLBase

- (BOOL)encodeResultOntoReply:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  id v8;
  const char *v9;
  MCMResultWithURLBase *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MCMResultWithURLBase;
  v5 = -[MCMResultBase encodeResultOntoReply:](&v12, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    -[MCMResultBase error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[MCMResultWithURLBase path](self, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[MCMResultWithURLBase path](self, "path");
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v9 = (const char *)objc_msgSend(v8, "fileSystemRepresentation");

        if (v9)
          xpc_dictionary_set_string(v4, "ReplyPath", v9);
      }
      v10 = objc_retainAutorelease(self);
      if (-[MCMResultWithURLBase sandboxToken](v10, "sandboxToken"))
        xpc_dictionary_set_string(v4, "ReplySandboxToken", -[MCMResultWithURLBase sandboxToken](objc_retainAutorelease(v10), "sandboxToken"));
      xpc_dictionary_set_BOOL(v4, "ReplyExisted", -[MCMResultWithURLBase existed](v10, "existed"));
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)dealloc
{
  const char **p_sandboxToken;
  char *sandboxToken;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  p_sandboxToken = &self->_sandboxToken;
  sandboxToken = (char *)self->_sandboxToken;
  if (sandboxToken)
  {
    free(sandboxToken);
    memset_s(p_sandboxToken, 8uLL, 0, 8uLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)MCMResultWithURLBase;
  -[MCMResultWithURLBase dealloc](&v5, sel_dealloc);
}

- (MCMResultWithURLBase)initWithURL:(id)a3 existed:(BOOL)a4 sandboxToken:(const char *)a5
{
  _BOOL8 v6;
  id v9;
  void *v10;
  MCMResultWithURLBase *v11;

  v6 = a4;
  v9 = a3;
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MCMResultWithURLBase initWithPath:existed:sandboxToken:](self, "initWithPath:existed:sandboxToken:", v10, v6, a5);

  if (v11)
    objc_storeStrong((id *)&v11->_url, a3);

  return v11;
}

- (MCMResultWithURLBase)initWithPath:(id)a3 existed:(BOOL)a4 sandboxToken:(const char *)a5
{
  id v9;
  MCMResultWithURLBase *v10;
  MCMResultWithURLBase *v11;
  char *v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MCMResultWithURLBase;
  v10 = -[MCMResultBase init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_path, a3);
    if (a5)
      v12 = strndup(a5, 0x800uLL);
    else
      v12 = 0;
    v11->_sandboxToken = v12;
    v11->_existed = a4;
  }

  return v11;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)path
{
  return self->_path;
}

- (const)sandboxToken
{
  return self->_sandboxToken;
}

- (BOOL)existed
{
  return self->_existed;
}

@end
