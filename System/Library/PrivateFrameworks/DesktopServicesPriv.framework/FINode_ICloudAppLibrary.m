@implementation FINode_ICloudAppLibrary

- (FINode)documentsFolder
{
  FINode_ICloudAppLibrary *v2;
  id WeakRetained;
  uint64_t v4;

  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_documentsFolder);
  objc_sync_exit(v2);

  if (!WeakRetained || (objc_msgSend(WeakRetained, "isValid") & 1) == 0)
  {
    -[FINode_ICloudAppLibrary updateDocumentsFolder](v2, "updateDocumentsFolder");
    v4 = objc_claimAutoreleasedReturnValue();

    WeakRetained = (id)v4;
  }
  return (FINode *)WeakRetained;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[FIPresentationNodeMap shared](FIPresentationNodeMap, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterAllForPresentationNode:", self);

  v4.receiver = self;
  v4.super_class = (Class)FINode_ICloudAppLibrary;
  -[FINode_ICloudAppLibrary dealloc](&v4, sel_dealloc);
}

- (BOOL)isValid
{
  void *v3;
  os_unfair_lock_s *v4;
  BOOL v5;
  TNodePtr v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FINode_ICloudAppLibrary;
  if (!-[FIDSNode isValid](&v8, sel_isValid))
    return 0;
  v3 = -[FIDSNode asTNode](self, "asTNode");
  v4 = (os_unfair_lock_s *)TNode::ParentLock((TNode *)v3);
  os_unfair_lock_lock(v4);
  TNodePtr::TNodePtr(&v7, *((const TNode **)v3 + 6));
  os_unfair_lock_unlock(v4);
  v5 = TNodeFromFINode(v7.fFINode) != 0;

  return v5;
}

- (NSString)appIdentifier
{
  TString *p_appIdentifier;
  void *v4;
  void *v5;
  TString *v6;

  p_appIdentifier = &self->_appIdentifier;
  if (!CFStringGetLength(self->_appIdentifier.fString.fRef))
  {
    -[FIDSNode fpItem](self, "fpItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "fp_appContainerBundleIdentifier");
      v6 = (TString *)(id)objc_claimAutoreleasedReturnValue();
      if ((TString *)p_appIdentifier->fString.fRef != v6)
        TString::SetStringRefAsImmutable(p_appIdentifier, v6);

    }
  }
  return (NSString *)p_appIdentifier->fString.fRef;
}

- (id)iteratorWithOptions:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[FINode_ICloudAppLibrary documentsFolder](self, "documentsFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iteratorWithOptions:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)updateDocumentsFolder
{
  void *v3;
  void *v4;
  FINode_ICloudAppLibrary *v5;

  if (-[FINode_ICloudAppLibrary isValid](self, "isValid"))
  {
    -[FIDSNode fileURL](self, "fileURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FINode fiNodeFromURL:](FINode, "fiNodeFromURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = self;
    objc_sync_enter(v5);
    objc_storeWeak((id *)&v5->_documentsFolder, v4);
    objc_sync_exit(v5);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_uiParent
{
  void *v2;
  void *v3;
  void *v4;

  -[FINode_ICloudAppLibrary documentsFolder](self, "documentsFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileParent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nodeToMoveOrDelete
{
  void *v2;
  void *v3;

  -[FINode_ICloudAppLibrary documentsFolder](self, "documentsFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileParent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nodesToObserve
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[FINode_ICloudAppLibrary documentsFolder](self, "documentsFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dispatchEvent:(id)a3 forObserver:(id)a4
{
  id v6;
  FINode_ICloudAppLibrary *v7;
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
  v9 = (const TNode *)TNodeFromFINode(&v7->super.super);
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
  v20.super_class = (Class)FINode_ICloudAppLibrary;
  -[FIDSNode dispatchEvent:forObserver:](&v20, sel_dispatchEvent_forObserver_, v21, v6);
  TNodeEventPtr::~TNodeEventPtr(&v21);
  TNodeEventPtr::~TNodeEventPtr((id *)&v23);

  TNodeEventPtr::~TNodeEventPtr((id *)&v24);
}

- (id)propertyAsDate:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = *(_QWORD *)&a3;
  if ((int)a3 <= 1836016739)
  {
    if (a3 != 1634952036)
    {
      v10 = 1819632756;
      goto LABEL_6;
    }
LABEL_7:
    -[FINode_ICloudAppLibrary documentsFolder](self, "documentsFolder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "propertyAsDate:async:options:error:", v9, v8, v7, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
  if (a3 == 1883333732)
    goto LABEL_7;
  v10 = 1836016740;
LABEL_6:
  if (a3 == v10)
    goto LABEL_7;
  v14.receiver = self;
  v14.super_class = (Class)FINode_ICloudAppLibrary;
  -[FIDSNode propertyAsDate:async:options:error:](&v14, sel_propertyAsDate_async_options_error_, *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)propertyAsNumber:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = *(_QWORD *)&a3;
  if (a3 == 1684237940 || a3 == 1885895027 || a3 == 1819240307)
  {
    -[FINode_ICloudAppLibrary documentsFolder](self, "documentsFolder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "propertyAsNumber:async:options:error:", v9, v8, v7, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    return v14;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)FINode_ICloudAppLibrary;
    -[FIDSNode propertyAsNumber:async:options:error:](&v15, sel_propertyAsNumber_async_options_error_, *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)propertyAsArray:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  objc_super v12;

  v7 = *(_QWORD *)&a5;
  v8 = a4;
  if (a3 == 1718903156)
  {
    -[FINode_ICloudAppLibrary documentsFolder](self, "documentsFolder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertyAsArray:async:options:error:", 1718903156, v8, v7, a6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)FINode_ICloudAppLibrary;
    -[FIDSNode propertyAsArray:async:options:error:](&v12, sel_propertyAsArray_async_options_error_, *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void).cxx_destruct
{
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&self->_appIdentifier.fString.fRef);
  objc_destroyWeak((id *)&self->_documentsFolder);
}

- (id).cxx_construct
{
  self->_appIdentifier.fString.fRef = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  return self;
}

@end
