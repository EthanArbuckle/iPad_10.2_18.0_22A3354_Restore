@implementation DSProvidersObserver

- (void)startObserving
{
  void *v3;
  FINode **v4;
  NSObject *v5;
  NSObject *token;
  TNode *v7;
  const TNode *v8;
  int v9;
  TPropertyValue v10;
  _QWORD v11[4];
  DSProvidersObserver *v12;

  if (!self->_token)
  {
    v3 = (void *)FPProviderDomainClass();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3321888768;
    v11[2] = __37__DSProvidersObserver_startObserving__block_invoke;
    v11[3] = &__block_descriptor_40_ea8_32c50_ZTSKZ37__DSProvidersObserver_startObserving_E3__6_e34_v24__0__NSDictionary_8__NSError_16l;
    v12 = self;
    v4 = v12;
    objc_msgSend(v3, "beginMonitoringProviderDomainChangesWithHandler:", v11);
    v5 = objc_claimAutoreleasedReturnValue();
    token = self->_token;
    self->_token = v5;

    if (TNode::IsContextOpen(v7))
    {
      v8 = (const TNode *)TNodeFromFINode(v4[1]);
      v9 = 0x800000;
      v10.fData.__impl_.__index = 0;
      std::variant<std::monostate,BOOL,unsigned char,short,int,long long,unsigned int,double,Point,Blob,NSObject * {__strong},TString,TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>,TRef<__CFNumber const*,TRetainReleasePolicy<__CFNumber const*>>,TRef<__CFData const*,TRetainReleasePolicy<__CFData const*>>,TRef<__CFDictionary const*,TRetainReleasePolicy<__CFDictionary const*>>,TRef<__CFURL const*,TRetainReleasePolicy<__CFURL const*>>,TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>,TRef<__CFFileSecurity *,TRetainReleasePolicy<__CFFileSecurity *>>,TRef<TReferenceCounted *,TRetainReleasePolicy<TReferenceCounted *>>,Property,NodeRequestOptions,NodeDSStoreStatus,DSBladeRunnerFlags>::operator=[abi:ne180100]<NodeRequestOptions const&,0,NodeRequestOptions,21ul,0>(&v10, &v9);
      TNode::RequestInternalTask(v8, 1000, &v10, 0);
      TPropertyValue::~TPropertyValue(&v10);
    }

  }
}

void __37__DSProvidersObserver_startObserving__block_invoke(uint64_t a1, void *a2, void *a3)
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
  if (v8)
  {
    LogObj(4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1CBC4A000, v9, OS_LOG_TYPE_ERROR, "-beginMonitoringProviderDomainChangesWithHandler: received an error: %{public}@", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "receivedChanges:", v7);
  }

}

- (void)receivedChanges:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  FPProviderDomain *v15;
  FPProviderDomain *v16;
  BOOL HaveEquivalentProperties;
  NSObject *v18;
  TNode *v19;
  _BOOL4 populated;
  int v21;
  TNode *v22;
  const TNode *v23;
  void *v24;
  void *v25;
  DSProvidersObserver *v26;
  void *v27;
  void *v28;
  id v29[17];
  id v30[17];
  _QWORD v31[17];
  TPropertyValue buf;
  _QWORD *v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = self;
  -[DSProvidersObserver providers](self, "providers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sortedArrayUsingSelector:", sel_compare_);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  IDContainerIteratorAdaptor<NSArray<NSString *>>::NSForwardIterator<NSArray<NSString *>>::NSForwardIterator((uint64_t)v30, v27);
  IDContainerIteratorAdaptor<NSArray<NSString *>>::IDContainerIteratorAdaptor((uint64_t)v29, -1, v27);
  v5 = std::distance[abi:ne180100]<IDContainerIteratorAdaptor<NSArray<NSString *>>>((uint64_t)v30, (uint64_t)v29);

  type_traits_extras::CopyAsHelper<NSMutableArray<FPProviderDomain *> * {__strong}>::MakeWithCapacity(v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  IDContainerIteratorAdaptor<NSArray<NSString *>>::NSForwardIterator<NSArray<NSString *>>::NSForwardIterator((uint64_t)&buf, v27);
  IDContainerIteratorAdaptor<NSArray<NSString *>>::IDContainerIteratorAdaptor((uint64_t)v31, -1, v27);
  v6 = v24;
  while (buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__head.__value != v31[0] || v37 != v31[16])
  {
    v7 = *(id *)(*(_QWORD *)&buf.fData.__impl_.__index + 8 * v36);
    objc_msgSend(v4, "objectForKeyedSubscript:", v7, v24);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "supportsEnumeration") & 1) == 0)
    {

LABEL_9:
      v8 = v7;
      goto LABEL_12;
    }
    +[FIProviderDomain providerDomainForDomain:](FIProviderDomain, "providerDomainForDomain:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isUsingFPFS") & 1) != 0)
    {
      objc_msgSend(v8, "storageURLs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count") == 0;

      if (v11)
        goto LABEL_9;
    }
    else
    {

    }
    v7 = v6;
    objc_msgSend(v7, "addObject:", v8);
LABEL_12:

    v12 = v36;
    if (v36 >= v35 - 1)
    {
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value, "countByEnumeratingWithState:objects:count:", &buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 1, v34, 4);
      v12 = -1;
      v35 = v13;
      v36 = -1;
    }
    if (v34[4] != *v33)
    {
      objc_enumerationMutation(buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value);
      v12 = v36;
    }
    v36 = v12 + 1;
    ++v37;
  }

  if (!objc_msgSend(v6, "isEqualToArray:", v28, v24))
    goto LABEL_23;
  if (objc_msgSend(v6, "count"))
  {
    v14 = 0;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v14);
      v15 = (FPProviderDomain *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", v14);
      v16 = (FPProviderDomain *)objc_claimAutoreleasedReturnValue();
      HaveEquivalentProperties = FileProviderDomainsHaveEquivalentProperties(v16, v15);

      if (!HaveEquivalentProperties)
        break;
      if (++v14 >= (unint64_t)objc_msgSend(v6, "count"))
        goto LABEL_32;
    }
LABEL_23:
    LogObj(4);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__head.__value = 138543362;
      *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 4) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v6;
      _os_log_impl(&dword_1CBC4A000, v18, OS_LOG_TYPE_DEFAULT, "Provider list update = %{public}@", (uint8_t *)&buf, 0xCu);
    }

    v19 = (TNode *)-[DSProvidersObserver setProviders:](self, "setProviders:", v6);
    populated = self->_populated;
    v26->_populated = 1;
    if (TNode::IsContextOpen(v19))
    {
      if (populated)
      {
        v21 = 0x1000000;
      }
      else
      {
        v22 = (TNode *)TNodeFromFINode(v26->fParentNode.fFINode);
        if (TNode::IsPopulated(v22))
          v21 = 0x1000000;
        else
          v21 = 20971520;
      }
      LODWORD(v31[0]) = v21;
      v23 = (const TNode *)TNodeFromFINode(v26->fParentNode.fFINode);
      buf.fData.__impl_.__index = 0;
      std::variant<std::monostate,BOOL,unsigned char,short,int,long long,unsigned int,double,Point,Blob,NSObject * {__strong},TString,TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>,TRef<__CFNumber const*,TRetainReleasePolicy<__CFNumber const*>>,TRef<__CFData const*,TRetainReleasePolicy<__CFData const*>>,TRef<__CFDictionary const*,TRetainReleasePolicy<__CFDictionary const*>>,TRef<__CFURL const*,TRetainReleasePolicy<__CFURL const*>>,TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>,TRef<__CFFileSecurity *,TRetainReleasePolicy<__CFFileSecurity *>>,TRef<TReferenceCounted *,TRetainReleasePolicy<TReferenceCounted *>>,Property,NodeRequestOptions,NodeDSStoreStatus,DSBladeRunnerFlags>::operator=[abi:ne180100]<NodeRequestOptions const&,0,NodeRequestOptions,21ul,0>(&buf, v31);
      TNode::RequestInternalTask(v23, 1000, &buf, 0);
      TPropertyValue::~TPropertyValue(&buf);
    }
  }
LABEL_32:

}

- (void)stopObserving
{
  NSObject *token;

  objc_msgSend((id)FPProviderDomainClass(), "endMonitoringProviderDomainChanges:", self->_token);
  token = self->_token;
  self->_token = 0;

}

- (id)providers
{
  DSProvidersObserver *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSArray copy](v2->_providers, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (void)setProviders:(id)a3
{
  id v4;
  DSProvidersObserver *v5;
  NSObject *v6;
  uint64_t v7;
  NSArray *providers;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[NSArray isEqualToArray:](v5->_providers, "isEqualToArray:", v4))
  {
    LogObj(4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1CBC4A000, v6, OS_LOG_TYPE_INFO, "FPProviders update: %{public}@", (uint8_t *)&v9, 0xCu);
    }

  }
  v7 = objc_msgSend(v4, "copy");
  providers = v5->_providers;
  v5->_providers = (NSArray *)v7;

  objc_sync_exit(v5);
}

- (id)providersByAddingProviderIfNeeded:(id)a3
{
  id v4;
  DSProvidersObserver *v5;
  NSArray *providers;
  uint64_t v7;
  NSArray *v8;
  uint64_t v9;
  NSArray *v10;
  NSArray *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4 && !v5->_populated && !-[NSArray containsObject:](v5->_providers, "containsObject:", v4))
  {
    providers = v5->_providers;
    if (providers)
    {
      -[NSArray arrayByAddingObject:](providers, "arrayByAddingObject:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v5->_providers;
      v5->_providers = (NSArray *)v7;

    }
    else
    {
      v13[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v5->_providers;
      v5->_providers = (NSArray *)v9;

    }
  }
  v11 = v5->_providers;
  objc_sync_exit(v5);

  return v11;
}

- (BOOL)populated
{
  return self->_populated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_token, 0);

}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
