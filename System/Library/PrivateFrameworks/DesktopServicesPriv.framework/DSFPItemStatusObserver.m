@implementation DSFPItemStatusObserver

- (void)updateFPItems:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  std::__shared_weak_count *v7;
  __CFString *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  TPropertyValue *p_p;
  CFIndex buffer;
  void *v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  FINode **v17;
  TNode *v18;
  TNode *v19;
  int v20;
  int v21;
  int v22;
  const TNode *v23;
  uint64_t v24;
  uint64_t v25;
  void **v26;
  uint64_t v27;
  void *v28;
  void *v29;
  TString *v30;
  void *v31;
  void *v32;
  int v33;
  _QWORD *v34;
  std::__shared_weak_count *v35;
  char *v36;
  _QWORD *v37;
  std::__shared_weak_count *v38;
  char *v39;
  id v40;
  id obj;
  id *v42;
  TChildrenList *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  TString v48;
  std::__shared_weak_count *v49;
  TPropertyValue __p;
  TString v51;
  _BYTE v52[128];
  _BYTE buf[12];
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  LogObj(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = TNodeFromFINode(*((FINode **)self + 1));
    v6 = (os_unfair_lock_s *)TNode::InfoLock((TNode *)v5);
    os_unfair_lock_lock(v6);
    v8 = *(__CFString **)(v5 + 16);
    v7 = *(std::__shared_weak_count **)(v5 + 24);
    v48.fString.fRef = v8;
    v49 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    os_unfair_lock_unlock(v6);
    TFSInfo::dCPath((TFSInfo *)v8, 1, &__p);
    v51.fString.fRef = &stru_1E8752DF8;
    CFRetain(&stru_1E8752DF8);
    if (*((char *)&__p.fData.__impl_.__index + 7) >= 0)
      p_p = &__p;
    else
      p_p = (TPropertyValue *)__p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__head.__value;
    if (*((char *)&__p.fData.__impl_.__index + 7) >= 0)
      buffer = *((unsigned __int8 *)&__p.fData.__impl_.__index + 7);
    else
      buffer = (CFIndex)__p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.buffer;
    TString::SetFromUTF8(&v51, (const UInt8 *)p_p, buffer);
    SanitizedPath(&v51);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v40, "count");
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v13;
    v54 = 2048;
    v55 = v14;
    _os_log_impl(&dword_1CBC4A000, v4, OS_LOG_TYPE_DEBUG, "DSFPItemStatusObserver update for %{public}@, %ld items", buf, 0x16u);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v51.fString.fRef);
    if (*((char *)&__p.fData.__impl_.__index + 7) < 0)
      operator delete(__p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value);
    if (v7)
    {
      v15 = (unint64_t *)&v7->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }

  }
  v17 = (FINode **)((char *)self + 8);
  v18 = (TNode *)TNodeFromFINode(*((FINode **)self + 1));
  v19 = (TNode *)TNode::VirtualType(v18);
  v20 = (int)v19;
  if (!TNode::IsContextOpen(v19)
    || ((v21 = ICloudDriveFPFSEnabled(), (v20 - 23) < 2) ? (v22 = v21) : (v22 = 0), v22 != 1))
  {
    if (!objc_msgSend(v40, "count", v40))
      goto LABEL_47;
    memset(&__p, 0, sizeof(__p));
    TNode::StPopulating::StPopulating((TNode::StPopulating *)buf, (const TNodePtr *)self + 1, 0);
    v42 = (id *)((char *)self + 8);
    v43 = *(TChildrenList **)(TNodeFromFINode(*v17) + 56);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v40;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (!v24)
      goto LABEL_46;
    v25 = *(_QWORD *)v45;
    v26 = (void **)((char *)self + 16);
LABEL_28:
    v27 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v25)
        objc_enumerationMutation(obj);
      v28 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v27);
      objc_msgSend(v28, "itemIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ((operator==(v26, v29) & 1) == 0)
        break;
      objc_msgSend(v28, "domainIdentifier");
      v30 = (TString *)(id)objc_claimAutoreleasedReturnValue();
      v48.fString.fRef = &stru_1E8752DF8;
      CFRetain(&stru_1E8752DF8);
      TString::SetStringRefAsImmutable(&v48, v30);

      objc_msgSend(*v42, "fpItem");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "domainIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = operator==((void **)&v48.fString.fRef, v32);

      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v48.fString.fRef);
      if (!v33)
        goto LABEL_36;
      v48.fString.fRef = (__CFString *)*v42;
      v49 = v28;
      if (__p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.buffer >= (char *)*(_QWORD *)&__p.fData.__impl_.__index)
      {
        v36 = (char *)std::vector<std::pair<TNodePtr,FPItem * {__strong}>>::__push_back_slow_path<std::pair<TNodePtr,FPItem * {__strong}>>(&__p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__head.__value, (uint64_t)&v48);
      }
      else
      {
        v34 = TNodePtr::TNodePtr((_QWORD *)__p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.buffer, (id *)&v48.fString.fRef);
        v35 = v49;
        v49 = 0;
        v34[1] = v35;
        v36 = (char *)(v34 + 2);
      }
      __p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.buffer = v36;

LABEL_44:
      if (v24 == ++v27)
      {
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (!v24)
        {
LABEL_46:

          TNode::StPopulating::~StPopulating((TNode::StPopulating *)buf);
          TNode::AttachFPItemsMetadata((id **)&__p, 1, 1);
          *(_QWORD *)buf = &__p;
          std::vector<fstd::optional_err<FPItem * {__strong},NSError * {__strong}>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          goto LABEL_47;
        }
        goto LABEL_28;
      }
    }

LABEL_36:
    TChildrenList::FindNodeMatchingFPItem(v43, (FPItem *)v28, (TNodePtr *)&v51);
    if (TNodeFromFINode((FINode *)v51.fString.fRef))
    {
      v48.fString.fRef = v51.fString.fRef;
      v49 = v28;
      if (__p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.buffer >= (char *)*(_QWORD *)&__p.fData.__impl_.__index)
      {
        v39 = (char *)std::vector<std::pair<TNodePtr,FPItem * {__strong}>>::__push_back_slow_path<std::pair<TNodePtr,FPItem * {__strong}>>(&__p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__head.__value, (uint64_t)&v48);
      }
      else
      {
        v37 = TNodePtr::TNodePtr((_QWORD *)__p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.buffer, (id *)&v48.fString.fRef);
        v38 = v49;
        v49 = 0;
        v37[1] = v38;
        v39 = (char *)(v37 + 2);
      }
      __p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.buffer = v39;

    }
    goto LABEL_44;
  }
  v23 = (const TNode *)TNodeFromFINode(*v17);
  memset(&__p, 0, sizeof(__p));
  TNode::RequestInternalTask(v23, 1000, &__p, 0);
  TPropertyValue::~TPropertyValue(&__p);
LABEL_47:

}

uint64_t __61__DSFPItemStatusObserver_startObserving_forParent_withQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startObserving");
}

- (void)updateNodesFPItemsFromCollection:(const void *)a3
{
  void *v4;
  TNode *v5;
  const TNode *v6;
  int v7;
  TPropertyValue v8;

  objc_msgSend(*((id *)self + 3), "items", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSFPItemStatusObserver updateFPItems:](self, "updateFPItems:", v4);

  if (TNode::IsContextOpen(v5))
  {
    v6 = (const TNode *)TNodeFromFINode(*((FINode **)self + 1));
    v7 = 256;
    v8.fData.__impl_.__index = 0;
    std::variant<std::monostate,BOOL,unsigned char,short,int,long long,unsigned int,double,Point,Blob,NSObject * {__strong},TString,TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>,TRef<__CFNumber const*,TRetainReleasePolicy<__CFNumber const*>>,TRef<__CFData const*,TRetainReleasePolicy<__CFData const*>>,TRef<__CFDictionary const*,TRetainReleasePolicy<__CFDictionary const*>>,TRef<__CFURL const*,TRetainReleasePolicy<__CFURL const*>>,TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>,TRef<__CFFileSecurity *,TRetainReleasePolicy<__CFFileSecurity *>>,TRef<TReferenceCounted *,TRetainReleasePolicy<TReferenceCounted *>>,Property,NodeRequestOptions,NodeDSStoreStatus,DSBladeRunnerFlags>::operator=[abi:ne180100]<NodeRequestOptions const&,0,NodeRequestOptions,21ul,0>(&v8, &v7);
    TNode::RequestInternalTask(v6, 1000, &v8, 0);
    TPropertyValue::~TPropertyValue(&v8);
  }
}

- (void)startObserving:(id)a3 forParent:(const TNodePtr *)a4 withQueue:(id)a5
{
  TString *v5;
  id v9;
  NSObject *v10;
  std::mutex *v11;
  TNode *v12;
  id v13;
  NSObject *v14;
  __union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  TNode *v22;
  dispatch_time_t v23;
  FINode **v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  TNode *v29;
  int v30;
  TNode *v31;
  NSObject *v32;
  uint64_t v33;
  os_unfair_lock_s *v34;
  std::__shared_weak_count *v35;
  TFSInfo *v36;
  unint64_t *p_shared_owners;
  unint64_t v38;
  TPropertyValue *p_buf;
  CFIndex buffer;
  void *v41;
  unint64_t *v42;
  unint64_t v43;
  TNode *v44;
  const TNode *v45;
  id to[2];
  TString v47;
  _QWORD v48[4];
  id v49;
  _QWORD block[4];
  id v51;
  TPropertyValue buf;
  uint8_t v53[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = (std::mutex *)((char *)self + 40);
  std::mutex::lock((std::mutex *)((char *)self + 40));
  v12 = (TNode *)TNodeFromFINode(a4->fFINode);
  if ((TNode::VirtualType(v12) - 23) <= 1u)
  {
    v13 = (id)*((_QWORD *)self + 3);
    if (v13 != v9)
    {
      *((_QWORD *)self + 3) = 0;

    }
  }
  if (!*((_QWORD *)self + 3))
    goto LABEL_13;
  LogObj(4);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)self + 24);
    buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__head.__value = 138543618;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 4) = v15;
    *((_WORD *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 6) = 2114;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 14) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v9;
    _os_log_impl(&dword_1CBC4A000, v14, OS_LOG_TYPE_INFO, "Reusing existing collection. Existing: %{public}@, Ignored: %{public}@", (uint8_t *)&buf, 0x16u);
  }

  if (*((_QWORD *)self + 3))
  {
    v16 = (void *)*((_QWORD *)self + 4);
    if (v16)
    {
      LogObj(4);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        buf.fData.__impl_.__data.__tail.__tail.__tail.__head.__value = 0;
        _os_log_impl(&dword_1CBC4A000, v17, OS_LOG_TYPE_INFO, "Clearing FPError from collection status observer on reuse", (uint8_t *)&buf, 2u);
      }

      v16 = (void *)*((_QWORD *)self + 4);
    }
    *((_QWORD *)self + 4) = 0;
  }
  else
  {
LABEL_13:
    v18 = v9;
    v16 = (void *)*((_QWORD *)self + 3);
    *((_QWORD *)self + 3) = v18;
  }

  v19 = (void *)*((_QWORD *)self + 3);
  if (v19)
  {
    objc_msgSend(v19, "setWorkingQueue:", v10);
    objc_msgSend(*((id *)self + 3), "setDelegate:", self);
    v20 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3321888768;
    block[2] = __61__DSFPItemStatusObserver_startObserving_forParent_withQueue___block_invoke;
    block[3] = &__block_descriptor_40_ea8_32c74_ZTSKZ61__DSFPItemStatusObserver_startObserving_forParent_withQueue__E3__9_e5_v8__0l;
    v21 = *((id *)self + 3);
    v51 = v21;
    dispatch_async(v10, block);

    v22 = (TNode *)TNodeFromFINode(a4->fFINode);
    if ((TNode::VirtualType(v22) - 23) <= 1u && ICloudDriveFPFSEnabled())
    {
      objc_initWeak((id *)&buf, self);
      v23 = dispatch_time(0, 3000000000);
      v48[0] = v20;
      v48[1] = 3321888768;
      v48[2] = __61__DSFPItemStatusObserver_startObserving_forParent_withQueue___block_invoke_30;
      v48[3] = &__block_descriptor_40_ea8_32c75_ZTSKZ61__DSFPItemStatusObserver_startObserving_forParent_withQueue__E4__10_e5_v8__0l;
      objc_copyWeak(to, (id *)&buf);
      objc_copyWeak(&v49, to);
      dispatch_after(v23, v10, v48);
      objc_destroyWeak(to);
      objc_destroyWeak(&v49);
      objc_destroyWeak((id *)&buf);
    }

  }
  v24 = (FINode **)((char *)self + 8);
  objc_storeStrong((id *)self + 1, a4->fFINode);
  objc_cast<FPExtensionCollection,FPItemCollection * {__strong}>(*((void **)self + 3));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    objc_msgSend(v25, "settings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "enumeratedURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)self + 104) = v28 != 0;

  }
  else
  {
    v29 = (TNode *)TNodeFromFINode(a4->fFINode);
    TNode::GetFPItem(v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)self + 104) = v27 == 0;
  }

  v30 = *((unsigned __int8 *)self + 104);
  if (*((_BYTE *)self + 104))
  {
    TString::TString((TString *)&buf, "", 0);
  }
  else
  {
    v31 = (TNode *)TNodeFromFINode(a4->fFINode);
    TNode::GetFPItem(v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "itemIdentifier");
    v5 = (TString *)(id)objc_claimAutoreleasedReturnValue();
    buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__head.__value = (int64_t)&stru_1E8752DF8;
    CFRetain(&stru_1E8752DF8);
    TString::SetStringRefAsImmutable((TString *)&buf, v5);

  }
  if ((TPropertyValue *)((char *)self + 16) != &buf)
  {
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::operator=<__CFString const*,TRetainReleasePolicy<__CFString const*>>((const void **)self + 2, (const void **)&buf);
    CFRetain(&stru_1E8752DF8);
    if (buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__head.__value)
      CFRelease(buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value);
    buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__head.__value = (int64_t)&stru_1E8752DF8;
  }
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&buf);
  if (!v30)
  {

  }
  LogObj(4);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    v33 = TNodeFromFINode(*v24);
    v34 = (os_unfair_lock_s *)TNode::InfoLock((TNode *)v33);
    os_unfair_lock_lock(v34);
    v36 = *(TFSInfo **)(v33 + 16);
    v35 = *(std::__shared_weak_count **)(v33 + 24);
    to[0] = v36;
    to[1] = v35;
    if (v35)
    {
      p_shared_owners = (unint64_t *)&v35->__shared_owners_;
      do
        v38 = __ldxr(p_shared_owners);
      while (__stxr(v38 + 1, p_shared_owners));
    }
    os_unfair_lock_unlock(v34);
    TFSInfo::dCPath(v36, 1, &buf);
    v47.fString.fRef = &stru_1E8752DF8;
    CFRetain(&stru_1E8752DF8);
    if (*((char *)&buf.fData.__impl_.__index + 7) >= 0)
      p_buf = &buf;
    else
      p_buf = (TPropertyValue *)buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__head.__value;
    if (*((char *)&buf.fData.__impl_.__index + 7) >= 0)
      buffer = *((unsigned __int8 *)&buf.fData.__impl_.__index + 7);
    else
      buffer = (CFIndex)buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.buffer;
    TString::SetFromUTF8(&v47, (const UInt8 *)p_buf, buffer);
    SanitizedPath(&v47);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v53 = 138543362;
    v54 = v41;
    _os_log_impl(&dword_1CBC4A000, v32, OS_LOG_TYPE_DEBUG, "DSFPItemStatusObserver start for %{public}@", v53, 0xCu);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v47.fString.fRef);
    if (*((char *)&buf.fData.__impl_.__index + 7) < 0)
      operator delete(buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value);
    if (v35)
    {
      v42 = (unint64_t *)&v35->__shared_owners_;
      do
        v43 = __ldaxr(v42);
      while (__stlxr(v43 - 1, v42));
      if (!v43)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }

  }
  if (TNode::IsContextOpen(v44))
  {
    v45 = (const TNode *)TNodeFromFINode(*v24);
    LODWORD(to[0]) = 0x800000;
    buf.fData.__impl_.__index = 0;
    std::variant<std::monostate,BOOL,unsigned char,short,int,long long,unsigned int,double,Point,Blob,NSObject * {__strong},TString,TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>,TRef<__CFNumber const*,TRetainReleasePolicy<__CFNumber const*>>,TRef<__CFData const*,TRetainReleasePolicy<__CFData const*>>,TRef<__CFDictionary const*,TRetainReleasePolicy<__CFDictionary const*>>,TRef<__CFURL const*,TRetainReleasePolicy<__CFURL const*>>,TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>,TRef<__CFFileSecurity *,TRetainReleasePolicy<__CFFileSecurity *>>,TRef<TReferenceCounted *,TRetainReleasePolicy<TReferenceCounted *>>,Property,NodeRequestOptions,NodeDSStoreStatus,DSBladeRunnerFlags>::operator=[abi:ne180100]<NodeRequestOptions const&,0,NodeRequestOptions,21ul,0>(&buf, to);
    TNode::RequestInternalTask(v45, 1000, &buf, 0);
    TPropertyValue::~TPropertyValue(&buf);
  }
  std::mutex::unlock(v11);

}

- (BOOL)isPopulated
{
  void *v2;

  v2 = (void *)*((_QWORD *)self + 3);
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "isGathering") ^ 1;
  return (char)v2;
}

- (id)fpItems
{
  const TNodePtr *v3;
  TNode *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BYTE v19[24];
  _QWORD v20[17];
  id obj;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = (const TNodePtr *)((char *)self + 8);
  v4 = (TNode *)TNodeFromFINode(*((FINode **)self + 1));
  if (TNode::VirtualType(v4) - 23 > 1)
    goto LABEL_15;
  +[FINode protectedAppIdentifiers](FINode, "protectedAppIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {

LABEL_15:
    TNode::StPopulating::StPopulating((TNode::StPopulating *)&obj, v3, 0);
    objc_msgSend(*((id *)self + 3), "items");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v17, "copy");

    TNode::StPopulating::~StPopulating((TNode::StPopulating *)&obj);
    return v10;
  }
  TNode::StPopulating::StPopulating((TNode::StPopulating *)v19, v3, 0);
  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*((id *)self + 3), "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  objc_msgSend(*((id *)self + 3), "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  IDContainerIteratorAdaptor<NSArray<FPItem *>>::NSForwardIterator<NSArray<FPItem *>>::NSForwardIterator((uint64_t)&obj, v9);
  IDContainerIteratorAdaptor<NSArray<FPItem *>>::IDContainerIteratorAdaptor((uint64_t)v20, -1, v9);
  v10 = v8;
  while (obj != (id)v20[0] || v28 != v20[16])
  {
    v11 = *(id *)(v23 + 8 * v27);
    objc_msgSend(v11, "fp_appContainerBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "containsObject:", v12);

    if ((v13 & 1) == 0)
    {
      v14 = *(id *)(v23 + 8 * v27);
      objc_msgSend(v10, "addObject:", v14);

    }
    v15 = v27;
    if (v27 >= v26 - 1)
    {
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v25, 4);
      v15 = -1;
      v26 = v16;
      v27 = -1;
    }
    if (v25[4] != *v24)
    {
      objc_enumerationMutation(obj);
      v15 = v27;
    }
    v27 = v15 + 1;
    ++v28;
  }

  TNode::StPopulating::~StPopulating((TNode::StPopulating *)v19);
  return v10;
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  std::__shared_weak_count *v8;
  TFSInfo *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  void *v14;
  int v15;
  const char *v16;
  void *v17;
  TNode *v18;
  const TNode *v19;
  TString v20;
  _QWORD v21[2];
  TPropertyValue buf;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogObj(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = TNodeFromFINode(*((FINode **)self + 1));
    v7 = (os_unfair_lock_s *)TNode::InfoLock((TNode *)v6);
    os_unfair_lock_lock(v7);
    v9 = *(TFSInfo **)(v6 + 16);
    v8 = *(std::__shared_weak_count **)(v6 + 24);
    v21[0] = v9;
    v21[1] = v8;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
    }
    os_unfair_lock_unlock(v7);
    TFSInfo::Name(v9, &v20);
    if (v8)
    {
      v12 = (unint64_t *)&v8->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    SanitizedStr(&v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(*((id *)self + 3), "isGathering");
    v16 = "no";
    if (v15)
      v16 = "yes";
    buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__head.__value = 138543618;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 4) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v14;
    *((_WORD *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 6) = 2082;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 14) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v16;
    _os_log_impl(&dword_1CBC4A000, v5, OS_LOG_TYPE_INFO, "dataForCollectionShouldBeReloaded - parent: %{public}@, gathering: %{public}s", (uint8_t *)&buf, 0x16u);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v20.fString.fRef);

  }
  objc_msgSend(v4, "items");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSFPItemStatusObserver updateFPItems:](self, "updateFPItems:", v17);

  if (TNode::IsContextOpen(v18))
  {
    v19 = (const TNode *)TNodeFromFINode(*((FINode **)self + 1));
    LODWORD(v21[0]) = 256;
    buf.fData.__impl_.__index = 0;
    std::variant<std::monostate,BOOL,unsigned char,short,int,long long,unsigned int,double,Point,Blob,NSObject * {__strong},TString,TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>,TRef<__CFNumber const*,TRetainReleasePolicy<__CFNumber const*>>,TRef<__CFData const*,TRetainReleasePolicy<__CFData const*>>,TRef<__CFDictionary const*,TRetainReleasePolicy<__CFDictionary const*>>,TRef<__CFURL const*,TRetainReleasePolicy<__CFURL const*>>,TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>,TRef<__CFFileSecurity *,TRetainReleasePolicy<__CFFileSecurity *>>,TRef<TReferenceCounted *,TRetainReleasePolicy<TReferenceCounted *>>,Property,NodeRequestOptions,NodeDSStoreStatus,DSBladeRunnerFlags>::operator=[abi:ne180100]<NodeRequestOptions const&,0,NodeRequestOptions,21ul,0>(&buf, v21);
    TNode::RequestInternalTask(v19, 1000, &buf, 0);
    TPropertyValue::~TPropertyValue(&buf);
  }

}

- (void)collection:(id)a3 didUpdateObservedItem:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  std::__shared_weak_count *v9;
  void **v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  void *v15;
  int v16;
  const char *v17;
  TNode *v18;
  TString *v19;
  uint8_t *v20;
  std::__shared_weak_count *v21;
  TString v22;
  id v23;
  uint8_t buf[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  LogObj(4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = TNodeFromFINode(*((FINode **)self + 1));
    v8 = (os_unfair_lock_s *)TNode::InfoLock((TNode *)v7);
    os_unfair_lock_lock(v8);
    v10 = *(void ***)(v7 + 16);
    v9 = *(std::__shared_weak_count **)(v7 + 24);
    v20 = (uint8_t *)v10;
    v21 = v9;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
    }
    os_unfair_lock_unlock(v8);
    TFSInfo::Name((TFSInfo *)v10, &v22);
    if (v9)
    {
      v13 = (unint64_t *)&v9->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    SanitizedStr(&v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(*((id *)self + 3), "isGathering", v20, v21);
    v17 = "no";
    if (v16)
      v17 = "yes";
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = v17;
    _os_log_impl(&dword_1CBC4A000, v6, OS_LOG_TYPE_INFO, "didUpdateObservedItem - parent: %{public}@, gathering: %{public}s", buf, 0x16u);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v22.fString.fRef);

  }
  if (TNode::IsContextOpen(v18))
  {
    if (*((_BYTE *)self + 104) && !CFStringGetLength(*((CFStringRef *)self + 2)))
    {
      objc_msgSend(v5, "itemIdentifier");
      v19 = (TString *)(id)objc_claimAutoreleasedReturnValue();
      if (*((TString **)self + 2) != v19)
        TString::SetStringRefAsImmutable((TString *)self + 2, v19);

    }
    v22.fString.fRef = (__CFString *)*((id *)self + 1);
    v23 = v5;
    memset(buf, 0, sizeof(buf));
    LOBYTE(v21) = 0;
    *(_QWORD *)buf = operator new(0x10uLL);
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    *(_QWORD *)&buf[16] = *(_QWORD *)buf + 16;
    *(_QWORD *)&buf[8] = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<TNodePtr,FPItem * {__strong}>>,std::pair<TNodePtr,FPItem * {__strong}> const*,std::pair<TNodePtr,FPItem * {__strong}> const*,std::pair<TNodePtr,FPItem * {__strong}>*>((uint64_t)&buf[16], (id *)&v22.fString.fRef, (id *)buf, *(_QWORD **)buf);
    TNode::AttachFPItemsMetadata((id **)buf, 1, 1);
    v20 = buf;
    std::vector<fstd::optional_err<FPItem * {__strong},NSError * {__strong}>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v20);

  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  *((_QWORD *)self + 5) = 850045863;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_QWORD *)self + 12) = 0;
  return self;
}

void __61__DSFPItemStatusObserver_startObserving_forParent_withQueue___block_invoke_30(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && WeakRetained[3] && (objc_msgSend(WeakRetained, "isPopulated") & 1) == 0)
  {
    LogObj(4);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1CBC4A000, v3, OS_LOG_TYPE_ERROR, "Library load timeout, updating items manually", v4, 2u);
    }

    objc_msgSend(v2, "updateFPItems:", MEMORY[0x1E0C9AA60]);
  }

}

- (void)stopObserving
{
  std::mutex *v3;
  NSObject *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  std::__shared_weak_count *v7;
  TFSInfo *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void **v11;
  CFIndex v12;
  void *v13;
  unint64_t *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  id v20;
  _QWORD block[4];
  id v22;
  TFSInfo *v23;
  std::__shared_weak_count *v24;
  void *__p[2];
  unsigned __int8 v26;
  TString v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (std::mutex *)((char *)self + 40);
  std::mutex::lock((std::mutex *)((char *)self + 40));
  LogObj(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = TNodeFromFINode(*((FINode **)self + 1));
    v6 = (os_unfair_lock_s *)TNode::InfoLock((TNode *)v5);
    os_unfair_lock_lock(v6);
    v8 = *(TFSInfo **)(v5 + 16);
    v7 = *(std::__shared_weak_count **)(v5 + 24);
    v23 = v8;
    v24 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    os_unfair_lock_unlock(v6);
    TFSInfo::dCPath(v8, 1, __p);
    v27.fString.fRef = &stru_1E8752DF8;
    CFRetain(&stru_1E8752DF8);
    if ((v26 & 0x80u) == 0)
      v11 = __p;
    else
      v11 = (void **)__p[0];
    if ((v26 & 0x80u) == 0)
      v12 = v26;
    else
      v12 = (CFIndex)__p[1];
    TString::SetFromUTF8(&v27, (const UInt8 *)v11, v12);
    SanitizedPath(&v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v13;
    _os_log_impl(&dword_1CBC4A000, v4, OS_LOG_TYPE_DEBUG, "DSFPItemStatusObserver stop for %{public}@", buf, 0xCu);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v27.fString.fRef);
    if ((char)v26 < 0)
      operator delete(__p[0]);
    if (v7)
    {
      v14 = (unint64_t *)&v7->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }

  }
  v16 = (void *)*((_QWORD *)self + 3);
  if (v16)
  {
    objc_msgSend(v16, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

    if (!v18)
    {
      objc_msgSend(*((id *)self + 3), "workingQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3321888768;
      block[2] = __39__DSFPItemStatusObserver_stopObserving__block_invoke;
      block[3] = &__block_descriptor_40_ea8_32c53_ZTSKZ39__DSFPItemStatusObserver_stopObserving_E4__11_e5_v8__0l;
      v20 = *((id *)self + 3);
      v22 = v20;
      dispatch_async(v19, block);

      objc_msgSend(*((id *)self + 3), "setDelegate:", 0);
    }
  }
  std::mutex::unlock(v3);
}

uint64_t __39__DSFPItemStatusObserver_stopObserving__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopObserving");
}

- (void)collectionDidFinishGathering:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  std::__shared_weak_count *v8;
  TFSInfo *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  void *v14;
  int v15;
  const char *v16;
  void *v17;
  TNode *v18;
  TNode *v19;
  int v20;
  const TNode *v21;
  TString v22;
  _QWORD v23[2];
  TPropertyValue buf;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogObj(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = TNodeFromFINode(*((FINode **)self + 1));
    v7 = (os_unfair_lock_s *)TNode::InfoLock((TNode *)v6);
    os_unfair_lock_lock(v7);
    v9 = *(TFSInfo **)(v6 + 16);
    v8 = *(std::__shared_weak_count **)(v6 + 24);
    v23[0] = v9;
    v23[1] = v8;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
    }
    os_unfair_lock_unlock(v7);
    TFSInfo::Name(v9, &v22);
    if (v8)
    {
      v12 = (unint64_t *)&v8->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    SanitizedStr(&v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(*((id *)self + 3), "isGathering");
    v16 = "no";
    if (v15)
      v16 = "yes";
    buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__head.__value = 138543618;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 4) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v14;
    *((_WORD *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 6) = 2082;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 14) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v16;
    _os_log_impl(&dword_1CBC4A000, v5, OS_LOG_TYPE_INFO, "collectionDidFinishGathering - parent: %{public}@, gathering: %{public}s", (uint8_t *)&buf, 0x16u);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v22.fString.fRef);

  }
  objc_msgSend(v4, "items");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSFPItemStatusObserver updateFPItems:](self, "updateFPItems:", v17);

  if (TNode::IsContextOpen(v18))
  {
    v19 = (TNode *)TNodeFromFINode(*((FINode **)self + 1));
    if (TNode::IsPopulated(v19))
      v20 = 0x1000000;
    else
      v20 = 20971520;
    LODWORD(v23[0]) = v20;
    v21 = (const TNode *)TNodeFromFINode(*((FINode **)self + 1));
    buf.fData.__impl_.__index = 0;
    std::variant<std::monostate,BOOL,unsigned char,short,int,long long,unsigned int,double,Point,Blob,NSObject * {__strong},TString,TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>,TRef<__CFNumber const*,TRetainReleasePolicy<__CFNumber const*>>,TRef<__CFData const*,TRetainReleasePolicy<__CFData const*>>,TRef<__CFDictionary const*,TRetainReleasePolicy<__CFDictionary const*>>,TRef<__CFURL const*,TRetainReleasePolicy<__CFURL const*>>,TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>,TRef<__CFFileSecurity *,TRetainReleasePolicy<__CFFileSecurity *>>,TRef<TReferenceCounted *,TRetainReleasePolicy<TReferenceCounted *>>,Property,NodeRequestOptions,NodeDSStoreStatus,DSBladeRunnerFlags>::operator=[abi:ne180100]<NodeRequestOptions const&,0,NodeRequestOptions,21ul,0>(&buf, v23);
    TNode::RequestInternalTask(v21, 1000, &buf, 0);
    TPropertyValue::~TPropertyValue(&buf);
  }

}

- (void)collection:(id)a3 didUpdateItems:(id)a4 replaceItemsByFormerID:(id)a5 deleteItemsWithIDs:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  os_unfair_lock_s *v14;
  std::__shared_weak_count *v15;
  TFSInfo *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  void *v21;
  int v22;
  const char *v23;
  void *v24;
  TNode *v25;
  const TNode *v26;
  TString v27;
  _QWORD v28[2];
  TPropertyValue buf;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  LogObj(4);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = TNodeFromFINode(*((FINode **)self + 1));
    v14 = (os_unfair_lock_s *)TNode::InfoLock((TNode *)v13);
    os_unfair_lock_lock(v14);
    v16 = *(TFSInfo **)(v13 + 16);
    v15 = *(std::__shared_weak_count **)(v13 + 24);
    v28[0] = v16;
    v28[1] = v15;
    if (v15)
    {
      p_shared_owners = (unint64_t *)&v15->__shared_owners_;
      do
        v18 = __ldxr(p_shared_owners);
      while (__stxr(v18 + 1, p_shared_owners));
    }
    os_unfair_lock_unlock(v14);
    TFSInfo::Name(v16, &v27);
    if (v15)
    {
      v19 = (unint64_t *)&v15->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    SanitizedStr(&v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(*((id *)self + 3), "isGathering");
    v23 = "no";
    if (v22)
      v23 = "yes";
    buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__head.__value = 138543618;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 4) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v21;
    *((_WORD *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 6) = 2082;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 14) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v23;
    _os_log_impl(&dword_1CBC4A000, v12, OS_LOG_TYPE_INFO, "collection didUpdateItems - parent: %{public}@, gathering: %{public}s", (uint8_t *)&buf, 0x16u);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v27.fString.fRef);

  }
  -[DSFPItemStatusObserver updateFPItems:](self, "updateFPItems:", v9);
  objc_msgSend(v10, "allValues");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSFPItemStatusObserver updateFPItems:](self, "updateFPItems:", v24);

  v25 = (TNode *)objc_msgSend(v9, "count");
  if ((v25 || (v25 = (TNode *)objc_msgSend(v11, "count")) != 0) && TNode::IsContextOpen(v25))
  {
    v26 = (const TNode *)TNodeFromFINode(*((FINode **)self + 1));
    LODWORD(v28[0]) = 256;
    buf.fData.__impl_.__index = 0;
    std::variant<std::monostate,BOOL,unsigned char,short,int,long long,unsigned int,double,Point,Blob,NSObject * {__strong},TString,TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>,TRef<__CFNumber const*,TRetainReleasePolicy<__CFNumber const*>>,TRef<__CFData const*,TRetainReleasePolicy<__CFData const*>>,TRef<__CFDictionary const*,TRetainReleasePolicy<__CFDictionary const*>>,TRef<__CFURL const*,TRetainReleasePolicy<__CFURL const*>>,TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>,TRef<__CFFileSecurity *,TRetainReleasePolicy<__CFFileSecurity *>>,TRef<TReferenceCounted *,TRetainReleasePolicy<TReferenceCounted *>>,Property,NodeRequestOptions,NodeDSStoreStatus,DSBladeRunnerFlags>::operator=[abi:ne180100]<NodeRequestOptions const&,0,NodeRequestOptions,21ul,0>(&buf, v28);
    TNode::RequestInternalTask(v26, 1000, &buf, 0);
    TPropertyValue::~TPropertyValue(&buf);
  }

}

- (void)collection:(id)a3 didEncounterError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  TNode *v9;
  _BOOL4 IsContextOpen;
  DSFPItemStatusObserver *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  TNode *v16;
  void *v17;
  _BOOL4 v18;
  TNode *v19;
  const TNode *v20;
  TPropertyValue v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogObj(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v21.fData.__impl_.__data.__tail.__tail.__tail.__tail.__head.__value = 138543618;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&v21.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 4) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v6;
    *((_WORD *)&v21.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 6) = 2112;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&v21.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 14) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v7;
    _os_log_impl(&dword_1CBC4A000, v8, OS_LOG_TYPE_ERROR, "collection didEncounterError: %{public}@: %@", (uint8_t *)&v21, 0x16u);
  }

  IsContextOpen = TNode::IsContextOpen(v9);
  v11 = self;
  objc_sync_enter(v11);
  objc_msgSend(v7, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  FileProviderErrorDomain((TString *)&v21);
  if (operator==((void **)&v21, v12))
  {
    v13 = objc_msgSend(v7, "code") == -2001;
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v21);

    if (v13)
    {
      objc_sync_exit(v11);

      goto LABEL_17;
    }
  }
  else
  {
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v21);

  }
  if (*((id *)v11 + 4) == v7)
  {
    IsContextOpen = 0;
  }
  else
  {
    v14 = objc_msgSend(v7, "copy");
    v15 = (void *)*((_QWORD *)v11 + 4);
    *((_QWORD *)v11 + 4) = v14;

  }
  objc_sync_exit(v11);

  if (TNode::IsContextOpen(v16))
  {
    objc_msgSend(v7, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    FileProviderInternalErrorDomain((TString *)&v21);
    if (operator==((void **)&v21, v17))
    {
      v18 = objc_msgSend(v7, "code") == 15;
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v21);

      if (v18)
      {
        v19 = (TNode *)TNodeFromFINode(*((FINode **)v11 + 1));
        TNode::ClearFPItems(v19);
        goto LABEL_17;
      }
    }
    else
    {
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v21);

    }
    if (IsContextOpen)
    {
      v20 = (const TNode *)TNodeFromFINode(*((FINode **)v11 + 1));
      memset(&v21, 0, sizeof(v21));
      TNode::RequestInternalTask(v20, 1028, &v21, 0);
      TPropertyValue::~TPropertyValue(&v21);
    }
  }
LABEL_17:

}

- (void)resetError
{
  DSFPItemStatusObserver *v2;
  void *v3;
  const TNode *v4;
  TPropertyValue v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)*((_QWORD *)v2 + 4);
  *((_QWORD *)v2 + 4) = 0;

  objc_sync_exit(v2);
  if (v3)
  {
    v4 = (const TNode *)TNodeFromFINode(*((FINode **)v2 + 1));
    memset(&v5, 0, sizeof(v5));
    TNode::RequestInternalTask(v4, 1028, &v5, 0);
    TPropertyValue::~TPropertyValue(&v5);
  }
}

- (id)fpError
{
  DSFPItemStatusObserver *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = *((id *)v2 + 4);
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 40));
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)self + 2);

}

@end
