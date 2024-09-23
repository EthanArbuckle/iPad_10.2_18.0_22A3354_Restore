@implementation FINode

- (NSDate)contentModificationDate
{
  return (NSDate *)-[FINode propertyAsDate:](self, "propertyAsDate:", 1836016740);
}

- (NSString)fileName
{
  return (NSString *)-[FINode propertyAsString:](self, "propertyAsString:", 1886282093);
}

- (BOOL)isTopLevelSharedItem
{
  return -[FINode propertyAsBool:](self, "propertyAsBool:", 1936225392);
}

- (FPItem)fpItem
{
  return 0;
}

+ (id)nodeFromNodeRef:(OpaqueNodeRef *)a3
{
  return a3;
}

- (NSString)typeIdentifier
{
  return (NSString *)-[FINode propertyAsString:](self, "propertyAsString:", 1970563428);
}

- (UTType)contentType
{
  void *v2;
  id v3;

  -[FINode propertyAsNSObject:](self, "propertyAsNSObject:", 1970566256);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  static_objc_cast<NSString,objc_object * {__strong}>(v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (!v3)
    v3 = (id)*MEMORY[0x1E0CEC528];
  return (UTType *)v3;
}

- (id)propertyAsNSObject:(unsigned int)a3
{
  return -[FINode propertyAsNSObject:async:options:error:](self, "propertyAsNSObject:async:options:error:", *(_QWORD *)&a3, pthread_main_np() != 0, 0, 0);
}

- (id)propertyAsString:(unsigned int)a3
{
  return -[FINode propertyAsString:async:options:error:](self, "propertyAsString:async:options:error:", *(_QWORD *)&a3, pthread_main_np() != 0, 0, 0);
}

- (id)propertyAsDate:(unsigned int)a3
{
  return -[FINode propertyAsDate:async:options:error:](self, "propertyAsDate:async:options:error:", *(_QWORD *)&a3, pthread_main_np() != 0, 0, 0);
}

- (BOOL)propertyAsBool:(unsigned int)a3
{
  return -[FINode propertyAsBool:async:options:error:](self, "propertyAsBool:async:options:error:", *(_QWORD *)&a3, pthread_main_np() != 0, 0, 0);
}

- (BOOL)isFolder
{
  return -[FINode nodeIsAll:](self, "nodeIsAll:", 0x200000);
}

- (BOOL)isPackage
{
  return -[FINode nodeIsAll:](self, "nodeIsAll:", 128);
}

- (NSArray)itemDecorations
{
  void *v2;
  void *v3;

  -[FINode propertyAsArray:](self, "propertyAsArray:", 1684366194);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  static_objc_cast<NSString,objc_object * {__strong}>(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSURL)fileURL
{
  return 0;
}

- (NSNumber)documentSize
{
  return (NSNumber *)-[FINode propertyAsNumber:async:options:error:](self, "propertyAsNumber:async:options:error:", 1819240307, 1, 0, 0);
}

- (NSString)displayName
{
  return (NSString *)-[FINode propertyAsString:](self, "propertyAsString:", 1684955501);
}

- (FPProviderDomain)fpDomain
{
  return 0;
}

- (NSArray)tags
{
  return (NSArray *)-[FINode fetchTags:](self, "fetchTags:", pthread_main_np() == 0);
}

- (BOOL)isShared
{
  return (-[FINode bladeRunnerFlags](self, "bladeRunnerFlags") & 0x180) != 0;
}

+ (id)fiNodeFromURL:(id)a3
{
  const __CFURL *v3;
  void *v4;
  const TNode *v5;
  CFURLRef v7;
  FINode *v8;

  v3 = (const __CFURL *)a3;
  v7 = v3;
  v8 = 0;
  if (TNode::GetNodeFromURL(&v7, (TNodePtr *)&v8, 0) || !TNodeFromFINode(v8))
  {
    v4 = 0;
  }
  else
  {
    v5 = (const TNode *)TNodeFromFINode(v8);
    FINodeFromTNode(v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)fetchTags:(BOOL)a3
{
  void *v3;
  void *v4;

  -[FINode propertyAsArray:async:options:error:](self, "propertyAsArray:async:options:error:", 1718903156, !a3, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  static_objc_cast<NSString,objc_object * {__strong}>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)propertyAsArray:(unsigned int)a3
{
  return -[FINode propertyAsArray:async:options:error:](self, "propertyAsArray:async:options:error:", *(_QWORD *)&a3, pthread_main_np() != 0, 0, 0);
}

- (unsigned)nodePermissions:(unsigned int)a3
{
  return -[FINode nodePermissions:error:](self, "nodePermissions:error:", *(_QWORD *)&a3, 0);
}

- (unint64_t)hash
{
  return (unint64_t)self >> 4;
}

+ (id)iCloudDefaultContainer
{
  void *v2;
  TString *v3;
  void *v4;
  TString v6;

  if (!ICloudDriveFPFSEnabled())
    return 0;
  iCloudDriveDomainIDForDataSeparated(0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    return 0;
  v3 = v2;
  v6.fString.fRef = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  TString::SetStringRefAsImmutable(&v6, v3);

  DefaultContainerOfDomainWithID(&v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v6.fString.fRef);

  return v4;
}

+ (id)iCloudLibrariesContainer
{
  const TNode *v2;
  void *v3;
  FINode *v5;

  TGlobalNodes::iCloudLibrariesContainerNode(&v5);
  v2 = (const TNode *)TNodeFromFINode(v5);
  FINodeFromTNode(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSNumber)childItemCount
{
  return (NSNumber *)-[FINode propertyAsNumber:async:options:error:](self, "propertyAsNumber:async:options:error:", 1667785588, pthread_main_np() != 0, 4, 0);
}

+ (id)appLibraryNodeForNode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  TString *v7;
  TString *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  TString *v16;
  BOOL v17;
  TString v19;
  TString v20;

  objc_msgSend(a3, "presentationNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_cast<FIDSNode,FINode * {__strong}>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByStandardizingPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (TString *)(id)objc_claimAutoreleasedReturnValue();
  v20.fString.fRef = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  TString::SetStringRefAsImmutable(&v20, v7);

  +[FILocalStorageNode containerNodePathPrefix](FILocalStorageNode, "containerNodePathPrefix");
  v8 = (TString *)(id)objc_claimAutoreleasedReturnValue();
  v19.fString.fRef = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  TString::SetStringRefAsImmutable(&v19, v8);

  v9 = TString::BeginsWith(&v20, &v19);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v19.fString.fRef);

  if (v9)
  {
    +[FILocalAppContainerCollection sharedInstance](FILocalAppContainerCollection, "sharedInstance", v19.fString.fRef, v20.fString.fRef);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isPopulated") & 1) == 0)
      objc_msgSend(v10, "synchronizeWithOptions:async:", 0x1000000, 0);

  }
  else
  {
    iCloudDriveDomainIDForDataSeparated(0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_18;
    +[FIProviderDomain rootURLForProviderDomainID:cachePolicy:error:](FIProviderDomain, "rootURLForProviderDomainID:cachePolicy:error:", v11, 1, 0, v19.fString.fRef, v20.fString.fRef);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {

      goto LABEL_17;
    }
    objc_msgSend(v14, "path");
    v16 = (TString *)(id)objc_claimAutoreleasedReturnValue();
    v19.fString.fRef = &stru_1E8752DF8;
    CFRetain(&stru_1E8752DF8);
    TString::SetStringRefAsImmutable(&v19, v16);

    v17 = TString::BeginsWith(&v20, &v19);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v19.fString.fRef);

    if (!v17)
      goto LABEL_17;
  }
  if (!v4)
  {
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  while (1)
  {
    if (v9)
      objc_cast<FILocalAppContainerNode,FIDSNode * {__strong}>(v4);
    else
      objc_cast<FINode_ICloudAppLibrary,FIDSNode * {__strong}>(v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      break;
    objc_msgSend(v4, "parent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_cast<FIDSNode,FINode * {__strong}>(v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v13;
    if (!v13)
      goto LABEL_17;
  }
LABEL_18:
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v20.fString.fRef);

  return v11;
}

+ (NSString)currentHostAppIdentifier
{
  id v2;
  void *v3;
  id v4;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)sCurrentHostAppIdentifier;
  if (!sCurrentHostAppIdentifier)
  {
    sCurrentHostAppIdentifier = (uint64_t)&stru_1E8752DF8;

    v3 = (void *)sCurrentHostAppIdentifier;
  }
  v4 = v3;
  objc_sync_exit(v2);

  return (NSString *)v4;
}

+ (void)setCurrentHostAppIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  v6 = (void *)sCurrentHostAppIdentifier;
  sCurrentHostAppIdentifier = v5;

  objc_sync_exit(v4);
}

+ (NSSet)protectedAppIdentifiers
{
  id v2;
  id v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (sProtectedAppIdentifiers)
  {
    v3 = (id)sProtectedAppIdentifiers;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_sync_exit(v2);

  return (NSSet *)v4;
}

+ (void)setProtectedAppIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  if ((objc_msgSend((id)sProtectedAppIdentifiers, "isEqual:", v12) & 1) != 0)
  {
    objc_sync_exit(v4);
LABEL_7:

    goto LABEL_8;
  }
  v5 = objc_msgSend(v12, "copy");
  v6 = (void *)sProtectedAppIdentifiers;
  sProtectedAppIdentifiers = v5;

  objc_sync_exit(v4);
  v7 = pthread_main_np();
  +[FILocalAppContainerCollection sharedInstanceCreateIfNeeded:](FILocalAppContainerCollection, "sharedInstanceCreateIfNeeded:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronizeWithOptions:async:", 0x1000000, v7 != 0);

  iCloudDriveDomainIDForDataSeparated(0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[FINode iCloudLibrariesContainer](FINode, "iCloudLibrariesContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "synchronizeWithOptions:async:", 0x1000000, v7 != 0);

  }
  iCloudDriveDomainIDForDataSeparated(1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[FINode dataSeparatedICloudLibrariesContainer](FINode, "dataSeparatedICloudLibrariesContainer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synchronizeWithOptions:async:", 0x1000000, v7 != 0);
    goto LABEL_7;
  }
LABEL_8:

}

- (FINode)initWithCoder:(id)a3
{
  id v4;
  FINode *v5;
  FINode *v6;

  v4 = a3;
  v5 = -[FINode init](self, "init");
  +[FIDSNode _makeWithCoder:](FIDSNode, "_makeWithCoder:", v4);
  v6 = (FINode *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForArchiver
{
  return (Class)objc_opt_class();
}

+ (int)desktopServicesAPIVersion
{
  return 469;
}

+ (void)fiNodeFromItem:(id)a3 inFPv2Domain:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, uint64_t);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  _BYTE buf[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v7 = a4;
  v8 = (void (**)(id, _QWORD, uint64_t))a5;
  if (v7)
  {
    v9 = 0;
LABEL_4:
    +[FIProviderDomain providerDomainForDomain:](FIProviderDomain, "providerDomainForDomain:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isFPv2") & 1) != 0)
    {

      FPItemManagerInstance();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "itemID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3321888768;
      v25[2] = __49__FINode_fiNodeFromItem_inFPv2Domain_completion___block_invoke;
      v25[3] = &__block_descriptor_56_ea8_32c62_ZTSKZ49__FINode_fiNodeFromItem_inFPv2Domain_completion__E3__0_e29_v24__0__NSArray_8__NSError_16l;
      v15 = v24;
      *(_QWORD *)buf = v15;
      v16 = v7;
      *(_QWORD *)&buf[8] = v16;
      v17 = (void *)MEMORY[0x1D17A5A30](v8);
      *(_QWORD *)&buf[16] = v17;
      v18 = v15;
      v26 = v18;
      v19 = v16;
      v27 = v19;
      v28 = (id)MEMORY[0x1D17A5A30](v17);
      objc_msgSend(v13, "fetchParentsForItemID:recursively:completionHandler:", v14, 1, v25);

      v12 = v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -8072, 0);
      v20 = objc_claimAutoreleasedReturnValue();

      LogObj(4);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "+[FINode fiNodeFromItem:inFPv2Domain:completion:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v7;
        _os_log_impl(&dword_1CBC4A000, v21, OS_LOG_TYPE_ERROR, "%s expects an item in an FPv2 domain: %{public}@", buf, 0x16u);
      }

      v8[2](v8, 0, v20);
      v9 = (id)v20;
    }

    goto LABEL_10;
  }
  v10 = (void *)FPProviderDomainClass();
  objc_msgSend(v24, "providerDomainID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v10, "providerDomainWithID:cachePolicy:error:", v11, 1, &v29);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v29;

  if (v7)
    goto LABEL_4;
  LogObj(4);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v24, "providerDomainID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_1CBC4A000, v22, OS_LOG_TYPE_ERROR, "Failed to get provider domain for %@: %@", buf, 0x16u);

  }
  v7 = 0;
  v8[2](v8, 0, (uint64_t)v9);
LABEL_10:

}

void __49__FINode_fiNodeFromItem_inFPv2Domain_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  TString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  FINode *v17;
  uint64_t v18;
  void *v19;
  FINode *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  const TNode *v29;
  NSObject *v30;
  std::__shared_weak_count *v31;
  unint64_t *p_shared_owners;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  TNode *v37;
  BOOL v38;
  id v39;
  FPItem *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  _QWORD *v50;
  void *v51;
  FINode *v52;
  BOOL v53;
  TNodePtr v54;
  FIProviderDomain *v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  __int128 v58;
  FPItem *v59[16];
  _BYTE buf[24];
  _QWORD *v61;
  _QWORD v62[5];
  uint64_t v63;
  uint64_t v64;
  FPItem *v65;
  _BYTE v66[24];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = v6;
  v9 = v7;
  v51 = v8;
  if (v9)
  {
    LogObj(4);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "displayName");
      v11 = (TString *)(id)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v58 = &stru_1E8752DF8;
      CFRetain(&stru_1E8752DF8);
      TString::SetStringRefAsImmutable((TString *)&v58, v11);

      SanitizedStr((TString *)&v58);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_1CBC4A000, v10, OS_LOG_TYPE_ERROR, "Failed to get the parent items for: %{public}@, error: %{public}@", buf, 0x16u);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v58);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v13 = v9;
  }
  else
  {
    v14 = objc_msgSend(v8, "count");
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)&v58 = *(id *)(a1 + 40);
    v50 = v15;
    *((_QWORD *)&v58 + 1) = v50;
    if (v14)
      v16 = 0;
    else
      v16 = *(void **)(a1 + 32);
    v59[0] = (FPItem *)v16;
    +[FINode providerDomainsContainer](FINode, "providerDomainsContainer");
    v17 = (FINode *)objc_claimAutoreleasedReturnValue();
    v18 = TNodeFromFINode(v17);
    -[FINode iteratorWithOptions:](v17, "iteratorWithOptions:", 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "first");
    v20 = (FINode *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      while (1)
      {
        -[FINode fpDomain](v20, "fpDomain", v50);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (!v21)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v3;
        }
        objc_msgSend(*((id *)&v58 + 1), "setObject:forKeyedSubscript:", v22, v20);
        if (!v21)

        v23 = objc_msgSend((id)v58, "isEqual:", v21);
        if ((v23 & 1) != 0)
          break;
        objc_msgSend(v19, "next");
        v24 = objc_claimAutoreleasedReturnValue();

        v20 = (FINode *)v24;
        if (!v24)
          goto LABEL_15;
      }
    }
    else
    {
LABEL_15:
      +[FIProviderDomain providerDomainForDomain:](FIProviderDomain, "providerDomainForDomain:", (_QWORD)v58, v50);
      v55 = (FIProviderDomain *)objc_claimAutoreleasedReturnValue();
      v66[0] = v59[0] == 0;
      std::allocate_shared[abi:ne180100]<TFSInfo,std::allocator<TFSInfo>,FIProviderDomain * {__strong},FPItem * const {__strong}&,BOOL,void>(&v55, v59, v66, &v56);

      TNodePtr::TNodePtr((TNodePtr *)v66, (const TNode *)v18);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      TNode::CreateNode(v25, (uint64_t)&v56, (uint64_t)buf, &v54);
      v26 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v27 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }

      TNodePtr::TNodePtr((TNodePtr *)v66, (const TNode *)v18);
      TNode::StPopulating::StPopulating((TNode::StPopulating *)buf, (const TNodePtr *)v66, 0);

      v53 = 0;
      TChildrenList::AddNewChild(*(TChildrenList **)(v18 + 56), &v54, &v53, &v52);
      if (TNodeFromFINode(v52) && v53)
        TNode::SendNotification((const TNode *)v18, 3, (id *)&v52, 0, 0);
      v29 = (const TNode *)TNodeFromFINode(v52);
      FINodeFromTNode(v29);
      v20 = (FINode *)objc_claimAutoreleasedReturnValue();
      LogObj(4);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v66 = 138543362;
        *(_QWORD *)&v66[4] = v20;
        _os_log_impl(&dword_1CBC4A000, v30, OS_LOG_TYPE_INFO, "Found FPv2 provider from manual lookup %{public}@", v66, 0xCu);
      }

      TNode::StPopulating::~StPopulating((TNode::StPopulating *)buf);
      v31 = v57;
      if (v57)
      {
        p_shared_owners = (unint64_t *)&v57->__shared_owners_;
        do
          v33 = __ldaxr(p_shared_owners);
        while (__stlxr(v33 - 1, p_shared_owners));
        if (!v33)
        {
          ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
          std::__shared_weak_count::__release_weak(v31);
        }
      }
    }

    objc_msgSend(v8, "reverseObjectEnumerator");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "allObjects");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v35, "mutableCopy");

    objc_msgSend(v36, "addObject:", *(_QWORD *)(a1 + 32));
    if (objc_msgSend(v36, "count") == 1)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v13 = 0;
    }
    else if (v20)
    {
      v37 = (TNode *)TNodeFromFINode(v20);
      IDContainerIteratorAdaptor<NSMutableArray<FPItem *>>::NSForwardIterator<NSMutableArray<FPItem *>>::NSForwardIterator((uint64_t)&v58, v36);
      IDContainerIteratorAdaptor<NSMutableArray<FPItem *>>::NSForwardIterator<NSMutableArray<FPItem *>>::NSForwardIterator((uint64_t)buf, (uint64_t)&v58, 1);

      while (1)
      {
        IDContainerIteratorAdaptor<NSMutableArray<FPItem *>>::IDContainerIteratorAdaptor((uint64_t)&v58, -1, v36);
        if (*(_QWORD *)buf == (_QWORD)v58)
        {
          v38 = v65 == v59[14];

          if (v38)
          {
            v13 = 0;
            goto LABEL_50;
          }
        }
        else
        {

        }
        v39 = *(id *)(*(_QWORD *)&buf[16] + 8 * v64);
        static_objc_cast<NSString,objc_object * {__strong}>(v39);
        v40 = (FPItem *)objc_claimAutoreleasedReturnValue();

        TNode::FindFPv2Child(v37, v40, (TNodePtr *)&v58);
        v37 = (TNode *)TNodeFromFINode((FINode *)v58);

        if (!v37)
          break;

        v41 = v64;
        if (v64 >= v63 - 1)
        {
          v42 = objc_msgSend(*(id *)buf, "countByEnumeratingWithState:objects:count:", &buf[8], v62, 4);
          v41 = -1;
          v63 = v42;
          v64 = -1;
        }
        if (v62[4] != *v61)
        {
          objc_enumerationMutation(*(id *)buf);
          v41 = v64;
        }
        v64 = v41 + 1;
        v65 = (FPItem *)((char *)v65 + 1);
      }
      LogObj(4);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        +[FINode fiNodeFromItem:inFPv2Domain:completion:]::$_0::operator() const(NSArray<FPItem *> *,NSError *)::{lambda(NSArray<FPItem *> *,FPItem *)#1}::operator()(v36, v40);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v58) = 138543362;
        *(_QWORD *)((char *)&v58 + 4) = v44;
        _os_log_impl(&dword_1CBC4A000, v43, OS_LOG_TYPE_ERROR, "Failed to find FINodes in FPItem parent chain: '%{public}@'", (uint8_t *)&v58, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -8062, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = 0;
LABEL_50:

      v48 = *(_QWORD *)(a1 + 48);
      FINodeFromTNode(v37);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *))(v48 + 16))(v48, v49, v13);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -8062, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogObj(4);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = *(_QWORD *)(a1 + 40);
        +[FINode fiNodeFromItem:inFPv2Domain:completion:]::$_0::operator() const(NSArray<FPItem *> *,NSError *)::{lambda(NSArray<FPItem *> *,FPItem *)#1}::operator()(v36, *(void **)(a1 + 32));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v46;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v47;
        *(_WORD *)&buf[22] = 2114;
        v61 = v50;
        _os_log_impl(&dword_1CBC4A000, v45, OS_LOG_TYPE_ERROR, "Failed to find FINode for the domain. DS doesn't know about it yet: %{public}@. path: %{public}@, known domains: %{public}@", buf, 0x20u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

+ (id)fiNodeFromItem:(id *)a1 inFPv2Domain:completion:
{

  return a1;
}

+ (id)dataSeparatedICloudLibrariesContainer
{
  const TNode *v2;
  void *v3;
  FINode *v5;

  TGlobalNodes::DataSeparatedICloudLibrariesContainerNode(&v5);
  v2 = (const TNode *)TNodeFromFINode(v5);
  FINodeFromTNode(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)dataSeparatedICloudDefaultContainer
{
  void *v2;
  TString *v3;
  void *v4;
  TString v6;

  if (!ICloudDriveFPFSEnabled())
    return 0;
  iCloudDriveDomainIDForDataSeparated(1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    return 0;
  v3 = v2;
  v6.fString.fRef = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  TString::SetStringRefAsImmutable(&v6, v3);

  DefaultContainerOfDomainWithID(&v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v6.fString.fRef);

  return v4;
}

+ (id)_iCloudDrive
{
  return objc_alloc_init(FIICloudDrive);
}

+ (id)_dataSeparatedICloudDrive
{
  return objc_alloc_init(FIDataSeparatedICloudDrive);
}

+ (id)providerDomainsContainer
{
  const TNode *v2;
  void *v3;
  FINode *v5;

  TGlobalNodes::AllProvidersNode(&v5);
  v2 = (const TNode *)TNodeFromFINode(v5);
  FINodeFromTNode(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDate)creationDate
{
  return (NSDate *)-[FINode propertyAsDate:](self, "propertyAsDate:", 1634952036);
}

- (NSString)itemIdentifier
{
  void *v3;
  id v4;
  void *v5;

  -[FINode propertyAsString:](self, "propertyAsString:", 1868720740);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("0.0")) & 1) != 0)
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s, %p"), object_getClassName(self), self);
  else
    v4 = v3;
  v5 = v4;

  return (NSString *)v5;
}

- (id)fetchLastUsedDate:(BOOL)a3
{
  return -[FINode propertyAsDate:async:options:error:](self, "propertyAsDate:async:options:error:", 1819632756, !a3, 0, 0);
}

- (BOOL)isValid
{
  return 1;
}

- (id)iteratorWithOptions:(unsigned int)a3
{
  abort();
}

- (unint64_t)nodeIs:(unint64_t)a3 error:(id *)a4
{
  if (a4)
  {
    ErrorWithOSStatus(-8058, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (unint64_t)nodeIs:(unint64_t)a3
{
  return -[FINode nodeIs:error:](self, "nodeIs:error:", a3, 0);
}

- (BOOL)nodeIsAll:(unint64_t)a3
{
  return -[FINode nodeIs:](self, "nodeIs:") == a3;
}

- (BOOL)nodeIsAny:(unint64_t)a3
{
  return -[FINode nodeIs:](self, "nodeIs:", a3) != 0;
}

- (unsigned)volumeIs:(unsigned int)a3 error:(id *)a4
{
  if (a4)
  {
    ErrorWithOSStatus(-8058, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (unsigned)volumeIs:(unsigned int)a3
{
  return -[FINode volumeIs:error:](self, "volumeIs:error:", *(_QWORD *)&a3, 0);
}

- (unsigned)nodePermissions:(unsigned int)a3 error:(id *)a4
{
  if (a4)
  {
    ErrorWithOSStatus(-8058, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (NSProgress)copyProgress
{
  return 0;
}

- (NSProgress)downloadProgress
{
  return 0;
}

- (BOOL)isPopulated
{
  return 1;
}

- (id)nodesToObserve
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isSharedByCurrentUser
{
  return (-[FINode bladeRunnerFlags](self, "bladeRunnerFlags") >> 8) & 1;
}

- (BOOL)isTrashed
{
  return -[FINode nodeIsAll:](self, "nodeIsAll:", 0x800000);
}

- (unsigned)bladeRunnerFlags
{
  unsigned int v2;
  void *v3;
  void *v4;

  -[FINode propertyAsNumber:](self, "propertyAsNumber:", 1969385844);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v2 = objc_msgSend(v3, "unsignedIntValue");

  if (v4)
    return v2;
  else
    return 0;
}

- (NSPersonNameComponents)ownerNameComponents
{
  void *v2;
  void *v3;

  -[FINode propertyAsNSObject:](self, "propertyAsNSObject:", 1769171056);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  static_objc_cast<NSString,objc_object * {__strong}>(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPersonNameComponents *)v3;
}

- (NSDate)lastUsedDate
{
  return (NSDate *)-[FINode propertyAsDate:](self, "propertyAsDate:", 1819632756);
}

- (BRContainer)brContainer
{
  return 0;
}

- (FINode)brContainerDocuments
{
  return 0;
}

- (FINode)_uiParent
{
  void *v2;
  void *v3;

  -[FINode fileParent](self, "fileParent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FINode *)v3;
}

- (FINode)fileParent
{
  return 0;
}

- (FIProviderDomain)fiDomain
{
  return 0;
}

- (NSError)enumeratorError
{
  return 0;
}

- (id)propertyAsNumber:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  if (a6)
  {
    ErrorWithOSStatus(-8051, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)propertyAsNumber:(unsigned int)a3
{
  return -[FINode propertyAsNumber:async:options:error:](self, "propertyAsNumber:async:options:error:", *(_QWORD *)&a3, pthread_main_np() != 0, 0, 0);
}

- (id)propertyAsDate:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  if (a6)
  {
    ErrorWithOSStatus(-8051, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)propertyAsString:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  if (a6)
  {
    ErrorWithOSStatus(-8051, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)propertyAsArray:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  if (a6)
  {
    ErrorWithOSStatus(-8051, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)propertyAsNSObject:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  if (a6)
  {
    ErrorWithOSStatus(-8051, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)propertyAsDictionary:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  if (a6)
  {
    ErrorWithOSStatus(-8051, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)propertyAsDictionary:(unsigned int)a3
{
  return -[FINode propertyAsDictionary:async:options:error:](self, "propertyAsDictionary:async:options:error:", *(_QWORD *)&a3, pthread_main_np() != 0, 0, 0);
}

- (BOOL)propertyAsBool:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  if (a6)
  {
    ErrorWithOSStatus(-8051, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)propertyAsBoolean:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v13;

  v13 = 0;
  v7 = -[FINode propertyAsBool:async:options:error:](self, "propertyAsBool:async:options:error:", *(_QWORD *)&a3, a4, *(_QWORD *)&a5, &v13);
  v8 = v13;
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v8);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AAA0];
    if (v7)
      v11 = (void *)MEMORY[0x1E0C9AAB0];
    v10 = v11;
  }

  return v10;
}

- (id)propertyAsData:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  if (a6)
  {
    ErrorWithOSStatus(-8051, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)propertyAsData:(unsigned int)a3
{
  return -[FINode propertyAsData:async:options:error:](self, "propertyAsData:async:options:error:", *(_QWORD *)&a3, pthread_main_np() != 0, 0, 0);
}

- (BOOL)setProperty:(unsigned int)a3 asNumber:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  id v8;
  void *v9;
  int v10;

  v8 = a4;
  v9 = v8;
  if (a7)
  {
    if (v8)
      v10 = -8051;
    else
      v10 = -8072;
    ErrorWithOSStatus(v10, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (BOOL)setProperty:(unsigned int)a3 asNumber:(id)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  LOBYTE(v4) = -[FINode setProperty:asNumber:async:options:error:](self, "setProperty:asNumber:async:options:error:", v4, v6, pthread_main_np() != 0, 0, 0);

  return v4;
}

- (BOOL)setProperty:(unsigned int)a3 asDate:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  if (a7)
  {
    ErrorWithOSStatus(-8051, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)setProperty:(unsigned int)a3 asDate:(id)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  LOBYTE(v4) = -[FINode setProperty:asDate:async:options:error:](self, "setProperty:asDate:async:options:error:", v4, v6, pthread_main_np() != 0, 0, 0);

  return v4;
}

- (BOOL)setProperty:(unsigned int)a3 asString:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  if (a7)
  {
    ErrorWithOSStatus(-8051, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)setProperty:(unsigned int)a3 asString:(id)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  LOBYTE(v4) = -[FINode setProperty:asString:async:options:error:](self, "setProperty:asString:async:options:error:", v4, v6, pthread_main_np() != 0, 0, 0);

  return v4;
}

- (BOOL)setProperty:(unsigned int)a3 asArray:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  if (a7)
  {
    ErrorWithOSStatus(-8051, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)setProperty:(unsigned int)a3 asArray:(id)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  LOBYTE(v4) = -[FINode setProperty:asArray:async:options:error:](self, "setProperty:asArray:async:options:error:", v4, v6, pthread_main_np() != 0, 0, 0);

  return v4;
}

- (BOOL)setProperty:(unsigned int)a3 asDictionary:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  if (a7)
  {
    ErrorWithOSStatus(-8051, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)setProperty:(unsigned int)a3 asDictionary:(id)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  LOBYTE(v4) = -[FINode setProperty:asDictionary:async:options:error:](self, "setProperty:asDictionary:async:options:error:", v4, v6, pthread_main_np() != 0, 0, 0);

  return v4;
}

- (BOOL)setProperty:(unsigned int)a3 asBool:(BOOL)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  if (a7)
  {
    ErrorWithOSStatus(-8051, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)setProperty:(unsigned int)a3 asBool:(BOOL)a4
{
  return -[FINode setProperty:asBool:async:options:error:](self, "setProperty:asBool:async:options:error:", *(_QWORD *)&a3, a4, pthread_main_np() != 0, 0, 0);
}

- (BOOL)setProperty:(unsigned int)a3 asData:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  id v8;
  void *v9;
  int v10;

  v8 = a4;
  v9 = v8;
  if (a7)
  {
    if (v8)
      v10 = -8051;
    else
      v10 = -8072;
    ErrorWithOSStatus(v10, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (BOOL)setProperty:(unsigned int)a3 asData:(id)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  LOBYTE(v4) = -[FINode setProperty:asData:async:options:error:](self, "setProperty:asData:async:options:error:", v4, v6, pthread_main_np() != 0, 0, 0);

  return v4;
}

- (BOOL)isContainer
{
  return -[FINode nodeIsAll:](self, "nodeIsAll:", 2);
}

- (BOOL)isVisible
{
  return -[FINode nodeIsAll:](self, "nodeIsAll:", 8);
}

+ (id)sizeFolder:(id)a3
{
  objc_msgSend(a1, "sizeFolder:forCopyInto:withDelegate:", a3, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sizeFolder:(id)a3 forCopyInto:(id)a4 withDelegate:(id)a5
{
  const __CFURL *v7;
  const __CFURL *v8;
  id v9;
  int v10;
  FIFolderSize *v11;
  FIFolderSize *v12;
  uint64_t v13;
  NSError *error;
  __int128 v16;
  uint64_t (*v17)(void *);
  int v18;
  int64_t v19;
  int64_t v20;
  int64_t v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  int64_t v25;
  _QWORD v26[3];

  v7 = (const __CFURL *)a3;
  v8 = (const __CFURL *)a4;
  v9 = a5;
  bzero(v26, 0x18uLL);
  v26[1] = 0;
  v26[2] = 0;
  v26[0] = v9;
  v18 = 0;
  v16 = xmmword_1E8751970;
  v17 = FINodeSizingCancelProc;
  v10 = _NodeSizingV2(v7, v8, (uint64_t)&v16, (uint64_t)v26, (uint64_t)&v18);
  v11 = objc_alloc_init(FIFolderSize);
  v12 = v11;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v10, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    error = v12->_error;
    v12->_error = (NSError *)v13;

  }
  else
  {
    v11->_totalItems = v19;
    v11->_userVisibleItems = v20;
    v11->_logicalBytes = v21;
    v11->_compressionAdjustedLogicalBytes = v22;
    v11->_physicalBytes = v23;
    v11->_skippedItemCount = v24;
    v11->_folderCount = v25;
  }

  return v12;
}

- (BOOL)requiresForcedSyncing
{
  return !-[FINode nodeIsAll:](self, "nodeIsAll:", 0x8000000) && -[FINode volumeIs:](self, "volumeIs:", 128) == 0;
}

- (FINode)presentationNode
{
  FINode *v3;

  +[FIPresentationNodeMap presentationNodeForKeyNode:](FIPresentationNodeMap, "presentationNodeForKeyNode:", self);
  v3 = (FINode *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = self;
  return v3;
}

- (BOOL)markAsUsed:(id *)a3
{
  if (a3)
  {
    ErrorWithOSStatus(-8058, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void)synchronize
{
  -[FINode synchronizeWithOptions:async:](self, "synchronizeWithOptions:async:", 0, pthread_main_np() != 0);
}

- (id)shortDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FINode;
  -[FINode description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_allInstances
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)_allRootInstances
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_debugChildren
{
  return 0;
}

+ (id)fiNodeFromItem:inFPv2Domain:completion:
{
  id v3;
  id v4;
  id v5;
  const __CFAllocator *v6;
  id v7;
  TString *v8;
  __CFString *fRef;
  __CFString *MutableCopy;
  __CFString *v11;
  __CFString *v12;
  TString *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v18;
  void *v19;
  TString v20;
  CFStringRef theString;
  id v22[17];
  id obj;
  _QWORD v24[8];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t v27;
  char *v28;
  TString v29;
  TString v30;
  TString v31;
  TString v32;
  TString v33;

  v3 = a1;
  v4 = a2;
  TString::TString(&v20, "/", 1uLL);
  IDContainerIteratorAdaptor<NSArray<FPItem *>>::NSForwardIterator<NSArray<FPItem *>>::NSForwardIterator((uint64_t)&obj, v3);
  v18 = v4;
  v19 = v3;
  IDContainerIteratorAdaptor<NSArray<FPItem *>>::IDContainerIteratorAdaptor((uint64_t)v22, -1, v3);
  v5 = v4;
  theString = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  while (obj != v22[0] || v28 != v22[16])
  {
    v7 = *(id *)(v24[1] + 8 * v27);
    if (objc_msgSend(v7, "isEqualToItem:", v5, v18, v19))
    {
      TString::TString(&v32, "<<< '", 5uLL);
      objc_msgSend(v7, "displayName");
      v8 = (TString *)(id)objc_claimAutoreleasedReturnValue();
      v31.fString.fRef = &stru_1E8752DF8;
      CFRetain(&stru_1E8752DF8);
      TString::SetStringRefAsImmutable(&v31, v8);

      fRef = v32.fString.fRef;
      v33.fString.fRef = &stru_1E8752DF8;
      CFRetain(&stru_1E8752DF8);
      MutableCopy = CFStringCreateMutableCopy(v6, 0, fRef);
      CFRelease(&stru_1E8752DF8);
      v33.fString.fRef = MutableCopy;
      TString::Append(&v33, &v31);
      TString::TString(&v30, "' >>>", 5uLL);
      v11 = v33.fString.fRef;
      v29.fString.fRef = &stru_1E8752DF8;
      CFRetain(&stru_1E8752DF8);
      v12 = CFStringCreateMutableCopy(v6, 0, v11);
      CFRelease(&stru_1E8752DF8);
      v29.fString.fRef = v12;
      TString::Append(&v29, &v30);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v30.fString.fRef);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v33.fString.fRef);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v31.fString.fRef);

      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v32.fString.fRef);
    }
    else
    {
      objc_msgSend(v7, "displayName");
      v13 = (TString *)(id)objc_claimAutoreleasedReturnValue();
      v29.fString.fRef = &stru_1E8752DF8;
      CFRetain(&stru_1E8752DF8);
      TString::SetStringRefAsImmutable(&v29, v13);

    }
    if (CFStringGetLength(theString) && CFStringGetLength(v29.fString.fRef))
      TString::Append((TString *)&theString, &v20);
    TString::Append((TString *)&theString, &v29);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v29.fString.fRef);
    v14 = v27;
    if (v27 >= v26 - 1)
    {
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v24, v25, 4);
      v14 = -1;
      v26 = v15;
      v27 = -1;
    }
    if (v25[4] != *(_QWORD *)v24[2])
    {
      objc_enumerationMutation(obj);
      v14 = v27;
    }
    v27 = v14 + 1;
    ++v28;
  }

  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v20.fString.fRef);
  SanitizedPath((TString *)&theString);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&theString);

  return v16;
}

@end
