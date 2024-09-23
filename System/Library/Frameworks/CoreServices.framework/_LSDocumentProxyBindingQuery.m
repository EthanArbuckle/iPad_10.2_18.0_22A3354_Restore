@implementation _LSDocumentProxyBindingQuery

- (_LSDocumentProxyBindingQuery)initWithDocumentProxy:(id)a3 style:(unsigned __int8)a4 handlerRank:(id)a5
{
  id v9;
  id v10;
  id *v11;
  id *v12;
  uint64_t v13;
  id v14;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_LSDocumentProxyBindingQuery;
  v11 = -[_LSQuery _init](&v16, sel__init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(v11 + 2, a3);
    *((_BYTE *)v12 + 10) = a4;
    v13 = objc_msgSend(v10, "copy");
    v14 = v12[3];
    v12[3] = (id)v13;

  }
  return (_LSDocumentProxyBindingQuery *)v12;
}

- (void)filterOpenRestrictedBindings:(void *)a3 connection:(id)a4 context:(LSContext *)a5 earlyYield:(id)a6
{
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void (**v30)(id, _QWORD, void *);
  _QWORD v31[4];
  id v32;
  LSContext *v33;
  _OWORD v34[2];
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v30 = (void (**)(id, _QWORD, void *))a6;
  -[_LSDocumentProxyBindingQuery documentProxy](self, "documentProxy");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (_QWORD *)objc_msgSend(v11, "sourceAuditToken");

  if (v10
    && (memset(v34, 0, sizeof(v34)), objc_msgSend(v10, "auditToken"), !_LSAuditTokensAreEqual(v12, v34))
    && (objc_msgSend(v10, "_xpcConnection"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = _LSCheckEntitlementForXPCConnection(v13, CFSTR("com.apple.private.launchservices.canspecifymanageddocumentsource")) == 0, v13, v14))
  {
    std::vector<LSBinding>::__base_destruct_at_end[abi:nn180100]((uint64_t)a3, *(_QWORD *)a3);
    v35 = *MEMORY[0x1E0CB2938];
    v36[0] = CFSTR("missing entitlement");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDocumentProxyBindingQuery filterOpenRestrictedBindings:connection:context:earlyYield:]", 754, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2](v30, 0, v29);

  }
  else
  {
    v15 = (void *)_LSCopyBundleIdentifierForAuditToken((uint64_t)v12, 1);
    if (v15)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4));
      v17 = *(_QWORD *)a3;
      v18 = *((_QWORD *)a3 + 1);
      if (*(_QWORD *)a3 != v18)
      {
        do
        {
          v19 = (void *)_CSStringCopyCFString();
          if (v19)
            objc_msgSend(v16, "addObject:", v19);

          v17 += 48;
        }
        while (v17 != v18);
      }
      +[LSApplicationRestrictionsManager sharedInstance]();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LSDocumentProxyBindingQuery documentProxy](self, "documentProxy");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[LSApplicationRestrictionsManager allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:originatingAppBundleID:originatingAccountIsManaged:](v20, v16, v15, objc_msgSend(v21, "isContentManaged"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = *(_QWORD *)a3;
      v24 = *((_QWORD *)a3 + 1);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __91___LSDocumentProxyBindingQuery_filterOpenRestrictedBindings_connection_context_earlyYield___block_invoke;
      v31[3] = &unk_1E1043A88;
      v33 = a5;
      v25 = v22;
      v32 = v25;
      v26 = std::remove_if[abi:nn180100]<std::__wrap_iter<LSBinding *>,BOOL({block_pointer} {__strong})(LSBinding const&)>(v23, v24, v31);
      std::vector<LSBinding>::erase((uint64_t)a3, v26, *((_QWORD *)a3 + 1));

    }
    else
    {
      _LSDefaultLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[_LSDocumentProxyBindingQuery filterOpenRestrictedBindings:connection:context:earlyYield:].cold.1(v27);

    }
  }

}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  __int16 v4;
  void (**v7)(id, _QWORD, id);
  const __CFString *v8;
  __CFString *v9;
  __int16 v10;
  unsigned __int8 v11;
  int v12;
  int v13;
  _BOOL4 v14;
  _LSDServiceDomain *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  _LSDServiceDomain *v20;
  LSContext *v21;
  __int128 *v22;
  int v23;
  unsigned __int16 v24;
  BOOL v25;
  int v26;
  int Options;
  void **v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  unsigned int *i;
  unsigned int *v34;
  void *v35;
  LSClaimBinding *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  _OWORD v43[2];
  int v44;
  id v45;
  id v46;
  unsigned int *v47;
  unsigned int *v48;
  id v49;
  _QWORD v50[4];
  int v51;
  __int128 v52;
  __int128 v53;
  void **v54;
  id v55;
  char v56;
  id v57;
  _OWORD v58[10];
  char v59;
  uint64_t v60;
  _QWORD v61[4];

  v61[1] = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  -[_LSDocumentProxyBindingQuery handlerRank](self, "handlerRank");
  v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  v9 = (__CFString *)v8;
  if (v8)
  {
    v10 = _LSNumericHandlerRankFromHandlerRankString(v8);
    v11 = v10;
    v4 = HIBYTE(v10);
    v12 = 0x10000;
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }

  -[_LSDocumentProxyBindingQuery documentProxy](self, "documentProxy");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v13 = -[_LSDocumentProxyBindingQuery style](self, "style");
    v14 = -[_LSDocumentProxyBindingQuery yieldClaimBindings](self, "yieldClaimBindings");
    v57 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    if (LaunchServices::Database::Context::status((id *)&v54))
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v16 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v54, v15, 0);

      if (v16)
        v17 = 0;
      else
        v17 = v57;
      v7[2](v7, 0, v17);

    }
    else
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v20 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v21 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v54, v20, 0);

      v52 = 0u;
      v53 = 0u;
      if (v42)
      {
        objc_msgSend(v42, "auditToken");
        v52 = v58[0];
        v53 = v58[1];
        v22 = &v52;
      }
      else
      {
        v22 = 0;
      }
      objc_msgSend(v41, "_bindingEvaluatorWithAuditToken:", v22, v41);
      if (v13 == 1)
        v23 = 320;
      else
        v23 = 0;
      if (v13 == 2)
        v23 = 12320;
      v24 = v11 | (unsigned __int16)(v4 << 8);
      if (v24)
        v25 = 1;
      else
        v25 = v9 == 0;
      if (!v25)
        v23 |= 0x1000u;
      v26 = v23 | 0x2020;
      if (v23 | 0x2020)
      {
        Options = LaunchServices::BindingEvaluator::getOptions((LaunchServices::BindingEvaluator *)v58);
        LaunchServices::BindingEvaluator::setOptions((uint64_t)v58, Options | v26);
      }
      if (v9)
      {
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __66___LSDocumentProxyBindingQuery__enumerateWithXPCConnection_block___block_invoke;
        v50[3] = &__block_descriptor_36_e60_B24__0__LSContext___8r__LSBinding_I__LSBundleData_I_______16l;
        v51 = v12 | v24;
        LaunchServices::BindingEvaluator::setFilter_NoIO((uint64_t)v58, CFSTR("handler rank"), v50);
      }
      v49 = 0;
      if (v14)
        v28 = &v49;
      else
        v28 = 0;
      v46 = 0;
      LaunchServices::BindingEvaluator::evaluateBindings((LaunchServices::BindingEvaluator *)v58, v21, v28, &v46, (uint64_t *)&v47);
      v29 = v46;
      v30 = v29;
      if (v47 == v48 && _LSGetOSStatusFromNSError(v29) != -10814)
      {
        v7[2](v7, 0, v30);
      }
      else
      {
        +[LSApplicationRestrictionsManager sharedInstance]();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[LSApplicationRestrictionsManager isOpenInRestrictionInEffect](v31);

        if (v32)
          -[_LSDocumentProxyBindingQuery filterOpenRestrictedBindings:connection:context:earlyYield:](self, "filterOpenRestrictedBindings:connection:context:earlyYield:", &v47, v42, v21, v7);
        v45 = 0;
        memset(v43, 0, sizeof(v43));
        v44 = 1065353216;
        v34 = v47;
        for (i = v48; v34 != i; v34 += 12)
        {
          if (!std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::find<unsigned int>(v43, v34))
          {
            v35 = (void *)MEMORY[0x186DAE7A0]();
            if (v14)
            {
              v36 = [LSClaimBinding alloc];
              v37 = -[LSClaimBinding _initWithContext:binding:coreTypesBundleRecord:typeRecord:error:](v36, "_initWithContext:binding:coreTypesBundleRecord:typeRecord:error:", v21, v34, &v45, v49, 0);
            }
            else
            {
              +[LSApplicationProxy applicationProxyWithBundleUnitID:withContext:](LSApplicationProxy, "applicationProxyWithBundleUnitID:withContext:", *v34, v21);
              v37 = objc_claimAutoreleasedReturnValue();
            }
            v38 = (void *)v37;
            objc_autoreleasePoolPop(v35);
            std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int &>((uint64_t)v43, v34, v34);
            if (v38 && !((unsigned int (*)(id, void *, _QWORD))v7[2])(v7, v38, 0))
            {

              break;
            }

          }
        }
        std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table((uint64_t)v43);

      }
      *(_QWORD *)&v43[0] = &v47;
      std::vector<LSBinding>::__destroy_vector::operator()[abi:nn180100]((void ***)v43);

      if (v59)
        LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v58);
    }
    if (v54 && v56)
      _LSContextDestroy(v54);
    v39 = v55;
    v54 = 0;
    v55 = 0;

    v56 = 0;
    v40 = v57;
    v57 = 0;

  }
  else
  {
    v60 = *MEMORY[0x1E0CB2938];
    v61[0] = CFSTR("documentProxy");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDocumentProxyBindingQuery _enumerateWithXPCConnection:block:]", 810, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v19);

  }
}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LSDocumentProxyBindingQuery;
  if (-[_LSQuery isEqual:](&v13, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "documentProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSDocumentProxyBindingQuery documentProxy](self, "documentProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6)
      && (v7 = objc_msgSend(v4, "style"), v7 == -[_LSDocumentProxyBindingQuery style](self, "style")))
    {
      objc_msgSend(v4, "handlerRank");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LSDocumentProxyBindingQuery handlerRank](self, "handlerRank");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v9))
      {
        v10 = objc_msgSend(v4, "yieldClaimBindings");
        v11 = v10 ^ -[_LSDocumentProxyBindingQuery yieldClaimBindings](self, "yieldClaimBindings") ^ 1;
      }
      else
      {
        LOBYTE(v11) = 0;
      }

    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  -[_LSDocumentProxyBindingQuery documentProxy](self, "documentProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[_LSDocumentProxyBindingQuery style](self, "style");
  -[_LSDocumentProxyBindingQuery handlerRank](self, "handlerRank");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 ^ objc_msgSend(v6, "hash") ^ v5;

  v8 = v7 ^ (-[_LSDocumentProxyBindingQuery yieldClaimBindings](self, "yieldClaimBindings") << 63 >> 63);
  v10.receiver = self;
  v10.super_class = (Class)_LSDocumentProxyBindingQuery;
  return v8 ^ -[_LSQuery hash](&v10, sel_hash);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_LSDocumentProxyBindingQuery documentProxy](self, "documentProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("documentProxy"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[_LSDocumentProxyBindingQuery style](self, "style"), CFSTR("style"));
  -[_LSDocumentProxyBindingQuery handlerRank](self, "handlerRank");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("handlerRank"));

  objc_msgSend(v6, "encodeBool:forKey:", -[_LSDocumentProxyBindingQuery yieldClaimBindings](self, "yieldClaimBindings"), CFSTR("yieldClaimBindings"));
}

- (_LSDocumentProxyBindingQuery)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  _LSDocumentProxyBindingQuery *v8;

  v4 = a3;
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentProxy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handlerRank"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_LSDocumentProxyBindingQuery initWithDocumentProxy:style:handlerRank:](self, "initWithDocumentProxy:style:handlerRank:", v5, v6, v7);
  if (v8)
    -[_LSDocumentProxyBindingQuery setYieldClaimBindings:](v8, "setYieldClaimBindings:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("yieldClaimBindings")));

  return v8;
}

- (BOOL)yieldClaimBindings
{
  return *(&self->super._legacy + 1);
}

- (void)setYieldClaimBindings:(BOOL)a3
{
  *(&self->super._legacy + 1) = a3;
}

- (LSDocumentProxy)documentProxy
{
  return *(LSDocumentProxy **)&self->_yieldClaimBindings;
}

- (unsigned)style
{
  return *(&self->super._legacy + 2);
}

- (NSString)handlerRank
{
  return (NSString *)&self->_documentProxy->super.super.super.isa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentProxy, 0);
  objc_storeStrong((id *)&self->_yieldClaimBindings, 0);
}

- (void)filterOpenRestrictedBindings:(os_log_t)log connection:context:earlyYield:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "Open restriction in effect, but caller has no bundle ID.", v1, 2u);
}

@end
