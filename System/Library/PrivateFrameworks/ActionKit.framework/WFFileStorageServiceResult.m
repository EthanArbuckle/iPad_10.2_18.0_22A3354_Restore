@implementation WFFileStorageServiceResult

- (WFFileStorageServiceResult)initWithWrappedURL:(id)a3 metadataObject:(id)a4
{
  unint64_t v8;
  unint64_t v9;
  WFFileStorageServiceResult *v10;
  WFFileStorageServiceResult *v11;
  NSURL *lifecycleManagedURL;
  WFFileStorageServiceResult *v13;
  void *v15;
  objc_super v16;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  if (!(v8 | v9))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFileStorageServiceResult.m"), 49, CFSTR("Can't initialize a result with no data"));

  }
  v16.receiver = self;
  v16.super_class = (Class)WFFileStorageServiceResult;
  v10 = -[WFFileStorageServiceResult init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    lifecycleManagedURL = v10->_lifecycleManagedURL;
    v10->_lifecycleManagedURL = 0;

    objc_storeStrong((id *)&v11->_wrappedURL, a3);
    objc_storeStrong((id *)&v11->_metadataObject, a4);
    v13 = v11;
  }

  return v11;
}

- (WFFileStorageServiceResult)initWithFileURL:(id)a3 metadataObject:(id)a4
{
  unint64_t v8;
  unint64_t v9;
  WFFileStorageServiceResult *v10;
  uint64_t v11;
  NSSecurityScopedURLWrapper *wrappedURL;
  WFFileStorageServiceResult *v13;
  void *v15;
  objc_super v16;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  if (!(v8 | v9))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFileStorageServiceResult.m"), 64, CFSTR("Can't initialize a result with no data"));

  }
  v16.receiver = self;
  v16.super_class = (Class)WFFileStorageServiceResult;
  v10 = -[WFFileStorageServiceResult init](&v16, sel_init);
  if (v10)
  {
    objc_msgSend((id)v8, "startAccessingSecurityScopedResource");
    objc_storeStrong((id *)&v10->_lifecycleManagedURL, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17B8]), "initWithURL:", v8);
    wrappedURL = v10->_wrappedURL;
    v10->_wrappedURL = (NSSecurityScopedURLWrapper *)v11;

    objc_storeStrong((id *)&v10->_metadataObject, a4);
    v13 = v10;
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[WFFileStorageServiceResult lifecycleManagedURL](self, "lifecycleManagedURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFFileStorageServiceResult lifecycleManagedURL](self, "lifecycleManagedURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopAccessingSecurityScopedResource");

  }
  v5.receiver = self;
  v5.super_class = (Class)WFFileStorageServiceResult;
  -[WFFileStorageServiceResult dealloc](&v5, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFFileStorageServiceResult wrappedURL](self, "wrappedURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("wrappedURL"));

  -[WFFileStorageServiceResult metadataObject](self, "metadataObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("metadataObject"));

}

- (WFFileStorageServiceResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFFileStorageServiceResult *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wrappedURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "possibleMetadataClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("metadataObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFFileStorageServiceResult initWithWrappedURL:metadataObject:](self, "initWithWrappedURL:metadataObject:", v5, v7);
  return v8;
}

- (NSSecurityScopedURLWrapper)wrappedURL
{
  return self->_wrappedURL;
}

- (NSSecureCoding)metadataObject
{
  return self->_metadataObject;
}

- (NSURL)lifecycleManagedURL
{
  return self->_lifecycleManagedURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifecycleManagedURL, 0);
  objc_storeStrong((id *)&self->_metadataObject, 0);
  objc_storeStrong((id *)&self->_wrappedURL, 0);
}

+ (void)getResultWithFileURL:(id)a3 consumingBundleID:(id)a4 resultBlock:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD);
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  WFFileStorageServiceResult *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  WFFileStorageServiceResult *v22;
  void (**v23)(id, _QWORD);
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD))a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFFileStorageServiceResult.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURL"));

  if (!v10)
    goto LABEL_10;
LABEL_3:
  v24 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v12 = getFPIsFileProviderBookmarkSymbolLoc_ptr;
  v28 = getFPIsFileProviderBookmarkSymbolLoc_ptr;
  if (!getFPIsFileProviderBookmarkSymbolLoc_ptr)
  {
    v13 = FileProviderLibrary();
    v12 = dlsym(v13, "FPIsFileProviderBookmark");
    v26[3] = (uint64_t)v12;
    getFPIsFileProviderBookmarkSymbolLoc_ptr = v12;
  }
  _Block_object_dispose(&v25, 8);
  if (v12)
  {
    v14 = ((uint64_t (*)(id, uint64_t *))v12)(v9, &v24);
    if (v24)
    {
      v11[2](v11, 0);
LABEL_15:

      return;
    }
    v15 = v14;
LABEL_11:
    v17 = -[WFFileStorageServiceResult initWithFileURL:metadataObject:]([WFFileStorageServiceResult alloc], "initWithFileURL:metadataObject:", v9, 0);
    if (v15)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __81__WFFileStorageServiceResult_getResultWithFileURL_consumingBundleID_resultBlock___block_invoke;
      v20[3] = &unk_24F8B3B20;
      v21 = v9;
      v23 = v11;
      v22 = v17;
      WFFileStorageServiceResultAllowFPSandboxExtensionToConsumer(v21, v10, v20);

    }
    else
    {
      ((void (*)(void (**)(id, _QWORD), WFFileStorageServiceResult *, _QWORD))v11[2])(v11, v17, 0);
    }

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL _FPIsFileProviderBookmark(CFURLRef, CFErrorRef *)");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("WFFileStorageServiceResult.m"), 19, CFSTR("%s"), dlerror());

  __break(1u);
}

+ (id)resultWithMetadata:(id)a3
{
  id v5;
  WFFileStorageServiceResult *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFFileStorageServiceResult.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadataObject"));

  }
  v6 = -[WFFileStorageServiceResult initWithWrappedURL:metadataObject:]([WFFileStorageServiceResult alloc], "initWithWrappedURL:metadataObject:", 0, v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)possibleMetadataClasses
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[WFStorageServiceRegistry sharedRegistry](WFStorageServiceRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storageServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_map:", &__block_literal_global);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __53__WFFileStorageServiceResult_possibleMetadataClasses__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectRepresentationClass");
}

void __81__WFFileStorageServiceResult_getResultWithFileURL_consumingBundleID_resultBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void (*v6)(void);
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    getWFActionsLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 136315651;
      v8 = "+[WFFileStorageServiceResult getResultWithFileURL:consumingBundleID:resultBlock:]_block_invoke";
      v9 = 2113;
      v10 = v5;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_22D353000, v4, OS_LOG_TYPE_ERROR, "%s Couldn't modify filecoordinationd ACL for sandbox extending %{private}@: %{public}@", (uint8_t *)&v7, 0x20u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v6();

}

@end
