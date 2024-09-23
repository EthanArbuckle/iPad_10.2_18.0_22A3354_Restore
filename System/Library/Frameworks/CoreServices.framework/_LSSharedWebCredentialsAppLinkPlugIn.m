@implementation _LSSharedWebCredentialsAppLinkPlugIn

- (_LSSharedWebCredentialsAppLinkPlugIn)init
{
  _LSSharedWebCredentialsAppLinkPlugIn *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_LSSharedWebCredentialsAppLinkPlugIn;
  v2 = -[_LSSharedWebCredentialsAppLinkPlugIn init](&v4, sel_init);
  if (v2 && !_LSIsSWCAvailable())
  {

    return 0;
  }
  return v2;
}

- (optional<LSBinding>)bindingWithContext:(SEL)a3 forServiceDetails:(LSContext *)a4 callingBundleIdentifier:(id)a5
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  LSBundleData *v20;
  optional<LSBinding> *result;
  void *v22;
  void *v23;
  uint64_t v24[6];
  char v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _OWORD v29[2];
  int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  retstr->var0.var0 = 0;
  retstr->var1 = 0;
  if (a4)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("LSAppLinkPlugIn.mm"), 501, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ctx != NULL"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("LSAppLinkPlugIn.mm"), 502, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceDetails != nil"));

LABEL_3:
  if (objc_msgSend(v11, "isApproved"))
  {
    objc_msgSend(v11, "serviceSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applicationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "serviceSpecifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "applicationIdentifierPrefix");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "serviceSpecifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 && (!v12 || objc_msgSend(v18, "caseInsensitiveCompare:", v12)))
    {
      if (objc_msgSend(v11, "isSystemPlaceholder"))
      {
        v19 = _LSFindBundleWithInfo(a4, 7uLL, v18, 0, 0, 0, 0);
        v20 = (LSBundleData *)_LSBundleGet(a4->db, v19);
        if (v20)
        {
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v34 = 0;
          v35 = 0;
          v33 = 0;
          std::optional<LSBinding>::operator=[abi:nn180100]<LSBinding,void>((uint64_t)retstr, (uint64_t)&v30);

          retstr->var0.var1.bundle = v19;
          retstr->var0.var1.bundleData = v20;
        }
      }
      else
      {
        memset(v29, 0, sizeof(v29));
        LaunchServices::BindingEvaluator::CreateWithBundleInfo((LaunchServices::BindingEvaluator *)v18, 0, 0, (LSVersionNumber *)1, v29, (uint64_t)&v30);
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __101___LSSharedWebCredentialsAppLinkPlugIn_bindingWithContext_forServiceDetails_callingBundleIdentifier___block_invoke;
        v26[3] = &unk_1E10416C8;
        v27 = v16;
        v28 = v14;
        LaunchServices::BindingEvaluator::setFilter_NoIO((uint64_t)&v30, CFSTR("universal links"), v26);
        LaunchServices::BindingEvaluator::getBestBinding((LaunchServices::BindingEvaluator *)&v30, v24);
        std::__optional_storage_base<LSBinding,false>::__assign_from[abi:nn180100]<std::__optional_move_assign_base<LSBinding,false>>((uint64_t)retstr, (uint64_t)v24);
        if (v25)
        {

        }
        LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)&v30);
      }
    }

  }
  return result;
}

- (void)enumerateBindingsWithContext:(LSContext *)a3 forSWCResults:(id)a4 block:(id)a5
{
  id v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t *v19;
  _BOOL4 v20;
  void *v21;
  void (**v22)(id, unsigned int *, _QWORD);
  id obj;
  unsigned int v24[8];
  id v25;
  id v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _OWORD v32[2];
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v22 = (void (**)(id, unsigned int *, _QWORD))a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSAppLinkPlugIn.mm"), 592, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("swcResults != nil"));

  }
  -[_LSAppLinkPlugIn state](self, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "includeLinksForCallingApplication");

  if ((v11 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    -[_LSSharedWebCredentialsAppLinkPlugIn callingBundleIdentifier](self, "callingBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  memset(v32, 0, sizeof(v32));
  v33 = 1065353216;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v13)
  {
    v14 = 0;
    v15 = *(_QWORD *)v29;
LABEL_8:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v15)
        objc_enumerationMutation(obj);
      v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v16);
      v18 = (void *)MEMORY[0x186DAE7A0]();
      -[_LSSharedWebCredentialsAppLinkPlugIn bindingWithContext:forServiceDetails:callingBundleIdentifier:](self, "bindingWithContext:forServiceDetails:callingBundleIdentifier:", a3, v17, v12);
      if (v27)
      {
        v19 = std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::find<unsigned int>(v32, v24);
        v20 = v19 == 0;
        if (!v19)
        {
          std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int &>((uint64_t)v32, v24, v24);
          if (!v27)
          {
            std::__throw_bad_optional_access[abi:nn180100]();
            __break(1u);
          }
          v22[2](v22, v24, v17);
          ++v14;
        }
        if (v27)
        {

        }
      }
      else
      {
        v20 = 1;
      }
      objc_autoreleasePoolPop(v18);
      if (!v20 || v14 >= -[_LSAppLinkPlugIn limit](self, "limit"))
        break;
      if (v13 == ++v16)
      {
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        if (v13)
          goto LABEL_8;
        break;
      }
    }
  }

  std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table((uint64_t)v32);
}

- (id)appLinksWithContext:(LSContext *)a3 forSWCResults:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  LSContext *v28;
  _QWORD v29[6];
  _QWORD v30[3];
  void **v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x4812000000;
  v29[3] = __Block_byref_object_copy__5;
  v29[4] = __Block_byref_object_dispose__5;
  v29[5] = "";
  memset(v30, 0, sizeof(v30));
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __74___LSSharedWebCredentialsAppLinkPlugIn_appLinksWithContext_forSWCResults___block_invoke;
  v25[3] = &unk_1E10416F0;
  v28 = a3;
  v25[4] = self;
  v8 = v7;
  v26 = v8;
  v27 = v29;
  -[_LSSharedWebCredentialsAppLinkPlugIn enumerateBindingsWithContext:forSWCResults:block:](self, "enumerateBindingsWithContext:forSWCResults:block:", a3, v6, v25);
  if (-[_LSAppLinkPlugIn limit](self, "limit") != -1 && (unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v32, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v15, "isEnabled"))
            v16 = v9;
          else
            v16 = v10;
          objc_msgSend(v16, "addObject:", v15);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v32, 16);
      }
      while (v12);
    }

    objc_msgSend(v11, "setArray:", v9);
    v17 = objc_msgSend(v9, "count");
    if (v17 < -[_LSAppLinkPlugIn limit](self, "limit"))
      objc_msgSend(v11, "addObjectsFromArray:", v10);

  }
  +[LSRecord resolveAllPropertiesOfRecords:count:andDetachOnQueue:](LSRecord, "resolveAllPropertiesOfRecords:count:andDetachOnQueue:");
  v18 = v26;
  v19 = v8;

  _Block_object_dispose(v29, 8);
  v31 = (void **)v30;
  std::vector<LSApplicationRecord * {__strong}>::__destroy_vector::operator()[abi:nn180100](&v31);

  return v19;
}

- (id)callingBundleIdentifier
{
  void *v2;
  void *v3;

  -[_LSAppLinkPlugIn state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)_LSCopyBundleIdentifierForAuditToken(objc_msgSend(v2, "auditToken"), 1);

  return v3;
}

- (id)appLinksWithContext:(LSContext *)a3 error:(id *)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _OWORD *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  __int128 v18;
  id *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void (**v25)(_QWORD);
  os_unfair_lock_s *v26;
  os_unfair_lock_s *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v32[4];
  void (**v33)(_QWORD);
  _QWORD v34[5];
  id v35;
  uint64_t *v36;
  LSContext *v37;
  uint64_t v38;
  uint64_t v39;
  _OWORD v40[2];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__126;
  v45 = __Block_byref_object_dispose__127;
  v46 = (id)MEMORY[0x1E0C9AA60];
  v7 = (void *)MEMORY[0x186DAE7A0](self, a2);
  v8 = objc_alloc((Class)_LSSWCServiceSpecifierClass());
  _LSSWCServiceTypeAppLinks();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSAppLinkPlugIn URLComponents](self, "URLComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithServiceType:applicationIdentifier:domain:", v9, 0, v11);

  -[_LSAppLinkPlugIn state](self, "state");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (_OWORD *)objc_msgSend(v13, "auditToken");

  if (v14 && (_LSSWCServiceDetailsClass(), (objc_opt_respondsToSelector() & 1) != 0))
  {
    v15 = (void *)_LSSWCServiceDetailsClass();
    -[_LSAppLinkPlugIn URLComponents](self, "URLComponents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[_LSAppLinkPlugIn limit](self, "limit");
    v18 = v14[1];
    v40[0] = *v14;
    v40[1] = v18;
    v39 = 0;
    v19 = (id *)&v39;
    objc_msgSend(v15, "serviceDetailsWithServiceSpecifier:URLComponents:limit:auditToken:error:", v12, v16, v17, v40, &v39);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = (void *)_LSSWCServiceDetailsClass();
    -[_LSAppLinkPlugIn URLComponents](self, "URLComponents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v19 = (id *)&v38;
    objc_msgSend(v21, "serviceDetailsWithServiceSpecifier:URLComponents:limit:error:", v12, v16, -[_LSAppLinkPlugIn limit](self, "limit"), &v38);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v20;
  v23 = *v19;

  if (objc_msgSend(v22, "count"))
  {
    v24 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __66___LSSharedWebCredentialsAppLinkPlugIn_appLinksWithContext_error___block_invoke;
    v34[3] = &unk_1E1041718;
    v36 = &v41;
    v37 = a3;
    v34[4] = self;
    v35 = v22;
    v25 = (void (**)(_QWORD))MEMORY[0x186DAE9BC](v34);
    if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
    {
      _LSServer_DatabaseExecutionContext();
      v26 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
      -[LSDBExecutionContext assertNotActiveForThisThread](v26);

      _LSServer_DatabaseExecutionContext();
      v27 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
      v32[0] = v24;
      v32[1] = 3221225472;
      v32[2] = __66___LSSharedWebCredentialsAppLinkPlugIn_appLinksWithContext_error___block_invoke_2;
      v32[3] = &unk_1E1041740;
      v33 = v25;
      -[LSDBExecutionContext syncRead:](v27, v32);

    }
    else
    {
      v25[2](v25);
    }

  }
  else if (v22)
  {
    v28 = (void *)v42[5];
    v42[5] = MEMORY[0x1E0C9AA60];

  }
  objc_autoreleasePoolPop(v7);
  v29 = (void *)v42[5];
  if (a4 && !v29)
  {
    *a4 = objc_retainAutorelease(v23);
    v29 = (void *)v42[5];
  }
  v30 = v29;

  _Block_object_dispose(&v41, 8);
  return v30;
}

@end
