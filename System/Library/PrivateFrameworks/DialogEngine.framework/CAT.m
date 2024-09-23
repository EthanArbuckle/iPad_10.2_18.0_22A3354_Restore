@implementation CAT

+ (void)preload
{
  +[DEExecutor preload](DEExecutor, "preload");
}

+ (void)execute:(id)a3 catId:(id)a4 parameters:(id)a5 globals:(id)a6 callback:(id)a7 options:(int)a8 completion:(id)a9
{
  id v9;

  v9 = CATExecutor(a3, 0, a4, 0, 0, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, a9);
}

+ (void)execute:(id)a3 catId:(id)a4 parameters:(id)a5 globals:(id)a6 callback:(id)a7 completion:(id)a8
{
  id v8;

  v8 = CATExecutor(a3, 0, a4, 0, 0, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, 0, a8);
}

+ (void)execute:(id)a3 catId:(id)a4 parameters:(id)a5 globals:(id)a6 completion:(id)a7
{
  id v7;

  v7 = CATExecutor(a3, 0, a4, 0, 0, (uint64_t)a5, (uint64_t)a6, 0, 0, a7);
}

+ (void)execute:(id)a3 paramsXML:(id)a4 localeXML:(id)a5 parameters:(id)a6 globals:(id)a7 callback:(id)a8 options:(int)a9 completion:(id)a10
{
  id v10;

  v10 = CATExecutor(a3, 0, 0, a4, a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, a9, a10);
}

+ (void)execute:(id)a3 templateDir:(id)a4 catId:(id)a5 parameters:(id)a6 globals:(id)a7 callback:(id)a8 options:(int)a9 completion:(id)a10
{
  id v10;

  v10 = CATExecutor(0, (uint64_t)a4, a5, 0, 0, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, a9, a10);
}

+ (id)execute:(id)a3 templateDir:(id)a4 catId:(id)a5 parameters:(id)a6 globals:(id)a7 callback:(id)a8 options:(int)a9
{
  CATExecutor(a3, (uint64_t)a4, a5, 0, 0, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, a9, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)evaluate:(id)a3 propName:(id)a4 parameters:(id)a5 globals:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_new();
  if (v12)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("locale"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v13, "setLocale:", v14);
  if (v12)
  {

    objc_msgSend(v12, "objectForKey:", CFSTR("globalParameters"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v13, "setGlobalParameters:", v15);
  if (v12)

  objc_msgSend(v13, "setParameters:", v11);
  objc_msgSend(v13, "setTypeName:", v9);
  objc_msgSend(v13, "setPropName:", v10);
  objc_msgSend(v13, "evaluate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)resolve:(id)a3 propName:(id)a4 parameters:(id)a5 completion:(id)a6
{
  id v8;
  std::string *v9;
  __int128 v10;
  std::string *v11;
  __int128 v12;
  std::string *v13;
  __int128 v14;
  void **v15;
  std::string *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  std::string v47;
  std::string v48;
  std::string v49;
  void *__p[2];
  int64_t v51;
  void *v52;
  char v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v34 = a4;
  v37 = a5;
  v32 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(&v52, (char *)objc_msgSend(v32, "UTF8String"));
  std::operator+<char>();
  v9 = std::string::append(&v49, "\"/></parameters></cat>");
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v51 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v49.__r_.__value_.__l.__data_);
  v36 = objc_retainAutorelease(v34);
  std::string::basic_string[abi:ne180100]<0>(&v48, (char *)objc_msgSend(v36, "UTF8String"));
  v11 = std::string::insert(&v48, 0, "value.");
  v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v49.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v49.__r_.__value_.__l.__data_ = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v48.__r_.__value_.__l.__data_);
  std::operator+<char>();
  v13 = std::string::append(&v47, "\"/></dialog></all></cat>");
  v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  v48.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v48.__r_.__value_.__l.__data_ = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v47.__r_.__value_.__l.__data_);
  v38 = (void *)objc_opt_new();
  objc_msgSend(v38, "setEnableUpdates:", 1);
  v31 = (void *)objc_opt_new();
  objc_msgSend(v31, "setObject:forKey:", v37, CFSTR("value"));
  objc_msgSend(v38, "setParameters:", v31);
  if (v51 >= 0)
    v15 = __p;
  else
    v15 = (void **)__p[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v16 = &v48;
  else
    v16 = (std::string *)v48.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "executeWithParams:locale:", v35);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (id)objc_opt_new();
  v42 = (void *)objc_opt_new();
  v41 = (void *)objc_opt_new();
  objc_msgSend(v39, "setPrint:", v42);
  objc_msgSend(v39, "setSpeak:", v41);
  if (v40)
  {
    objc_msgSend(v40, "response");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

    if (!v18)
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      objc_msgSend(v40, "response");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v44 != v22)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "objectForKey:", CFSTR("content"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (v24)
            {
              objc_msgSend(v24, "objectForKey:", CFSTR("print"));
              v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKey:", CFSTR("speak"));
              v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (v26)
                v28 = v26;
              else
                v28 = &stru_1E793AF80;
              objc_msgSend(v42, "addObject:", v28);
              if (v27)
                v29 = v27;
              else
                v29 = &stru_1E793AF80;
              objc_msgSend(v41, "addObject:", v29);

            }
          }
          v19 = v20;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
        }
        while (v21);
      }

    }
  }

  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v48.__r_.__value_.__l.__data_);
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v49.__r_.__value_.__l.__data_);
  if (SHIBYTE(v51) < 0)
    operator delete(__p[0]);
  if (v53 < 0)
    operator delete(v52);

  return v39;
}

+ (BOOL)downloadMorphunDataByLocale:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "downloadData:", v5);

  return v6;
}

+ (BOOL)downloadMorphunDataByLocales:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v4, "downloadData:", v3);

  return v5;
}

+ (id)getMorphunPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "getPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)getMorphunPaths
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "getAllPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)runTests:(id)a3
{
  id v3;
  id v4;
  _QWORD *v5;
  BOOL v6;
  void *__p[2];
  char v9;
  void *v10[2];
  char v11;
  void *v12[2];
  char v13;
  void *v14[2];
  char v15;
  _BYTE v16[8];
  _OWORD v17[3];

  v3 = a3;
  v16[0] = 0;
  memset(v17, 0, sizeof(v17));
  +[DEExecutor bundleTemplateDir:](DEExecutor, "bundleTemplateDir:", v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(v14, (char *)objc_msgSend(v4, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(v12, "");
  std::string::basic_string[abi:ne180100]<0>(v10, "");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  siri::dialogengine::TestSuite::LoadTests((uint64_t)v16, (uint64_t)v14, (unsigned __int8 *)v12, 0, (unsigned __int8 *)v10, (unsigned __int8 **)__p);
  if (v9 < 0)
    operator delete(__p[0]);
  if (v11 < 0)
    operator delete(v10[0]);
  if (v13 < 0)
    operator delete(v12[0]);
  if (v15 < 0)
    operator delete(v14[0]);

  v5 = std::string::basic_string[abi:ne180100]<0>(v14, "");
  v6 = siri::dialogengine::TestRunner::RunTestSuite((uint64_t)v5);
  if (v15 < 0)
    operator delete(v14[0]);
  v14[0] = (char *)&v17[1] + 8;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v14);
  v14[0] = v17;
  std::vector<siri::dialogengine::TestCase>::__destroy_vector::operator()[abi:ne180100]((void ***)v14);

  return v6;
}

+ (BOOL)runTests:(id)a3 forLocale:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD *v8;
  BOOL v9;
  void *__p[2];
  char v12;
  void *v13[2];
  char v14;
  void *v15[2];
  char v16;
  void *v17[2];
  char v18;
  _BYTE v19[8];
  _OWORD v20[3];

  v5 = a3;
  v6 = a4;
  v19[0] = 0;
  memset(v20, 0, sizeof(v20));
  +[DEExecutor bundleTemplateDir:](DEExecutor, "bundleTemplateDir:", v5);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(v17, (char *)objc_msgSend(v7, "UTF8String"));

  std::string::basic_string[abi:ne180100]<0>(v15, "");
  if (v6)
    std::string::basic_string[abi:ne180100]<0>(v13, (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
  else
    std::string::basic_string[abi:ne180100]<0>(v13, "");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  siri::dialogengine::TestSuite::LoadTests((uint64_t)v19, (uint64_t)v17, (unsigned __int8 *)v15, 0, (unsigned __int8 *)v13, (unsigned __int8 **)__p);
  if (v12 < 0)
    operator delete(__p[0]);
  if (v14 < 0)
    operator delete(v13[0]);
  if (v16 < 0)
    operator delete(v15[0]);
  v8 = std::string::basic_string[abi:ne180100]<0>(v15, "");
  v9 = siri::dialogengine::TestRunner::RunTestSuite((uint64_t)v8);
  if (v16 < 0)
    operator delete(v15[0]);
  if (v18 < 0)
    operator delete(v17[0]);
  v17[0] = (char *)&v20[1] + 8;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v17);
  v17[0] = v20;
  std::vector<siri::dialogengine::TestCase>::__destroy_vector::operator()[abi:ne180100]((void ***)v17);

  return v9;
}

+ (id)getDialogAssetsVersion:(id)a3 enableUpdates:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  const char *v10;
  std::string *v11;
  void *v12;
  void *v14[2];
  char v15;
  std::string v16;
  std::string __p;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v6, "UTF8String"));

  if (v4)
  {
    objc_msgSend(v5, "path");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v14, (char *)objc_msgSend(v7, "UTF8String"));
    siri::dialogengine::GetUpdatedTemplateDir((uint64_t)v14, &v16);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    __p = v16;
    *((_BYTE *)&v16.__r_.__value_.__s + 23) = 0;
    v16.__r_.__value_.__s.__data_[0] = 0;
    if (v15 < 0)
      operator delete(v14[0]);

  }
  std::string::basic_string[abi:ne180100]<0>(&v16, "");
  if ((siri::dialogengine::ReadAssetDeliveryConfig((uint64_t *)&__p, 0, (uint64_t)&v16, 0) & 1) == 0)
  {
    objc_msgSend(v5, "path");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "UTF8String");
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"Failed to read version of dialog in \"%s\", v10, v9);

  }
  if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v11 = &v16;
  else
    v11 = (std::string *)v16.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  return v12;
}

+ (id)getDialogAssetsVersion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E98];
  +[DEExecutor bundleTemplateDir:](DEExecutor, "bundleTemplateDir:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getDialogAssetsVersion:enableUpdates:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)getDialogMetadataForLocale:(id)a3 locale:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void **v9;
  void *v10;
  void *v12[3];
  void *__p[2];
  char v14;
  std::string v15;
  void *v16[2];
  char v17;

  v5 = a3;
  v6 = a4;
  v7 = objc_retainAutorelease(v5);
  std::string::basic_string[abi:ne180100]<0>(v16, (char *)objc_msgSend(v7, "UTF8String"));
  v8 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(&v15, (char *)objc_msgSend(v8, "UTF8String"));
  siri::dialogengine::GetDialogMetadata((uint64_t)v16, &v15, 0, v12);
  siri::dialogengine::ConstructJSONString(v12, __p);
  std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy((_QWORD *)v12[1]);
  if (v14 >= 0)
    v9 = __p;
  else
    v9 = (void **)__p[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  if (v17 < 0)
    operator delete(v16[0]);

  return v10;
}

+ (id)getBuiltinDialogMetadataForLocale:(id)a3
{
  id v3;
  id v4;
  void **v5;
  void *v6;
  void *v8[3];
  void *v9[2];
  char v10;
  std::string v11;
  void *__p;
  char v13;
  uint64_t v14;
  uint64_t v15;
  std::string v16;

  v3 = a3;
  siri::dialogengine::GetSharedTemplateDir(0, (siri::dialogengine::UpdatableDir *)&v11);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v16, v11.__r_.__value_.__l.__data_, v11.__r_.__value_.__l.__size_);
  else
    v16 = v11;
  v9[0] = &v15;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v9);
  v9[0] = &v14;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v9);
  if (v13 < 0)
    operator delete(__p);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
  v4 = objc_retainAutorelease(v3);
  std::string::basic_string[abi:ne180100]<0>(&v11, (char *)objc_msgSend(v4, "UTF8String"));
  siri::dialogengine::GetDialogMetadata((uint64_t)&v16, &v11, 0, v8);
  siri::dialogengine::ConstructJSONString(v8, v9);
  std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy((_QWORD *)v8[1]);
  if (v10 >= 0)
    v5 = v9;
  else
    v5 = (void **)v9[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 < 0)
    operator delete(v9[0]);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);

  return v6;
}

+ (id)getDialogMetadataCategoryNamesForLocale:(id)a3 locale:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void **v9;
  void *v10;
  void *v12[3];
  void *__p[2];
  char v14;
  std::string v15;
  void *v16[2];
  char v17;

  v5 = a3;
  v6 = a4;
  v7 = objc_retainAutorelease(v5);
  std::string::basic_string[abi:ne180100]<0>(v16, (char *)objc_msgSend(v7, "UTF8String"));
  v8 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(&v15, (char *)objc_msgSend(v8, "UTF8String"));
  siri::dialogengine::GetDialogMetadata((uint64_t)v16, &v15, 1, v12);
  siri::dialogengine::ConstructJSONString(v12, __p);
  std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy((_QWORD *)v12[1]);
  if (v14 >= 0)
    v9 = __p;
  else
    v9 = (void **)__p[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  if (v17 < 0)
    operator delete(v16[0]);

  return v10;
}

+ (id)getBuiltinDialogMetadataCategoryNamesForLocale:(id)a3
{
  id v3;
  id v4;
  void **v5;
  void *v6;
  void *v8[3];
  void *v9[2];
  char v10;
  std::string v11;
  void *__p;
  char v13;
  uint64_t v14;
  uint64_t v15;
  std::string v16;

  v3 = a3;
  siri::dialogengine::GetSharedTemplateDir(0, (siri::dialogengine::UpdatableDir *)&v11);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v16, v11.__r_.__value_.__l.__data_, v11.__r_.__value_.__l.__size_);
  else
    v16 = v11;
  v9[0] = &v15;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v9);
  v9[0] = &v14;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v9);
  if (v13 < 0)
    operator delete(__p);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
  v4 = objc_retainAutorelease(v3);
  std::string::basic_string[abi:ne180100]<0>(&v11, (char *)objc_msgSend(v4, "UTF8String"));
  siri::dialogengine::GetDialogMetadata((uint64_t)&v16, &v11, 1, v8);
  siri::dialogengine::ConstructJSONString(v8, v9);
  std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy((_QWORD *)v8[1]);
  if (v10 >= 0)
    v5 = v9;
  else
    v5 = (void **)v9[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 < 0)
    operator delete(v9[0]);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);

  return v6;
}

+ (id)getDialogStateUseCase:(id)a3
{
  id v3;
  DEDialogStateUseCase *v4;

  v3 = a3;
  v4 = -[DEDialogState initWithCatId:]([DEDialogStateUseCase alloc], "initWithCatId:", v3);

  return v4;
}

+ (id)getDialogStateFamily:(id)a3
{
  id v3;
  DEDialogStateFamily *v4;

  v3 = a3;
  v4 = -[DEDialogState initWithCatId:]([DEDialogStateFamily alloc], "initWithCatId:", v3);

  return v4;
}

+ (id)getFallbackLocales:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *__p[2];
  char v11;
  uint64_t v12;
  uint64_t v13;

  v3 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v3, "UTF8String"));
  siri::dialogengine::GetFallbackLocales((uint64_t)__p, &v12);
  if (v11 < 0)
    operator delete(__p[0]);
  v4 = (void *)objc_opt_new();
  v5 = v12;
  for (i = v13; v5 != i; v5 += 24)
  {
    v7 = v5;
    if (*(char *)(v5 + 23) < 0)
      v7 = *(_QWORD *)v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  __p[0] = &v12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);

  return v4;
}

+ (id)getFallbackLocales:(id)a3 includingNonSiriLocales:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t **NonSiriFallbackLocales;
  uint64_t *j;
  uint64_t *v13;
  uint64_t *v14;
  void *v15;
  void *__p[2];
  char v18;
  uint64_t v19;
  uint64_t v20;

  v5 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
  siri::dialogengine::GetFallbackLocales((uint64_t)__p, &v19);
  if (v18 < 0)
    operator delete(__p[0]);
  v6 = (void *)objc_opt_new();
  v7 = v19;
  for (i = v20; v7 != i; v7 += 24)
  {
    v9 = v7;
    if (*(char *)(v7 + 23) < 0)
      v9 = *(_QWORD *)v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

  }
  if (a4)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    NonSiriFallbackLocales = (uint64_t **)siri::dialogengine::GetNonSiriFallbackLocales();
    if (v18 < 0)
      operator delete(__p[0]);
    v13 = *NonSiriFallbackLocales;
    for (j = NonSiriFallbackLocales[1]; v13 != j; v13 += 3)
    {
      v14 = v13;
      if (*((char *)v13 + 23) < 0)
        v14 = (uint64_t *)*v13;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v15);

    }
  }
  __p[0] = &v19;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);

  return v6;
}

+ (void)registerBundle:(id)a3
{
  id v3;
  id v4;
  void **v5;
  void *v6;
  void *__p[2];
  char v8;
  void *v9[2];
  char v10;

  v3 = a3;
  objc_msgSend(v3, "resourcePath");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  siri::dialogengine::GetDomainTemplateDir((uint64_t)__p, (uint64_t)v9);
  if (v8 < 0)
    operator delete(__p[0]);

  if (v10 >= 0)
    v5 = v9;
  else
    v5 = (void **)v9[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAT registerBundle:withTemplateDir:](CAT, "registerBundle:withTemplateDir:", v3, v6);

  if (v10 < 0)
    operator delete(v9[0]);

}

+ (void)registerBundle:(id)a3 withTemplateDir:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  objc_msgSend(a3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAT registerBundleId:withTemplateDir:](CAT, "registerBundleId:withTemplateDir:", v5, v6);

}

+ (void)registerBundleId:(id)a3 withTemplateDir:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *__p[2];
  char v10;
  void *v11[2];
  char v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_retainAutorelease(v5);
  std::string::basic_string[abi:ne180100]<0>(v11, (char *)objc_msgSend(v7, "UTF8String"));
  v8 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v8, "UTF8String"));
  siri::dialogengine::GradingAllowListFactory::RegisterBundle((char *)v11, (__int128 *)__p);
  if (v10 < 0)
    operator delete(__p[0]);
  if (v12 < 0)
    operator delete(v11[0]);

}

+ (id)filterProfanity:(id)a3 locale:(id)a4
{
  id v5;
  id v6;
  id v7;
  std::string *v8;
  void *v9;
  void *v11[2];
  char v12;
  std::string v13;
  void *v14[2];
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *__p;
  char v27;
  std::string v28;

  v5 = a3;
  v6 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(&v13, (char *)objc_msgSend(v6, "UTF8String"));
  v7 = objc_retainAutorelease(v5);
  std::string::basic_string[abi:ne180100]<0>(v11, (char *)objc_msgSend(v7, "UTF8String"));
  siri::dialogengine::RemoveProfanity(&v13, (uint64_t)v11, (uint64_t)v14);
  siri::dialogengine::SpeakableString::ToMultiplexedString((siri::dialogengine::SpeakableString *)v14, &v28);
  if (v27 < 0)
    operator delete(__p);
  if (v25 < 0)
    operator delete(v24);
  if (v23 < 0)
    operator delete(v22);
  if (v21 < 0)
    operator delete(v20);
  if (v19 < 0)
    operator delete(v18);
  if (v17 < 0)
    operator delete(v16);
  if (v15 < 0)
    operator delete(v14[0]);
  if (v12 < 0)
    operator delete(v11[0]);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
  if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v8 = &v28;
  else
    v8 = (std::string *)v28.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v28.__r_.__value_.__l.__data_);

  return v9;
}

@end
