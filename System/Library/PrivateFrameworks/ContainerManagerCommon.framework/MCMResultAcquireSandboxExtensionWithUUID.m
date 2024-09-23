@implementation MCMResultAcquireSandboxExtensionWithUUID

- (MCMResultAcquireSandboxExtensionWithUUID)initWithSandboxToken:(const char *)a3 personaUniqueString:(id)a4 url:(id)a5
{
  id v9;
  id v10;
  MCMResultAcquireSandboxExtensionWithUUID *v11;
  MCMResultAcquireSandboxExtensionWithUUID *v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MCMResultAcquireSandboxExtensionWithUUID;
  v11 = -[MCMResultBase init](&v14, sel_init);
  if (v11)
  {
    if (!a3)
    {
      v12 = 0;
      goto LABEL_6;
    }
    v11->_sandboxToken = strndup(a3, 0x400uLL);
    objc_storeStrong((id *)&v11->_personaUniqueString, a4);
    objc_storeStrong((id *)&v11->_url, a5);
  }
  v12 = v11;
LABEL_6:

  return v12;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MCMResultAcquireSandboxExtensionWithUUID;
  v5 = -[MCMResultBase encodeResultOntoReply:](&v10, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    -[MCMResultBase error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[MCMResultAcquireSandboxExtensionWithUUID personaUniqueString](self, "personaUniqueString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[MCMResultAcquireSandboxExtensionWithUUID personaUniqueString](self, "personaUniqueString");
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        xpc_dictionary_set_string(v4, "ReplyPersonaUniqueString", (const char *)objc_msgSend(v8, "UTF8String"));

      }
      xpc_dictionary_set_string(v4, "ReplySandboxToken", -[MCMResultAcquireSandboxExtensionWithUUID sandboxToken](self, "sandboxToken"));
    }
  }

  return v5;
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
  v5.super_class = (Class)MCMResultAcquireSandboxExtensionWithUUID;
  -[MCMResultAcquireSandboxExtensionWithUUID dealloc](&v5, sel_dealloc);
}

- (const)sandboxToken
{
  return self->_sandboxToken;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
