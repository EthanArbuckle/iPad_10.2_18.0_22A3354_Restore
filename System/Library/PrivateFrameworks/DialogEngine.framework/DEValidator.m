@implementation DEValidator

- (id)jsonToResult:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  void *v10;
  NSArray *v11;
  void *v12;
  id v14;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  v6 = (void *)objc_opt_new();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("status"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStatus:", v8);

    objc_msgSend(v4, "valueForKey:", CFSTR("errors"));
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    DictionaryToValidationResult(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setErrors:", v10);

    objc_msgSend(v4, "objectForKey:", CFSTR("warnings"));
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    DictionaryToValidationResult(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWarnings:", v12);

  }
  else
  {
    objc_msgSend(v6, "setStatus:", DEValidationResultStatusError);
  }

  return v7;
}

- (id)validateString:(id)a3 localeString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _OWORD *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  char *v14;
  id v15;
  char *v16;
  id v17;
  char *v18;
  void *v19;
  void *v20;
  void *__p[2];
  char v23;
  void *v24[2];
  char v25;
  __int128 v26;
  uint64_t *v27;
  _QWORD *v28[2];
  void **v29;

  v6 = a3;
  v7 = a4;
  v28[0] = 0;
  v28[1] = 0;
  v27 = (uint64_t *)v28;
  -[DEValidator templateDir](self, "templateDir");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DEValidator templateDir](self, "templateDir");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v24, (char *)objc_msgSend(v9, "UTF8String"));
    siri::dialogengine::CreateJSONStringVal((uint64_t)v24, (uint64_t *)&v26);
    std::string::basic_string[abi:ne180100]<0>(__p, "templateDir");
    v29 = __p;
    v10 = std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v27, (const void **)__p, (_OWORD **)&v29);
    std::shared_ptr<siri::dialogengine::JSONValue>::operator=[abi:ne180100]((uint64_t)v10 + 56, &v26);
    if (v23 < 0)
      operator delete(__p[0]);
    v11 = (std::__shared_weak_count *)*((_QWORD *)&v26 + 1);
    if (*((_QWORD *)&v26 + 1))
    {
      v12 = (unint64_t *)(*((_QWORD *)&v26 + 1) + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    if (v25 < 0)
      operator delete(v24[0]);

  }
  siri::dialogengine::ConstructJSONString(&v27, v24);
  if (v25 >= 0)
    v14 = (char *)v24;
  else
    v14 = (char *)v24[0];
  v15 = objc_retainAutorelease(v6);
  v16 = (char *)objc_msgSend(v15, "UTF8String");
  v17 = objc_retainAutorelease(v7);
  v18 = CATValidateWithStrings(v14, v16, (char *)objc_msgSend(v17, "UTF8String"));
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    free(v18);
    -[DEValidator jsonToResult:](self, "jsonToResult:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }
  if (v25 < 0)
    operator delete(v24[0]);
  std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy(v28[0]);

  return v20;
}

- (id)validateFile:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _OWORD *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  _OWORD *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _OWORD *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  char *v22;
  char *v23;
  void *v24;
  void *v25;
  void *__p[2];
  char v28;
  void *v29[2];
  char v30;
  __int128 v31;
  uint64_t *v32;
  _QWORD *v33[2];
  void **v34;

  v6 = a3;
  v7 = a4;
  v33[0] = 0;
  v33[1] = 0;
  v32 = (uint64_t *)v33;
  -[DEValidator templateDir](self, "templateDir");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DEValidator templateDir](self, "templateDir");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v29, (char *)objc_msgSend(v9, "UTF8String"));
    siri::dialogengine::CreateJSONStringVal((uint64_t)v29, (uint64_t *)&v31);
    std::string::basic_string[abi:ne180100]<0>(__p, "templateDir");
    v34 = __p;
    v10 = std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v32, (const void **)__p, (_OWORD **)&v34);
    std::shared_ptr<siri::dialogengine::JSONValue>::operator=[abi:ne180100]((uint64_t)v10 + 56, &v31);
    if (v28 < 0)
      operator delete(__p[0]);
    v11 = (std::__shared_weak_count *)*((_QWORD *)&v31 + 1);
    if (*((_QWORD *)&v31 + 1))
    {
      v12 = (unint64_t *)(*((_QWORD *)&v31 + 1) + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    if (v30 < 0)
      operator delete(v29[0]);

  }
  if (!v6)
    goto LABEL_21;
  std::string::basic_string[abi:ne180100]<0>(v29, (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
  siri::dialogengine::CreateJSONStringVal((uint64_t)v29, (uint64_t *)&v31);
  std::string::basic_string[abi:ne180100]<0>(__p, "catId");
  v34 = __p;
  v14 = std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v32, (const void **)__p, (_OWORD **)&v34);
  std::shared_ptr<siri::dialogengine::JSONValue>::operator=[abi:ne180100]((uint64_t)v14 + 56, &v31);
  if (v28 < 0)
    operator delete(__p[0]);
  v15 = (std::__shared_weak_count *)*((_QWORD *)&v31 + 1);
  if (*((_QWORD *)&v31 + 1))
  {
    v16 = (unint64_t *)(*((_QWORD *)&v31 + 1) + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  if (v30 < 0)
  {
    operator delete(v29[0]);
    if (!v7)
      goto LABEL_32;
  }
  else
  {
LABEL_21:
    if (!v7)
      goto LABEL_32;
  }
  std::string::basic_string[abi:ne180100]<0>(v29, (char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
  siri::dialogengine::CreateJSONStringVal((uint64_t)v29, (uint64_t *)&v31);
  std::string::basic_string[abi:ne180100]<0>(__p, "locale");
  v34 = __p;
  v18 = std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v32, (const void **)__p, (_OWORD **)&v34);
  std::shared_ptr<siri::dialogengine::JSONValue>::operator=[abi:ne180100]((uint64_t)v18 + 56, &v31);
  if (v28 < 0)
    operator delete(__p[0]);
  v19 = (std::__shared_weak_count *)*((_QWORD *)&v31 + 1);
  if (*((_QWORD *)&v31 + 1))
  {
    v20 = (unint64_t *)(*((_QWORD *)&v31 + 1) + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if (v30 < 0)
    operator delete(v29[0]);
LABEL_32:
  siri::dialogengine::ConstructJSONString(&v32, v29);
  if (v30 >= 0)
    v22 = (char *)v29;
  else
    v22 = (char *)v29[0];
  v23 = CATValidateWithStrings(v22, 0, 0);
  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    free(v23);
    -[DEValidator jsonToResult:](self, "jsonToResult:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = 0;
  }
  if (v30 < 0)
    operator delete(v29[0]);
  std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy(v33[0]);

  return v25;
}

- (id)validate:(id)a3 locale:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  char *v10;
  id v11;
  char *v12;
  id v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v30;
  void *v31;
  id v32;
  __CFString *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v35 = a4;
  -[DEValidator templateDir](self, "templateDir");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[DEValidator templateDir](self, "templateDir");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("{ \"templateDir\": \"%@\" }"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("{}");
  }
  v33 = objc_retainAutorelease(v9);
  v10 = (char *)-[__CFString UTF8String](v33, "UTF8String");
  v11 = objc_retainAutorelease(v34);
  v12 = (char *)objc_msgSend(v11, "UTF8String");
  v13 = objc_retainAutorelease(v35);
  v14 = CATValidateWithStrings(v10, v12, (char *)objc_msgSend(v13, "UTF8String"));
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    free(v14);
    v30 = v15;
    objc_msgSend(v15, "dataUsingEncoding:", 4);
    v46 = 0;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v37 = (id)objc_opt_new();
    if (v36)
    {
      objc_msgSend(v36, "valueForKey:", CFSTR("status"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setStatus:", v16);

      v17 = (void *)objc_opt_new();
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      objc_msgSend(v36, "valueForKey:", CFSTR("errors"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v43 != v20)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "objectForKey:", CFSTR("textWithLineNumber"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v22);

          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        }
        while (v19);
      }

      objc_msgSend(v37, "setErrors:", v17);
      v23 = (void *)objc_opt_new();
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v36, "valueForKey:", CFSTR("warnings"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v39 != v26)
              objc_enumerationMutation(v24);
            objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "objectForKey:", CFSTR("textWithLineNumber"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v28);

          }
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        }
        while (v25);
      }

      objc_msgSend(v37, "setWarnings:", v23);
    }
    else
    {
      objc_msgSend(v37, "setStatus:", DEValidationResultStatusError);
    }

  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (id)validateWithParams:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  char *v13;
  id v14;
  char *v15;
  id v16;
  char *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  -[DEValidator templateDir](self, "templateDir");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[DEValidator templateDir](self, "templateDir");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("{ \"templateDir\": \"%@\" }"), v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = CFSTR("{}");
  }
  v12 = objc_retainAutorelease(v11);
  v13 = (char *)-[__CFString UTF8String](v12, "UTF8String");
  v14 = objc_retainAutorelease(v6);
  v15 = (char *)objc_msgSend(v14, "UTF8String");
  v16 = objc_retainAutorelease(v7);
  v17 = CATValidateWithStrings(v13, v15, (char *)objc_msgSend(v16, "UTF8String"));
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    free(v17);
    v17 = -[DEResult initFromJson:]([DEResult alloc], "initFromJson:", v18);

  }
  return v17;
}

- (NSString)templateDir
{
  return self->_templateDir;
}

- (void)setTemplateDir:(id)a3
{
  objc_storeStrong((id *)&self->_templateDir, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateDir, 0);
}

@end
