@implementation FILocalAppContainerNode

- (FILocalAppContainerNode)initWithAppContainerRoot:(id)a3 documentsNode:(id)a4 appIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  FILocalAppContainerNode *v12;
  FILocalAppContainerNode *v13;
  FINode *v14;
  FINode *containerRootNode;
  void *v16;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  v12 = 0;
  if (v8 && v9 && v10)
  {
    v19.receiver = self;
    v19.super_class = (Class)FILocalAppContainerNode;
    v13 = -[FIProxyNode initWithSubject:](&v19, sel_initWithSubject_, v9);
    self = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_appIdentifier, a5);
      static_objc_cast<NSString,objc_object * {__strong}>(v8);
      v14 = (FINode *)objc_claimAutoreleasedReturnValue();
      containerRootNode = self->_containerRootNode;
      self->_containerRootNode = v14;

      if (!self->_containerRootNode)
      {
        v12 = 0;
        goto LABEL_9;
      }
      +[FIPresentationNodeMap shared](FIPresentationNodeMap, "shared");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "registerPresentationNode:forNode:", self, self->_containerRootNode);

      +[FIPresentationNodeMap shared](FIPresentationNodeMap, "shared");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "registerPresentationNode:forNode:", self, v9);

    }
    self = self;
    v12 = self;
  }
LABEL_9:

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_shouldStopAccessingSecurityScopedURL)
  {
    -[FPAppMetadata documentsURL](self->_metaData, "documentsURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopAccessingSecurityScopedResource");

  }
  v4.receiver = self;
  v4.super_class = (Class)FILocalAppContainerNode;
  -[FICustomNode dealloc](&v4, sel_dealloc);
}

- (FILocalAppContainerNode)initWithAppContainerInfo:(const void *)a3
{
  FILocalAppContainerNode *v4;
  void *v5;
  TString *v6;
  __CFString *v8;
  TString *v9;
  int v10;
  TString v11;

  v4 = -[FILocalAppContainerNode initWithAppContainerRoot:documentsNode:appIdentifier:](self, "initWithAppContainerRoot:documentsNode:appIdentifier:", *(_QWORD *)a3, *((_QWORD *)a3 + 1), *((_QWORD *)a3 + 2));
  if (-[FIDSNode asTNode](v4, "asTNode"))
  {
    objc_storeStrong((id *)&v4->_metaData, *((id *)a3 + 4));
    -[FPAppMetadata documentsURL](v4->_metaData, "documentsURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_shouldStopAccessingSecurityScopedURL = objc_msgSend(v5, "startAccessingSecurityScopedResource");

    -[FPAppMetadata displayName](v4->_metaData, "displayName");
    v6 = (TString *)(id)objc_claimAutoreleasedReturnValue();
    v11.fString.fRef = &stru_1E8752DF8;
    CFRetain(&stru_1E8752DF8);
    TString::SetStringRefAsImmutable(&v11, v6);

    v10 = 11;
    v8 = 0;
    v9 = &v11;
    TNode::SetProperty((uint64_t)-[FIDSNode asTNode](v4, "asTNode"), 1886282093, (const void **)&v9, &v8, 0, 0);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v11.fString.fRef);
  }
  return v4;
}

- (id)propertyAsString:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  void *v7;
  objc_super v9;

  if (a3 == 1886282093 || a3 == 1684955501)
  {
    -[FPAppMetadata displayName](self->_metaData, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)FILocalAppContainerNode;
    -[FIProxyNode propertyAsString:async:options:error:](&v9, sel_propertyAsString_async_options_error_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)dispatchEvent:(id)a3 forObserver:(id)a4
{
  id v6;
  FILocalAppContainerNode *v7;
  unsigned int v8;
  const TNode *v9;
  TDSNotifier *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  TNodeEvent *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;
  id v21;
  id obj;
  FINodeEvent *v23;
  FINodeEvent *v24;
  TNodePtr v25;
  TNodePtr v26;
  TDSNotifier *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  TDSNotifier *v30;

  v6 = a4;
  NodeEventFromNodeEventRef((FINodeEvent *)a3, &v24);
  v7 = self;
  obj = v7;
  v23 = v24;
  v8 = *(_DWORD *)TNodeEventPtr::operator->(&v24);
  v9 = (const TNode *)TNodeFromFINode(&v7->super.super.super.super);
  v10 = *(TDSNotifier **)(TNodeEventPtr::operator->(&v23) + 64);
  v27 = v10;
  if (v10)
    TDSNotifier::AddPtrReference(v10);
  v11 = (std::__shared_weak_count *)*((_QWORD *)v10 + 1);
  v28 = *(_QWORD *)v10;
  v29 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  TNodePtr::TNodePtr(&v26, v9);
  TNodePtr::TNodePtr(&v25, v9);
  TDSNotifier::Make((uint64_t)&v28, (uint64_t)&v26, (uint64_t)&v25, (uint64_t *)&v30);

  v14 = v29;
  if (v29)
  {
    v15 = (unint64_t *)&v29->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  TRef<TDSNotifier *,TRetainReleasePolicy<TDSNotifier *>>::~TRef(&v27);
  v17 = (TNodeEvent *)TNodeEventPtr::operator->(&v23);
  TNodeEvent::Clone(v17, &v21);
  v18 = TNodeEventPtr::operator->(&v21);
  TRef<TDSNotifier *,TRetainReleasePolicy<TDSNotifier *>>::operator=((TDSNotifier **)(v18 + 64), v30);
  if (((v8 < 0x15) & (0x100326u >> v8)) != 0)
  {
    v19 = TNodeEventPtr::operator->(&v21);
    objc_storeStrong((id *)(v19 + 8), obj);
  }
  TRef<TDSNotifier *,TRetainReleasePolicy<TDSNotifier *>>::~TRef(&v30);
  v20.receiver = v7;
  v20.super_class = (Class)FILocalAppContainerNode;
  -[FIDSNode dispatchEvent:forObserver:](&v20, sel_dispatchEvent_forObserver_, v21, v6);
  TNodeEventPtr::~TNodeEventPtr(&v21);
  TNodeEventPtr::~TNodeEventPtr((id *)&v23);

  TNodeEventPtr::~TNodeEventPtr((id *)&v24);
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

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FINode displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FILocalAppContainerNode documentsNode](self, "documentsNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FILocalAppContainerNode appIdentifier](self, "appIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%@>(proxyFor=%@, containerID=%@)"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (FINode)containerRootNode
{
  return self->_containerRootNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerRootNode, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
}

@end
