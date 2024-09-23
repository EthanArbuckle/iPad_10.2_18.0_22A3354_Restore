@implementation _LSAvailableApplicationsForURLQuery

- (_LSAvailableApplicationsForURLQuery)initWithURL:(id)a3
{
  id v5;
  id *v6;
  _LSAvailableApplicationsForURLQuery *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_LSAvailableApplicationsForURLQuery;
  v6 = -[_LSQuery _init](&v9, sel__init);
  v7 = (_LSAvailableApplicationsForURLQuery *)v6;
  if (v6)
    objc_storeStrong(v6 + 2, a3);

  return v7;
}

- (void)yieldBundles:(const void *)a3 context:(LSContext *)a4 block:(id)a5
{
  unsigned int *v7;
  unsigned int *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t (**v12)(id, void *, _QWORD);

  v12 = (uint64_t (**)(id, void *, _QWORD))a5;
  v7 = *(unsigned int **)a3;
  v8 = (unsigned int *)*((_QWORD *)a3 + 1);
  if (*(unsigned int **)a3 != v8)
  {
    while (1)
    {
      v9 = *v7;
      v10 = (void *)MEMORY[0x186DAE7A0]();
      +[LSApplicationProxy applicationProxyWithBundleUnitID:withContext:](LSApplicationProxy, "applicationProxyWithBundleUnitID:withContext:", v9, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v10);
      if (v11)
      {
        if ((v12[2](v12, v11, 0) & 1) == 0)
          break;
      }

      if (++v7 == v8)
        goto LABEL_7;
    }

  }
LABEL_7:

}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _LSDServiceDomain *v13;
  LSContext *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  int v44;
  char *v45;
  int v46;
  char *v47;
  int v48;
  void **p_p;
  void **v50;
  _LSDServiceDomain *v51;
  uint64_t v52;
  id v53;
  NSObject *v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  char *v59;
  char *v60;
  void *__p;
  char *v62;
  char *v63;
  void *v64;
  char *v65;
  char *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  void **v70;
  id v71;
  char v72;
  id v73;
  uint64_t v74;
  const __CFString *v75;
  _BYTE v76[168];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  -[_LSAvailableApplicationsForURLQuery URL](self, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com-apple-audiounit")))
    {
      +[LSApplicationProxy applicationProxyForIdentifier:placeholder:](LSApplicationProxy, "applicationProxyForIdentifier:placeholder:", CFSTR("com.apple.audioUnit.temp"), 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v10, 0);

    }
    else
    {
      v73 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      +[_LSDServiceDomain defaultServiceDomain]();
      v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v14 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v70, v13, 0);

      if (v14)
      {
        +[_LSCanOpenURLManager bindingEvaluatorForScheme:](_LSCanOpenURLManager, "bindingEvaluatorForScheme:", v9);
        v67 = 0;
        LaunchServices::BindingEvaluator::evaluateBindings((LaunchServices::BindingEvaluator *)v76, v14, &v67, &v68);
        v15 = v67;
        v16 = v15;
        v18 = v68;
        v17 = v69;
        if (v68 == v69)
        {
          if (_LSGetOSStatusFromNSError(v15) == -10814)
          {
            _LSDefaultLog();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
              -[_LSAvailableApplicationsForURLQuery _enumerateWithXPCConnection:block:].cold.1((uint64_t)v9, v54);

          }
          else
          {
            ((void (**)(id, void *, void *))v7)[2](v7, 0, v16);
          }
        }
        else
        {
          v64 = 0;
          v65 = 0;
          v66 = 0;
          v57 = v15;
          __p = 0;
          v62 = 0;
          v63 = 0;
          v58 = 0;
          v59 = 0;
          v60 = 0;
          do
          {
            if (*(_DWORD *)(*(_QWORD *)(v18 + 8) + 168) == 14)
            {
              v19 = v62;
              if (v62 >= v63)
              {
                v23 = (char *)__p;
                v24 = (v62 - (_BYTE *)__p) >> 2;
                v25 = v24 + 1;
                if ((unint64_t)(v24 + 1) >> 62)
                  goto LABEL_88;
                v26 = v63 - (_BYTE *)__p;
                if ((v63 - (_BYTE *)__p) >> 1 > v25)
                  v25 = v26 >> 1;
                if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL)
                  v27 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v27 = v25;
                if (v27)
                {
                  v28 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&v63, v27);
                  v23 = (char *)__p;
                  v19 = v62;
                }
                else
                {
                  v28 = 0;
                }
                v43 = &v28[4 * v24];
                *(_DWORD *)v43 = *(_DWORD *)v18;
                v20 = v43 + 4;
                while (v19 != v23)
                {
                  v44 = *((_DWORD *)v19 - 1);
                  v19 -= 4;
                  *((_DWORD *)v43 - 1) = v44;
                  v43 -= 4;
                }
                __p = v43;
                v62 = v20;
                v63 = &v28[4 * v27];
                if (v23)
                  operator delete(v23);
              }
              else
              {
                *(_DWORD *)v62 = *(_DWORD *)v18;
                v20 = v19 + 4;
              }
              v62 = v20;
            }
            else if (__p == v62)
            {
              v29 = v65;
              if (v65 >= v66)
              {
                v37 = (char *)v64;
                v38 = (v65 - (_BYTE *)v64) >> 2;
                v39 = v38 + 1;
                if ((unint64_t)(v38 + 1) >> 62)
LABEL_88:
                  abort();
                v40 = v66 - (_BYTE *)v64;
                if ((v66 - (_BYTE *)v64) >> 1 > v39)
                  v39 = v40 >> 1;
                if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFFCLL)
                  v41 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v41 = v39;
                if (v41)
                {
                  v42 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&v66, v41);
                  v37 = (char *)v64;
                  v29 = v65;
                }
                else
                {
                  v42 = 0;
                }
                v47 = &v42[4 * v38];
                *(_DWORD *)v47 = *(_DWORD *)v18;
                v30 = v47 + 4;
                while (v29 != v37)
                {
                  v48 = *((_DWORD *)v29 - 1);
                  v29 -= 4;
                  *((_DWORD *)v47 - 1) = v48;
                  v47 -= 4;
                }
                v64 = v47;
                v65 = v30;
                v66 = &v42[4 * v41];
                if (v37)
                  operator delete(v37);
              }
              else
              {
                *(_DWORD *)v65 = *(_DWORD *)v18;
                v30 = v29 + 4;
              }
              v65 = v30;
            }
            else
            {
              v21 = v59;
              if (v59 >= v60)
              {
                v31 = (char *)v58;
                v32 = (v59 - (_BYTE *)v58) >> 2;
                v33 = v32 + 1;
                if ((unint64_t)(v32 + 1) >> 62)
                  goto LABEL_88;
                v34 = v60 - (_BYTE *)v58;
                if ((v60 - (_BYTE *)v58) >> 1 > v33)
                  v33 = v34 >> 1;
                if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFFCLL)
                  v35 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v35 = v33;
                if (v35)
                {
                  v36 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&v60, v35);
                  v31 = (char *)v58;
                  v21 = v59;
                }
                else
                {
                  v36 = 0;
                }
                v45 = &v36[4 * v32];
                *(_DWORD *)v45 = *(_DWORD *)v18;
                v22 = v45 + 4;
                while (v21 != v31)
                {
                  v46 = *((_DWORD *)v21 - 1);
                  v21 -= 4;
                  *((_DWORD *)v45 - 1) = v46;
                  v45 -= 4;
                }
                v58 = v45;
                v59 = v22;
                v60 = &v36[4 * v35];
                if (v31)
                  operator delete(v31);
              }
              else
              {
                *(_DWORD *)v59 = *(_DWORD *)v18;
                v22 = v21 + 4;
              }
              v59 = v22;
            }
            v18 += 48;
          }
          while (v18 != v17);
          p_p = &__p;
          if (__p == v62)
            p_p = &v58;
          if (v64 == v65)
            v50 = p_p;
          else
            v50 = &v64;
          -[_LSAvailableApplicationsForURLQuery yieldBundles:context:block:](self, "yieldBundles:context:block:", v50, v14, v7);
          v16 = v57;
          if (v58)
          {
            v59 = (char *)v58;
            operator delete(v58);
          }
          if (__p)
          {
            v62 = (char *)__p;
            operator delete(__p);
          }
          if (v64)
          {
            v65 = (char *)v64;
            operator delete(v64);
          }
        }
        v64 = &v68;
        std::vector<LSBinding>::__destroy_vector::operator()[abi:nn180100]((void ***)&v64);

        LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v76);
      }
      else
      {
        +[_LSDServiceDomain defaultServiceDomain]();
        v51 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
        v52 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v70, v51, 0);

        if (v52)
          v53 = 0;
        else
          v53 = v73;
        ((void (**)(id, void *, id))v7)[2](v7, 0, v53);

      }
      if (v70 && v72)
        _LSContextDestroy(v70);
      v55 = v71;
      v70 = 0;
      v71 = 0;

      v72 = 0;
      v56 = v73;
      v73 = 0;

    }
  }
  else
  {
    v74 = *MEMORY[0x1E0CB2938];
    v75 = CFSTR("invalid URL or scheme");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSAvailableApplicationsForURLQuery _enumerateWithXPCConnection:block:]", 666, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v12);

  }
}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_LSAvailableApplicationsForURLQuery;
  -[_LSQuery encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_URL, CFSTR("URL"));

}

- (_LSAvailableApplicationsForURLQuery)initWithCoder:(id)a3
{
  id v4;
  _LSAvailableApplicationsForURLQuery *v5;
  uint64_t v6;
  NSURL *URL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_LSAvailableApplicationsForURLQuery;
  v5 = -[_LSQuery initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v6 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

  }
  return v5;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)_enumerateWithXPCConnection:(uint64_t)a1 block:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_debug_impl(&dword_182882000, a2, OS_LOG_TYPE_DEBUG, "No bindings found for scheme %{private}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
