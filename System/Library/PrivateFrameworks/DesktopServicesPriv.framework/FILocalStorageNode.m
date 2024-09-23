@implementation FILocalStorageNode

+ (id)currentSharedInstance
{
  void *v2;
  id v3;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  v3 = (id)sLocalStorageNode;
  objc_sync_exit(v2);

  return v3;
}

+ (id)sharedInstanceWithDisplayName:(id)a3 domain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  v9 = (void *)sLocalStorageNode;
  if (sLocalStorageNode)
  {
LABEL_2:
    v10 = v9;
    goto LABEL_15;
  }
  objc_msgSend(v7, "storageURLs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[FINode fiNodeFromURL:](FINode, "fiNodeFromURL:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = objc_msgSend(objc_alloc((Class)a1), "initWithStorageNode:domain:", v13, v7);
      v15 = (void *)sLocalStorageNode;
      sLocalStorageNode = v14;

      LogObj(7);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v20 = 138543362;
        v21 = v6;
        _os_log_impl(&dword_1CBC4A000, v16, OS_LOG_TYPE_DEBUG, "Creating FILocalStorageNode - %{public}@", (uint8_t *)&v20, 0xCu);
      }

      if ((objc_msgSend((id)sLocalStorageNode, "setProperty:asString:async:options:error:", 1886282093, v6, 0, 0x10000000, 0) & 1) == 0)
      {
        LogObj(5);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_1CBC4A000, v17, OS_LOG_TYPE_ERROR, "LocalStorage node name not set", (uint8_t *)&v20, 2u);
        }

      }
      v9 = (void *)sLocalStorageNode;
      goto LABEL_2;
    }
  }
  LogObj(7);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v20 = 138543362;
    v21 = v7;
    _os_log_impl(&dword_1CBC4A000, v18, OS_LOG_TYPE_ERROR, "Unable to load local storage root storageURL from domain %{public}@", (uint8_t *)&v20, 0xCu);
  }

  v10 = 0;
LABEL_15:
  objc_sync_exit(v8);

  return v10;
}

+ (NSString)containerNodePathPrefix
{
  return (NSString *)CFSTR("/var/mobile/Containers/Data/Application/");
}

- (FILocalStorageNode)initWithStorageNode:(id)a3 domain:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  FILocalStorageNode *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v15[0] = v7;
  +[FILocalAppContainerCollection sharedInstance](FILocalAppContainerCollection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)FILocalStorageNode;
  v11 = -[FICompoundNode initWithFINodes:](&v14, sel_initWithFINodes_, v10);

  objc_storeStrong((id *)&v11->_storageNode, a3);
  objc_storeStrong((id *)&v11->_providerDomain, a4);
  +[FIPresentationNodeMap shared](FIPresentationNodeMap, "shared");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerPresentationNode:forNode:", v11, v7);

  -[FILocalStorageNode fetchFPItemIfNeeded](v11, "fetchFPItemIfNeeded");
  return v11;
}

+ (id)makeWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FI Display Name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  static_objc_cast<NSString,objc_object * {__strong}>(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FI Domain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  static_objc_cast<NSString,objc_object * {__strong}>(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[FILocalStorageNode sharedInstanceWithDisplayName:domain:](FILocalStorageNode, "sharedInstanceWithDisplayName:domain:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)FILocalStorageNode;
  -[FIDSNode encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[FINode displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("FI Display Name"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_providerDomain, CFSTR("FI Domain"));
}

- (void)fetchFPItemIfNeeded
{
  void *v3;
  void *v4;
  FPProviderDomain *providerDomain;
  FILocalStorageNode *v6;
  _QWORD v7[4];
  FILocalStorageNode *v8;

  -[FILocalStorageNode fpItem](self, "fpItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend((id)objc_opt_class(), "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    providerDomain = self->_providerDomain;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3321888768;
    v7[2] = __41__FILocalStorageNode_fetchFPItemIfNeeded__block_invoke;
    v7[3] = &__block_descriptor_40_ea8_32c54_ZTSKZ41__FILocalStorageNode_fetchFPItemIfNeeded_E3__0_e28_v24__0__FPItem_8__NSError_16l;
    v6 = self;
    v8 = v6;
    objc_msgSend(v4, "fetchRootItemForProviderDomain:completionHandler:", providerDomain, v7);

  }
}

void __41__FILocalStorageNode_fetchFPItemIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v6;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setFpItem:", v7);
  }
  else
  {
    LogObj(7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1CBC4A000, v9, OS_LOG_TYPE_ERROR, "Unable to get root item for local storage %{public}@", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)setFpItem:(id)a3
{
  FPItem *v4;
  FPItem *fpItem;
  FILocalStorageNode *obj;

  v4 = (FPItem *)a3;
  obj = self;
  objc_sync_enter(obj);
  fpItem = obj->_fpItem;
  obj->_fpItem = v4;

  objc_sync_exit(obj);
}

- (id)fpItem
{
  FILocalStorageNode *v2;
  FPItem *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_fpItem;
  objc_sync_exit(v2);

  return v3;
}

- (id)fileURL
{
  return -[FINode fileURL](self->_storageNode, "fileURL");
}

- (void)synchronizeWithOptions:(unsigned int)a3 async:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  objc_super v7;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  -[FILocalStorageNode fetchFPItemIfNeeded](self, "fetchFPItemIfNeeded");
  v7.receiver = self;
  v7.super_class = (Class)FILocalStorageNode;
  -[FIDSNode synchronizeWithOptions:async:](&v7, sel_synchronizeWithOptions_async_, v5, v4);
}

- (id)propertyAsDate:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return -[FINode propertyAsDate:async:options:error:](self->_storageNode, "propertyAsDate:async:options:error:", *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6);
}

- (FINode)storageNode
{
  return self->_storageNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageNode, 0);
  objc_storeStrong((id *)&self->_providerDomain, 0);
  objc_storeStrong((id *)&self->_fpItem, 0);
}

@end
