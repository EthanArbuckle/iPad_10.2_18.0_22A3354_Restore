@implementation FICompoundNode

- (void)dispatchEvent:(id)a3 forObserver:(id)a4
{
  id v6;
  FINode *v7;
  FINode *v8;
  int isa_low;
  objc_super v10;
  id v11;
  id obj;
  id location;
  FICompoundNode *v14;
  FINodeEvent *v15;
  FINodeEvent *v16;

  v6 = a4;
  NodeEventFromNodeEventRef((FINodeEvent *)a3, &v16);
  v14 = self;
  v15 = v16;
  v7 = v14;
  TNodeEventPtr::TNodeEventPtr((TNodeEventPtr *)&location, 0);
  switch(*(_DWORD *)TNodeEventPtr::operator->(&v16))
  {
    case 1:
    case 2:
      goto LABEL_15;
    case 3:
    case 4:
    case 6:
      v8 = v7;
      objc_sync_enter(v8);
      if (v8[15].super.isa)
        goto LABEL_14;
      -[FICompoundNode dispatchEvent:forObserver:]::$_2::operator()((FINode **)&v14, 0, &obj);
      goto LABEL_13;
    case 8:
      v8 = v7;
      objc_sync_enter(v8);
      if (!v8[15].super.isa)
        goto LABEL_14;
      v11 = *(id *)(TNodeEventPtr::operator->(&v16) + 8);
      std::__hash_table<FINode * {__strong},std::hash<FINode * {__strong}>,std::equal_to<FINode * {__strong}>,std::allocator<FINode * {__strong}>>::__erase_unique<FINode * {__strong}>(&v8[12].super.isa, &v11);

      if (v8[15].super.isa)
        goto LABEL_14;
      -[FICompoundNode dispatchEvent:forObserver:]::$_2::operator()((FINode **)&v14, 1, &obj);
      goto LABEL_13;
    case 9:
      v8 = v7;
      objc_sync_enter(v8);
      if (v8[15].super.isa)
      {
        isa_low = LOBYTE(v8[17].super.isa);
        LOBYTE(v8[17].super.isa) = 1;
        if (!isa_low)
          goto LABEL_12;
      }
      goto LABEL_14;
    case 0x14:
      v8 = v7;
      objc_sync_enter(v8);
      if (v8[15].super.isa)
        goto LABEL_14;
LABEL_12:
      -[FICompoundNode dispatchEvent:forObserver:]::$_2::operator()((FINode **)&v14, 1, &obj);
LABEL_13:
      objc_storeStrong(&location, obj);
      TNodeEventPtr::~TNodeEventPtr(&obj);
LABEL_14:
      objc_sync_exit(v8);

LABEL_15:
      if (TNodeEventPtr::operator->(&location))
      {
        v10.receiver = v7;
        v10.super_class = (Class)FICompoundNode;
        -[FIDSNode dispatchEvent:forObserver:](&v10, sel_dispatchEvent_forObserver_, location, v6);
      }
      TNodeEventPtr::~TNodeEventPtr(&location);

      TNodeEventPtr::~TNodeEventPtr((id *)&v15);
      TNodeEventPtr::~TNodeEventPtr((id *)&v16);

      return;
    default:
      -[FICompoundNode dispatchEvent:forObserver:]::$_2::operator()((FINode **)&v14, 0, &obj);
      objc_storeStrong(&location, obj);
      TNodeEventPtr::~TNodeEventPtr(&obj);
      goto LABEL_15;
  }
}

- (FICompoundNode)initWithFINodes:(id)a3
{
  id v4;
  FICompoundNode *v5;
  uint64_t v6;
  NSArray *nodes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FICompoundNode;
  v5 = -[FICustomNode init](&v9, sel_init);
  v6 = objc_msgSend(v4, "copy");
  nodes = v5->_nodes;
  v5->_nodes = (NSArray *)v6;

  return v5;
}

- (id).cxx_construct
{
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  std::__hash_table<TNodePtr,std::hash<TNodePtr>,std::equal_to<TNodePtr>,std::allocator<TNodePtr>>::~__hash_table((uint64_t)&self->_nodesToComplete);
}

- (id)nodesToObserve
{
  return self->_nodes;
}

- (id)fpItem
{
  return 0;
}

- (id)fileURL
{
  NSUInteger v3;
  NSArray *nodes;
  void *v5;
  void *v6;

  v3 = -[NSArray count](self->_nodes, "count");
  nodes = self->_nodes;
  if (v3 < 2)
    -[NSArray firstObject](nodes, "firstObject");
  else
    -[NSArray objectAtIndexedSubscript:](nodes, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)iteratorWithOptions:(unsigned int)a3
{
  return -[FICompoundNodeIterator initWithFINodes:options:]([FICompoundNodeIterator alloc], "initWithFINodes:options:", self->_nodes, *(_QWORD *)&a3);
}

- (id)longDescription
{
  void *v3;
  id v4;
  TString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;
  TString v15;
  CFStringRef theString;
  _QWORD v17[17];
  id obj;
  _QWORD v19[8];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  TString v24;

  -[FICompoundNode nodes](self, "nodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TString::TString(&v15, "\n\t", 2uLL);
  IDContainerIteratorAdaptor<NSArray<FINode *>>::NSForwardIterator<NSArray<FINode *>>::NSForwardIterator((uint64_t)&obj, v3);
  IDContainerIteratorAdaptor<NSArray<FINode *>>::IDContainerIteratorAdaptor((uint64_t)v17, -1, v3);
  theString = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  while (obj != (id)v17[0] || v23 != v17[16])
  {
    v4 = *(id *)(v19[1] + 8 * v22);
    objc_msgSend(v4, "longDescription");
    v5 = (TString *)(id)objc_claimAutoreleasedReturnValue();
    v24.fString.fRef = &stru_1E8752DF8;
    CFRetain(&stru_1E8752DF8);
    TString::SetStringRefAsImmutable(&v24, v5);

    if (CFStringGetLength(theString) && CFStringGetLength(v24.fString.fRef))
      TString::Append((TString *)&theString, &v15);
    TString::Append((TString *)&theString, &v24);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v24.fString.fRef);
    v6 = v22;
    if (v22 >= v21 - 1)
    {
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v19, v20, 4);
      v6 = -1;
      v21 = v7;
      v22 = -1;
    }
    if (v20[4] != *(_QWORD *)v19[2])
    {
      objc_enumerationMutation(obj);
      v6 = v22;
    }
    v22 = v6 + 1;
    ++v23;
  }

  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v15.fString.fRef);
  v8 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)FICompoundNode;
  -[FINode longDescription](&v14, sel_longDescription);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FICompoundNode nodes](self, "nodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@ (%ld sub-nodes):\n\t%@>"), v9, v11, objc_retainAutorelease((id)theString));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&theString);
  return v12;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)FICompoundNode;
  -[FIDSNode shortDescription](&v8, sel_shortDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FICompoundNode nodes](self, "nodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%ld sub-nodes)>"), v4, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)startObserving:(unsigned int)a3 with:(OpaqueEventNotifier *)a4
{
  uint64_t v5;
  BOOL v7;
  FICompoundNode *v8;
  void *v9;
  id v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;
  _QWORD v15[17];
  id obj;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v5 = *(_QWORD *)&a3;
  v7 = -[FIDSNode isObservedForAll:](self, "isObservedForAll:", 1);
  v14.receiver = self;
  v14.super_class = (Class)FICompoundNode;
  -[FIDSNode startObserving:with:](&v14, sel_startObserving_with_, v5, a4);
  if (!v7 && -[FIDSNode isObservedForAll:](self, "isObservedForAll:", 1))
  {
    v8 = self;
    objc_sync_enter(v8);
    -[FICompoundNode nodesToObserve](v8, "nodesToObserve");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    IDContainerIteratorAdaptor<NSArray<FINode *>>::NSForwardIterator<NSArray<FINode *>>::NSForwardIterator((uint64_t)&obj, v9);
    IDContainerIteratorAdaptor<NSArray<FINode *>>::IDContainerIteratorAdaptor((uint64_t)v15, -1, v9);
    while (obj != (id)v15[0] || v23 != v15[16])
    {
      v10 = *(id *)(v18 + 8 * v22);
      v11 = objc_msgSend(v10, "isPopulated");

      if ((v11 & 1) == 0)
      {
        v24 = *(id *)(v18 + 8 * v22);
        std::__hash_table<FINode * {__strong},std::hash<FINode * {__strong}>,std::equal_to<FINode * {__strong}>,std::allocator<FINode * {__strong}>>::__emplace_unique_key_args<FINode * {__strong},FINode * {__strong}>((uint64_t)&v8->_nodesToComplete, &v24, (uint64_t *)&v24);

      }
      v12 = v22;
      if (v22 >= v21 - 1)
      {
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v20, 4);
        v12 = -1;
        v21 = v13;
        v22 = -1;
      }
      if (v20[4] != *v19)
      {
        objc_enumerationMutation(obj);
        v12 = v22;
      }
      v22 = v12 + 1;
      ++v23;
    }

    objc_sync_exit(v8);
  }
}

- (void)stopObserving:(unsigned int)a3 with:(OpaqueEventNotifier *)a4
{
  uint64_t v5;
  _BOOL4 v7;
  FICompoundNode *v8;
  objc_super v9;

  v5 = *(_QWORD *)&a3;
  v7 = -[FIDSNode isObservedForAll:](self, "isObservedForAll:", 1);
  v9.receiver = self;
  v9.super_class = (Class)FICompoundNode;
  -[FIDSNode stopObserving:with:](&v9, sel_stopObserving_with_, v5, a4);
  if (v7)
  {
    if (-[FIDSNode isObservedForNone:](self, "isObservedForNone:", 1))
    {
      v8 = self;
      objc_sync_enter(v8);
      std::__hash_table<FINode * {__strong},std::hash<FINode * {__strong}>,std::equal_to<FINode * {__strong}>,std::allocator<FINode * {__strong}>>::clear((uint64_t)&v8->_nodesToComplete);
      objc_sync_exit(v8);

    }
  }
}

- (TDSNotifier)dispatchEvent:forObserver:
{
  _QWORD *v6;
  const TNode *v7;
  TDSNotifier *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  TNodeEvent *v15;
  uint64_t v16;
  uint64_t v17;
  TNodePtr v19;
  TNodePtr v20;
  TDSNotifier *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  TDSNotifier *v24;

  v6 = a1 + 1;
  v7 = (const TNode *)TNodeFromFINode(*a1);
  v8 = *(TDSNotifier **)(TNodeEventPtr::operator->(v6) + 64);
  v21 = v8;
  if (v8)
    TDSNotifier::AddPtrReference(v8);
  v9 = (std::__shared_weak_count *)*((_QWORD *)v8 + 1);
  v22 = *(_QWORD *)v8;
  v23 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  TNodePtr::TNodePtr(&v20, v7);
  TNodePtr::TNodePtr(&v19, v7);
  TDSNotifier::Make((uint64_t)&v22, (uint64_t)&v20, (uint64_t)&v19, (uint64_t *)&v24);

  v12 = v23;
  if (v23)
  {
    v13 = (unint64_t *)&v23->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  TRef<TDSNotifier *,TRetainReleasePolicy<TDSNotifier *>>::~TRef(&v21);
  v15 = (TNodeEvent *)TNodeEventPtr::operator->(v6);
  TNodeEvent::Clone(v15, a3);
  v16 = TNodeEventPtr::operator->(a3);
  TRef<TDSNotifier *,TRetainReleasePolicy<TDSNotifier *>>::operator=((TDSNotifier **)(v16 + 64), v24);
  if (a2)
  {
    v17 = TNodeEventPtr::operator->(a3);
    objc_storeStrong((id *)(v17 + 8), *a1);
  }
  return TRef<TDSNotifier *,TRetainReleasePolicy<TDSNotifier *>>::~TRef(&v24);
}

- (void)synchronizeChildren:(unsigned int)a3 events:(void *)a4
{
  uint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v5 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_nodes;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(id *)(*((_QWORD *)&v11 + 1) + 8 * v9);
        objc_msgSend(v10, "synchronizeChildren:events:", v5, a4, (_QWORD)v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (NSArray)nodes
{
  return self->_nodes;
}

@end
