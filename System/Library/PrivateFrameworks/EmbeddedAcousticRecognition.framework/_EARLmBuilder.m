@implementation _EARLmBuilder

+ (id)buildLmWithConfig:(id)a3 root:(id)a4 data:(id)a5 dir:(id)a6 shouldStop:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  NSObject *v18;
  id v19;
  quasar::LmData *v20;
  uint64_t *p_shared_owners;
  unint64_t v22;
  _EARLmModel2 *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  NSObject *v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  void *v37;
  std::__shared_weak_count *v38;
  quasar::LmData *v39;
  std::__shared_weak_count *v40;
  void *__p;
  std::__shared_weak_count *v42;
  uint64_t v43;
  const std::string *v44;
  std::__shared_weak_count *v45;
  __int128 buf;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "fileExistsAtPath:", v11);

  if ((v17 & 1) != 0)
  {
    if (v11)
    {
      objc_msgSend(v11, "ear_toString");
      if (v12)
      {
LABEL_4:
        objc_msgSend(v12, "ear_toString");
        goto LABEL_10;
      }
    }
    else
    {
      buf = 0uLL;
      v47 = 0;
      if (v12)
        goto LABEL_4;
    }
    __p = 0;
    v42 = 0;
    v43 = 0;
LABEL_10:
    quasar::makeLmBuildConfig((uint64_t)&buf, (uint64_t)&__p, (uint64_t *)&v44);
    if (SHIBYTE(v43) < 0)
      operator delete(__p);
    if (SHIBYTE(v47) < 0)
    {
      operator delete((void *)buf);
      if (v13)
      {
LABEL_14:
        objc_msgSend(v13, "data");
        v20 = v39;
        if (v14)
        {
LABEL_15:
          objc_msgSend(v14, "ear_toString");
LABEL_19:
          quasar::buildLm(v20, &v44, (const void **)&buf, 0, (uint64_t *)&__p);
          if (SHIBYTE(v47) < 0)
            operator delete((void *)buf);
          if (v40)
          {
            p_shared_owners = &v40->__shared_owners_;
            do
              v22 = __ldaxr((unint64_t *)p_shared_owners);
            while (__stlxr(v22 - 1, (unint64_t *)p_shared_owners));
            if (!v22)
            {
              ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
              std::__shared_weak_count::__release_weak(v40);
            }
          }
          if (__p)
          {
            v23 = [_EARLmModel2 alloc];
            v37 = __p;
            v38 = v42;
            if (v42)
            {
              v24 = (unint64_t *)&v42->__shared_owners_;
              do
                v25 = __ldxr(v24);
              while (__stxr(v25 + 1, v24));
            }
            v19 = -[_EARLmModel2 _initWithModel:](v23, "_initWithModel:", &v37);
            v26 = v38;
            if (v38)
            {
              v27 = (unint64_t *)&v38->__shared_owners_;
              do
                v28 = __ldaxr(v27);
              while (__stlxr(v28 - 1, v27));
              if (!v28)
              {
                ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
                std::__shared_weak_count::__release_weak(v26);
              }
            }
          }
          else
          {
            EarLmLogger();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf) = 0;
              _os_log_impl(&dword_1AD756000, v29, OS_LOG_TYPE_DEFAULT, "Model building failed", (uint8_t *)&buf, 2u);
            }

            v19 = 0;
          }
          v30 = v42;
          if (v42)
          {
            v31 = (unint64_t *)&v42->__shared_owners_;
            do
              v32 = __ldaxr(v31);
            while (__stlxr(v32 - 1, v31));
            if (!v32)
            {
              ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
              std::__shared_weak_count::__release_weak(v30);
            }
          }
          v33 = v45;
          if (v45)
          {
            v34 = (unint64_t *)&v45->__shared_owners_;
            do
              v35 = __ldaxr(v34);
            while (__stlxr(v35 - 1, v34));
            if (!v35)
            {
              ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
              std::__shared_weak_count::__release_weak(v33);
            }
          }
          goto LABEL_48;
        }
LABEL_18:
        buf = 0uLL;
        v47 = 0;
        goto LABEL_19;
      }
    }
    else if (v13)
    {
      goto LABEL_14;
    }
    v20 = 0;
    v39 = 0;
    v40 = 0;
    if (v14)
      goto LABEL_15;
    goto LABEL_18;
  }
  EarLmLogger();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1AD756000, v18, OS_LOG_TYPE_DEFAULT, "File does not exist %@", (uint8_t *)&buf, 0xCu);
  }

  v19 = 0;
LABEL_48:

  return v19;
}

+ (id)loadLmFromDir:(id)a3
{
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  _EARLmModel2 *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v25;
  std::__shared_weak_count *v26;
  void *__p[2];
  char v28;
  __int128 v29;
  char v30;
  __int128 buf;
  uint64_t v32;
  void *v33[2];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v33[0] = 0;
  v33[1] = 0;
  v34 = 0;
  LOBYTE(v29) = 0;
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) == 0)
  {
    EarLmLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_1AD756000, v6, OS_LOG_TYPE_DEFAULT, "File does not exist %@", (uint8_t *)&buf, 0xCu);
    }

    v7 = 0;
LABEL_7:
    if (!v30)
      goto LABEL_39;
    goto LABEL_34;
  }
  if (v3)
  {
    objc_msgSend(v3, "ear_toString");
  }
  else
  {
    buf = 0uLL;
    v32 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  quasar::loadLmFromDirectory((uint64_t)&buf, (uint64_t)__p, (uint64_t)v33, (uint64_t)&v29);
  if (v28 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v32) < 0)
    operator delete((void *)buf);
  if (!v30)
  {
    v7 = 0;
    goto LABEL_39;
  }
  v8 = v29;
  if ((_QWORD)v29)
  {
    v9 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
    buf = v29;
    if (*((_QWORD *)&v29 + 1))
    {
      v10 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    v12 = [_EARLmModel2 alloc];
    v25 = v8;
    v26 = v9;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }
    v7 = -[_EARLmModel2 _initWithModel:](v12, "_initWithModel:", &v25);
    v15 = v26;
    if (v26)
    {
      v16 = (unint64_t *)&v26->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
    if (*((_QWORD *)&buf + 1))
    {
      v19 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    goto LABEL_7;
  }
  v7 = 0;
LABEL_34:
  v21 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
  if (*((_QWORD *)&v29 + 1))
  {
    v22 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
LABEL_39:
  if (SHIBYTE(v34) < 0)
    operator delete(v33[0]);

  return v7;
}

+ (void)removeLmDir:(id)a3
{
  id v3;
  void *v4;
  void *__p[2];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v6 = 0;
  }
  quasar::removeLm((uint64_t)__p);
  if (SHIBYTE(v6) < 0)
    operator delete(__p[0]);

}

+ (id)generateNgramCountsWithConfig:(id)a3 root:(id)a4 data:(id)a5
{
  id v7;
  id v8;
  id v9;
  std::__shared_weak_count *v10;
  void *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::string *v19;
  void *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  const quasar::NgramSrilmCountConfig *v25;
  std::__shared_weak_count *v26;
  void *__p;
  std::__shared_weak_count *v28;
  uint64_t v29;
  void *v30;
  std::__shared_weak_count *v31;
  std::string v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    objc_msgSend(v7, "ear_toString");
    if (v8)
    {
LABEL_3:
      objc_msgSend(v8, "ear_toString");
      goto LABEL_6;
    }
  }
  else
  {
    memset(&v32, 0, sizeof(v32));
    if (v8)
      goto LABEL_3;
  }
  __p = 0;
  v28 = 0;
  v29 = 0;
LABEL_6:
  quasar::makeLmBuildConfig((uint64_t)&v32, (uint64_t)&__p, (uint64_t *)&v30);
  if (SHIBYTE(v29) < 0)
    operator delete(__p);
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v32.__r_.__value_.__l.__data_);
  v11 = v30;
  v10 = v31;
  if (v31)
  {
    p_shared_owners = (unint64_t *)&v31->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  __p = v11;
  v28 = v10;
  objc_msgSend(v9, "data");
  quasar::generateNgramCountsStr((uint64_t ***)&__p, v25, &v32);
  if (v26)
  {
    v14 = (unint64_t *)&v26->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)())v26->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v16 = v28;
  if (v28)
  {
    v17 = (unint64_t *)&v28->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v19 = &v32;
  else
    v19 = (std::string *)v32.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v32.__r_.__value_.__l.__data_);
  v21 = v31;
  if (v31)
  {
    v22 = (unint64_t *)&v31->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  return v20;
}

@end
