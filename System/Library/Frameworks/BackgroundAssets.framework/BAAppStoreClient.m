@implementation BAAppStoreClient

- (BAAppStoreClient)init
{
  BAAppStoreClient *v2;
  BAAgentSystemProxy *v3;
  BAAgentSystemProxy *systemProxy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BAAppStoreClient;
  v2 = -[BAAppStoreClient init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(BAAgentSystemProxy);
    systemProxy = v2->_systemProxy;
    v2->_systemProxy = v3;

  }
  return v2;
}

- (void)dealloc
{
  BAAppStoreClient *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (BAAppStoreClient *)self->_systemProxy;
  -[BAAppStoreClient invalidate](self, "invalidate");
  v3.receiver = v2;
  v3.super_class = (Class)BAAppStoreClient;
  -[BAAppStoreClient dealloc](&v3, sel_dealloc);
}

- (BOOL)prepareForAppInstallWithDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  BAAgentSystemProxy *systemProxy;
  BOOL v13;
  void *v14;
  uint64_t v15;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      +[BAAppStoreClient _errorWithCode:errorObject:]((uint64_t)BAAppStoreClient, 5, v6);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  objc_msgSend(v6, "appBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_11:
    if (a4)
    {
      objc_msgSend(v6, "appBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 2;
LABEL_13:
      +[BAAppStoreClient _errorWithCode:errorObject:]((uint64_t)BAAppStoreClient, v15, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v6, "appBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
    goto LABEL_11;
  objc_msgSend(v6, "appStoreMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (!a4)
      goto LABEL_14;
    objc_msgSend(v6, "appBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 3;
    goto LABEL_13;
  }
  if (self)
    systemProxy = self->_systemProxy;
  else
    systemProxy = 0;
  v13 = -[BAAgentSystemProxy applicationPrepareWithDescriptor:error:](systemProxy, "applicationPrepareWithDescriptor:error:", v6, a4);
LABEL_15:

  return v13;
}

+ (id)_errorWithCode:(void *)a3 errorObject:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_self();
  if ((unint64_t)(a2 - 1) > 5)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", off_24DDBF148[a2 - 1], v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)MEMORY[0x24BDD1540];
  v10 = *MEMORY[0x24BDD0FC8];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("BAAppStoreClientErrorDomain"), a2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)performEventWithDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  BAAgentSystemProxy *systemProxy;
  BOOL v12;
  void *v13;
  uint64_t v14;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "appBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "appBundleURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v9, "isFileURL") & 1) != 0)
      {
        if (objc_msgSend(v6, "eventType") == 22)
        {
LABEL_8:
          if (self)
            systemProxy = self->_systemProxy;
          else
            systemProxy = 0;
          v12 = -[BAAgentSystemProxy applicationEventPerformedWithDescriptor:error:](systemProxy, "applicationEventPerformedWithDescriptor:error:", v6, a4);
          goto LABEL_22;
        }
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {

          goto LABEL_8;
        }
        if (a4)
        {
          v14 = 4;
          goto LABEL_18;
        }
      }
      else if (a4)
      {
        v14 = 1;
LABEL_18:
        +[BAAppStoreClient _errorWithCode:errorObject:]((uint64_t)BAAppStoreClient, v14, v9);
        v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

        goto LABEL_23;
      }
      v12 = 0;
      goto LABEL_22;
    }
    if (a4)
    {
      objc_msgSend(v6, "appBundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[BAAppStoreClient _errorWithCode:errorObject:]((uint64_t)BAAppStoreClient, 2, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_15;
  }
  if (!a4)
  {
LABEL_15:
    v12 = 0;
    goto LABEL_23;
  }
  +[BAAppStoreClient _errorWithCode:errorObject:]((uint64_t)BAAppStoreClient, 6, v6);
  v12 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemProxy, 0);
}

@end
