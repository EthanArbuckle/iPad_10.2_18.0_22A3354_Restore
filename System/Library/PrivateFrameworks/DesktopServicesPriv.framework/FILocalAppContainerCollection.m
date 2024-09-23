@implementation FILocalAppContainerCollection

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(*((id *)self + 14), "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)FILocalAppContainerCollection;
  -[FICustomNode dealloc](&v3, sel_dealloc);
}

- (FILocalAppContainerCollection)init
{
  FILocalAppContainerCollection *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FILocalAppContainerCollection;
  v2 = -[FICustomNode init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = (void *)*((_QWORD *)v2 + 15);
    *((_QWORD *)v2 + 15) = v3;

    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = (void *)*((_QWORD *)v2 + 16);
    *((_QWORD *)v2 + 16) = v5;

    TNode::SetInitialPopulationDeferred((TNode *)-[FIDSNode asTNode](v2, "asTNode"));
    objc_msgSend((id)objc_opt_class(), "sharedRegistry");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v2 + 14);
    *((_QWORD *)v2 + 14) = v7;

  }
  return v2;
}

- (id)_uiParent
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

- (id)fileParent
{
  void *v2;
  void *v3;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  objc_msgSend((id)sLocalStorageNode, "storageNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

+ (id)sharedInstance
{
  return (id)objc_msgSend(a1, "sharedInstanceCreateIfNeeded:", 1);
}

+ (id)sharedInstanceCreateIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  unsigned __int8 v4;
  void *v5;
  FILocalAppContainerCollection *v6;
  void *v7;
  id v8;
  TDSMutex *v10;
  char v11;

  v3 = a3;
  if ((v4 & 1) == 0
  {
    TDSMutex::TDSMutex(&+[FILocalAppContainerCollection sharedInstanceCreateIfNeeded:]::sLock, 0);
  }
  v10 = &+[FILocalAppContainerCollection sharedInstanceCreateIfNeeded:]::sLock;
  v11 = 1;
  TDSMutex::lock(&+[FILocalAppContainerCollection sharedInstanceCreateIfNeeded:]::sLock);
  v5 = (void *)+[FILocalAppContainerCollection sharedInstanceCreateIfNeeded:]::sSingleton;
  if (v3 && !+[FILocalAppContainerCollection sharedInstanceCreateIfNeeded:]::sSingleton)
  {
    v6 = objc_alloc_init(FILocalAppContainerCollection);
    v7 = (void *)+[FILocalAppContainerCollection sharedInstanceCreateIfNeeded:]::sSingleton;
    +[FILocalAppContainerCollection sharedInstanceCreateIfNeeded:]::sSingleton = (uint64_t)v6;

    v5 = (void *)+[FILocalAppContainerCollection sharedInstanceCreateIfNeeded:]::sSingleton;
  }
  v8 = v5;
  std::unique_lock<TDSMutex>::~unique_lock[abi:ne180100]((uint64_t)&v10);
  return v8;
}

+ (id)appContainerForDocumentsNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "sharedInstanceCreateIfNeeded:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appContainerForDocumentsNode:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)appContainerForDocumentsNode:(id)a3
{
  id v4;
  std::mutex *v5;
  void *v6;

  v4 = a3;
  v5 = (std::mutex *)((char *)self + 144);
  std::mutex::lock((std::mutex *)((char *)self + 144));
  -[FILocalAppContainerCollection _appContainerForDocumentsNode:](self, "_appContainerForDocumentsNode:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  std::mutex::unlock(v5);

  return v6;
}

- (id)_appContainerForDocumentsNode:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  NSObject *v9;
  unsigned __int8 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[8];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = atomic_load((unsigned __int8 *)self + 97);
    if ((v7 & 1) == 0)
    {
      v8 = atomic_load((unsigned __int8 *)self + 96);
      if ((v8 & 1) != 0)
      {
        do
        {
          LogObj(7);
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CBC4A000, v9, OS_LOG_TYPE_DEBUG, "AppContainerCollection waiting for population to complete", buf, 2u);
          }

          v10 = atomic_load((unsigned __int8 *)self + 96);
        }
        while ((v10 & 1) != 0);
      }
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = *((id *)self + 15);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v28;
LABEL_10:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v14);
        objc_msgSend(v15, "documentsNode");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v17 = v16 == v4;

        if (v17)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
          if (v12)
            goto LABEL_10;
          goto LABEL_16;
        }
      }
    }
    else
    {
LABEL_16:

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = *((id *)self + 16);
      v6 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      if (!v6)
      {
LABEL_26:

        goto LABEL_27;
      }
      v18 = *(_QWORD *)v24;
LABEL_18:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v19);
        objc_msgSend(v15, "documentsNode", (_QWORD)v23);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v21 = v20 == v4;

        if (v21)
          break;
        if (v6 == (id)++v19)
        {
          v6 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
          if (v6)
            goto LABEL_18;
          goto LABEL_26;
        }
      }
    }
    v6 = v15;
    goto LABEL_26;
  }
  v6 = 0;
LABEL_27:

  return v6;
}

- (BOOL)populate
{
  unsigned __int8 *v3;
  unsigned __int8 v4;
  NSObject *v5;
  unsigned __int8 v6;
  OpaqueNodeRef *v7;
  OpaqueNodeRef *v8;
  const TNode *v9;
  uint64_t v10;
  void *v11;
  TString *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  id v22;
  id v23;
  char v24;
  BOOL v25;
  int v26;
  int v27;
  FILocalAppContainerNode *v28;
  FILocalAppContainerNode *v29;
  TNode *v30;
  OpaqueNodeRef *v31;
  const TNode *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  NSObject *v38;
  void *v39;
  int v41;
  id v42;
  id obj;
  uint64_t v44;
  FILocalAppContainerCollection *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  __int16 v52;
  id v53;
  _BYTE v54[24];
  FILocalAppContainerCollection *v55;
  FINode *v56;
  __int128 v57;
  FILocalAppContainerCollection *v58;
  uint64_t v59;
  __int128 v60;
  TNodePtr v61;
  _QWORD v62[3];
  id v63[17];
  TNodePtr v64;
  char *v65;
  CFStringRef theString;
  uint8_t v67[128];
  _BYTE buf[12];
  uint64_t v69;
  _QWORD *v70;
  _QWORD v71[5];
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v3 = (unsigned __int8 *)self + 96;
  do
    v4 = __ldaxr(v3);
  while (__stlxr(1u, v3));
  if ((v4 & 1) == 0)
  {
    LogObj(7);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CBC4A000, v5, OS_LOG_TYPE_INFO, "AppCollection sync started", buf, 2u);
    }

    memset(v62, 0, sizeof(v62));
    v6 = atomic_load((unsigned __int8 *)self + 97);
    v7 = -[FINode nodeRef](self, "nodeRef");
    v9 = (const TNode *)TNode::NodeFromNodeRef((TNode *)v7, v8);
    TNodePtr::TNodePtr(&v61, v9);
    v41 = v6 & 1;
    v45 = self;
    v55 = v45;
    v56 = v61.fFINode;
    LOBYTE(v57) = !(v6 & 1);
    *((_QWORD *)&v57 + 1) = v62;
    v58 = v45;
    TNodePtr::TNodePtr(&v59, (id *)&v56);
    v60 = v57;

    if ((v6 & 1) == 0)
    {
      buf[0] = 0;
      v10 = TNodeFromFINode(v61.fFINode);
      TNode::HandleSyncStarted(v10, 0x800000, buf);
    }
    TNode::StPopulating::StPopulating((TNode::StPopulating *)v54, &v61, 0);
    v52 = 0;
    v53 = 0;
    objc_msgSend(*((id *)v45 + 14), "listOfMonitoredApps");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    TContainerFetcher::FetchContainersAndDocumentsFolders((TContainerFetcher *)&v52, v11, (uint64_t)&v50);

    v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    +[FINode protectedAppIdentifiers](FINode, "protectedAppIdentifiers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    +[FINode currentHostAppIdentifier](FINode, "currentHostAppIdentifier");
    v12 = (TString *)(id)objc_claimAutoreleasedReturnValue();
    theString = &stru_1E8752DF8;
    CFRetain(&stru_1E8752DF8);
    TString::SetStringRefAsImmutable((TString *)&theString, v12);

    std::mutex::lock((std::mutex *)((char *)v45 + 144));
    objc_storeStrong((id *)v45 + 17, obj);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", *((_QWORD *)v45 + 15));
    objc_msgSend(v13, "unionSet:", *((_QWORD *)v45 + 16));
    v14 = v50;
    v44 = v51;
    while (v14 != v44)
    {
      v15 = *(id *)(v14 + 8);
      IDContainerIteratorAdaptor<NSMutableSet<FILocalAppContainerNode *>>::NSForwardIterator<NSMutableSet<FILocalAppContainerNode *>>::NSForwardIterator((uint64_t)buf, v13);
      IDContainerIteratorAdaptor<NSMutableSet<FILocalAppContainerNode *>>::IDContainerIteratorAdaptor((uint64_t)&v64, -1, v13);
      while (*(FINode **)buf != v64.fFINode || v74 != v65)
      {
        v16 = *(id *)(v69 + 8 * v73);
        objc_msgSend(v16, "documentsNode");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = v17 == v15;

        if (v18)
          break;
        v19 = v73;
        if (v73 >= v72 - 1)
        {
          v20 = objc_msgSend(*(id *)buf, "countByEnumeratingWithState:objects:count:", &buf[8], v71, 4);
          v19 = -1;
          v72 = v20;
          v73 = -1;
        }
        if (v71[4] != *v70)
        {
          objc_enumerationMutation(*(id *)buf);
          v19 = v73;
        }
        v73 = v19 + 1;
        ++v74;
      }
      IDContainerIteratorAdaptor<NSMutableSet<FILocalAppContainerNode *>>::NSForwardIterator<NSMutableSet<FILocalAppContainerNode *>>::NSForwardIterator((uint64_t)v63, (uint64_t)buf);

      IDContainerIteratorAdaptor<NSMutableSet<FILocalAppContainerNode *>>::IDContainerIteratorAdaptor((uint64_t)buf, -1, v13);
      if (v63[0] == *(id *)buf)
      {
        v21 = v63[16] == v74;

        if (v21)
        {

          v22 = 0;
          goto LABEL_23;
        }
      }
      else
      {

      }
      v22 = *((id *)v63[2] + (uint64_t)v63[15]);

LABEL_23:
      if (*(_BYTE *)(v14 + 40))
      {
        v23 = *(id *)(v14 + 16);
        v24 = objc_msgSend(obj, "containsObject:", v23);

        if ((v24 & 1) != 0)
        {
          v25 = 0;
LABEL_28:
          *(_BYTE *)(v14 + 40) = v25;
        }
      }
      else if (CFStringGetLength(theString))
      {
        v25 = CFEqual(theString, *(CFTypeRef *)(v14 + 16)) != 0;
        goto LABEL_28;
      }
      if (v22)
      {
        v26 = objc_msgSend(*((id *)v45 + 16), "containsObject:", v22);
        v27 = v26;
        if (*(_BYTE *)(v14 + 40))
        {
          objc_msgSend(v13, "removeObject:", v22);
          objc_msgSend(v42, "addObject:", v22);
          if (v27)
          {
            objc_msgSend(*((id *)v45 + 16), "removeObject:", v22);
            TNodePtr::TNodePtr(&v64, (const TNode *)objc_msgSend(v22, "asTNode"));
            TNodeEvent::CreateNodeEvent(3, (id *)&v64.fFINode, 0, buf);
            TNodeEventPtrs::AddEvent((TNodeEventPtrs *)v62, &v61, (id *)buf);
            TNodeEventPtr::~TNodeEventPtr((id *)buf);

          }
        }
        else if (v26)
        {
          objc_msgSend(v13, "removeObject:", v22);
        }
        else
        {
          objc_msgSend(*((id *)v45 + 16), "addObject:", v22);
        }
      }
      else
      {
        v28 = -[FILocalAppContainerNode initWithAppContainerInfo:]([FILocalAppContainerNode alloc], "initWithAppContainerInfo:", v14);
        v29 = v28;
        if (v28)
        {
          if (*(_BYTE *)(v14 + 40))
          {
            v30 = -[FINode nodeRef](v28, "nodeRef");
            v32 = (const TNode *)TNode::NodeFromNodeRef(v30, v31);
            TNodePtr::TNodePtr((TNodePtr *)buf, v32);
            objc_msgSend(v42, "addObject:", v29);
            TNodeEvent::CreateNodeEvent(3, (id *)buf, 0, &v64);
            TNodeEventPtrs::AddEvent((TNodeEventPtrs *)v62, &v61, (id *)&v64.fFINode);
            TNodeEventPtr::~TNodeEventPtr((id *)&v64.fFINode);

          }
          else
          {
            objc_msgSend(*((id *)v45 + 16), "addObject:", v28);
          }
        }

      }
      v14 += 48;
    }
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v33 = v13;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v67, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v47 != v35)
            objc_enumerationMutation(v33);
          v37 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          TNodePtr::TNodePtr(&v64, (const TNode *)objc_msgSend(v37, "asTNode"));
          TNodeEvent::CreateNodeEvent(4, (id *)&v64.fFINode, 0, buf);
          TNodeEventPtrs::AddEvent((TNodeEventPtrs *)v62, &v61, (id *)buf);
          TNodeEventPtr::~TNodeEventPtr((id *)buf);

          LogObj(7);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v37, "displayName");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v39;
            _os_log_impl(&dword_1CBC4A000, v38, OS_LOG_TYPE_DEBUG, "Local storage node removed %@", buf, 0xCu);

          }
        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v67, 16);
      }
      while (v34);
    }

    objc_storeStrong((id *)v45 + 15, v42);
    if (v41)
    {
      TNodeEvent::CreateNodeEvent(20, (id *)&v61.fFINode, 0, buf);
      TNodeEventPtrs::AddEvent((TNodeEventPtrs *)v62, &v61, (id *)buf);
      TNodeEventPtr::~TNodeEventPtr((id *)buf);
    }

    std::mutex::unlock((std::mutex *)((char *)v45 + 144));
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&theString);

    *(_QWORD *)buf = &v50;
    std::vector<TAppContainerInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

    TNode::StPopulating::~StPopulating((TNode::StPopulating *)v54);
    StDefer<-[FILocalAppContainerCollection populate]::$_1,(void *)0>::~StDefer((id *)&v58);

    *(_QWORD *)buf = v62;
    std::vector<std::pair<TNodePtr,TNodeEventPtr>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
  return (v4 & 1) == 0;
}

- (id)populate
{
  NSObject *v2;
  uint64_t v3;
  uint8_t v5[16];

  LogObj(7);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CBC4A000, v2, OS_LOG_TYPE_INFO, "AppCollection sync finished", v5, 2u);
  }

  atomic_store(1u, (unsigned __int8 *)*a1 + 97);
  atomic_store(0, (unsigned __int8 *)*a1 + 96);
  if (*((_BYTE *)a1 + 16))
  {
    objc_msgSend(*((id *)*a1 + 14), "setDelegate:");
    v3 = TNodeFromFINode((FINode *)a1[1]);
    TNode::HandleSyncCompleted(v3, 0x800000);
  }
  else
  {
    TNodeEventPtrs::SendNotifications((id **)a1[3]);
  }

  return a1;
}

- (BOOL)isPopulated
{
  return TNode::IsPopulated((TNode *)-[FIDSNode asTNode](self, "asTNode"));
}

- (id)iteratorWithOptions:(unsigned int)a3
{
  uint64_t v3;
  BOOL v5;
  int v6;
  _BOOL8 v8;
  FILocalAppContainerCollection *v9;
  void *v10;
  FIChildrenIterator *v11;

  v3 = *(_QWORD *)&a3;
  v5 = -[FILocalAppContainerCollection isPopulated](self, "isPopulated");
  if ((~(_DWORD)v3 & 0x1040000) != 0 || !v5)
  {
    v6 = pthread_main_np();
    v8 = (v3 & 0x40000) == 0 && v6 != 0;
    -[FILocalAppContainerCollection synchronizeWithOptions:async:](self, "synchronizeWithOptions:async:", v3, v8);
  }
  v9 = self;
  std::mutex::lock((std::mutex *)((char *)v9 + 144));
  v10 = (void *)objc_msgSend(*((id *)v9 + 15), "copy");
  std::mutex::unlock((std::mutex *)((char *)v9 + 144));

  v11 = -[FIChildrenIterator initWithChildren:fullyPopulated:options:]([FIChildrenIterator alloc], "initWithChildren:fullyPopulated:options:", v10, -[FILocalAppContainerCollection isPopulated](v9, "isPopulated"), v3);
  return v11;
}

- (id)nodesForSizing
{
  std::mutex *v3;
  void *v4;

  v3 = (std::mutex *)((char *)self + 144);
  std::mutex::lock((std::mutex *)((char *)self + 144));
  v4 = (void *)objc_msgSend(*((id *)self + 15), "copy");
  std::mutex::unlock(v3);
  return v4;
}

- (void)synchronizeWithOptions:(unsigned int)a3 async:(BOOL)a4
{
  unsigned __int8 v6;
  NSObject *v7;
  _BOOL4 v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  FILocalAppContainerCollection *v12;
  unsigned __int8 *v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  FILocalAppContainerCollection *v18;
  unsigned int v19;
  uint8_t buf[8];
  std::__shared_weak_count *v21;

  if (a4)
  {
    v6 = atomic_load((unsigned __int8 *)self + 96);
    LogObj(7);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if ((v6 & 1) != 0)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CBC4A000, v7, OS_LOG_TYPE_DEBUG, "AppCollection sync ignored while still populating", buf, 2u);
      }
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CBC4A000, v7, OS_LOG_TYPE_DEBUG, "AppCollection sync queued", buf, 2u);
      }

      TNode::GetVolumeInfo((TNode *)-[FIDSNode asTNode](self, "asTNode"), buf);
      TFSVolumeInfo::GetSynchingGCDQueue(*(TFSVolumeInfo **)buf);
      v7 = objc_claimAutoreleasedReturnValue();
      v9 = v21;
      if (v21)
      {
        p_shared_owners = (unint64_t *)&v21->__shared_owners_;
        do
          v11 = __ldaxr(p_shared_owners);
        while (__stlxr(v11 - 1, p_shared_owners));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3321888768;
      v17[2] = __62__FILocalAppContainerCollection_synchronizeWithOptions_async___block_invoke;
      v17[3] = &__block_descriptor_48_ea8_32c75_ZTSKZ62__FILocalAppContainerCollection_synchronizeWithOptions_async__E3__4_e5_v8__0l;
      v12 = self;
      v18 = v12;
      v19 = a3;
      dispatch_async(v7, v17);

    }
  }
  else if (!-[FILocalAppContainerCollection populate](self, "populate", *(_QWORD *)&a3))
  {
    v13 = (unsigned __int8 *)self + 96;
    do
    {
      while (__ldxr(v13))
        __clrex();
    }
    while (__stlxr(1u, v13));
    std::mutex::lock((std::mutex *)((char *)self + 144));
    v15 = (void *)*((_QWORD *)self + 17);
    +[FINode protectedAppIdentifiers](FINode, "protectedAppIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = objc_msgSend(v15, "isEqual:", v16);

    std::mutex::unlock((std::mutex *)((char *)self + 144));
    atomic_store(0, v13);
    if ((v15 & 1) == 0)
      -[FILocalAppContainerCollection populate](self, "populate");
  }
}

uint64_t __62__FILocalAppContainerCollection_synchronizeWithOptions_async___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "synchronizeWithOptions:async:", *(unsigned int *)(a1 + 40), 0);
}

- (void)appRegistry:(id)a3 didUpdateApps:(id)a4
{
  -[FILocalAppContainerCollection synchronizeWithOptions:async:](self, "synchronizeWithOptions:async:", 0x40000, 1);
}

- (void)appRegistry:(id)a3 didRemoveAppsWithBundleIDs:(id)a4
{
  -[FILocalAppContainerCollection synchronizeWithOptions:async:](self, "synchronizeWithOptions:async:", 0x40000, 1);
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 144));
  objc_storeStrong((id *)self + 17, 0);
  objc_storeStrong((id *)self + 16, 0);
  objc_storeStrong((id *)self + 15, 0);
  objc_storeStrong((id *)self + 14, 0);

}

- (id).cxx_construct
{
  *((_BYTE *)self + 96) = 0;
  *((_BYTE *)self + 97) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 18) = 850045863;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *((_QWORD *)self + 25) = 0;
  return self;
}

@end
