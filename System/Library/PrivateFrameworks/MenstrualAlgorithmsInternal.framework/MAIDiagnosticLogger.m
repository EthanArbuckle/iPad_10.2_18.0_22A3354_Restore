@implementation MAIDiagnosticLogger

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

- (MAIDiagnosticLogger)init
{
  MAIDiagnosticLogger *v2;
  int *v3;
  int *p_notifyToken;
  void *v5;
  void *v6;
  NSObject *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  id v19;
  size_t v20;
  void *p_p;
  uint8_t *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  size_t v26;
  void *v27;
  uint8_t *v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  MAIDiagnosticLogger *v32;
  NSObject *v33;
  NSObject *v34;
  void *__p;
  uint64_t *v37;
  char v38;
  __int128 v39;
  uint8_t buf[23];
  unsigned __int8 v41;
  id v42;
  objc_super v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v43.receiver = self;
  v43.super_class = (Class)MAIDiagnosticLogger;
  v2 = -[MAIDiagnosticLogger init](&v43, sel_init);
  v3 = (int *)v2;
  if (v2)
  {
    v2->_notifyToken = -1;
    p_notifyToken = &v2->_notifyToken;
    -[MAIDiagnosticLogger notificationName](v2, "notificationName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      notify_register_check((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), v3 + 2);
      if (*p_notifyToken != -1)
      {
        if ((objc_msgSend(v3, "notifyState") & 1) != 0 || (ha_sensitive_logging_is_enabled() & 1) != 0)
        {
          ha_get_log();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_221550000, v7, OS_LOG_TYPE_DEFAULT, "logging is enabled", buf, 2u);
          }

          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&__p, 0, 0, 0, 2);
          std::allocate_shared[abi:nn180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,void>((uint64_t)&__p, buf);
          std::shared_ptr<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator=[abi:nn180100]((uint64_t)(v3 + 4), (__int128 *)buf);
          v8 = *(std::__shared_weak_count **)&buf[8];
          if (*(_QWORD *)&buf[8])
          {
            v9 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
            do
              v10 = __ldaxr(v9);
            while (__stlxr(v10 - 1, v9));
            if (!v10)
            {
              ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
              std::__shared_weak_count::__release_weak(v8);
            }
          }
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&__p);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v37, __p);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&__p, 0, 0, 0, 1);
          std::allocate_shared[abi:nn180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,void>((uint64_t)&__p, buf);
          std::shared_ptr<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator=[abi:nn180100]((uint64_t)(v3 + 8), (__int128 *)buf);
          v11 = *(std::__shared_weak_count **)&buf[8];
          if (*(_QWORD *)&buf[8])
          {
            v12 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
            do
              v13 = __ldaxr(v12);
            while (__stlxr(v13 - 1, v12));
            if (!v13)
            {
              ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
              std::__shared_weak_count::__release_weak(v11);
            }
          }
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&__p);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v37, __p);
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = *MEMORY[0x24BDD0CF0];
          v45[0] = *MEMORY[0x24BDD0CD8];
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0;
          v16 = objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/Logs/CycleTracking"), 1, v15, &v42);
          v17 = v42;

          if ((v16 & 1) != 0)
          {
            objc_msgSend(v3, "baseFileName");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(CFSTR("/var/mobile/Library/Logs/CycleTracking"), "stringByAppendingPathComponent:", v18);
            v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            std::string::basic_string[abi:nn180100]<0>(buf, (char *)objc_msgSend(v19, "UTF8String"));

            if ((v41 & 0x80u) == 0)
              v20 = v41;
            else
              v20 = *(_QWORD *)&buf[8];
            p_p = &__p;
            std::string::basic_string[abi:nn180100]((uint64_t)&__p, v20 + 11);
            if (v38 < 0)
              p_p = __p;
            if (v20)
            {
              if ((v41 & 0x80u) == 0)
                v22 = buf;
              else
                v22 = *(uint8_t **)buf;
              memmove(p_p, v22, v20);
            }
            strcpy((char *)p_p + v20, "_input.json");
            std::allocate_shared[abi:nn180100]<std::ofstream,std::allocator<std::ofstream>,std::string,void>(&v39);
            std::shared_ptr<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator=[abi:nn180100]((uint64_t)(v3 + 12), &v39);
            v23 = (std::__shared_weak_count *)*((_QWORD *)&v39 + 1);
            if (*((_QWORD *)&v39 + 1))
            {
              v24 = (unint64_t *)(*((_QWORD *)&v39 + 1) + 8);
              do
                v25 = __ldaxr(v24);
              while (__stlxr(v25 - 1, v24));
              if (!v25)
              {
                ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
                std::__shared_weak_count::__release_weak(v23);
              }
            }
            if (v38 < 0)
              operator delete(__p);
            if ((v41 & 0x80u) == 0)
              v26 = v41;
            else
              v26 = *(_QWORD *)&buf[8];
            v27 = &__p;
            std::string::basic_string[abi:nn180100]((uint64_t)&__p, v26 + 12);
            if (v38 < 0)
              v27 = __p;
            if (v26)
            {
              if ((v41 & 0x80u) == 0)
                v28 = buf;
              else
                v28 = *(uint8_t **)buf;
              memmove(v27, v28, v26);
            }
            strcpy((char *)v27 + v26, "_output.json");
            std::allocate_shared[abi:nn180100]<std::ofstream,std::allocator<std::ofstream>,std::string,void>(&v39);
            std::shared_ptr<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator=[abi:nn180100]((uint64_t)(v3 + 16), &v39);
            v29 = (std::__shared_weak_count *)*((_QWORD *)&v39 + 1);
            if (*((_QWORD *)&v39 + 1))
            {
              v30 = (unint64_t *)(*((_QWORD *)&v39 + 1) + 8);
              do
                v31 = __ldaxr(v30);
              while (__stlxr(v31 - 1, v30));
              if (!v31)
              {
                ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
                std::__shared_weak_count::__release_weak(v29);
              }
            }
            if (v38 < 0)
              operator delete(__p);
            v32 = v3;
            if ((char)v41 < 0)
              operator delete(*(void **)buf);
          }
          else
          {
            ha_get_log();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              -[MAIDiagnosticLogger init].cold.1((uint64_t)v17, v33);

            v32 = 0;
          }

          goto LABEL_64;
        }
        ha_get_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_221550000, v34, OS_LOG_TYPE_DEFAULT, "logging is disabled", buf, 2u);
        }

        objc_msgSend(v3, "removeOldFiles");
      }
    }
    v32 = 0;
LABEL_64:

    goto LABEL_65;
  }
  v32 = 0;
LABEL_65:

  return v32;
}

- (BOOL)notifyState
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(-[MAIDiagnosticLogger notifyToken](self, "notifyToken"), &state64);
  return state64 != 0;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (NSString)baseFileName
{
  return (NSString *)CFSTR("logger");
}

- (basic_string<char,)jsonObjectName
{
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)std::string::basic_string[abi:nn180100]<0>(retstr, "logger");
}

- (NSString)notificationName
{
  return 0;
}

- (void)setNotifyState:(BOOL)a3
{
  id v4;

  notify_set_state(-[MAIDiagnosticLogger notifyToken](self, "notifyToken"), a3);
  -[MAIDiagnosticLogger notificationName](self, "notificationName");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  notify_post((const char *)objc_msgSend(v4, "UTF8String"));

}

- (void)removeOldFiles
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  double v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id obj;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  _QWORD v37[3];

  v37[1] = *MEMORY[0x24BDAC8D0];
  ha_get_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221550000, v2, OS_LOG_TYPE_DEFAULT, "removing old JSON files", buf, 2u);
  }

  v23 = *MEMORY[0x24BDBCBC8];
  v37[0] = *MEMORY[0x24BDBCBC8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("/var/mobile/Library/Logs/CycleTracking"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, v21, 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v20;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v8, "pathExtension", v20);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("json"));

        if ((v10 & 1) != 0)
        {
          v26 = 0;
          v27 = 0;
          objc_msgSend(v8, "getResourceValue:forKey:error:", &v27, v23, &v26);
          v11 = v27;
          v12 = v26;
          if (v11 && (objc_msgSend(v22, "timeIntervalSinceDate:", v11), v13 > 86400.0))
          {
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v12;
            v15 = objc_msgSend(v14, "removeItemAtURL:error:", v8, &v25);
            v16 = v25;

            if (v15)
            {
              ha_get_log();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v8, "lastPathComponent");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v33 = v18;
                _os_log_impl(&dword_221550000, v17, OS_LOG_TYPE_DEFAULT, "deleted %{public}@", buf, 0xCu);

              }
            }
            else
            {
              ha_get_log();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v8, "lastPathComponent");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v33 = v19;
                v34 = 2114;
                v35 = v16;
                _os_log_impl(&dword_221550000, v17, OS_LOG_TYPE_DEFAULT, "failed to delete %{public}@ with error: %{public}@", buf, 0x16u);

              }
            }

          }
          else
          {
            v16 = v12;
          }

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v5);
  }

}

- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  unsigned int v5;
  uint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t *v9;
  std::string *v10;
  __int128 v11;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  void *__p[2];
  char v20;
  std::string v21;
  void *v22[2];
  std::string::size_type v23;
  _BYTE v24[8];
  uint64_t *v25[2];
  std::__shared_weak_count *v26;
  _BYTE v27[16];
  _BYTE *v28;
  char v29;
  _BYTE v30[16];
  uint64_t v31;
  char v32;
  _BYTE v33[16];
  _BYTE *v34;
  char v35;
  _BYTE v36[8];
  _QWORD v37[2];
  char v38;
  _BYTE v39[16];
  _BYTE *v40;
  char v41;
  _BYTE v42[16];
  _BYTE *v43;
  char v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  uint64_t *v47;
  char v48;
  _BYTE v49[16];
  _BYTE *v50;
  char v51;
  _BYTE v52[8];
  uint64_t *v53[2];
  char v54;
  uint64_t v55;

  v5 = a3;
  v55 = *MEMORY[0x24BDAC8D0];
  -[MAIDiagnosticLogger inputJson](self, "inputJson");
  if (!v46)
    goto LABEL_5;
  p_shared_owners = &v46->__shared_owners_;
  do
    v8 = __ldaxr((unint64_t *)p_shared_owners);
  while (__stlxr(v8 - 1, (unint64_t *)p_shared_owners));
  if (!v8)
  {
    ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
    std::__shared_weak_count::__release_weak(v46);
    if (!v45)
      return;
  }
  else
  {
LABEL_5:
    if (!v45)
      return;
  }
  -[MAIDiagnosticLogger inputJson](self, "inputJson");
  v9 = v25[1];
  -[MAIDiagnosticLogger jsonObjectName](self, "jsonObjectName");
  v10 = std::string::append(&v21, ".beginPhase", 0xBuLL);
  v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v23 = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)v22 = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)&v45, (uint64_t)v22);
  v47 = &v45;
  v48 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[10],char [10],0>((uint64_t)v33, "julianDay");
  v34 = v33;
  v35 = 1;
  v36[0] = 6;
  v37[0] = a4;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v36);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v36);
  v37[1] = v36;
  v38 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v39, (uint64_t)v33, 2, 1, 2);
  v40 = v39;
  v41 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[6],char [6],0>((uint64_t)v27, "phase");
  v28 = v27;
  v29 = 1;
  phase_to_string(v5, __p);
  v31 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)v30, (uint64_t)__p);
  v32 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v42, (uint64_t)v27, 2, 1, 2);
  v43 = v42;
  v44 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v49, (uint64_t)v39, 2, 1, 2);
  v50 = v49;
  v51 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v52, (uint64_t)&v45, 2, 1, 2);
  v53[1] = (uint64_t *)v52;
  v54 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v24, (uint64_t)v52, 1, 1, 2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v9, (uint64_t)v24);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v24);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v25, v24[0]);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v52);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v53, v52[0]);
  for (i = 0; i != -64; i -= 32)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v49[i]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v49[i + 8], v49[i]);
  }
  for (j = 0; j != -64; j -= 32)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v42[j]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v42[j + 8], v42[j]);
  }
  for (k = 0; k != -64; k -= 32)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30[k]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v30[k + 8], v30[k]);
  }
  if (v20 < 0)
    operator delete(__p[0]);
  for (m = 0; m != -8; m -= 4)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v36[m * 8]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v37[m], v36[m * 8]);
  }
  if (SHIBYTE(v23) < 0)
    operator delete(v22[0]);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
  v16 = v26;
  if (v26)
  {
    v17 = (unint64_t *)&v26->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
}

- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  unsigned int v5;
  uint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t *v9;
  std::string *v10;
  __int128 v11;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  void *__p[2];
  char v20;
  std::string v21;
  void *v22[2];
  std::string::size_type v23;
  _BYTE v24[8];
  uint64_t *v25[2];
  std::__shared_weak_count *v26;
  _BYTE v27[16];
  _BYTE *v28;
  char v29;
  _BYTE v30[16];
  uint64_t v31;
  char v32;
  _BYTE v33[16];
  _BYTE *v34;
  char v35;
  _BYTE v36[8];
  _QWORD v37[2];
  char v38;
  _BYTE v39[16];
  _BYTE *v40;
  char v41;
  _BYTE v42[16];
  _BYTE *v43;
  char v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  uint64_t *v47;
  char v48;
  _BYTE v49[16];
  _BYTE *v50;
  char v51;
  _BYTE v52[8];
  uint64_t *v53[2];
  char v54;
  uint64_t v55;

  v5 = a3;
  v55 = *MEMORY[0x24BDAC8D0];
  -[MAIDiagnosticLogger inputJson](self, "inputJson");
  if (!v46)
    goto LABEL_5;
  p_shared_owners = &v46->__shared_owners_;
  do
    v8 = __ldaxr((unint64_t *)p_shared_owners);
  while (__stlxr(v8 - 1, (unint64_t *)p_shared_owners));
  if (!v8)
  {
    ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
    std::__shared_weak_count::__release_weak(v46);
    if (!v45)
      return;
  }
  else
  {
LABEL_5:
    if (!v45)
      return;
  }
  -[MAIDiagnosticLogger inputJson](self, "inputJson");
  v9 = v25[1];
  -[MAIDiagnosticLogger jsonObjectName](self, "jsonObjectName");
  v10 = std::string::append(&v21, ".endPhase", 9uLL);
  v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v23 = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)v22 = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)&v45, (uint64_t)v22);
  v47 = &v45;
  v48 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[10],char [10],0>((uint64_t)v33, "julianDay");
  v34 = v33;
  v35 = 1;
  v36[0] = 6;
  v37[0] = a4;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v36);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v36);
  v37[1] = v36;
  v38 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v39, (uint64_t)v33, 2, 1, 2);
  v40 = v39;
  v41 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[6],char [6],0>((uint64_t)v27, "phase");
  v28 = v27;
  v29 = 1;
  phase_to_string(v5, __p);
  v31 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)v30, (uint64_t)__p);
  v32 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v42, (uint64_t)v27, 2, 1, 2);
  v43 = v42;
  v44 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v49, (uint64_t)v39, 2, 1, 2);
  v50 = v49;
  v51 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v52, (uint64_t)&v45, 2, 1, 2);
  v53[1] = (uint64_t *)v52;
  v54 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v24, (uint64_t)v52, 1, 1, 2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v9, (uint64_t)v24);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v24);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v25, v24[0]);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v52);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v53, v52[0]);
  for (i = 0; i != -64; i -= 32)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v49[i]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v49[i + 8], v49[i]);
  }
  for (j = 0; j != -64; j -= 32)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v42[j]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v42[j + 8], v42[j]);
  }
  for (k = 0; k != -64; k -= 32)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30[k]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v30[k + 8], v30[k]);
  }
  if (v20 < 0)
    operator delete(__p[0]);
  for (m = 0; m != -8; m -= 4)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v36[m * 8]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v37[m], v36[m * 8]);
  }
  if (SHIBYTE(v23) < 0)
    operator delete(v22[0]);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
  v16 = v26;
  if (v26)
  {
    v17 = (unint64_t *)&v26->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
}

- (void)appendDay:(id)a3
{
  id v4;
  uint64_t *p_shared_owners;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  char *v9;
  unsigned int v10;
  unsigned int v11;
  char *v12;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  uint64_t n;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t ii;
  uint64_t jj;
  uint64_t kk;
  char *v30;
  std::string *v31;
  __int128 v32;
  uint64_t mm;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  char *v37;
  uint64_t *v38;
  char *v39;
  _BYTE v40[8];
  uint64_t *v41;
  char *v42;
  std::__shared_weak_count *v43;
  char **v44;
  char v45;
  _BYTE v46[16];
  uint64_t v47;
  char v48;
  std::string v49;
  char v50;
  _BYTE v51[8];
  _QWORD v52[2];
  char v53;
  uint64_t v54;
  std::__shared_weak_count *v55;
  uint64_t *v56;
  char v57;
  _BYTE v58[8];
  uint64_t *v59;
  _BYTE *v60;
  char v61;
  _QWORD v62[3];
  char v63;
  _BYTE v64[16];
  _BYTE *v65;
  char v66;
  __int128 v67;
  __int128 *v68;
  char v69;
  _BYTE v70[8];
  uint64_t v71;
  _BYTE *v72;
  char v73;
  _BYTE v74[8];
  uint64_t *v75;
  _BYTE *v76;
  char v77;
  _BYTE v78[8];
  uint64_t v79;
  _BYTE *v80;
  char v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MAIDiagnosticLogger inputJson](self, "inputJson");
  if (!v55)
    goto LABEL_5;
  p_shared_owners = &v55->__shared_owners_;
  do
    v6 = __ldaxr((unint64_t *)p_shared_owners);
  while (__stlxr(v6 - 1, (unint64_t *)p_shared_owners));
  if (!v6)
  {
    ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
    std::__shared_weak_count::__release_weak(v55);
    if (!v54)
      goto LABEL_46;
  }
  else
  {
LABEL_5:
    if (!v54)
      goto LABEL_46;
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[10],char [10],0>((uint64_t)v74, "julianDay");
  v76 = v74;
  v77 = 1;
  v7 = objc_msgSend(v4, "julianDay");
  v78[0] = 6;
  v79 = v7;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v78);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v78);
  v80 = v78;
  v81 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v54, (uint64_t)v74, 2, 1, 2);
  v56 = &v54;
  v57 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[5],char [5],0>((uint64_t)&v67, "flow");
  v68 = &v67;
  v69 = 1;
  v8 = objc_msgSend(v4, "flow");
  if (v8 > 5)
    v9 = "(invalid)";
  else
    v9 = off_24E71CF18[(char)v8];
  v37 = v9;
  v72 = (_BYTE *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*,char const*,0>((uint64_t)v70, &v37);
  v73 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v58, (uint64_t)&v67, 2, 1, 2);
  v60 = v58;
  v61 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[9],char [9],0>((uint64_t)&v49, "spotting");
  v49.__r_.__value_.__r.__words[2] = (std::string::size_type)&v49;
  v50 = 1;
  v10 = objc_msgSend(v4, "spotting");
  v51[0] = 4;
  v52[0] = v10;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v51);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v51);
  v52[1] = v51;
  v53 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v62, (uint64_t)&v49, 2, 1, 2);
  v62[2] = v62;
  v63 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[20],char [20],0>((uint64_t)&v42, "ovulationTestResult");
  v44 = &v42;
  v45 = 1;
  v11 = objc_msgSend(v4, "ovulationTestResult");
  if (v11 > 3)
    v12 = "(invalid)";
  else
    v12 = off_24E71CF48[(char)v11];
  v39 = v12;
  v47 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*,char const*,0>((uint64_t)v46, &v39);
  v48 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v64, (uint64_t)&v42, 2, 1, 2);
  v65 = v64;
  v66 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v40, (uint64_t)&v54, 4, 1, 2);
  for (i = 0; i != -128; i -= 32)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v64[i]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v64[i + 8], v64[i]);
  }
  for (j = 0; j != -64; j -= 32)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v46[j]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v46[j + 8], v46[j]);
  }
  for (k = 0; k != -8; k -= 4)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v51[k * 8]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v52[k], v51[k * 8]);
  }
  for (m = 0; m != -64; m -= 32)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v70[m]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)((char *)&v71 + m), v70[m]);
  }
  for (n = 0; n != -64; n -= 32)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v78[n]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)((char *)&v79 + n), v78[n]);
  }
  objc_msgSend(v4, "sedentaryHeartRateStatistics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    -[MAIDiagnosticLogger appendDay:]::$_2::operator()(v18, (uint64_t)v74);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[29],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v40, "sedentaryHeartRateStatistics", (uint64_t)v74, (uint64_t)&v54);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v74);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v75, v74[0]);
  }

  objc_msgSend(v4, "sleepHeartRateStatistics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    -[MAIDiagnosticLogger appendDay:]::$_2::operator()(v20, (uint64_t)v74);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[25],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v40, "sleepHeartRateStatistics", (uint64_t)v74, (uint64_t)&v54);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v74);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v75, v74[0]);
  }

  objc_msgSend(v4, "wristTemperature");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v24 = v22;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[16],char [16],0>((uint64_t)v74, "watchIdentifier");
    v76 = v74;
    v77 = 1;
    objc_msgSend(v24, "watchIdentifier");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v42 = (char *)objc_msgSend(v25, "UTF8String");
    v80 = (_BYTE *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*,char const*,0>((uint64_t)v78, &v42);
    v81 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v54, (uint64_t)v74, 2, 1, 2);
    v56 = &v54;
    v57 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[19],char [19],0>((uint64_t)&v67, "temperatureCelsius");
    v68 = &v67;
    v69 = 1;
    objc_msgSend(v24, "temperatureCelsius");
    v70[0] = 7;
    v71 = v26;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v70);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v70);
    v72 = v70;
    v73 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v58, (uint64_t)&v67, 2, 1, 2);
    v60 = v58;
    v61 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v49, (uint64_t)&v54, 2, 1, 2);
    for (ii = 0; ii != -8; ii -= 4)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v58[ii * 8]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&(&v59)[ii], v58[ii * 8]);
    }
    for (jj = 0; jj != -64; jj -= 32)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v70[jj]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)((char *)&v71 + jj), v70[jj]);
    }
    for (kk = 0; kk != -64; kk -= 32)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v78[kk]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)((char *)&v79 + kk), v78[kk]);
    }

    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[17],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v40, "wristTemperature", (uint64_t)&v49, (uint64_t)&v54);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v49);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v49.__r_.__value_.__l.__size_, v49.__r_.__value_.__s.__data_[0]);
  }

  -[MAIDiagnosticLogger inputJson](self, "inputJson");
  v30 = v42;
  -[MAIDiagnosticLogger jsonObjectName](self, "jsonObjectName");
  v31 = std::string::append(&v49, ".appendDay", 0xAuLL);
  v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
  v68 = (__int128 *)v31->__r_.__value_.__r.__words[2];
  v67 = v32;
  v31->__r_.__value_.__l.__size_ = 0;
  v31->__r_.__value_.__r.__words[2] = 0;
  v31->__r_.__value_.__r.__words[0] = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)&v54, (uint64_t)&v67);
  v56 = &v54;
  v57 = 1;
  v58[0] = v40[0];
  v59 = v41;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v40);
  v40[0] = 0;
  v41 = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v58);
  v60 = v58;
  v61 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v74, (uint64_t)&v54, 2, 1, 2);
  v76 = v74;
  v77 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v37, (uint64_t)v74, 1, 1, 2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v30, (uint64_t)&v37);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v37);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v38, v37);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v74);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v75, v74[0]);
  for (mm = 0; mm != -8; mm -= 4)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v58[mm * 8]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&(&v59)[mm], v58[mm * 8]);
  }
  if (SHIBYTE(v68) < 0)
    operator delete((void *)v67);
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v49.__r_.__value_.__l.__data_);
  v34 = v43;
  if (v43)
  {
    v35 = (unint64_t *)&v43->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v40);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v41, v40[0]);
LABEL_46:

}

- (void)appendDay:
{
  id v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  _BYTE v9[16];
  _BYTE *v10;
  char v11;
  _BYTE v12[8];
  _QWORD v13[2];
  char v14;
  uint64_t v15;
  uint64_t *v16[2];
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[12],char [12],0>((uint64_t)v9, "sampleCount");
  v10 = v9;
  v11 = 1;
  v4 = objc_msgSend(v3, "sampleCount");
  v12[0] = 5;
  v13[0] = v4;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v12);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v12);
  v13[1] = v12;
  v14 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v15, (uint64_t)v9, 2, 1, 2);
  v16[1] = &v15;
  v17 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(a2, (uint64_t)&v15, 1, 1, 2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v15);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v16, v15);
  for (i = 0; i != -8; i -= 4)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v12[i * 8]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v13[i], v12[i * 8]);
  }
  objc_msgSend(v3, "lowerPercentile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    v15 = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[16],double>(a2, "lowerPercentile", &v15, (uint64_t)v9);
  }

}

- (void)dealloc
{
  _BOOL4 v3;
  uint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  NSObject *v16;
  std::__shared_weak_count *v17;
  _BOOL4 v18;
  uint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  std::__shared_weak_count *v26;
  uint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  uint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  NSObject *v35;
  NSObject *v36;
  objc_super v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  uint8_t buf[8];
  std::__shared_weak_count *v45;
  char v46;

  -[MAIDiagnosticLogger inputFile](self, "inputFile");
  if (*(_QWORD *)buf)
  {
    -[MAIDiagnosticLogger inputJson](self, "inputJson");
    v3 = v42 != 0;
    if (v43)
    {
      p_shared_owners = &v43->__shared_owners_;
      do
        v5 = __ldaxr((unint64_t *)p_shared_owners);
      while (__stlxr(v5 - 1, (unint64_t *)p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
      }
    }
  }
  else
  {
    v3 = 0;
  }
  if (!v45)
    goto LABEL_12;
  v6 = &v45->__shared_owners_;
  do
    v7 = __ldaxr((unint64_t *)v6);
  while (__stlxr(v7 - 1, (unint64_t *)v6));
  if (!v7)
  {
    ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
    std::__shared_weak_count::__release_weak(v45);
    if (!v3)
      goto LABEL_31;
  }
  else
  {
LABEL_12:
    if (!v3)
      goto LABEL_31;
  }
  -[MAIDiagnosticLogger inputFile](self, "inputFile");
  -[MAIDiagnosticLogger inputJson](self, "inputJson");
  v8 = nlohmann::operator<<(*(uint64_t **)buf, v42);
  v46 = 10;
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v8, (uint64_t)&v46, 1);
  if (v43)
  {
    v9 = &v43->__shared_owners_;
    do
      v10 = __ldaxr((unint64_t *)v9);
    while (__stlxr(v10 - 1, (unint64_t *)v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }
  if (v45)
  {
    v11 = &v45->__shared_owners_;
    do
      v12 = __ldaxr((unint64_t *)v11);
    while (__stlxr(v12 - 1, (unint64_t *)v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  v40 = 0;
  v41 = 0;
  -[MAIDiagnosticLogger setInputFile:](self, "setInputFile:", &v40);
  v13 = v41;
  if (v41)
  {
    v14 = (unint64_t *)&v41->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  ha_get_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221550000, v16, OS_LOG_TYPE_DEFAULT, "finished writing input file in dealloc", buf, 2u);
  }

LABEL_31:
  -[MAIDiagnosticLogger outputFile](self, "outputFile");
  if (*(_QWORD *)buf)
  {
    -[MAIDiagnosticLogger outputJson](self, "outputJson");
    v17 = v43;
    v18 = v42 != 0;
    if (v43)
    {
      v19 = &v43->__shared_owners_;
      do
        v20 = __ldaxr((unint64_t *)v19);
      while (__stlxr(v20 - 1, (unint64_t *)v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }
  else
  {
    v18 = 0;
  }
  v21 = v45;
  if (!v45)
    goto LABEL_42;
  v22 = &v45->__shared_owners_;
  do
    v23 = __ldaxr((unint64_t *)v22);
  while (__stlxr(v23 - 1, (unint64_t *)v22));
  if (!v23)
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
    if (!v18)
      goto LABEL_61;
  }
  else
  {
LABEL_42:
    if (!v18)
      goto LABEL_61;
  }
  -[MAIDiagnosticLogger outputFile](self, "outputFile");
  v24 = *(uint64_t **)buf;
  -[MAIDiagnosticLogger outputJson](self, "outputJson");
  v25 = nlohmann::operator<<(v24, v42);
  v46 = 10;
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v25, (uint64_t)&v46, 1);
  v26 = v43;
  if (v43)
  {
    v27 = &v43->__shared_owners_;
    do
      v28 = __ldaxr((unint64_t *)v27);
    while (__stlxr(v28 - 1, (unint64_t *)v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = v45;
  if (v45)
  {
    v30 = &v45->__shared_owners_;
    do
      v31 = __ldaxr((unint64_t *)v30);
    while (__stlxr(v31 - 1, (unint64_t *)v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  v38 = 0;
  v39 = 0;
  -[MAIDiagnosticLogger setOutputFile:](self, "setOutputFile:", &v38);
  v32 = v39;
  if (v39)
  {
    v33 = (unint64_t *)&v39->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  ha_get_log();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221550000, v35, OS_LOG_TYPE_DEFAULT, "finished writing output file", buf, 2u);
  }

LABEL_61:
  if (-[MAIDiagnosticLogger notifyToken](self, "notifyToken") != -1)
  {
    ha_get_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221550000, v36, OS_LOG_TYPE_DEFAULT, "clearing the logging notification state", buf, 2u);
    }

    -[MAIDiagnosticLogger setNotifyState:](self, "setNotifyState:", 0);
    notify_cancel(-[MAIDiagnosticLogger notifyToken](self, "notifyToken"));
  }
  v37.receiver = self;
  v37.super_class = (Class)MAIDiagnosticLogger;
  -[MAIDiagnosticLogger dealloc](&v37, sel_dealloc);
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (shared_ptr<nlohmann::basic_json<>>)inputJson
{
  void **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<nlohmann::basic_json<>> result;

  cntrl = self->_inputJson.__cntrl_;
  *v2 = self->_inputJson.__ptr_;
  v2[1] = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void)setInputJson:(shared_ptr<nlohmann::basic_json<>>)a3
{
  std::shared_ptr<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator=[abi:nn180100](&self->_inputJson.__ptr_, (uint64_t *)a3.__ptr_);
}

- (shared_ptr<nlohmann::basic_json<>>)outputJson
{
  void **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<nlohmann::basic_json<>> result;

  cntrl = self->_outputJson.__cntrl_;
  *v2 = self->_outputJson.__ptr_;
  v2[1] = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void)setOutputJson:(shared_ptr<nlohmann::basic_json<>>)a3
{
  std::shared_ptr<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator=[abi:nn180100](&self->_outputJson.__ptr_, (uint64_t *)a3.__ptr_);
}

- (shared_ptr<std::ofstream>)inputFile
{
  void **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<std::ofstream> result;

  cntrl = self->_inputFile.__cntrl_;
  *v2 = self->_inputFile.__ptr_;
  v2[1] = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void)setInputFile:(shared_ptr<std::ofstream>)a3
{
  std::shared_ptr<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator=[abi:nn180100](&self->_inputFile.__ptr_, (uint64_t *)a3.__ptr_);
}

- (shared_ptr<std::ofstream>)outputFile
{
  void **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<std::ofstream> result;

  cntrl = self->_outputFile.__cntrl_;
  *v2 = self->_outputFile.__ptr_;
  v2[1] = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void)setOutputFile:(shared_ptr<std::ofstream>)a3
{
  std::shared_ptr<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator=[abi:nn180100](&self->_outputFile.__ptr_, (uint64_t *)a3.__ptr_);
}

- (void).cxx_destruct
{
  std::shared_ptr<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~shared_ptr[abi:nn180100]((uint64_t)&self->_outputFile);
  std::shared_ptr<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~shared_ptr[abi:nn180100]((uint64_t)&self->_inputFile);
  std::shared_ptr<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~shared_ptr[abi:nn180100]((uint64_t)&self->_outputJson);
  std::shared_ptr<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~shared_ptr[abi:nn180100]((uint64_t)&self->_inputJson);
}

- (void)init
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_221550000, a2, OS_LOG_TYPE_ERROR, "failed to create directory: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
