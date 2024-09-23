@implementation FIDSNode

- (void)asTNode
{
  return &self->_node;
}

- (void)dispatchEvent:(id)a3 forObserver:(id)a4
{
  id v5;
  FINode *v6;
  TNode *v7;
  void *v8;
  TDSNotifier *v9;
  void *v10;
  FINodeEvent *v11;
  TDSNotifier *v12[2];

  v12[1] = *(TDSNotifier **)MEMORY[0x1E0C80C00];
  v5 = a4;
  NodeEventFromNodeEventRef((FINodeEvent *)a3, &v11);
  v12[0] = *(TDSNotifier **)(TNodeEventPtr::operator->(&v11) + 64);
  TDSNotifier::AddPtrReference(v12[0]);
  v6 = (FINode *)*((id *)v12[0] + 3);
  v7 = (TNode *)TNodeFromFINode(v6);
  FIDSNodeFromTNode(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  TRef<TDSNotifier *,TRetainReleasePolicy<TDSNotifier *>>::~TRef(v12);
  v9 = (TDSNotifier *)*(id *)(TNodeEventPtr::operator->(&v11) + 8);
  switch(*(_DWORD *)TNodeEventPtr::operator->(&v11))
  {
    case 1:
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "nodeDeleted:", v8);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "temporaryNodeDeleted:", v8);
      }
      goto LABEL_27;
    case 2:
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "nodeChanged:for:", v8, *(unsigned int *)(TNodeEventPtr::operator->(&v11) + 16));
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "nodePropertyChanged:forProperty:", v8, *(unsigned int *)(TNodeEventPtr::operator->(&v11) + 16));
      }
      goto LABEL_27;
    case 3:
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v12[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "childrenAdded:to:", v10, v8);
        goto LABEL_26;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v12[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "childNodesAdded:", v10);
        goto LABEL_26;
      }
      goto LABEL_27;
    case 4:
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v12[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "childrenDeleted:from:", v10, v8);
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_27;
        v12[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "childNodesDeleted:", v10);
      }
LABEL_26:

LABEL_27:
      TNodeEventPtr::~TNodeEventPtr((id *)&v11);

      return;
    case 6:
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "childChanged:in:for:", v9, v8, *(unsigned int *)(TNodeEventPtr::operator->(&v11) + 16));
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "childNodePropertyChanged:forProperty:", v9, *(unsigned int *)(TNodeEventPtr::operator->(&v11) + 16));
      }
      goto LABEL_27;
    case 8:
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "openSyncCompleted:", v8);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "nodeOpenSyncCompleted:", v8);
      }
      goto LABEL_27;
    case 9:
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "openSyncStarted:", v8);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "nodeOpenSyncStarted:", v8);
      }
      goto LABEL_27;
    case 0x14:
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "nodeShouldBeReloaded:", v8);
      goto LABEL_27;
    default:
      goto LABEL_27;
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_WORD *)self + 44) = 0;
  return self;
}

- (void).cxx_destruct
{
  TNode::~TNode((TNode *)&self->_node, (const TNode *)a2);
}

- (void)synchronizeChildren:(unsigned int)a3 events:(void *)a4
{
  TNode::SynchronizeChildren((uint64_t)&self->_node, a3, (TNodeEventPtrs *)a4);
}

void __31__FIDSNode_FPv2_makeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v6;
  if (v8)
  {
    LogObj(4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 56);
      v11 = *(_QWORD *)(a1 + 64);
      v15 = 138544130;
      v16 = v7;
      v17 = 2114;
      v18 = v10;
      v19 = 2114;
      v20 = v11;
      v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_1CBC4A000, v9, OS_LOG_TYPE_ERROR, "Failed to decode FPItem to node.\n\t%{public}@\n\tfpItem: %{public}@\n\tfpDomain: %{public}@\n\terror: %{public}@", (uint8_t *)&v15, 0x2Au);
    }

  }
  static_objc_cast<NSString,objc_object * {__strong}>(v7);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(void ***)(a1 + 40);
  v14 = *v13;
  *v13 = (void *)v12;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)_makeWithCoder:(id)a3
{
  TNode *v3;
  TNode *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  TString *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  TString v15;
  uint8_t buf[16];

  v3 = (TNode *)a3;
  v4 = v3;
  if (v3)
  {
    if (TNode::IsContextOpen(v3))
    {
      -[TNode decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FI Type"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      static_objc_cast<NSString,objc_object * {__strong}>(v5);
      v6 = objc_claimAutoreleasedReturnValue();

      if (!-[NSObject length](v6, "length"))
        goto LABEL_12;
      v7 = (id)sSubclassMakeWithCoderRegistry;
      objc_sync_enter(v7);
      v8 = (id)objc_msgSend((id)sSubclassMakeWithCoderRegistry, "objectForKeyedSubscript:", v6);
      objc_sync_exit(v7);

      if (!v8)
      {
        v9 = v6;
        v15.fString.fRef = &stru_1E8752DF8;
        CFRetain(&stru_1E8752DF8);
        TString::SetStringRefAsImmutable(&v15, v9);

        v10 = StringToFSInfoVirtualType(&v15);
        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v15.fString.fRef);
        v8 = FIDSNodeSubclassForVirtualType(v10);
      }
      if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF9BAD18))
      {
        objc_msgSend(v8, "makeWithCoder:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_12:
        -[TNode decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FI URL"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        static_objc_cast<NSString,objc_object * {__strong}>(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          +[FINode fiNodeFromURL:](FIDSNode, "fiNodeFromURL:", v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }

      }
    }
    else
    {
      LogObj(5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CBC4A000, v6, OS_LOG_TYPE_ERROR, "Attempting to decode a node while the DesktopServices context is not open", buf, 2u);
      }
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  TString *v12;
  TNode *v13;
  TString *v14;
  void *v15;
  CFTypeRef cf;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CFStringRef theString;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FIDSNode;
  -[FINode encodeWithCoder:](&v22, sel_encodeWithCoder_, v4);
  if (objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EF9BAD18))
  {
    theString = &stru_1E8752DF8;
    CFRetain(&stru_1E8752DF8);
    v5 = (id)sSubclassMakeWithCoderRegistry;
    objc_sync_enter(v5);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend((id)sSubclassMakeWithCoderRegistry, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend((id)sSubclassMakeWithCoderRegistry, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqual:", objc_opt_class()))
          {
            v12 = v10;
            if (theString != (CFStringRef)v12)
              TString::SetStringRefAsImmutable((TString *)&theString, v12);

            goto LABEL_14;
          }

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

    objc_sync_exit(v5);
    if (!CFStringGetLength(theString))
    {
      v13 = (TNode *)TNodeFromFINode(&self->super);
      v14 = (TString *)TNode::VirtualType(v13);
      FSInfoVirtualTypeToString(v14, (TString *)&cf);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::operator=<__CFString const*,TRetainReleasePolicy<__CFString const*>>((const void **)&theString, &cf);
      CFRetain(&stru_1E8752DF8);
      if (cf)
        CFRelease(cf);
      cf = &stru_1E8752DF8;
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef(&cf);
    }
    if (CFStringGetLength(theString))
      objc_msgSend(v4, "encodeObject:forKey:", theString, CFSTR("FI Type"));
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&theString);
  }
  -[FIDSNode fileURL](self, "fileURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("FI URL"));

}

+ (void)registerClassForFIDSNodeCoding:(id)a3
{
  id v3;
  id v4;
  _QWORD block[5];

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __43__FIDSNode_registerClassForFIDSNodeCoding___block_invoke;
  block[3] = &__block_descriptor_33_ea8_32c56_ZTSKZ43__FIDSNode_registerClassForFIDSNodeCoding__E3__2_e5_v8__0l;
  if (+[FIDSNode registerClassForFIDSNodeCoding:]::onceToken != -1)
    dispatch_once(&+[FIDSNode registerClassForFIDSNodeCoding:]::onceToken, block);
  v3 = (id)sSubclassMakeWithCoderRegistry;
  objc_sync_enter(v3);
  objc_msgSend((id)sSubclassMakeWithCoderRegistry, "setObject:forKeyedSubscript:", objc_opt_class(), v4);
  objc_sync_exit(v3);

}

void __43__FIDSNode_registerClassForFIDSNodeCoding___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sSubclassMakeWithCoderRegistry;
  sSubclassMakeWithCoderRegistry = v0;

}

- (void)startObserving:(unsigned int)a3 with:(OpaqueEventNotifier *)a4
{
  uint64_t v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v5 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[FINode nodesToObserve](self, "nodesToObserve");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        v11 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v10);
        NodeRegisterChangeNotification((TNode *)objc_msgSend(v11, "nodeRef", (_QWORD)v12), (OpaqueNodeRef *)a4, v5);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  NodeObservedOptionsCountRegistry::StartedObserving(self, v5);
}

- (void)stopObserving:(unsigned int)a3 with:(OpaqueEventNotifier *)a4
{
  uint64_t v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v5 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[FINode nodesToObserve](self, "nodesToObserve");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        v11 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v10);
        NodeUnregisterChangeNotification((TNode *)objc_msgSend(v11, "nodeRef", (_QWORD)v12), (OpaqueNodeRef *)a4, v5);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  NodeObservedOptionsCountRegistry::StoppedObserving(self, v5);
}

- (BOOL)isObservedForAll:(unsigned int)a3
{
  return (a3 & ~NodeObservedOptionsCountRegistry::AllObservedOptions((NodeObservedOptionsCountRegistry *)self, (FINode *)a2)) == 0;
}

- (BOOL)isObservedForAny:(unsigned int)a3
{
  return (NodeObservedOptionsCountRegistry::AllObservedOptions((NodeObservedOptionsCountRegistry *)self, (FINode *)a2) & a3) != 0;
}

- (BOOL)isObservedForNone:(unsigned int)a3
{
  return (NodeObservedOptionsCountRegistry::AllObservedOptions((NodeObservedOptionsCountRegistry *)self, (FINode *)a2) & a3) == 0;
}

- (BOOL)isObserved
{
  return NodeObservedOptionsCountRegistry::AllObservedOptions((NodeObservedOptionsCountRegistry *)self, (FINode *)a2) != 0;
}

- (id)iteratorWithOptions:(unsigned int)a3
{
  OpaqueNodeRef *v4;
  TNodeRequest *NewRequest;
  FINodeIterator *v6;
  TNodeRequest *v8;
  uint64_t v9;

  v9 = 0;
  v4 = -[FINode nodeRef](self, "nodeRef");
  NewRequest = 0;
  if ((a3 & 0x40000) == 0)
    NewRequest = NodeCreateNewRequest(0);
  v8 = NewRequest;
  NodeNewIterator(v4, &v9);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v8);
  if (!v9)
    return 0;
  v6 = [FINodeIterator alloc];
  return -[FINodeIterator initWithIterator:](v6, "initWithIterator:", v9);
}

- (shared_ptr<TFSInfo>)fsInfo
{
  _QWORD *v2;
  _QWORD *v3;
  TNode *v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  TFSInfo *v9;
  __shared_weak_count *v10;
  shared_ptr<TFSInfo> result;

  v3 = v2;
  v4 = -[FIDSNode asTNode](self, "asTNode");
  v5 = (os_unfair_lock_s *)TNode::InfoLock(v4);
  os_unfair_lock_lock(v5);
  v6 = *((_QWORD *)v4 + 3);
  *v3 = *((_QWORD *)v4 + 2);
  v3[1] = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  os_unfair_lock_unlock(v5);
  result.__cntrl_ = v10;
  result.__ptr_ = v9;
  return result;
}

- (id)fileURL
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  void *v4;
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  const void *v10;
  os_unfair_lock_s *v11;
  std::__shared_weak_count *v12;

  -[FIDSNode fsInfo](self, "fsInfo");
  v2 = v11;
  v3 = v11 + 25;
  os_unfair_lock_lock(v11 + 25);
  v4 = *(void **)&v2[4]._os_unfair_lock_opaque;
  v10 = v4;
  if (v4)
    CFRetain(v4);
  os_unfair_lock_unlock(v3);
  v5 = v4;
  TRef<__CFURL const*,TRetainReleasePolicy<__CFURL const*>>::~TRef(&v10);
  v6 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v5;
}

- (BOOL)isValid
{
  FIDSNode *v2;
  void *v3;
  TNode *v4;
  const TNode *v5;

  v2 = self;
  v3 = (void *)MEMORY[0x1D17A5880](self, a2);
  v4 = -[FIDSNode asTNode](v2, "asTNode");
  LOBYTE(v2) = TNode::Validate(v4, v5) == 0;
  objc_autoreleasePoolPop(v3);
  return (char)v2;
}

- (unint64_t)nodeIs:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  int v7;

  v6 = -[FIDSNode asTNode](self, "asTNode");
  if (v6)
    v7 = 0;
  else
    v7 = -8058;
  if (v6)
    a3 = TNode::NodeIs((uint64_t)v6, a3);
  if (a4)
  {
    ErrorWithOSStatus(v7, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a3;
}

- (unsigned)volumeIs:(unsigned int)a3 error:(id *)a4
{
  void *v6;
  int v7;
  unsigned int v9;

  v9 = a3;
  v6 = -[FIDSNode asTNode](self, "asTNode");
  if (!v6)
  {
    v7 = -8058;
    goto LABEL_5;
  }
  v7 = TNode::VolumeIs((uint64_t)v6, (int *)&v9);
  if (v7)
LABEL_5:
    v9 = a3;
  if (a4)
  {
    ErrorWithOSStatus(v7, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (unsigned)nodePermissions:(unsigned int)a3 error:(id *)a4
{
  void *v5;
  int Permissions;
  unsigned int v8;

  v8 = a3;
  v5 = -[FIDSNode asTNode](self, "asTNode");
  if (!v5)
  {
    Permissions = -8058;
    if (!a4)
      return v8;
    goto LABEL_3;
  }
  Permissions = TNode::GetPermissions((uint64_t)v5, (int *)&v8);
  if (a4)
  {
LABEL_3:
    ErrorWithOSStatus(Permissions, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)inlineProgressCancel
{
  TNode::InlineProgressCancel((TNode *)-[FIDSNode asTNode](self, "asTNode"));
}

- (id)downloadProgress
{
  TProgressInfo *v3;
  int Progress;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  TNodePtr v14;
  TNodePtr v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  const __CFString *v24;
  __int128 v25;
  __int128 v26;

  v15.fFINode = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23[0] = 0;
  *(_QWORD *)((char *)v23 + 7) = 0;
  v24 = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  v25 = 0u;
  v26 = 0u;
  TNodePtr::TNodePtr(&v14, (const TNode *)-[FIDSNode asTNode](self, "asTNode"));
  Progress = TProgressMap::GetProgress((TProgressMap *)&v14, &v15, v3);
  if (HIDWORD(v23[0]))
    v5 = Progress;
  else
    v5 = 0;

  if (v5 == 1)
  {
    v6 = (id)v26;
    objc_msgSend(v6, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB30C8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_cast<NSString,objc_object * {__strong}>(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9 || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB30B8]) & 1) == 0)
    {

      v9 = v6;
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  v10 = (std::__shared_weak_count *)*((_QWORD *)&v25 + 1);
  if (*((_QWORD *)&v25 + 1))
  {
    v11 = (unint64_t *)(*((_QWORD *)&v25 + 1) + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v24);
  return v6;
}

- (id)copyProgress
{
  TProgressInfo *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  TNodePtr v13;
  TNodePtr v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];
  const __CFString *v23;
  __int128 v24;
  __int128 v25;

  v14.fFINode = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22[0] = 0;
  *(_QWORD *)((char *)v22 + 7) = 0;
  v23 = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  v24 = 0u;
  v25 = 0u;
  TNodePtr::TNodePtr(&v13, (const TNode *)-[FIDSNode asTNode](self, "asTNode"));
  if (TProgressMap::GetProgress((TProgressMap *)&v13, &v14, v3)
    && operator==((void **)&v23, CFSTR("CopyOperationType")))
  {
    v4 = HIDWORD(v22[0]);

    if (v4)
    {
      v5 = (id)v25;
      objc_msgSend(v5, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB30C8]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_cast<NSString,objc_object * {__strong}>(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 && (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB30B8]) & 1) == 0)
      {

        goto LABEL_9;
      }

    }
  }
  else
  {

  }
  v5 = 0;
LABEL_9:

  v9 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
  if (*((_QWORD *)&v24 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v23);
  return v5;
}

- (BOOL)isPopulated
{
  return TNode::IsPopulated((TNode *)-[FIDSNode asTNode](self, "asTNode"));
}

- (id)brContainer
{
  return (id)TNodeEvent::GetMonitor((TNodeEvent *)-[FINode nodeRef](self, "nodeRef"));
}

- (id)brContainerDocuments
{
  TNode *v2;
  TNode *v3;
  TNode *v4;
  void *v5;
  FINode *v7;

  v2 = -[FIDSNode asTNode](self, "asTNode");
  v3 = v2;
  if (v2)
  {
    if (TNode::VirtualType(v2) == 25)
    {
      TNode::GetAliasTarget(v3, &v7);
      v4 = (TNode *)TNodeFromFINode(v7);
      FIDSNodeFromTNode(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
    }
    v3 = 0;
  }
  return v3;
}

- (id)fileParent
{
  OpaqueNodeRef *v2;
  OpaqueNodeRef *v4;

  v4 = NodeCopyParentNode((TNode *)self, (OpaqueNodeRef *)a2);
  v2 = v4;
  TRef<OpaqueNodeRef *,TRetainReleasePolicy<OpaqueNodeRef *>>::~TRef((const void **)&v4);
  return v2;
}

- (id)fpDomain
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  TString *v6;
  void *v7;
  TString v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[FIDSNode fiDomain](self, "fiDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      LogObj(4);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "domainID");
        v6 = (TString *)(id)objc_claimAutoreleasedReturnValue();
        v9.fString.fRef = &stru_1E8752DF8;
        CFRetain(&stru_1E8752DF8);
        TString::SetStringRefAsImmutable(&v9, v6);

        SanitizedStr(&v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v11 = v7;
        _os_log_impl(&dword_1CBC4A000, v5, OS_LOG_TYPE_ERROR, "Found fiDomain but not FPDomain available %{public}@", buf, 0xCu);
        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v9.fString.fRef);

      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)fiDomain
{
  OpaqueNodeRef *v2;
  OpaqueNodeRef *v3;

  v2 = -[FINode nodeRef](self, "nodeRef");
  return NodeGetFIProviderDomain((TNode *)v2, v3);
}

- (id)enumeratorError
{
  void *v2;
  void *v4;

  v4 = 0;
  TNode::CopyEnumeratorError((uint64_t)-[FIDSNode asTNode](self, "asTNode"), &v4);
  v2 = v4;

  return v2;
}

- (id)fpItem
{
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  TFSInfo *v7;
  std::__shared_weak_count *v8;

  -[FIDSNode fsInfo](self, "fsInfo");
  TFSInfo::GetFPItem(v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  return v2;
}

- (id)propertyAsNumber:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  _BOOL4 v8;
  OpaqueNodeRef *v9;
  OpaqueNodeRef *v10;
  TNodeRequest *NewRequest;
  int NodeProperty;
  TNodeRequest *v14;
  uint64_t *v15;
  int v16;
  uint64_t v17;

  v8 = a4;
  v9 = *(OpaqueNodeRef **)&a3;
  v17 = 0;
  v16 = 5;
  v15 = &v17;
  v10 = -[FINode nodeRef](self, "nodeRef");
  NewRequest = 0;
  if (v8)
    NewRequest = NodeCreateNewRequest(0);
  v14 = NewRequest;
  NodeProperty = GetNodeProperty((TNode *)v10, v9, (TPropertyReference *)&v15, NewRequest, a5);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v14);
  if (a6)
  {
    ErrorWithOSStatus(NodeProperty, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17, v14);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)propertyAsDate:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  _BOOL4 v8;
  OpaqueNodeRef *v9;
  OpaqueNodeRef *v10;
  TNodeRequest *NewRequest;
  int NodeProperty;
  TNodeRequest *v14;
  double *v15;
  int v16;
  double v17;

  v8 = a4;
  v9 = *(OpaqueNodeRef **)&a3;
  v17 = 0.0;
  v16 = 7;
  v15 = &v17;
  v10 = -[FINode nodeRef](self, "nodeRef");
  NewRequest = 0;
  if (v8)
    NewRequest = NodeCreateNewRequest(0);
  v14 = NewRequest;
  NodeProperty = GetNodeProperty((TNode *)v10, v9, (TPropertyReference *)&v15, NewRequest, a5);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v14);
  if (a6)
  {
    ErrorWithOSStatus(NodeProperty, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v17, v14);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)propertyAsString:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  _BOOL4 v8;
  uint64_t v9;
  TNode *v10;
  uint64_t v11;
  os_unfair_lock_s *v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  os_unfair_lock_s *v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  TNodeRequest *NewRequest;
  int Property;
  void *v23;
  TNodeRequest *v25;
  TNodeRequest *v26;
  void **v27;
  int v28;
  void *v29;

  v8 = a4;
  v9 = *(_QWORD *)&a3;
  v10 = -[FIDSNode asTNode](self, "asTNode");
  if (!v10)
  {
    v23 = 0;
    Property = -8058;
    if (!a6)
      return v23;
    goto LABEL_22;
  }
  v11 = (uint64_t)v10;
  if ((_DWORD)v9 == 1684955501)
  {
    v12 = (os_unfair_lock_s *)TNode::InfoLock(v10);
    os_unfair_lock_lock(v12);
    v14 = *(_QWORD *)(v11 + 16);
    v13 = *(std::__shared_weak_count **)(v11 + 24);
    if (v13)
    {
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        v16 = __ldxr(p_shared_owners);
      while (__stxr(v16 + 1, p_shared_owners));
    }
    os_unfair_lock_unlock(v12);
    v17 = (os_unfair_lock_s *)(v14 + 100);
    os_unfair_lock_lock((os_unfair_lock_t)(v14 + 100));
    v18 = *(unsigned int *)(v14 + 115) | ((unint64_t)*(unsigned __int16 *)(v14 + 119) << 32);
    os_unfair_lock_unlock(v17);
    if (v13)
    {
      v19 = (unint64_t *)&v13->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    if ((v18 & 0x100000000) != 0)
      v9 = 1886282093;
    else
      v9 = 1684955501;
  }
  NewRequest = 0;
  v29 = 0;
  v28 = 12;
  v27 = &v29;
  if (v8)
    NewRequest = NodeCreateNewRequest(0);
  v25 = NewRequest;
  v26 = NewRequest;
  Property = TNode::GetProperty(v11, v9, (TPropertyReference *)&v27, &v26, a5);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v25);
  if (Property)
    v23 = 0;
  else
    v23 = v29;
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v29);
  if (a6)
  {
LABEL_22:
    ErrorWithOSStatus(Property, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v23;
}

- (id)propertyAsArray:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  TNodeRequest *NewRequest;
  int Property;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int16 v24;
  void *v25;
  void *v26;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  TNodeRequest *v34;
  TNodeRequest *v35;
  void **v36;
  int v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v7 = a4;
  v8 = *(_QWORD *)&a3;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = -[FIDSNode asTNode](self, "asTNode");
  if (v9)
  {
    v10 = (uint64_t)v9;
    NewRequest = 0;
    v38 = 0;
    v37 = 17;
    v36 = &v38;
    if (v7)
      NewRequest = NodeCreateNewRequest(0);
    v34 = NewRequest;
    v35 = NewRequest;
    Property = TNode::GetProperty(v10, v8, (TPropertyReference *)&v36, &v35, a5);
    TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v34);
    if (Property)
    {
      TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>::~TRef((const void **)&v38);
      v13 = 0;
    }
    else
    {
      v13 = v38;
      TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>::~TRef((const void **)&v38);
      if ((_DWORD)v8 == 1718903156 && objc_msgSend(v13, "count") && objc_opt_class())
      {
        v29 = (void *)objc_opt_new();
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v31 != v16)
                objc_enumerationMutation(v14);
              objc_cast<NSDictionary,objc_object * {__strong}>(*(void **)(*((_QWORD *)&v30 + 1) + 8 * i));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v18;
              if (v18)
              {
                objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("TagName"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_cast<NSString,objc_object * {__strong}>(v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v21, "length"))
                {
                  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("TagColor"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_cast<NSData,objc_object * {__strong}>(v22);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v23, "length") == 2)
                    v24 = *(_WORD *)objc_msgSend(objc_retainAutorelease(v23), "bytes");
                  else
                    v24 = 0;
                  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAACC8]), "initWithLabel:color:", v21, v24);
                  objc_msgSend(v29, "addObject:", v25);

                }
              }

            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          }
          while (v15);
        }

        Property = 0;
        v13 = v29;
      }
      else
      {
        Property = 0;
      }
    }
  }
  else
  {
    v13 = 0;
    Property = -8058;
  }
  if (a6)
  {
    ErrorWithOSStatus(Property, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)objc_msgSend(v13, "copy");

  return v26;
}

- (id)propertyAsNSObject:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  _BOOL4 v8;
  uint64_t v9;
  id v11;
  uint64_t v12;
  TNodeRequest *NewRequest;
  int Property;
  void *v15;
  void *v16;
  id *v17;
  _BOOL4 v18;
  id v19;
  TNodeRequest *v21;
  TNodeRequest *v22;
  id *p_location;
  int v24;
  id location;

  v8 = a4;
  v9 = *(_QWORD *)&a3;
  v11 = -[FIDSNode asTNode](self, "asTNode");
  location = 0;
  if (v11)
  {
    v12 = (uint64_t)v11;
    v24 = 10;
    p_location = &location;
    if ((_DWORD)v9 == 1869769063 || v8)
      NewRequest = NodeCreateNewRequest(0);
    else
      NewRequest = 0;
    v21 = NewRequest;
    v22 = NewRequest;
    Property = TNode::GetProperty(v12, v9, (TPropertyReference *)&p_location, &v22, a5);
    TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v21);
    v11 = location;
  }
  else
  {
    Property = -8058;
  }
  objc_cast<UTType,NSObject * {__strong}>(v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((_DWORD)v9 == 1970566256 && (!v15 || objc_msgSend(v15, "isEqual:", *MEMORY[0x1E0CEC528])))
  {
    if (-[FINode isPackage](self, "isPackage"))
    {
      v17 = (id *)MEMORY[0x1E0CEC588];
    }
    else
    {
      v18 = -[FINode isFolder](self, "isFolder");
      v17 = (id *)MEMORY[0x1E0CEC528];
      if (v18)
        v17 = (id *)MEMORY[0x1E0CEC4F0];
    }
    objc_storeStrong(&location, *v17);
  }

  if (a6)
  {
    ErrorWithOSStatus(Property, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = location;

  return v19;
}

- (id)propertyAsDictionary:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  TNodeRequest *NewRequest;
  int Property;
  void *v14;
  TNodeRequest *v16;
  TNodeRequest *v17;
  void **v18;
  int v19;
  void *v20;

  v8 = a4;
  v9 = *(_QWORD *)&a3;
  v10 = -[FIDSNode asTNode](self, "asTNode");
  if (!v10)
  {
    v14 = 0;
    Property = -8058;
    if (!a6)
      return v14;
    goto LABEL_10;
  }
  v11 = (uint64_t)v10;
  NewRequest = 0;
  v20 = 0;
  v19 = 15;
  v18 = &v20;
  if (v8)
    NewRequest = NodeCreateNewRequest(0);
  v16 = NewRequest;
  v17 = NewRequest;
  Property = TNode::GetProperty(v11, v9, (TPropertyReference *)&v18, &v17, a5);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v16);
  if (Property)
    v14 = 0;
  else
    v14 = v20;
  TRef<__CFDictionary const*,TRetainReleasePolicy<__CFDictionary const*>>::~TRef((const void **)&v20);
  if (a6)
  {
LABEL_10:
    ErrorWithOSStatus(Property, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

- (BOOL)propertyAsBool:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  _BOOL4 v8;
  OpaqueNodeRef *v9;
  OpaqueNodeRef *v10;
  TNodeRequest *NewRequest;
  int NodeProperty;
  TNodeRequest *v14;
  BOOL *v15;
  int v16;
  BOOL v17;

  v8 = a4;
  v9 = *(OpaqueNodeRef **)&a3;
  v17 = 0;
  v16 = 1;
  v15 = &v17;
  v10 = -[FINode nodeRef](self, "nodeRef");
  if (v8)
    NewRequest = NodeCreateNewRequest(0);
  else
    NewRequest = 0;
  v14 = NewRequest;
  NodeProperty = GetNodeProperty((TNode *)v10, v9, (TPropertyReference *)&v15, NewRequest, a5);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v14);
  if (a6)
  {
    ErrorWithOSStatus(NodeProperty, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v17;
}

- (id)propertyAsData:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  _BOOL4 v8;
  OpaqueNodeRef *v9;
  OpaqueNodeRef *v11;
  TNodeRequest *NewRequest;
  void *v13;
  int NodeProperty;
  OpaqueNodeRef *v15;
  TNodeRequest *v16;
  TNodeRequest *v18;
  void *__p[3];
  uint64_t *v20;
  int v21;
  uint64_t v22;
  void *v23;

  v8 = a4;
  v9 = *(OpaqueNodeRef **)&a3;
  if (-[FIDSNode asTNode](self, "asTNode"))
  {
    v22 = 0;
    v23 = 0;
    v21 = 9;
    v20 = &v22;
    v11 = -[FINode nodeRef](self, "nodeRef");
    if (v8)
      NewRequest = NodeCreateNewRequest(0);
    else
      NewRequest = 0;
    __p[0] = NewRequest;
    NodeProperty = GetNodeProperty((TNode *)v11, v9, (TPropertyReference *)&v20, NewRequest, a5);
    TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef((TNodeRequest **)__p);
    if (NodeProperty == -8063)
    {
      std::vector<unsigned char>::vector(__p, HIDWORD(v22));
      v23 = __p[0];
      LODWORD(v22) = HIDWORD(v22);
      v15 = -[FINode nodeRef](self, "nodeRef");
      if (v8)
        v16 = NodeCreateNewRequest(0);
      else
        v16 = 0;
      v18 = v16;
      NodeProperty = GetNodeProperty((TNode *)v15, v9, (TPropertyReference *)&v20, v16, a5);
      TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v18);
      if (NodeProperty)
      {
        v13 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v23, HIDWORD(v22), v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
    NodeProperty = -8058;
  }
  if (a6)
  {
    ErrorWithOSStatus(NodeProperty, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

- (BOOL)setProperty:(unsigned int)a3 asNumber:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8;
  _BOOL4 v9;
  OpaqueNodeRef *v10;
  const __CFNumber *v12;
  const __CFNumber *v13;
  CFNumberType Type;
  OpaqueNodeRef *v15;
  __CFString *NewRequest;
  BOOL v17;
  OpaqueNodeRef *v18;
  __CFString *v19;
  int v20;
  TNodeRequest **v21;
  __CFString *v23;
  uint64_t v24;
  uint64_t *v25;
  int v26;

  v8 = *(_QWORD *)&a6;
  v9 = a5;
  v10 = *(OpaqueNodeRef **)&a3;
  v12 = (const __CFNumber *)a4;
  v13 = v12;
  if (v12)
  {
    Type = CFNumberGetType(v12);
    switch(Type)
    {
      case kCFNumberSInt16Type:
        LOWORD(v23) = -[__CFNumber shortValue](v13, "shortValue");
        v18 = -[FINode nodeRef](self, "nodeRef", v23);
        v26 = 3;
        v25 = (uint64_t *)&v23;
        if (!v9)
        {
          v19 = 0;
          goto LABEL_18;
        }
        break;
      case kCFNumberSInt32Type:
        LODWORD(v23) = -[__CFNumber intValue](v13, "intValue");
        v18 = -[FINode nodeRef](self, "nodeRef", v23);
        v26 = 4;
        v25 = (uint64_t *)&v23;
        if (!v9)
        {
          v19 = 0;
          goto LABEL_18;
        }
        break;
      case kCFNumberSInt64Type:
        v24 = -[__CFNumber longLongValue](v13, "longLongValue");
        v15 = -[FINode nodeRef](self, "nodeRef");
        v26 = 5;
        v25 = &v24;
        if (v9)
          NewRequest = (__CFString *)NodeCreateNewRequest(0);
        else
          NewRequest = 0;
        v23 = NewRequest;
        v20 = SetNodeProperty((TNode *)v15, v10, (const void **)&v25, NewRequest, v8);
        v21 = (TNodeRequest **)&v23;
LABEL_21:
        TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(v21);
        if (!a7)
        {
LABEL_23:
          v17 = v20 == 0;
          goto LABEL_24;
        }
LABEL_22:
        ErrorWithOSStatus(v20, 0);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      default:
        v20 = -8072;
        if (!a7)
          goto LABEL_23;
        goto LABEL_22;
    }
    v19 = (__CFString *)NodeCreateNewRequest(0);
LABEL_18:
    v24 = (uint64_t)v19;
    v20 = SetNodeProperty((TNode *)v18, v10, (const void **)&v25, v19, v8);
    v21 = (TNodeRequest **)&v24;
    goto LABEL_21;
  }
  if (a7)
  {
    ErrorWithOSStatus(-8072, 0);
    v17 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_24:

  return v17;
}

- (BOOL)setProperty:(unsigned int)a3 asDate:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8;
  _BOOL4 v9;
  OpaqueNodeRef *v10;
  uint64_t v12;
  OpaqueNodeRef *v13;
  TNodeRequest *NewRequest;
  int v15;
  TNodeRequest *v17;
  uint64_t *v18;
  int v19;
  uint64_t v20;

  v8 = *(_QWORD *)&a6;
  v9 = a5;
  v10 = *(OpaqueNodeRef **)&a3;
  objc_msgSend(a4, "timeIntervalSinceReferenceDate");
  v20 = v12;
  v13 = -[FINode nodeRef](self, "nodeRef");
  v19 = 7;
  v18 = &v20;
  if (v9)
    NewRequest = NodeCreateNewRequest(0);
  else
    NewRequest = 0;
  v17 = NewRequest;
  v15 = SetNodeProperty((TNode *)v13, v10, (const void **)&v18, (__CFString *)NewRequest, v8);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v17);
  if (a7)
  {
    ErrorWithOSStatus(v15, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v15 == 0;
}

- (BOOL)setProperty:(unsigned int)a3 asString:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8;
  _BOOL4 v9;
  OpaqueNodeRef *v10;
  void *v12;
  void *v13;
  OpaqueNodeRef *v14;
  TNodeRequest *NewRequest;
  int v16;
  TNodeRequest *v18;
  const void **v19;
  int v20;
  const void *v21;

  v8 = *(_QWORD *)&a6;
  v9 = a5;
  v10 = *(OpaqueNodeRef **)&a3;
  v12 = (void *)objc_msgSend(a4, "copy");
  v13 = v12;
  v21 = v12;
  if (v12)
    CFRetain(v12);

  v14 = -[FINode nodeRef](self, "nodeRef");
  v20 = 12;
  v19 = &v21;
  if (v9)
    NewRequest = NodeCreateNewRequest(0);
  else
    NewRequest = 0;
  v18 = NewRequest;
  v16 = SetNodeProperty((TNode *)v14, v10, (const void **)&v19, (__CFString *)NewRequest, v8);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v18);
  if (a7)
  {
    ErrorWithOSStatus(v16, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef(&v21);
  return v16 == 0;
}

- (BOOL)setProperty:(unsigned int)a3 asArray:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8;
  _BOOL4 v9;
  OpaqueNodeRef *v10;
  void *v12;
  void *v13;
  OpaqueNodeRef *v14;
  TNodeRequest *NewRequest;
  int v16;
  TNodeRequest *v18;
  const void **v19;
  int v20;
  const void *v21;

  v8 = *(_QWORD *)&a6;
  v9 = a5;
  v10 = *(OpaqueNodeRef **)&a3;
  v12 = (void *)objc_msgSend(a4, "copy");
  v13 = v12;
  v21 = v12;
  if (v12)
    CFRetain(v12);

  v14 = -[FINode nodeRef](self, "nodeRef");
  v20 = 17;
  v19 = &v21;
  if (v9)
    NewRequest = NodeCreateNewRequest(0);
  else
    NewRequest = 0;
  v18 = NewRequest;
  v16 = SetNodeProperty((TNode *)v14, v10, (const void **)&v19, (__CFString *)NewRequest, v8);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v18);
  if (a7)
  {
    ErrorWithOSStatus(v16, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>::~TRef(&v21);
  return v16 == 0;
}

- (BOOL)setProperty:(unsigned int)a3 asBool:(BOOL)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8;
  _BOOL4 v9;
  OpaqueNodeRef *v10;
  OpaqueNodeRef *v11;
  TNodeRequest *NewRequest;
  int v13;
  TNodeRequest *v15;
  BOOL *v16;
  int v17;
  BOOL v18;

  v8 = *(_QWORD *)&a6;
  v9 = a5;
  v10 = *(OpaqueNodeRef **)&a3;
  v18 = a4;
  v11 = -[FINode nodeRef](self, "nodeRef");
  v17 = 1;
  v16 = &v18;
  if (v9)
    NewRequest = NodeCreateNewRequest(0);
  else
    NewRequest = 0;
  v15 = NewRequest;
  v13 = SetNodeProperty((TNode *)v11, v10, (const void **)&v16, (__CFString *)NewRequest, v8);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v15);
  if (a7)
  {
    ErrorWithOSStatus(v13, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v13 == 0;
}

- (BOOL)setProperty:(unsigned int)a3 asData:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8;
  _BOOL4 v9;
  OpaqueNodeRef *v10;
  id v12;
  void *v13;
  size_t v14;
  void *v15;
  BOOL v16;
  OpaqueNodeRef *v17;
  TNodeRequest *NewRequest;
  int v19;
  TNodeRequest *v21;
  _DWORD *v22;
  int v23;
  void *__p[3];
  _DWORD v25[2];
  void *v26;

  v8 = *(_QWORD *)&a6;
  v9 = a5;
  v10 = *(OpaqueNodeRef **)&a3;
  v12 = a4;
  v13 = v12;
  if (!v12)
  {
    if (a7)
    {
      ErrorWithOSStatus(-8072, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_10:
    v16 = 0;
    goto LABEL_16;
  }
  v14 = objc_msgSend(v12, "length");
  if (HIDWORD(v14))
  {
    if (a7)
    {
      ErrorWithOSStatus(-8096, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v16 = 0;
      *a7 = v15;
      goto LABEL_16;
    }
    goto LABEL_10;
  }
  v25[0] = v14;
  v25[1] = v14;
  std::vector<unsigned char>::vector(__p, v14);
  v26 = __p[0];
  objc_msgSend(v13, "getBytes:length:");
  v17 = -[FINode nodeRef](self, "nodeRef");
  v23 = 9;
  v22 = v25;
  if (v9)
    NewRequest = NodeCreateNewRequest(0);
  else
    NewRequest = 0;
  v21 = NewRequest;
  v19 = SetNodeProperty((TNode *)v17, v10, (const void **)&v22, (__CFString *)NewRequest, v8);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v21);
  if (a7)
  {
    ErrorWithOSStatus(v19, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v19 == 0;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
LABEL_16:

  return v16;
}

- (void)nodeRestartObservingWithOptions:(unsigned int)a3
{
  TNode *v4;

  v4 = -[FIDSNode asTNode](self, "asTNode");
  if (v4)
    TNode::RestartCollections(v4, HIBYTE(a3) & 1);
}

- (BOOL)markAsUsed:(id *)a3
{
  void *v4;
  const TNode *v5;
  TNode *v6;
  int v7;
  os_unfair_lock_s *v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  int v13;
  unint64_t v14;
  TPropertyValue v16;

  v4 = -[FIDSNode asTNode](self, "asTNode");
  v6 = (TNode *)TNode::Validate((TNode *)v4, v5);
  v7 = (int)v6;
  if (!(_DWORD)v6)
  {
    v8 = (os_unfair_lock_s *)TNode::InfoLock(v6);
    os_unfair_lock_lock(v8);
    v10 = *((_QWORD *)v4 + 2);
    v9 = (std::__shared_weak_count *)*((_QWORD *)v4 + 3);
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
      os_unfair_lock_unlock(v8);
      v13 = *(unsigned __int8 *)(v10 + 112);
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
      if (v13)
        goto LABEL_10;
    }
    else
    {
      os_unfair_lock_unlock(v8);
      if (*(_BYTE *)(v10 + 112))
      {
LABEL_10:
        v7 = -8072;
        goto LABEL_11;
      }
    }
    memset(&v16, 0, sizeof(v16));
    TNode::RequestInternalTask((const TNode *)v4, 1007, &v16, 0);
    TPropertyValue::~TPropertyValue(&v16);
    v7 = 0;
    if (!a3)
      return v7 == 0;
    goto LABEL_12;
  }
LABEL_11:
  if (a3)
  {
LABEL_12:
    ErrorWithOSStatus(v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7 == 0;
}

- (void)synchronizeWithOptions:(unsigned int)a3 async:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  TNodeRequest *NewRequest;
  TNodeRequest *v9;
  TNodeRequest *v10;

  v4 = a4;
  v6 = -[FIDSNode asTNode](self, "asTNode");
  if (v6)
  {
    v7 = (uint64_t)v6;
    NewRequest = 0;
    if (v4)
      NewRequest = NodeCreateNewRequest(0);
    v9 = NewRequest;
    v10 = NewRequest;
    TNode::Synchronize(v7, &v10, a3);
    TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v9);
  }
}

- (id)shortDescription
{
  id v3;
  os_unfair_lock_s *v4;
  std::__shared_weak_count *v5;
  __CFString *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  int v9;
  unint64_t *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  TString *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  TString *v18;
  int v19;
  void *v20;
  TString *v21;
  TString *v22;
  void *v23;
  void *v24;
  void *v25;
  TString *v26;
  TString *v27;
  NSURL *v28;
  NSURL *v29;
  CFAllocatorRef *v30;
  TString *v31;
  _BOOL4 v32;
  __CFString *fRef;
  const __CFAllocator *v34;
  CFMutableStringRef MutableCopy;
  const __CFString *v36;
  CFMutableStringRef v37;
  CFAllocatorRef *v38;
  void *v39;
  TString *v40;
  __CFString *v41;
  const __CFString *v42;
  TString *v43;
  TString *v44;
  __CFString *v45;
  const __CFString *v46;
  __CFString *v47;
  id v49;
  TString v50;
  TString v51;
  TString v52;
  CFTypeRef cf;
  CFTypeRef v54;
  TString v55;
  id v56;
  CFStringRef theString;
  TString v58;
  std::__shared_weak_count *v59;

  v3 = -[FIDSNode asTNode](self, "asTNode");
  v4 = (os_unfair_lock_s *)TNode::InfoLock((TNode *)v3);
  os_unfair_lock_lock(v4);
  v6 = (__CFString *)*((_QWORD *)v3 + 2);
  v5 = (std::__shared_weak_count *)*((_QWORD *)v3 + 3);
  v58.fString.fRef = v6;
  v59 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  os_unfair_lock_unlock(v4);
  v9 = TFSInfo::IsOnSystemVolume((TFSInfo *)v6);
  if (v5)
  {
    v10 = (unint64_t *)&v5->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  -[FINode displayName](self, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    v49 = v12;
  }
  else
  {
    v14 = v12;
    v58.fString.fRef = &stru_1E8752DF8;
    CFRetain(&stru_1E8752DF8);
    TString::SetStringRefAsImmutable(&v58, v14);

    SanitizedStr(&v58);
    v49 = (id)objc_claimAutoreleasedReturnValue();
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v58.fString.fRef);
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@ %p"), v17, self);
  v18 = (TString *)(id)objc_claimAutoreleasedReturnValue();
  v58.fString.fRef = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  TString::SetStringRefAsImmutable(&v58, v18);

  v19 = TNode::VirtualType((TNode *)v3);
  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    Description(v19, (TString *)&v56);
    objc_msgSend(v20, "stringWithFormat:", CFSTR(" %@:"), objc_retainAutorelease(v56));
    v21 = (TString *)(id)objc_claimAutoreleasedReturnValue();
    theString = &stru_1E8752DF8;
    CFRetain(&stru_1E8752DF8);
    TString::SetStringRefAsImmutable((TString *)&theString, v21);

    TString::Append(&v58, (const TString *)&theString);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&theString);

    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v56);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" '%@'"), v49);
  v22 = (TString *)(id)objc_claimAutoreleasedReturnValue();
  theString = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  TString::SetStringRefAsImmutable((TString *)&theString, v22);

  TString::Append(&v58, (const TString *)&theString);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&theString);

  -[FINode fileName](self, "fileName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", v23) & 1) == 0)
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    v25 = v23;
    if ((v9 & 1) == 0)
    {
      v26 = v23;
      v56 = &stru_1E8752DF8;
      CFRetain(&stru_1E8752DF8);
      TString::SetStringRefAsImmutable((TString *)&v56, v26);

      SanitizedStr((TString *)&v56);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v24, "stringWithFormat:", CFSTR(" {raw: '%@'}"), v25);
    v27 = (TString *)(id)objc_claimAutoreleasedReturnValue();
    theString = &stru_1E8752DF8;
    CFRetain(&stru_1E8752DF8);
    TString::SetStringRefAsImmutable((TString *)&theString, v27);

    TString::Append(&v58, (const TString *)&theString);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&theString);

    if ((v9 & 1) == 0)
    {

      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v56);
    }
  }

  -[FIDSNode fileURL](self, "fileURL");
  v28 = (NSURL *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  v30 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (v28)
  {
    if ((v9 & 1) != 0)
    {
      -[NSURL debugDescription](v28, "debugDescription");
      v31 = (TString *)(id)objc_claimAutoreleasedReturnValue();
      v55.fString.fRef = &stru_1E8752DF8;
      CFRetain(&stru_1E8752DF8);
      TString::SetStringRefAsImmutable(&v55, v31);

      v32 = -[NSURL isFileReferenceURL](v29, "isFileReferenceURL");
      if (v32)
      {
        TString::TString(&v52, " (", 2uLL);
        -[NSURL path](v29, "path");
        v3 = (id)objc_claimAutoreleasedReturnValue();
        v51.fString.fRef = &stru_1E8752DF8;
        CFRetain(&stru_1E8752DF8);
        TString::SetStringRefAsImmutable(&v51, (TString *)v3);

        fRef = v52.fString.fRef;
        cf = &stru_1E8752DF8;
        CFRetain(&stru_1E8752DF8);
        v34 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, fRef);
        if (cf)
          CFRelease(cf);
        cf = MutableCopy;
        TString::Append((TString *)&cf, &v51);
        TString::TString(&v50, ")", 1uLL);
        v36 = (const __CFString *)cf;
        v54 = &stru_1E8752DF8;
        CFRetain(&stru_1E8752DF8);
        v37 = CFStringCreateMutableCopy(v34, 0, v36);
        if (v54)
          CFRelease(v54);
        v54 = v37;
        TString::Append((TString *)&v54, &v50);
      }
      else
      {
        TString::TString((TString *)&v54, "", 0);
      }
      v41 = v55.fString.fRef;
      theString = &stru_1E8752DF8;
      CFRetain(&stru_1E8752DF8);
      v42 = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v41);
      if (theString)
        CFRelease(theString);
      theString = v42;
      TString::Append((TString *)&theString, (const TString *)&v54);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef(&v54);
      if (v32)
      {
        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v50.fString.fRef);
        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef(&cf);
        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v51.fString.fRef);

        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v52.fString.fRef);
      }
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v55.fString.fRef);

      v30 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
    }
    else
    {
      SanitizedURL(v28);
      v40 = (TString *)(id)objc_claimAutoreleasedReturnValue();
      theString = &stru_1E8752DF8;
      CFRetain(&stru_1E8752DF8);
      TString::SetStringRefAsImmutable((TString *)&theString, v40);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), objc_retainAutorelease((id)theString));
    v43 = (TString *)(id)objc_claimAutoreleasedReturnValue();
    v55.fString.fRef = &stru_1E8752DF8;
    CFRetain(&stru_1E8752DF8);
    TString::SetStringRefAsImmutable(&v55, v43);

    TString::Append(&v58, &v55);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v55.fString.fRef);

  }
  else
  {
    TNode::Path((TNode *)v3, (CFTypeRef *)&theString);
    if (CFStringGetLength(theString))
    {
      v38 = v30;
      v39 = (void *)MEMORY[0x1E0CB3940];
      if ((v9 & 1) != 0)
      {
        v54 = &stru_1E8752DF8;
        CFRetain(&stru_1E8752DF8);
        TString::SetStringRefAsImmutable((TString *)&v54, (TString *)theString);
      }
      else
      {
        SanitizedPath((TString *)&theString);
        v3 = (id)objc_claimAutoreleasedReturnValue();
        v54 = &stru_1E8752DF8;
        CFRetain(&stru_1E8752DF8);
        TString::SetStringRefAsImmutable((TString *)&v54, (TString *)v3);

      }
      objc_msgSend(v39, "stringWithFormat:", CFSTR(", '%@'"), objc_retainAutorelease((id)v54));
      v44 = (TString *)(id)objc_claimAutoreleasedReturnValue();
      v55.fString.fRef = &stru_1E8752DF8;
      CFRetain(&stru_1E8752DF8);
      TString::SetStringRefAsImmutable(&v55, v44);

      TString::Append(&v58, &v55);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v55.fString.fRef);

      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef(&v54);
      if ((v9 & 1) == 0)

      v30 = v38;
    }
  }
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&theString);

  if (!-[FIDSNode isValid](self, "isValid"))
    TString::Append(&v58, (const __CFString *)", **** invalid ****");
  TString::TString(&v55, ">", 1uLL);
  v45 = v58.fString.fRef;
  theString = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  v46 = CFStringCreateMutableCopy(*v30, 0, v45);
  CFRelease(&stru_1E8752DF8);
  theString = v46;
  TString::Append((TString *)&theString, &v55);
  v47 = (id)(id)theString;
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&theString);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v55.fString.fRef);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v58.fString.fRef);

  return v47;
}

- (void)_sendNotification:(unsigned int)a3 node:(id)a4 property:(unsigned int)a5
{
  id v8;
  const TNode *v9;
  void *v10;
  TNodePtr v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  TNodePtr v15;

  v8 = a4;
  v9 = -[FIDSNode asTNode](self, "asTNode");
  objc_cast<FIDSNode,FINode * {__strong}>(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  TNodePtr::TNodePtr(&v11, (const TNode *)objc_msgSend(v10, "asTNode"));
  TNodeEvent::CreateNodeEvent(a3, (id *)&v11.fFINode, a5, &v14);

  v11.fFINode = 0;
  v12 = 0;
  v13 = 0;
  TNodePtr::TNodePtr(&v15, v9);
  TNodeEventPtrs::AddEvent((TNodeEventPtrs *)&v11, &v15, &v14);

  TNodeEventPtrs::SendNotifications((id **)&v11);
  v15.fFINode = (FINode *)&v11;
  std::vector<std::pair<TNodePtr,TNodeEventPtr>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v15);
  TNodeEventPtr::~TNodeEventPtr(&v14);

}

+ (id)appContainersForContainerRoot:(id)a3 showAllFiles:(BOOL)a4 showSystemFiles:(BOOL)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  TNodePtr v16;
  _BYTE v17[8];
  id v18;
  void **v19;

  v7 = a3;
  TNodePtr::TNodePtr(&v16, (const TNode *)objc_msgSend(v7, "asTNode"));
  v17[0] = a4;
  v17[1] = a5;
  v18 = 0;

  TContainerFetcher::FetchContainersAndDocumentsFolders((TContainerFetcher *)v17, &v14);
  type_traits_extras::CopyAsHelper<NSMutableArray<FPProviderDomain *> * {__strong}>::MakeWithCapacity(0xAAAAAAAAAAAAAAABLL * ((v15 - v14) >> 4));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  v10 = v15;
  v11 = v8;
  while (v9 != v10)
  {
    v12 = *(id *)(v9 + 8);
    objc_msgSend(v11, "addObject:", v12);

    v9 += 48;
  }

  v19 = (void **)&v14;
  std::vector<TAppContainerInfo>::__destroy_vector::operator()[abi:ne180100](&v19);

  return v11;
}

@end
