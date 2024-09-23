uint64_t mlc_services_model_create_bundled(const char *a1)
{
  size_t v2;
  size_t v3;
  void **p_dst;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  BOOL v10;
  size_t v11;
  size_t v12;
  void **v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  size_t v21;
  void **v22;
  size_t v23;
  size_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  std::string::size_type v31;
  std::string::size_type v32;
  int v33;
  std::string::size_type v34;
  void *v35;
  std::string::size_type size;
  uint64_t v37;
  uint64_t v38;
  int v39;
  std::string::size_type v40;
  BOOL v41;
  std::string *v42;
  std::string::size_type v43;
  unint64_t v44;
  uint64_t v45;
  char *v46;
  _BYTE *p_p;
  uint64_t v48;
  _BYTE *v49;
  _BYTE *v50;
  unint64_t v51;
  unsigned int v52;
  void **v53;
  unint64_t v54;
  int v55;
  const void *v56;
  size_t v57;
  std::string::size_type v58;
  std::string::size_type v59;
  std::string *v60;
  std::string::size_type v61;
  size_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  char v67;
  NSObject *v68;
  void **v69;
  uint64_t v70;
  size_t v72;
  void **v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  size_t v77;
  int64_t v78;
  void *v79;
  size_t v80;
  int64_t v81;
  std::string v82;
  std::string v83;
  void *__p;
  __int128 v85;
  uint64_t v86;
  void **__dst;
  size_t v88;
  unint64_t v89;
  _QWORD v90[3];

  v90[2] = *MEMORY[0x24BDAC8D0];
  v2 = strlen(a1);
  if (v2 > 0x7FFFFFFFFFFFFFF7)
    sub_240BC9D74();
  v3 = v2;
  if (v2 >= 0x17)
  {
    v5 = (v2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v2 | 7) != 0x17)
      v5 = v2 | 7;
    v6 = v5 + 1;
    p_dst = (void **)operator new(v5 + 1);
    v88 = v3;
    v89 = v6 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_8;
  }
  HIBYTE(v89) = v2;
  p_dst = (void **)&__dst;
  if (v2)
LABEL_8:
    memcpy(p_dst, a1, v3);
  *((_BYTE *)p_dst + v3) = 0;
  sub_240BD2C70((const char *)&__dst, &v86);
  if (SHIBYTE(v89) < 0)
  {
    operator delete(__dst);
    v7 = v86;
    if (v86)
      goto LABEL_11;
  }
  else
  {
    v7 = v86;
    if (v86)
    {
LABEL_11:
      v85 = 0uLL;
      __p = 0;
      v8 = *(_QWORD *)(v7 + 16);
      if (v8 < 6
        || ((v9 = *(_QWORD *)(v7 + 8), *(_DWORD *)v9 == 1852727854)
          ? (v10 = *(unsigned __int16 *)(v9 + 4) == 8307)
          : (v10 = 0),
            !v10))
      {
        v11 = strlen(a1);
        if (v11 > 0x7FFFFFFFFFFFFFF7)
          sub_240BC9D74();
        v12 = v11;
        if (v11 >= 0x17)
        {
          v17 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v11 | 7) != 0x17)
            v17 = v11 | 7;
          v18 = v17 + 1;
          v13 = (void **)operator new(v17 + 1);
          v88 = v12;
          v89 = v18 | 0x8000000000000000;
          __dst = v13;
        }
        else
        {
          HIBYTE(v89) = v11;
          v13 = (void **)&__dst;
          if (!v11)
          {
LABEL_28:
            *((_BYTE *)v13 + v12) = 0;
            v19 = sub_240BCF5AC((uint64_t)&__dst);
            v16 = v19;
            if (SHIBYTE(v89) < 0)
            {
              operator delete(__dst);
              if (!v16)
                goto LABEL_32;
            }
            else if (!v19)
            {
LABEL_32:
              v20 = strlen(a1);
              if (v20 > 0x7FFFFFFFFFFFFFF7)
                sub_240BC9D74();
              v21 = v20;
              if (v20 >= 0x17)
              {
                v26 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v20 | 7) != 0x17)
                  v26 = v20 | 7;
                v27 = v26 + 1;
                v22 = (void **)operator new(v26 + 1);
                v88 = v21;
                v89 = v27 | 0x8000000000000000;
                __dst = v22;
              }
              else
              {
                HIBYTE(v89) = v20;
                v22 = (void **)&__dst;
                if (!v20)
                {
LABEL_44:
                  *((_BYTE *)v22 + v21) = 0;
                  v16 = sub_240BCDCAC(&v86, (uint64_t)&__dst);
                  if (SHIBYTE(v89) < 0)
                    operator delete(__dst);
                  goto LABEL_164;
                }
              }
              memcpy(v22, a1, v21);
              goto LABEL_44;
            }
LABEL_164:
            if (SHIBYTE(v85) < 0)
              operator delete(__p);
            goto LABEL_166;
          }
        }
        memcpy(v13, a1, v12);
        goto LABEL_28;
      }
      sub_240BC9C18(&__p, (void *)(v9 + 6), v8 - 6);
      v23 = strlen(a1);
      if (v23 > 0x7FFFFFFFFFFFFFF7)
        sub_240BC9D74();
      v24 = v23;
      if (v23 >= 0x17)
      {
        v28 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v23 | 7) != 0x17)
          v28 = v23 | 7;
        v29 = v28 + 1;
        v25 = operator new(v28 + 1);
        v80 = v24;
        v81 = v29 | 0x8000000000000000;
        v79 = v25;
      }
      else
      {
        HIBYTE(v81) = v23;
        v25 = &v79;
        if (!v23)
          goto LABEL_50;
      }
      memcpy(v25, a1, v24);
LABEL_50:
      *((_BYTE *)v25 + v24) = 0;
      if (v81 >= 0)
        v30 = (char *)&v79;
      else
        v30 = (char *)v79;
      v31 = HIBYTE(v81);
      if (v81 < 0)
        v31 = v80;
      v32 = v31;
      do
      {
        if (!v32)
          goto LABEL_66;
        v33 = v30[--v32];
      }
      while (v33 != 47);
      if (v32 == -1)
      {
LABEL_66:
        LODWORD(size) = 0;
        *((_BYTE *)&v82.__r_.__value_.__s + 23) = 0;
        v82.__r_.__value_.__s.__data_[0] = 0;
        goto LABEL_72;
      }
      if (v31 >= v32)
        v34 = v32;
      else
        v34 = v31;
      if (v34 > 0x7FFFFFFFFFFFFFF7)
        sub_240BC9D74();
      if (v34 >= 0x17)
      {
        v37 = (v34 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v34 | 7) != 0x17)
          v37 = v34 | 7;
        v38 = v37 + 1;
        v35 = operator new(v37 + 1);
        v82.__r_.__value_.__l.__size_ = v34;
        v82.__r_.__value_.__r.__words[2] = v38 | 0x8000000000000000;
        v82.__r_.__value_.__r.__words[0] = (std::string::size_type)v35;
      }
      else
      {
        *((_BYTE *)&v82.__r_.__value_.__s + 23) = v34;
        v35 = &v82;
        if (!v34)
          goto LABEL_71;
      }
      memmove(v35, v30, v34);
LABEL_71:
      *((_BYTE *)v35 + v34) = 0;
      LODWORD(size) = HIBYTE(v82.__r_.__value_.__r.__words[2]);
LABEL_72:
      v39 = (char)size;
      size = size;
      if ((size & 0x80u) == 0)
        v40 = 22;
      else
        v40 = (v82.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
      if ((size & 0x80u) != 0)
        size = v82.__r_.__value_.__l.__size_;
      if (v40 == size)
      {
        std::string::__grow_by_and_replace(&v82, v40, 1uLL, v40, v40, 0, 1uLL, "/");
      }
      else
      {
        v41 = v39 < 0;
        v42 = &v82;
        if (v41)
          v42 = (std::string *)v82.__r_.__value_.__r.__words[0];
        v42->__r_.__value_.__s.__data_[size] = 47;
        v43 = size + 1;
        if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0)
          v82.__r_.__value_.__l.__size_ = v43;
        else
          *((_BYTE *)&v82.__r_.__value_.__s + 23) = v43 & 0x7F;
        v42->__r_.__value_.__s.__data_[v43] = 0;
      }
      v83 = v82;
      memset(&v82, 0, sizeof(v82));
      v44 = HIBYTE(v85);
      v46 = (char *)__p;
      v45 = v85;
      if (v85 >= 0)
        p_p = &__p;
      else
        p_p = __p;
      if (v85 >= 0)
        v48 = HIBYTE(v85);
      else
        v48 = v85;
      if (!v48)
        goto LABEL_100;
      v49 = &p_p[v48];
      v50 = p_p;
      while ((*v50 & 0xFD) == 0x20)
      {
        if (++v50 == v49)
          goto LABEL_100;
      }
      v51 = v50 - p_p;
      if (v50 - p_p == -1)
      {
LABEL_100:
        v52 = 0;
        HIBYTE(v89) = 0;
        LOBYTE(__dst) = 0;
LABEL_101:
        if ((v52 & 0x80u) == 0)
          v53 = (void **)&__dst;
        else
          v53 = __dst;
        if ((v52 & 0x80u) == 0)
          v44 = v52;
        v54 = v44 - 1;
        do
        {
          if (v54 == -1)
            goto LABEL_110;
          v55 = *((_BYTE *)v53 + v54--) & 0xFD;
        }
        while (v55 == 32);
        if (v54 == -2)
        {
LABEL_110:
          HIBYTE(v78) = 0;
          LOBYTE(v76) = 0;
          if ((v52 & 0x80) == 0)
            goto LABEL_112;
          goto LABEL_111;
        }
        if (v44 >= v54 + 2)
          v62 = v54 + 2;
        else
          v62 = v44;
        if (v62 > 0x7FFFFFFFFFFFFFF7)
          sub_240BC9D74();
        if (v62 >= 0x17)
        {
          v64 = (v62 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v62 | 7) != 0x17)
            v64 = v62 | 7;
          v65 = v64 + 1;
          v63 = operator new(v64 + 1);
          v77 = v62;
          v78 = v65 | 0x8000000000000000;
          v76 = v63;
        }
        else
        {
          HIBYTE(v78) = v62;
          v63 = &v76;
          if (!v62)
          {
LABEL_143:
            *((_BYTE *)v63 + v62) = 0;
            if ((v89 & 0x8000000000000000) != 0)
LABEL_111:
              operator delete(__dst);
LABEL_112:
            if (v78 >= 0)
              v56 = &v76;
            else
              v56 = v76;
            if (v78 >= 0)
              v57 = HIBYTE(v78);
            else
              v57 = v77;
            if ((v83.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v58 = 22;
            else
              v58 = (v83.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
            if ((v83.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v59 = HIBYTE(v83.__r_.__value_.__r.__words[2]);
            else
              v59 = v83.__r_.__value_.__l.__size_;
            if (v58 - v59 >= v57)
            {
              if (v57)
              {
                if ((v83.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v60 = &v83;
                else
                  v60 = (std::string *)v83.__r_.__value_.__r.__words[0];
                memmove((char *)v60 + v59, v56, v57);
                v61 = v59 + v57;
                if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
                  v83.__r_.__value_.__l.__size_ = v59 + v57;
                else
                  *((_BYTE *)&v83.__r_.__value_.__s + 23) = v61 & 0x7F;
                v60->__r_.__value_.__s.__data_[v61] = 0;
              }
            }
            else
            {
              std::string::__grow_by_and_replace(&v83, v58, v59 + v57 - v58, v59, v59, 0, v57, (const std::string::value_type *)v56);
            }
            v90[0] = v83.__r_.__value_.__l.__size_;
            v66 = (void *)v83.__r_.__value_.__r.__words[0];
            *(_QWORD *)((char *)v90 + 7) = *(std::string::size_type *)((char *)&v83.__r_.__value_.__r.__words[1] + 7);
            v67 = HIBYTE(v83.__r_.__value_.__r.__words[2]);
            memset(&v83, 0, sizeof(v83));
            if (SHIBYTE(v85) < 0)
              operator delete(__p);
            __p = v66;
            *(_QWORD *)&v85 = v90[0];
            *(_QWORD *)((char *)&v85 + 7) = *(_QWORD *)((char *)v90 + 7);
            HIBYTE(v85) = v67;
            if (SHIBYTE(v78) < 0)
            {
              operator delete(v76);
              if ((SHIBYTE(v83.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              {
LABEL_151:
                if ((SHIBYTE(v82.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                  goto LABEL_152;
                goto LABEL_157;
              }
            }
            else if ((SHIBYTE(v83.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
              goto LABEL_151;
            }
            operator delete(v83.__r_.__value_.__l.__data_);
            if ((SHIBYTE(v82.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_152:
              if ((SHIBYTE(v81) & 0x80000000) == 0)
              {
LABEL_153:
                sub_240BD2C70((const char *)&__p, &__dst);
                if (__dst)
                {
                  v16 = sub_240BC9EAC((uint64_t *)&__dst);
                }
                else
                {
                  v68 = os_log_create("com.apple.mlcompiler.service", "Execution");
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                    sub_240BDA09C((char *)&v85 + 15, &__p, v68);
                  v16 = 0;
                }
                v69 = __dst;
                __dst = 0;
                if (v69)
                  (*((void (**)(void **))*v69 + 1))(v69);
                goto LABEL_164;
              }
LABEL_158:
              operator delete(v79);
              goto LABEL_153;
            }
LABEL_157:
            operator delete(v82.__r_.__value_.__l.__data_);
            if ((SHIBYTE(v81) & 0x80000000) == 0)
              goto LABEL_153;
            goto LABEL_158;
          }
        }
        memmove(v63, v53, v62);
        goto LABEL_143;
      }
      if ((HIBYTE(v85) & 0x80) != 0)
      {
        if ((unint64_t)v85 >= v51)
        {
LABEL_170:
          v72 = v45 - v51;
          if (v45 - v51 > 0x7FFFFFFFFFFFFFF7)
            sub_240BC9D74();
          if (v72 >= 0x17)
          {
            v74 = (v72 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v72 | 7) != 0x17)
              v74 = v72 | 7;
            v75 = v74 + 1;
            v73 = (void **)operator new(v74 + 1);
            v88 = v72;
            v89 = v75 | 0x8000000000000000;
            __dst = v73;
          }
          else
          {
            HIBYTE(v89) = v45 - v51;
            v73 = (void **)&__dst;
            if (v45 == v51)
              goto LABEL_178;
          }
          memmove(v73, &v46[v51], v72);
LABEL_178:
          *((_BYTE *)v73 + v72) = 0;
          v52 = HIBYTE(v89);
          v44 = v88;
          goto LABEL_101;
        }
      }
      else if (v51 <= HIBYTE(v85))
      {
        v46 = (char *)&__p;
        v45 = HIBYTE(v85);
        goto LABEL_170;
      }
      sub_240BC9DFC();
    }
  }
  v14 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_240BDA034((uint64_t)a1, v14, v15);
  v16 = 0;
LABEL_166:
  v70 = v86;
  v86 = 0;
  if (v70)
    (*(void (**)(uint64_t))(*(_QWORD *)v70 + 8))(v70);
  return v16;
}

void sub_240BC907C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41)
{
  uint64_t v41;

  if (*(char *)(v41 - 105) < 0)
    operator delete(*(void **)(v41 - 128));
  if (a33 < 0)
  {
    operator delete(__p);
    if ((a27 & 0x80000000) == 0)
      goto LABEL_5;
  }
  else if ((a27 & 0x80000000) == 0)
  {
LABEL_5:
    if ((a21 & 0x80000000) == 0)
    {
LABEL_10:
      if (a40 < 0)
        operator delete(a35);
      if (a41)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)a41 + 8))(a41);
        _Unwind_Resume(a1);
      }
      _Unwind_Resume(a1);
    }
LABEL_9:
    operator delete(a16);
    goto LABEL_10;
  }
  operator delete(a22);
  if ((a21 & 0x80000000) == 0)
    goto LABEL_10;
  goto LABEL_9;
}

uint64_t mlc_services_model_bind_raw_ports(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!a1 || a2 && !a3 || a5 && !a6)
    return 0;
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v8 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "mlc_services_model_bind_raw_ports";
    v11 = 1024;
    v12 = v6;
    _os_log_impl(&dword_240BC3000, v8, OS_LOG_TYPE_DEFAULT, "%s() -> %{BOOL}d", (uint8_t *)&v9, 0x12u);
  }
  return v6;
}

uint64_t mlc_services_model_bind_ports(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!a1 || a2 && !a3 || a4 && !a5)
    return 0;
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  v7 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "mlc_services_model_bind_ports";
    v10 = 1024;
    v11 = v5;
    _os_log_impl(&dword_240BC3000, v7, OS_LOG_TYPE_INFO, "%s() -> %{BOOL}d", (uint8_t *)&v8, 0x12u);
  }
  return v5;
}

uint64_t mlc_services_model_load(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v1 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
  v2 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "mlc_services_model_load";
    v6 = 1024;
    v7 = v1;
    _os_log_impl(&dword_240BC3000, v2, OS_LOG_TYPE_DEFAULT, "%s() -> %{BOOL}d", (uint8_t *)&v4, 0x12u);
  }
  return v1;
}

uint64_t mlc_services_model_get_tensor_shape(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v1 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 40))(a1);
  v2 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "mlc_services_model_get_tensor_shape";
    v6 = 1024;
    v7 = v1;
    _os_log_impl(&dword_240BC3000, v2, OS_LOG_TYPE_INFO, "%s() -> %{BOOL}d", (uint8_t *)&v4, 0x12u);
  }
  return v1;
}

uint64_t mlc_services_model_set_tensor_shape(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v1 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1);
  v2 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "mlc_services_model_set_tensor_shape";
    v6 = 1024;
    v7 = v1;
    _os_log_impl(&dword_240BC3000, v2, OS_LOG_TYPE_INFO, "%s() -> %{BOOL}d", (uint8_t *)&v4, 0x12u);
  }
  return v1;
}

uint64_t mlc_services_model_reshape(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v1 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 56))(a1);
  v2 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "mlc_services_model_reshape";
    v6 = 1024;
    v7 = v1;
    _os_log_impl(&dword_240BC3000, v2, OS_LOG_TYPE_INFO, "%s() -> %{BOOL}d", (uint8_t *)&v4, 0x12u);
  }
  return v1;
}

uint64_t mlc_services_model_exec_sync(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 72))(result);
  return result;
}

uint64_t mlc_services_model_teardown(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1);
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
  v3 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "mlc_services_model_teardown";
    v7 = 1024;
    v8 = v2;
    _os_log_impl(&dword_240BC3000, v3, OS_LOG_TYPE_DEFAULT, "%s() -> %{BOOL}d", (uint8_t *)&v5, 0x12u);
  }
  return v2;
}

uint64_t sub_240BC97F0()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_240BC3000, v0, OS_LOG_TYPE_DEFAULT, "TODO: Not yet implemented", v2, 2u);
  }
  return 0;
}

uint64_t sub_240BC9860()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_240BC3000, v0, OS_LOG_TYPE_DEFAULT, "TODO: Not yet implemented", v2, 2u);
  }
  return 0;
}

uint64_t sub_240BC98D0()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_240BC3000, v0, OS_LOG_TYPE_DEFAULT, "TODO: Not yet implemented", v2, 2u);
  }
  return 0;
}

uint64_t sub_240BC9940(uint64_t a1, unint64_t a2, IOSurfaceRef *a3, unint64_t a4, IOSurfaceRef *a5)
{
  _QWORD *v10;
  size_t *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *BaseAddress;
  size_t AllocSize;
  _QWORD *v17;
  size_t *v18;
  unint64_t v19;
  void *v20;
  size_t v21;
  uint64_t v22;
  uint64_t v24;
  size_t *v25;
  void *v26;

  if (a2)
  {
    if (a2 >> 61)
      sub_240BC9E84();
    v10 = operator new(8 * a2);
    bzero(v10, 8 * a2);
    v11 = (size_t *)operator new(8 * a2);
    bzero(v11, 8 * a2);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  v25 = v11;
  v26 = v10;
  v24 = a1;
  if (!a4)
  {
    v12 = 0;
    v13 = 0;
    if (!a2)
      goto LABEL_12;
    goto LABEL_10;
  }
  if (a4 >> 61)
    sub_240BC9E84();
  v12 = operator new(8 * a4);
  bzero(v12, 8 * a4);
  v13 = operator new(8 * a4);
  bzero(v13, 8 * a4);
  if (a2)
  {
LABEL_10:
    v14 = a2;
    do
    {
      BaseAddress = IOSurfaceGetBaseAddress(*a3);
      AllocSize = IOSurfaceGetAllocSize(*a3);
      *v10++ = BaseAddress;
      *v11++ = AllocSize;
      ++a3;
      --v14;
    }
    while (v14);
  }
LABEL_12:
  if (a4)
  {
    v17 = v12;
    v18 = (size_t *)v13;
    v19 = a4;
    do
    {
      v20 = IOSurfaceGetBaseAddress(*a5);
      v21 = IOSurfaceGetAllocSize(*a5);
      *v17++ = v20;
      *v18++ = v21;
      ++a5;
      --v19;
    }
    while (v19);
  }
  v22 = (*(uint64_t (**)(uint64_t, unint64_t, void *, size_t *, unint64_t, void *, void *))(*(_QWORD *)v24 + 16))(v24, a2, v26, v25, a4, v12, v13);
  if (v13)
    operator delete(v13);
  if (v12)
    operator delete(v12);
  if (v25)
    operator delete(v25);
  if (v26)
    operator delete(v26);
  return v22;
}

void sub_240BC9B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  void *v17;

  operator delete(v17);
  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  _Unwind_Resume(a1);
}

uint64_t mlc_services_model_create_cached()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;

  v0 = os_log_create("com.apple.mlcompiler.service", "Execution");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    sub_240BDA118(v0, v1, v2);
  return 0;
}

void **sub_240BC9C18(void **__dst, void *__src, size_t __len)
{
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  size_t v11;
  unint64_t v12;
  uint64_t v13;

  LODWORD(v6) = *((char *)__dst + 23);
  if ((v6 & 0x80000000) != 0)
  {
    v10 = (unint64_t)__dst[2];
    v8 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (__len > v8)
    {
      v11 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - (v10 & 0x7FFFFFFFFFFFFFFFLL) >= __len - v8)
      {
        v9 = *__dst;
        if (v8 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          v7 = operator new(v11);
          memcpy(v7, __src, __len);
          if (v8 != 22)
            operator delete(v9);
          __dst[2] = (void *)(v11 | 0x8000000000000000);
          *__dst = v7;
LABEL_23:
          __dst[1] = (void *)__len;
          goto LABEL_24;
        }
LABEL_8:
        v12 = 2 * v8;
        if (__len > 2 * v8)
          v12 = __len;
        v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17)
          v13 = v12 | 7;
        if (v12 >= 0x17)
          v11 = v13 + 1;
        else
          v11 = 23;
        goto LABEL_15;
      }
LABEL_25:
      sub_240BC9D74();
    }
    v6 = HIBYTE(v10);
    v7 = *__dst;
  }
  else
  {
    v7 = __dst;
    if (__len > 0x16)
    {
      if (__len - 0x7FFFFFFFFFFFFFF7 >= 0x800000000000001FLL)
      {
        v8 = 22;
        v9 = __dst;
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  if (__len)
  {
    memmove(v7, __src, __len);
    LOBYTE(v6) = *((_BYTE *)__dst + 23);
  }
  if ((v6 & 0x80) != 0)
    goto LABEL_23;
  *((_BYTE *)__dst + 23) = __len & 0x7F;
LABEL_24:
  *((_BYTE *)v7 + __len) = 0;
  return __dst;
}

void sub_240BC9D74()
{
  sub_240BC9D88("basic_string");
}

void sub_240BC9D88(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_240BC9DD8(exception, a1);
  __cxa_throw(exception, (struct type_info *)&unk_25110D5E0, MEMORY[0x24BEDAAF0]);
}

void sub_240BC9DC4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_240BC9DD8(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void sub_240BC9DFC()
{
  sub_240BC9E10("basic_string");
}

void sub_240BC9E10(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_240BC9E60(exception, a1);
  __cxa_throw(exception, (struct type_info *)&unk_25110D5F8, MEMORY[0x24BEDAB00]);
}

void sub_240BC9E4C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_240BC9E60(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

void sub_240BC9E84()
{
  sub_240BC9D88("vector");
}

void sub_240BC9E98(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t sub_240BC9EAC(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = operator new();
  v3 = *a1;
  *a1 = 0;
  *(_QWORD *)v2 = &off_25110D620;
  *(_QWORD *)(v2 + 8) = v3;
  *(_BYTE *)(v2 + 71) = 4;
  strcpy((char *)(v2 + 48), "main");
  *(_QWORD *)(v2 + 224) = 0;
  *(_QWORD *)(v2 + 216) = 0;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 104) = 0u;
  *(_OWORD *)(v2 + 120) = 0u;
  *(_OWORD *)(v2 + 136) = 0u;
  *(_OWORD *)(v2 + 152) = 0u;
  *(_OWORD *)(v2 + 168) = 0u;
  *(_OWORD *)(v2 + 184) = 0u;
  *(_QWORD *)(v2 + 200) = 0;
  *(_QWORD *)(v2 + 208) = v2 + 216;
  *(_OWORD *)(v2 + 248) = 0u;
  *(_OWORD *)(v2 + 232) = 0u;
  *(_OWORD *)(v2 + 264) = 0u;
  if (!sub_240BC9F74(v2))
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
    return 0;
  }
  return v2;
}

BOOL sub_240BC9F74(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t OutputCount;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  unint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  const char *v40;
  size_t v41;
  size_t v42;
  _QWORD *v43;
  __int128 *p_dst;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  unint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  const char *v55;
  size_t v56;
  size_t v57;
  __int128 *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  const void **v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const void **v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v102;
  _QWORD *v103;
  __int128 __dst;
  unint64_t v105;
  void *__p;
  char *v107;
  char *v108;
  void *v109;
  char *v110;
  char *v111;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(v2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = BNNSGraphContextMake();
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  if (v4)
  {
    BNNSGraphContextSetArgumentType();
    *(_QWORD *)(a1 + 72) = BNNSGraphGetInputCount();
    OutputCount = BNNSGraphGetOutputCount();
    v7 = *(_QWORD *)(a1 + 232);
    *(_QWORD *)(a1 + 80) = OutputCount;
    v8 = *(_QWORD *)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 240);
    v10 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v7) >> 3);
    if (v8 <= v10)
    {
      if (v8 < v10)
      {
        v19 = v7 + 24 * v8;
        while (v9 != v19)
        {
          if (*(char *)(v9 - 1) < 0)
            operator delete(*(void **)(v9 - 24));
          v9 -= 24;
        }
        *(_QWORD *)(a1 + 240) = v19;
      }
    }
    else
    {
      sub_240BCB4A0((char **)(a1 + 232), v8 - v10);
    }
    v20 = (_QWORD *)(a1 + 256);
    v21 = *(_QWORD *)(a1 + 80);
    v22 = *(_QWORD *)(a1 + 256);
    v23 = *(_QWORD *)(a1 + 264);
    v24 = 0xAAAAAAAAAAAAAAABLL * ((v23 - v22) >> 3);
    if (v21 <= v24)
    {
      if (v21 < v24)
      {
        v25 = v22 + 24 * v21;
        while (v23 != v25)
        {
          if (*(char *)(v23 - 1) < 0)
            operator delete(*(void **)(v23 - 24));
          v23 -= 24;
        }
        *(_QWORD *)(a1 + 264) = v25;
      }
    }
    else
    {
      sub_240BCB4A0((char **)(a1 + 256), v21 - v24);
    }
    v26 = *(_QWORD *)(a1 + 88);
    v27 = *(_QWORD *)(a1 + 72);
    v28 = v27 + *(_QWORD *)(a1 + 80);
    v29 = 0x2E8BA2E8BA2E8BA3 * ((*(_QWORD *)(a1 + 96) - v26) >> 4);
    if (v28 <= v29)
    {
      if (v28 < v29)
        *(_QWORD *)(a1 + 96) = v26 + 176 * v28;
    }
    else
    {
      sub_240BCB6A8((char **)(a1 + 88), v28 - v29);
      v27 = *(_QWORD *)(a1 + 72);
      v28 = v27 + *(_QWORD *)(a1 + 80);
    }
    v30 = *(_QWORD *)(a1 + 112);
    v31 = (*(_QWORD *)(a1 + 120) - v30) >> 4;
    if (v28 <= v31)
    {
      if (v28 < v31)
        *(_QWORD *)(a1 + 120) = v30 + 16 * v28;
    }
    else
    {
      sub_240BCB884((char **)(a1 + 112), v28 - v31);
      v27 = *(_QWORD *)(a1 + 72);
    }
    v109 = 0;
    v110 = 0;
    v111 = 0;
    v103 = (_QWORD *)(a1 + 232);
    if (v27)
    {
      if (v27 >> 61)
        sub_240BC9E84();
      v32 = (char *)operator new(8 * v27);
      v33 = &v32[8 * v27];
      v109 = v32;
      v111 = v33;
      bzero(v32, 8 * v27);
      v110 = v33;
    }
    v34 = *(_QWORD *)(a1 + 80);
    v107 = 0;
    v108 = 0;
    __p = 0;
    if (v34)
    {
      if (v34 >> 61)
        sub_240BC9E84();
      v35 = (char *)operator new(8 * v34);
      __p = v35;
      v108 = &v35[8 * v34];
      bzero(v35, 8 * v34);
      v107 = v108;
    }
    else
    {
      v35 = 0;
    }
    v102 = v4;
    BNNSGraphGetInputNames_v2();
    BNNSGraphGetOutputNames_v2();
    if (*(_QWORD *)(a1 + 80))
    {
      v36 = 0;
      v37 = 0;
      v38 = 0;
      v39 = 0;
      do
      {
        v40 = *(const char **)&v35[8 * (_QWORD)v39];
        v41 = strlen(v40);
        if (v41 > 0x7FFFFFFFFFFFFFF7)
          sub_240BC9D74();
        v42 = v41;
        v43 = v20;
        if (v41 >= 0x17)
        {
          v45 = (v41 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v41 | 7) != 0x17)
            v45 = v41 | 7;
          v46 = v45 + 1;
          p_dst = (__int128 *)operator new(v45 + 1);
          *((_QWORD *)&__dst + 1) = v42;
          v105 = v46 | 0x8000000000000000;
          *(_QWORD *)&__dst = p_dst;
        }
        else
        {
          HIBYTE(v105) = v41;
          p_dst = &__dst;
          if (!v41)
            goto LABEL_47;
        }
        memmove(p_dst, v40, v42);
LABEL_47:
        *((_BYTE *)p_dst + v42) = 0;
        v20 = v43;
        v47 = *v43 + v38;
        if (*(char *)(v47 + 23) < 0)
          operator delete(*(void **)v47);
        v48 = __dst;
        *(_QWORD *)(v47 + 16) = v105;
        *(_OWORD *)v47 = v48;
        *(_QWORD *)&__dst = *v43 + v38;
        sub_240BCD7C4((uint64_t **)(a1 + 208), (const void **)__dst, (uint64_t)&unk_240BDBA4F, (__int128 **)&__dst)[7] = v39;
        v49 = *(_QWORD *)(a1 + 88) + v37;
        v35 = (char *)__p;
        BNNSGraphContextGetTensorDescriptor_v2();
        v50 = (_QWORD *)(*(_QWORD *)(a1 + 112) + v36);
        *v50 = v49;
        v50[1] = 0;
        v39 = (uint64_t *)((char *)v39 + 1);
        v38 += 24;
        v37 += 176;
        v36 += 16;
      }
      while ((unint64_t)v39 < *(_QWORD *)(a1 + 80));
    }
    if (*(_QWORD *)(a1 + 72))
    {
      v51 = 0;
      v52 = 0;
      v53 = v109;
      do
      {
        v54 = *(_QWORD *)(a1 + 80);
        v55 = (const char *)v53[v52];
        v56 = strlen(v55);
        if (v56 > 0x7FFFFFFFFFFFFFF7)
          sub_240BC9D74();
        v57 = v56;
        if (v56 >= 0x17)
        {
          v59 = (v56 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v56 | 7) != 0x17)
            v59 = v56 | 7;
          v60 = v59 + 1;
          v58 = (__int128 *)operator new(v59 + 1);
          *((_QWORD *)&__dst + 1) = v57;
          v105 = v60 | 0x8000000000000000;
          *(_QWORD *)&__dst = v58;
        }
        else
        {
          HIBYTE(v105) = v56;
          v58 = &__dst;
          if (!v56)
            goto LABEL_60;
        }
        memmove(v58, v55, v57);
LABEL_60:
        *((_BYTE *)v58 + v57) = 0;
        v61 = *v103 + v51;
        if (*(char *)(v61 + 23) < 0)
          operator delete(*(void **)v61);
        v62 = __dst;
        *(_QWORD *)(v61 + 16) = v105;
        *(_OWORD *)v61 = v62;
        *(_QWORD *)&__dst = *v103 + v51;
        sub_240BCD7C4((uint64_t **)(a1 + 208), (const void **)__dst, (uint64_t)&unk_240BDBA4F, (__int128 **)&__dst)[7] = (uint64_t *)(v52 + v54);
        v63 = *(_QWORD *)(a1 + 88) + 176 * (v52 + v54);
        v53 = v109;
        BNNSGraphContextGetTensorDescriptor_v2();
        v64 = (uint64_t *)(*(_QWORD *)(a1 + 112) + 16 * (v52 + v54));
        *v64 = v63;
        v64[1] = 0;
        ++v52;
        v51 += 24;
      }
      while (v52 < *(_QWORD *)(a1 + 72));
    }
    v65 = *(_QWORD *)(a1 + 232);
    v66 = *(const void ***)(a1 + 240);
    v67 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((uint64_t)v66 - v65) >> 3));
    if (v66 == (const void **)v65)
      v68 = 0;
    else
      v68 = v67;
    sub_240BCB9AC(v65, v66, (uint64_t)&__dst, v68, 1);
    v69 = *(_QWORD *)(a1 + 256);
    v70 = *(const void ***)(a1 + 264);
    v71 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((uint64_t)v70 - v69) >> 3));
    if (v70 == (const void **)v69)
      v72 = 0;
    else
      v72 = v71;
    sub_240BCB9AC(v69, v70, (uint64_t)&__dst, v72, 1);
    v74 = (uint64_t *)(a1 + 136);
    v73 = *(_QWORD *)(a1 + 136);
    v75 = *(_QWORD *)(a1 + 72) + *(_QWORD *)(a1 + 80);
    v76 = (*(_QWORD *)(a1 + 144) - v73) >> 4;
    if (v75 <= v76)
    {
      if (v75 < v76)
        *(_QWORD *)(a1 + 144) = v73 + 16 * v75;
    }
    else
    {
      sub_240BCB884((char **)(a1 + 136), v75 - v76);
      v75 = *(_QWORD *)(a1 + 72) + *(_QWORD *)(a1 + 80);
    }
    v77 = *(_QWORD *)(a1 + 160);
    v78 = (uint64_t *)(a1 + 160);
    v79 = (*(_QWORD *)(a1 + 168) - v77) >> 6;
    if (v75 <= v79)
    {
      if (v75 < v79)
        *(_QWORD *)(a1 + 168) = v77 + (v75 << 6);
    }
    else
    {
      sub_240BCD648((char **)(a1 + 160), v75 - v79);
      v75 = *(_QWORD *)(a1 + 72) + *(_QWORD *)(a1 + 80);
    }
    v80 = *(_QWORD *)(a1 + 184);
    v81 = (*(_QWORD *)(a1 + 192) - v80) >> 6;
    if (v75 <= v81)
    {
      if (v75 < v81)
        *(_QWORD *)(a1 + 192) = v80 + (v75 << 6);
    }
    else
    {
      sub_240BCD648((char **)(a1 + 184), v75 - v81);
    }
    v82 = *(_QWORD *)(a1 + 88);
    if (*(_QWORD *)(a1 + 96) != v82)
    {
      v83 = 0;
      v84 = -16;
      v85 = -8;
      do
      {
        v86 = *v74;
        v87 = (uint64_t *)(*v74 + 16 * v83);
        *v87 = 8;
        v88 = *(_QWORD *)(v82 + 176 * v83 + 8);
        v89 = *v78;
        if (v88)
        {
          v90 = (_QWORD *)(v89 + (v83 << 6));
          *v90 = v88;
          v91 = *(_QWORD *)(v82 + 176 * v83 + 16);
          if (v91)
          {
            v90[1] = v91;
            v92 = *(_QWORD *)(v82 + 176 * v83 + 24);
            if (v92)
            {
              v90[2] = v92;
              v93 = *(_QWORD *)(v82 + 176 * v83 + 32);
              if (v93)
              {
                v90[3] = v93;
                v94 = *(_QWORD *)(v82 + 176 * v83 + 40);
                if (v94)
                {
                  v90[4] = v94;
                  v95 = *(_QWORD *)(v82 + 176 * v83 + 48);
                  if (v95)
                  {
                    v90[5] = v95;
                    v96 = *(_QWORD *)(v82 + 176 * v83 + 56);
                    if (v96)
                    {
                      v90[6] = v96;
                      v97 = *(_QWORD *)(v82 + 176 * v83 + 64);
                      if (v97)
                      {
                        v90[7] = v97;
                        v98 = 8;
                        goto LABEL_102;
                      }
                      v98 = 7;
                    }
                    else
                    {
                      v98 = 6;
                    }
                  }
                  else
                  {
                    v98 = 5;
                  }
                }
                else
                {
                  v98 = 4;
                }
              }
              else
              {
                v98 = 3;
              }
            }
            else
            {
              v98 = 2;
            }
          }
          else
          {
            v98 = 1;
          }
          *v87 = v98;
        }
        else
        {
          v98 = 0;
          *v87 = 0;
        }
LABEL_102:
        *(_QWORD *)(v86 + 16 * v83 + 8) = v89 + (v83 << 6);
        v99 = *(_QWORD *)(a1 + 184);
        v100 = sub_240BCA8A0(*(_DWORD *)(v82 + 176 * v83 + 144));
        if (v98)
        {
          for (*(_QWORD *)(v99 + (v83 << 6) + 8 * (v98 - 1)) = v100; v98 != 1; --v98)
          {
            v100 *= *(_QWORD *)(v89 + v85 + 8 * v98);
            *(_QWORD *)(v99 + v84 + 8 * v98) = v100;
          }
        }
        ++v83;
        v82 = *(_QWORD *)(a1 + 88);
        v84 += 64;
        v85 += 64;
        v74 = (uint64_t *)(a1 + 136);
        v78 = (uint64_t *)(a1 + 160);
      }
      while (v83 < 0x2E8BA2E8BA2E8BA3 * ((*(_QWORD *)(a1 + 96) - v82) >> 4));
    }
    if (__p)
      operator delete(__p);
    v4 = v102;
    if (v109)
      operator delete(v109);
  }
  else
  {
    v11 = os_log_create("com.apple.mlcompiler.service", "ExecutionBNNSGraph");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_240BDA18C(v11, v12, v13, v14, v15, v16, v17, v18);
  }
  return v4 != 0;
}

void sub_240BCA834(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, void *a19, uint64_t a20)
{
  if (__p)
    operator delete(__p);
  if (a19)
    operator delete(a19);
  _Unwind_Resume(exception_object);
}

uint64_t sub_240BCA8A0(int a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 <= 131103)
  {
    if (a1 <= 98319)
    {
      if (a1 != 65552)
      {
        if (a1 == 65568)
          return 4;
        goto LABEL_15;
      }
    }
    else if (a1 != 98320)
    {
      if (a1 == 131080)
        return 1;
      if (a1 != 131088)
        goto LABEL_15;
    }
    return 2;
  }
  v1 = 8;
  if (a1 <= 262159)
  {
    if (a1 != 131104)
    {
      if (a1 != 131136)
      {
        if (a1 != 262152)
          goto LABEL_15;
        return 1;
      }
      return v1;
    }
    return 4;
  }
  switch(a1)
  {
    case 262160:
      return 2;
    case 262208:
      return v1;
    case 262176:
      return 4;
  }
LABEL_15:
  v2 = os_log_create("com.apple.mlcompiler.service", "ExecutionBNNSGraph");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    sub_240BDA1C0(v2, v3, v4, v5, v6, v7, v8, v9);
  return 0;
}

uint64_t sub_240BCA9FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  *(_QWORD *)a1 = &off_25110D620;
  v2 = *(_QWORD *)(a1 + 256);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 264);
    v4 = *(void **)(a1 + 256);
    if (v3 != v2)
    {
      do
      {
        if (*(char *)(v3 - 1) < 0)
          operator delete(*(void **)(v3 - 24));
        v3 -= 24;
      }
      while (v3 != v2);
      v4 = *(void **)(a1 + 256);
    }
    *(_QWORD *)(a1 + 264) = v2;
    operator delete(v4);
  }
  v5 = *(_QWORD *)(a1 + 232);
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 240);
    v7 = *(void **)(a1 + 232);
    if (v6 != v5)
    {
      do
      {
        if (*(char *)(v6 - 1) < 0)
          operator delete(*(void **)(v6 - 24));
        v6 -= 24;
      }
      while (v6 != v5);
      v7 = *(void **)(a1 + 232);
    }
    *(_QWORD *)(a1 + 240) = v5;
    operator delete(v7);
  }
  sub_240BCD774(a1 + 208, *(char **)(a1 + 216));
  v8 = *(void **)(a1 + 184);
  if (v8)
  {
    *(_QWORD *)(a1 + 192) = v8;
    operator delete(v8);
  }
  v9 = *(void **)(a1 + 160);
  if (v9)
  {
    *(_QWORD *)(a1 + 168) = v9;
    operator delete(v9);
  }
  v10 = *(void **)(a1 + 136);
  if (v10)
  {
    *(_QWORD *)(a1 + 144) = v10;
    operator delete(v10);
  }
  v11 = *(void **)(a1 + 112);
  if (v11)
  {
    *(_QWORD *)(a1 + 120) = v11;
    operator delete(v11);
  }
  v12 = *(void **)(a1 + 88);
  if (v12)
  {
    *(_QWORD *)(a1 + 96) = v12;
    operator delete(v12);
  }
  if (*(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
  v13 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  return nullsub_1(a1);
}

void sub_240BCAB48(uint64_t a1)
{
  sub_240BCA9FC(a1);
  JUMPOUT(0x24268B398);
}

BOOL sub_240BCAB6C(uint64_t a1, unint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  const void **v18;

  v6 = a6;
  v7 = a5;
  if (!a6 && !a3 && !(a5 | a2))
    return 1;
  if (*(_QWORD *)(a1 + 72) != a2 || *(_QWORD *)(a1 + 80) != a5)
    return 0;
  if (a5)
  {
    v12 = 0;
    do
    {
      v13 = *v6;
      if (!*v6)
        return 0;
      v18 = (const void **)(*(_QWORD *)(a1 + 256) + v12);
      *(_QWORD *)(*(_QWORD *)(a1 + 88)
                + 176
                * (_QWORD)sub_240BCD7C4((uint64_t **)(a1 + 208), v18, (uint64_t)&unk_240BDBA4F, (__int128 **)&v18)[7]
                + 136) = v13;
      ++v6;
      v12 += 24;
    }
    while (--v7);
  }
  if (!a2)
    return 1;
  v14 = *a3;
  if (!*a3)
    return 0;
  v15 = 0;
  v16 = 1;
  do
  {
    v17 = v16;
    v18 = (const void **)(*(_QWORD *)(a1 + 232) + v15);
    *(_QWORD *)(*(_QWORD *)(a1 + 88)
              + 176
              * (_QWORD)sub_240BCD7C4((uint64_t **)(a1 + 208), v18, (uint64_t)&unk_240BDBA4F, (__int128 **)&v18)[7]
              + 136) = v14;
    if (a2 == v17)
      break;
    v14 = a3[v17];
    v15 += 24;
    v16 = v17 + 1;
  }
  while (v14);
  return v17 >= a2;
}

uint64_t sub_240BCACD0()
{
  return 1;
}

BOOL sub_240BCACD8(_QWORD *a1, char *__s, unint64_t a3, _QWORD *a4, _QWORD *a5)
{
  size_t v10;
  const void *v11;
  const void **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  _BOOL8 result;
  NSObject *v23;
  NSObject *v24;
  const void *__dst[2];
  unint64_t v26;

  v10 = strlen(__s);
  if (v10 >= 0x7FFFFFFFFFFFFFF8)
    sub_240BC9D74();
  v11 = (const void *)v10;
  if (v10 >= 0x17)
  {
    v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v13 = v10 | 7;
    v14 = v13 + 1;
    v12 = (const void **)operator new(v13 + 1);
    __dst[1] = v11;
    v26 = v14 | 0x8000000000000000;
    __dst[0] = v12;
    goto LABEL_8;
  }
  HIBYTE(v26) = v10;
  v12 = __dst;
  if (v10)
LABEL_8:
    memcpy(v12, __s, (size_t)v11);
  *((_BYTE *)v11 + (_QWORD)v12) = 0;
  v15 = sub_240BCDB7C((uint64_t)(a1 + 26), __dst);
  if (SHIBYTE(v26) < 0)
    operator delete((void *)__dst[0]);
  if (a1 + 27 == v15)
  {
    v23 = os_log_create("com.apple.mlcompiler.service", "ExecutionBNNSGraph");
    result = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_240BDA1F4();
      return 0;
    }
  }
  else if (a3 >= 9)
  {
    v24 = os_log_create("com.apple.mlcompiler.service", "ExecutionBNNSGraph");
    result = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_240BDA254();
      return 0;
    }
  }
  else
  {
    if (a3)
    {
      v16 = v15[7];
      v17 = a1[23];
      v18 = *(_QWORD **)(a1[17] + 16 * v16 + 8);
      *a4 = *v18;
      if (a3 != 1)
      {
        a4[1] = v18[1];
        if (a3 != 2)
        {
          a4[2] = v18[2];
          if (a3 != 3)
          {
            a4[3] = v18[3];
            if (a3 != 4)
            {
              a4[4] = v18[4];
              if (a3 != 5)
              {
                a4[5] = v18[5];
                if (a3 != 6)
                {
                  a4[6] = v18[6];
                  if (a3 != 7)
                    a4[7] = v18[7];
                }
              }
            }
          }
        }
      }
      v19 = 8 * a3;
      v20 = (uint64_t *)(v17 + (v16 << 6));
      do
      {
        v21 = *v20++;
        *a5++ = v21;
        v19 -= 8;
      }
      while (v19);
    }
    return 1;
  }
  return result;
}

void sub_240BCAF04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL sub_240BCAF20(_QWORD *a1, char *__s, unint64_t a3, uint64_t *a4, _QWORD *a5)
{
  size_t v10;
  const void *v11;
  const void **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL8 v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  _QWORD *v35;
  unint64_t v36;
  uint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  __int128 *v40;
  _OWORD *v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  const void *__dst[2];
  unint64_t v51;

  v10 = strlen(__s);
  if (v10 >= 0x7FFFFFFFFFFFFFF8)
    sub_240BC9D74();
  v11 = (const void *)v10;
  if (v10 >= 0x17)
  {
    v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v13 = v10 | 7;
    v14 = v13 + 1;
    v12 = (const void **)operator new(v13 + 1);
    __dst[1] = v11;
    v51 = v14 | 0x8000000000000000;
    __dst[0] = v12;
    goto LABEL_8;
  }
  HIBYTE(v51) = v10;
  v12 = __dst;
  if (v10)
LABEL_8:
    memcpy(v12, __s, (size_t)v11);
  *((_BYTE *)v11 + (_QWORD)v12) = 0;
  v15 = sub_240BCDB7C((uint64_t)(a1 + 26), __dst);
  if (SHIBYTE(v51) < 0)
    operator delete((void *)__dst[0]);
  if (a1 + 27 == v15)
  {
    v17 = os_log_create("com.apple.mlcompiler.service", "ExecutionBNNSGraph");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_240BDA2B4();
    return 0;
  }
  if (a3 >= 9)
  {
    v16 = os_log_create("com.apple.mlcompiler.service", "ExecutionBNNSGraph");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_240BDA254();
    return 0;
  }
  v20 = v15[7];
  v21 = a1[11];
  v22 = a1[17];
  v23 = (uint64_t *)(v22 + 16 * v20);
  v24 = a1[23];
  if (a3)
  {
    v25 = v21 + 176 * v20;
    *(_QWORD *)(v25 + 8) = *a4;
    v26 = (_QWORD *)(v25 + 8);
    if (a3 != 1)
    {
      v26[1] = a4[1];
      if (a3 != 2)
      {
        v26[2] = a4[2];
        if (a3 != 3)
        {
          v26[3] = a4[3];
          if (a3 != 4)
          {
            v26[4] = a4[4];
            if (a3 != 5)
            {
              v26[5] = a4[5];
              if (a3 != 6)
              {
                v26[6] = a4[6];
                if (a3 != 7)
                  v26[7] = a4[7];
              }
            }
          }
        }
      }
    }
    v27 = *(_QWORD **)(v22 + 16 * v20 + 8);
    v28 = 8 * a3;
    do
    {
      v29 = *a4++;
      *v27++ = v29;
      v28 -= 8;
    }
    while (v28);
  }
  v30 = *v23;
  v31 = a1[20];
  v32 = sub_240BCA8A0(*(_DWORD *)(v21 + 176 * v20 + 144));
  if (v30)
  {
    for (*(_QWORD *)(v24 + (v20 << 6) + 8 * (v30 - 1)) = v32; v30 != 1; --v30)
    {
      v32 *= *(_QWORD *)((v20 << 6) + v31 - 8 + 8 * v30);
      *(_QWORD *)((v20 << 6) + v24 - 16 + 8 * v30) = v32;
    }
  }
  if (!a3)
    return 1;
  v33 = a1[23];
  v34 = (uint64_t *)(v33 + (v20 << 6));
  v35 = (_QWORD *)(v21 + 176 * v20 + 72);
  v36 = (a3 - 1) & 0x1FFFFFFFFFFFFFFFLL;
  v37 = v34;
  if (v36 < 3)
    goto LABEL_51;
  v38 = v36 + 1;
  v39 = v38 & 0x3FFFFFFFFFFFFFFCLL;
  v35 = (_QWORD *)((char *)v35 + v39 * 8);
  v37 = &v34[v39];
  v40 = (__int128 *)(v33 + (v20 << 6) + 16);
  v41 = (_OWORD *)(v21 + 176 * v20 + 88);
  v42 = v38 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    v43 = *v40;
    *(v41 - 1) = *(v40 - 1);
    *v41 = v43;
    v40 += 2;
    v41 += 2;
    v42 -= 4;
  }
  while (v42);
  if (v38 != (v38 & 0x3FFFFFFFFFFFFFFCLL))
  {
LABEL_51:
    do
    {
      v44 = *v37++;
      *v35++ = v44;
    }
    while (v37 != &v34[a3]);
  }
  if (*v34 == *a5)
  {
    v45 = 0;
    v46 = v33 + (v20 << 6) + 8;
    while (a3 - 1 != v45)
    {
      v47 = *(_QWORD *)(v46 + 8 * v45);
      v48 = a5[++v45];
      if (v47 != v48)
      {
        v18 = v45 >= a3;
        goto LABEL_46;
      }
    }
    return 1;
  }
  v18 = 0;
LABEL_46:
  v49 = os_log_create("com.apple.mlcompiler.service", "ExecutionBNNSGraph");
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    sub_240BDA314();
  return v18;
}

void sub_240BCB2C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL sub_240BCB2DC(_QWORD *a1)
{
  int v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v12[16];

  v2 = BNNSGraphContextSetDynamicShapes_v2();
  if (v2 < 0)
  {
    v10 = os_log_create("com.apple.mlcompiler.service", "ExecutionBNNSGraph");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_240BC3000, v10, OS_LOG_TYPE_INFO, "BNNSGraph: Couldn't set dynamic shapes", v12, 2u);
    }
  }
  else if (a1[10])
  {
    v3 = 0;
    v4 = -16;
    v5 = -8;
    do
    {
      v6 = *(_QWORD *)(a1[17] + 16 * v3);
      v7 = a1[23];
      v8 = a1[20];
      v9 = sub_240BCA8A0(*(_DWORD *)(a1[11] + 176 * v3 + 144));
      if (v6)
      {
        for (*(_QWORD *)(v7 + (v3 << 6) + 8 * (v6 - 1)) = v9; v6 != 1; --v6)
        {
          v9 *= *(_QWORD *)(v8 + v5 + 8 * v6);
          *(_QWORD *)(v7 + v4 + 8 * v6) = v9;
        }
      }
      ++v3;
      v4 += 64;
      v5 += 64;
    }
    while (v3 < a1[10]);
  }
  return v2 >= 0;
}

uint64_t sub_240BCB438()
{
  BNNSGraphContextExecute_v2();
  return 1;
}

uint64_t sub_240BCB480()
{
  BNNSGraphContextDestroy_v2();
  return 1;
}

void sub_240BCB4A0(char **a1, unint64_t a2)
{
  char *v4;
  char *v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  size_t v15;
  char *v16;
  __int128 v17;
  char *v18;

  v5 = a1[1];
  v4 = a1[2];
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - v5) >> 3) >= a2)
  {
    if (a2)
    {
      v12 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(a1[1], v12);
      v5 += v12;
    }
    a1[1] = v5;
  }
  else
  {
    v6 = *a1;
    v7 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 3);
    v8 = v7 + a2;
    if (v7 + a2 > 0xAAAAAAAAAAAAAAALL)
      sub_240BC9E84();
    v9 = 0xAAAAAAAAAAAAAAABLL * ((v4 - v6) >> 3);
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x555555555555555)
      v10 = 0xAAAAAAAAAAAAAAALL;
    else
      v10 = v8;
    if (v10)
    {
      if (v10 > 0xAAAAAAAAAAAAAAALL)
        sub_240BCB680();
      v11 = (char *)operator new(24 * v10);
    }
    else
    {
      v11 = 0;
    }
    v13 = &v11[24 * v7];
    v14 = &v11[24 * v10];
    v15 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v13, v15);
    v16 = &v13[v15];
    if (v5 == v6)
    {
      *a1 = v13;
      a1[1] = v16;
      a1[2] = v14;
      if (v5)
LABEL_24:
        operator delete(v5);
    }
    else
    {
      do
      {
        v17 = *(_OWORD *)(v5 - 24);
        *((_QWORD *)v13 - 1) = *((_QWORD *)v5 - 1);
        *(_OWORD *)(v13 - 24) = v17;
        v13 -= 24;
        *((_QWORD *)v5 - 2) = 0;
        *((_QWORD *)v5 - 1) = 0;
        *((_QWORD *)v5 - 3) = 0;
        v5 -= 24;
      }
      while (v5 != v6);
      v18 = *a1;
      v5 = a1[1];
      *a1 = v13;
      a1[1] = v16;
      a1[2] = v14;
      if (v5 != v18)
      {
        do
        {
          if (*(v5 - 1) < 0)
            operator delete(*((void **)v5 - 3));
          v5 -= 24;
        }
        while (v5 != v18);
        v5 = v18;
      }
      if (v5)
        goto LABEL_24;
    }
  }
}

void sub_240BCB680()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, (struct type_info *)&unk_25110D688, MEMORY[0x24BEDABB8]);
}

void sub_240BCB6A8(char **a1, unint64_t a2)
{
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  size_t v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v5 = a1[1];
  v4 = a1[2];
  if (0x2E8BA2E8BA2E8BA3 * ((v4 - v5) >> 4) >= a2)
  {
    if (a2)
    {
      v12 = 176 * ((176 * a2 - 176) / 0xB0) + 176;
      bzero(a1[1], v12);
      v5 += v12;
    }
    a1[1] = v5;
  }
  else
  {
    v6 = *a1;
    v7 = 0x2E8BA2E8BA2E8BA3 * ((v5 - *a1) >> 4);
    v8 = v7 + a2;
    if (v7 + a2 > 0x1745D1745D1745DLL)
      sub_240BC9E84();
    v9 = 0x2E8BA2E8BA2E8BA3 * ((v4 - v6) >> 4);
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0xBA2E8BA2E8BA2ELL)
      v10 = 0x1745D1745D1745DLL;
    else
      v10 = v8;
    if (v10)
    {
      if (v10 > 0x1745D1745D1745DLL)
        sub_240BCB680();
      v11 = (char *)operator new(176 * v10);
    }
    else
    {
      v11 = 0;
    }
    v13 = &v11[176 * v7];
    v14 = &v11[176 * v10];
    v15 = 176 * ((176 * a2 - 176) / 0xB0) + 176;
    bzero(v13, v15);
    v16 = &v13[v15];
    if (v5 != v6)
    {
      do
      {
        v17 = *((_OWORD *)v5 - 11);
        v18 = *((_OWORD *)v5 - 9);
        *((_OWORD *)v13 - 10) = *((_OWORD *)v5 - 10);
        *((_OWORD *)v13 - 9) = v18;
        *((_OWORD *)v13 - 11) = v17;
        v19 = *((_OWORD *)v5 - 8);
        v20 = *((_OWORD *)v5 - 7);
        v21 = *((_OWORD *)v5 - 5);
        *((_OWORD *)v13 - 6) = *((_OWORD *)v5 - 6);
        *((_OWORD *)v13 - 5) = v21;
        *((_OWORD *)v13 - 8) = v19;
        *((_OWORD *)v13 - 7) = v20;
        v22 = *((_OWORD *)v5 - 4);
        v23 = *((_OWORD *)v5 - 3);
        v24 = *((_OWORD *)v5 - 1);
        *((_OWORD *)v13 - 2) = *((_OWORD *)v5 - 2);
        *((_OWORD *)v13 - 1) = v24;
        *((_OWORD *)v13 - 4) = v22;
        *((_OWORD *)v13 - 3) = v23;
        v13 -= 176;
        v5 -= 176;
      }
      while (v5 != v6);
      v5 = *a1;
    }
    *a1 = v13;
    a1[1] = v16;
    a1[2] = v14;
    if (v5)
      operator delete(v5);
  }
}

void sub_240BCB884(char **a1, unint64_t a2)
{
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  size_t v14;
  char *v15;
  char *v16;

  v5 = a1[1];
  v4 = a1[2];
  if (a2 <= (v4 - v5) >> 4)
  {
    if (a2)
    {
      v12 = 16 * a2;
      bzero(a1[1], 16 * a2);
      v5 += v12;
    }
    a1[1] = v5;
  }
  else
  {
    v6 = *a1;
    v7 = (v5 - *a1) >> 4;
    v8 = v7 + a2;
    if ((v7 + a2) >> 60)
      sub_240BC9E84();
    v9 = v4 - v6;
    if (v9 >> 3 > v8)
      v8 = v9 >> 3;
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0)
      v10 = 0xFFFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
    {
      if (v10 >> 60)
        sub_240BCB680();
      v11 = (char *)operator new(16 * v10);
    }
    else
    {
      v11 = 0;
    }
    v13 = &v11[16 * v7];
    v14 = 16 * a2;
    v15 = &v11[16 * v10];
    bzero(v13, v14);
    v16 = &v13[v14];
    if (v5 != v6)
    {
      do
      {
        *((_OWORD *)v13 - 1) = *((_OWORD *)v5 - 1);
        v13 -= 16;
        v5 -= 16;
      }
      while (v5 != v6);
      v5 = *a1;
    }
    *a1 = v13;
    a1[1] = v16;
    a1[2] = v15;
    if (v5)
      operator delete(v5);
  }
}

__n128 sub_240BCB9AC(uint64_t a1, const void **a2, uint64_t a3, uint64_t a4, char a5)
{
  const void **v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  const void **v17;
  const void **v18;
  __int128 v19;
  int v20;
  const void *v21;
  size_t v22;
  int v23;
  const void *v24;
  size_t v25;
  size_t v26;
  int v27;
  const void **v28;
  char v29;
  BOOL v30;
  __n128 result;
  const void **v32;
  const void **v33;
  const void **v34;
  int v35;
  const void **v36;
  size_t v37;
  int v38;
  const void *v39;
  size_t v40;
  size_t v41;
  int v42;
  unint64_t v43;
  unint64_t v44;
  __n128 *v45;
  unint64_t v46;
  __n128 v48;
  __n128 v49;
  __n128 v50;
  uint64_t v51;
  const void *v52;

LABEL_1:
  v9 = (const void **)a1;
LABEL_2:
  v10 = 1 - a4;
  while (2)
  {
    a1 = (uint64_t)v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = 0xAAAAAAAAAAAAAAABLL * (v12 >> 3);
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v34 = (const void **)*(a2 - 3);
        v33 = a2 - 3;
        v32 = v34;
        v35 = *((char *)v33 + 23);
        if (v35 >= 0)
          v36 = v33;
        else
          v36 = v32;
        if (v35 >= 0)
          v37 = *((unsigned __int8 *)v33 + 23);
        else
          v37 = (size_t)v33[1];
        v38 = *(char *)(a1 + 23);
        if (v38 >= 0)
          v39 = (const void *)a1;
        else
          v39 = *(const void **)a1;
        if (v38 >= 0)
          v40 = *(unsigned __int8 *)(a1 + 23);
        else
          v40 = *(_QWORD *)(a1 + 8);
        if (v40 >= v37)
          v41 = v37;
        else
          v41 = v40;
        v42 = memcmp(v36, v39, v41);
        if (v42)
        {
          if ((v42 & 0x80000000) == 0)
            return result;
        }
        else if (v37 >= v40)
        {
          return result;
        }
        v52 = *(const void **)(a1 + 16);
        v50 = *(__n128 *)a1;
        v48 = *(__n128 *)v33;
        *(_QWORD *)(a1 + 16) = v33[2];
        *(__n128 *)a1 = v48;
        result = v50;
        *(__n128 *)v33 = v50;
        v33[2] = v52;
        return result;
      case 3uLL:
        sub_240BCC140((const void **)a1, (const void **)(a1 + 24), a2 - 3);
        return result;
      case 4uLL:
        result.n128_u64[0] = sub_240BCCC68(a1, (__int128 *)(a1 + 24), (__int128 *)(a1 + 48), a2 - 3).n128_u64[0];
        return result;
      case 5uLL:
        result.n128_u64[0] = sub_240BCCE00(a1, a1 + 24, a1 + 48, (__int128 *)(a1 + 72), a2 - 3).n128_u64[0];
        return result;
      default:
        if (v12 <= 575)
        {
          if ((a5 & 1) != 0)
            sub_240BCBE14((const void **)a1, a2);
          else
            sub_240BCBFD8((const void **)a1, a2);
          return result;
        }
        if (v10 != 1)
        {
          v14 = v13 >> 1;
          v15 = a1 + 24 * (v13 >> 1);
          if ((unint64_t)v12 < 0xC01)
          {
            sub_240BCC140((const void **)v15, (const void **)a1, a2 - 3);
            if ((a5 & 1) != 0)
              goto LABEL_29;
          }
          else
          {
            sub_240BCC140((const void **)a1, (const void **)v15, a2 - 3);
            v16 = 24 * v14;
            v17 = (const void **)(24 * v14 + a1 - 24);
            sub_240BCC140((const void **)(a1 + 24), v17, a2 - 6);
            v18 = (const void **)(a1 + 24 + v16);
            sub_240BCC140((const void **)(a1 + 48), v18, a2 - 9);
            sub_240BCC140(v17, (const void **)v15, v18);
            v51 = *(_QWORD *)(a1 + 16);
            v49 = *(__n128 *)a1;
            v19 = *(_OWORD *)v15;
            *(_QWORD *)(a1 + 16) = *(_QWORD *)(v15 + 16);
            *(_OWORD *)a1 = v19;
            *(_QWORD *)(v15 + 16) = v51;
            *(__n128 *)v15 = v49;
            if ((a5 & 1) != 0)
              goto LABEL_29;
          }
          v20 = *(char *)(a1 - 1);
          if (v20 >= 0)
            v21 = (const void *)(a1 - 24);
          else
            v21 = *(const void **)(a1 - 24);
          if (v20 >= 0)
            v22 = *(unsigned __int8 *)(a1 - 1);
          else
            v22 = *(_QWORD *)(a1 - 16);
          v23 = *(char *)(a1 + 23);
          if (v23 >= 0)
            v24 = (const void *)a1;
          else
            v24 = *(const void **)a1;
          if (v23 >= 0)
            v25 = *(unsigned __int8 *)(a1 + 23);
          else
            v25 = *(_QWORD *)(a1 + 8);
          if (v25 >= v22)
            v26 = v22;
          else
            v26 = v25;
          v27 = memcmp(v21, v24, v26);
          if (v27)
          {
            if ((v27 & 0x80000000) == 0)
              goto LABEL_33;
          }
          else if (v22 >= v25)
          {
LABEL_33:
            v9 = sub_240BCC39C((const void **)a1, a2);
            goto LABEL_34;
          }
LABEL_29:
          v28 = (const void **)sub_240BCC68C((__int128 *)a1, (unint64_t)a2);
          if ((v29 & 1) == 0)
            goto LABEL_32;
          v30 = sub_240BCC958(a1, v28);
          v9 = v28 + 3;
          if (!sub_240BCC958((uint64_t)(v28 + 3), a2))
          {
            v10 = v11 + 1;
            if (v30)
              continue;
LABEL_32:
            sub_240BCB9AC(a1, v28, a3, -v11, a5 & 1);
            v9 = v28 + 3;
LABEL_34:
            a5 = 0;
            a4 = -v11;
            goto LABEL_2;
          }
          a4 = -v11;
          a2 = v28;
          if (v30)
            return result;
          goto LABEL_1;
        }
        if ((const void **)a1 != a2)
        {
          v43 = (v13 - 2) >> 1;
          v44 = v43 + 1;
          v45 = (__n128 *)(a1 + 24 * v43);
          do
          {
            sub_240BCD014(a1, a3, 0xAAAAAAAAAAAAAAABLL * (v12 >> 3), v45);
            v45 = (__n128 *)((char *)v45 - 24);
            --v44;
          }
          while (v44);
          v46 = v12 / 0x18uLL;
          do
          {
            sub_240BCD2D0(a1, (uint64_t)a2, a3, v46);
            a2 -= 3;
          }
          while (v46-- > 2);
        }
        return result;
    }
  }
}

const void **sub_240BCBE14(const void **result, const void **a2)
{
  uint64_t v2;
  uint64_t v3;
  const void **v4;
  const void **v5;
  const void **v6;
  uint64_t v7;
  const void **v8;
  const void **v9;
  __int128 v10;
  const void **v11;
  int v12;
  const void **v13;
  size_t v14;
  int v15;
  const void *v16;
  size_t v17;
  size_t v18;
  unint64_t v19;
  unint64_t v20;
  __int128 *v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  char *v26;
  const void *v27;
  size_t v28;
  __int128 v30;
  const void *v31;
  uint64_t v32;
  uint64_t v33;

  if (result != a2)
  {
    v32 = v2;
    v33 = v3;
    v4 = a2;
    v5 = result;
    v6 = result + 3;
    if (result + 3 != a2)
    {
      v7 = 0;
      v8 = result;
      do
      {
        v11 = v8;
        v8 = v6;
        v12 = *((char *)v11 + 47);
        if (v12 >= 0)
          v13 = v6;
        else
          v13 = (const void **)v11[3];
        if (v12 >= 0)
          v14 = *((unsigned __int8 *)v11 + 47);
        else
          v14 = (size_t)v11[4];
        v15 = *((char *)v11 + 23);
        if (v15 >= 0)
          v16 = v11;
        else
          v16 = *v11;
        if (v15 >= 0)
          v17 = *((unsigned __int8 *)v11 + 23);
        else
          v17 = (size_t)v11[1];
        if (v17 >= v14)
          v18 = v14;
        else
          v18 = v17;
        result = (const void **)memcmp(v13, v16, v18);
        if ((_DWORD)result)
        {
          if ((result & 0x80000000) == 0)
            goto LABEL_7;
        }
        else if (v14 >= v17)
        {
          goto LABEL_7;
        }
        v31 = v8[2];
        v19 = (unint64_t)v31;
        v30 = *(_OWORD *)v8;
        *v8 = 0;
        v8[1] = 0;
        v20 = HIBYTE(v19);
        if ((v20 & 0x80u) == 0)
          v21 = &v30;
        else
          v21 = (__int128 *)v30;
        if ((v20 & 0x80u) == 0)
          v22 = (const void *)v20;
        else
          v22 = (const void *)*((_QWORD *)&v30 + 1);
        v8[2] = v11[2];
        *(_OWORD *)v8 = *(_OWORD *)v11;
        *((_BYTE *)v11 + 23) = 0;
        *(_BYTE *)v11 = 0;
        v9 = v5;
        if (v11 == v5)
          goto LABEL_6;
        v23 = v7;
        while (1)
        {
          v24 = (uint64_t)v5 + v23;
          v25 = *((char *)v5 + v23 - 1);
          v26 = v25 >= 0 ? (char *)v5 + v23 - 24 : *(char **)((char *)v5 + v23 - 24);
          v27 = v25 >= 0 ? (const void *)*((unsigned __int8 *)v5 + v23 - 1) : *(const void **)((char *)v5 + v23 - 16);
          v28 = (size_t)(v27 >= v22 ? v22 : v27);
          result = (const void **)memcmp(v21, v26, v28);
          if (!(_DWORD)result)
            break;
          if ((result & 0x80000000) == 0)
          {
            v9 = (const void **)((char *)v5 + v23);
            goto LABEL_5;
          }
LABEL_36:
          v11 -= 3;
          *(_OWORD *)v24 = *(_OWORD *)((char *)v5 + v23 - 24);
          *(_QWORD *)(v24 + 16) = *(const void **)((char *)v5 + v23 - 8);
          *((_BYTE *)v5 + v23 - 1) = 0;
          *(_BYTE *)(v24 - 24) = 0;
          v23 -= 24;
          if (!v23)
          {
            v9 = v5;
            goto LABEL_5;
          }
        }
        if (v22 < v27)
          goto LABEL_36;
        v9 = v11;
LABEL_5:
        v4 = a2;
LABEL_6:
        v10 = v30;
        v9[2] = v31;
        *(_OWORD *)v9 = v10;
LABEL_7:
        v6 = v8 + 3;
        v7 += 24;
      }
      while (v8 + 3 != v4);
    }
  }
  return result;
}

const void **sub_240BCBFD8(const void **result, const void **a2)
{
  uint64_t v2;
  uint64_t v3;
  const void **v5;
  const void **i;
  const void **v7;
  int v8;
  const void **v9;
  size_t v10;
  int v11;
  const void *v12;
  size_t v13;
  size_t v14;
  unint64_t v15;
  size_t v16;
  __int128 *v17;
  size_t v18;
  const void **j;
  int v20;
  const void **v21;
  size_t v22;
  size_t v23;
  __int128 v24;
  const void *v25;
  uint64_t v26;
  uint64_t v27;

  if (result != a2)
  {
    v26 = v2;
    v27 = v3;
    v5 = result;
    for (i = result + 3; v5 + 3 != a2; i = v5 + 3)
    {
      v7 = v5;
      v5 = i;
      v8 = *((char *)v7 + 47);
      if (v8 >= 0)
        v9 = i;
      else
        v9 = (const void **)v7[3];
      if (v8 >= 0)
        v10 = *((unsigned __int8 *)v7 + 47);
      else
        v10 = (size_t)v7[4];
      v11 = *((char *)v7 + 23);
      if (v11 >= 0)
        v12 = v7;
      else
        v12 = *v7;
      if (v11 >= 0)
        v13 = *((unsigned __int8 *)v7 + 23);
      else
        v13 = (size_t)v7[1];
      if (v13 >= v10)
        v14 = v10;
      else
        v14 = v13;
      result = (const void **)memcmp(v9, v12, v14);
      if ((_DWORD)result)
      {
        if ((result & 0x80000000) != 0)
          goto LABEL_25;
      }
      else if (v10 < v13)
      {
LABEL_25:
        v25 = v5[2];
        v15 = (unint64_t)v25;
        v24 = *(_OWORD *)v5;
        v5[1] = 0;
        v5[2] = 0;
        *v5 = 0;
        v16 = HIBYTE(v15);
        if ((v16 & 0x80u) == 0)
          v17 = &v24;
        else
          v17 = (__int128 *)v24;
        if ((v16 & 0x80u) == 0)
          v18 = v16;
        else
          v18 = *((_QWORD *)&v24 + 1);
        for (j = v5; ; j -= 3)
        {
          *(_OWORD *)j = *(_OWORD *)(j - 3);
          j[2] = *(j - 1);
          *((_BYTE *)j - 1) = 0;
          *((_BYTE *)j - 24) = 0;
          v20 = *((char *)j - 25);
          if (v20 >= 0)
            v21 = j - 6;
          else
            v21 = (const void **)*(j - 6);
          if (v20 >= 0)
            v22 = *((unsigned __int8 *)j - 25);
          else
            v22 = (size_t)*(j - 5);
          if (v22 >= v18)
            v23 = v18;
          else
            v23 = v22;
          result = (const void **)memcmp(v17, v21, v23);
          if ((_DWORD)result)
          {
            if ((result & 0x80000000) == 0)
            {
LABEL_4:
              *(_OWORD *)(j - 3) = v24;
              *(j - 1) = v25;
              break;
            }
          }
          else if (v18 >= v22)
          {
            goto LABEL_4;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_240BCC140(const void **a1, const void **a2, const void **a3)
{
  int v6;
  const void *v7;
  size_t v8;
  int v9;
  const void *v10;
  size_t v11;
  size_t v12;
  int v13;
  int v14;
  const void *v15;
  size_t v16;
  size_t v17;
  int v18;
  int v20;
  const void *v21;
  size_t v22;
  size_t v23;
  int v24;
  const void *v25;
  __int128 v26;
  const void *v27;
  int v28;
  const void *v29;
  size_t v30;
  int v31;
  const void *v32;
  size_t v33;
  size_t v34;
  int v35;
  const void *v36;
  __int128 v37;
  const void *v38;
  int v39;
  const void *v40;
  size_t v41;
  int v42;
  const void *v43;
  size_t v44;
  size_t v45;
  int v46;
  const void *v47;
  __int128 v48;
  const void *v49;
  const void *v50;
  __int128 v51;
  const void *v52;
  const void *v53;
  __int128 v54;
  const void *v55;

  v6 = *((char *)a2 + 23);
  if (v6 >= 0)
    v7 = a2;
  else
    v7 = *a2;
  if (v6 >= 0)
    v8 = *((unsigned __int8 *)a2 + 23);
  else
    v8 = (size_t)a2[1];
  v9 = *((char *)a1 + 23);
  if (v9 >= 0)
    v10 = a1;
  else
    v10 = *a1;
  if (v9 >= 0)
    v11 = *((unsigned __int8 *)a1 + 23);
  else
    v11 = (size_t)a1[1];
  if (v11 >= v8)
    v12 = v8;
  else
    v12 = v11;
  v13 = memcmp(v7, v10, v12);
  if (v13)
  {
    if ((v13 & 0x80000000) == 0)
      goto LABEL_18;
LABEL_31:
    v20 = *((char *)a3 + 23);
    if (v20 >= 0)
      v21 = a3;
    else
      v21 = *a3;
    if (v20 >= 0)
      v22 = *((unsigned __int8 *)a3 + 23);
    else
      v22 = (size_t)a3[1];
    if (v8 >= v22)
      v23 = v22;
    else
      v23 = v8;
    v24 = memcmp(v21, v7, v23);
    if (v24)
    {
      if ((v24 & 0x80000000) == 0)
        goto LABEL_42;
    }
    else if (v22 >= v8)
    {
LABEL_42:
      v25 = a1[2];
      v26 = *(_OWORD *)a1;
      v27 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v27;
      *(_OWORD *)a2 = v26;
      a2[2] = v25;
      v28 = *((char *)a3 + 23);
      if (v28 >= 0)
        v29 = a3;
      else
        v29 = *a3;
      if (v28 >= 0)
        v30 = *((unsigned __int8 *)a3 + 23);
      else
        v30 = (size_t)a3[1];
      v31 = *((char *)a2 + 23);
      if (v31 >= 0)
        v32 = a2;
      else
        v32 = *a2;
      if (v31 >= 0)
        v33 = *((unsigned __int8 *)a2 + 23);
      else
        v33 = (size_t)a2[1];
      if (v33 >= v30)
        v34 = v30;
      else
        v34 = v33;
      v35 = memcmp(v29, v32, v34);
      if (v35)
      {
        if ((v35 & 0x80000000) == 0)
          return 1;
      }
      else if (v30 >= v33)
      {
        return 1;
      }
      v50 = a2[2];
      v51 = *(_OWORD *)a2;
      v52 = a3[2];
      *(_OWORD *)a2 = *(_OWORD *)a3;
      a2[2] = v52;
      *(_OWORD *)a3 = v51;
      a3[2] = v50;
      return 2;
    }
    v47 = a1[2];
    v48 = *(_OWORD *)a1;
    v49 = a3[2];
    *(_OWORD *)a1 = *(_OWORD *)a3;
    a1[2] = v49;
    *(_OWORD *)a3 = v48;
    a3[2] = v47;
    return 1;
  }
  if (v8 < v11)
    goto LABEL_31;
LABEL_18:
  v14 = *((char *)a3 + 23);
  if (v14 >= 0)
    v15 = a3;
  else
    v15 = *a3;
  if (v14 >= 0)
    v16 = *((unsigned __int8 *)a3 + 23);
  else
    v16 = (size_t)a3[1];
  if (v8 >= v16)
    v17 = v16;
  else
    v17 = v8;
  v18 = memcmp(v15, v7, v17);
  if (v18)
  {
    if ((v18 & 0x80000000) == 0)
      return 0;
  }
  else if (v16 >= v8)
  {
    return 0;
  }
  v36 = a2[2];
  v37 = *(_OWORD *)a2;
  v38 = a3[2];
  *(_OWORD *)a2 = *(_OWORD *)a3;
  a2[2] = v38;
  *(_OWORD *)a3 = v37;
  a3[2] = v36;
  v39 = *((char *)a2 + 23);
  if (v39 >= 0)
    v40 = a2;
  else
    v40 = *a2;
  if (v39 >= 0)
    v41 = *((unsigned __int8 *)a2 + 23);
  else
    v41 = (size_t)a2[1];
  v42 = *((char *)a1 + 23);
  if (v42 >= 0)
    v43 = a1;
  else
    v43 = *a1;
  if (v42 >= 0)
    v44 = *((unsigned __int8 *)a1 + 23);
  else
    v44 = (size_t)a1[1];
  if (v44 >= v41)
    v45 = v41;
  else
    v45 = v44;
  v46 = memcmp(v40, v43, v45);
  if (v46)
  {
    if (v46 < 0)
      goto LABEL_84;
  }
  else if (v41 < v44)
  {
LABEL_84:
    v53 = a1[2];
    v54 = *(_OWORD *)a1;
    v55 = a2[2];
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = v55;
    *(_OWORD *)a2 = v54;
    a2[2] = v53;
    return 2;
  }
  return 1;
}

const void **sub_240BCC39C(const void **a1, const void **a2)
{
  const void **v2;
  unint64_t v4;
  size_t v5;
  __int128 *v6;
  size_t v7;
  const void **v8;
  size_t v9;
  size_t v10;
  const void **v11;
  size_t v12;
  size_t v13;
  int v14;
  const void **i;
  int v16;
  const void *v17;
  size_t v18;
  size_t v19;
  int v20;
  const void **v21;
  const void *v22;
  const void **v23;
  const void *v24;
  size_t v25;
  int v26;
  const void **v27;
  const void **v28;
  size_t v29;
  size_t v30;
  int v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 *v35;
  unint64_t v36;
  const void **v37;
  const void *v38;
  const void **v39;
  const void *v40;
  size_t v41;
  int v42;
  const void **v43;
  const void *v44;
  const void **v45;
  const void *v46;
  size_t v47;
  int v48;
  void **v49;
  __int128 v50;
  __int128 v51;
  __int128 v53;
  const void *v54;
  __int128 v55;
  const void *v56;

  v2 = a2;
  v54 = a1[2];
  v4 = (unint64_t)v54;
  v53 = *(_OWORD *)a1;
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  v5 = HIBYTE(v4);
  if ((v5 & 0x80u) == 0)
    v6 = &v53;
  else
    v6 = (__int128 *)v53;
  if ((v5 & 0x80u) == 0)
    v7 = v5;
  else
    v7 = *((_QWORD *)&v53 + 1);
  v8 = (const void **)*(a2 - 3);
  v9 = *((unsigned __int8 *)a2 - 1);
  v10 = (size_t)*(a2 - 2);
  if ((v9 & 0x80u) == 0)
    v11 = a2 - 3;
  else
    v11 = (const void **)*(a2 - 3);
  if ((v9 & 0x80u) == 0)
    v12 = v9;
  else
    v12 = v10;
  if (v12 >= v7)
    v13 = v7;
  else
    v13 = v12;
  v14 = memcmp(v6, v11, v13);
  if (v14)
  {
    if ((v14 & 0x80000000) == 0)
      goto LABEL_18;
  }
  else if (v7 >= v12)
  {
LABEL_18:
    for (i = a1 + 3; i < v2; i += 3)
    {
      v16 = *((char *)i + 23);
      if (v16 >= 0)
        v17 = i;
      else
        v17 = *i;
      if (v16 >= 0)
        v18 = *((unsigned __int8 *)i + 23);
      else
        v18 = (size_t)i[1];
      if (v18 >= v7)
        v19 = v7;
      else
        v19 = v18;
      v20 = memcmp(v6, v17, v19);
      if (v20)
      {
        if (v20 < 0)
          goto LABEL_48;
      }
      else if (v7 < v18)
      {
        goto LABEL_48;
      }
    }
    goto LABEL_48;
  }
  v21 = a1 + 3;
  do
  {
    while (1)
    {
      i = v21;
      v22 = (const void *)*((unsigned __int8 *)v21 + 23);
      v23 = (char)v22 >= 0 ? i : (const void **)*i;
      v24 = (char)v22 >= 0 ? v22 : i[1];
      v25 = (unint64_t)v24 >= v7 ? v7 : (size_t)v24;
      v26 = memcmp(v6, v23, v25);
      v21 = i + 3;
      if (v26)
        break;
      if (v7 < (unint64_t)v24)
        goto LABEL_48;
    }
  }
  while ((v26 & 0x80000000) == 0);
LABEL_48:
  if (i < v2)
  {
    for (v2 -= 3; ; v10 = (size_t)v2[1])
    {
      if ((v9 & 0x80u) == 0)
        v28 = v2;
      else
        v28 = v8;
      if ((v9 & 0x80u) == 0)
        v29 = v9;
      else
        v29 = v10;
      if (v29 >= v7)
        v30 = v7;
      else
        v30 = v29;
      v31 = memcmp(v6, v28, v30);
      if (v31)
      {
        if ((v31 & 0x80000000) == 0)
          break;
      }
      else if (v7 >= v29)
      {
        break;
      }
      v27 = (const void **)*(v2 - 3);
      v2 -= 3;
      v8 = v27;
      v9 = *((unsigned __int8 *)v2 + 23);
    }
  }
  while (i < v2)
  {
    v32 = *(_OWORD *)i;
    v56 = i[2];
    v55 = v32;
    v33 = *(_OWORD *)v2;
    i[2] = v2[2];
    *(_OWORD *)i = v33;
    v34 = v55;
    v2[2] = v56;
    *(_OWORD *)v2 = v34;
    if (SHIBYTE(v54) >= 0)
      v35 = &v53;
    else
      v35 = (__int128 *)v53;
    if (SHIBYTE(v54) >= 0)
      v36 = HIBYTE(v54);
    else
      v36 = *((_QWORD *)&v53 + 1);
    v37 = i + 3;
    do
    {
      while (1)
      {
        i = v37;
        v38 = (const void *)*((unsigned __int8 *)v37 + 23);
        v39 = (char)v38 >= 0 ? i : (const void **)*i;
        v40 = (char)v38 >= 0 ? v38 : i[1];
        v41 = (unint64_t)v40 >= v36 ? v36 : (size_t)v40;
        v42 = memcmp(v35, v39, v41);
        v37 = i + 3;
        if (v42)
          break;
        if (v36 < (unint64_t)v40)
          goto LABEL_85;
      }
    }
    while ((v42 & 0x80000000) == 0);
LABEL_85:
    v43 = v2 - 3;
    do
    {
      while (1)
      {
        v2 = v43;
        v44 = (const void *)*((unsigned __int8 *)v43 + 23);
        v45 = (char)v44 >= 0 ? v2 : (const void **)*v2;
        v46 = (char)v44 >= 0 ? v44 : v2[1];
        v47 = (unint64_t)v46 >= v36 ? v36 : (size_t)v46;
        v48 = memcmp(v35, v45, v47);
        v43 = v2 - 3;
        if (v48)
          break;
        if (v36 >= (unint64_t)v46)
          goto LABEL_65;
      }
    }
    while (v48 < 0);
LABEL_65:
    ;
  }
  v49 = (void **)(i - 3);
  if (i - 3 == a1)
  {
    if (*((char *)i - 1) < 0)
      operator delete(*v49);
  }
  else
  {
    if (*((char *)a1 + 23) < 0)
      operator delete((void *)*a1);
    v50 = *(_OWORD *)v49;
    a1[2] = *(i - 1);
    *(_OWORD *)a1 = v50;
    *((_BYTE *)i - 1) = 0;
    *((_BYTE *)i - 24) = 0;
  }
  v51 = v53;
  *(i - 1) = v54;
  *(_OWORD *)v49 = v51;
  return i;
}

unint64_t sub_240BCC68C(__int128 *a1, unint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  __int128 *v8;
  unint64_t v9;
  int v10;
  char *v11;
  unint64_t v12;
  size_t v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  const void *v18;
  unint64_t v19;
  size_t v20;
  int v21;
  unint64_t v22;
  unint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  const void *v31;
  unint64_t v32;
  size_t v33;
  int v34;
  unint64_t v35;
  uint64_t v36;
  const void *v37;
  unint64_t v38;
  size_t v39;
  int v40;
  int v41;
  const void *v42;
  unint64_t v43;
  size_t v44;
  int v45;
  void **v47;
  __int128 v48;
  __int128 v49;
  __int128 v51;
  int64_t v52;
  __int128 v53;
  uint64_t v54;

  v4 = 0;
  v52 = *((_QWORD *)a1 + 2);
  v51 = *a1;
  v5 = HIBYTE(v52);
  v6 = *((_QWORD *)&v51 + 1);
  v7 = v52 < 0;
  if (v52 >= 0)
    v8 = &v51;
  else
    v8 = (__int128 *)v51;
  *((_QWORD *)a1 + 1) = 0;
  *((_QWORD *)a1 + 2) = 0;
  *(_QWORD *)a1 = 0;
  if (v7)
    v9 = v6;
  else
    v9 = v5;
  while (1)
  {
    v10 = *((char *)a1 + v4 + 47);
    v11 = v10 >= 0 ? (char *)a1 + v4 + 24 : *(char **)((char *)a1 + v4 + 24);
    v12 = v10 >= 0 ? *((unsigned __int8 *)a1 + v4 + 47) : *(_QWORD *)((char *)a1 + v4 + 32);
    v13 = v9 >= v12 ? v12 : v9;
    v14 = memcmp(v11, v8, v13);
    if (v14)
      break;
    if (v12 >= v9)
      goto LABEL_20;
LABEL_8:
    v4 += 24;
  }
  if (v14 < 0)
    goto LABEL_8;
LABEL_20:
  v15 = (unint64_t)a1 + v4 + 24;
  if (v4)
  {
    v16 = a2 - 24;
    do
    {
      while (1)
      {
        a2 = v16;
        v17 = *(unsigned __int8 *)(v16 + 23);
        v18 = (v17 & 0x80u) == 0 ? (const void *)a2 : *(const void **)a2;
        v19 = (v17 & 0x80u) == 0 ? v17 : *(_QWORD *)(a2 + 8);
        v20 = v9 >= v19 ? v19 : v9;
        v21 = memcmp(v18, v8, v20);
        v16 = a2 - 24;
        if (v21)
          break;
        if (v19 < v9)
          goto LABEL_34;
      }
    }
    while ((v21 & 0x80000000) == 0);
  }
  else
  {
    do
    {
      if (v15 >= a2)
        break;
      while (1)
      {
        a2 -= 24;
        v41 = *(char *)(a2 + 23);
        v42 = v41 >= 0 ? (const void *)a2 : *(const void **)a2;
        v43 = v41 >= 0 ? *(unsigned __int8 *)(a2 + 23) : *(_QWORD *)(a2 + 8);
        v44 = v9 >= v43 ? v43 : v9;
        v45 = memcmp(v42, v8, v44);
        if (v45)
          break;
        if (v43 < v9 || v15 >= a2)
          goto LABEL_34;
      }
    }
    while ((v45 & 0x80000000) == 0);
  }
LABEL_34:
  if (v15 >= a2)
  {
    v22 = v15;
  }
  else
  {
    v22 = v15;
    v23 = a2;
    do
    {
      v24 = *(_OWORD *)v22;
      v54 = *(_QWORD *)(v22 + 16);
      v53 = v24;
      v25 = *(_OWORD *)v23;
      *(_QWORD *)(v22 + 16) = *(_QWORD *)(v23 + 16);
      *(_OWORD *)v22 = v25;
      v26 = v53;
      *(_QWORD *)(v23 + 16) = v54;
      *(_OWORD *)v23 = v26;
      if (v52 >= 0)
        v27 = &v51;
      else
        v27 = (__int128 *)v51;
      if (v52 >= 0)
        v28 = HIBYTE(v52);
      else
        v28 = *((_QWORD *)&v51 + 1);
      v29 = v22 + 24;
      do
      {
        while (1)
        {
          v22 = v29;
          v30 = *(unsigned __int8 *)(v29 + 23);
          v31 = (v30 & 0x80u) == 0 ? (const void *)v22 : *(const void **)v22;
          v32 = (v30 & 0x80u) == 0 ? v30 : *(_QWORD *)(v22 + 8);
          v33 = v28 >= v32 ? v32 : v28;
          v34 = memcmp(v31, v27, v33);
          v29 = v22 + 24;
          if (v34)
            break;
          if (v32 >= v28)
            goto LABEL_56;
        }
      }
      while (v34 < 0);
LABEL_56:
      v35 = v23 - 24;
      do
      {
        while (1)
        {
          v23 = v35;
          v36 = *(unsigned __int8 *)(v35 + 23);
          v37 = (v36 & 0x80u) == 0 ? (const void *)v23 : *(const void **)v23;
          v38 = (v36 & 0x80u) == 0 ? v36 : *(_QWORD *)(v23 + 8);
          v39 = v28 >= v38 ? v38 : v28;
          v40 = memcmp(v37, v27, v39);
          v35 = v23 - 24;
          if (v40)
            break;
          if (v38 < v28)
            goto LABEL_36;
        }
      }
      while ((v40 & 0x80000000) == 0);
LABEL_36:
      ;
    }
    while (v22 < v23);
  }
  v47 = (void **)(v22 - 24);
  if ((__int128 *)(v22 - 24) == a1)
  {
    if (*(char *)(v22 - 1) < 0)
      operator delete(*v47);
  }
  else
  {
    if (*((char *)a1 + 23) < 0)
      operator delete(*(void **)a1);
    v48 = *(_OWORD *)v47;
    *((_QWORD *)a1 + 2) = *(_QWORD *)(v22 - 8);
    *a1 = v48;
    *(_BYTE *)(v22 - 1) = 0;
    *(_BYTE *)(v22 - 24) = 0;
  }
  v49 = v51;
  *(_QWORD *)(v22 - 8) = v52;
  *(_OWORD *)v47 = v49;
  return v22 - 24;
}

BOOL sub_240BCC958(uint64_t a1, const void **a2)
{
  unint64_t v3;
  _BOOL8 result;
  int v5;
  const void **v6;
  const void **v7;
  size_t v8;
  int v9;
  const void *v10;
  size_t v11;
  size_t v12;
  int v13;
  const void **v14;
  const void **v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int128 v19;
  int v20;
  const void *v21;
  size_t v22;
  int v23;
  const void *v24;
  size_t v25;
  size_t v26;
  int v27;
  uint64_t v28;
  __int128 *v29;
  unint64_t v30;
  int v31;
  const void *v32;
  unint64_t v33;
  size_t v34;
  int v35;
  const void *v36;
  __int128 v37;
  const void *v38;
  __int128 v40;
  const void *v41;

  v3 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)a2 - a1) >> 3);
  result = 1;
  switch(v3)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v5 = *((char *)a2 - 1);
      v6 = a2 - 3;
      if (v5 >= 0)
        v7 = a2 - 3;
      else
        v7 = (const void **)*(a2 - 3);
      if (v5 >= 0)
        v8 = *((unsigned __int8 *)a2 - 1);
      else
        v8 = (size_t)*(a2 - 2);
      v9 = *(char *)(a1 + 23);
      if (v9 >= 0)
        v10 = (const void *)a1;
      else
        v10 = *(const void **)a1;
      if (v9 >= 0)
        v11 = *(unsigned __int8 *)(a1 + 23);
      else
        v11 = *(_QWORD *)(a1 + 8);
      if (v11 >= v8)
        v12 = v8;
      else
        v12 = v11;
      v13 = memcmp(v7, v10, v12);
      if (v13)
      {
        if ((v13 & 0x80000000) == 0)
          return 1;
      }
      else if (v8 >= v11)
      {
        return 1;
      }
      v36 = *(const void **)(a1 + 16);
      v37 = *(_OWORD *)a1;
      v38 = v6[2];
      *(_OWORD *)a1 = *(_OWORD *)v6;
      *(_QWORD *)(a1 + 16) = v38;
      *(_OWORD *)v6 = v37;
      v6[2] = v36;
      return 1;
    case 3uLL:
      sub_240BCC140((const void **)a1, (const void **)(a1 + 24), a2 - 3);
      return 1;
    case 4uLL:
      sub_240BCCC68(a1, (__int128 *)(a1 + 24), (__int128 *)(a1 + 48), a2 - 3);
      return 1;
    case 5uLL:
      sub_240BCCE00(a1, a1 + 24, a1 + 48, (__int128 *)(a1 + 72), a2 - 3);
      return 1;
    default:
      v14 = (const void **)(a1 + 48);
      sub_240BCC140((const void **)a1, (const void **)(a1 + 24), (const void **)(a1 + 48));
      v15 = (const void **)(a1 + 72);
      if ((const void **)(a1 + 72) == a2)
        return 1;
      v16 = 0;
      v17 = 0;
      break;
  }
  while (2)
  {
    v20 = *((char *)v15 + 23);
    if (v20 >= 0)
      v21 = v15;
    else
      v21 = *v15;
    if (v20 >= 0)
      v22 = *((unsigned __int8 *)v15 + 23);
    else
      v22 = (size_t)v15[1];
    v23 = *((char *)v14 + 23);
    if (v23 >= 0)
      v24 = v14;
    else
      v24 = *v14;
    if (v23 >= 0)
      v25 = *((unsigned __int8 *)v14 + 23);
    else
      v25 = (size_t)v14[1];
    if (v25 >= v22)
      v26 = v22;
    else
      v26 = v25;
    v27 = memcmp(v21, v24, v26);
    if (v27)
    {
      if ((v27 & 0x80000000) == 0)
        goto LABEL_24;
    }
    else if (v22 >= v25)
    {
      goto LABEL_24;
    }
    v40 = *(_OWORD *)v15;
    v41 = v15[2];
    *v15 = 0;
    v15[1] = 0;
    v15[2] = v14[2];
    *(_OWORD *)v15 = *(_OWORD *)v14;
    *((_BYTE *)v14 + 23) = 0;
    *(_BYTE *)v14 = 0;
    v18 = a1;
    if (v14 == (const void **)a1)
      goto LABEL_23;
    v28 = v16;
    while (1)
    {
      v29 = SHIBYTE(v41) >= 0 ? &v40 : (__int128 *)v40;
      v30 = SHIBYTE(v41) >= 0 ? HIBYTE(v41) : *((_QWORD *)&v40 + 1);
      v31 = *(char *)(a1 + v28 + 47);
      v32 = v31 >= 0 ? (const void *)(a1 + v28 + 24) : *(const void **)(a1 + v28 + 24);
      v33 = v31 >= 0 ? *(unsigned __int8 *)(a1 + v28 + 47) : *(_QWORD *)(a1 + v28 + 32);
      v34 = v33 >= v30 ? v30 : v33;
      v35 = memcmp(v29, v32, v34);
      if (!v35)
        break;
      if ((v35 & 0x80000000) == 0)
      {
        v18 = a1 + v28 + 48;
        goto LABEL_23;
      }
LABEL_47:
      v14 -= 3;
      *(_OWORD *)(a1 + v28 + 48) = *(_OWORD *)(a1 + v28 + 24);
      *(_QWORD *)(a1 + v28 + 64) = *(_QWORD *)(a1 + v28 + 40);
      *(_BYTE *)(a1 + v28 + 47) = 0;
      *(_BYTE *)(a1 + v28 + 24) = 0;
      v28 -= 24;
      if (v28 == -48)
      {
        v18 = a1;
        goto LABEL_23;
      }
    }
    if (v30 < v33)
      goto LABEL_47;
    v18 = (uint64_t)v14;
LABEL_23:
    v19 = v40;
    *(_QWORD *)(v18 + 16) = v41;
    *(_OWORD *)v18 = v19;
    if (++v17 == 8)
      return v15 + 3 == a2;
LABEL_24:
    v14 = v15;
    v16 += 24;
    v15 += 3;
    if (v15 != a2)
      continue;
    return 1;
  }
}

__n128 sub_240BCCC68(uint64_t a1, __int128 *a2, __int128 *a3, const void **a4)
{
  int v8;
  const void *v9;
  size_t v10;
  int v11;
  const void *v12;
  size_t v13;
  size_t v14;
  int v15;
  __n128 result;
  const void *v17;
  __int128 v18;
  const void *v19;
  int v20;
  const void *v21;
  size_t v22;
  int v23;
  const void *v24;
  size_t v25;
  size_t v26;
  int v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  int v31;
  const void *v32;
  size_t v33;
  int v34;
  const void *v35;
  size_t v36;
  size_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;

  sub_240BCC140((const void **)a1, (const void **)a2, (const void **)a3);
  v8 = *((char *)a4 + 23);
  if (v8 >= 0)
    v9 = a4;
  else
    v9 = *a4;
  if (v8 >= 0)
    v10 = *((unsigned __int8 *)a4 + 23);
  else
    v10 = (size_t)a4[1];
  v11 = *((char *)a3 + 23);
  if (v11 >= 0)
    v12 = a3;
  else
    v12 = *(const void **)a3;
  if (v11 >= 0)
    v13 = *((unsigned __int8 *)a3 + 23);
  else
    v13 = *((_QWORD *)a3 + 1);
  if (v13 >= v10)
    v14 = v10;
  else
    v14 = v13;
  v15 = memcmp(v9, v12, v14);
  if (v15)
  {
    if ((v15 & 0x80000000) == 0)
      return result;
  }
  else if (v10 >= v13)
  {
    return result;
  }
  v17 = (const void *)*((_QWORD *)a3 + 2);
  v18 = *a3;
  v19 = a4[2];
  *a3 = *(_OWORD *)a4;
  *((_QWORD *)a3 + 2) = v19;
  *(_OWORD *)a4 = v18;
  a4[2] = v17;
  v20 = *((char *)a3 + 23);
  if (v20 >= 0)
    v21 = a3;
  else
    v21 = *(const void **)a3;
  if (v20 >= 0)
    v22 = *((unsigned __int8 *)a3 + 23);
  else
    v22 = *((_QWORD *)a3 + 1);
  v23 = *((char *)a2 + 23);
  if (v23 >= 0)
    v24 = a2;
  else
    v24 = *(const void **)a2;
  if (v23 >= 0)
    v25 = *((unsigned __int8 *)a2 + 23);
  else
    v25 = *((_QWORD *)a2 + 1);
  if (v25 >= v22)
    v26 = v22;
  else
    v26 = v25;
  v27 = memcmp(v21, v24, v26);
  if (v27)
  {
    if ((v27 & 0x80000000) == 0)
      return result;
  }
  else if (v22 >= v25)
  {
    return result;
  }
  v28 = *((_QWORD *)a2 + 2);
  v29 = *a2;
  v30 = *((_QWORD *)a3 + 2);
  *a2 = *a3;
  *((_QWORD *)a2 + 2) = v30;
  *a3 = v29;
  *((_QWORD *)a3 + 2) = v28;
  v31 = *((char *)a2 + 23);
  if (v31 >= 0)
    v32 = a2;
  else
    v32 = *(const void **)a2;
  if (v31 >= 0)
    v33 = *((unsigned __int8 *)a2 + 23);
  else
    v33 = *((_QWORD *)a2 + 1);
  v34 = *(char *)(a1 + 23);
  if (v34 >= 0)
    v35 = (const void *)a1;
  else
    v35 = *(const void **)a1;
  if (v34 >= 0)
    v36 = *(unsigned __int8 *)(a1 + 23);
  else
    v36 = *(_QWORD *)(a1 + 8);
  if (v36 >= v33)
    v37 = v33;
  else
    v37 = v36;
  v38 = memcmp(v32, v35, v37);
  if (v38)
  {
    if ((v38 & 0x80000000) == 0)
      return result;
  }
  else if (v33 >= v36)
  {
    return result;
  }
  v39 = *(_QWORD *)(a1 + 16);
  result = *(__n128 *)a1;
  v40 = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 16) = v40;
  *a2 = (__int128)result;
  *((_QWORD *)a2 + 2) = v39;
  return result;
}

__n128 sub_240BCCE00(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, const void **a5)
{
  int v10;
  const void *v11;
  size_t v12;
  int v13;
  __int128 *v14;
  size_t v15;
  size_t v16;
  int v17;
  __n128 result;
  const void *v19;
  __int128 v20;
  const void *v21;
  int v22;
  __int128 *v23;
  size_t v24;
  int v25;
  const void *v26;
  size_t v27;
  size_t v28;
  int v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  int v33;
  const void *v34;
  size_t v35;
  int v36;
  const void *v37;
  size_t v38;
  size_t v39;
  int v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  int v44;
  const void *v45;
  size_t v46;
  int v47;
  const void *v48;
  size_t v49;
  size_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;

  sub_240BCCC68(a1, (__int128 *)a2, (__int128 *)a3, (const void **)a4);
  v10 = *((char *)a5 + 23);
  if (v10 >= 0)
    v11 = a5;
  else
    v11 = *a5;
  if (v10 >= 0)
    v12 = *((unsigned __int8 *)a5 + 23);
  else
    v12 = (size_t)a5[1];
  v13 = *((char *)a4 + 23);
  if (v13 >= 0)
    v14 = a4;
  else
    v14 = *(__int128 **)a4;
  if (v13 >= 0)
    v15 = *((unsigned __int8 *)a4 + 23);
  else
    v15 = *((_QWORD *)a4 + 1);
  if (v15 >= v12)
    v16 = v12;
  else
    v16 = v15;
  v17 = memcmp(v11, v14, v16);
  if (v17)
  {
    if ((v17 & 0x80000000) == 0)
      return result;
  }
  else if (v12 >= v15)
  {
    return result;
  }
  v19 = (const void *)*((_QWORD *)a4 + 2);
  v20 = *a4;
  v21 = a5[2];
  *a4 = *(_OWORD *)a5;
  *((_QWORD *)a4 + 2) = v21;
  *(_OWORD *)a5 = v20;
  a5[2] = v19;
  v22 = *((char *)a4 + 23);
  if (v22 >= 0)
    v23 = a4;
  else
    v23 = *(__int128 **)a4;
  if (v22 >= 0)
    v24 = *((unsigned __int8 *)a4 + 23);
  else
    v24 = *((_QWORD *)a4 + 1);
  v25 = *(char *)(a3 + 23);
  if (v25 >= 0)
    v26 = (const void *)a3;
  else
    v26 = *(const void **)a3;
  if (v25 >= 0)
    v27 = *(unsigned __int8 *)(a3 + 23);
  else
    v27 = *(_QWORD *)(a3 + 8);
  if (v27 >= v24)
    v28 = v24;
  else
    v28 = v27;
  v29 = memcmp(v23, v26, v28);
  if (v29)
  {
    if ((v29 & 0x80000000) == 0)
      return result;
  }
  else if (v24 >= v27)
  {
    return result;
  }
  v30 = *(_QWORD *)(a3 + 16);
  v31 = *(_OWORD *)a3;
  v32 = *((_QWORD *)a4 + 2);
  *(_OWORD *)a3 = *a4;
  *(_QWORD *)(a3 + 16) = v32;
  *a4 = v31;
  *((_QWORD *)a4 + 2) = v30;
  v33 = *(char *)(a3 + 23);
  if (v33 >= 0)
    v34 = (const void *)a3;
  else
    v34 = *(const void **)a3;
  if (v33 >= 0)
    v35 = *(unsigned __int8 *)(a3 + 23);
  else
    v35 = *(_QWORD *)(a3 + 8);
  v36 = *(char *)(a2 + 23);
  if (v36 >= 0)
    v37 = (const void *)a2;
  else
    v37 = *(const void **)a2;
  if (v36 >= 0)
    v38 = *(unsigned __int8 *)(a2 + 23);
  else
    v38 = *(_QWORD *)(a2 + 8);
  if (v38 >= v35)
    v39 = v35;
  else
    v39 = v38;
  v40 = memcmp(v34, v37, v39);
  if (v40)
  {
    if ((v40 & 0x80000000) == 0)
      return result;
  }
  else if (v35 >= v38)
  {
    return result;
  }
  v41 = *(_QWORD *)(a2 + 16);
  v42 = *(_OWORD *)a2;
  v43 = *(_QWORD *)(a3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(_QWORD *)(a2 + 16) = v43;
  *(_OWORD *)a3 = v42;
  *(_QWORD *)(a3 + 16) = v41;
  v44 = *(char *)(a2 + 23);
  if (v44 >= 0)
    v45 = (const void *)a2;
  else
    v45 = *(const void **)a2;
  if (v44 >= 0)
    v46 = *(unsigned __int8 *)(a2 + 23);
  else
    v46 = *(_QWORD *)(a2 + 8);
  v47 = *(char *)(a1 + 23);
  if (v47 >= 0)
    v48 = (const void *)a1;
  else
    v48 = *(const void **)a1;
  if (v47 >= 0)
    v49 = *(unsigned __int8 *)(a1 + 23);
  else
    v49 = *(_QWORD *)(a1 + 8);
  if (v49 >= v46)
    v50 = v46;
  else
    v50 = v49;
  v51 = memcmp(v45, v48, v50);
  if (v51)
  {
    if ((v51 & 0x80000000) == 0)
      return result;
  }
  else if (v46 >= v49)
  {
    return result;
  }
  v52 = *(_QWORD *)(a1 + 16);
  result = *(__n128 *)a1;
  v53 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v53;
  *(__n128 *)a2 = result;
  *(_QWORD *)(a2 + 16) = v52;
  return result;
}

__n128 sub_240BCD014(uint64_t a1, uint64_t a2, uint64_t a3, __n128 *a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void **v14;
  int v15;
  const void *v16;
  size_t v17;
  int v18;
  const void *v19;
  size_t v20;
  size_t v21;
  int v22;
  int v23;
  const void *v24;
  size_t v25;
  int v26;
  __n128 *v27;
  size_t v28;
  size_t v29;
  int v30;
  __n128 result;
  uint64_t v32;
  BOOL v33;
  const void *v34;
  const void **v35;
  __n128 *v36;
  size_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  const void *v44;
  unint64_t v45;
  int v46;
  const void *v47;
  unint64_t v48;
  size_t v49;
  int v50;
  int v51;
  const void *v52;
  size_t v53;
  size_t v54;
  int v55;
  uint64_t v56;
  __n128 *__s2;
  __n128 v58;
  const void *v59;
  uint64_t v60;
  uint64_t v61;

  v6 = a3 - 2;
  if (a3 < 2)
    return result;
  v60 = v4;
  v61 = v5;
  v8 = a1;
  v9 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) < (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 3)))
    return result;
  v10 = a3;
  v11 = (0x5555555555555556 * (((uint64_t)a4 - a1) >> 3)) | 1;
  v12 = a1 + 24 * v11;
  v13 = 0x5555555555555556 * (((uint64_t)a4 - a1) >> 3) + 2;
  if (v13 >= a3)
    goto LABEL_21;
  v14 = (const void **)(v12 + 24);
  v15 = *(char *)(v12 + 23);
  if (v15 >= 0)
    v16 = (const void *)(a1 + 24 * v11);
  else
    v16 = *(const void **)v12;
  if (v15 >= 0)
    v17 = *(unsigned __int8 *)(v12 + 23);
  else
    v17 = *(_QWORD *)(v12 + 8);
  v18 = *(char *)(v12 + 47);
  if (v18 >= 0)
    v19 = (const void *)(v12 + 24);
  else
    v19 = *(const void **)(v12 + 24);
  if (v18 >= 0)
    v20 = *(unsigned __int8 *)(v12 + 47);
  else
    v20 = *(_QWORD *)(v12 + 32);
  if (v20 >= v17)
    v21 = v17;
  else
    v21 = v20;
  v22 = memcmp(v16, v19, v21);
  if (v22)
  {
    if (v22 < 0)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (v17 >= v20)
  {
LABEL_21:
    v14 = (const void **)(v8 + 24 * v11);
    v13 = v11;
  }
LABEL_22:
  v23 = *((char *)v14 + 23);
  if (v23 >= 0)
    v24 = v14;
  else
    v24 = *v14;
  if (v23 >= 0)
    v25 = *((unsigned __int8 *)v14 + 23);
  else
    v25 = (size_t)v14[1];
  v26 = a4[1].n128_i8[7];
  if (v26 >= 0)
    v27 = a4;
  else
    v27 = (__n128 *)a4->n128_u64[0];
  if (v26 >= 0)
    v28 = a4[1].n128_u8[7];
  else
    v28 = a4->n128_u64[1];
  if (v28 >= v25)
    v29 = v25;
  else
    v29 = v28;
  v30 = memcmp(v24, v27, v29);
  if (v30)
  {
    v32 = v9;
    if (v30 < 0)
      return result;
  }
  else
  {
    v33 = v25 >= v28;
    v32 = v9;
    if (!v33)
      return result;
  }
  v58 = *a4;
  v59 = (const void *)a4[1].n128_u64[0];
  a4->n128_u64[1] = 0;
  a4[1].n128_u64[0] = 0;
  a4->n128_u64[0] = 0;
  v34 = v14[2];
  *a4 = *(__n128 *)v14;
  a4[1].n128_u64[0] = (unint64_t)v34;
  *((_BYTE *)v14 + 23) = 0;
  *(_BYTE *)v14 = 0;
  if (v32 >= v13)
  {
    v36 = &v58;
    if (SHIBYTE(v59) < 0)
      v36 = (__n128 *)v58.n128_u64[0];
    v56 = v10;
    __s2 = v36;
    if (SHIBYTE(v59) >= 0)
      v37 = HIBYTE(v59);
    else
      v37 = v58.n128_u64[1];
    while (1)
    {
      v39 = (2 * v13) | 1;
      v40 = v8 + 24 * v39;
      v13 = 2 * v13 + 2;
      if (v13 >= v10)
        goto LABEL_71;
      v41 = v8;
      v42 = v32;
      v35 = (const void **)(v40 + 24);
      v43 = *(char *)(v40 + 23);
      v44 = v43 >= 0 ? (const void *)v40 : *(const void **)v40;
      v45 = v43 >= 0 ? *(unsigned __int8 *)(v40 + 23) : *(_QWORD *)(v40 + 8);
      v46 = *(char *)(v40 + 47);
      v47 = v46 >= 0 ? (const void *)(v40 + 24) : *(const void **)(v40 + 24);
      v48 = v46 >= 0 ? *(unsigned __int8 *)(v40 + 47) : *(_QWORD *)(v40 + 32);
      v49 = v48 >= v45 ? v45 : v48;
      v50 = memcmp(v44, v47, v49);
      if (v50)
        break;
      v33 = v45 >= v48;
      v32 = v42;
      v8 = v41;
      v10 = v56;
      if (v33)
        goto LABEL_71;
LABEL_72:
      v51 = *((char *)v35 + 23);
      if (v51 >= 0)
        v52 = v35;
      else
        v52 = *v35;
      if (v51 >= 0)
        v53 = *((unsigned __int8 *)v35 + 23);
      else
        v53 = (size_t)v35[1];
      if (v37 >= v53)
        v54 = v53;
      else
        v54 = v37;
      v55 = memcmp(v52, __s2, v54);
      if (v55)
      {
        if (v55 < 0)
          goto LABEL_43;
      }
      else if (v53 < v37)
      {
        goto LABEL_43;
      }
      v38 = *(_OWORD *)v35;
      v14[2] = v35[2];
      *(_OWORD *)v14 = v38;
      *((_BYTE *)v35 + 23) = 0;
      *(_BYTE *)v35 = 0;
      v14 = v35;
      if (v32 < v13)
        goto LABEL_44;
    }
    v32 = v42;
    v8 = v41;
    v10 = v56;
    if (v50 < 0)
      goto LABEL_72;
LABEL_71:
    v35 = (const void **)v40;
    v13 = v39;
    goto LABEL_72;
  }
LABEL_43:
  v35 = v14;
LABEL_44:
  result = v58;
  v35[2] = v59;
  *(__n128 *)v35 = result;
  return result;
}

void sub_240BCD2D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const void *v13;
  unint64_t v14;
  int v15;
  const void *v16;
  unint64_t v17;
  size_t v18;
  int v19;
  __int128 v20;
  uint64_t v23;
  char v24;
  _BYTE v26[15];

  if (a4 >= 2)
  {
    v5 = 0;
    v23 = *(_QWORD *)a1;
    *(_QWORD *)v26 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)&v26[7] = *(_QWORD *)(a1 + 15);
    v24 = *(_BYTE *)(a1 + 23);
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    v6 = (unint64_t)(a4 - 2) >> 1;
    v7 = a1;
    while (1)
    {
      v9 = v7 + 24 * v5 + 24;
      v10 = (2 * v5) | 1;
      v5 = 2 * v5 + 2;
      if (v5 >= a4)
        goto LABEL_22;
      v11 = v9 + 24;
      v12 = *(char *)(v9 + 23);
      v13 = v12 >= 0 ? (const void *)v9 : *(const void **)v9;
      v14 = v12 >= 0 ? *(unsigned __int8 *)(v9 + 23) : *(_QWORD *)(v9 + 8);
      v15 = *(char *)(v9 + 47);
      v16 = v15 >= 0 ? (const void *)(v9 + 24) : *(const void **)(v9 + 24);
      v17 = v15 >= 0 ? *(unsigned __int8 *)(v9 + 47) : *(_QWORD *)(v9 + 32);
      v18 = v17 >= v14 ? v14 : v17;
      v19 = memcmp(v13, v16, v18);
      if (!v19)
        break;
      if ((v19 & 0x80000000) == 0)
        goto LABEL_22;
LABEL_23:
      if (*(char *)(v7 + 23) < 0)
        operator delete(*(void **)v7);
      v8 = *(_OWORD *)v11;
      *(_QWORD *)(v7 + 16) = *(_QWORD *)(v11 + 16);
      *(_OWORD *)v7 = v8;
      *(_BYTE *)(v11 + 23) = 0;
      *(_BYTE *)v11 = 0;
      v7 = v11;
      if (v5 > v6)
      {
        if (v11 == a2 - 24)
        {
          *(_QWORD *)v11 = v23;
          *(_QWORD *)(v11 + 8) = *(_QWORD *)v26;
          *(_QWORD *)(v11 + 15) = *(_QWORD *)&v26[7];
          *(_BYTE *)(v11 + 23) = v24;
        }
        else
        {
          v20 = *(_OWORD *)(a2 - 24);
          *(_QWORD *)(v11 + 16) = *(_QWORD *)(a2 - 8);
          *(_OWORD *)v11 = v20;
          *(_QWORD *)(a2 - 24) = v23;
          *(_QWORD *)(a2 - 16) = *(_QWORD *)v26;
          *(_QWORD *)(a2 - 9) = *(_QWORD *)&v26[7];
          *(_BYTE *)(a2 - 1) = v24;
          sub_240BCD4C0(a1, v11 + 24, a3, 0xAAAAAAAAAAAAAAABLL * ((v11 + 24 - a1) >> 3));
        }
        return;
      }
    }
    if (v14 < v17)
      goto LABEL_23;
LABEL_22:
    v11 = v9;
    v5 = v10;
    goto LABEL_23;
  }
}

__n128 sub_240BCD4C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v6;
  __n128 *v7;
  __n128 *v8;
  int v9;
  const void *v10;
  size_t v11;
  int v12;
  const void *v13;
  size_t v14;
  size_t v15;
  int v16;
  __n128 result;
  unint64_t v18;
  size_t v19;
  __n128 *v20;
  size_t v21;
  __n128 v22;
  __n128 v23;
  unint64_t v24;
  __n128 *v25;
  int v26;
  const void *v27;
  size_t v28;
  size_t v29;
  int v30;
  __n128 v31;
  unint64_t v32;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v6 = v4 >> 1;
    v7 = (__n128 *)(a1 + 24 * (v4 >> 1));
    v8 = (__n128 *)(a2 - 24);
    v9 = v7[1].n128_i8[7];
    if (v9 >= 0)
      v10 = (const void *)(a1 + 24 * (v4 >> 1));
    else
      v10 = (const void *)v7->n128_u64[0];
    if (v9 >= 0)
      v11 = v7[1].n128_u8[7];
    else
      v11 = v7->n128_u64[1];
    v12 = *(char *)(a2 - 1);
    if (v12 >= 0)
      v13 = (const void *)(a2 - 24);
    else
      v13 = *(const void **)(a2 - 24);
    if (v12 >= 0)
      v14 = v8[1].n128_u8[7];
    else
      v14 = v8->n128_u64[1];
    if (v14 >= v11)
      v15 = v11;
    else
      v15 = v14;
    v16 = memcmp(v10, v13, v15);
    if (v16)
    {
      if ((v16 & 0x80000000) == 0)
        return result;
    }
    else if (v11 >= v14)
    {
      return result;
    }
    v32 = v8[1].n128_u64[0];
    v18 = v32;
    v31 = *v8;
    v8->n128_u64[1] = 0;
    v8[1].n128_u64[0] = 0;
    v8->n128_u64[0] = 0;
    v19 = HIBYTE(v18);
    if ((v19 & 0x80u) == 0)
      v20 = &v31;
    else
      v20 = (__n128 *)v31.n128_u64[0];
    if ((v19 & 0x80u) == 0)
      v21 = v19;
    else
      v21 = v31.n128_u64[1];
    v22 = *v7;
    v8[1].n128_u64[0] = v7[1].n128_u64[0];
    *v8 = v22;
    v7[1].n128_u8[7] = 0;
    v7->n128_u8[0] = 0;
    if (v4 >= 2)
    {
      while (1)
      {
        v24 = v6 - 1;
        v6 = (v6 - 1) >> 1;
        v25 = (__n128 *)(a1 + 24 * v6);
        v26 = v25[1].n128_i8[7];
        if (v26 >= 0)
          v27 = (const void *)(a1 + 24 * v6);
        else
          v27 = (const void *)v25->n128_u64[0];
        if (v26 >= 0)
          v28 = v25[1].n128_u8[7];
        else
          v28 = v25->n128_u64[1];
        if (v21 >= v28)
          v29 = v28;
        else
          v29 = v21;
        v30 = memcmp(v27, v20, v29);
        if (v30)
        {
          if ((v30 & 0x80000000) == 0)
            break;
        }
        else if (v28 >= v21)
        {
          break;
        }
        v23 = *v25;
        v7[1].n128_u64[0] = v25[1].n128_u64[0];
        *v7 = v23;
        v25[1].n128_u8[7] = 0;
        v25->n128_u8[0] = 0;
        v7 = (__n128 *)(a1 + 24 * v6);
        if (v24 <= 1)
          goto LABEL_43;
      }
    }
    v25 = v7;
LABEL_43:
    result = v31;
    v25[1].n128_u64[0] = v32;
    *v25 = result;
  }
  return result;
}

void sub_240BCD648(char **a1, unint64_t a2)
{
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  unint64_t v12;
  char *v13;
  size_t v14;
  char *v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v5 = a1[1];
  v4 = a1[2];
  if (a2 <= (v4 - v5) >> 6)
  {
    if (a2)
    {
      v12 = a2 << 6;
      bzero(a1[1], a2 << 6);
      v5 += v12;
    }
    a1[1] = v5;
  }
  else
  {
    v6 = *a1;
    v7 = (v5 - *a1) >> 6;
    v8 = v7 + a2;
    if ((v7 + a2) >> 58)
      sub_240BC9E84();
    v9 = v4 - v6;
    if (v9 >> 5 > v8)
      v8 = v9 >> 5;
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFC0)
      v10 = 0x3FFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
    {
      if (v10 >> 58)
        sub_240BCB680();
      v11 = (char *)operator new(v10 << 6);
    }
    else
    {
      v11 = 0;
    }
    v13 = &v11[64 * v7];
    v14 = a2 << 6;
    v15 = &v11[64 * v10];
    bzero(v13, v14);
    v16 = &v13[v14];
    if (v5 != v6)
    {
      do
      {
        v17 = *((_OWORD *)v5 - 4);
        v18 = *((_OWORD *)v5 - 3);
        v19 = *((_OWORD *)v5 - 1);
        *((_OWORD *)v13 - 2) = *((_OWORD *)v5 - 2);
        *((_OWORD *)v13 - 1) = v19;
        *((_OWORD *)v13 - 4) = v17;
        *((_OWORD *)v13 - 3) = v18;
        v13 -= 64;
        v5 -= 64;
      }
      while (v5 != v6);
      v5 = *a1;
    }
    *a1 = v13;
    a1[1] = v16;
    a1[2] = v15;
    if (v5)
      operator delete(v5);
  }
}

void sub_240BCD774(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_240BCD774(a1, *(_QWORD *)a2);
    sub_240BCD774(a1, *((_QWORD *)a2 + 1));
    if (a2[55] < 0)
      operator delete(*((void **)a2 + 4));
    operator delete(a2);
  }
}

uint64_t **sub_240BCD7C4(uint64_t **a1, const void **a2, uint64_t a3, __int128 **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  int v8;
  const void *v9;
  size_t v10;
  uint64_t **v11;
  _QWORD *v12;
  const void *v13;
  const void *v14;
  int v15;
  const void *v16;
  size_t v17;
  size_t v18;
  int v19;
  int v20;
  _QWORD *v21;
  _BYTE *v22;
  __int128 *v23;
  __int128 v24;
  uint64_t *v25;
  uint64_t *v26;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *((char *)a2 + 23);
    if (v8 >= 0)
      v9 = a2;
    else
      v9 = *a2;
    if (v8 >= 0)
      v10 = *((unsigned __int8 *)a2 + 23);
    else
      v10 = (size_t)a2[1];
    while (1)
    {
      v11 = (uint64_t **)v6;
      v14 = (const void *)v6[4];
      v12 = v6 + 4;
      v13 = v14;
      v15 = *((char *)v12 + 23);
      if (v15 >= 0)
        v16 = v12;
      else
        v16 = v13;
      if (v15 >= 0)
        v17 = *((unsigned __int8 *)v12 + 23);
      else
        v17 = v12[1];
      if (v17 >= v10)
        v18 = v10;
      else
        v18 = v17;
      v19 = memcmp(v9, v16, v18);
      if (v19)
      {
        if (v19 < 0)
          goto LABEL_8;
LABEL_22:
        v20 = memcmp(v16, v9, v18);
        if (v20)
        {
          if ((v20 & 0x80000000) == 0)
            return v11;
        }
        else if (v17 >= v10)
        {
          return v11;
        }
        v6 = v11[1];
        if (!v6)
        {
          v7 = v11 + 1;
          goto LABEL_29;
        }
      }
      else
      {
        if (v10 >= v17)
          goto LABEL_22;
LABEL_8:
        v6 = *v11;
        v7 = v11;
        if (!*v11)
          goto LABEL_29;
      }
    }
  }
  v11 = a1 + 1;
LABEL_29:
  v21 = operator new(0x40uLL);
  v22 = v21 + 4;
  v23 = *a4;
  if (*((char *)*a4 + 23) < 0)
  {
    sub_240BCD950(v22, *(void **)v23, *((_QWORD *)v23 + 1));
  }
  else
  {
    v24 = *v23;
    v21[6] = *((_QWORD *)v23 + 2);
    *(_OWORD *)v22 = v24;
  }
  v21[7] = 0;
  *v21 = 0;
  v21[1] = 0;
  v21[2] = v11;
  *v7 = v21;
  v25 = (uint64_t *)**a1;
  v26 = v21;
  if (v25)
  {
    *a1 = v25;
    v26 = *v7;
  }
  sub_240BCD9DC(a1[1], v26);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return (uint64_t **)v21;
}

void sub_240BCD93C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_240BCD950(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_240BC9D74();
    v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17)
      v6 = a3 | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *v5 = v8;
    v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

uint64_t *sub_240BCD9DC(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = a2[2];
      if (*(_BYTE *)(v2 + 24))
        break;
      v3 = *(uint64_t **)(v2 + 16);
      v4 = *v3;
      if (*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if (*(uint64_t **)v2 == a2)
          {
            v9 = (uint64_t *)a2[2];
          }
          else
          {
            v9 = *(uint64_t **)(v2 + 8);
            v10 = *v9;
            *(_QWORD *)(v2 + 8) = *v9;
            if (v10)
            {
              *(_QWORD *)(v10 + 16) = v2;
              v3 = *(uint64_t **)(v2 + 16);
            }
            v9[2] = (uint64_t)v3;
            *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8 * (**(_QWORD **)(v2 + 16) != v2)) = v9;
            *v9 = v2;
            *(_QWORD *)(v2 + 16) = v9;
            v3 = (uint64_t *)v9[2];
            v2 = *v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v14 = *(_QWORD *)(v2 + 8);
          *v3 = v14;
          if (v14)
            *(_QWORD *)(v14 + 16) = v3;
          *(_QWORD *)(v2 + 16) = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          *(_QWORD *)(v2 + 8) = v3;
          v3[2] = v2;
          return result;
        }
      }
      else if (!v4 || (v6 = *(unsigned __int8 *)(v4 + 24), v5 = (_BYTE *)(v4 + 24), v6))
      {
        if (*(uint64_t **)v2 == a2)
        {
          v11 = a2[1];
          *(_QWORD *)v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = *(uint64_t **)(v2 + 16);
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8 * (**(_QWORD **)(v2 + 16) != v2)) = a2;
          a2[1] = v2;
          *(_QWORD *)(v2 + 16) = a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v12 = (uint64_t *)v3[1];
        v13 = *v12;
        v3[1] = *v12;
        if (v13)
          *(_QWORD *)(v13 + 16) = v3;
        v12[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v12;
        *v12 = (uint64_t)v3;
        v3[2] = (uint64_t)v12;
        return result;
      }
      *(_BYTE *)(v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t *sub_240BCDB7C(uint64_t a1, const void **a2)
{
  uint64_t *v2;
  uint64_t *v3;
  int v4;
  const void *v5;
  size_t v6;
  uint64_t *v7;
  int v8;
  uint64_t *v9;
  size_t v10;
  size_t v11;
  int v12;
  int v13;
  const void *v14;
  size_t v15;
  size_t v16;
  int v17;

  v2 = (uint64_t *)(a1 + 8);
  v3 = *(uint64_t **)(a1 + 8);
  if (!v3)
    return v2;
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = a2;
  else
    v5 = *a2;
  if (v4 >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  v7 = (uint64_t *)(a1 + 8);
  do
  {
    while (1)
    {
      v8 = *((char *)v3 + 55);
      v9 = v8 >= 0 ? v3 + 4 : (uint64_t *)v3[4];
      v10 = v8 >= 0 ? *((unsigned __int8 *)v3 + 55) : v3[5];
      v11 = v6 >= v10 ? v10 : v6;
      v12 = memcmp(v9, v5, v11);
      if (v12)
        break;
      if (v10 >= v6)
        goto LABEL_23;
LABEL_9:
      v3 = (uint64_t *)v3[1];
      if (!v3)
        goto LABEL_24;
    }
    if (v12 < 0)
      goto LABEL_9;
LABEL_23:
    v7 = v3;
    v3 = (uint64_t *)*v3;
  }
  while (v3);
LABEL_24:
  if (v7 == v2)
    return v2;
  v13 = *((char *)v7 + 55);
  if (v13 >= 0)
    v14 = v7 + 4;
  else
    v14 = (const void *)v7[4];
  if (v13 >= 0)
    v15 = *((unsigned __int8 *)v7 + 55);
  else
    v15 = v7[5];
  if (v15 >= v6)
    v16 = v6;
  else
    v16 = v15;
  v17 = memcmp(v5, v14, v16);
  if (!v17)
  {
    if (v6 >= v15)
      return v7;
    return v2;
  }
  if (v17 < 0)
    return v2;
  return v7;
}

void sub_240BCDC80(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_240BCDC9C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_240BCDCAC(uint64_t *a1, uint64_t a2)
{
  const char *v4;
  size_t v5;
  std::string::size_type v6;
  std::string *p_p;
  uint64_t v8;
  uint64_t v9;
  std::string *v10;
  std::string::size_type size;
  size_t v12;
  int v13;
  size_t v14;
  void **p_dst;
  char *v16;
  const char *v17;
  size_t v18;
  std::string::size_type v19;
  std::string *v20;
  uint64_t v21;
  uint64_t v22;
  std::string::size_type v23;
  std::string::size_type v24;
  std::string *v25;
  std::string::size_type v26;
  void **v27;
  size_t v28;
  std::string::size_type v29;
  std::string::size_type v30;
  std::string *v31;
  std::string::size_type v32;
  uint64_t v33;
  uint64_t v34;
  std::string *v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  std::string __p;
  void **__dst;
  size_t v42;
  int64_t v43;

  if (*(char *)(a2 + 23) >= 0)
    v4 = (const char *)a2;
  else
    v4 = *(const char **)a2;
  v5 = strlen(v4);
  if (v5 > 0x7FFFFFFFFFFFFFF7)
    sub_240BC9D74();
  v6 = v5;
  if (v5 >= 0x17)
  {
    v8 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17)
      v8 = v5 | 7;
    v9 = v8 + 1;
    p_p = (std::string *)operator new(v8 + 1);
    __p.__r_.__value_.__l.__size_ = v6;
    __p.__r_.__value_.__r.__words[2] = v9 | 0x8000000000000000;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)p_p;
  }
  else
  {
    *((_BYTE *)&__p.__r_.__value_.__s + 23) = v5;
    p_p = &__p;
    if (!v5)
      goto LABEL_12;
  }
  memmove(p_p, v4, v6);
LABEL_12:
  p_p->__r_.__value_.__s.__data_[v6] = 0;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v10 = &__p;
  else
    v10 = (std::string *)__p.__r_.__value_.__r.__words[0];
  size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = __p.__r_.__value_.__l.__size_;
  v12 = size;
  do
  {
    if (!v12)
      goto LABEL_28;
    v13 = v10->__r_.__value_.__s.__data_[--v12];
  }
  while (v13 != 47);
  if (v12 == -1)
  {
LABEL_28:
    HIBYTE(v43) = 0;
    LOBYTE(__dst) = 0;
    if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
  if (size >= v12)
    v14 = v12;
  else
    v14 = size;
  if (v14 > 0x7FFFFFFFFFFFFFF7)
    sub_240BC9D74();
  if (v14 >= 0x17)
  {
    v33 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v33 = v14 | 7;
    v34 = v33 + 1;
    p_dst = (void **)operator new(v33 + 1);
    v42 = v14;
    v43 = v34 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_78;
  }
  HIBYTE(v43) = v14;
  p_dst = (void **)&__dst;
  if (v14)
LABEL_78:
    memmove(p_dst, v10, v14);
  *((_BYTE *)p_dst + v14) = 0;
  if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) != 0)
LABEL_29:
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_30:
  v16 = getenv("__UNOWUD_RT");
  if (v16)
    v17 = v16;
  else
    v17 = "";
  v18 = strlen(v17);
  if (v18 > 0x7FFFFFFFFFFFFFF7)
    sub_240BC9D74();
  v19 = v18;
  if (v18 >= 0x17)
  {
    v21 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17)
      v21 = v18 | 7;
    v22 = v21 + 1;
    v20 = (std::string *)operator new(v21 + 1);
    __p.__r_.__value_.__l.__size_ = v19;
    __p.__r_.__value_.__r.__words[2] = v22 | 0x8000000000000000;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v20;
    goto LABEL_40;
  }
  *((_BYTE *)&__p.__r_.__value_.__s + 23) = v18;
  v20 = &__p;
  if (v18)
LABEL_40:
    memmove(v20, v17, v19);
  v20->__r_.__value_.__s.__data_[v19] = 0;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v23 = 22;
  else
    v23 = (__p.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v24 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v24 = __p.__r_.__value_.__l.__size_;
  if (v23 - v24 >= 0x16)
  {
    v25 = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v25 = (std::string *)__p.__r_.__value_.__r.__words[0];
    qmemcpy((char *)v25 + v24, " --load-constant-path=", 22);
    v26 = v24 + 22;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      __p.__r_.__value_.__l.__size_ = v24 + 22;
    else
      *((_BYTE *)&__p.__r_.__value_.__s + 23) = v26 & 0x7F;
    v25->__r_.__value_.__s.__data_[v26] = 0;
  }
  else
  {
    std::string::__grow_by_and_replace(&__p, v23, v24 - v23 + 22, v24, v24, 0, 0x16uLL, " --load-constant-path=");
  }
  if (v43 >= 0)
    v27 = (void **)&__dst;
  else
    v27 = __dst;
  if (v43 >= 0)
    v28 = HIBYTE(v43);
  else
    v28 = v42;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v29 = 22;
  else
    v29 = (__p.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v30 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v30 = __p.__r_.__value_.__l.__size_;
  if (v29 - v30 >= v28)
  {
    if (v28)
    {
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v31 = &__p;
      else
        v31 = (std::string *)__p.__r_.__value_.__r.__words[0];
      memmove((char *)v31 + v30, v27, v28);
      v32 = v30 + v28;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        __p.__r_.__value_.__l.__size_ = v30 + v28;
      else
        *((_BYTE *)&__p.__r_.__value_.__s + 23) = v32 & 0x7F;
      v31->__r_.__value_.__s.__data_[v32] = 0;
    }
  }
  else
  {
    std::string::__grow_by_and_replace(&__p, v29, v30 + v28 - v29, v30, v30, 0, v28, (const std::string::value_type *)v27);
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v35 = &__p;
  else
    v35 = (std::string *)__p.__r_.__value_.__r.__words[0];
  setenv("__UNOWUD_RT", (const char *)v35, 1);
  v36 = operator new();
  v37 = *a1;
  *a1 = 0;
  *(_QWORD *)v36 = off_25110D6B0;
  *(_QWORD *)(v36 + 8) = v37;
  v38 = (_BYTE *)(v36 + 16);
  if (*(char *)(a2 + 23) < 0)
  {
    sub_240BCD950(v38, *(void **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)v38 = *(_OWORD *)a2;
    *(_QWORD *)(v36 + 32) = *(_QWORD *)(a2 + 16);
  }
  *(_WORD *)(v36 + 48) = 0;
  *(_BYTE *)(v36 + 50) = 0;
  if ((sub_240BCE190(v36) & 1) != 0)
  {
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_91;
LABEL_94:
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v43) & 0x80000000) == 0)
      return v36;
LABEL_95:
    operator delete(__dst);
    return v36;
  }
  (*(void (**)(uint64_t))(*(_QWORD *)v36 + 8))(v36);
  v36 = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_94;
LABEL_91:
  if (SHIBYTE(v43) < 0)
    goto LABEL_95;
  return v36;
}

void sub_240BCE11C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  uint64_t v20;
  uint64_t v22;

  v22 = *(_QWORD *)(v20 + 8);
  *(_QWORD *)(v20 + 8) = 0;
  if (v22)
    (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
  sub_240BDA374(v20);
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(a1);
}

uint64_t sub_240BCE190(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  std::string::size_type v4;
  std::string::size_type size;
  std::string *v6;
  char *v7;
  std::string::size_type v8;
  std::string v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  std::string buf;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = mlc_binary_create();
  *(_QWORD *)(a1 + 40) = v2;
  if (!v2)
    return 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  mlc_binary_error();
  v3 = 1;
  sub_240BCE3B4((_QWORD *)(a1 + 16), &v10);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v4 = 22;
  else
    v4 = (v10.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v10.__r_.__value_.__r.__words[2]);
  else
    size = v10.__r_.__value_.__l.__size_;
  if (v4 - size >= 6)
  {
    v6 = &v10;
    if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v6 = (std::string *)v10.__r_.__value_.__r.__words[0];
    v7 = (char *)v6 + size;
    *((_WORD *)v7 + 2) = 25193;
    *(_DWORD *)v7 = 1819894830;
    v8 = size + 6;
    if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
      v10.__r_.__value_.__l.__size_ = size + 6;
    else
      *((_BYTE *)&v10.__r_.__value_.__s + 23) = v8 & 0x7F;
    v6->__r_.__value_.__s.__data_[v8] = 0;
  }
  else
  {
    std::string::__grow_by_and_replace(&v10, v4, size - v4 + 6, size, size, 0, 6uLL, ".dylib");
  }
  buf = v10;
  mlc_binary_set_kernel_dylib();
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  return v3;
}

void sub_240BCE378(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a14 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *sub_240BCE3B4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  unint64_t v4;
  unint64_t v5;
  size_t v6;
  _QWORD *v7;
  void *v8;
  int64_t v9;
  BOOL v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v2 = result;
  v4 = *((unsigned __int8 *)result + 23);
  v5 = result[1];
  if ((v4 & 0x80u) == 0)
    v6 = *((unsigned __int8 *)result + 23);
  else
    v6 = result[1];
  if (!v6
    || ((v7 = (_QWORD *)*result, (v4 & 0x80u) == 0) ? (v8 = result) : (v8 = (void *)*result),
        (result = memchr(v8, 58, v6), v9 = (char *)result - (_BYTE *)v8, result) ? (v10 = v9 == -1) : (v10 = 1),
        v10))
  {
    if ((v4 & 0x80) == 0)
    {
LABEL_14:
      *(_OWORD *)a2 = *(_OWORD *)v2;
      a2[2] = v2[2];
      return result;
    }
    return sub_240BCD950(a2, (void *)*v2, v5);
  }
  v11 = v9 + 2;
  if ((v4 & 0x80) != 0)
  {
    if (v5 > v11)
    {
      v12 = v9 + 3;
      if (v5 < v9 + 3)
        goto LABEL_32;
      v4 = v5;
      v2 = v7;
      goto LABEL_22;
    }
    return sub_240BCD950(a2, (void *)*v2, v5);
  }
  if (v11 >= v4)
    goto LABEL_14;
  v12 = v9 + 3;
  if (v9 + 3 > v4)
LABEL_32:
    sub_240BC9DFC();
LABEL_22:
  v13 = v4 - v12;
  if (v4 - v12 >= 0x7FFFFFFFFFFFFFF8)
    sub_240BC9D74();
  if (v13 >= 0x17)
  {
    v14 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17)
      v14 = v13 | 7;
    v15 = v14 + 1;
    v16 = operator new(v14 + 1);
    a2[1] = v13;
    a2[2] = v15 | 0x8000000000000000;
    *a2 = v16;
    a2 = v16;
  }
  else
  {
    *((_BYTE *)a2 + 23) = v13;
    if (v4 == v12)
      goto LABEL_31;
  }
  result = memmove(a2, (char *)v2 + v12, v4 - v12);
LABEL_31:
  *((_BYTE *)a2 + v13) = 0;
  return result;
}

uint64_t sub_240BCE524(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)a1 = off_25110D6B0;
  if (*(char *)(a1 + 39) < 0)
    operator delete(*(void **)(a1 + 16));
  v2 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return nullsub_1(a1);
}

void sub_240BCE578(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)a1 = off_25110D6B0;
  if (*(char *)(a1 + 39) < 0)
    operator delete(*(void **)(a1 + 16));
  v2 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  nullsub_1(a1);
  JUMPOUT(0x24268B398);
}

uint64_t sub_240BCE5E0(_BYTE *a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v29;
  _BYTE *v32;
  _QWORD v33[3];
  _QWORD *v34;
  _QWORD v35[3];
  _QWORD *v36;
  _QWORD v37[3];
  _QWORD *v38;
  _QWORD v39[3];
  _QWORD *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v13 = mlc_binary_n_inputs();
  v14 = mlc_binary_n_outputs();
  v32 = a1;
  v39[0] = &off_25110D750;
  v39[1] = MEMORY[0x24BE62368];
  v40 = v39;
  v37[0] = &off_25110D798;
  v37[1] = MEMORY[0x24BE623D0];
  v38 = v37;
  if (v13 >= a2)
    v15 = a2;
  else
    v15 = v13;
  sub_240BCE8DC((uint64_t *)&v32, (uint64_t)v39, (uint64_t)v37, a3, a4, v15);
  v17 = v38;
  if (v38 == v37)
  {
    v20 = 4;
    v17 = v37;
    v18 = a7;
    v19 = MEMORY[0x24BE623D0];
  }
  else
  {
    v18 = a7;
    v19 = MEMORY[0x24BE623D0];
    if (!v38)
      goto LABEL_9;
    v20 = 5;
  }
  (*(void (**)(_QWORD *, uint64_t))(*v17 + 8 * v20))(v17, v16);
LABEL_9:
  v21 = v40;
  if (v40 == v39)
  {
    v22 = 4;
    v21 = v39;
  }
  else
  {
    if (!v40)
      goto LABEL_14;
    v22 = 5;
  }
  (*(void (**)(_QWORD *, uint64_t))(*v21 + 8 * v22))(v21, v16);
LABEL_14:
  v35[0] = &off_25110D750;
  v35[1] = MEMORY[0x24BE62388];
  v36 = v35;
  v33[0] = &off_25110D798;
  v33[1] = v19;
  v34 = v33;
  if (v14 >= a5)
    v23 = a5;
  else
    v23 = v14;
  sub_240BCE8DC((uint64_t *)&v32, (uint64_t)v35, (uint64_t)v33, a6, v18, v23);
  v24 = v34;
  if (v34 == v33)
  {
    v25 = 4;
    v24 = v33;
  }
  else
  {
    if (!v34)
      goto LABEL_22;
    v25 = 5;
  }
  (*(void (**)(void))(*v24 + 8 * v25))();
LABEL_22:
  v26 = v36;
  if (v36 == v35)
  {
    v27 = 4;
    v26 = v35;
  }
  else
  {
    if (!v36)
      goto LABEL_27;
    v27 = 5;
  }
  (*(void (**)(void))(*v26 + 8 * v27))();
LABEL_27:
  v29 = v13 == a2 && v14 == a5;
  a1[50] = v29;
  a1[48] = 0;
  return sub_240BCEB64(a1);
}

void sub_240BCE81C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_240BCE828(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, char *a14, char a15, uint64_t a16, uint64_t a17, char *a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  char *v26;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;

  v28 = a14;
  if (a14 == v26)
  {
    v29 = 4;
    v28 = &a11;
  }
  else
  {
    if (!a14)
      goto LABEL_6;
    v29 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v28 + 8 * v29))();
LABEL_6:
  v30 = a18;
  if (a18 == &a15)
  {
    v31 = 4;
    v30 = &a15;
  }
  else
  {
    if (!a18)
      goto LABEL_11;
    v31 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v30 + 8 * v31))();
LABEL_11:
  _Unwind_Resume(exception_object);
}

void sub_240BCE8DC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t i;
  uint64_t v12;
  const char *v13;
  size_t v14;
  size_t v15;
  __int128 *p_dst;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  BOOL v29;
  __int128 __dst;
  unint64_t v32;
  void *__p[2];
  unint64_t v34;
  int v35;
  char **v36;
  char *v37[2];
  uint64_t v38;

  v6 = *a1;
  v37[0] = 0;
  v37[1] = 0;
  v36 = v37;
  if (!a6)
    goto LABEL_25;
  for (i = 0; i != a6; ++i)
  {
    __p[0] = *(void **)(v6 + 40);
    *(_QWORD *)&__dst = i;
    v12 = *(_QWORD *)(a2 + 24);
    if (!v12)
      sub_240BCF2D0();
    (*(void (**)(uint64_t, void **, __int128 *))(*(_QWORD *)v12 + 48))(v12, __p, &__dst);
    v13 = (const char *)mlc_tensor_name();
    v14 = strlen(v13);
    if (v14 >= 0x7FFFFFFFFFFFFFF8)
      sub_240BC9D74();
    v15 = v14;
    if (v14 >= 0x17)
    {
      v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v14 | 7) != 0x17)
        v17 = v14 | 7;
      v18 = v17 + 1;
      p_dst = (__int128 *)operator new(v17 + 1);
      *((_QWORD *)&__dst + 1) = v15;
      v32 = v18 | 0x8000000000000000;
      *(_QWORD *)&__dst = p_dst;
LABEL_12:
      memmove(p_dst, v13, v15);
      goto LABEL_13;
    }
    HIBYTE(v32) = v14;
    p_dst = &__dst;
    if (v14)
      goto LABEL_12;
LABEL_13:
    *((_BYTE *)p_dst + v15) = 0;
    *(_OWORD *)__p = __dst;
    v34 = v32;
    v35 = i;
    sub_240BCF32C((uint64_t **)&v36, (const void **)__p, (uint64_t)__p);
    if (SHIBYTE(v34) < 0)
      operator delete(__p[0]);
  }
  v19 = 0;
  v20 = (uint64_t *)v36;
  do
  {
    v21 = *((int *)v20 + 14);
    __p[0] = *(void **)(v6 + 40);
    *(_QWORD *)&__dst = v21;
    v22 = *(_QWORD *)(a2 + 24);
    if (!v22
      || (v23 = (void *)(*(uint64_t (**)(uint64_t, void **, __int128 *))(*(_QWORD *)v22 + 48))(v22, __p, &__dst), v24 = *(_QWORD *)(a4 + 8 * v19), v25 = *(_QWORD *)(a5 + 8 * v19), __p[0] = v23, *(_QWORD *)&__dst = v24, v38 = v25, (v26 = *(_QWORD *)(a3 + 24)) == 0))
    {
      sub_240BCF2D0();
    }
    (*(void (**)(uint64_t, void **, __int128 *, uint64_t *))(*(_QWORD *)v26 + 48))(v26, __p, &__dst, &v38);
    mlc_tensor_event();
    mlc_event_record();
    v27 = (uint64_t *)v20[1];
    if (v27)
    {
      do
      {
        v28 = v27;
        v27 = (uint64_t *)*v27;
      }
      while (v27);
    }
    else
    {
      do
      {
        v28 = (uint64_t *)v20[2];
        v29 = *v28 == (_QWORD)v20;
        v20 = v28;
      }
      while (!v29);
    }
    ++v19;
    v20 = v28;
  }
  while (v19 != a6);
LABEL_25:
  sub_240BCD774((uint64_t)&v36, v37[0]);
}

void sub_240BCEB20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20,char *a21)
{
  sub_240BCD774((uint64_t)&a20, a21);
  _Unwind_Resume(a1);
}

uint64_t sub_240BCEB64(_BYTE *a1)
{
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (!a1[48] && a1[49] && a1[50])
  {
    mlc_binary_validate();
    mlc_binary_error();
    a1[48] = 1;
  }
  return 1;
}

uint64_t sub_240BCEC7C(_BYTE *a1)
{
  mlc_binary_load_sync();
  mlc_binary_error();
  a1[49] = 1;
  return sub_240BCEB64(a1);
}

uint64_t sub_240BCED7C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t result;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  _BOOL4 v20;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (!sub_240BCEF44(a1, a2))
  {
    v13 = os_log_create("com.apple.mlcompiler.service", "ExecutionInProcess");
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v14)
      return result;
    v21 = 136315138;
    v22 = a2;
    v16 = "No tensor named '%s' in the inputs or outputs of the binary";
    v17 = v13;
    v18 = 12;
LABEL_13:
    _os_log_impl(&dword_240BC3000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v21, v18);
    return 0;
  }
  if (mlc_tensor_rank() != a3)
  {
    v19 = os_log_create("com.apple.mlcompiler.service", "ExecutionInProcess");
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v20)
      return result;
    v21 = 136315394;
    v22 = a2;
    v23 = 2048;
    v24 = a3;
    v16 = "Tensor '%s' is not rank %zu";
    v17 = v19;
    v18 = 22;
    goto LABEL_13;
  }
  if (a3)
  {
    v9 = 0;
    do
    {
      *(_QWORD *)(a4 + 8 * v9) = mlc_tensor_dimension();
      v11 = mlc_tensor_stride();
      v12 = mlc_tensor_type();
      if (v12 <= 0xC)
        v10 = qword_240BDBAB0[v12];
      else
        v10 = 0;
      *(_QWORD *)(a5 + 8 * v9++) = v10 * v11;
    }
    while (a3 != v9);
  }
  return 1;
}

uint64_t sub_240BCEF44(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  size_t v8;
  uint64_t v9;
  const char *v10;
  size_t v11;

  v3 = mlc_binary_n_inputs();
  v4 = mlc_binary_n_outputs();
  if (v3)
  {
    v5 = 0;
    while (1)
    {
      v6 = mlc_binary_input();
      v7 = (const char *)mlc_tensor_name();
      v8 = strlen(v7);
      if (!strncmp(a2, v7, v8))
        break;
      if (v3 == ++v5)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    if (v4)
    {
      v9 = 0;
      while (1)
      {
        v6 = mlc_binary_output();
        v10 = (const char *)mlc_tensor_name();
        v11 = strlen(v10);
        if (!strncmp(a2, v10, v11))
          break;
        if (v4 == ++v9)
          return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

uint64_t sub_240BCF024(_BYTE *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (!sub_240BCEF44((uint64_t)a1, a2))
  {
    v13 = os_log_create("com.apple.mlcompiler.service", "ExecutionInProcess");
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      return 0;
    v19 = 136315138;
    v20 = (uint64_t)a2;
    v14 = "No tensor named '%s' in the inputs or outputs of the binary";
LABEL_15:
    v15 = v13;
    v16 = 12;
LABEL_16:
    _os_log_impl(&dword_240BC3000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, v16);
    return 0;
  }
  if (mlc_tensor_rank() != a3)
  {
    v13 = os_log_create("com.apple.mlcompiler.service", "ExecutionInProcess");
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      return 0;
    v19 = 136315138;
    v20 = (uint64_t)a2;
    v14 = "Cannot change rank of tensor '%s'";
    goto LABEL_15;
  }
  a1[48] = 0;
  if (!a3)
    return sub_240BCEB64(a1);
  v9 = 0;
  while (1)
  {
    mlc_tensor_set_dimension();
    v10 = mlc_tensor_type();
    v11 = v10 > 0xC ? 0 : qword_240BDBAB0[v10];
    if ((*(_QWORD *)(a5 + 8 * v9) & (v11 - 1)) != 0)
      break;
    mlc_tensor_set_stride();
    if (a3 == ++v9)
      return sub_240BCEB64(a1);
  }
  v17 = os_log_create("com.apple.mlcompiler.service", "ExecutionInProcess");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(a5 + 8 * v9);
    v19 = 134218496;
    v20 = v18;
    v21 = 2048;
    v22 = v11;
    v23 = 2048;
    v24 = v18 % v11;
    v14 = "Strides must be in multiples of the element size (stride %lld mod element size %lld == %lld)";
    v15 = v17;
    v16 = 32;
    goto LABEL_16;
  }
  return 0;
}

uint64_t sub_240BCF274()
{
  return mlc_binary_reshape_sync();
}

uint64_t sub_240BCF27C()
{
  mlc_binary_execute_sync();
  return 1;
}

uint64_t sub_240BCF298(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 40))
  {
    mlc_binary_destroy();
    *(_QWORD *)(a1 + 40) = 0;
  }
  *(_WORD *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 50) = 0;
  return 1;
}

void sub_240BCF2D0()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = &unk_25110D728;
  __cxa_throw(exception, (struct type_info *)&unk_25110D700, (void (*)(void *))std::exception::~exception);
}

void sub_240BCF308(std::exception *a1)
{
  std::exception::~exception(a1);
  JUMPOUT(0x24268B398);
}

uint64_t **sub_240BCF32C(uint64_t **a1, const void **a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t **v6;
  int v7;
  const void *v8;
  size_t v9;
  uint64_t **v10;
  _QWORD *v11;
  const void *v12;
  const void *v13;
  int v14;
  const void *v15;
  size_t v16;
  size_t v17;
  int v18;
  int v19;
  char *v20;
  _BYTE *v21;
  uint64_t *v22;
  uint64_t *v23;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *((char *)a2 + 23);
    if (v7 >= 0)
      v8 = a2;
    else
      v8 = *a2;
    if (v7 >= 0)
      v9 = *((unsigned __int8 *)a2 + 23);
    else
      v9 = (size_t)a2[1];
    while (1)
    {
      v10 = (uint64_t **)v5;
      v13 = (const void *)v5[4];
      v11 = v5 + 4;
      v12 = v13;
      v14 = *((char *)v11 + 23);
      if (v14 >= 0)
        v15 = v11;
      else
        v15 = v12;
      if (v14 >= 0)
        v16 = *((unsigned __int8 *)v11 + 23);
      else
        v16 = v11[1];
      if (v16 >= v9)
        v17 = v9;
      else
        v17 = v16;
      v18 = memcmp(v8, v15, v17);
      if (v18)
      {
        if (v18 < 0)
          goto LABEL_8;
LABEL_22:
        v19 = memcmp(v15, v8, v17);
        if (v19)
        {
          if ((v19 & 0x80000000) == 0)
            return v10;
        }
        else if (v16 >= v9)
        {
          return v10;
        }
        v5 = v10[1];
        if (!v5)
        {
          v6 = v10 + 1;
          goto LABEL_29;
        }
      }
      else
      {
        if (v9 >= v16)
          goto LABEL_22;
LABEL_8:
        v5 = *v10;
        v6 = v10;
        if (!*v10)
          goto LABEL_29;
      }
    }
  }
  v10 = a1 + 1;
LABEL_29:
  v20 = (char *)operator new(0x40uLL);
  v21 = v20 + 32;
  if (*(char *)(a3 + 23) < 0)
  {
    sub_240BCD950(v21, *(void **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)v21 = *(_OWORD *)a3;
    *((_QWORD *)v20 + 6) = *(_QWORD *)(a3 + 16);
  }
  *((_DWORD *)v20 + 14) = *(_DWORD *)(a3 + 24);
  *(_QWORD *)v20 = 0;
  *((_QWORD *)v20 + 1) = 0;
  *((_QWORD *)v20 + 2) = v10;
  *v6 = (uint64_t *)v20;
  v22 = (uint64_t *)**a1;
  v23 = (uint64_t *)v20;
  if (v22)
  {
    *a1 = v22;
    v23 = *v6;
  }
  sub_240BCD9DC(a1[1], v23);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return (uint64_t **)v20;
}

void sub_240BCF4A4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_240BCF4BC()
{
  JUMPOUT(0x24268B398);
}

_QWORD *sub_240BCF4D0(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_25110D750;
  result[1] = v3;
  return result;
}

uint64_t sub_240BCF504(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_25110D750;
  a2[1] = v2;
  return result;
}

uint64_t sub_240BCF520(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 8))(*a2, *a3);
}

void sub_240BCF534()
{
  JUMPOUT(0x24268B398);
}

_QWORD *sub_240BCF548(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_25110D798;
  result[1] = v3;
  return result;
}

uint64_t sub_240BCF57C(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_25110D798;
  a2[1] = v2;
  return result;
}

uint64_t sub_240BCF598(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1 + 8))(*a2, *a3, *a4);
}

uint64_t sub_240BCF5AC(uint64_t a1)
{
  BOOL v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *__p[2];
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v9 = 0;
  *(_QWORD *)&v10 = 0;
  v8 = 4;
  strcpy((char *)__p, "main");
  v1 = sub_240BD372C((uint64_t)&v9, a1, (const void **)__p);
  v2 = v1;
  if (v8 < 0)
  {
    operator delete(__p[0]);
    if (!v2)
    {
LABEL_7:
      v3 = 0;
      goto LABEL_8;
    }
  }
  else if (!v1)
  {
    goto LABEL_7;
  }
  v3 = operator new();
  *(_QWORD *)v3 = &off_25110D7E0;
  *(_QWORD *)(v3 + 8) = 0;
  *(_QWORD *)(v3 + 16) = v9;
  v9 = 0;
  *(_OWORD *)(v3 + 24) = v10;
  *(_OWORD *)(v3 + 40) = v11;
  *(_OWORD *)(v3 + 56) = v12;
  *(_QWORD *)(v3 + 72) = v13;
  *(_WORD *)(v3 + 80) = 0;
  *(_BYTE *)(v3 + 82) = 0;
  v4 = (*(uint64_t (**)(void))(v3 + 32))();
  v5 = (void *)operator new[]();
  bzero(v5, v4);
  *(_QWORD *)(v3 + 8) = v5;
  if (!sub_240BD3B04(v3 + 16, (uint64_t)v5, v4))
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    goto LABEL_7;
  }
LABEL_8:
  sub_240BD3C0C(&v9);
  return v3;
}

void sub_240BCF6E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0)
    operator delete(__p);
  sub_240BD3C0C(&a16);
  _Unwind_Resume(a1);
}

BOOL sub_240BCF710(uint64_t a1, unint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  unint64_t v7;
  _QWORD *v11;
  int v12;
  _BOOL8 result;
  uint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  _QWORD *v17;
  int v18;
  int v19;

  *(_BYTE *)(a1 + 80) = 0;
  v7 = a5 + a2;
  if (!(a5 + a2))
  {
    *(_BYTE *)(a1 + 82) = 1;
LABEL_14:
    result = 1;
    if (*(_BYTE *)(a1 + 81))
      *(_BYTE *)(a1 + 80) = 1;
    return result;
  }
  if (a2)
    v11 = a3;
  else
    v11 = a6;
  v12 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1 + 56))(*(_QWORD *)(a1 + 24), 0, *v11);
  result = 0;
  if (!v12)
  {
    v14 = (uint64_t)&a6[-a2 + 1];
    v15 = a3 + 1;
    v16 = 1;
    while (v7 != v16)
    {
      if (v16 >= a2)
        v17 = (_QWORD *)v14;
      else
        v17 = v15;
      v18 = (*(uint64_t (**)(_QWORD, unint64_t, _QWORD))(a1 + 56))(*(_QWORD *)(a1 + 24), v16++, *v17);
      v14 += 8;
      ++v15;
      if (v18)
        return v16 - 1 >= v7;
    }
    v19 = *(unsigned __int8 *)(a1 + 80);
    result = 1;
    *(_BYTE *)(a1 + 82) = 1;
    if (!v19)
      goto LABEL_14;
  }
  return result;
}

uint64_t sub_240BCF7FC()
{
  return 1;
}

uint64_t sub_240BCF804(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 72))(*(_QWORD *)(a1 + 24));
}

uint64_t sub_240BCF810(uint64_t a1)
{
  uint64_t v2;

  sub_240BD3B3C(a1 + 16);
  v2 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  if (v2)
    MEMORY[0x24268B380](v2, 0x1000C8077774924);
  *(_WORD *)(a1 + 80) = 0;
  *(_BYTE *)(a1 + 82) = 0;
  return 1;
}

uint64_t sub_240BCF860(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_25110D7E0;
  sub_240BD3C0C(a1 + 2);
  v2 = a1[1];
  a1[1] = 0;
  if (v2)
    MEMORY[0x24268B380](v2, 0x1000C8077774924);
  return nullsub_1(a1);
}

void sub_240BCF8B0(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_25110D7E0;
  sub_240BD3C0C(a1 + 2);
  v2 = a1[1];
  a1[1] = 0;
  if (v2)
    MEMORY[0x24268B380](v2, 0x1000C8077774924);
  nullsub_1(a1);
  JUMPOUT(0x24268B398);
}

char *mlc_services_compile(int a1, const char **a2)
{
  uint64_t v2;
  const char **v3;
  _BYTE *v4;
  const char *v5;
  size_t v6;
  _BYTE *v7;
  char *p_dst;
  uint64_t v9;
  uint64_t v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  std::string::size_type v13;
  std::string::size_type size;
  std::string *v15;
  std::string::size_type v16;
  std::string::size_type v17;
  size_t v18;
  std::string *v19;
  size_t v20;
  unint64_t v21;
  std::string *v22;
  std::string::size_type v23;
  unint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  std::string::size_type v27;
  int v28;
  int v29;
  char *v30;
  _OWORD *v31;
  __int128 v32;
  char *v33;
  void **v34;
  char *v35;
  _BYTE *v36;
  _BYTE *v37;
  _xpc_connection_s *v38;
  unint64_t v39;
  size_t v40;
  char *v41;
  char *v42;
  xpc_object_t v43;
  xpc_object_t v44;
  xpc_object_t v45;
  const char *v46;
  xpc_object_t value;
  const char *string_ptr;
  char *v49;
  char *v50;
  void *v51;
  void **v52;
  void **v53;
  uint64_t v54;
  void *v55;
  void *__p;
  _BYTE *v60;
  uint64_t v61;
  void *v62;
  char *v63;
  unint64_t v64;
  void (**__dst)();
  void *v66;
  int64_t v67;
  void *v68;
  char *v69[3];
  std::string v70;
  char *v71;
  char *v72;
  char *v73;
  char key[48];

  memset(&v70, 0, sizeof(v70));
  if (a1 >= 2)
  {
    v2 = a1 - 1;
    v3 = a2 + 1;
    while (1)
    {
      v5 = *v3;
      v6 = strlen(*v3);
      if (v6 > 0x7FFFFFFFFFFFFFF7)
        sub_240BC9D74();
      v7 = (_BYTE *)v6;
      if (v6 >= 0x17)
        break;
      HIBYTE(v67) = v6;
      p_dst = (char *)&__dst;
      if (v6)
        goto LABEL_13;
LABEL_14:
      v7[(_QWORD)p_dst] = 0;
      if (v67 >= 0)
        v11 = (const std::string::value_type *)&__dst;
      else
        v11 = (const std::string::value_type *)__dst;
      if (v67 >= 0)
        v12 = HIBYTE(v67);
      else
        v12 = (std::string::size_type)v66;
      if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v13 = 22;
      else
        v13 = (v70.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
      if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v70.__r_.__value_.__r.__words[2]);
      else
        size = v70.__r_.__value_.__l.__size_;
      if (v13 - size < v12)
      {
        std::string::__grow_by_and_replace(&v70, v13, size + v12 - v13, size, size, 0, v12, v11);
        goto LABEL_34;
      }
      if (!v12)
        goto LABEL_34;
      if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v15 = &v70;
      else
        v15 = (std::string *)v70.__r_.__value_.__r.__words[0];
      memmove((char *)v15 + size, v11, v12);
      v16 = size + v12;
      if ((SHIBYTE(v70.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        *((_BYTE *)&v70.__r_.__value_.__s + 23) = v16 & 0x7F;
        v15->__r_.__value_.__s.__data_[v16] = 0;
LABEL_34:
        if ((SHIBYTE(v67) & 0x80000000) == 0)
          goto LABEL_36;
LABEL_35:
        operator delete(__dst);
        goto LABEL_36;
      }
      v70.__r_.__value_.__l.__size_ = size + v12;
      v15->__r_.__value_.__s.__data_[v16] = 0;
      if (SHIBYTE(v67) < 0)
        goto LABEL_35;
LABEL_36:
      v17 = HIBYTE(v70.__r_.__value_.__r.__words[2]);
      if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v18 = 22;
      else
        v18 = (v70.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
      if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v17 = v70.__r_.__value_.__l.__size_;
      if (v18 != v17)
      {
        if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v22 = &v70;
        else
          v22 = (std::string *)v70.__r_.__value_.__r.__words[0];
        v22->__r_.__value_.__s.__data_[v17] = 32;
        v23 = v17 + 1;
        if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
          v70.__r_.__value_.__l.__size_ = v23;
        else
          *((_BYTE *)&v70.__r_.__value_.__s + 23) = v23 & 0x7F;
        v4 = (char *)v22 + v23;
        goto LABEL_5;
      }
      if (v18 == 0x7FFFFFFFFFFFFFF6)
        sub_240BC9D74();
      if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v19 = &v70;
      else
        v19 = (std::string *)v70.__r_.__value_.__r.__words[0];
      v20 = 0x7FFFFFFFFFFFFFF7;
      if (v18 <= 0x3FFFFFFFFFFFFFF2)
      {
        if (v18 + 1 > 2 * v18)
          v21 = v18 + 1;
        else
          v21 = 2 * v18;
        if (v21 >= 0x17)
        {
          v24 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
          v25 = v21 | 7;
          if (v25 == 23)
            v25 = v24;
          v20 = v25 + 1;
        }
        else
        {
          v20 = 23;
        }
      }
      v26 = operator new(v20);
      v27 = (std::string::size_type)v26;
      if (v18)
      {
        memmove(v26, v19, v18);
        *(_BYTE *)(v27 + v18) = 32;
        if (v18 == 22)
          goto LABEL_65;
      }
      else
      {
        *v26 = 32;
      }
      operator delete(v19);
LABEL_65:
      v70.__r_.__value_.__r.__words[0] = v27;
      v70.__r_.__value_.__l.__size_ = v18 + 1;
      v70.__r_.__value_.__r.__words[2] = v20 | 0x8000000000000000;
      v4 = (_BYTE *)(v27 + v18 + 1);
LABEL_5:
      *v4 = 0;
      ++v3;
      if (!--v2)
        goto LABEL_68;
    }
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    p_dst = (char *)operator new(v9 + 1);
    v66 = v7;
    v67 = v10 | 0x8000000000000000;
    __dst = (void (**)())p_dst;
LABEL_13:
    memmove(p_dst, v5, (size_t)v7);
    goto LABEL_14;
  }
LABEL_68:
  sub_240BD5744(&__dst);
  sub_240BD7E38((char **)&__dst, (__int128 *)&v70);
  key[23] = 10;
  strcpy(key, "bnns-graph");
  v28 = sub_240BD7CD8((uint64_t)&__dst, (uint64_t)key);
  v29 = v28;
  if (key[23] < 0)
  {
    operator delete(*(void **)key);
    if (v29)
      goto LABEL_70;
  }
  else if (v28)
  {
LABEL_70:
    v30 = sub_240BD0AB4(&__dst);
    goto LABEL_110;
  }
  sub_240BD026C(&v62, a2, &a2[a1]);
  *(_QWORD *)key = operator new(0x20uLL);
  *(_OWORD *)&key[8] = xmmword_240BDBB20;
  strcpy(*(char **)key, "--enable-external-outputs");
  v31 = v63;
  if ((unint64_t)v63 >= v64)
  {
    v33 = sub_240BD04B8(&v62, (uint64_t)key);
    v63 = v33;
    if (key[23] < 0)
    {
      operator delete(*(void **)key);
      v33 = v63;
    }
  }
  else
  {
    v32 = *(_OWORD *)key;
    *((_QWORD *)v63 + 2) = *(_QWORD *)&key[16];
    *v31 = v32;
    v33 = (char *)v31 + 24;
    v63 = (char *)v31 + 24;
  }
  __p = 0;
  v60 = 0;
  v61 = 0;
  v34 = (void **)v62;
  *(_QWORD *)key = &__p;
  if (v62 == v33)
  {
    v36 = 0;
    v37 = 0;
  }
  else
  {
    do
    {
      if (*((char *)v34 + 23) >= 0)
        v35 = (char *)v34;
      else
        v35 = (char *)*v34;
      v71 = v35;
      sub_240BD0620((void ***)key, &v71);
      v34 += 3;
    }
    while (v34 != (void **)v33);
    v36 = __p;
    v37 = v60;
  }
  v38 = xpc_connection_create("com.apple.mlcompiler.services.compiler", 0);
  xpc_connection_set_event_handler(v38, &unk_25110D850);
  xpc_connection_activate(v38);
  v39 = (unint64_t)(v37 - v36) >> 3;
  v71 = 0;
  v72 = 0;
  v73 = 0;
  if ((_DWORD)v39)
  {
    if ((v39 & 0x80000000) != 0)
      sub_240BC9E84();
    v40 = 8 * (int)((v37 - v36) >> 3);
    v41 = (char *)operator new(v40);
    v42 = &v41[v40];
    v71 = v41;
    v73 = &v41[v40];
    memcpy(v41, v36, v40);
    v72 = v42;
  }
  v43 = sub_240BD0798(0x407uLL, (uint64_t)&v71);
  if (v71)
  {
    v72 = v71;
    operator delete(v71);
  }
  v44 = xpc_connection_send_message_with_reply_sync(v38, v43);
  xpc_connection_cancel(v38);
  xpc_release(v38);
  if (MEMORY[0x24268B74C](v44) == MEMORY[0x24BDACFB8])
  {
    key[23] = 19;
    strcpy(key, "XPCErrorDescription");
    value = xpc_dictionary_get_value(v44, key);
    string_ptr = xpc_string_get_string_ptr(value);
    if (key[23] < 0)
      operator delete(*(void **)key);
    v30 = strdup(string_ptr);
    if (!v44)
      goto LABEL_98;
    goto LABEL_97;
  }
  key[23] = 1;
  strcpy(key, "m");
  v45 = xpc_dictionary_get_value(v44, key);
  v46 = xpc_string_get_string_ptr(v45);
  v30 = strdup(v46);
  if ((key[23] & 0x80000000) == 0)
  {
    if (!v44)
      goto LABEL_98;
    goto LABEL_97;
  }
  operator delete(*(void **)key);
  if (v44)
LABEL_97:
    xpc_release(v44);
LABEL_98:
  if (v43)
    xpc_release(v43);
  if (__p)
  {
    v60 = __p;
    operator delete(__p);
  }
  v49 = (char *)v62;
  if (v62)
  {
    v50 = v63;
    v51 = v62;
    if (v63 != v62)
    {
      do
      {
        if (*(v50 - 1) < 0)
          operator delete(*((void **)v50 - 3));
        v50 -= 24;
      }
      while (v50 != v49);
      v51 = v62;
    }
    v63 = v49;
    operator delete(v51);
  }
LABEL_110:
  __dst = off_25110D880;
  sub_240BCD774((uint64_t)v69, v69[1]);
  v52 = (void **)v68;
  if (v68)
  {
    do
    {
      v53 = (void **)*v52;
      v54 = *((unsigned int *)v52 + 16);
      if ((_DWORD)v54 != -1)
        ((void (*)(char *, void **))off_25110D8A0[v54])(key, v52 + 5);
      *((_DWORD *)v52 + 16) = -1;
      if (*((char *)v52 + 39) < 0)
        operator delete(v52[2]);
      operator delete(v52);
      v52 = v53;
    }
    while (v53);
  }
  v55 = v66;
  v66 = 0;
  if (v55)
    operator delete(v55);
  nullsub_1(&__dst);
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v70.__r_.__value_.__l.__data_);
  return v30;
}

void sub_240BCFFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void **a15, void **a16, uint64_t a17, void (**a18)(), void *a19, int a20,__int16 a21,char a22,char a23,void **a24,uint64_t a25,uint64_t a26,uint64_t a27,char *a28,uint64_t a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  uint64_t v35;
  void **v37;
  void **v38;
  void **v39;
  void **v40;
  void *v41;
  void **v42;
  uint64_t v43;

  if (*(char *)(v35 - 105) < 0)
    operator delete(*(void **)(v35 - 128));
  v37 = a15;
  if (a15)
  {
    v38 = a16;
    v39 = a15;
    if (a16 != a15)
    {
      do
      {
        if (*((char *)v38 - 1) < 0)
          operator delete(*(v38 - 3));
        v38 -= 3;
      }
      while (v38 != v37);
      v39 = a15;
    }
    a16 = v37;
    operator delete(v39);
  }
  a18 = off_25110D880;
  sub_240BCD774((uint64_t)&a27, a28);
  v40 = a24;
  if (a24)
  {
    do
    {
      v42 = (void **)*v40;
      v43 = *((unsigned int *)v40 + 16);
      if ((_DWORD)v43 != -1)
        ((void (*)(void ***, void **))off_25110D8A0[v43])(&a15, v40 + 5);
      *((_DWORD *)v40 + 16) = -1;
      if (*((char *)v40 + 39) < 0)
        operator delete(v40[2]);
      operator delete(v40);
      v40 = v42;
    }
    while (v42);
  }
  v41 = a19;
  a19 = 0;
  if (v41)
    operator delete(v41);
  nullsub_1(&a18);
  if (a35 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

const char *mlc_services_compile_to_cache()
{
  NSObject *v0;

  v0 = os_log_create("com.apple.mlcompiler.service", "Compilation");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    sub_240BDA3A4(v0);
  return "function no longer supported";
}

void sub_240BD025C(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *sub_240BD026C(_QWORD *a1, const char **a2, const char **a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  _BYTE *v9;

  a1[2] = 0;
  v4 = (uint64_t)(a1 + 2);
  *a1 = 0;
  a1[1] = 0;
  v5 = (char *)a3 - (char *)a2;
  if (a3 != a2)
  {
    if ((unint64_t)v5 >= 0x5555555555555551)
      sub_240BC9E84();
    v8 = v5 >> 3;
    v9 = operator new(24 * (v5 >> 3));
    *a1 = v9;
    a1[1] = v9;
    a1[2] = &v9[24 * v8];
    a1[1] = sub_240BD033C(v4, a2, a3, v9);
  }
  return a1;
}

void sub_240BD0310(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  if (*(_QWORD *)v1)
    sub_240BDA424((void **)(v1 + 8), *(void ***)v1, (void **)v1);
  _Unwind_Resume(exception_object);
}

_BYTE *sub_240BD033C(uint64_t a1, const char **a2, const char **a3, _BYTE *a4)
{
  _BYTE *v4;
  const char **v6;
  const char *v7;
  size_t v8;
  size_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v14;

  v4 = a4;
  v14 = a4;
  if (a2 != a3)
  {
    v6 = a2;
    while (1)
    {
      v7 = *v6;
      v8 = strlen(*v6);
      if (v8 >= 0x7FFFFFFFFFFFFFF8)
        sub_240BC9D74();
      v9 = v8;
      if (v8 >= 0x17)
        break;
      v4[23] = v8;
      if (v8)
        goto LABEL_4;
LABEL_5:
      v4[v9] = 0;
      ++v6;
      v4 = v14 + 24;
      v14 += 24;
      if (v6 == a3)
        return v4;
    }
    v10 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17)
      v10 = v8 | 7;
    v11 = v10 + 1;
    v12 = operator new(v10 + 1);
    *((_QWORD *)v4 + 1) = v9;
    *((_QWORD *)v4 + 2) = v11 | 0x8000000000000000;
    *(_QWORD *)v4 = v12;
    v4 = v12;
LABEL_4:
    memmove(v4, v7, v9);
    goto LABEL_5;
  }
  return v4;
}

void sub_240BD0440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_240BD0458((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_240BD0458(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  if (!*(_BYTE *)(a1 + 24))
  {
    v3 = **(_QWORD **)(a1 + 16);
    v4 = **(_QWORD **)(a1 + 8);
    while (v3 != v4)
    {
      if (*(char *)(v3 - 1) < 0)
        operator delete(*(void **)(v3 - 24));
      v3 -= 24;
    }
  }
  return a1;
}

char *sub_240BD04B8(void **a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  char *v14;

  v3 = 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 3);
  v4 = v3 + 1;
  if (v3 + 1 > 0xAAAAAAAAAAAAAAALL)
    sub_240BC9E84();
  if (0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) > v4)
    v4 = 0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3);
  if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) >= 0x555555555555555)
    v6 = 0xAAAAAAAAAAAAAAALL;
  else
    v6 = v4;
  if (v6)
  {
    if (v6 > 0xAAAAAAAAAAAAAAALL)
      sub_240BCB680();
    v7 = (char *)operator new(24 * v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[24 * v3];
  v9 = &v7[24 * v6];
  *(_OWORD *)v8 = *(_OWORD *)a2;
  *((_QWORD *)v8 + 2) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  v10 = v8 + 24;
  v11 = (char *)*a1;
  v12 = (char *)a1[1];
  if (v12 == *a1)
  {
    *a1 = v8;
    a1[1] = v10;
    a1[2] = v9;
    if (!v12)
      return v10;
    goto LABEL_20;
  }
  do
  {
    v13 = *(_OWORD *)(v12 - 24);
    *((_QWORD *)v8 - 1) = *((_QWORD *)v12 - 1);
    *(_OWORD *)(v8 - 24) = v13;
    v8 -= 24;
    *((_QWORD *)v12 - 2) = 0;
    *((_QWORD *)v12 - 1) = 0;
    *((_QWORD *)v12 - 3) = 0;
    v12 -= 24;
  }
  while (v12 != v11);
  v14 = (char *)*a1;
  v12 = (char *)a1[1];
  *a1 = v8;
  a1[1] = v10;
  a1[2] = v9;
  if (v12 != v14)
  {
    do
    {
      if (*(v12 - 1) < 0)
        operator delete(*((void **)v12 - 3));
      v12 -= 24;
    }
    while (v12 != v14);
    v12 = v14;
  }
  if (v12)
LABEL_20:
    operator delete(v12);
  return v10;
}

void ***sub_240BD0620(void ***a1, _QWORD *a2)
{
  void **v4;
  unint64_t v5;
  char *v6;
  char *v7;
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  _QWORD *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 *v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;

  v4 = *a1;
  v6 = (char *)(*a1)[1];
  v5 = (unint64_t)(*a1)[2];
  v7 = v6;
  if ((unint64_t)v6 >= v5)
  {
    v9 = (char *)*v4;
    v10 = v6 - (_BYTE *)*v4;
    v11 = v10 >> 3;
    v12 = (v10 >> 3) + 1;
    if (v12 >> 61)
      sub_240BC9E84();
    v13 = v5 - (_QWORD)v9;
    if (v13 >> 2 > v12)
      v12 = v13 >> 2;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v12;
    if (v14)
    {
      if (v14 >> 61)
        sub_240BCB680();
      v15 = operator new(8 * v14);
    }
    else
    {
      v15 = 0;
    }
    v16 = &v15[8 * v11];
    *v16 = *a2;
    v8 = v16 + 1;
    if (v6 != v9)
    {
      v17 = v6 - v9 - 8;
      if (v17 < 0x58)
        goto LABEL_28;
      if ((unint64_t)(v6 - v15 - v10) < 0x20)
        goto LABEL_28;
      v18 = (v17 >> 3) + 1;
      v19 = 8 * (v18 & 0x3FFFFFFFFFFFFFFCLL);
      v7 = &v6[-v19];
      v16 = (_QWORD *)((char *)v16 - v19);
      v20 = &v15[8 * v11 - 16];
      v21 = (__int128 *)(v6 - 16);
      v22 = v18 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v23 = *v21;
        *(v20 - 1) = *(v21 - 1);
        *v20 = v23;
        v20 -= 2;
        v21 -= 2;
        v22 -= 4;
      }
      while (v22);
      if (v18 != (v18 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_28:
        do
        {
          v24 = *((_QWORD *)v7 - 1);
          v7 -= 8;
          *--v16 = v24;
        }
        while (v7 != v9);
      }
      v7 = (char *)*v4;
    }
    *v4 = v16;
    v4[1] = v8;
    v4[2] = &v15[8 * v14];
    if (v7)
      operator delete(v7);
  }
  else
  {
    *(_QWORD *)v6 = *a2;
    v8 = v6 + 8;
  }
  v4[1] = v8;
  return a1;
}

xpc_object_t sub_240BD0798(uint64_t a1, uint64_t a2)
{
  xpc_object_t empty;
  xpc_object_t v5;
  const void *v6;
  int64_t v7;
  char *v8;
  char *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  void *v13[2];
  char v14;
  char key[8];
  char v16;
  void *__p;
  void *v18;
  char *v19;
  xpc_object_t v20;
  xpc_object_t v21;

  empty = xpc_dictionary_create_empty();
  v21 = empty;
  v5 = xpc_array_create_empty();
  v20 = v5;
  v18 = 0;
  v19 = 0;
  __p = 0;
  v6 = *(const void **)a2;
  v7 = *(_QWORD *)(a2 + 8) - *(_QWORD *)a2;
  if (v7)
  {
    if (v7 < 0)
      sub_240BC9E84();
    v8 = (char *)operator new(v7);
    v9 = &v8[8 * (v7 >> 3)];
    __p = v8;
    v19 = v9;
    memcpy(v8, v6, v7);
    v18 = v9;
  }
  v10 = sub_240BD0A0C((const char ***)&__p);
  *(_QWORD *)key = v10;
  xpc_array_append_value(v5, v10);
  if (v10)
    xpc_release(v10);
  if (__p)
  {
    v18 = __p;
    operator delete(__p);
  }
  v16 = 2;
  strcpy(key, "fc");
  v11 = xpc_uint64_create(a1);
  v13[0] = v11;
  xpc_dictionary_set_value(empty, key, v11);
  if (v11)
    xpc_release(v11);
  v14 = 4;
  strcpy((char *)v13, "args");
  xpc_dictionary_set_value(empty, (const char *)v13, v5);
  if (v14 < 0)
  {
    operator delete(v13[0]);
    if ((v16 & 0x80000000) == 0)
    {
LABEL_12:
      v21 = 0;
      if (!v5)
        return empty;
      goto LABEL_16;
    }
  }
  else if ((v16 & 0x80000000) == 0)
  {
    goto LABEL_12;
  }
  operator delete(*(void **)key);
  v21 = 0;
  if (v5)
LABEL_16:
    xpc_release(v5);
  return empty;
}

void sub_240BD0928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;

  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  sub_240BD09DC((void **)(v23 - 64));
  sub_240BD09AC((void **)(v23 - 56));
  _Unwind_Resume(a1);
}

void **sub_240BD09AC(void **a1)
{
  void *v2;

  v2 = *a1;
  if (v2)
    xpc_release(v2);
  return a1;
}

void **sub_240BD09DC(void **a1)
{
  void *v2;

  v2 = *a1;
  if (v2)
    xpc_release(v2);
  return a1;
}

xpc_object_t sub_240BD0A0C(const char ***a1)
{
  xpc_object_t empty;
  const char **v3;
  const char **v4;
  xpc_object_t v5;

  empty = xpc_array_create_empty();
  v3 = *a1;
  v4 = a1[1];
  while (v3 != v4)
  {
    v5 = xpc_string_create(*v3);
    xpc_array_append_value(empty, v5);
    if (v5)
      xpc_release(v5);
    ++v3;
  }
  return empty;
}

void sub_240BD0A7C(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    xpc_release(v1);
  _Unwind_Resume(exception_object);
}

void sub_240BD0AA0(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
}

char *sub_240BD0AB4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  unint64_t v6;
  void **v7;
  int v8;
  int v9;
  BOOL v10;
  char *v11;
  void **v12;
  unint64_t v14;
  unsigned __int8 v15;
  void **v16;
  char v17;
  int v18;
  std::__fs::filesystem::path *v19;
  std::string::size_type size;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  std::string::size_type *v24;
  std::string::size_type v25;
  std::string::size_type v26;
  std::ios_base *v27;
  uint64_t v28;
  std::string::size_type v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  std::string *v34;
  std::string *v35;
  uint64_t v36;
  uint64_t v37;
  std::string::size_type *v38;
  std::string::size_type v39;
  std::string::size_type v40;
  std::ios_base *v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  std::string *v45;
  std::string::size_type v46;
  _QWORD *v47;
  std::string::size_type v48;
  _BYTE *v49;
  std::string::size_type v50;
  std::__fs::filesystem::path *p_dst;
  unint64_t v52;
  const void **v53;
  std::ios_base *v54;
  uint64_t v55;
  std::ios_base *v56;
  std::ios_base::iostate v57;
  unint64_t v58;
  const void **v59;
  const void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  _QWORD *v68;
  std::__fs::filesystem::path::__string_view v69;
  void *v70;
  std::basic_string_view<_CharT, _Traits>::size_type v71;
  std::basic_string_view<_CharT, _Traits>::size_type v72;
  std::string::size_type v73;
  std::__fs::filesystem::path *v74;
  std::__fs::filesystem::path v75;
  std::error_code __ec;
  std::__fs::filesystem::path __dst;
  void *v78[2];
  uint64_t v79;
  std::__fs::filesystem::path v80;
  std::__fs::filesystem::path __to;
  std::__fs::filesystem::path v82;
  void *v83[2];
  char v84;
  void *v85[2];
  unsigned __int8 v86;
  void *v87[2];
  unsigned __int8 v88;
  _QWORD *v89;
  _QWORD v90[2];
  std::string v91;
  std::__fs::filesystem::path __from;
  _BYTE v93[16];
  unint64_t v94;
  uint64_t v95;
  unint64_t v96;
  __int128 v97;
  __int128 v98;
  int v99;
  uint64_t v100[40];
  std::ios_base v101;
  uint64_t v102;
  int v103;
  std::string __p[25];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v90[0] = BNNSGraphCompileOptionsMakeDefault();
  v90[1] = v2;
  v89 = v90;
  *((_BYTE *)&__p[0].__r_.__value_.__s + 23) = 9;
  strcpy((char *)__p, "n-threads");
  v3 = sub_240BD7D80((uint64_t)a1, (uint64_t)__p);
  v4 = v3;
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p[0].__r_.__value_.__l.__data_);
    if (!v4)
      goto LABEL_6;
  }
  else if (!v3)
  {
    goto LABEL_6;
  }
  if (v4 != 1)
  {
    v11 = strdup("When using --bnns-graph, --n-threads must be either 0 (automatic) or 1");
    goto LABEL_33;
  }
LABEL_6:
  BNNSGraphCompileOptionsSetTargetSingleThread();
  __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&__p[0].__r_.__value_.__r.__words[1] = xmmword_240BDBB30;
  strcpy(__p[0].__r_.__value_.__l.__data_, "bnns-graph-generate-debug-info");
  sub_240BD7CD8((uint64_t)a1, (uint64_t)__p);
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p[0].__r_.__value_.__l.__data_);
  BNNSGraphCompileOptionsSetGenerateDebugInfo();
  __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x19uLL);
  *(_OWORD *)&__p[0].__r_.__value_.__r.__words[1] = xmmword_240BDBB40;
  strcpy(__p[0].__r_.__value_.__l.__data_, "bnns-graph-validate-mil");
  sub_240BD7CD8((uint64_t)a1, (uint64_t)__p);
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p[0].__r_.__value_.__l.__data_);
  BNNSGraphCompileOptionsSetValidateMILFile();
  *((_BYTE *)&__p[0].__r_.__value_.__s + 23) = 19;
  strcpy((char *)__p, "bnns-graph-opt-pref");
  sub_240BD7DD4((uint64_t)a1, (uint64_t)__p, (uint64_t)v87);
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p[0].__r_.__value_.__l.__data_);
  v5 = v88;
  if ((v88 & 0x80u) == 0)
    v6 = v88;
  else
    v6 = (unint64_t)v87[1];
  switch(v6)
  {
    case 0uLL:
LABEL_35:
      strcpy((char *)__p, "bnns-graph-downconvert");
      *((_BYTE *)&__p[0].__r_.__value_.__s + 23) = 22;
      sub_240BD7DD4((uint64_t)a1, (uint64_t)__p, (uint64_t)v85);
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p[0].__r_.__value_.__l.__data_);
      v14 = v86;
      v15 = v86;
      if ((v86 & 0x80u) != 0)
        v14 = (unint64_t)v85[1];
      if (v14)
      {
        if (v14 != 4)
          goto LABEL_44;
        v16 = (void **)v85[0];
        if ((v86 & 0x80u) == 0)
          v16 = v85;
        if (*(_DWORD *)v16 != 1701736302)
        {
LABEL_44:
          v11 = strdup("--bnns-graph-downconvert values other than 'none' are currently unsupported");
          if ((v15 & 0x80) == 0)
            goto LABEL_46;
          goto LABEL_45;
        }
      }
      BNNSGraphCompileOptionsSetDownconvertMode();
      __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
      *(_OWORD *)&__p[0].__r_.__value_.__r.__words[1] = xmmword_240BDBB50;
      strcpy(__p[0].__r_.__value_.__l.__data_, "bnns-graph-inject-custom-data");
      sub_240BD7DD4((uint64_t)a1, (uint64_t)__p, (uint64_t)v83);
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p[0].__r_.__value_.__l.__data_);
        v17 = v84;
        if ((v84 & 0x80000000) == 0)
        {
LABEL_50:
          if (!v17)
            goto LABEL_55;
LABEL_54:
          BNNSGraphCompileOptionsSetUserData();
LABEL_55:
          *((_BYTE *)&__from.__pn_.__r_.__value_.__s + 23) = 6;
          strcpy((char *)&__from, "output");
          sub_240BD7DD4((uint64_t)a1, (uint64_t)&__from, (uint64_t)__p);
          v82 = (std::__fs::filesystem::path)__p[0];
          memset(__p, 0, 24);
          if (SHIBYTE(__from.__pn_.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__from.__pn_.__r_.__value_.__l.__data_);
          *((_BYTE *)&__from.__pn_.__r_.__value_.__s + 23) = 18;
          strcpy((char *)&__from, "bnns-graph-bnns-ir");
          sub_240BD7DD4((uint64_t)a1, (uint64_t)&__from, (uint64_t)__p);
          __to = (std::__fs::filesystem::path)__p[0];
          memset(__p, 0, 24);
          if (SHIBYTE(__from.__pn_.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(__from.__pn_.__r_.__value_.__l.__data_);
            v18 = SHIBYTE(__to.__pn_.__r_.__value_.__r.__words[2]);
            if ((SHIBYTE(__to.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              goto LABEL_59;
          }
          else
          {
            v18 = SHIBYTE(__to.__pn_.__r_.__value_.__r.__words[2]);
            if ((SHIBYTE(__to.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_59:
              if (v18)
              {
LABEL_75:
                v80 = __to;
                goto LABEL_77;
              }
              if (SHIBYTE(v82.__pn_.__r_.__value_.__r.__words[2]) < 0)
                sub_240BD1ED4(&__to, v82.__pn_.__r_.__value_.__l.__data_, v82.__pn_.__r_.__value_.__l.__size_);
              else
                __to = v82;
              goto LABEL_72;
            }
          }
          if (__to.__pn_.__r_.__value_.__l.__size_)
            goto LABEL_76;
          if ((v82.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v19 = &v82;
          else
            v19 = (std::__fs::filesystem::path *)v82.__pn_.__r_.__value_.__r.__words[0];
          if ((v82.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            size = HIBYTE(v82.__pn_.__r_.__value_.__r.__words[2]);
          else
            size = v82.__pn_.__r_.__value_.__l.__size_;
          sub_240BD1F98((void **)&__to.__pn_.__r_.__value_.__l.__data_, v19, size);
LABEL_72:
          memset(__p, 0, 24);
          sub_240BD22E8(__p, (std::string *)"bnnsir", (std::string *)"");
          std::__fs::filesystem::path::replace_extension(&__to, (const std::__fs::filesystem::path *)__p);
          if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p[0].__r_.__value_.__l.__data_);
          if ((SHIBYTE(__to.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_75;
LABEL_76:
          sub_240BCD950(&v80, __to.__pn_.__r_.__value_.__l.__data_, __to.__pn_.__r_.__value_.__l.__size_);
LABEL_77:
          memset(__p, 0, 24);
          sub_240BD22E8(__p, (std::string *)".XXXXXXXX.bnnsir", (std::string *)"");
          std::__fs::filesystem::path::replace_extension(&v80, (const std::__fs::filesystem::path *)__p);
          if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(__p[0].__r_.__value_.__l.__data_);
            if ((SHIBYTE(v80.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              goto LABEL_79;
          }
          else if ((SHIBYTE(v80.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
LABEL_79:
            __from = v80;
            goto LABEL_82;
          }
          sub_240BCD950(&__from, v80.__pn_.__r_.__value_.__l.__data_, v80.__pn_.__r_.__value_.__l.__size_);
LABEL_82:
          sub_240BD305C((uint64_t)__p, (uint64_t)&__from, 0);
          if (SHIBYTE(__from.__pn_.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__from.__pn_.__r_.__value_.__l.__data_);
          if (!std::filebuf::close())
            std::ios_base::clear((std::ios_base *)((char *)__p + *(_QWORD *)(__p[0].__r_.__value_.__r.__words[0] - 24)), *(_DWORD *)((char *)&__p[1].__r_.__value_.__r.__words[1]+ *(_QWORD *)(__p[0].__r_.__value_.__r.__words[0] - 24)) | 4);
          sub_240BD34B8((char *)__p, (uint64_t)&__from);
          BNNSGraphCompileOptionsSetOutputPath();
          if (SHIBYTE(__from.__pn_.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__from.__pn_.__r_.__value_.__l.__data_);
          sub_240BD8D50(a1, (uint64_t)&__from);
          if (*(char *)(__from.__pn_.__r_.__value_.__r.__words[0] + 55) < 0)
          {
            sub_240BCD950(v78, *(void **)(__from.__pn_.__r_.__value_.__r.__words[0] + 32), *(_QWORD *)(__from.__pn_.__r_.__value_.__r.__words[0] + 40));
          }
          else
          {
            *(_OWORD *)v78 = *(_OWORD *)(__from.__pn_.__r_.__value_.__r.__words[0] + 32);
            v79 = *(_QWORD *)(__from.__pn_.__r_.__value_.__r.__words[0] + 48);
          }
          sub_240BCD774((uint64_t)&__from, (char *)__from.__pn_.__r_.__value_.__l.__size_);
          sub_240BD8D50(a1, (uint64_t)&__from);
          v21 = __from.__pn_.__r_.__value_.__r.__words[2];
          sub_240BCD774((uint64_t)&__from, (char *)__from.__pn_.__r_.__value_.__l.__size_);
          if (v21 >= 2)
          {
            v22 = MEMORY[0x24BEDB870];
            v23 = MEMORY[0x24BEDB870] + 64;
            v24 = (std::string::size_type *)MEMORY[0x24BEDB800];
            v25 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
            v26 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
            v100[0] = MEMORY[0x24BEDB870] + 64;
            __from.__pn_.__r_.__value_.__r.__words[0] = v25;
            *(std::string::size_type *)((char *)__from.__pn_.__r_.__value_.__r.__words + *(_QWORD *)(v25 - 24)) = v26;
            v27 = (std::ios_base *)((char *)&__from + *(_QWORD *)(__from.__pn_.__r_.__value_.__r.__words[0] - 24));
            std::ios_base::init(v27, &__from.__pn_.__r_.__value_.__r.__words[1]);
            v27[1].__vftable = 0;
            v27[1].__fmtflags_ = -1;
            __from.__pn_.__r_.__value_.__r.__words[0] = v22 + 24;
            v100[0] = v23;
            std::streambuf::basic_streambuf();
            v28 = MEMORY[0x24BEDB848];
            __from.__pn_.__r_.__value_.__l.__size_ = MEMORY[0x24BEDB848] + 16;
            v97 = 0u;
            v98 = 0u;
            v99 = 16;
            sub_240BD2664(&__from, (uint64_t)"Unknown extra options given: ", 29);
            sub_240BD8D50(a1, (uint64_t)&v91);
            v29 = v91.__r_.__value_.__r.__words[0];
            if ((std::string::size_type *)v91.__r_.__value_.__l.__data_ != &v91.__r_.__value_.__r.__words[1])
            {
              do
              {
                v30 = *(char *)(v29 + 55);
                if (v30 >= 0)
                  v31 = v29 + 32;
                else
                  v31 = *(_QWORD *)(v29 + 32);
                if (v30 >= 0)
                  v32 = *(unsigned __int8 *)(v29 + 55);
                else
                  v32 = *(_QWORD *)(v29 + 40);
                v33 = sub_240BD2664(&__from, v31, v32);
                sub_240BD2664(v33, (uint64_t)" ", 1);
                v34 = *(std::string **)(v29 + 8);
                if (v34)
                {
                  do
                  {
                    v35 = v34;
                    v34 = (std::string *)v34->__r_.__value_.__r.__words[0];
                  }
                  while (v34);
                }
                else
                {
                  do
                  {
                    v35 = *(std::string **)(v29 + 16);
                    v10 = v35->__r_.__value_.__r.__words[0] == v29;
                    v29 = (std::string::size_type)v35;
                  }
                  while (!v10);
                }
                v29 = (std::string::size_type)v35;
              }
              while (v35 != (std::string *)&v91.__r_.__value_.__r.__words[1]);
            }
            if ((v99 & 0x10) != 0)
            {
              v52 = *((_QWORD *)&v98 + 1);
              if (*((_QWORD *)&v98 + 1) < v96)
              {
                *((_QWORD *)&v98 + 1) = v96;
                v52 = v96;
              }
              v53 = (const void **)&v95;
            }
            else
            {
              if ((v99 & 8) == 0)
              {
                v50 = 0;
                *((_BYTE *)&__dst.__pn_.__r_.__value_.__s + 23) = 0;
                p_dst = &__dst;
                goto LABEL_141;
              }
              v53 = (const void **)v93;
              v52 = v94;
            }
            v60 = *v53;
            v50 = v52 - (_QWORD)*v53;
            if (v50 > 0x7FFFFFFFFFFFFFF7)
              sub_240BC9D74();
            if (v50 >= 0x17)
            {
              v61 = (v50 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v50 | 7) != 0x17)
                v61 = v50 | 7;
              v62 = v61 + 1;
              p_dst = (std::__fs::filesystem::path *)operator new(v61 + 1);
              __dst.__pn_.__r_.__value_.__l.__size_ = v50;
              __dst.__pn_.__r_.__value_.__r.__words[2] = v62 | 0x8000000000000000;
              __dst.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
            }
            else
            {
              *((_BYTE *)&__dst.__pn_.__r_.__value_.__s + 23) = v52 - *(_BYTE *)v53;
              p_dst = &__dst;
              if (!v50)
              {
LABEL_141:
                p_dst->__pn_.__r_.__value_.__s.__data_[v50] = 0;
                if (SHIBYTE(__dst.__pn_.__r_.__value_.__r.__words[2]) < 0)
                {
                  v63 = (void *)__dst.__pn_.__r_.__value_.__r.__words[0];
                  v11 = strdup(__dst.__pn_.__r_.__value_.__l.__data_);
                  operator delete(v63);
                }
                else
                {
                  v11 = strdup((const char *)&__dst);
                }
                sub_240BCD774((uint64_t)&v91, (char *)v91.__r_.__value_.__l.__size_);
                __from.__pn_.__r_.__value_.__r.__words[0] = *v24;
                *(std::string::size_type *)((char *)__from.__pn_.__r_.__value_.__r.__words
                                          + *(_QWORD *)(__from.__pn_.__r_.__value_.__r.__words[0] - 24)) = v24[3];
                __from.__pn_.__r_.__value_.__l.__size_ = v28 + 16;
                if (SBYTE7(v98) < 0)
                  operator delete((void *)v97);
LABEL_161:
                std::streambuf::~streambuf();
                std::ostream::~ostream();
                MEMORY[0x24268B35C](v100);
                goto LABEL_162;
              }
            }
            memmove(p_dst, v60, v50);
            goto LABEL_141;
          }
          BNNSGraphCompileFromFile_v2();
          __ec.__val_ = 0;
          __ec.__cat_ = std::system_category();
          sub_240BD34B8((char *)__p, (uint64_t)&__from);
          std::__fs::filesystem::__rename(&__from, &__to, &__ec);
          if (SHIBYTE(__from.__pn_.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__from.__pn_.__r_.__value_.__l.__data_);
          if (__ec.__val_)
          {
            v36 = MEMORY[0x24BEDB870];
            v37 = MEMORY[0x24BEDB870] + 64;
            v38 = (std::string::size_type *)MEMORY[0x24BEDB800];
            v39 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
            v40 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
            v100[0] = MEMORY[0x24BEDB870] + 64;
            __from.__pn_.__r_.__value_.__r.__words[0] = v39;
            *(std::string::size_type *)((char *)__from.__pn_.__r_.__value_.__r.__words + *(_QWORD *)(v39 - 24)) = v40;
            v41 = (std::ios_base *)((char *)&__from + *(_QWORD *)(__from.__pn_.__r_.__value_.__r.__words[0] - 24));
            std::ios_base::init(v41, &__from.__pn_.__r_.__value_.__r.__words[1]);
            v41[1].__vftable = 0;
            v41[1].__fmtflags_ = -1;
            __from.__pn_.__r_.__value_.__r.__words[0] = v36 + 24;
            v100[0] = v37;
            std::streambuf::basic_streambuf();
            v42 = MEMORY[0x24BEDB848];
            __from.__pn_.__r_.__value_.__l.__size_ = MEMORY[0x24BEDB848] + 16;
            v97 = 0u;
            v98 = 0u;
            v99 = 16;
            sub_240BD2664(&__from, (uint64_t)"Failure moving BNNS IR to output path (error ", 45);
            v43 = (_QWORD *)std::ostream::operator<<();
            v44 = sub_240BD2664(v43, (uint64_t)": ", 2);
            std::error_code::message(&v91, &__ec);
            if ((v91.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v45 = &v91;
            else
              v45 = (std::string *)v91.__r_.__value_.__r.__words[0];
            if ((v91.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v46 = HIBYTE(v91.__r_.__value_.__r.__words[2]);
            else
              v46 = v91.__r_.__value_.__l.__size_;
            v47 = sub_240BD2664(v44, (uint64_t)v45, v46);
            sub_240BD2664(v47, (uint64_t)")", 1);
            if (SHIBYTE(v91.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v91.__r_.__value_.__l.__data_);
            if ((v99 & 0x10) != 0)
            {
              v58 = *((_QWORD *)&v98 + 1);
              if (*((_QWORD *)&v98 + 1) < v96)
              {
                *((_QWORD *)&v98 + 1) = v96;
                v58 = v96;
              }
              v59 = (const void **)&v95;
            }
            else
            {
              if ((v99 & 8) == 0)
              {
                v48 = 0;
                *((_BYTE *)&v91.__r_.__value_.__s + 23) = 0;
                v49 = &v91;
                goto LABEL_156;
              }
              v59 = (const void **)v93;
              v58 = v94;
            }
            v64 = *v59;
            v48 = v58 - (_QWORD)*v59;
            if (v48 > 0x7FFFFFFFFFFFFFF7)
              sub_240BC9D74();
            if (v48 >= 0x17)
            {
              v65 = (v48 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v48 | 7) != 0x17)
                v65 = v48 | 7;
              v66 = v65 + 1;
              v49 = operator new(v65 + 1);
              v91.__r_.__value_.__l.__size_ = v48;
              v91.__r_.__value_.__r.__words[2] = v66 | 0x8000000000000000;
              v91.__r_.__value_.__r.__words[0] = (std::string::size_type)v49;
            }
            else
            {
              *((_BYTE *)&v91.__r_.__value_.__s + 23) = v58 - *(_BYTE *)v59;
              v49 = &v91;
              if (!v48)
              {
LABEL_156:
                v49[v48] = 0;
                if (SHIBYTE(v91.__r_.__value_.__r.__words[2]) < 0)
                {
                  v67 = (void *)v91.__r_.__value_.__r.__words[0];
                  v11 = strdup(v91.__r_.__value_.__l.__data_);
                  operator delete(v67);
                }
                else
                {
                  v11 = strdup((const char *)&v91);
                }
                __from.__pn_.__r_.__value_.__r.__words[0] = *v38;
                *(std::string::size_type *)((char *)__from.__pn_.__r_.__value_.__r.__words
                                          + *(_QWORD *)(__from.__pn_.__r_.__value_.__r.__words[0] - 24)) = v38[3];
                __from.__pn_.__r_.__value_.__l.__size_ = v42 + 16;
                if (SBYTE7(v98) < 0)
                  operator delete((void *)v97);
                goto LABEL_161;
              }
            }
            memmove(v49, v64, v48);
            goto LABEL_156;
          }
          __from.__pn_.__r_.__value_.__l.__size_ = 0;
          __from.__pn_.__r_.__value_.__r.__words[2] = (std::string::size_type)&unk_25110D8F8;
          v101.__vftable = (std::ios_base_vtbl *)&unk_25110DA38;
          __from.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_25110DA10;
          std::ios_base::init(&v101, v93);
          v103 = -1;
          v102 = 0;
          v101.__vftable = (std::ios_base_vtbl *)&unk_25110D920;
          __from.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_25110D8D0;
          __from.__pn_.__r_.__value_.__r.__words[2] = (std::string::size_type)&unk_25110D8F8;
          MEMORY[0x24268B20C](v93);
          v54 = (std::ios_base *)((char *)&__from + *(_QWORD *)(__from.__pn_.__r_.__value_.__r.__words[0] - 24));
          v54->__exceptions_ = 4;
          std::ios_base::clear(v54, v54->__rdstate_);
          v55 = std::filebuf::open();
          v56 = (std::ios_base *)((char *)&__from + *(_QWORD *)(__from.__pn_.__r_.__value_.__r.__words[0] - 24));
          if (v55)
            v57 = 0;
          else
            v57 = v56->__rdstate_ | 4;
          std::ios_base::clear(v56, v57);
          v68 = sub_240BD2664(&__from.__pn_.__r_.__value_.__r.__words[2], (uint64_t)".bnns ", 6);
          v69 = std::__fs::filesystem::path::__parent_path(&v82);
          if (v69.__size_ > 0x7FFFFFFFFFFFFFF7)
            sub_240BC9D74();
          if (v69.__size_ >= 0x17)
          {
            v71 = (v69.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v69.__size_ | 7) != 0x17)
              v71 = v69.__size_ | 7;
            v72 = v71 + 1;
            v70 = operator new(v71 + 1);
            v91.__r_.__value_.__l.__size_ = v69.__size_;
            v91.__r_.__value_.__r.__words[2] = v72 | 0x8000000000000000;
            v91.__r_.__value_.__r.__words[0] = (std::string::size_type)v70;
          }
          else
          {
            *((_BYTE *)&v91.__r_.__value_.__s + 23) = v69.__size_;
            v70 = &v91;
            if (!v69.__size_)
              goto LABEL_183;
          }
          memmove(v70, v69.__data_, v69.__size_);
LABEL_183:
          *((_BYTE *)v70 + v69.__size_) = 0;
          v75.__pn_ = v91;
          sub_240BD1D70(&__to, &v75, &__dst);
          v73 = HIBYTE(__dst.__pn_.__r_.__value_.__r.__words[2]);
          if ((__dst.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v74 = &__dst;
          else
            v74 = (std::__fs::filesystem::path *)__dst.__pn_.__r_.__value_.__r.__words[0];
          if ((__dst.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v73 = __dst.__pn_.__r_.__value_.__l.__size_;
          sub_240BD296C(v68, v74, (_BYTE *)v74 + v73, 0x22u, 0x5Cu);
          if (SHIBYTE(__dst.__pn_.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__dst.__pn_.__r_.__value_.__l.__data_);
          if (SHIBYTE(v75.__pn_.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v75.__pn_.__r_.__value_.__l.__data_);
          if (!std::filebuf::close())
            std::ios_base::clear((std::ios_base *)((char *)&__from + *(_QWORD *)(__from.__pn_.__r_.__value_.__r.__words[0] - 24)), *(_DWORD *)&v93[*(_QWORD *)(__from.__pn_.__r_.__value_.__r.__words[0] - 24) + 8] | 4);
          v101.__vftable = (std::ios_base_vtbl *)&unk_25110D920;
          __from.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_25110D8D0;
          __from.__pn_.__r_.__value_.__r.__words[2] = (std::string::size_type)&unk_25110D8F8;
          MEMORY[0x24268B218](v93);
          std::iostream::~basic_iostream();
          MEMORY[0x24268B35C](&v101);
          v11 = strdup("");
LABEL_162:
          if (SHIBYTE(v79) < 0)
            operator delete(v78[0]);
          sub_240BD33C4((uint64_t)__p);
          if (SHIBYTE(v80.__pn_.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(v80.__pn_.__r_.__value_.__l.__data_);
            if ((SHIBYTE(__to.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_166:
              if ((SHIBYTE(v82.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                goto LABEL_167;
              goto LABEL_172;
            }
          }
          else if ((SHIBYTE(__to.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
            goto LABEL_166;
          }
          operator delete(__to.__pn_.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v82.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
LABEL_167:
            if ((v84 & 0x80000000) == 0)
              goto LABEL_168;
LABEL_173:
            operator delete(v83[0]);
LABEL_168:
            if ((v86 & 0x80) == 0)
            {
LABEL_46:
              if ((v88 & 0x80) == 0)
                goto LABEL_33;
              goto LABEL_32;
            }
LABEL_45:
            operator delete(v85[0]);
            goto LABEL_46;
          }
LABEL_172:
          operator delete(v82.__pn_.__r_.__value_.__l.__data_);
          if ((v84 & 0x80000000) == 0)
            goto LABEL_168;
          goto LABEL_173;
        }
      }
      else
      {
        v17 = v84;
        if ((v84 & 0x80000000) == 0)
          goto LABEL_50;
      }
      if (!v83[1])
        goto LABEL_55;
      goto LABEL_54;
    case 4uLL:
      if ((v88 & 0x80u) == 0)
        v12 = v87;
      else
        v12 = (void **)v87[0];
      if (memcmp(v12, "perf", 4uLL))
        break;
      goto LABEL_34;
    case 7uLL:
      v7 = (void **)v87[0];
      if ((v88 & 0x80u) == 0)
        v7 = v87;
      v8 = *(_DWORD *)v7;
      v9 = *(_DWORD *)((char *)v7 + 3);
      v10 = v8 == 1932358249 && v9 == 1702521203;
      if (v10)
      {
LABEL_34:
        BNNSGraphCompileOptionsSetOptimizationPreference();
        goto LABEL_35;
      }
      break;
  }
  v11 = strdup("--bnns-graph-opt-pref must be either 'ir-size' or 'perf' if specified");
  if ((v5 & 0x80) != 0)
LABEL_32:
    operator delete(v87[0]);
LABEL_33:
  BNNSGraphCompileOptionsDestroy();
  return v11;
}

void sub_240BD19C0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49,void *a50,uint64_t a51,int a52,__int16 a53,char a54,char a55,void *a56,uint64_t a57,int a58,__int16 a59,char a60,char a61,void *a62,uint64_t a63)
{
  char a67;
  char a68;
  void *a71;
  void *v73;
  const char *v74;

  if (a22 < 0)
    operator delete(__p);
  if (a14 < 0)
    operator delete(a9);
  sub_240BD1E3C(&a71);
  if (a2 == 2)
  {
    v73 = __cxa_begin_catch(a1);
    v74 = (const char *)(*(uint64_t (**)(void *))(*(_QWORD *)v73 + 16))(v73);
    strdup(v74);
    __cxa_end_catch();
    JUMPOUT(0x240BD1790);
  }
  if (a28 < 0)
    operator delete(a23);
  sub_240BD33C4((uint64_t)&STACK[0x380]);
  if (a35 < 0)
    operator delete(a30);
  if (a42 < 0)
    operator delete(a37);
  if (a49 < 0)
    operator delete(a44);
  if (a55 < 0)
    operator delete(a50);
  if (a61 < 0)
    operator delete(a56);
  if (a67 < 0)
    operator delete(a62);
  sub_240BD1EA4((uint64_t)&a68);
  _Unwind_Resume(a1);
}

uint64_t sub_240BD1CEC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x24268B35C](a1 + 112);
  return a1;
}

void sub_240BD1D70(const std::__fs::filesystem::path *a1@<X0>, const std::__fs::filesystem::path *a2@<X1>, std::__fs::filesystem::path *a3@<X8>)
{
  std::__fs::filesystem::path __p;
  std::__fs::filesystem::path v6;

  std::__fs::filesystem::__weakly_canonical(&v6, a1, 0);
  std::__fs::filesystem::__weakly_canonical(&__p, a2, 0);
  std::__fs::filesystem::path::lexically_relative(a3, &v6, &__p);
  if ((SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v6.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return;
LABEL_5:
    operator delete(v6.__pn_.__r_.__value_.__l.__data_);
    return;
  }
  operator delete(__p.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(v6.__pn_.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_5;
}

void sub_240BD1DF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a20 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a20 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a15);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_240BD1E3C(_QWORD *a1)
{
  _QWORD *v2;

  *a1 = &unk_25110D8D0;
  v2 = a1 + 54;
  a1[54] = &unk_25110D920;
  a1[2] = &unk_25110D8F8;
  MEMORY[0x24268B218](a1 + 3);
  std::iostream::~basic_iostream();
  MEMORY[0x24268B35C](v2);
  return a1;
}

uint64_t sub_240BD1EA4(uint64_t a1)
{
  BNNSGraphCompileOptionsDestroy();
  return a1;
}

_QWORD *sub_240BD1ED4(_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len > 0x16)
  {
    if (__len - 0x7FFFFFFFFFFFFFF7 <= 0x800000000000001ELL)
      sub_240BC9D74();
    v7 = 44;
    if (__len > 0x2C)
      v7 = __len;
    v8 = (v7 | 7) + 1;
    v6 = operator new(v8);
    memcpy(v6, __src, __len);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (__len)
    {
      memmove(__dst, __src, __len);
      v6 = __dst;
    }
  }
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

void **sub_240BD1F98(void **a1, void *__src, size_t __len)
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  size_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = (unint64_t)a1[2];
  v7 = v6 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) <= __len)
  {
    v9 = 0x7FFFFFFFFFFFFFF7;
    if (0x7FFFFFFFFFFFFFF7 - v7 < __len - v7 + 1)
      sub_240BC9D74();
    v10 = v7 - 1;
    v11 = a1;
    if ((v6 & 0x8000000000000000) != 0)
      v11 = *a1;
    if (v10 <= 0x3FFFFFFFFFFFFFF2)
    {
      v12 = 2 * v10;
      if (__len > 2 * v10)
        v12 = __len;
      v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v12 | 7) != 0x17)
        v13 = v12 | 7;
      if (v12 >= 0x17)
        v9 = v13 + 1;
      else
        v9 = 23;
    }
    v14 = operator new(v9);
    v8 = v14;
    if (__len)
      memcpy(v14, __src, __len);
    if (v10 != 22)
      operator delete(v11);
    a1[1] = (void *)__len;
    a1[2] = (void *)(v9 | 0x8000000000000000);
    *a1 = v8;
  }
  else
  {
    v8 = *a1;
    a1[1] = (void *)__len;
    if (__len)
      memmove(v8, __src, __len);
  }
  *((_BYTE *)v8 + __len) = 0;
  return a1;
}

void sub_240BD20B8(_QWORD *a1)
{
  a1[52] = &unk_25110D920;
  *a1 = &unk_25110D8F8;
  *(a1 - 2) = &unk_25110D8D0;
  MEMORY[0x24268B218](a1 + 1);
  std::iostream::~basic_iostream();
  JUMPOUT(0x24268B35CLL);
}

void sub_240BD2114(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  *v1 = &unk_25110D8D0;
  v1[54] = &unk_25110D920;
  v1[2] = &unk_25110D8F8;
  MEMORY[0x24268B218](v1 + 3);
  std::iostream::~basic_iostream();
  JUMPOUT(0x24268B35CLL);
}

void sub_240BD217C(_QWORD *a1)
{
  _QWORD *v1;

  *a1 = &unk_25110D8D0;
  v1 = a1 + 54;
  a1[54] = &unk_25110D920;
  a1[2] = &unk_25110D8F8;
  MEMORY[0x24268B218](a1 + 3);
  std::iostream::~basic_iostream();
  MEMORY[0x24268B35C](v1);
  JUMPOUT(0x24268B398);
}

void sub_240BD21F4(_QWORD *a1)
{
  _QWORD *v1;

  v1 = a1 + 52;
  a1[52] = &unk_25110D920;
  *a1 = &unk_25110D8F8;
  *(a1 - 2) = &unk_25110D8D0;
  MEMORY[0x24268B218](a1 + 1);
  std::iostream::~basic_iostream();
  MEMORY[0x24268B35C](v1);
  JUMPOUT(0x24268B398);
}

void sub_240BD2268(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  *v1 = &unk_25110D8D0;
  v1[54] = &unk_25110D920;
  v1[2] = &unk_25110D8F8;
  MEMORY[0x24268B218](v1 + 3);
  std::iostream::~basic_iostream();
  MEMORY[0x24268B35C](v1 + 54);
  JUMPOUT(0x24268B398);
}

std::string *sub_240BD22E8(std::string *this, std::string *__src, std::string *a3)
{
  int v6;
  size_t v7;
  std::string::size_type size;
  unint64_t v9;
  unint64_t v10;
  std::string *v11;
  unint64_t v12;
  void **v13;
  size_t v14;
  std::string *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  std::string::size_type v19;
  std::string *v20;
  std::string::value_type *v21;
  unint64_t v22;
  std::string *v23;
  uint64_t v24;
  uint64_t v25;
  void **p_dst;
  size_t v27;
  std::string::size_type v28;
  std::string::size_type v29;
  std::string *v30;
  std::string::size_type v31;
  _OWORD *v32;
  std::string::size_type *v33;
  unint64_t v34;
  __int128 v35;
  std::string::value_type v36;
  std::string::size_type v37;
  void **__dst;
  size_t v40;
  int64_t v41;

  v6 = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  v7 = (char *)a3 - (char *)__src;
  if (v6 < 0)
  {
    if (a3 == __src)
      return this;
    size = this->__r_.__value_.__l.__size_;
    v12 = this->__r_.__value_.__r.__words[2];
    v9 = (v12 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    v11 = (std::string *)this->__r_.__value_.__r.__words[0];
    v10 = HIBYTE(v12);
    if (this->__r_.__value_.__r.__words[0] > (unint64_t)__src)
      goto LABEL_12;
LABEL_7:
    if ((std::string *)((char *)&v11->__r_.__value_.__l.__data_ + size + 1) <= __src)
      goto LABEL_12;
    if (v7 > 0x7FFFFFFFFFFFFFF7)
      sub_240BC9D74();
    if (v7 > 0x16)
    {
      v24 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v7 | 7) != 0x17)
        v24 = v7 | 7;
      v25 = v24 + 1;
      v13 = (void **)operator new(v24 + 1);
      v40 = v7;
      v41 = v25 | 0x8000000000000000;
      __dst = v13;
      if (a3 == __src)
      {
LABEL_38:
        *(_BYTE *)v13 = 0;
        if (v41 >= 0)
          p_dst = (void **)&__dst;
        else
          p_dst = __dst;
        if (v41 >= 0)
          v27 = HIBYTE(v41);
        else
          v27 = v40;
        if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
        {
          v29 = this->__r_.__value_.__l.__size_;
          v28 = (this->__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
        }
        else
        {
          v28 = 22;
          v29 = HIBYTE(this->__r_.__value_.__r.__words[2]);
        }
        if (v28 - v29 >= v27)
        {
          if (v27)
          {
            v30 = this;
            if ((*((_BYTE *)&this->__r_.__value_.__s + 23) & 0x80) != 0)
              v30 = (std::string *)this->__r_.__value_.__r.__words[0];
            memmove((char *)v30 + v29, p_dst, v27);
            v31 = v29 + v27;
            if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
            {
              this->__r_.__value_.__l.__size_ = v31;
              v30->__r_.__value_.__s.__data_[v31] = 0;
              if ((SHIBYTE(v41) & 0x80000000) == 0)
                return this;
              goto LABEL_55;
            }
            *((_BYTE *)&this->__r_.__value_.__s + 23) = v31 & 0x7F;
            v30->__r_.__value_.__s.__data_[v31] = 0;
          }
        }
        else
        {
          std::string::__grow_by_and_replace(this, v28, v27 - v28 + v29, v29, v29, 0, v27, (const std::string::value_type *)p_dst);
        }
        if ((SHIBYTE(v41) & 0x80000000) == 0)
          return this;
LABEL_55:
        operator delete(__dst);
        return this;
      }
    }
    else
    {
      HIBYTE(v41) = (_BYTE)a3 - (_BYTE)__src;
      v13 = (void **)&__dst;
      if (a3 == __src)
        goto LABEL_38;
    }
    memcpy(v13, __src, v7);
    v13 = (void **)((char *)v13 + v7);
    goto LABEL_38;
  }
  if (a3 == __src)
    return this;
  size = HIBYTE(this->__r_.__value_.__r.__words[2]);
  v9 = 22;
  LOBYTE(v10) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  v11 = this;
  if (this <= __src)
    goto LABEL_7;
LABEL_12:
  if (v9 - size >= v7)
  {
    v20 = this;
    if ((v10 & 0x80) == 0)
      goto LABEL_31;
  }
  else
  {
    v14 = 0x7FFFFFFFFFFFFFF7;
    if (0x7FFFFFFFFFFFFFF7 - v9 < v7 + size - v9)
      sub_240BC9D74();
    v15 = this;
    if (v6 < 0)
      v15 = (std::string *)this->__r_.__value_.__r.__words[0];
    if (v9 <= 0x3FFFFFFFFFFFFFF2)
    {
      v16 = 2 * v9;
      if (v7 + size > 2 * v9)
        v16 = v7 + size;
      v17 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v16 | 7) != 0x17)
        v17 = v16 | 7;
      if (v16 >= 0x17)
        v14 = v17 + 1;
      else
        v14 = 23;
    }
    v18 = operator new(v14);
    v19 = (std::string::size_type)v18;
    if (size)
      memmove(v18, v15, size);
    if (v9 != 22)
      operator delete(v15);
    this->__r_.__value_.__l.__size_ = size;
    this->__r_.__value_.__r.__words[2] = v14 | 0x8000000000000000;
    this->__r_.__value_.__r.__words[0] = v19;
  }
  v20 = (std::string *)this->__r_.__value_.__r.__words[0];
LABEL_31:
  v21 = (char *)v20 + size;
  v22 = (char *)a3 - (char *)__src;
  if (a3 != __src)
  {
    if (v22 >= 0x20)
    {
      if ((unint64_t)((char *)v20 + size - (char *)__src) >= 0x20)
      {
        v23 = (std::string *)((char *)__src + (v22 & 0xFFFFFFFFFFFFFFE0));
        v21 += v22 & 0xFFFFFFFFFFFFFFE0;
        v32 = (_OWORD *)((char *)&v20->__r_.__value_.__r.__words[2] + size);
        v33 = &__src->__r_.__value_.__r.__words[2];
        v34 = v22 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v35 = *(_OWORD *)v33;
          *(v32 - 1) = *((_OWORD *)v33 - 1);
          *v32 = v35;
          v32 += 2;
          v33 += 4;
          v34 -= 32;
        }
        while (v34);
        if (v22 == (v22 & 0xFFFFFFFFFFFFFFE0))
          goto LABEL_62;
      }
      else
      {
        v23 = __src;
      }
    }
    else
    {
      v23 = __src;
    }
    do
    {
      v36 = v23->__r_.__value_.__s.__data_[0];
      v23 = (std::string *)((char *)v23 + 1);
      *v21++ = v36;
    }
    while (v23 != a3);
  }
LABEL_62:
  *v21 = 0;
  v37 = v7 + size;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    this->__r_.__value_.__l.__size_ = v37;
  else
    *((_BYTE *)&this->__r_.__value_.__s + 23) = v37 & 0x7F;
  return this;
}

void sub_240BD2648(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_240BD2664(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x24268B260](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!sub_240BD27C8(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x24268B26C](v13);
  return a1;
}

void sub_240BD276C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x24268B26C](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x240BD274CLL);
}

void sub_240BD27B4(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_240BD27C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  size_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *__b[2];
  int64_t v22;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if ((uint64_t)v12 >= 1)
    {
      if (v12 >= 0x7FFFFFFFFFFFFFF8)
        sub_240BC9D74();
      if (v12 >= 0x17)
      {
        v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17)
          v14 = v12 | 7;
        v15 = v14 + 1;
        v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        v22 = v15 | 0x8000000000000000;
        __b[0] = v13;
      }
      else
      {
        HIBYTE(v22) = v12;
        v13 = __b;
      }
      memset(v13, __c, v12);
      *((_BYTE *)v13 + v12) = 0;
      if (v22 >= 0)
        v16 = __b;
      else
        v16 = (void **)__b[0];
      v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(_QWORD *)v6 + 96))(v6, v16, v12);
      v18 = v17;
      if (SHIBYTE(v22) < 0)
      {
        operator delete(__b[0]);
        if (v18 != v12)
          return 0;
      }
      else if (v17 != v12)
      {
        return 0;
      }
    }
    v19 = a4 - a3;
    if (v19 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v19) == v19)
    {
      *(_QWORD *)(a5 + 24) = 0;
      return v6;
    }
    return 0;
  }
  return v6;
}

void sub_240BD2950(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_240BD296C(_QWORD *a1, _BYTE *a2, _BYTE *a3, unsigned __int8 __c, unsigned __int8 a5)
{
  int v10;
  std::string *v11;
  std::string::size_type size;
  _QWORD *v13;
  std::string v15;

  memset(&v15, 0, sizeof(v15));
  std::string::push_back(&v15, __c);
  for (; a2 != a3; ++a2)
  {
    v10 = *a2;
    if (v10 == a5 || v10 == __c)
    {
      std::string::push_back(&v15, a5);
      LOBYTE(v10) = *a2;
    }
    std::string::push_back(&v15, v10);
  }
  std::string::push_back(&v15, __c);
  if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v11 = &v15;
  else
    v11 = (std::string *)v15.__r_.__value_.__r.__words[0];
  if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v15.__r_.__value_.__r.__words[2]);
  else
    size = v15.__r_.__value_.__l.__size_;
  v13 = sub_240BD2664(a1, (uint64_t)v11, size);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  return v13;
}

void sub_240BD2A50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

__CFDictionary *mlc_services_validate(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t (*v5)(uint64_t, const __CFDictionary *);
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  sub_240BD9C84(a2, a1, (const char **)&v7);
  if ((_QWORD)v7)
    return sub_240BD9DEC((const char *)v7);
  if (BYTE8(v8))
  {
    v6[0] = v7;
    v6[1] = v8;
    return sub_240BD9F14((uint64_t)v6);
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v5 = (uint64_t (*)(uint64_t, const __CFDictionary *))off_25708ADF0;
    v13 = off_25708ADF0;
    if (!off_25708ADF0)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 0x40000000;
      v9[2] = sub_240BD2B80;
      v9[3] = &unk_25110DAA0;
      v9[4] = &v10;
      sub_240BD2B80((uint64_t)v9);
      v5 = (uint64_t (*)(uint64_t, const __CFDictionary *))v11[3];
    }
    _Block_object_dispose(&v10, 8);
    if (!v5)
      sub_240BDA484();
    return (__CFDictionary *)v5(a1, a2);
  }
}

void sub_240BD2B60(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t mlc_services_validation_version()
{
  return 0;
}

void *sub_240BD2B80(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (qword_25708ADF8)
  {
    v2 = (void *)qword_25708ADF8;
  }
  else
  {
    qword_25708ADF8 = _sl_dlopen();
    v2 = (void *)qword_25708ADF8;
    if (!qword_25708ADF8)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "mlc_model_validate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  off_25708ADF0 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

FILE *sub_240BD2C70@<X0>(const char *a1@<X0>, _QWORD *a2@<X8>)
{
  FILE *result;
  FILE *v4;
  size_t v5;
  int v6;
  _QWORD *v7;

  if (a1[23] < 0)
    a1 = *(const char **)a1;
  result = fopen(a1, "r");
  if (result)
  {
    v4 = result;
    fseek(result, 0, 2);
    v5 = MEMORY[0x24268B518](v4);
    fseek(v4, 0, 0);
    v6 = fileno(v4);
    v7 = (_QWORD *)operator new();
    v7[1] = 0;
    v7[2] = v5;
    *v7 = &off_25110DAE8;
    v7[1] = mmap(0, v5, 1, 2, v6, 0);
    *a2 = v7;
    return (FILE *)fclose(v4);
  }
  else
  {
    *a2 = 0;
  }
  return result;
}

void sub_240BD2D60(_Unwind_Exception *a1)
{
  FILE *v1;
  uint64_t v2;

  MEMORY[0x24268B398](v2, 0x1081C40CC6EE3FDLL);
  fclose(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_240BD2D94(uint64_t a1)
{
  *(_QWORD *)a1 = &off_25110DAE8;
  munmap(*(void **)(a1 + 8), *(_QWORD *)(a1 + 16));
  return a1;
}

void sub_240BD2DD0(uint64_t a1)
{
  *(_QWORD *)a1 = &off_25110DAE8;
  munmap(*(void **)(a1 + 8), *(_QWORD *)(a1 + 16));
  JUMPOUT(0x24268B398);
}

void sub_240BD2E1C(const char *a1@<X0>, std::string *a2@<X8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  std::string *v9;
  std::__shared_weak_count *v10;
  int v11;
  unint64_t *p_shared_owners;
  int v13;
  _QWORD *v14;
  _QWORD *v15;
  size_t v16;
  _QWORD *v17;
  std::string *v18;
  int v19;
  unint64_t v20;

  v3 = a1[23];
  v4 = *((_QWORD *)a1 + 1);
  if (v3 >= 0)
  {
    v5 = v3;
  }
  else
  {
    a1 = *(const char **)a1;
    v5 = v4;
  }
  LODWORD(v6) = 1;
  v7 = v5;
  while (v7)
  {
    v8 = a1[--v7];
    if (v8 == 88)
    {
      v6 = -v7;
      break;
    }
  }
  v9 = (std::string *)strdup(a1);
  v10 = (std::__shared_weak_count *)operator new();
  v11 = v5 + v6;
  v10->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v10->__shared_owners_;
  v10->__vftable = (std::__shared_weak_count_vtbl *)&unk_25110DC28;
  v10->__shared_weak_owners_ = 0;
  v10[1].__vftable = (std::__shared_weak_count_vtbl *)v9;
  v10[1].__shared_owners_ = (uint64_t)MEMORY[0x24BDAE450];
  v13 = mkstemps((char *)v9, v11);
  if (v13 == -1)
  {
    __error();
    sub_240BD2664(MEMORY[0x24BEDB310], (uint64_t)"MLC: error ", 11);
    v14 = (_QWORD *)std::ostream::operator<<();
    v15 = sub_240BD2664(v14, (uint64_t)" creating temporary file ", 25);
    v16 = strlen((const char *)v9);
    v17 = sub_240BD2664(v15, (uint64_t)v9, v16);
    sub_240BD2664(v17, (uint64_t)"\n", 1);
  }
  else
  {
    close(v13);
  }
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  v18 = (std::string *)((char *)v9 - 1);
  a2->__r_.__value_.__r.__words[2] = 0;
  do
  {
    v19 = v18->__r_.__value_.__s.__data_[1];
    v18 = (std::string *)((char *)v18 + 1);
  }
  while (v19);
  sub_240BD22E8(a2, v9, v18);
  do
    v20 = __ldaxr(p_shared_owners);
  while (__stlxr(v20 - 1, p_shared_owners));
  if (!v20)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
}

void sub_240BD2FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  if (*(char *)(v9 + 23) < 0)
    operator delete(*(void **)v9);
  sub_240BD368C((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_240BD3018(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *a1 = *a2;
  *(uint64_t *)((char *)a1 + *(_QWORD *)(v2 - 24)) = a2[3];
  MEMORY[0x24268B218](a1 + 1);
  return std::ostream::~ostream();
}

uint64_t sub_240BD305C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  std::string *v8;
  std::__fs::filesystem::path::__string_view v9;
  int64_t v10;
  std::__fs::filesystem::path *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _BYTE *v15;
  std::__fs::filesystem::path v17;

  v6 = a1 + 8;
  *(_QWORD *)a1 = &unk_25110DBE0;
  *(_QWORD *)(a1 + 448) = &unk_25110DC08;
  std::ios_base::init((std::ios_base *)(a1 + 448), (void *)(a1 + 8));
  *(_QWORD *)(a1 + 584) = 0;
  *(_DWORD *)(a1 + 592) = -1;
  *(_QWORD *)a1 = &off_25110DB90;
  *(_QWORD *)(a1 + 448) = off_25110DBB8;
  MEMORY[0x24268B20C](v6);
  *(_QWORD *)a1 = &off_25110DB10;
  *(_QWORD *)(a1 + 448) = &unk_25110DB38;
  sub_240BD2E1C((const char *)a2, (std::string *)(a1 + 416));
  *(_BYTE *)(a1 + 440) = a3;
  memset(&v17, 0, sizeof(v17));
  v7 = *(unsigned __int8 *)(a2 + 23);
  if ((v7 & 0x80u) == 0)
    v8 = (std::string *)a2;
  else
    v8 = *(std::string **)a2;
  if ((v7 & 0x80u) != 0)
    v7 = *(_QWORD *)(a2 + 8);
  sub_240BD22E8(&v17.__pn_, v8, (std::string *)((char *)v8 + v7));
  v9 = std::__fs::filesystem::path::__filename(&v17);
  if (v9.__size_)
  {
    if (SHIBYTE(v17.__pn_.__r_.__value_.__r.__words[2]) < 0)
    {
      v11 = (std::__fs::filesystem::path *)v17.__pn_.__r_.__value_.__r.__words[0];
      v10 = (int64_t)&v9.__data_[-v17.__pn_.__r_.__value_.__r.__words[0]];
      if ((const std::string_view::value_type *)v17.__pn_.__r_.__value_.__l.__size_ >= &v9.__data_[-v17.__pn_.__r_.__value_.__r.__words[0]])
      {
        v17.__pn_.__r_.__value_.__l.__size_ = (std::string::size_type)&v9.__data_[-v17.__pn_.__r_.__value_.__r.__words[0]];
        goto LABEL_12;
      }
    }
    else
    {
      v10 = v9.__data_ - (const std::string_view::value_type *)&v17;
      if ((const std::string_view::value_type *)(v9.__data_ - (const std::string_view::value_type *)&v17) <= (const std::string_view::value_type *)HIBYTE(v17.__pn_.__r_.__value_.__r.__words[2]))
      {
        *((_BYTE *)&v17.__pn_.__r_.__value_.__s + 23) = v10 & 0x7F;
        v11 = &v17;
LABEL_12:
        v11->__pn_.__r_.__value_.__s.__data_[v10] = 0;
        goto LABEL_13;
      }
    }
    sub_240BC9DFC();
  }
LABEL_13:
  std::__fs::filesystem::__create_directories(&v17, 0);
  if (SHIBYTE(v17.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__pn_.__r_.__value_.__l.__data_);
  std::ofstream::open();
  if (!*(_QWORD *)(a1 + 128))
  {
    v12 = sub_240BD2664(MEMORY[0x24BEDB310], (uint64_t)"MLC temp file: could not create ", 32);
    v13 = v12;
    v14 = *(unsigned __int8 *)(a1 + 439);
    if ((v14 & 0x80u) == 0)
      v15 = (_BYTE *)(a1 + 416);
    else
      v15 = *(_BYTE **)(a1 + 416);
    if ((v14 & 0x80u) != 0)
      v14 = *(_QWORD *)(a1 + 424);
    sub_240BD296C(v12, v15, &v15[v14], 0x22u, 0x5Cu);
    sub_240BD2664(v13, (uint64_t)"\n", 1);
  }
  return a1;
}

void sub_240BD3234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;
  uint64_t v16;
  void **v17;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v16 + 439) < 0)
    operator delete(*v17);
  sub_240BD3018((uint64_t *)v16, (uint64_t *)&off_25110DB50);
  MEMORY[0x24268B35C](v15);
  _Unwind_Resume(a1);
}

uint64_t sub_240BD32AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  _BYTE *v10;
  unsigned __int8 v11;

  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + *(_QWORD *)(v4 - 24)) = a2[5];
  if (!*(_BYTE *)(a1 + 440))
  {
    std::__fs::filesystem::__status((const std::__fs::filesystem::path *)(a1 + 416), 0);
    if (v11)
    {
      if (v11 != 255 && !std::__fs::filesystem::__remove((const std::__fs::filesystem::path *)(a1 + 416), 0))
      {
        v7 = sub_240BD2664(MEMORY[0x24BEDB310], (uint64_t)"MLC temp file: error deleting '", 31);
        v8 = v7;
        v9 = *(unsigned __int8 *)(a1 + 439);
        if ((v9 & 0x80u) == 0)
          v10 = (_BYTE *)(a1 + 416);
        else
          v10 = *(_BYTE **)(a1 + 416);
        if ((v9 & 0x80u) != 0)
          v9 = *(_QWORD *)(a1 + 424);
        sub_240BD296C(v7, v10, &v10[v9], 0x22u, 0x5Cu);
        sub_240BD2664(v8, (uint64_t)"'\n", 2);
      }
    }
  }
  if (*(char *)(a1 + 439) < 0)
    operator delete(*(void **)(a1 + 416));
  v5 = a2[1];
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + *(_QWORD *)(v5 - 24)) = a2[4];
  MEMORY[0x24268B218](a1 + 8);
  return std::ostream::~ostream();
}

uint64_t sub_240BD33C4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_240BD32AC(a1, (uint64_t *)off_25110DB48);
  MEMORY[0x24268B35C](v2 + 448);
  return a1;
}

void sub_240BD33F8(_QWORD *a1)
{
  sub_240BD32AC((uint64_t)a1 + *(_QWORD *)(*a1 - 24), (uint64_t *)off_25110DB48);
  JUMPOUT(0x24268B35CLL);
}

void sub_240BD3424(uint64_t a1)
{
  uint64_t v1;

  v1 = sub_240BD32AC(a1, (uint64_t *)off_25110DB48);
  MEMORY[0x24268B35C](v1 + 448);
  JUMPOUT(0x24268B398);
}

void sub_240BD3468(_QWORD *a1)
{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  sub_240BD32AC(v1, (uint64_t *)off_25110DB48);
  MEMORY[0x24268B35C](v1 + 448);
  JUMPOUT(0x24268B398);
}

char *sub_240BD34B8@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  if (result[439] < 0)
    return (char *)sub_240BCD950((_BYTE *)a2, *((void **)result + 52), *((_QWORD *)result + 53));
  *(_OWORD *)a2 = *((_OWORD *)result + 26);
  *(_QWORD *)(a2 + 16) = *((_QWORD *)result + 54);
  return result;
}

_QWORD *sub_240BD34E4(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = MEMORY[0x24BEDB840];
  *a1 = MEMORY[0x24BEDB840] + 24;
  v3 = a1 + 52;
  a1[52] = v2 + 64;
  MEMORY[0x24268B218](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x24268B35C](v3);
  return a1;
}

void sub_240BD3544(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = MEMORY[0x24BEDB840];
  *a1 = MEMORY[0x24BEDB840] + 24;
  v2 = a1 + 52;
  a1[52] = v1 + 64;
  MEMORY[0x24268B218](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x24268B35C](v2);
  JUMPOUT(0x24268B398);
}

void sub_240BD35B4(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  v2 = MEMORY[0x24BEDB840];
  *v1 = MEMORY[0x24BEDB840] + 24;
  v1[52] = v2 + 64;
  MEMORY[0x24268B218](v1 + 1);
  std::ostream::~ostream();
  JUMPOUT(0x24268B35CLL);
}

void sub_240BD3614(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  v2 = MEMORY[0x24BEDB840];
  *v1 = MEMORY[0x24BEDB840] + 24;
  v1[52] = v2 + 64;
  MEMORY[0x24268B218](v1 + 1);
  std::ostream::~ostream();
  MEMORY[0x24268B35C](v1 + 52);
  JUMPOUT(0x24268B398);
}

uint64_t sub_240BD368C(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

void sub_240BD36E8(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24268B398);
}

uint64_t sub_240BD370C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 24));
}

BOOL sub_240BD372C(uint64_t a1, uint64_t a2, const void **a3)
{
  const char *v5;
  void *v6;
  void *v7;
  std::string *p_p;
  std::string *v9;
  std::string *v10;
  std::string *v11;
  std::string *v12;
  std::string *v13;
  const void *v15[3];
  std::string __p;

  if (*(char *)(a2 + 23) >= 0)
    v5 = (const char *)a2;
  else
    v5 = *(const char **)a2;
  v6 = dlopen(v5, 262);
  v7 = *(void **)a1;
  *(_QWORD *)a1 = v6;
  if (v7)
  {
    dlclose(v7);
    v6 = *(void **)a1;
  }
  if (v6)
  {
    HIBYTE(v15[2]) = 6;
    strcpy((char *)v15, "init_2");
    sub_240BD3C10(a3, v15, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    *(_QWORD *)(a1 + 24) = dlsym(*(void **)a1, (const char *)p_p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v15[2]) & 0x80000000) == 0)
        goto LABEL_12;
    }
    else if ((SHIBYTE(v15[2]) & 0x80000000) == 0)
    {
      goto LABEL_12;
    }
    operator delete((void *)v15[0]);
LABEL_12:
    HIBYTE(v15[2]) = 10;
    strcpy((char *)v15, "teardown_2");
    sub_240BD3C10(a3, v15, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v9 = &__p;
    else
      v9 = (std::string *)__p.__r_.__value_.__r.__words[0];
    *(_QWORD *)(a1 + 32) = dlsym(*(void **)a1, (const char *)v9);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v15[2]) & 0x80000000) == 0)
        goto LABEL_17;
    }
    else if ((SHIBYTE(v15[2]) & 0x80000000) == 0)
    {
      goto LABEL_17;
    }
    operator delete((void *)v15[0]);
LABEL_17:
    HIBYTE(v15[2]) = 16;
    strcpy((char *)v15, "get_network_size");
    sub_240BD3C10(a3, v15, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v10 = &__p;
    else
      v10 = (std::string *)__p.__r_.__value_.__r.__words[0];
    *(_QWORD *)(a1 + 16) = dlsym(*(void **)a1, (const char *)v10);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v15[2]) & 0x80000000) == 0)
        goto LABEL_22;
    }
    else if ((SHIBYTE(v15[2]) & 0x80000000) == 0)
    {
      goto LABEL_22;
    }
    operator delete((void *)v15[0]);
LABEL_22:
    HIBYTE(v15[2]) = 10;
    strcpy((char *)v15, "set_tensor");
    sub_240BD3C10(a3, v15, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v11 = &__p;
    else
      v11 = (std::string *)__p.__r_.__value_.__r.__words[0];
    *(_QWORD *)(a1 + 40) = dlsym(*(void **)a1, (const char *)v11);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v15[2]) & 0x80000000) == 0)
        goto LABEL_27;
    }
    else if ((SHIBYTE(v15[2]) & 0x80000000) == 0)
    {
      goto LABEL_27;
    }
    operator delete((void *)v15[0]);
LABEL_27:
    HIBYTE(v15[2]) = 6;
    strcpy((char *)v15, "tensor");
    sub_240BD3C10(a3, v15, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v12 = &__p;
    else
      v12 = (std::string *)__p.__r_.__value_.__r.__words[0];
    *(_QWORD *)(a1 + 48) = dlsym(*(void **)a1, (const char *)v12);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v15[2]) & 0x80000000) == 0)
        goto LABEL_32;
    }
    else if ((SHIBYTE(v15[2]) & 0x80000000) == 0)
    {
      goto LABEL_32;
    }
    operator delete((void *)v15[0]);
LABEL_32:
    HIBYTE(v15[2]) = 12;
    strcpy((char *)v15, "execute_sync");
    sub_240BD3C10(a3, v15, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v13 = &__p;
    else
      v13 = (std::string *)__p.__r_.__value_.__r.__words[0];
    *(_QWORD *)(a1 + 56) = dlsym(*(void **)a1, (const char *)v13);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v15[2]) & 0x80000000) == 0)
        return v6 != 0;
    }
    else if ((SHIBYTE(v15[2]) & 0x80000000) == 0)
    {
      return v6 != 0;
    }
    operator delete((void *)v15[0]);
  }
  return v6 != 0;
}

void sub_240BD3A8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
  {
    operator delete(__p);
    if ((a14 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a9);
  _Unwind_Resume(exception_object);
}

BOOL sub_240BD3B04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a2, a3);
  *(_QWORD *)(a1 + 8) = v4;
  return v4 != 0;
}

void *sub_240BD3B3C(uint64_t a1)
{
  void *result;

  result = *(void **)a1;
  if (!result)
  {
    *(_QWORD *)a1 = 0;
    return result;
  }
  if (!*(_QWORD *)(a1 + 8))
  {
    *(_QWORD *)a1 = 0;
    return (void *)dlclose(result);
  }
  (*(void (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 8));
  result = *(void **)a1;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  if (result)
    return (void *)dlclose(result);
  return result;
}

uint64_t sub_240BD3B98(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)a1;
  if (!v2)
    goto LABEL_4;
  if (*(_QWORD *)(a1 + 8))
  {
    (*(void (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 8));
    v2 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    if (!v2)
    {
LABEL_4:
      *(_QWORD *)a1 = 0;
      return a1;
    }
  }
  else
  {
    *(_QWORD *)a1 = 0;
  }
  dlclose(v2);
  v3 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v3)
    dlclose(v3);
  return a1;
}

void sub_240BD3C10(const void **a1@<X0>, const void **a2@<X1>, std::string *a3@<X8>)
{
  int v5;
  const void *v6;
  size_t v7;
  std::string::size_type v8;
  std::string::size_type size;
  std::string *v10;
  std::string::size_type v11;
  unint64_t v12;
  int v13;
  const void *v14;
  size_t v15;
  std::string::size_type v16;
  int v17;
  uint64_t v18;
  std::string::size_type v19;
  std::string::size_type v20;
  std::string *v21;
  std::string::size_type v22;
  std::string v23;
  std::string v24;
  std::string v25;

  *((_BYTE *)&v23.__r_.__value_.__s + 23) = 14;
  strcpy((char *)&v23, "nano_espresso_");
  v5 = *((char *)a1 + 23);
  if (v5 >= 0)
    v6 = a1;
  else
    v6 = *a1;
  if (v5 >= 0)
    v7 = *((unsigned __int8 *)a1 + 23);
  else
    v7 = (size_t)a1[1];
  if (v7 <= 8)
  {
    if (v7)
    {
      memmove((char *)&v23.__r_.__value_.__r.__words[1] + 6, v6, v7);
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
        v23.__r_.__value_.__l.__size_ = v7 + 14;
      else
        *((_BYTE *)&v23.__r_.__value_.__s + 23) = v7 + 14;
      v23.__r_.__value_.__s.__data_[v7 + 14] = 0;
    }
  }
  else
  {
    std::string::__grow_by_and_replace(&v23, 0x16uLL, v7 - 8, 0xEuLL, 0xEuLL, 0, v7, (const std::string::value_type *)v6);
  }
  v24 = v23;
  memset(&v23, 0, sizeof(v23));
  if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v8 = 22;
  else
    v8 = (v24.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
  if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v24.__r_.__value_.__r.__words[2]);
  else
    size = v24.__r_.__value_.__l.__size_;
  if (v8 == size)
  {
    std::string::__grow_by_and_replace(&v24, v8, 1uLL, v8, v8, 0, 1uLL, "_");
  }
  else
  {
    v10 = &v24;
    if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v10 = (std::string *)v24.__r_.__value_.__r.__words[0];
    v10->__r_.__value_.__s.__data_[size] = 95;
    v11 = size + 1;
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
      v24.__r_.__value_.__l.__size_ = v11;
    else
      *((_BYTE *)&v24.__r_.__value_.__s + 23) = v11 & 0x7F;
    v10->__r_.__value_.__s.__data_[v11] = 0;
  }
  v12 = v24.__r_.__value_.__r.__words[2];
  v25 = v24;
  memset(&v24, 0, sizeof(v24));
  v13 = *((char *)a2 + 23);
  if (v13 >= 0)
    v14 = a2;
  else
    v14 = *a2;
  if (v13 >= 0)
    v15 = *((unsigned __int8 *)a2 + 23);
  else
    v15 = (size_t)a2[1];
  v16 = HIBYTE(v12);
  v17 = SHIBYTE(v12);
  v18 = (v12 & 0x7FFFFFFFFFFFFFFFLL) - 1;
  if (v17 >= 0)
    v19 = 22;
  else
    v19 = v18;
  if (v17 >= 0)
    v20 = v16;
  else
    v20 = v25.__r_.__value_.__l.__size_;
  if (v19 - v20 >= v15)
  {
    if (v15)
    {
      if (v17 >= 0)
        v21 = &v25;
      else
        v21 = (std::string *)v25.__r_.__value_.__r.__words[0];
      memmove((char *)v21 + v20, v14, v15);
      v22 = v20 + v15;
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
        v25.__r_.__value_.__l.__size_ = v20 + v15;
      else
        *((_BYTE *)&v25.__r_.__value_.__s + 23) = v22 & 0x7F;
      v21->__r_.__value_.__s.__data_[v22] = 0;
    }
  }
  else
  {
    std::string::__grow_by_and_replace(&v25, v19, v20 + v15 - v19, v20, v20, 0, v15, (const std::string::value_type *)v14);
  }
  *a3 = v25;
  memset(&v25, 0, sizeof(v25));
  if ((SHIBYTE(v24.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v23.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return;
LABEL_54:
    operator delete(v23.__r_.__value_.__l.__data_);
    return;
  }
  operator delete(v24.__r_.__value_.__l.__data_);
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_54;
}

void sub_240BD3E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0)
  {
    operator delete(__p);
    if (a21 < 0)
    {
LABEL_5:
      operator delete(a16);
      if (a15 < 0)
      {
LABEL_8:
        operator delete(a10);
        _Unwind_Resume(a1);
      }
LABEL_9:
      _Unwind_Resume(a1);
    }
  }
  else if (a21 < 0)
  {
    goto LABEL_5;
  }
  if (a15 < 0)
    goto LABEL_8;
  goto LABEL_9;
}

uint64_t *sub_240BD3F00()
{
  unsigned __int8 v0;
  uint64_t i;
  void *__p[2];
  uint64_t v4;
  void *v5[2];
  uint64_t v6;
  void *v7[2];
  uint64_t v8;
  void *v9[2];
  uint64_t v10;
  void *v11[2];
  uint64_t v12;
  void *v13[2];
  uint64_t v14;
  void *v15[2];
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  const char *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  const char *v25;
  const char *v26;
  int v27;
  uint64_t v28;
  int v29;
  const char *v30;
  const char *v31;
  int v32;
  char v33;
  int v34;
  const char *v35;
  const char *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  const char *v42;
  const char *v43;
  int v44;
  char v45;
  int v46;
  const char *v47;
  const char *v48;
  int v49;
  char v50;
  int v51;
  const char *v52;
  const char *v53;
  int v54;
  char v55;
  int v56;
  const char *v57;
  const char *v58;
  int v59;
  char v60;
  int v61;
  const char *v62;
  const char *v63;
  int v64;
  char v65;
  int v66;
  const char *v67;
  const char *v68;
  int v69;
  char v70;
  int v71;
  const char *v72;
  const char *v73;
  int v74;
  _DWORD v75[8];
  const char *v76;
  const char *v77;
  int v78;
  _DWORD v79[8];
  const char *v80;
  const char *v81;
  int v82;
  char v83;
  int v84;
  const char *v85;
  const char *v86;
  int v87;
  _DWORD v88[8];
  const char *v89;
  const char *v90;
  int v91;
  _DWORD v92[8];
  const char *v93;
  const char *v94;
  int v95;
  char v96;
  int v97;
  const char *v98;
  const char *v99;
  int v100;
  char v101;
  int v102;
  const char *v103;
  const char *v104;
  int v105;
  char v106;
  int v107;
  const char *v108;
  const char *v109;
  int v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  const char *v115;
  const char *v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  const char *v122;
  const char *v123;
  int v124;
  char v125;
  int v126;
  const char *v127;
  const char *v128;
  int v129;
  uint64_t v130;
  int v131;
  const char *v132;
  const char *v133;
  int v134;
  char v135;
  int v136;
  const char *v137;
  const char *v138;
  int v139;
  char v140;
  int v141;
  const char *v142;
  const char *v143;
  int v144;
  char v145;
  int v146;
  const char *v147;
  const char *v148;
  int v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  int v153;
  const char *v154;
  const char *v155;
  int v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  int v160;
  const char *v161;
  const char *v162;
  int v163;
  char v164;
  int v165;
  const char *v166;
  const char *v167;
  int v168;
  uint64_t v169;
  int v170;
  const char *v171;
  const char *v172;
  int v173;
  char v174;
  int v175;
  const char *v176;
  const char *v177;
  int v178;
  char v179;
  int v180;
  const char *v181;
  const char *v182;
  int v183;
  char v184;
  int v185;
  const char *v186;
  const char *v187;
  int v188;
  char v189;
  int v190;
  const char *v191;
  const char *v192;
  int v193;
  char v194;
  int v195;
  const char *v196;
  const char *v197;
  int v198;
  char v199;
  int v200;
  const char *v201;
  const char *v202;
  int v203;
  __int128 v204;
  uint64_t v205;
  int v206;
  const char *v207;
  const char *v208;
  int v209;
  __int128 v210;
  uint64_t v211;
  int v212;
  const char *v213;
  const char *v214;
  int v215;
  __int128 v216;
  uint64_t v217;
  int v218;
  const char *v219;
  const char *v220;
  int v221;
  char v222;
  int v223;
  const char *v224;
  const char *v225;
  int v226;
  char v227;
  int v228;
  const char *v229;
  const char *v230;
  int v231;
  char v232;
  int v233;
  const char *v234;
  const char *v235;
  int v236;
  char v237;
  int v238;
  const char *v239;
  const char *v240;
  int v241;
  char v242;
  int v243;
  const char *v244;
  const char *v245;
  int v246;
  char v247;
  int v248;
  const char *v249;
  const char *v250;
  int v251;
  char v252;
  int v253;
  const char *v254;
  const char *v255;
  int v256;
  char v257;
  int v258;
  const char *v259;
  const char *v260;
  int v261;
  char v262;
  int v263;
  const char *v264;
  const char *v265;
  int v266;
  char v267;
  int v268;
  const char *v269;
  const char *v270;
  int v271;
  char v272;
  int v273;
  const char *v274;
  const char *v275;
  int v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  int v280;
  const char *v281;
  const char *v282;
  int v283;
  char v284;
  int v285;
  const char *v286;
  const char *v287;
  int v288;
  char v289;
  int v290;
  const char *v291;
  const char *v292;
  int v293;
  char v294;
  int v295;
  const char *v296;
  const char *v297;
  int v298;
  char v299;
  int v300;
  const char *v301;
  const char *v302;
  int v303;
  char v304;
  int v305;
  const char *v306;
  const char *v307;
  int v308;
  char v309;
  int v310;
  const char *v311;
  const char *v312;
  int v313;
  char v314;
  int v315;
  const char *v316;
  const char *v317;
  int v318;
  char v319;
  int v320;
  const char *v321;
  const char *v322;
  int v323;
  char v324;
  int v325;
  const char *v326;
  const char *v327;
  int v328;
  char v329;
  int v330;
  const char *v331;
  const char *v332;
  int v333;
  char v334;
  int v335;
  const char *v336;
  const char *v337;
  int v338;
  char v339;
  int v340;
  const char *v341;
  const char *v342;
  int v343;
  char v344;
  int v345;
  const char *v346;
  const char *v347;
  int v348;
  char v349;
  int v350;
  const char *v351;
  const char *v352;
  int v353;
  uint64_t v354;
  int v355;
  const char *v356;
  const char *v357;
  int v358;
  __int128 v359;
  uint64_t v360;
  int v361;
  const char *v362;
  const char *v363;
  int v364;
  uint64_t v365;
  int v366;
  const char *v367;
  const char *v368;
  int v369;
  __int128 v370;
  uint64_t v371;
  int v372;
  const char *v373;
  const char *v374;
  int v375;
  uint64_t v376;
  int v377;
  const char *v378;
  const char *v379;
  int v380;
  char v381;
  int v382;
  const char *v383;
  const char *v384;
  int v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  int v389;
  const char *v390;
  const char *v391;
  int v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  int v396;
  const char *v397;
  const char *v398;
  int v399;
  char v400;
  int v401;
  const char *v402;
  const char *v403;
  int v404;
  char v405;
  int v406;
  const char *v407;
  const char *v408;
  int v409;
  char v410;
  int v411;
  const char *v412;
  const char *v413;
  int v414;
  __int128 v415;
  uint64_t v416;
  int v417;
  const char *v418;
  const char *v419;
  int v420;
  __int128 v421;
  uint64_t v422;
  int v423;
  const char *v424;
  const char *v425;
  int v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  int v430;
  const char *v431;
  const char *v432;
  int v433;
  char v434;
  int v435;
  const char *v436;
  const char *v437;
  int v438;
  char v439;
  int v440;
  const char *v441;
  const char *v442;
  int v443;
  __int128 v444;
  uint64_t v445;
  int v446;
  const char *v447;
  const char *v448;
  int v449;
  char v450;
  int v451;
  const char *v452;
  const char *v453;
  int v454;
  char v455;
  int v456;
  const char *v457;
  const char *v458;
  int v459;
  char v460;
  int v461;
  const char *v462;
  const char *v463;
  int v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  int v468;
  const char *v469;
  uint64_t v470;

  MEMORY[0x24BDAC7A8]();
  v470 = *MEMORY[0x24BDAC8D0];
  v0 = atomic_load((unsigned __int8 *)&qword_25708AE18);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_25708AE18))
  {
    v19 = "--I";
    v20 = 2;
    v22 = 0;
    v23 = 0;
    v21 = 0;
    v24 = 2;
    v25 = "Add directory to include search path for generated code";
    v26 = "--alloc";
    v27 = 1;
    v28 = 1;
    v29 = 1;
    v30 = "Allocator pattern to use";
    v31 = "--aml-match";
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = "Enable the AML pattern matching pass.Currently only work for apple-asc targets.";
    v36 = "--api";
    v37 = 2;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v41 = 2;
    v42 = "Model name used in generated functions and types";
    v43 = "--asan";
    v44 = 0;
    v45 = 0;
    v46 = 0;
    v47 = "Enable Address Sanitizer";
    v48 = "--async-baking";
    v49 = 0;
    v50 = 0;
    v51 = 0;
    v52 = "Make bake() run in a dispatch queue";
    v53 = "--binary";
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = "Build an E5 backend binary";
    v58 = "--bin-debug";
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v62 = "Spit out binary_t debugging information";
    v63 = "--bnns-filters";
    v64 = 0;
    v65 = 1;
    v66 = 0;
    v67 = "enable the use of individual BNNS filters";
    v68 = "--bnns-graph";
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = "forward the entire MIL graph to MIL2BNNS";
    v73 = "--bnns-graph-bnns-ir";
    v74 = 2;
    sub_240BD50AC(v75, "");
    v76 = "Set a custom output location for compiled BNNS IR";
    v77 = "--bnns-graph-downconvert";
    v78 = 2;
    sub_240BD50AC(v79, "");
    v80 = "Set BNNS downconversion mode ('bf16_all', 'bf16_ops', 'fp16_all', 'fp16_ops', or 'none')";
    v81 = "--bnns-graph-generate-debug-info";
    v82 = 0;
    v83 = 0;
    v84 = 0;
    v85 = "Include debug info in the BNNS IR";
    v86 = "--bnns-graph-inject-custom-data";
    v87 = 2;
    sub_240BD50AC(v88, "");
    v89 = "Attaches custom user annotations into the BNNS IR.";
    v90 = "--bnns-graph-opt-pref";
    v91 = 2;
    sub_240BD50AC(v92, "");
    v93 = "Set BNNS optimization preference ('ir-size' or 'perf')";
    v94 = "--bnns-graph-validate-mil";
    v95 = 0;
    v96 = 1;
    v97 = 0;
    v98 = "Set whether BNNS should validate the MIL file";
    v99 = "--bnns-match";
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v103 = "Enable the BNNS pattern matching pass";
    v104 = "--c-identifiers";
    v105 = 0;
    v106 = 1;
    v107 = 0;
    v108 = "Force tensor names to be valid C idents";
    v109 = "--code-section";
    v110 = 2;
    v111 = 0;
    v113 = 0;
    v112 = 0;
    v114 = 2;
    v115 = "Use the given section for code. Ex.: __ETEXT,__text,regular,pure_instructions";
    v116 = "--compute-at-overrides";
    v117 = 2;
    v120 = 0;
    v118 = 0;
    v119 = 0;
    v121 = 2;
    v122 = "Force LoopKit compute_at for certain tensors (check source)";
    v123 = "--compute-at-overrides-allow-unknown";
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v127 = "Allow unknown tensor names in --compute-at-overrides";
    v128 = "--constant-buffer-threshold";
    v129 = 1;
    v130 = 32;
    v131 = 1;
    v132 = "Threshold in element count under which constant_t's are lowered as LoopKit::Buffer's";
    v133 = "--constant-folding";
    v134 = 0;
    v135 = 1;
    v136 = 0;
    v137 = "Enable constant folding";
    v138 = "--constant-folding-jit-allowed";
    v139 = 0;
    v140 = 0;
    v141 = 0;
    v142 = "Allow jitting of LoopKit kernels during constant-folding";
    v143 = "--check-precompiled-kernels";
    v144 = 0;
    v145 = 0;
    v146 = 0;
    v147 = "Compare results from precompiled kernels with jited ones.";
    v148 = "--const-section";
    v149 = 2;
    v151 = 0;
    v150 = 0;
    v152 = 0;
    v153 = 2;
    v154 = "Use the given section for constants. Ex.: __ECONST,__const";
    v155 = "--data-section";
    v156 = 2;
    v159 = 0;
    v157 = 0;
    v158 = 0;
    v160 = 2;
    v161 = "Use the given section for data. Ex.: __EDATA,__data";
    v162 = "--debug";
    v163 = 0;
    v164 = 0;
    v165 = 0;
    v166 = "Generate code to improve debugging experience";
    v167 = "--deadline";
    v168 = 1;
    v169 = 0x4000000000000;
    v170 = 1;
    v171 = "Time limit in seconds for compilation";
    v172 = "--debug-constant";
    v173 = 0;
    v174 = 0;
    v175 = 0;
    v176 = "debugging for constant values";
    v177 = "--debug-loopkit";
    v178 = 0;
    v179 = 0;
    v180 = 0;
    v181 = "Enable debugging for LoopKit-related code";
    v182 = "--disable-precompiled-kernels";
    v183 = 0;
    v184 = 0;
    v185 = 0;
    v186 = "Option to disable precompiled kernels and only enabled for Nano mode.";
    v187 = "--dump-allocation";
    v188 = 0;
    v189 = 0;
    v190 = 0;
    v191 = "Dump a CSV representation of the result of allocation to stdout";
    v192 = "--dump-graphviz";
    v193 = 0;
    v194 = 0;
    v195 = 0;
    v196 = "Dump the IR as a graphviz graph before and after every pass.";
    v197 = "--dump-liveness";
    v198 = 0;
    v199 = 0;
    v200 = 0;
    v201 = "Dump a CSV representation of the result of liveness analysis to stdout";
    v202 = "--dump-yaml-before";
    v203 = 2;
    sub_240BD5164(&v17, "");
    v204 = v17;
    v205 = v18;
    v18 = 0;
    v17 = 0uLL;
    v206 = 2;
    v207 = "Dump the IR as structured YAML before the given pass.";
    v208 = "--dump-yaml-after";
    v209 = 2;
    sub_240BD5164(v15, "");
    v210 = *(_OWORD *)v15;
    v211 = v16;
    v15[1] = 0;
    v16 = 0;
    v15[0] = 0;
    v212 = 2;
    v213 = "Dump the IR as structured YAML after the given pass. Use 'frontend' to dump before any compile passes have run.";
    v214 = "--dump-yaml-to";
    v215 = 2;
    sub_240BD5164(v13, "-");
    v216 = *(_OWORD *)v13;
    v217 = v14;
    v13[1] = 0;
    v14 = 0;
    v13[0] = 0;
    v218 = 2;
    v219 = "If --dump-yaml-after is given, dump the yaml to the specified file. Defaults to stdout.";
    v220 = "--dump-cg";
    v221 = 0;
    v222 = 0;
    v223 = 0;
    v224 = "Dump codegen's output to stdout";
    v225 = "--dump-op-names";
    v226 = 0;
    v227 = 0;
    v228 = 0;
    v229 = "Dump all operation names to stdout";
    v230 = "--dump-record-layouts";
    v231 = 0;
    v232 = 0;
    v233 = 0;
    v234 = "Dump clang's representation of the data struct";
    v235 = "--dylib";
    v236 = 0;
    v237 = 0;
    v238 = 0;
    v239 = "Build a dynamic library";
    v240 = "--enable-external-constants";
    v241 = 0;
    v242 = 0;
    v243 = 0;
    v244 = "Enables use of external weight files";
    v245 = "--enable-external-kernels";
    v246 = 0;
    v247 = 0;
    v248 = 0;
    v249 = "Enable external kernels mode for binary_t codegen";
    v250 = "--enable-external-outputs";
    v251 = 0;
    v252 = 0;
    v253 = 0;
    v254 = "Enables use of external output buffers. This can have negative performance implications.";
    v255 = "--enforce-opt-names-exist";
    v256 = 0;
    v257 = 0;
    v258 = 0;
    v259 = "Enforce that operations named in opt_config actually exist.";
    v260 = "--fusion";
    v261 = 0;
    v262 = 1;
    v263 = 0;
    v264 = "Enable the fusion pass";
    v265 = "--fuse-all";
    v266 = 0;
    v267 = 0;
    v268 = 0;
    v269 = "Pretend EVERYTHING is fusable";
    v270 = "--fuse-single";
    v271 = 0;
    v272 = 0;
    v273 = 0;
    v274 = "Max 1 op per fusion";
    v275 = "--header";
    v276 = 2;
    v278 = 0;
    v277 = 0;
    v279 = 0;
    v280 = 2;
    v281 = "Path to generated header. Not required when generating a binary";
    v282 = "--lk-bsa";
    v283 = 0;
    v284 = 1;
    v285 = 0;
    v286 = "Use LoopKit's BucketStackAllocations";
    v287 = "--lk-buffers";
    v288 = 0;
    v289 = 0;
    v290 = 0;
    v291 = "Enable/Disable using LoopKit buffers";
    v292 = "--lk-malloc";
    v293 = 0;
    v294 = 0;
    v295 = 0;
    v296 = "Allow LoopKit to call 'malloc'.";
    v297 = "--lk-object";
    v298 = 0;
    v299 = 1;
    v300 = 0;
    v301 = "Output LoopKit generated code as object.";
    v302 = "--lk-partition";
    v303 = 0;
    v304 = 1;
    v305 = 0;
    v306 = "Partition loops in LoopKit";
    v307 = "--lk-profiling";
    v308 = 0;
    v309 = 0;
    v310 = 0;
    v311 = "Enable LoopKit's profiling mode";
    v312 = "--lk-runtime";
    v313 = 0;
    v314 = 0;
    v315 = 0;
    v316 = "Enable/disable the LoopKit runtime";
    v317 = "--lk-scratch";
    v318 = 0;
    v319 = 1;
    v320 = 0;
    v321 = "Utilize scratch buffers in LK";
    v322 = "--lk-scratch-metakernel";
    v323 = 0;
    v324 = 0;
    v325 = 0;
    v326 = "Use metakernels to access scratchbuffer sizes";
    v327 = "--lk-apply-bounds";
    v328 = 0;
    v329 = 1;
    v330 = 0;
    v331 = "Set bounds on input and output params to LK kernels";
    v332 = "--lk-werror";
    v333 = 0;
    v334 = 1;
    v335 = 0;
    v336 = "Treat LoopKit runtime assertion failures as errors";
    v337 = "--llvm-ir";
    v338 = 0;
    v339 = 0;
    v340 = 0;
    v341 = "Outputs LLVM IR files to /tmp or the directory specified with --save-temps";
    v342 = "--llvm-unroll";
    v343 = 0;
    v344 = 0;
    v345 = 0;
    v346 = "Unroll loops at the LLVM level (ignore LK)";
    v347 = "--llvm-vectorize";
    v348 = 0;
    v349 = 0;
    v350 = 0;
    v351 = "Vectorize at the LLVM level (ignore LK)";
    v352 = "--mem-limit";
    v353 = 1;
    v354 = -1;
    v355 = 1;
    v356 = "Memory limit for graph. -1 to disable.";
    v357 = "--memory";
    v358 = 2;
    sub_240BD5164(v11, "static");
    v359 = *(_OWORD *)v11;
    v360 = v12;
    v11[1] = 0;
    v12 = 0;
    v11[0] = 0;
    v361 = 2;
    v362 = "method to allocate memory";
    v363 = "--min-alignment";
    v364 = 1;
    v365 = 32;
    v366 = 1;
    v367 = "Minimum alignment for a tensor";
    v368 = "--model-path";
    v369 = 2;
    sub_240BD5164(v9, "");
    v370 = *(_OWORD *)v9;
    v371 = v10;
    v9[1] = 0;
    v10 = 0;
    v9[0] = 0;
    v372 = 2;
    v373 = "MIL file path, used during MIL parsing";
    v374 = "--n-threads";
    v375 = 1;
    v377 = 1;
    v376 = 0;
    v378 = "Limit runtime execution to N threads (0 means automatic)";
    v379 = "--nanck";
    v380 = 0;
    v381 = 0;
    v383 = "Add NaN checking ops";
    v382 = 0;
    v384 = "--opt_config";
    v385 = 2;
    v387 = 0;
    v386 = 0;
    v388 = 0;
    v389 = 2;
    v390 = "Optimization configuration file";
    v391 = "--output";
    v392 = 2;
    v395 = 0;
    v393 = 0;
    v394 = 0;
    v396 = 2;
    v397 = "Path to generated library or binary file";
    v398 = "--print";
    v399 = 0;
    v400 = 0;
    v401 = 0;
    v402 = "Add print ops to debug tensor values";
    v403 = "--reachability";
    v404 = 0;
    v405 = 0;
    v406 = 0;
    v407 = "Debug tensor/op reachability calculation";
    v408 = "--rtcg";
    v409 = 0;
    v410 = 0;
    v411 = 0;
    v412 = "Enable RTCG code generator";
    v413 = "--save-temps";
    v414 = 2;
    sub_240BD5164(v7, "");
    v415 = *(_OWORD *)v7;
    v416 = v8;
    v7[1] = 0;
    v8 = 0;
    v7[0] = 0;
    v417 = 2;
    v418 = "Save temporaries to this directory";
    v419 = "--skip-opt-pass";
    v420 = 2;
    sub_240BD5164(v5, "");
    v421 = *(_OWORD *)v5;
    v422 = v6;
    v5[1] = 0;
    v6 = 0;
    v5[0] = 0;
    v423 = 2;
    v424 = "Skip the listed (comma-separated) optimization passes. Available values: 'alloc', 'constant-folding'";
    v425 = "--sdk";
    v426 = 2;
    v427 = 0;
    v429 = 0;
    v428 = 0;
    v431 = "Use the tools from the given SDK";
    v430 = 2;
    v432 = "--static";
    v433 = 0;
    v434 = 0;
    v435 = 0;
    v436 = "Build a static library";
    v437 = "--strength-reduction";
    v438 = 0;
    v439 = 1;
    v440 = 0;
    v441 = "Enable strength reduction";
    v442 = "--target";
    v443 = 2;
    sub_240BD5164(__p, "arm64e-apple-macosx:apple-m1");
    v444 = *(_OWORD *)__p;
    v445 = v4;
    __p[1] = 0;
    v4 = 0;
    __p[0] = 0;
    v446 = 2;
    v447 = "The super triple string (target triple and mcpu separated by ':').";
    v448 = "--use-bnns";
    v449 = 0;
    v450 = 0;
    v451 = 0;
    v452 = "Enable BNNS or AccelerateML as a backend.";
    v453 = "--verbose";
    v454 = 0;
    v455 = 0;
    v456 = 0;
    v457 = "Print intermediate tools output information";
    v458 = "--version";
    v459 = 0;
    v460 = 0;
    v461 = 0;
    v462 = "Print version information and exit";
    v463 = "--use-fixed-point";
    v464 = 2;
    v467 = 0;
    v465 = 0;
    v466 = 0;
    v468 = 2;
    v469 = "Quantize float-point model to use fixed-point arithmetics. (Supported values: 'i32_16')";
    sub_240BD5214(&qword_25708AE00, (uint64_t)&v19, 0x55uLL);
    for (i = 0; i != -595; i -= 7)
      sub_240BD5340((uint64_t)&(&v463)[i]);
    if (SHIBYTE(v4) < 0)
    {
      operator delete(__p[0]);
      if ((SHIBYTE(v6) & 0x80000000) == 0)
      {
LABEL_8:
        if ((SHIBYTE(v8) & 0x80000000) == 0)
          goto LABEL_9;
        goto LABEL_17;
      }
    }
    else if ((SHIBYTE(v6) & 0x80000000) == 0)
    {
      goto LABEL_8;
    }
    operator delete(v5[0]);
    if ((SHIBYTE(v8) & 0x80000000) == 0)
    {
LABEL_9:
      if ((SHIBYTE(v10) & 0x80000000) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
LABEL_17:
    operator delete(v7[0]);
    if ((SHIBYTE(v10) & 0x80000000) == 0)
    {
LABEL_10:
      if ((SHIBYTE(v12) & 0x80000000) == 0)
        goto LABEL_11;
      goto LABEL_19;
    }
LABEL_18:
    operator delete(v9[0]);
    if ((SHIBYTE(v12) & 0x80000000) == 0)
    {
LABEL_11:
      if ((SHIBYTE(v14) & 0x80000000) == 0)
        goto LABEL_12;
      goto LABEL_20;
    }
LABEL_19:
    operator delete(v11[0]);
    if ((SHIBYTE(v14) & 0x80000000) == 0)
    {
LABEL_12:
      if ((SHIBYTE(v16) & 0x80000000) == 0)
        goto LABEL_13;
      goto LABEL_21;
    }
LABEL_20:
    operator delete(v13[0]);
    if ((SHIBYTE(v16) & 0x80000000) == 0)
    {
LABEL_13:
      if ((SHIBYTE(v18) & 0x80000000) == 0)
      {
LABEL_14:
        __cxa_atexit((void (*)(void *))sub_240BD5398, &qword_25708AE00, &dword_240BC3000);
        __cxa_guard_release(&qword_25708AE18);
        return &qword_25708AE00;
      }
LABEL_22:
      operator delete((void *)v17);
      goto LABEL_14;
    }
LABEL_21:
    operator delete(v15[0]);
    if ((SHIBYTE(v18) & 0x80000000) == 0)
      goto LABEL_14;
    goto LABEL_22;
  }
  return &qword_25708AE00;
}

void sub_240BD4F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50,void *a51,uint64_t a52,int a53,__int16 a54,char a55,char a56,char a57)
{
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;

  v59 = -4760;
  v60 = v57;
  do
  {
    v60 = sub_240BD5340(v60) - 56;
    v59 += 56;
  }
  while (v59);
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
  {
    operator delete(a15);
    if ((a26 & 0x80000000) == 0)
    {
LABEL_7:
      if ((a32 & 0x80000000) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((a26 & 0x80000000) == 0)
  {
    goto LABEL_7;
  }
  operator delete(a21);
  if ((a32 & 0x80000000) == 0)
  {
LABEL_8:
    if ((a38 & 0x80000000) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  operator delete(a27);
  if ((a38 & 0x80000000) == 0)
  {
LABEL_9:
    if ((a44 & 0x80000000) == 0)
      goto LABEL_10;
    goto LABEL_17;
  }
LABEL_16:
  operator delete(a33);
  if ((a44 & 0x80000000) == 0)
  {
LABEL_10:
    if ((a50 & 0x80000000) == 0)
      goto LABEL_11;
    goto LABEL_18;
  }
LABEL_17:
  operator delete(a39);
  if ((a50 & 0x80000000) == 0)
  {
LABEL_11:
    if ((a56 & 0x80000000) == 0)
    {
LABEL_20:
      __cxa_guard_abort(&qword_25708AE18);
      _Unwind_Resume(a1);
    }
LABEL_19:
    operator delete(a51);
    goto LABEL_20;
  }
LABEL_18:
  operator delete(a45);
  if ((a56 & 0x80000000) == 0)
    goto LABEL_20;
  goto LABEL_19;
}

_DWORD *sub_240BD50AC(_DWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_240BC9D74();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    *((_QWORD *)a1 + 1) = v5;
    *((_QWORD *)a1 + 2) = v8 | 0x8000000000000000;
    *(_QWORD *)a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  a1[6] = 2;
  return a1;
}

_QWORD *sub_240BD5164(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_240BC9D74();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

_QWORD *sub_240BD5214(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v6;
  char *v7;

  a1[2] = 0;
  v4 = (uint64_t)(a1 + 2);
  *a1 = 0;
  a1[1] = 0;
  if (a3)
  {
    if (a3 >= 0x492492492492493)
      sub_240BC9E84();
    v6 = 56 * a3;
    v7 = (char *)operator new(56 * a3);
    *a1 = v7;
    a1[1] = v7;
    a1[2] = &v7[v6];
    a1[1] = sub_240BD61D4(v4, a2, a2 + v6, (uint64_t)v7);
  }
  return a1;
}

void sub_240BD52BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  void **v13;
  void *v14;
  _DWORD *v16;
  _DWORD *v17;
  void *v18;
  uint64_t v19;

  v13[1] = v14;
  v16 = *v13;
  if (*v13)
  {
    v17 = v13[1];
    v18 = *v13;
    if (v17 != v16)
    {
      do
      {
        v19 = *(v17 - 4);
        if ((_DWORD)v19 != -1)
          ((void (*)(char *, _DWORD *))off_25110DC80[v19])(&a13, v17 - 10);
        *(v17 - 4) = -1;
        v17 -= 14;
      }
      while (v17 != v16);
      v18 = *v13;
    }
    v13[1] = v16;
    operator delete(v18);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_240BD5340(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 40);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))off_25110DC80[v2])(&v4, a1 + 16);
  *(_DWORD *)(a1 + 40) = -1;
  return a1;
}

void **sub_240BD5398(void **a1)
{
  _DWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  char v7;

  v2 = *a1;
  if (*a1)
  {
    v3 = a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        v5 = *(v3 - 4);
        if ((_DWORD)v5 != -1)
          ((void (*)(char *, _DWORD *))off_25110DC80[v5])(&v7, v3 - 10);
        *(v3 - 4) = -1;
        v3 -= 14;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_240BD543C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  size_t v6;
  size_t v7;
  __int128 *p_dst;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  size_t v17;
  size_t v18;
  __int128 *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 __dst;
  unint64_t v25;
  __int128 *v26;

  *(_OWORD *)(a1 + 8) = 0u;
  v1 = a1 + 8;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 40) = 1065353216;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 48) = a1 + 56;
  *(_QWORD *)a1 = off_25110DC60;
  sub_240BD3F00();
  v2 = qword_25708AE08;
  if (qword_25708AE00 != qword_25708AE08)
  {
    v3 = qword_25708AE00 + 16;
    while (1)
    {
      v4 = v3 - 16;
      v5 = *(const char **)(v3 - 16);
      v6 = strlen(v5);
      if (v6 > 0x7FFFFFFFFFFFFFF7)
        sub_240BC9D74();
      v7 = v6;
      if (v6 >= 0x17)
        break;
      HIBYTE(v25) = v6;
      p_dst = &__dst;
      if (v6)
        goto LABEL_11;
LABEL_12:
      *((_BYTE *)p_dst + v7) = 0;
      v26 = &__dst;
      v11 = sub_240BD6688(v1, (uint64_t)&__dst, (uint64_t)&unk_240BDBA4F, &v26);
      v12 = v11;
      v13 = *((unsigned int *)v11 + 16);
      v14 = *(unsigned int *)(v3 + 24);
      if ((_DWORD)v13 == -1)
      {
        if ((_DWORD)v14 != -1)
        {
LABEL_16:
          v26 = (__int128 *)(v11 + 40);
          ((void (*)(__int128 **))off_25110DCB0[v14])(&v26);
        }
      }
      else
      {
        if ((_DWORD)v14 != -1)
          goto LABEL_16;
        ((void (*)(__int128 **, unsigned __int8 *))off_25110DC80[v13])(&v26, v11 + 40);
        *((_DWORD *)v12 + 16) = -1;
      }
      if (SHIBYTE(v25) < 0)
        operator delete((void *)__dst);
      v3 += 56;
      if (v4 + 56 == v2)
        goto LABEL_19;
    }
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    p_dst = (__int128 *)operator new(v9 + 1);
    *((_QWORD *)&__dst + 1) = v7;
    v25 = v10 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
LABEL_11:
    memmove(p_dst, v5, v7);
    goto LABEL_12;
  }
LABEL_19:
  v15 = getenv("__UNOWUD");
  if (v15)
  {
    v16 = v15;
    v17 = strlen(v15);
    if (v17 > 0x7FFFFFFFFFFFFFF7)
      sub_240BC9D74();
    v18 = v17;
    if (v17 >= 0x17)
    {
      v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v17 | 7) != 0x17)
        v20 = v17 | 7;
      v21 = v20 + 1;
      v19 = (__int128 *)operator new(v20 + 1);
      *((_QWORD *)&__dst + 1) = v18;
      v25 = v21 | 0x8000000000000000;
      *(_QWORD *)&__dst = v19;
    }
    else
    {
      HIBYTE(v25) = v17;
      v19 = &__dst;
      if (!v17)
      {
LABEL_28:
        *((_BYTE *)v19 + v18) = 0;
        sub_240BD7E38((char **)a1, &__dst);
        if (SHIBYTE(v25) < 0)
          operator delete((void *)__dst);
        return a1;
      }
    }
    memmove(v19, v16, v18);
    goto LABEL_28;
  }
  return a1;
}

void sub_240BD56C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  sub_240BD5708(a9);
  _Unwind_Resume(a1);
}

uint64_t sub_240BD5708(uint64_t a1)
{
  *(_QWORD *)a1 = off_25110D880;
  sub_240BCD774(a1 + 48, *(char **)(a1 + 56));
  sub_240BD65DC(a1 + 8);
  return nullsub_1(a1);
}

void sub_240BD5748(uint64_t a1, uint64_t a2, char *a3)
{
  int v6;
  unint64_t v7;
  size_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  _WORD *v12;
  void *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  const char *v20;
  size_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void **v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  __int128 *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  std::ios_base *v40;
  char v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  _BYTE *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  std::ios_base *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t *v59;
  char *v60;
  void *__dst[2];
  int64_t v62;
  uint64_t v63;
  void *__s1[2];
  int64_t v65;
  __int128 v66;
  uint64_t v67;
  int v68;
  void *__p;
  char v70;
  _QWORD v71[21];

  v6 = *(char *)(a2 + 23);
  v7 = *(_QWORD *)(a2 + 8);
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(a2 + 23);
  else
    v8 = *(_QWORD *)(a2 + 8);
  if (v8 > 1)
  {
    v10 = *(char **)a2;
    if (v6 >= 0)
      v11 = (char *)a2;
    else
      v11 = *(char **)a2;
    if (*(_WORD *)v11 == 11565)
    {
      if (v6 < 0)
      {
        sub_240BCD950(__dst, v10, v7);
      }
      else
      {
        *(_OWORD *)__dst = *(_OWORD *)a2;
        v62 = *(_QWORD *)(a2 + 16);
      }
      goto LABEL_19;
    }
    v9 = v8 + 2;
    if (v8 + 2 > 0x7FFFFFFFFFFFFFF7)
      sub_240BC9D74();
    if (v9 > 0x16)
    {
      v30 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v9 | 7) != 0x17)
        v30 = v9 | 7;
      v31 = v30 + 1;
      v12 = operator new(v30 + 1);
      __dst[1] = (void *)(v8 + 2);
      v62 = v31 | 0x8000000000000000;
      __dst[0] = v12;
      goto LABEL_13;
    }
  }
  else
  {
    LOBYTE(v9) = v8 + 2;
  }
  __dst[1] = 0;
  v62 = 0;
  __dst[0] = 0;
  v12 = __dst;
  HIBYTE(v62) = v9;
LABEL_13:
  *v12 = 11565;
  v13 = v12 + 1;
  if (v8)
  {
    if (v6 >= 0)
      v14 = (char *)a2;
    else
      v14 = *(char **)a2;
    memmove(v13, v14, v8);
  }
  *((_BYTE *)v13 + v8) = 0;
LABEL_19:
  sub_240BD3F00();
  v15 = qword_25708AE00;
  sub_240BD3F00();
  v60 = a3;
  v16 = a1;
  v17 = qword_25708AE08;
  if (v15 == qword_25708AE08)
    goto LABEL_54;
  do
  {
    v20 = *(const char **)v15;
    v21 = strlen(*(const char **)v15);
    if (v21 > 0x7FFFFFFFFFFFFFF7)
      sub_240BC9D74();
    v22 = (void *)v21;
    if (v21 >= 0x17)
    {
      v24 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v21 | 7) != 0x17)
        v24 = v21 | 7;
      v25 = v24 + 1;
      v23 = operator new(v24 + 1);
      __s1[1] = v22;
      v65 = v25 | 0x8000000000000000;
      __s1[0] = v23;
LABEL_30:
      memmove(v23, v20, (size_t)v22);
      goto LABEL_31;
    }
    HIBYTE(v65) = v21;
    v23 = __s1;
    if (v21)
      goto LABEL_30;
LABEL_31:
    *((_BYTE *)v22 + (_QWORD)v23) = 0;
    if (v65 >= 0)
      v26 = (void *)HIBYTE(v65);
    else
      v26 = __s1[1];
    v27 = (void *)HIBYTE(v62);
    if (v62 < 0)
      v27 = __dst[1];
    if (v26 != v27)
      goto LABEL_46;
    if (v62 >= 0)
      v28 = __dst;
    else
      v28 = (void **)__dst[0];
    if ((v65 & 0x8000000000000000) == 0)
    {
      if (!HIBYTE(v65))
        goto LABEL_54;
      v29 = 0;
      while (*((unsigned __int8 *)__s1 + v29) == *((unsigned __int8 *)v28 + v29))
      {
        if (HIBYTE(v65) == ++v29)
          goto LABEL_54;
      }
LABEL_46:
      if (v65 < 0)
        operator delete(__s1[0]);
      goto LABEL_22;
    }
    v18 = __s1[0];
    v19 = memcmp(__s1[0], v28, (size_t)__s1[1]);
    operator delete(v18);
    if (!v19)
      goto LABEL_54;
LABEL_22:
    v15 += 56;
  }
  while (v15 != v17);
  v15 = v17;
LABEL_54:
  sub_240BD3F00();
  if (v15 == qword_25708AE08)
  {
    if (*(char *)(a2 + 23) >= 0)
      v46 = (const char *)a2;
    else
      v46 = *(const char **)a2;
    if (v60[23] >= 0)
      v47 = v60;
    else
      v47 = *(const char **)v60;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Unknown option %s=%s\n", v46, v47);
    if (SHIBYTE(v62) < 0)
      goto LABEL_71;
    return;
  }
  v32 = *(_DWORD *)(v15 + 8);
  if (v32 == 2)
  {
    v33 = v16;
    __s1[0] = (void *)a2;
    v59 = sub_240BD702C(v16 + 8, a2, (uint64_t)&unk_240BDBA4F, (__int128 **)__s1);
    v34 = (__int128 *)v60;
    sub_240BD64C8((void **)v59 + 5, (uint64_t)(v59 + 5), (__int128 *)v60);
    goto LABEL_79;
  }
  v33 = v16;
  if (v32 == 1)
  {
    v48 = MEMORY[0x24BEDB868];
    v49 = MEMORY[0x24BEDB868] + 64;
    v50 = MEMORY[0x24BEDB7F8];
    v51 = *(void **)(MEMORY[0x24BEDB7F8] + 8);
    v52 = *(void **)(MEMORY[0x24BEDB7F8] + 16);
    v71[0] = MEMORY[0x24BEDB868] + 64;
    __s1[0] = v51;
    *(void **)((char *)__s1 + *((_QWORD *)v51 - 3)) = v52;
    __s1[1] = 0;
    v53 = (std::ios_base *)((char *)__s1 + *((_QWORD *)__s1[0] - 3));
    std::ios_base::init(v53, &v65);
    v34 = (__int128 *)v60;
    v53[1].__vftable = 0;
    v53[1].__fmtflags_ = -1;
    __s1[0] = (void *)(v48 + 24);
    v71[0] = v49;
    sub_240BD7468((uint64_t)&v65, (__int128 *)v60, 8);
    v63 = 0;
    *(_DWORD *)((char *)&__s1[1] + *((_QWORD *)__s1[0] - 3)) |= 1u;
    MEMORY[0x24268B254](__s1, &v63);
    __s1[0] = *(void **)v50;
    *(void **)((char *)__s1 + *((_QWORD *)__s1[0] - 3)) = *(void **)(v50 + 24);
    v54 = v63;
    v65 = MEMORY[0x24BEDB848] + 16;
    if (v70 < 0)
      operator delete(__p);
    std::streambuf::~streambuf();
    std::istream::~istream();
    MEMORY[0x24268B35C](v71);
    __s1[0] = (void *)a2;
    v55 = sub_240BD702C(v33 + 8, a2, (uint64_t)&unk_240BDBA4F, (__int128 **)__s1);
    v56 = v55;
    v57 = *((unsigned int *)v55 + 16);
    if ((_DWORD)v57 != -1)
    {
      v58 = v55 + 5;
      if ((_DWORD)v57 == 1)
      {
        *v58 = v54;
        if ((*(char *)(a2 + 23) & 0x80000000) == 0)
          goto LABEL_80;
LABEL_84:
        sub_240BCD950(__s1, *(void **)a2, *(_QWORD *)(a2 + 8));
        goto LABEL_85;
      }
      ((void (*)(void **, uint64_t *))off_25110DC80[v57])(__s1, v58);
    }
    v56[5] = v54;
    *((_DWORD *)v56 + 16) = 1;
    if (*(char *)(a2 + 23) < 0)
      goto LABEL_84;
    goto LABEL_80;
  }
  v34 = (__int128 *)v60;
  if (v32)
  {
LABEL_79:
    if (*(char *)(a2 + 23) < 0)
      goto LABEL_84;
    goto LABEL_80;
  }
  v35 = MEMORY[0x24BEDB868];
  v36 = MEMORY[0x24BEDB868] + 64;
  v37 = MEMORY[0x24BEDB7F8];
  v38 = *(void **)(MEMORY[0x24BEDB7F8] + 8);
  v39 = *(void **)(MEMORY[0x24BEDB7F8] + 16);
  v71[0] = MEMORY[0x24BEDB868] + 64;
  __s1[0] = v38;
  *(void **)((char *)__s1 + *((_QWORD *)v38 - 3)) = v39;
  __s1[1] = 0;
  v40 = (std::ios_base *)((char *)__s1 + *((_QWORD *)__s1[0] - 3));
  std::ios_base::init(v40, &v65);
  v40[1].__vftable = 0;
  v40[1].__fmtflags_ = -1;
  __s1[0] = (void *)(v35 + 24);
  v71[0] = v36;
  sub_240BD7468((uint64_t)&v65, (__int128 *)v60, 8);
  LOBYTE(v63) = 0;
  *(_DWORD *)((char *)&__s1[1] + *((_QWORD *)__s1[0] - 3)) |= 1u;
  MEMORY[0x24268B248](__s1, &v63);
  __s1[0] = *(void **)v37;
  *(void **)((char *)__s1 + *((_QWORD *)__s1[0] - 3)) = *(void **)(v37 + 24);
  v41 = v63;
  v65 = MEMORY[0x24BEDB848] + 16;
  if (v70 < 0)
    operator delete(__p);
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x24268B35C](v71);
  __s1[0] = (void *)a2;
  v42 = sub_240BD702C(v33 + 8, a2, (uint64_t)&unk_240BDBA4F, (__int128 **)__s1);
  v43 = v42;
  v44 = *((unsigned int *)v42 + 16);
  if ((_DWORD)v44 == -1)
  {
LABEL_96:
    *((_BYTE *)v43 + 40) = v41;
    *((_DWORD *)v43 + 16) = 0;
    if ((*(char *)(a2 + 23) & 0x80000000) == 0)
      goto LABEL_80;
    goto LABEL_84;
  }
  v45 = v42 + 5;
  if ((_DWORD)v44)
  {
    ((void (*)(void **, _BYTE *))off_25110DC80[v44])(__s1, v45);
    goto LABEL_96;
  }
  *v45 = v41;
  if (*(char *)(a2 + 23) < 0)
    goto LABEL_84;
LABEL_80:
  *(_OWORD *)__s1 = *(_OWORD *)a2;
  v65 = *(_QWORD *)(a2 + 16);
LABEL_85:
  if (*((char *)v34 + 23) < 0)
  {
    sub_240BCD950(&v66, *(void **)v34, *((_QWORD *)v34 + 1));
  }
  else
  {
    v66 = *v34;
    v67 = *((_QWORD *)v34 + 2);
  }
  v68 = 2;
  sub_240BD7660(v33 + 8, (uint64_t)__s1, (uint64_t)__s1);
  if (v68 != -1)
    ((void (*)(uint64_t *, __int128 *))off_25110DC80[v68])(&v63, &v66);
  v68 = -1;
  if ((SHIBYTE(v65) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v62) & 0x80000000) == 0)
      return;
LABEL_71:
    operator delete(__dst[0]);
    return;
  }
  operator delete(__s1[0]);
  if (SHIBYTE(v62) < 0)
    goto LABEL_71;
}

void sub_240BD5E48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if ((a18 & 0x80000000) == 0)
    _Unwind_Resume(exception_object);
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_240BD5F14(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 48);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))off_25110DC80[v2])(&v4, a1 + 24);
  *(_DWORD *)(a1 + 48) = -1;
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t sub_240BD5F7C(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  size_t v8;
  size_t v9;
  _BYTE *p_s1;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  unsigned __int8 *v14;
  int v15;
  const char *v16;
  uint64_t v17;
  const char *v19;
  void *__s1;
  size_t __n;
  int64_t v22;

  sub_240BD3F00();
  v3 = qword_25708AE00;
  sub_240BD3F00();
  v4 = qword_25708AE08;
  if (v3 != qword_25708AE08)
  {
    while (1)
    {
      v7 = *(const char **)v3;
      v8 = strlen(*(const char **)v3);
      if (v8 >= 0x7FFFFFFFFFFFFFF8)
        sub_240BC9D74();
      v9 = v8;
      if (v8 >= 0x17)
        break;
      HIBYTE(v22) = v8;
      p_s1 = &__s1;
      if (v8)
        goto LABEL_12;
LABEL_13:
      p_s1[v9] = 0;
      if (v22 >= 0)
        v13 = HIBYTE(v22);
      else
        v13 = __n;
      v14 = (unsigned __int8 *)*((unsigned __int8 *)a2 + 23);
      v15 = (char)v14;
      if ((char)v14 < 0)
        v14 = (unsigned __int8 *)*((_QWORD *)a2 + 1);
      if ((unsigned __int8 *)v13 == v14)
      {
        if (v15 >= 0)
          v16 = a2;
        else
          v16 = *(const char **)a2;
        if (v22 < 0)
        {
          v5 = __s1;
          v6 = memcmp(__s1, v16, __n);
          operator delete(v5);
          if (!v6)
            goto LABEL_31;
          goto LABEL_4;
        }
        if (!HIBYTE(v22))
          goto LABEL_31;
        v17 = 0;
        while (*((unsigned __int8 *)&__s1 + v17) == v16[v17])
        {
          if (HIBYTE(v22) == ++v17)
            goto LABEL_31;
        }
      }
      if (v22 < 0)
        operator delete(__s1);
LABEL_4:
      v3 += 56;
      if (v3 == v4)
      {
        v3 = v4;
        goto LABEL_31;
      }
    }
    v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17)
      v11 = v8 | 7;
    v12 = v11 + 1;
    p_s1 = operator new(v11 + 1);
    __n = v9;
    v22 = v12 | 0x8000000000000000;
    __s1 = p_s1;
LABEL_12:
    memmove(p_s1, v7, v9);
    goto LABEL_13;
  }
LABEL_31:
  sub_240BD3F00();
  if (v3 != qword_25708AE08)
    return *(unsigned int *)(v3 + 8);
  if (a2[23] >= 0)
    v19 = a2;
  else
    v19 = *(const char **)a2;
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Unknown option key %s!\n", v19);
  return 0;
}

uint64_t sub_240BD6158(uint64_t a1)
{
  *(_QWORD *)a1 = off_25110D880;
  sub_240BCD774(a1 + 48, *(char **)(a1 + 56));
  sub_240BD65DC(a1 + 8);
  return nullsub_1(a1);
}

void sub_240BD6194(uint64_t a1)
{
  void *v2;

  *(_QWORD *)a1 = off_25110D880;
  sub_240BCD774(a1 + 48, *(char **)(a1 + 56));
  sub_240BD65DC(a1 + 8);
  v2 = (void *)nullsub_1(a1);
  j__free(v2);
}

uint64_t sub_240BD61D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  _BYTE v13[2];

  v4 = a4;
  v12 = a4;
  if (a2 != a3)
  {
    v6 = a2 + 16;
    do
    {
      v8 = v6 - 16;
      v7 = *(_QWORD *)(v6 - 16);
      *(_DWORD *)(v4 + 8) = *(_DWORD *)(v6 - 8);
      *(_QWORD *)v4 = v7;
      *(_BYTE *)(v4 + 16) = 0;
      *(_DWORD *)(v4 + 40) = -1;
      v9 = *(unsigned int *)(v6 + 24);
      v10 = v4;
      if ((_DWORD)v9 != -1)
      {
        ((void (*)(_BYTE *, uint64_t, uint64_t))off_25110DC98[v9])(v13, v4 + 16, v6);
        *(_DWORD *)(v4 + 40) = v9;
        v10 = v12;
      }
      *(_QWORD *)(v4 + 48) = *(_QWORD *)(v6 + 32);
      v4 = v10 + 56;
      v12 = v10 + 56;
      v6 += 56;
    }
    while (v8 + 56 != a3);
  }
  return v4;
}

void sub_240BD62BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v22 = *(unsigned int *)(v19 + 40);
  if ((_DWORD)v22 != -1)
    ((void (*)(char *, uint64_t))off_25110DC80[v22])(&a19, v20);
  *(_DWORD *)(v19 + 40) = -1;
  sub_240BD6300((uint64_t)&a10);
  _Unwind_Resume(a1);
}

uint64_t sub_240BD6300(uint64_t a1)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  char v8;

  if (!*(_BYTE *)(a1 + 24))
  {
    v4 = *(uint64_t **)(a1 + 8);
    v3 = *(uint64_t **)(a1 + 16);
    v5 = *v3;
    for (i = *v4; v5 != i; v5 -= 56)
    {
      v7 = *(unsigned int *)(v5 - 16);
      if ((_DWORD)v7 != -1)
        ((void (*)(char *, uint64_t))off_25110DC80[v7])(&v8, v5 - 40);
      *(_DWORD *)(v5 - 16) = -1;
    }
  }
  return a1;
}

void sub_240BD639C(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  *a2 = *a3;
}

void sub_240BD63A8(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  *a2 = *a3;
}

void *sub_240BD63B4(int a1, _QWORD *__dst, __int128 *a3)
{
  __int128 v3;
  void *result;

  if (*((char *)a3 + 23) < 0)
    return sub_240BCD950(__dst, *(void **)a3, *((_QWORD *)a3 + 1));
  v3 = *a3;
  __dst[2] = *((_QWORD *)a3 + 2);
  *(_OWORD *)__dst = v3;
  return result;
}

uint64_t sub_240BD63E0(uint64_t result, _BYTE *a2, _BYTE *a3)
{
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = *(_QWORD *)result;
  v5 = *(unsigned int *)(*(_QWORD *)result + 24);
  if ((_DWORD)v5 != -1)
  {
    if (!(_DWORD)v5)
    {
      *a2 = *a3;
      return result;
    }
    result = ((uint64_t (*)(char *, uint64_t))off_25110DC80[v5])(&v6, v4);
  }
  *(_BYTE *)v4 = *a3;
  *(_DWORD *)(v4 + 24) = 0;
  return result;
}

uint64_t sub_240BD644C(uint64_t result, _QWORD *a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = *(_QWORD *)result;
  v5 = *(unsigned int *)(*(_QWORD *)result + 24);
  if ((_DWORD)v5 != -1)
  {
    if ((_DWORD)v5 == 1)
    {
      *a2 = *a3;
      return result;
    }
    result = ((uint64_t (*)(char *, uint64_t))off_25110DC80[v5])(&v6, v4);
  }
  *(_QWORD *)v4 = *a3;
  *(_DWORD *)(v4 + 24) = 1;
  return result;
}

void **sub_240BD64C0(void ***a1, uint64_t a2, __int128 *a3)
{
  return sub_240BD64C8(*a1, a2, a3);
}

void **sub_240BD64C8(void **result, uint64_t a2, __int128 *a3)
{
  int v3;
  char v4;
  __int128 v5;
  uint64_t v6;
  __int128 *v7;
  size_t v8;
  __int128 v9;
  uint64_t v10;
  char v11;

  v3 = *((_DWORD *)result + 6);
  if (v3 != 2)
  {
    v6 = (uint64_t)result;
    if (*((char *)a3 + 23) < 0)
    {
      result = (void **)sub_240BCD950(&v9, *(void **)a3, *((_QWORD *)a3 + 1));
      v3 = *(_DWORD *)(v6 + 24);
      if (v3 == -1)
      {
LABEL_11:
        *(_OWORD *)v6 = v9;
        *(_QWORD *)(v6 + 16) = v10;
        *(_DWORD *)(v6 + 24) = 2;
        return result;
      }
    }
    else
    {
      v9 = *a3;
      v10 = *((_QWORD *)a3 + 2);
      if (v3 == -1)
        goto LABEL_11;
    }
    result = (void **)((uint64_t (*)(char *, uint64_t))off_25110DC80[v3])(&v11, v6);
    goto LABEL_11;
  }
  if ((__int128 *)a2 != a3)
  {
    v4 = *((_BYTE *)a3 + 23);
    if (*(char *)(a2 + 23) < 0)
    {
      if (v4 >= 0)
        v7 = a3;
      else
        v7 = *(__int128 **)a3;
      if (v4 >= 0)
        v8 = *((unsigned __int8 *)a3 + 23);
      else
        v8 = *((_QWORD *)a3 + 1);
      return sub_240BD1F98((void **)a2, v7, v8);
    }
    else if ((*((_BYTE *)a3 + 23) & 0x80) != 0)
    {
      return (void **)sub_240BD1ED4((_QWORD *)a2, *(void **)a3, *((_QWORD *)a3 + 1));
    }
    else
    {
      v5 = *a3;
      *(_QWORD *)(a2 + 16) = *((_QWORD *)a3 + 2);
      *(_OWORD *)a2 = v5;
    }
  }
  return result;
}

uint64_t sub_240BD65DC(uint64_t a1)
{
  void **v2;
  void **v3;
  uint64_t v4;
  void *v5;
  char v7;

  v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (void **)*v2;
      v4 = *((unsigned int *)v2 + 16);
      if ((_DWORD)v4 != -1)
        ((void (*)(char *, void **))off_25110DC80[v4])(&v7, v2 + 5);
      *((_DWORD *)v2 + 16) = -1;
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v5 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v5)
    operator delete(v5);
  return a1;
}

unsigned __int8 *sub_240BD6688(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _BYTE *v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  void **v15;
  unsigned __int8 *v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  __int128 *v24;
  __int128 v25;
  float v26;
  float v27;
  _BOOL8 v28;
  unint64_t v29;
  unint64_t v30;
  size_t prime;
  int8x8_t v32;
  unint64_t v33;
  uint8x8_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  _QWORD v40[2];
  char v41;

  v6 = (_BYTE *)a2;
  v8 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v9 = v8;
  }
  v10 = sub_240BD6A98((uint64_t)v40, (uint64_t *)a2, v9);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      v4 = v10;
      if (v10 >= v12)
        v4 = v10 % v12;
    }
    else
    {
      v4 = (v12 - 1) & v10;
    }
    v15 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v15)
    {
      v16 = (unsigned __int8 *)*v15;
      if (*v15)
      {
        v17 = v6[23];
        if (v17 >= 0)
          v18 = v6[23];
        else
          v18 = *((_QWORD *)v6 + 1);
        if (v17 < 0)
          v6 = *(_BYTE **)v6;
        do
        {
          v19 = *((_QWORD *)v16 + 1);
          if (v19 == v11)
          {
            v20 = v16[39];
            if ((v20 & 0x80u) == 0)
              v21 = v16[39];
            else
              v21 = *((_QWORD *)v16 + 3);
            if (v21 == v18)
            {
              if ((v20 & 0x80) != 0)
              {
                if (!memcmp(*((const void **)v16 + 2), v6, *((_QWORD *)v16 + 3)))
                  return v16;
              }
              else
              {
                if (!v16[39])
                  return v16;
                v22 = 0;
                while (v16[v22 + 16] == v6[v22])
                {
                  if (v20 == ++v22)
                    return v16;
                }
              }
            }
          }
          else
          {
            if (v14 <= 1)
            {
              v19 &= v12 - 1;
            }
            else if (v19 >= v12)
            {
              v19 %= v12;
            }
            if (v19 != v4)
              break;
          }
          v16 = *(unsigned __int8 **)v16;
        }
        while (v16);
      }
    }
  }
  v23 = (_QWORD *)(a1 + 16);
  v16 = (unsigned __int8 *)operator new(0x48uLL);
  v40[0] = v16;
  v40[1] = a1 + 16;
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = v11;
  v24 = *a4;
  v25 = **a4;
  *((_QWORD *)v16 + 4) = *((_QWORD *)*a4 + 2);
  *((_OWORD *)v16 + 1) = v25;
  *((_QWORD *)v24 + 1) = 0;
  *((_QWORD *)v24 + 2) = 0;
  *(_QWORD *)v24 = 0;
  v16[40] = 0;
  *((_DWORD *)v16 + 16) = 0;
  v41 = 1;
  v26 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v27 = *(float *)(a1 + 32);
  if (!v12 || (float)(v27 * (float)v12) < v26)
  {
    v28 = 1;
    if (v12 >= 3)
      v28 = (v12 & (v12 - 1)) != 0;
    v29 = v28 | (2 * v12);
    v30 = vcvtps_u32_f32(v26 / v27);
    if (v29 <= v30)
      prime = v30;
    else
      prime = v29;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
    }
    v32 = *(int8x8_t *)(a1 + 8);
    if (prime > *(_QWORD *)&v32)
      goto LABEL_49;
    if (prime < *(_QWORD *)&v32)
    {
      v33 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(_QWORD *)&v32 < 3uLL || (v34 = (uint8x8_t)vcnt_s8(v32), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
      {
        v33 = std::__next_prime(v33);
      }
      else
      {
        v35 = 1 << -(char)__clz(v33 - 1);
        if (v33 >= 2)
          v33 = v35;
      }
      if (prime <= v33)
        prime = v33;
      if (prime < *(_QWORD *)&v32)
LABEL_49:
        sub_240BD6ED0(a1, prime);
    }
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v4 = v11 % v12;
      else
        v4 = v11;
    }
    else
    {
      v4 = (v12 - 1) & v11;
    }
  }
  v36 = *(_QWORD *)a1;
  v37 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v37)
  {
    *(_QWORD *)v16 = *v37;
LABEL_73:
    *v37 = v16;
    goto LABEL_74;
  }
  *(_QWORD *)v16 = *v23;
  *v23 = v16;
  *(_QWORD *)(v36 + 8 * v4) = v23;
  if (*(_QWORD *)v16)
  {
    v38 = *(_QWORD *)(*(_QWORD *)v16 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v38 >= v12)
        v38 %= v12;
    }
    else
    {
      v38 &= v12 - 1;
    }
    v37 = (_QWORD *)(*(_QWORD *)a1 + 8 * v38);
    goto LABEL_73;
  }
LABEL_74:
  ++*(_QWORD *)(a1 + 24);
  return v16;
}

void sub_240BD69FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_240BD6A14((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_240BD6A14(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  char v5;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((_BYTE *)a1 + 16))
    {
      v3 = *(unsigned int *)(v2 + 64);
      if ((_DWORD)v3 != -1)
        ((void (*)(char *, uint64_t))off_25110DC80[v3])(&v5, v2 + 40);
      *(_DWORD *)(v2 + 64) = -1;
      if (*(char *)(v2 + 39) < 0)
        operator delete(*(void **)(v2 + 16));
    }
    operator delete((void *)v2);
  }
  return a1;
}

unint64_t sub_240BD6A98(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;

  if (a3 > 0x20)
  {
    if (a3 <= 0x40)
    {
      v6 = *(uint64_t *)((char *)a2 + a3 - 16);
      v7 = *a2 - 0x3C5A37A36834CED9 * (v6 + a3);
      v9 = a2[2];
      v8 = a2[3];
      v10 = __ROR8__(v7 + v8, 52);
      v11 = v7 + a2[1];
      v12 = __ROR8__(v11, 7);
      v13 = v11 + v9;
      v14 = *(uint64_t *)((char *)a2 + a3 - 32) + v9;
      v15 = *(uint64_t *)((char *)a2 + a3 - 8) + v8;
      v16 = __ROR8__(v15 + v14, 52);
      v17 = v12 + __ROR8__(*a2 - 0x3C5A37A36834CED9 * (v6 + a3), 37) + v10 + __ROR8__(v13, 31);
      v18 = *(uint64_t *)((char *)a2 + a3 - 24) + v14 + v6;
      v19 = v18 + v15;
      v20 = 0x9AE16A3B2F90404FLL;
      v21 = 0xC3A5C85C97CB3127 * (v19 + v17)
          - 0x651E95C4D06FBFB1
          * (v13
           + v8
           + __ROR8__(v14, 37)
           + __ROR8__(*(uint64_t *)((char *)a2 + a3 - 24) + v14, 7)
           + v16
           + __ROR8__(v18, 31));
      v22 = v17 - 0x3C5A37A36834CED9 * (v21 ^ (v21 >> 47));
      return (v22 ^ (v22 >> 47)) * v20;
    }
    v29 = *(uint64_t *)((char *)a2 + a3 - 48);
    v30 = *(uint64_t *)((char *)a2 + a3 - 40);
    v31 = *(uint64_t *)((char *)a2 + a3 - 24);
    v33 = *(uint64_t *)((char *)a2 + a3 - 64);
    v32 = *(uint64_t *)((char *)a2 + a3 - 56);
    v34 = *(uint64_t *)((char *)a2 + a3 - 16);
    v35 = *(uint64_t *)((char *)a2 + a3 - 8);
    v36 = v32 + v34;
    v37 = 0x9DDFEA08EB382D69
        * (v31 ^ ((0x9DDFEA08EB382D69 * (v31 ^ (v29 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v31 ^ (v29 + a3))));
    v38 = 0x9DDFEA08EB382D69 * (v37 ^ (v37 >> 47));
    v39 = v33 + a3 + v32 + v29;
    v40 = v39 + v30;
    v41 = __ROR8__(v39, 44) + v33 + a3 + __ROR8__(v30 + v33 + a3 - 0x622015F714C7D297 * (v37 ^ (v37 >> 47)), 21);
    v42 = v32 + v34 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
    v43 = v42 + v31 + v34;
    v44 = __ROR8__(v43, 44);
    v45 = v43 + v35;
    v46 = v44 + v42 + __ROR8__(v42 + v30 + v35, 21);
    v48 = *a2;
    v47 = a2 + 4;
    v49 = v48 - 0x4B6D499041670D8DLL * v30;
    v50 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      v51 = *(v47 - 3);
      v52 = v49 + v40 + v36 + v51;
      v53 = v47[2];
      v54 = v47[3];
      v55 = v47[1];
      v36 = v55 + v40 - 0x4B6D499041670D8DLL * __ROR8__(v36 + v41 + v53, 42);
      v56 = v38 + v45;
      v57 = *(v47 - 2);
      v58 = *(v47 - 1);
      v59 = *(v47 - 4) - 0x4B6D499041670D8DLL * v41;
      v60 = v59 + v45 + v58;
      v61 = v59 + v51 + v57;
      v40 = v61 + v58;
      v62 = __ROR8__(v61, 44) + v59;
      v63 = (0xB492B66FBE98F273 * __ROR8__(v52, 37)) ^ v46;
      v49 = 0xB492B66FBE98F273 * __ROR8__(v56, 33);
      v41 = v62 + __ROR8__(v60 + v63, 21);
      v64 = v49 + v46 + *v47;
      v45 = v64 + v55 + v53 + v54;
      v46 = __ROR8__(v64 + v55 + v53, 44) + v64 + __ROR8__(v36 + v57 + v64 + v54, 21);
      v47 += 8;
      v38 = v63;
      v50 += 64;
    }
    while (v50);
    v65 = v49
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v46 ^ ((0x9DDFEA08EB382D69 * (v46 ^ v41)) >> 47) ^ (0x9DDFEA08EB382D69 * (v46 ^ v41)))) ^ ((0x9DDFEA08EB382D69 * (v46 ^ ((0x9DDFEA08EB382D69 * (v46 ^ v41)) >> 47) ^ (0x9DDFEA08EB382D69 * (v46 ^ v41)))) >> 47));
    v66 = 0x9DDFEA08EB382D69
        * (v65 ^ (v63
                - 0x4B6D499041670D8DLL * (v36 ^ (v36 >> 47))
                - 0x622015F714C7D297
                * ((0x9DDFEA08EB382D69
                  * (v45 ^ ((0x9DDFEA08EB382D69 * (v45 ^ v40)) >> 47) ^ (0x9DDFEA08EB382D69 * (v45 ^ v40)))) ^ ((0x9DDFEA08EB382D69 * (v45 ^ ((0x9DDFEA08EB382D69 * (v45 ^ v40)) >> 47) ^ (0x9DDFEA08EB382D69 * (v45 ^ v40)))) >> 47))));
    return 0x9DDFEA08EB382D69
         * ((0x9DDFEA08EB382D69 * (v65 ^ (v66 >> 47) ^ v66)) ^ ((0x9DDFEA08EB382D69 * (v65 ^ (v66 >> 47) ^ v66)) >> 47));
  }
  else
  {
    if (a3 > 0x10)
    {
      v23 = a2[1];
      v24 = 0xB492B66FBE98F273 * *a2;
      v25 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a2 + a3 - 8), 30) + __ROR8__(v24 - v23, 43);
      v26 = v24
          + a3
          + __ROR8__(v23 ^ 0xC949D7C7509E6557, 20)
          - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a2 + a3 - 8);
      v20 = 0x9DDFEA08EB382D69;
      v27 = 0x9DDFEA08EB382D69 * ((v25 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a2 + a3 - 16)) ^ v26);
      v28 = v26 ^ (v27 >> 47) ^ v27;
LABEL_8:
      v22 = 0x9DDFEA08EB382D69 * v28;
      return (v22 ^ (v22 >> 47)) * v20;
    }
    if (a3 >= 9)
    {
      v3 = *(uint64_t *)((char *)a2 + a3 - 8);
      v4 = __ROR8__(v3 + a3, a3);
      return (0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a2)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a2)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a2)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a2)))) >> 47))) ^ v3;
    }
    if (a3 >= 4)
    {
      v67 = *(unsigned int *)((char *)a2 + a3 - 4);
      v20 = 0x9DDFEA08EB382D69;
      v68 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a2) + a3) ^ v67);
      v28 = v67 ^ (v68 >> 47) ^ v68;
      goto LABEL_8;
    }
    result = 0x9AE16A3B2F90404FLL;
    if (a3)
    {
      v69 = (0xC949D7C7509E6557 * (a3 + 4 * *((unsigned __int8 *)a2 + a3 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                     * (*(unsigned __int8 *)a2 | ((unint64_t)*((unsigned __int8 *)a2 + (a3 >> 1)) << 8)));
      return 0x9AE16A3B2F90404FLL * (v69 ^ (v69 >> 47));
    }
  }
  return result;
}

void sub_240BD6ED0(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;

  if (a2)
  {
    if (a2 >> 61)
      sub_240BCB680();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v13 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v13 >= a2)
              v13 %= a2;
          }
          else
          {
            v13 &= a2 - 1;
          }
          if (v13 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v13))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v13) = v7;
              goto LABEL_19;
            }
            *v7 = *v11;
            v12 = 8 * v13;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + v12);
            **(_QWORD **)(*(_QWORD *)a1 + v12) = v11;
            v11 = v7;
          }
          v13 = v8;
LABEL_19:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v13;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

uint64_t *sub_240BD702C(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _BYTE *v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  uint64_t **v15;
  uint64_t *v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  _BYTE *v24;
  __int128 *v25;
  __int128 v26;
  float v27;
  float v28;
  _BOOL8 v29;
  unint64_t v30;
  unint64_t v31;
  size_t prime;
  int8x8_t v33;
  unint64_t v34;
  uint8x8_t v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  _QWORD v40[2];
  char v41;

  v6 = (_BYTE *)a2;
  v8 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v9 = v8;
  }
  v10 = sub_240BD6A98((uint64_t)v40, (uint64_t *)a2, v9);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      v4 = v10;
      if (v10 >= v12)
        v4 = v10 % v12;
    }
    else
    {
      v4 = (v12 - 1) & v10;
    }
    v15 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v15)
    {
      v16 = *v15;
      if (*v15)
      {
        v17 = v6[23];
        if (v17 >= 0)
          v18 = v6[23];
        else
          v18 = *((_QWORD *)v6 + 1);
        if (v17 < 0)
          v6 = *(_BYTE **)v6;
        do
        {
          v19 = v16[1];
          if (v19 == v11)
          {
            v20 = *((unsigned __int8 *)v16 + 39);
            if ((v20 & 0x80u) == 0)
              v21 = *((unsigned __int8 *)v16 + 39);
            else
              v21 = v16[3];
            if (v21 == v18)
            {
              if ((v20 & 0x80) != 0)
              {
                if (!memcmp((const void *)v16[2], v6, v16[3]))
                  return v16;
              }
              else
              {
                if (!*((_BYTE *)v16 + 39))
                  return v16;
                v22 = 0;
                while (*((unsigned __int8 *)v16 + v22 + 16) == v6[v22])
                {
                  if (v20 == ++v22)
                    return v16;
                }
              }
            }
          }
          else
          {
            if (v14 <= 1)
            {
              v19 &= v12 - 1;
            }
            else if (v19 >= v12)
            {
              v19 %= v12;
            }
            if (v19 != v4)
              break;
          }
          v16 = (uint64_t *)*v16;
        }
        while (v16);
      }
    }
  }
  v23 = (char *)operator new(0x48uLL);
  v40[0] = v23;
  v40[1] = a1 + 16;
  v41 = 0;
  *(_QWORD *)v23 = 0;
  *((_QWORD *)v23 + 1) = v11;
  v24 = v23 + 16;
  v25 = *a4;
  if (*((char *)*a4 + 23) < 0)
  {
    sub_240BCD950(v24, *(void **)v25, *((_QWORD *)v25 + 1));
  }
  else
  {
    v26 = *v25;
    *((_QWORD *)v23 + 4) = *((_QWORD *)v25 + 2);
    *(_OWORD *)v24 = v26;
  }
  v23[40] = 0;
  *((_DWORD *)v23 + 16) = 0;
  v41 = 1;
  v27 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v28 = *(float *)(a1 + 32);
  if (!v12 || (float)(v28 * (float)v12) < v27)
  {
    v29 = 1;
    if (v12 >= 3)
      v29 = (v12 & (v12 - 1)) != 0;
    v30 = v29 | (2 * v12);
    v31 = vcvtps_u32_f32(v27 / v28);
    if (v30 <= v31)
      prime = v31;
    else
      prime = v30;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
    }
    v33 = *(int8x8_t *)(a1 + 8);
    if (prime > *(_QWORD *)&v33)
      goto LABEL_52;
    if (prime < *(_QWORD *)&v33)
    {
      v34 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(_QWORD *)&v33 < 3uLL || (v35 = (uint8x8_t)vcnt_s8(v33), v35.i16[0] = vaddlv_u8(v35), v35.u32[0] > 1uLL))
      {
        v34 = std::__next_prime(v34);
      }
      else
      {
        v36 = 1 << -(char)__clz(v34 - 1);
        if (v34 >= 2)
          v34 = v36;
      }
      if (prime <= v34)
        prime = v34;
      if (prime < *(_QWORD *)&v33)
LABEL_52:
        sub_240BD6ED0(a1, prime);
    }
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v4 = v11 % v12;
      else
        v4 = v11;
    }
    else
    {
      v4 = (v12 - 1) & v11;
    }
  }
  v37 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v37)
  {
    *(_QWORD *)v40[0] = *v37;
    *v37 = v40[0];
  }
  else
  {
    *(_QWORD *)v40[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v40[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v40[0])
    {
      v38 = *(_QWORD *)(*(_QWORD *)v40[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v38 >= v12)
          v38 %= v12;
      }
      else
      {
        v38 &= v12 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v38) = v40[0];
    }
  }
  v16 = (uint64_t *)v40[0];
  ++*(_QWORD *)(a1 + 24);
  return v16;
}

void sub_240BD73C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_240BD6A14((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_240BD73E4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7F8];
  v3 = *MEMORY[0x24BEDB7F8];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F8];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 16) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 103) < 0)
    operator delete(*(void **)(a1 + 80));
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x24268B35C](a1 + 120);
  return a1;
}

uint64_t sub_240BD7468(uint64_t a1, __int128 *a2, int a3)
{
  uint64_t v6;
  __int128 v7;

  v6 = std::streambuf::basic_streambuf();
  *(_QWORD *)v6 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  if ((__int128 *)(v6 + 64) != a2)
  {
    if (*((char *)a2 + 23) < 0)
    {
      sub_240BD1ED4((_QWORD *)(v6 + 64), *(void **)a2, *((_QWORD *)a2 + 1));
    }
    else
    {
      v7 = *a2;
      *(_QWORD *)(v6 + 80) = *((_QWORD *)a2 + 2);
      *(_OWORD *)(v6 + 64) = v7;
    }
  }
  sub_240BD751C(a1);
  return a1;
}

void sub_240BD74F8(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 87) < 0)
    operator delete(*v2);
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

std::string *sub_240BD751C(uint64_t a1)
{
  std::string *result;
  unint64_t v3;
  std::string *v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  *(_QWORD *)(a1 + 88) = 0;
  result = (std::string *)(a1 + 64);
  v3 = *(unsigned __int8 *)(a1 + 87);
  if ((*(char *)(a1 + 87) & 0x80000000) == 0)
  {
    v4 = result;
    v5 = *(unsigned __int8 *)(a1 + 87);
    v6 = *(_DWORD *)(a1 + 96);
    if ((v6 & 8) == 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = *(std::string **)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
LABEL_3:
    *(_QWORD *)(a1 + 88) = (char *)v4 + v5;
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = (char *)v4 + v5;
  }
LABEL_4:
  if ((v6 & 0x10) == 0)
    return result;
  *(_QWORD *)(a1 + 88) = (char *)v4 + v5;
  if ((v3 & 0x80) != 0)
  {
    v3 = *(_QWORD *)(a1 + 72);
    v7 = (*(_QWORD *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v3 >= v7)
    {
      result = *(std::string **)(a1 + 64);
      *(_QWORD *)(a1 + 72) = v7;
LABEL_14:
      result->__r_.__value_.__s.__data_[v7] = 0;
      LODWORD(v8) = *(char *)(a1 + 87);
      if ((v8 & 0x80000000) != 0)
        goto LABEL_15;
LABEL_12:
      v8 = v8;
      goto LABEL_16;
    }
  }
  else
  {
    v7 = 22;
    if (v3 > 0x15)
    {
      *(_BYTE *)(a1 + 87) = 22;
      goto LABEL_14;
    }
  }
  result = std::string::append(result, v7 - v3, 0);
  LODWORD(v8) = *(char *)(a1 + 87);
  if ((v8 & 0x80000000) == 0)
    goto LABEL_12;
LABEL_15:
  v8 = *(_QWORD *)(a1 + 72);
LABEL_16:
  *(_QWORD *)(a1 + 40) = v4;
  *(_QWORD *)(a1 + 48) = v4;
  *(_QWORD *)(a1 + 56) = (char *)v4 + v8;
  if ((*(_BYTE *)(a1 + 96) & 3) != 0)
  {
    if (v5 >> 31)
    {
      v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
      v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
      v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
      v5 = v5 - v10 - 0x7FFFFFFF;
      *(_QWORD *)(a1 + 48) = v4;
    }
    if (v5)
      *(_QWORD *)(a1 + 48) = (char *)v4 + v5;
  }
  return result;
}

uint64_t *sub_240BD7660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  _BYTE *v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  uint64_t **v14;
  uint64_t *v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  float v23;
  _BOOL8 v24;
  unint64_t v25;
  unint64_t v26;
  size_t prime;
  int8x8_t v28;
  unint64_t v29;
  uint8x8_t v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  _QWORD v35[3];

  v5 = (_BYTE *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v8 = v7;
  }
  v9 = sub_240BD6A98((uint64_t)v35, (uint64_t *)a2, v8);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v3 = v9;
      if (v9 >= v11)
        v3 = v9 % v11;
    }
    else
    {
      v3 = (v11 - 1) & v9;
    }
    v14 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v3);
    if (v14)
    {
      v15 = *v14;
      if (*v14)
      {
        v16 = v5[23];
        if (v16 >= 0)
          v17 = v5[23];
        else
          v17 = *((_QWORD *)v5 + 1);
        if (v16 < 0)
          v5 = *(_BYTE **)v5;
        do
        {
          v18 = v15[1];
          if (v18 == v10)
          {
            v19 = *((unsigned __int8 *)v15 + 39);
            if ((v19 & 0x80u) == 0)
              v20 = *((unsigned __int8 *)v15 + 39);
            else
              v20 = v15[3];
            if (v20 == v17)
            {
              if ((v19 & 0x80) != 0)
              {
                if (!memcmp((const void *)v15[2], v5, v15[3]))
                  return v15;
              }
              else
              {
                if (!*((_BYTE *)v15 + 39))
                  return v15;
                v21 = 0;
                while (*((unsigned __int8 *)v15 + v21 + 16) == v5[v21])
                {
                  if (v19 == ++v21)
                    return v15;
                }
              }
            }
          }
          else
          {
            if (v13 <= 1)
            {
              v18 &= v11 - 1;
            }
            else if (v18 >= v11)
            {
              v18 %= v11;
            }
            if (v18 != v3)
              break;
          }
          v15 = (uint64_t *)*v15;
        }
        while (v15);
      }
    }
  }
  sub_240BD79DC(a1, v10, a3, (uint64_t)v35);
  v22 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v23 = *(float *)(a1 + 32);
  if (!v11 || (float)(v23 * (float)v11) < v22)
  {
    v24 = 1;
    if (v11 >= 3)
      v24 = (v11 & (v11 - 1)) != 0;
    v25 = v24 | (2 * v11);
    v26 = vcvtps_u32_f32(v22 / v23);
    if (v25 <= v26)
      prime = v26;
    else
      prime = v25;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
    }
    v28 = *(int8x8_t *)(a1 + 8);
    if (prime > *(_QWORD *)&v28)
      goto LABEL_49;
    if (prime < *(_QWORD *)&v28)
    {
      v29 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(_QWORD *)&v28 < 3uLL || (v30 = (uint8x8_t)vcnt_s8(v28), v30.i16[0] = vaddlv_u8(v30), v30.u32[0] > 1uLL))
      {
        v29 = std::__next_prime(v29);
      }
      else
      {
        v31 = 1 << -(char)__clz(v29 - 1);
        if (v29 >= 2)
          v29 = v31;
      }
      if (prime <= v29)
        prime = v29;
      if (prime < *(_QWORD *)&v28)
LABEL_49:
        sub_240BD6ED0(a1, prime);
    }
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v3 = v10 % v11;
      else
        v3 = v10;
    }
    else
    {
      v3 = (v11 - 1) & v10;
    }
  }
  v32 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v32)
  {
    *(_QWORD *)v35[0] = *v32;
    *v32 = v35[0];
  }
  else
  {
    *(_QWORD *)v35[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v35[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v35[0])
    {
      v33 = *(_QWORD *)(*(_QWORD *)v35[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v33 >= v11)
          v33 %= v11;
      }
      else
      {
        v33 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v33) = v35[0];
    }
  }
  v15 = (uint64_t *)v35[0];
  ++*(_QWORD *)(a1 + 24);
  return v15;
}

void sub_240BD79C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_240BD6A14((uint64_t *)va);
  _Unwind_Resume(a1);
}

_BYTE *sub_240BD79DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  _BYTE *result;
  uint64_t v10;
  char v11;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x48uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  result = v8 + 16;
  if (*(char *)(a3 + 23) < 0)
  {
    result = sub_240BCD950(result, *(void **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)result = *(_OWORD *)a3;
    *((_QWORD *)v8 + 4) = *(_QWORD *)(a3 + 16);
  }
  v8[40] = 0;
  *((_DWORD *)v8 + 16) = -1;
  v10 = *(unsigned int *)(a3 + 48);
  if ((_DWORD)v10 != -1)
  {
    result = (_BYTE *)((uint64_t (*)(char *))off_25110DCC8[v10])(&v11);
    *((_DWORD *)v8 + 16) = v10;
  }
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_240BD7A98(_Unwind_Exception *a1)
{
  uint64_t *v1;

  sub_240BD6A14(v1);
  _Unwind_Resume(a1);
}

void sub_240BD7AB0(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  *a2 = *a3;
}

void sub_240BD7ABC(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  *a2 = *a3;
}

__n128 sub_240BD7AC8(uint64_t a1, __n128 *a2, __n128 *a3)
{
  __n128 result;

  result = *a3;
  a2[1].n128_u64[0] = a3[1].n128_u64[0];
  *a2 = result;
  a3->n128_u64[1] = 0;
  a3[1].n128_u64[0] = 0;
  a3->n128_u64[0] = 0;
  return result;
}

void sub_240BD7AE8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v5;
  uint64_t *v6;
  int v7;
  size_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  const char *v14;
  uint64_t *v15;
  uint64_t v16;
  const char *v17;
  void *__p;
  size_t v19;
  unint64_t v20;
  char v21;

  v5 = (_QWORD *)(a1 + 8);
  v6 = sub_240BD90D0((_QWORD *)(a1 + 8), a2);
  if (v6)
    goto LABEL_18;
  v7 = *(char *)(a2 + 23);
  if (v7 >= 0)
    v8 = *(unsigned __int8 *)(a2 + 23);
  else
    v8 = *(_QWORD *)(a2 + 8);
  v9 = v8 + 2;
  if (v8 + 2 >= 0x7FFFFFFFFFFFFFF8)
    sub_240BC9D74();
  if (v9 >= 0x17)
  {
    v11 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17)
      v11 = v9 | 7;
    v12 = v11 + 1;
    v13 = (char *)operator new(v11 + 1);
    v19 = v8 + 2;
    v20 = v12 | 0x8000000000000000;
    __p = v13;
    *(_WORD *)v13 = 11565;
    v10 = v13 + 2;
  }
  else
  {
    v19 = 0;
    v20 = 0;
    HIBYTE(v20) = v8 + 2;
    v10 = (char *)&__p + 2;
    __p = (void *)11565;
    if (!v8)
      goto LABEL_16;
  }
  if (v7 >= 0)
    v14 = (const char *)a2;
  else
    v14 = *(const char **)a2;
  memmove(v10, v14, v8);
LABEL_16:
  v10[v8] = 0;
  v15 = sub_240BD90D0(v5, (uint64_t)&__p);
  v6 = v15;
  if (SHIBYTE(v20) < 0)
  {
    operator delete(__p);
    if (v6)
    {
LABEL_18:
      *(_BYTE *)a3 = 0;
      *(_DWORD *)(a3 + 24) = -1;
      v16 = *((unsigned int *)v6 + 16);
      if ((_DWORD)v16 != -1)
      {
        ((void (*)(char *, uint64_t, uint64_t *))off_25110DCF8[v16])(&v21, a3, v6 + 5);
        *(_DWORD *)(a3 + 24) = v16;
      }
      return;
    }
  }
  else if (v15)
  {
    goto LABEL_18;
  }
  if (*(char *)(a2 + 23) >= 0)
    v17 = (const char *)a2;
  else
    v17 = *(const char **)a2;
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "ICE: option '%s' not found.\n", v17);
  *(_BYTE *)a3 = 0;
  *(_DWORD *)(a3 + 24) = 0;
}

void sub_240BD7C80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_240BD7C9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t v11;
  uint64_t v13;

  v13 = *(unsigned int *)(v11 + 24);
  if ((_DWORD)v13 != -1)
    ((void (*)(char *, uint64_t))off_25110DCE0[v13])(&a11, v11);
  *(_DWORD *)(v11 + 24) = -1;
  _Unwind_Resume(exception_object);
}

uint64_t sub_240BD7CD8(uint64_t a1, uint64_t a2)
{
  _BYTE v3[24];
  int v4;

  sub_240BD7AE8(a1, a2, (uint64_t)v3);
  if (v4)
    sub_240BD8E00();
  return v3[0];
}

void sub_240BD7D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_240BD7D28((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_240BD7D28(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 24);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))off_25110DCE0[v2])(&v4, a1);
  *(_DWORD *)(a1 + 24) = -1;
  return a1;
}

uint64_t sub_240BD7D80(uint64_t a1, uint64_t a2)
{
  _QWORD v3[3];
  int v4;

  sub_240BD7AE8(a1, a2, (uint64_t)v3);
  if (v4 != 1)
    sub_240BD8E00();
  return v3[0];
}

void sub_240BD7DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_240BD7D28((uint64_t)&a9);
  _Unwind_Resume(a1);
}

double sub_240BD7DD4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double result;
  __int128 v5;
  uint64_t v6;
  int v7;

  sub_240BD7AE8(a1, a2, (uint64_t)&v5);
  if (v7 != 2)
    sub_240BD8E00();
  result = *(double *)&v5;
  *(_OWORD *)a3 = v5;
  *(_QWORD *)(a3 + 16) = v6;
  return result;
}

void sub_240BD7E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_240BD7D28((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_240BD7E38(char **a1, __int128 *a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  std::ios_base *v10;
  std::string::value_type v11;
  std::string::value_type v12;
  std::string::size_type size;
  std::string::size_type v14;
  char *v15;
  __int128 v16;
  std::string::size_type v17;
  std::string *v18;
  std::string::size_type v19;
  char *v20;
  __int128 v21;
  std::string::size_type v22;
  std::string *v23;
  std::string::size_type v24;
  char *v25;
  __int128 v26;
  std::string::size_type v27;
  void *v28;
  void *v29;
  uint64_t v30;
  std::string *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char v35;
  std::ios_base *v36;
  const std::locale::facet *v37;
  std::string *p_dst;
  uint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  uint64_t **v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  std::string __p;
  std::string v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[8];
  void *v53;
  char v54;
  _QWORD v55[19];
  char *v56;
  char *v57;
  unint64_t v58;
  std::locale v59;
  std::string v60;
  std::string *v61;
  std::string __dst;
  std::string v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a1 + 7;
  v43 = (uint64_t **)(a1 + 6);
  sub_240BCD774((uint64_t)(a1 + 6), a1[7]);
  *(v4 - 1) = v4;
  *v4 = 0;
  v4[1] = 0;
  v56 = 0;
  v57 = 0;
  v58 = 0;
  v5 = MEMORY[0x24BEDB868];
  v6 = MEMORY[0x24BEDB868] + 64;
  v7 = MEMORY[0x24BEDB7F8];
  v8 = *(void **)(MEMORY[0x24BEDB7F8] + 8);
  v9 = *(void **)(MEMORY[0x24BEDB7F8] + 16);
  v55[0] = MEMORY[0x24BEDB868] + 64;
  v50 = v8;
  v46 = v9;
  v47 = v8;
  *(void **)((char *)&v50 + *((_QWORD *)v8 - 3)) = v9;
  v51 = 0;
  v10 = (std::ios_base *)((char *)&v50 + *((_QWORD *)v50 - 3));
  std::ios_base::init(v10, v52);
  v10[1].__vftable = 0;
  v10[1].__fmtflags_ = -1;
  v50 = (void *)(v5 + 24);
  v55[0] = v6;
  sub_240BD7468((uint64_t)v52, a2, 8);
  v11 = 0;
  memset(&v49, 0, sizeof(v49));
  memset(&__p, 0, sizeof(__p));
  do
  {
    v12 = std::istream::get();
    if (v12 <= 33)
    {
      if (v12 != -1)
      {
        if (v12 != 32 || v11)
        {
LABEL_3:
          std::string::append(&v49, 1uLL, v12);
          continue;
        }
        size = HIBYTE(v49.__r_.__value_.__r.__words[2]);
        if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          size = v49.__r_.__value_.__l.__size_;
        if (!size)
        {
LABEL_21:
          v11 = 0;
          continue;
        }
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        {
          sub_240BCD950(&__dst, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          if ((*((_BYTE *)&v49.__r_.__value_.__s + 23) & 0x80) != 0)
            goto LABEL_52;
LABEL_19:
          v63 = v49;
        }
        else
        {
          __dst = __p;
          if ((*((_BYTE *)&v49.__r_.__value_.__s + 23) & 0x80) == 0)
            goto LABEL_19;
LABEL_52:
          sub_240BCD950(&v63, v49.__r_.__value_.__l.__data_, v49.__r_.__value_.__l.__size_);
        }
        v20 = v57;
        if ((unint64_t)v57 >= v58)
        {
          v57 = sub_240BD8E38((void **)&v56, (uint64_t)&__dst);
          if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(v63.__r_.__value_.__l.__data_);
            if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              goto LABEL_58;
          }
          else if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
            goto LABEL_58;
          }
LABEL_55:
          operator delete(__dst.__r_.__value_.__l.__data_);
        }
        else
        {
          v21 = *(_OWORD *)&__dst.__r_.__value_.__l.__data_;
          *((_QWORD *)v57 + 2) = *((_QWORD *)&__dst.__r_.__value_.__l + 2);
          *(_OWORD *)v20 = v21;
          memset(&__dst, 0, sizeof(__dst));
          v22 = v63.__r_.__value_.__r.__words[2];
          *(_OWORD *)(v20 + 24) = *(_OWORD *)&v63.__r_.__value_.__l.__data_;
          *((_QWORD *)v20 + 5) = v22;
          memset(&v63, 0, sizeof(v63));
          v57 = v20 + 48;
          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
            goto LABEL_55;
        }
LABEL_58:
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        {
          if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v23 = &v49;
          else
            v23 = (std::string *)v49.__r_.__value_.__r.__words[0];
          if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v24 = HIBYTE(v49.__r_.__value_.__r.__words[2]);
          else
            v24 = v49.__r_.__value_.__l.__size_;
          sub_240BD1F98((void **)&__p.__r_.__value_.__l.__data_, v23, v24);
        }
        else
        {
          if ((*((_BYTE *)&v49.__r_.__value_.__s + 23) & 0x80) == 0)
          {
            __p = v49;
LABEL_70:
            v11 = 0;
LABEL_71:
            *((_BYTE *)&v49.__r_.__value_.__s + 23) = 0;
            v49.__r_.__value_.__s.__data_[0] = 0;
            continue;
          }
          sub_240BD1ED4(&__p, v49.__r_.__value_.__l.__data_, v49.__r_.__value_.__l.__size_);
        }
        if ((SHIBYTE(v49.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_70;
        v11 = 0;
        goto LABEL_73;
      }
    }
    else
    {
      if (v12 == 34 || v12 == 39)
      {
        if (v12 == v11)
          goto LABEL_21;
        if (v11)
          goto LABEL_3;
        v11 = v12;
        continue;
      }
      if (v12 != 92)
        goto LABEL_3;
      v12 = std::istream::get();
      if (v12 != -1)
        goto LABEL_3;
    }
    v14 = HIBYTE(v49.__r_.__value_.__r.__words[2]);
    if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v14 = v49.__r_.__value_.__l.__size_;
    if (v14)
    {
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        sub_240BCD950(&__dst, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        if ((*((_BYTE *)&v49.__r_.__value_.__s + 23) & 0x80) != 0)
          goto LABEL_30;
LABEL_27:
        v63 = v49;
      }
      else
      {
        __dst = __p;
        if ((*((_BYTE *)&v49.__r_.__value_.__s + 23) & 0x80) == 0)
          goto LABEL_27;
LABEL_30:
        sub_240BCD950(&v63, v49.__r_.__value_.__l.__data_, v49.__r_.__value_.__l.__size_);
      }
      v15 = v57;
      if ((unint64_t)v57 >= v58)
      {
        v57 = sub_240BD8E38((void **)&v56, (uint64_t)&__dst);
        if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v63.__r_.__value_.__l.__data_);
          if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_36;
        }
        else if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
          goto LABEL_36;
        }
LABEL_33:
        operator delete(__dst.__r_.__value_.__l.__data_);
        goto LABEL_36;
      }
      v16 = *(_OWORD *)&__dst.__r_.__value_.__l.__data_;
      *((_QWORD *)v57 + 2) = *((_QWORD *)&__dst.__r_.__value_.__l + 2);
      *(_OWORD *)v15 = v16;
      memset(&__dst, 0, sizeof(__dst));
      v17 = v63.__r_.__value_.__r.__words[2];
      *(_OWORD *)(v15 + 24) = *(_OWORD *)&v63.__r_.__value_.__l.__data_;
      *((_QWORD *)v15 + 5) = v17;
      memset(&v63, 0, sizeof(v63));
      v57 = v15 + 48;
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
        goto LABEL_33;
LABEL_36:
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v18 = &v49;
        else
          v18 = (std::string *)v49.__r_.__value_.__r.__words[0];
        if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v19 = HIBYTE(v49.__r_.__value_.__r.__words[2]);
        else
          v19 = v49.__r_.__value_.__l.__size_;
        sub_240BD1F98((void **)&__p.__r_.__value_.__l.__data_, v18, v19);
      }
      else
      {
        if ((*((_BYTE *)&v49.__r_.__value_.__s + 23) & 0x80) == 0)
        {
          __p = v49;
          goto LABEL_71;
        }
        sub_240BD1ED4(&__p, v49.__r_.__value_.__l.__data_, v49.__r_.__value_.__l.__size_);
      }
      if ((SHIBYTE(v49.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_71;
LABEL_73:
      v49.__r_.__value_.__l.__size_ = 0;
      *v49.__r_.__value_.__l.__data_ = 0;
    }
  }
  while ((*((_BYTE *)&v52[2] + *((_QWORD *)v50 - 3)) & 2) == 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    sub_240BCD950(&v60, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v60 = __p;
  v61 = (std::string *)"";
  sub_240BD8FE8((uint64_t)&__dst, (__int128 *)&v60);
  v25 = v57;
  if ((unint64_t)v57 < v58)
  {
    v26 = *(_OWORD *)&__dst.__r_.__value_.__l.__data_;
    *((_QWORD *)v57 + 2) = *((_QWORD *)&__dst.__r_.__value_.__l + 2);
    *(_OWORD *)v25 = v26;
    *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = 0uLL;
    v27 = v63.__r_.__value_.__r.__words[2];
    *(_OWORD *)(v25 + 24) = *(_OWORD *)&v63.__r_.__value_.__l.__data_;
    *((_QWORD *)v25 + 5) = v27;
    __dst.__r_.__value_.__r.__words[2] = 0;
    memset(&v63, 0, sizeof(v63));
    v57 = v25 + 48;
    goto LABEL_87;
  }
  v57 = sub_240BD8E38((void **)&v56, (uint64_t)&__dst);
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v63.__r_.__value_.__l.__data_);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_81;
LABEL_87:
    if ((SHIBYTE(v60.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_88;
LABEL_82:
    operator delete(v60.__r_.__value_.__l.__data_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_83;
LABEL_89:
    if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
LABEL_84:
      operator delete(v49.__r_.__value_.__l.__data_);
  }
  else
  {
    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_87;
LABEL_81:
    operator delete(__dst.__r_.__value_.__l.__data_);
    if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_82;
LABEL_88:
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_89;
LABEL_83:
    operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_84;
  }
  v28 = *(void **)v7;
  v50 = v28;
  v29 = *(void **)(v7 + 24);
  *(void **)((char *)&v50 + *((_QWORD *)v28 - 3)) = v29;
  v30 = MEMORY[0x24BEDB848];
  v52[0] = MEMORY[0x24BEDB848] + 16;
  if (v54 < 0)
    operator delete(v53);
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x24268B35C](v55);
  v63.__r_.__value_.__r.__words[0] = (std::string::size_type)&__dst;
  v31 = &v60;
  v60.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_25110DD80;
  v61 = &v60;
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_25110DD38;
  v33 = v56;
  v32 = v57;
  v34 = 4;
  if (v56 == v57)
  {
LABEL_150:
    (*(void (**)(void))(v31->__r_.__value_.__r.__words[0] + 8 * v34))();
    goto LABEL_151;
  }
  v35 = 0;
  v45 = MEMORY[0x24BEDB868] + 64;
  v44 = v30 + 16;
  while (2)
  {
    if (!v61)
LABEL_169:
      sub_240BCF2D0();
    if (!(*(unsigned int (**)(std::string *, char *))(v61->__r_.__value_.__r.__words[0] + 48))(v61, v33))
    {
      if (!v63.__r_.__value_.__r.__words[0])
        goto LABEL_169;
      if (!(*(unsigned int (**)(std::string::size_type, char *))(*(_QWORD *)v63.__r_.__value_.__l.__data_
                                                                           + 48))(v63.__r_.__value_.__r.__words[0], v33))goto LABEL_107;
      if (!v63.__r_.__value_.__r.__words[0])
        goto LABEL_169;
      if (((*(uint64_t (**)(std::string::size_type, char *))(*(_QWORD *)v63.__r_.__value_.__l.__data_ + 48))(v63.__r_.__value_.__r.__words[0], v33 + 24) & 1) == 0)
      {
        if (v33[47] < 0)
        {
          if (!*((_QWORD *)v33 + 4))
            goto LABEL_134;
        }
        else if (!v33[47])
        {
          goto LABEL_134;
        }
        if ((*((unsigned int (**)(char **, char *))*a1 + 3))(a1, v33))
        {
          (*((void (**)(char **, char *, char *))*a1 + 2))(a1, v33, v33 + 24);
LABEL_140:
          v35 = 1;
          goto LABEL_96;
        }
      }
      else
      {
LABEL_107:
        if (!v63.__r_.__value_.__r.__words[0])
          goto LABEL_169;
        if (!(*(unsigned int (**)(std::string::size_type, char *))(*(_QWORD *)v63.__r_.__value_.__l.__data_
                                                                             + 48))(v63.__r_.__value_.__r.__words[0], v33))goto LABEL_111;
        if (!v63.__r_.__value_.__r.__words[0])
          goto LABEL_169;
        if (!(*(unsigned int (**)(std::string::size_type, char *))(*(_QWORD *)v63.__r_.__value_.__l.__data_
                                                                             + 48))(v63.__r_.__value_.__r.__words[0], v33 + 24))
        {
LABEL_111:
          if (!v63.__r_.__value_.__r.__words[0])
            goto LABEL_169;
          if (((*(uint64_t (**)(std::string::size_type, char *))(*(_QWORD *)v63.__r_.__value_.__l.__data_
                                                                          + 48))(v63.__r_.__value_.__r.__words[0], v33) & 1) == 0)
          {
            if (!v63.__r_.__value_.__r.__words[0])
              goto LABEL_169;
            if ((*(unsigned int (**)(std::string::size_type, char *))(*(_QWORD *)v63.__r_.__value_.__l.__data_
                                                                                + 48))(v63.__r_.__value_.__r.__words[0], v33 + 24))
            {
              if ((v35 & 1) != 0)
                goto LABEL_95;
              if (v33[23] < 0)
              {
                if (!*((_QWORD *)v33 + 1))
                  goto LABEL_95;
              }
              else if (!v33[23])
              {
                goto LABEL_95;
              }
LABEL_145:
              sub_240BD946C(v43, (const void **)v33, (uint64_t)v33);
              goto LABEL_95;
            }
          }
          if (!v63.__r_.__value_.__r.__words[0])
            goto LABEL_169;
          if (((*(uint64_t (**)(std::string::size_type, char *))(*(_QWORD *)v63.__r_.__value_.__l.__data_
                                                                          + 48))(v63.__r_.__value_.__r.__words[0], v33) & 1) != 0)goto LABEL_96;
          if (!v63.__r_.__value_.__r.__words[0])
            goto LABEL_169;
          if (((*(uint64_t (**)(std::string::size_type, char *))(*(_QWORD *)v63.__r_.__value_.__l.__data_
                                                                          + 48))(v63.__r_.__value_.__r.__words[0], v33 + 24) & 1) != 0)goto LABEL_96;
          if (v33[23] < 0)
          {
            if (*((_QWORD *)v33 + 1))
              goto LABEL_144;
          }
          else if (v33[23])
          {
            goto LABEL_144;
          }
          if (v33[47] < 0)
          {
            if (*((_QWORD *)v33 + 4))
              goto LABEL_139;
          }
          else if (v33[47])
          {
LABEL_139:
            sub_240BD946C(v43, (const void **)v33 + 3, (uint64_t)(v33 + 24));
            goto LABEL_140;
          }
LABEL_144:
          if ((v35 & 1) != 0)
            goto LABEL_95;
          goto LABEL_145;
        }
      }
LABEL_134:
      HIBYTE(v52[0]) = 4;
      strcpy((char *)&v50, "true");
      (*((void (**)(char **, char *, void **))*a1 + 2))(a1, v33, &v50);
      if (SHIBYTE(v52[0]) < 0)
        operator delete(v50);
      goto LABEL_95;
    }
    v55[0] = v45;
    v50 = v47;
    *(void **)((char *)&v50 + *((_QWORD *)v47 - 3)) = v46;
    v51 = 0;
    v36 = (std::ios_base *)((char *)&v50 + *((_QWORD *)v50 - 3));
    std::ios_base::init(v36, v52);
    v36[1].__vftable = 0;
    v36[1].__fmtflags_ = -1;
    v50 = (void *)(MEMORY[0x24BEDB868] + 24);
    v55[0] = MEMORY[0x24BEDB868] + 64;
    sub_240BD7468((uint64_t)v52, (__int128 *)v33, 8);
    memset(&v49, 0, sizeof(v49));
    memset(&__p, 0, sizeof(__p));
    sub_240BD8B40(&v50, (uint64_t)&v49, 0x3Du);
    std::ios_base::getloc((const std::ios_base *)((char *)&v50 + *((_QWORD *)v50 - 3)));
    v37 = std::locale::use_facet(&v59, MEMORY[0x24BEDB350]);
    LOBYTE(v36) = ((uint64_t (*)(const std::locale::facet *, uint64_t))v37->__vftable[2].~facet_0)(v37, 10);
    std::locale::~locale(&v59);
    sub_240BD8B40(&v50, (uint64_t)&__p, v36);
    (*((void (**)(char **, std::string *, std::string *))*a1 + 2))(a1, &v49, &__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
        goto LABEL_127;
    }
    else
    {
      if ((SHIBYTE(v49.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_101;
LABEL_127:
      operator delete(v49.__r_.__value_.__l.__data_);
    }
LABEL_101:
    v50 = v28;
    *(void **)((char *)&v50 + *((_QWORD *)v28 - 3)) = v29;
    v52[0] = v44;
    if (v54 < 0)
      operator delete(v53);
    std::streambuf::~streambuf();
    std::istream::~istream();
    MEMORY[0x24268B35C](v55);
LABEL_95:
    v35 = 0;
LABEL_96:
    v33 += 48;
    if (v33 != v32)
      continue;
    break;
  }
  v31 = v61;
  if (v61 == &v60)
  {
    v34 = 4;
    v31 = &v60;
    goto LABEL_150;
  }
  if (v61)
  {
    v34 = 5;
    goto LABEL_150;
  }
LABEL_151:
  p_dst = (std::string *)v63.__r_.__value_.__r.__words[0];
  if ((std::string *)v63.__r_.__value_.__l.__data_ == &__dst)
  {
    v39 = 4;
    p_dst = &__dst;
LABEL_155:
    (*(void (**)(void))(p_dst->__r_.__value_.__r.__words[0] + 8 * v39))();
  }
  else if (v63.__r_.__value_.__r.__words[0])
  {
    v39 = 5;
    goto LABEL_155;
  }
  v40 = v56;
  if (v56)
  {
    v41 = v57;
    v42 = v56;
    if (v57 == v56)
    {
LABEL_165:
      v57 = v40;
      operator delete(v42);
      return;
    }
    while (2)
    {
      if (*(v41 - 1) < 0)
      {
        operator delete(*((void **)v41 - 3));
        if (*(v41 - 25) < 0)
          goto LABEL_163;
      }
      else if (*(v41 - 25) < 0)
      {
LABEL_163:
        operator delete(*((void **)v41 - 6));
      }
      v41 -= 48;
      if (v41 == v40)
      {
        v42 = v56;
        goto LABEL_165;
      }
      continue;
    }
  }
}

void sub_240BD893C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  uint64_t v32;

  if (a20 < 0)
    operator delete(__p);
  if (a26 < 0)
    operator delete(a21);
  sub_240BD73E4((uint64_t)&a27);
  sub_240BD8CC4((void **)(v32 - 208));
  _Unwind_Resume(a1);
}

uint64_t sub_240BD8AF4(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
  {
    operator delete(*(void **)(a1 + 24));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0)
      return a1;
LABEL_5:
    operator delete(*(void **)a1);
    return a1;
  }
  if (*(char *)(a1 + 23) < 0)
    goto LABEL_5;
  return a1;
}

_QWORD *sub_240BD8B40(_QWORD *a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v6;
  _QWORD *v7;
  _BYTE *v8;
  int v9;
  char v11;

  MEMORY[0x24268B230](&v11, a1, 1);
  if (!v11)
    return a1;
  if (*(char *)(a2 + 23) < 0)
  {
    **(_BYTE **)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  else
  {
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 23) = 0;
  }
  v6 = 0;
  while (1)
  {
    v7 = *(_QWORD **)((char *)a1 + *(_QWORD *)(*a1 - 24) + 40);
    v8 = (_BYTE *)v7[3];
    if (v8 != (_BYTE *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(_QWORD *))(*v7 + 80))(v7);
    if ((_DWORD)v7 == -1)
      break;
LABEL_9:
    if (v7 == a3)
    {
      v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(_QWORD *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6)
    v9 = 2;
  else
    v9 = 6;
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_240BD8C6C(void *a1)
{
  _QWORD *v1;
  uint64_t v2;

  __cxa_begin_catch(a1);
  v2 = *v1;
  *(_DWORD *)((char *)v1 + *(_QWORD *)(*v1 - 24) + 32) |= 1u;
  if ((*((_BYTE *)v1 + *(_QWORD *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x240BD8C38);
  }
  __cxa_rethrow();
}

void sub_240BD8CB0(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void **sub_240BD8CC4(void **a1)
{
  void **v2;
  void **v3;
  void *v4;

  v2 = (void **)*a1;
  if (*a1)
  {
    v3 = (void **)a1[1];
    v4 = *a1;
    if (v3 == v2)
    {
LABEL_11:
      a1[1] = v2;
      operator delete(v4);
      return a1;
    }
    while (1)
    {
      if (*((char *)v3 - 1) < 0)
      {
        operator delete(*(v3 - 3));
        if (*((char *)v3 - 25) < 0)
LABEL_9:
          operator delete(*(v3 - 6));
      }
      else if (*((char *)v3 - 25) < 0)
      {
        goto LABEL_9;
      }
      v3 -= 6;
      if (v3 == v2)
      {
        v4 = *a1;
        goto LABEL_11;
      }
    }
  }
  return a1;
}

_QWORD *sub_240BD8D50@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  const void **v3;
  const void ***v4;
  const void **v6;
  const void ***v7;
  BOOL v8;

  *(_QWORD *)(a2 + 8) = 0;
  v2 = (uint64_t *)(a2 + 8);
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = a2 + 8;
  v3 = (const void **)result[6];
  v4 = (const void ***)(result + 7);
  if (v3 != result + 7)
  {
    do
    {
      result = sub_240BD95F0((uint64_t **)a2, v2, v3 + 4, (uint64_t)(v3 + 4));
      v6 = (const void **)v3[1];
      if (v6)
      {
        do
        {
          v7 = (const void ***)v6;
          v6 = (const void **)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          v7 = (const void ***)v3[2];
          v8 = *v7 == v3;
          v3 = (const void **)v7;
        }
        while (!v8);
      }
      v3 = (const void **)v7;
    }
    while (v7 != v4);
  }
  return result;
}

void sub_240BD8DE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_240BCD774(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

void sub_240BD8E00()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8D8] + 16;
  __cxa_throw(exception, (struct type_info *)&unk_25110DD10, (void (*)(void *))std::exception::~exception);
}

char *sub_240BD8E38(void **a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  __int128 v10;
  char *v11;
  char *v12;
  char *v13;
  __int128 v14;
  __int128 v15;
  char *v16;

  v3 = 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 4);
  v4 = v3 + 1;
  if (v3 + 1 > 0x555555555555555)
    sub_240BC9E84();
  if (0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 4) > v4)
    v4 = 0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 4);
  if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 4) >= 0x2AAAAAAAAAAAAAALL)
    v6 = 0x555555555555555;
  else
    v6 = v4;
  if (v6)
  {
    if (v6 > 0x555555555555555)
      sub_240BCB680();
    v7 = (char *)operator new(48 * v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[48 * v3];
  *((_QWORD *)v8 + 2) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)v8 = *(_OWORD *)a2;
  v9 = &v7[48 * v6];
  v10 = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_OWORD *)(v8 + 24) = v10;
  *((_QWORD *)v8 + 5) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  v11 = v8 + 48;
  v12 = (char *)*a1;
  v13 = (char *)a1[1];
  if (v13 == *a1)
  {
    *a1 = v8;
    a1[1] = v11;
    a1[2] = v9;
    if (!v13)
      return v11;
    goto LABEL_23;
  }
  do
  {
    v14 = *((_OWORD *)v13 - 3);
    *((_QWORD *)v8 - 4) = *((_QWORD *)v13 - 4);
    *((_OWORD *)v8 - 3) = v14;
    *((_QWORD *)v13 - 5) = 0;
    *((_QWORD *)v13 - 4) = 0;
    *((_QWORD *)v13 - 6) = 0;
    v15 = *(_OWORD *)(v13 - 24);
    *((_QWORD *)v8 - 1) = *((_QWORD *)v13 - 1);
    *(_OWORD *)(v8 - 24) = v15;
    v8 -= 48;
    *((_QWORD *)v13 - 2) = 0;
    *((_QWORD *)v13 - 1) = 0;
    *((_QWORD *)v13 - 3) = 0;
    v13 -= 48;
  }
  while (v13 != v12);
  v16 = (char *)*a1;
  v13 = (char *)a1[1];
  *a1 = v8;
  a1[1] = v11;
  a1[2] = v9;
  if (v13 != v16)
  {
    while (1)
    {
      if (*(v13 - 1) < 0)
      {
        operator delete(*((void **)v13 - 3));
        if (*(v13 - 25) < 0)
LABEL_20:
          operator delete(*((void **)v13 - 6));
      }
      else if (*(v13 - 25) < 0)
      {
        goto LABEL_20;
      }
      v13 -= 48;
      if (v13 == v16)
      {
        v13 = v16;
        break;
      }
    }
  }
  if (v13)
LABEL_23:
    operator delete(v13);
  return v11;
}

uint64_t sub_240BD8FE8(uint64_t a1, __int128 *a2)
{
  __int128 v3;
  void *v4;
  const char *v5;
  size_t v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v3;
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  *(_QWORD *)a2 = 0;
  v4 = (void *)(a1 + 24);
  v5 = (const char *)*((_QWORD *)a2 + 3);
  v6 = strlen(v5);
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    sub_240BC9D74();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v8 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v8 = v6 | 7;
    v9 = v8 + 1;
    v4 = operator new(v8 + 1);
    *(_QWORD *)(a1 + 32) = v7;
    *(_QWORD *)(a1 + 40) = v9 | 0x8000000000000000;
    *(_QWORD *)(a1 + 24) = v4;
  }
  else
  {
    *(_BYTE *)(a1 + 47) = v6;
    if (!v6)
      goto LABEL_9;
  }
  memmove(v4, v5, v7);
LABEL_9:
  *((_BYTE *)v4 + v7) = 0;
  return a1;
}

void sub_240BD90B4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t *sub_240BD90D0(_QWORD *a1, uint64_t a2)
{
  _BYTE *v2;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int8x8_t v7;
  unint64_t v8;
  uint8x8_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t **v12;
  uint64_t *v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;

  v2 = (_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v5 = v4;
  }
  v6 = sub_240BD6A98((uint64_t)&v21, (uint64_t *)a2, v5);
  v7 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v7)
    return 0;
  v8 = v6;
  v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  v10 = v9.u32[0];
  if (v9.u32[0] > 1uLL)
  {
    v11 = v6;
    if (v6 >= *(_QWORD *)&v7)
      v11 = v6 % *(_QWORD *)&v7;
  }
  else
  {
    v11 = (*(_QWORD *)&v7 - 1) & v6;
  }
  v12 = *(uint64_t ***)(*a1 + 8 * v11);
  if (!v12)
    return 0;
  v13 = *v12;
  if (*v12)
  {
    v14 = v2[23];
    if (v14 >= 0)
      v15 = v2[23];
    else
      v15 = *((_QWORD *)v2 + 1);
    if (v14 < 0)
      v2 = *(_BYTE **)v2;
    do
    {
      v16 = v13[1];
      if (v8 == v16)
      {
        v17 = *((unsigned __int8 *)v13 + 39);
        if ((v17 & 0x80u) == 0)
          v18 = *((unsigned __int8 *)v13 + 39);
        else
          v18 = v13[3];
        if (v18 == v15)
        {
          if ((v17 & 0x80) != 0)
          {
            if (!memcmp((const void *)v13[2], v2, v13[3]))
              return v13;
          }
          else
          {
            if (!*((_BYTE *)v13 + 39))
              return v13;
            v19 = 0;
            while (*((unsigned __int8 *)v13 + v19 + 16) == v2[v19])
            {
              if (v17 == ++v19)
                return v13;
            }
          }
        }
      }
      else
      {
        if (v10 <= 1)
        {
          v16 &= *(_QWORD *)&v7 - 1;
        }
        else if (v16 >= *(_QWORD *)&v7)
        {
          v16 %= *(_QWORD *)&v7;
        }
        if (v16 != v11)
          return 0;
      }
      v13 = (uint64_t *)*v13;
    }
    while (v13);
  }
  return v13;
}

void sub_240BD9254()
{
  JUMPOUT(0x24268B398);
}

_QWORD *sub_240BD9268()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_25110DD38;
  return result;
}

void sub_240BD928C(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_25110DD38;
}

uint64_t sub_240BD92A4(uint64_t a1, const void **a2, const void *a3)
{
  unint64_t v3;
  int v4;
  const void **v5;
  size_t v6;
  unsigned int v7;
  _BOOL8 v8;
  unint64_t v9;
  uint64_t v10;
  const void **v11;
  char *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  BOOL v18;
  void *v19;
  char v21[24];
  const void *__dst[2];
  unsigned __int8 v23;

  v3 = *((unsigned __int8 *)a2 + 23);
  v4 = (char)v3;
  v5 = (const void **)*a2;
  if ((v3 & 0x80u) != 0)
    v3 = (unint64_t)a2[1];
  if (v3 >= 2)
    v6 = 2;
  else
    v6 = v3;
  v23 = v6;
  if (v6)
  {
    if (v4 < 0)
      a2 = v5;
    memcpy(__dst, a2, v6);
    v7 = v23;
    a3 = __dst[1];
  }
  else
  {
    v7 = 0;
  }
  v8 = 0;
  *((_BYTE *)__dst + v6) = 0;
  v21[23] = 2;
  strcpy(v21, "--");
  if ((v7 & 0x80u) == 0)
    v9 = v7;
  else
    v9 = (unint64_t)a3;
  if (v9 == 2)
  {
    if ((v7 & 0x80) != 0)
    {
      v19 = (void *)__dst[0];
      v8 = memcmp(__dst[0], v21, (size_t)a3) == 0;
      goto LABEL_26;
    }
    if (!v7)
      return 1;
    v10 = v7 - 1;
    v11 = __dst;
    v12 = v21;
    do
    {
      v14 = *(unsigned __int8 *)v11;
      v11 = (const void **)((char *)v11 + 1);
      v13 = v14;
      v16 = *v12++;
      v15 = v16;
      v18 = v10-- != 0;
      v8 = v13 == v15;
    }
    while (v13 == v15 && v18);
  }
  if ((v7 & 0x80) != 0)
  {
    v19 = (void *)__dst[0];
LABEL_26:
    operator delete(v19);
  }
  return v8;
}

void sub_240BD93BC()
{
  JUMPOUT(0x24268B398);
}

_QWORD *sub_240BD93D0()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_25110DD80;
  return result;
}

void sub_240BD93F4(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_25110DD80;
}

BOOL sub_240BD940C(uint64_t a1, void **a2)
{
  int v2;
  size_t v3;
  void *v4;
  _BYTE *v5;
  BOOL v6;

  v2 = *((char *)a2 + 23);
  if (v2 >= 0)
    v3 = *((unsigned __int8 *)a2 + 23);
  else
    v3 = (size_t)a2[1];
  if (!v3)
    return 0;
  if (v2 >= 0)
    v4 = a2;
  else
    v4 = *a2;
  v5 = memchr(v4, 61, v3);
  if (v5)
    v6 = v5 - (_BYTE *)v4 == -1;
  else
    v6 = 1;
  return !v6;
}

uint64_t **sub_240BD946C(uint64_t **a1, const void **a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t **v6;
  int v7;
  const void *v8;
  size_t v9;
  uint64_t **v10;
  _QWORD *v11;
  const void *v12;
  const void *v13;
  int v14;
  const void *v15;
  size_t v16;
  size_t v17;
  int v18;
  int v19;
  _QWORD *v20;
  _BYTE *v21;
  uint64_t *v22;
  uint64_t *v23;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *((char *)a2 + 23);
    if (v7 >= 0)
      v8 = a2;
    else
      v8 = *a2;
    if (v7 >= 0)
      v9 = *((unsigned __int8 *)a2 + 23);
    else
      v9 = (size_t)a2[1];
    while (1)
    {
      v10 = (uint64_t **)v5;
      v13 = (const void *)v5[4];
      v11 = v5 + 4;
      v12 = v13;
      v14 = *((char *)v11 + 23);
      if (v14 >= 0)
        v15 = v11;
      else
        v15 = v12;
      if (v14 >= 0)
        v16 = *((unsigned __int8 *)v11 + 23);
      else
        v16 = v11[1];
      if (v16 >= v9)
        v17 = v9;
      else
        v17 = v16;
      v18 = memcmp(v8, v15, v17);
      if (v18)
      {
        if (v18 < 0)
          goto LABEL_8;
LABEL_22:
        v19 = memcmp(v15, v8, v17);
        if (v19)
        {
          if ((v19 & 0x80000000) == 0)
            return v10;
        }
        else if (v16 >= v9)
        {
          return v10;
        }
        v5 = v10[1];
        if (!v5)
        {
          v6 = v10 + 1;
          goto LABEL_29;
        }
      }
      else
      {
        if (v9 >= v16)
          goto LABEL_22;
LABEL_8:
        v5 = *v10;
        v6 = v10;
        if (!*v10)
          goto LABEL_29;
      }
    }
  }
  v10 = a1 + 1;
LABEL_29:
  v20 = operator new(0x38uLL);
  v21 = v20 + 4;
  if (*(char *)(a3 + 23) < 0)
  {
    sub_240BCD950(v21, *(void **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)v21 = *(_OWORD *)a3;
    v20[6] = *(_QWORD *)(a3 + 16);
  }
  *v20 = 0;
  v20[1] = 0;
  v20[2] = v10;
  *v6 = v20;
  v22 = (uint64_t *)**a1;
  v23 = v20;
  if (v22)
  {
    *a1 = v22;
    v23 = *v6;
  }
  sub_240BCD9DC(a1[1], v23);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return (uint64_t **)v20;
}

void sub_240BD95DC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_240BD95F0(uint64_t **a1, uint64_t *a2, const void **a3, uint64_t a4)
{
  uint64_t *v6;
  _QWORD *v7;
  uint64_t *v8;
  _BYTE *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v14;
  uint64_t *v15;

  v6 = sub_240BD96D0(a1, a2, &v15, &v14, a3);
  v7 = (_QWORD *)*v6;
  if (!*v6)
  {
    v8 = v6;
    v7 = operator new(0x38uLL);
    v9 = v7 + 4;
    if (*(char *)(a4 + 23) < 0)
    {
      sub_240BCD950(v9, *(void **)a4, *(_QWORD *)(a4 + 8));
    }
    else
    {
      *(_OWORD *)v9 = *(_OWORD *)a4;
      v7[6] = *(_QWORD *)(a4 + 16);
    }
    v10 = v15;
    *v7 = 0;
    v7[1] = 0;
    v7[2] = v10;
    *v8 = (uint64_t)v7;
    v11 = (uint64_t *)**a1;
    v12 = v7;
    if (v11)
    {
      *a1 = v11;
      v12 = (uint64_t *)*v8;
    }
    sub_240BCD9DC(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return v7;
}

void sub_240BD96BC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_240BD96D0(uint64_t **a1, uint64_t *a2, uint64_t **a3, uint64_t **a4, const void **a5)
{
  uint64_t **v8;
  int v10;
  const void *v11;
  size_t v12;
  int v13;
  const void *v14;
  size_t v15;
  size_t v16;
  int v17;
  int v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  BOOL v23;
  int v24;
  const void *v25;
  size_t v26;
  int v27;
  const void *v28;
  size_t v29;
  size_t v30;
  int v31;
  uint64_t *v32;
  uint64_t **v33;
  _QWORD *v34;
  const void *v35;
  const void *v36;
  int v37;
  const void *v38;
  size_t v39;
  size_t v40;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t *v45;
  int v46;
  uint64_t *v47;
  size_t v48;
  size_t v49;
  int v50;
  uint64_t *v51;
  uint64_t **v52;
  uint64_t **v53;
  _QWORD *v54;
  const void *v55;
  const void *v56;
  int v57;
  const void *v58;
  size_t v59;
  size_t v60;
  int v61;
  int v62;

  v8 = a1 + 1;
  if (a1 + 1 == (uint64_t **)a2)
    goto LABEL_23;
  v10 = *((char *)a5 + 23);
  if (v10 >= 0)
    v11 = a5;
  else
    v11 = *a5;
  if (v10 >= 0)
    v12 = *((unsigned __int8 *)a5 + 23);
  else
    v12 = (size_t)a5[1];
  v13 = *((char *)a2 + 55);
  if (v13 >= 0)
    v14 = a2 + 4;
  else
    v14 = (const void *)a2[4];
  if (v13 >= 0)
    v15 = *((unsigned __int8 *)a2 + 55);
  else
    v15 = a2[5];
  if (v15 >= v12)
    v16 = v12;
  else
    v16 = v15;
  v17 = memcmp(v11, v14, v16);
  if (!v17)
  {
    if (v12 >= v15)
      goto LABEL_19;
LABEL_23:
    v19 = (uint64_t *)*a2;
    if (*a1 == a2)
    {
      v21 = a2;
    }
    else
    {
      if (v19)
      {
        v20 = (uint64_t *)*a2;
        do
        {
          v21 = v20;
          v20 = (uint64_t *)v20[1];
        }
        while (v20);
      }
      else
      {
        v22 = a2;
        do
        {
          v21 = (uint64_t *)v22[2];
          v23 = *v21 == (_QWORD)v22;
          v22 = v21;
        }
        while (v23);
      }
      v24 = *((char *)v21 + 55);
      if (v24 >= 0)
        v25 = v21 + 4;
      else
        v25 = (const void *)v21[4];
      if (v24 >= 0)
        v26 = *((unsigned __int8 *)v21 + 55);
      else
        v26 = v21[5];
      v27 = *((char *)a5 + 23);
      if (v27 >= 0)
        v28 = a5;
      else
        v28 = *a5;
      if (v27 >= 0)
        v29 = *((unsigned __int8 *)a5 + 23);
      else
        v29 = (size_t)a5[1];
      if (v29 >= v26)
        v30 = v26;
      else
        v30 = v29;
      v31 = memcmp(v25, v28, v30);
      if (v31)
      {
        if ((v31 & 0x80000000) == 0)
          goto LABEL_48;
      }
      else if (v26 >= v29)
      {
LABEL_48:
        v32 = *v8;
        if (!*v8)
        {
          v33 = v8;
LABEL_69:
          *a3 = (uint64_t *)v33;
          return (uint64_t *)v8;
        }
        while (1)
        {
          v33 = (uint64_t **)v32;
          v36 = (const void *)v32[4];
          v34 = v32 + 4;
          v35 = v36;
          v37 = *((char *)v34 + 23);
          if (v37 >= 0)
            v38 = v34;
          else
            v38 = v35;
          if (v37 >= 0)
            v39 = *((unsigned __int8 *)v34 + 23);
          else
            v39 = v34[1];
          if (v39 >= v29)
            v40 = v29;
          else
            v40 = v39;
          v41 = memcmp(v28, v38, v40);
          if (v41)
          {
            if (v41 < 0)
              goto LABEL_50;
LABEL_64:
            v42 = memcmp(v38, v28, v40);
            if (v42)
            {
              if ((v42 & 0x80000000) == 0)
                goto LABEL_69;
            }
            else if (v39 >= v29)
            {
              goto LABEL_69;
            }
            v8 = v33 + 1;
            v32 = v33[1];
            if (!v32)
              goto LABEL_69;
          }
          else
          {
            if (v29 >= v39)
              goto LABEL_64;
LABEL_50:
            v32 = *v33;
            v8 = v33;
            if (!*v33)
              goto LABEL_69;
          }
        }
      }
    }
    if (v19)
    {
      *a3 = v21;
      return v21 + 1;
    }
    else
    {
      *a3 = a2;
      return a2;
    }
  }
  if (v17 < 0)
    goto LABEL_23;
LABEL_19:
  v18 = memcmp(v14, v11, v16);
  if (v18)
  {
    if ((v18 & 0x80000000) == 0)
    {
LABEL_21:
      *a3 = a2;
      *a4 = a2;
      return (uint64_t *)a4;
    }
  }
  else if (v15 >= v12)
  {
    goto LABEL_21;
  }
  v43 = a2[1];
  if (v43)
  {
    v44 = (uint64_t *)a2[1];
    do
    {
      a4 = (uint64_t **)v44;
      v44 = (uint64_t *)*v44;
    }
    while (v44);
  }
  else
  {
    v45 = a2;
    do
    {
      a4 = (uint64_t **)v45[2];
      v23 = *a4 == v45;
      v45 = (uint64_t *)a4;
    }
    while (!v23);
  }
  if (a4 != v8)
  {
    v46 = *((char *)a4 + 55);
    if (v46 >= 0)
      v47 = (uint64_t *)(a4 + 4);
    else
      v47 = a4[4];
    if (v46 >= 0)
      v48 = *((unsigned __int8 *)a4 + 55);
    else
      v48 = (size_t)a4[5];
    if (v48 >= v12)
      v49 = v12;
    else
      v49 = v48;
    v50 = memcmp(v11, v47, v49);
    if (v50)
    {
      if ((v50 & 0x80000000) == 0)
      {
LABEL_95:
        v51 = *v8;
        if (*v8)
        {
          v52 = a3;
          while (1)
          {
            v53 = (uint64_t **)v51;
            v56 = (const void *)v51[4];
            v54 = v51 + 4;
            v55 = v56;
            v57 = *((char *)v54 + 23);
            if (v57 >= 0)
              v58 = v54;
            else
              v58 = v55;
            if (v57 >= 0)
              v59 = *((unsigned __int8 *)v54 + 23);
            else
              v59 = v54[1];
            if (v59 >= v12)
              v60 = v12;
            else
              v60 = v59;
            v61 = memcmp(v11, v58, v60);
            if (v61)
            {
              if (v61 < 0)
                goto LABEL_97;
LABEL_111:
              v62 = memcmp(v58, v11, v60);
              if (v62)
              {
                if ((v62 & 0x80000000) == 0)
                  goto LABEL_123;
              }
              else if (v59 >= v12)
              {
                goto LABEL_123;
              }
              v8 = v53 + 1;
              v51 = v53[1];
              if (!v51)
                goto LABEL_123;
            }
            else
            {
              if (v12 >= v59)
                goto LABEL_111;
LABEL_97:
              v51 = *v53;
              v8 = v53;
              if (!*v53)
                goto LABEL_123;
            }
          }
        }
        v53 = v8;
        v52 = a3;
LABEL_123:
        *v52 = (uint64_t *)v53;
        return (uint64_t *)v8;
      }
    }
    else if (v12 >= v48)
    {
      goto LABEL_95;
    }
  }
  if (v43)
  {
    *a3 = (uint64_t *)a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return (uint64_t *)a4;
}

void sub_240BD9A78(const __CFString *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  const char *CStringPtr;
  void *v5;
  size_t v6;
  size_t v7;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  size_t v10;
  size_t v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;

  v2 = a2;
  if (!a1)
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    return;
  }
  CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
  v5 = (void *)CStringPtr;
  if (CStringPtr)
  {
    v6 = strlen(CStringPtr);
    if (v6 > 0x7FFFFFFFFFFFFFF7)
      sub_240BC9D74();
    v7 = v6;
    if (v6 >= 0x17)
    {
      v13 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v6 | 7) != 0x17)
        v13 = v6 | 7;
      v14 = v13 + 1;
      v15 = operator new(v13 + 1);
      v2[1] = v7;
      v2[2] = v14 | 0x8000000000000000;
      *v2 = v15;
      v2 = v15;
    }
    else
    {
      *((_BYTE *)v2 + 23) = v6;
      if (!v6)
        goto LABEL_20;
    }
    memmove(v2, v5, v7);
LABEL_20:
    *((_BYTE *)v2 + v7) = 0;
    return;
  }
  Length = CFStringGetLength(a1);
  MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  v19 = 0;
  v10 = MaximumSizeForEncoding + 1;
  if (MaximumSizeForEncoding != -1)
  {
    if (MaximumSizeForEncoding <= -2)
      sub_240BC9E84();
    v5 = operator new(MaximumSizeForEncoding + 1);
    v19 = v5;
    bzero(v5, v10);
  }
  if (CFStringGetCString(a1, (char *)v5, v10, 0x8000100u))
  {
    v11 = strlen((const char *)v5);
    if (v11 > 0x7FFFFFFFFFFFFFF7)
      sub_240BC9D74();
    v12 = v11;
    if (v11 >= 0x17)
    {
      v16 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v11 | 7) != 0x17)
        v16 = v11 | 7;
      v17 = v16 + 1;
      v18 = operator new(v16 + 1);
      v2[1] = v12;
      v2[2] = v17 | 0x8000000000000000;
      *v2 = v18;
      v2 = v18;
    }
    else
    {
      *((_BYTE *)v2 + 23) = v11;
      if (!v11)
      {
LABEL_27:
        *((_BYTE *)v2 + v12) = 0;
        v5 = v19;
        if (!v19)
          return;
        goto LABEL_28;
      }
    }
    memcpy(v2, v5, v12);
    goto LABEL_27;
  }
  *v2 = 0;
  v2[1] = 0;
  v2[2] = 0;
  if (!v5)
    return;
LABEL_28:
  operator delete(v5);
}

void sub_240BD9C58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_240BD9C84(CFDictionaryRef theDict@<X1>, uint64_t a2@<X0>, const char **a3@<X8>)
{
  const char *v4;
  const __CFDictionary *Value;
  const __CFDictionary *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const __CFString *v12;
  unint64_t v13;
  void **v14;
  BOOL v15;
  void *__p[2];
  unsigned __int8 v17;

  if (a2)
  {
    a3[2] = 0;
    a3[3] = 0;
    v4 = "MLCompiler: validation version mismatch!";
LABEL_3:
    *a3 = v4;
    a3[1] = 0;
    return;
  }
  if (!CFDictionaryGetValue(theDict, CFSTR("architecture")))
  {
    a3[2] = 0;
    a3[3] = 0;
    v4 = "MLCompiler: no target architecture specified!";
    goto LABEL_3;
  }
  Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("parameters"));
  if (!Value)
  {
    a3[2] = 0;
    a3[3] = 0;
    v4 = "MLCompiler: no parameters specified!";
    goto LABEL_3;
  }
  v7 = Value;
  v8 = (const char *)CFDictionaryGetValue(theDict, CFSTR("MIL"));
  if (!v8)
  {
    a3[2] = 0;
    a3[3] = 0;
    v4 = "MLCompiler: cannot get the MIL program!";
    goto LABEL_3;
  }
  v9 = v8;
  v10 = (const char *)CFDictionaryGetValue(theDict, CFSTR("function"));
  if (!v10)
  {
    a3[2] = 0;
    a3[3] = 0;
    v4 = "MLCompiler: cannot get the MIL function name!";
    goto LABEL_3;
  }
  v11 = v10;
  v12 = (const __CFString *)CFDictionaryGetValue(v7, CFSTR("bnns-graph"));
  if (v12)
  {
    sub_240BD9A78(v12, __p);
    v13 = v17;
    if ((v17 & 0x80u) != 0)
      v13 = (unint64_t)__p[1];
    if (v13 == 4)
    {
      v14 = (void **)__p[0];
      if ((v17 & 0x80u) == 0)
        v14 = __p;
      v15 = *(_DWORD *)v14 == 1702195828;
    }
    else
    {
      v15 = 0;
    }
    if ((char)v17 < 0)
      operator delete(__p[0]);
  }
  else
  {
    v15 = 0;
  }
  *a3 = 0;
  a3[1] = v9;
  a3[2] = v11;
  *((_BYTE *)a3 + 24) = v15;
}

__CFDictionary *sub_240BD9DEC(const char *a1)
{
  const __CFAllocator *v2;
  const CFDictionaryKeyCallBacks *v3;
  const CFDictionaryValueCallBacks *v4;
  __CFDictionary *Mutable;
  CFNumberRef v6;
  CFNumberRef v7;
  __CFDictionary *v8;
  CFStringRef v9;
  int v11;
  uint64_t valuePtr;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v4 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  valuePtr = 0;
  v6 = CFNumberCreate(v2, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, CFSTR("resultsVersion"), v6);
  CFRelease(v6);
  v11 = -1;
  v7 = CFNumberCreate(v2, kCFNumberIntType, &v11);
  v8 = CFDictionaryCreateMutable(v2, 0, v3, v4);
  v9 = CFStringCreateWithCString(v2, a1, 0x8000100u);
  CFDictionaryAddValue(v8, CFSTR("errorMsg"), v9);
  CFDictionaryAddValue(Mutable, v7, v8);
  CFRelease(v9);
  CFRelease(v7);
  CFRelease(v8);
  return Mutable;
}

__CFDictionary *sub_240BD9F14(uint64_t a1)
{
  const void *v1;
  const void *v2;
  const __CFAllocator *v3;
  __CFDictionary *Mutable;
  const __CFDictionary *v5;
  CFIndex Count;
  __CFDictionary *MutableCopy;
  CFNumberRef v8;
  uint64_t valuePtr;

  v1 = *(const void **)(a1 + 8);
  v2 = *(const void **)(a1 + 16);
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(Mutable, CFSTR("MIL"), v1);
  CFDictionaryAddValue(Mutable, CFSTR("function"), v2);
  CFDictionaryAddValue(Mutable, CFSTR("parameters"), &stru_25110DE98);
  CFDictionaryAddValue(Mutable, CFSTR("architecture"), CFSTR("local"));
  BNNSGraphE5ValidateGetSupportedVersion();
  v5 = (const __CFDictionary *)BNNSGraphE5Validate();
  CFRelease(Mutable);
  Count = CFDictionaryGetCount(v5);
  MutableCopy = CFDictionaryCreateMutableCopy(v3, Count, v5);
  CFRelease(v5);
  valuePtr = 0;
  v8 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryReplaceValue(MutableCopy, CFSTR("resultsVersion"), v8);
  CFRelease(v8);
  return MutableCopy;
}

void sub_240BDA034(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = a1;
  sub_240BC9E98(&dword_240BC3000, a2, a3, "Can't open model at %s", (uint8_t *)&v3);
  sub_240BC9EA4();
}

void sub_240BDA09C(char *a1, _QWORD *a2, NSObject *a3)
{
  _QWORD *v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (*a1 >= 0)
    v3 = a2;
  else
    v3 = (_QWORD *)*a2;
  v4 = 136315138;
  v5 = v3;
  sub_240BC9E98(&dword_240BC3000, a3, (uint64_t)a3, "Can't open BNNSGraph model at %s", (uint8_t *)&v4);
  sub_240BC9EA4();
}

void sub_240BDA118(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "mlc_managed_model_t mlc_services_model_create_cached(unsigned char *)";
  sub_240BC9E98(&dword_240BC3000, a1, a3, "%s: no longer supported", (uint8_t *)&v3);
  sub_240BC9EA4();
}

void sub_240BDA18C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_240BCDC9C(&dword_240BC3000, a1, a3, "Failed to create BNNS graph context", a5, a6, a7, a8, 0);
}

void sub_240BDA1C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_240BCDC9C(&dword_240BC3000, a1, a3, "Unhandled BNNS data type in bnns_sizeof", a5, a6, a7, a8, 0);
}

void sub_240BDA1F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_240BCDC90();
  sub_240BCDC80(&dword_240BC3000, v0, v1, "Tried to get tensor shape of unknown tensor %s", v2, v3, v4, v5, v6);
  sub_240BC9EA4();
}

void sub_240BDA254()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_240BCDC90();
  sub_240BCDC80(&dword_240BC3000, v0, v1, "Rank %zu out of bounds", v2, v3, v4, v5, v6);
  sub_240BC9EA4();
}

void sub_240BDA2B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_240BCDC90();
  sub_240BCDC80(&dword_240BC3000, v0, v1, "Tried to set tensor shape of unknown tensor %s", v2, v3, v4, v5, v6);
  sub_240BC9EA4();
}

void sub_240BDA314()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_240BCDC90();
  sub_240BCDC80(&dword_240BC3000, v0, v1, "Tensor %s: strides must be dense", v2, v3, v4, v5, v6);
  sub_240BC9EA4();
}

uint64_t sub_240BDA374(uint64_t a1)
{
  uint64_t v1;

  v1 = nullsub_1(a1);
  return MEMORY[0x24268B398](v1, 0x10B3C40B9A48F69);
}

void sub_240BDA3A4(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "const char *mlc_services_compile_to_cache(int, const char *const *, unsigned char *)";
  _os_log_error_impl(&dword_240BC3000, log, OS_LOG_TYPE_ERROR, "%s: no longer supported", (uint8_t *)&v1, 0xCu);
}

void sub_240BDA424(void **a1, void **a2, void **a3)
{
  void **v5;
  void *v6;

  v5 = (void **)*a1;
  v6 = a2;
  if (v5 != a2)
  {
    do
    {
      if (*((char *)v5 - 1) < 0)
        operator delete(*(v5 - 3));
      v5 -= 3;
    }
    while (v5 != a2);
    v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

void sub_240BDA484()
{
  dlerror();
  abort_report_np();
  BNNSGraphCompileFromFile_v2();
}

uint64_t BNNSGraphCompileFromFile_v2()
{
  return MEMORY[0x24BDB2880]();
}

uint64_t BNNSGraphCompileOptionsDestroy()
{
  return MEMORY[0x24BDB2888]();
}

uint64_t BNNSGraphCompileOptionsMakeDefault()
{
  return MEMORY[0x24BDB2890]();
}

uint64_t BNNSGraphCompileOptionsSetDownconvertMode()
{
  return MEMORY[0x24BDB2898]();
}

uint64_t BNNSGraphCompileOptionsSetGenerateDebugInfo()
{
  return MEMORY[0x24BDB28A0]();
}

uint64_t BNNSGraphCompileOptionsSetOptimizationPreference()
{
  return MEMORY[0x24BDB28A8]();
}

uint64_t BNNSGraphCompileOptionsSetOutputPath()
{
  return MEMORY[0x24BDB28B0]();
}

uint64_t BNNSGraphCompileOptionsSetTargetSingleThread()
{
  return MEMORY[0x24BDB28B8]();
}

uint64_t BNNSGraphCompileOptionsSetUserData()
{
  return MEMORY[0x24BDB28C0]();
}

uint64_t BNNSGraphCompileOptionsSetValidateMILFile()
{
  return MEMORY[0x24BDB28C8]();
}

uint64_t BNNSGraphContextDestroy_v2()
{
  return MEMORY[0x24BDB28D0]();
}

uint64_t BNNSGraphContextExecute_v2()
{
  return MEMORY[0x24BDB28D8]();
}

uint64_t BNNSGraphContextGetTensorDescriptor_v2()
{
  return MEMORY[0x24BDB28E0]();
}

uint64_t BNNSGraphContextMake()
{
  return MEMORY[0x24BDB28E8]();
}

uint64_t BNNSGraphContextSetArgumentType()
{
  return MEMORY[0x24BDB28F0]();
}

uint64_t BNNSGraphContextSetDynamicShapes_v2()
{
  return MEMORY[0x24BDB28F8]();
}

uint64_t BNNSGraphE5Validate()
{
  return MEMORY[0x24BDB2918]();
}

uint64_t BNNSGraphE5ValidateGetSupportedVersion()
{
  return MEMORY[0x24BDB2920]();
}

uint64_t BNNSGraphGetInputCount()
{
  return MEMORY[0x24BDB2930]();
}

uint64_t BNNSGraphGetInputNames_v2()
{
  return MEMORY[0x24BDB2938]();
}

uint64_t BNNSGraphGetOutputCount()
{
  return MEMORY[0x24BDB2940]();
}

uint64_t BNNSGraphGetOutputNames_v2()
{
  return MEMORY[0x24BDB2948]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE50](theDict, key, value);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8B78](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::string *__cdecl std::error_code::message(std::string *__return_ptr retstr, const std::error_code *this)
{
  return (std::string *)MEMORY[0x24BEDA988](retstr, this);
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA00](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA10](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::path::lexically_relative(std::__fs::filesystem::path *__return_ptr retstr, const std::__fs::filesystem::path *this, const std::__fs::filesystem::path *__base)
{
  return (std::__fs::filesystem::path *)MEMORY[0x24BEDAA28](retstr, this, __base);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x24BEDAC08](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x24BEDAC50](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x24BEDADE0]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::istream::get()
{
  return MEMORY[0x24BEDAE08]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x24BEDAE78]();
}

{
  return MEMORY[0x24BEDAEC0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF48]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::ofstream::open()
{
  return MEMORY[0x24BEDB018]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB0B0]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::__weakly_canonical(std::__fs::filesystem::path *__return_ptr retstr, const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return (std::__fs::filesystem::path *)MEMORY[0x24BEDB298](retstr, __p, __ec);
}

BOOL std::__fs::filesystem::__create_directories(const std::__fs::filesystem::path *a1, std::error_code *a2)
{
  return MEMORY[0x24BEDB2B0](a1, a2);
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::path::replace_extension(std::__fs::filesystem::path *this, const std::__fs::filesystem::path *__replacement)
{
  return (std::__fs::filesystem::path *)MEMORY[0x24BEDB2D8](this, __replacement);
}

BOOL std::__fs::filesystem::__remove(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return MEMORY[0x24BEDB2F8](a1, __ec);
}

void std::__fs::filesystem::__rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BEDB300](__from, __to, __ec);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x24BEDB308](a1, __ec);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_25110D2C0();
}

void operator delete(void *__p)
{
  off_25110D2C8(__p);
}

uint64_t operator delete()
{
  return off_25110D2D0();
}

uint64_t operator new[]()
{
  return off_25110D2D8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_25110D2E0(__sz);
}

uint64_t operator new()
{
  return off_25110D2E8();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x24BDAEF80](a1, *(_QWORD *)&a2);
}

uint64_t mlc_binary_create()
{
  return MEMORY[0x24BE62348]();
}

uint64_t mlc_binary_destroy()
{
  return MEMORY[0x24BE62350]();
}

uint64_t mlc_binary_error()
{
  return MEMORY[0x24BE62358]();
}

uint64_t mlc_binary_execute_sync()
{
  return MEMORY[0x24BE62360]();
}

uint64_t mlc_binary_input()
{
  return MEMORY[0x24BE62368]();
}

uint64_t mlc_binary_load_sync()
{
  return MEMORY[0x24BE62370]();
}

uint64_t mlc_binary_n_inputs()
{
  return MEMORY[0x24BE62378]();
}

uint64_t mlc_binary_n_outputs()
{
  return MEMORY[0x24BE62380]();
}

uint64_t mlc_binary_output()
{
  return MEMORY[0x24BE62388]();
}

uint64_t mlc_binary_reshape_sync()
{
  return MEMORY[0x24BE62390]();
}

uint64_t mlc_binary_set_kernel_dylib()
{
  return MEMORY[0x24BE62398]();
}

uint64_t mlc_binary_validate()
{
  return MEMORY[0x24BE623A0]();
}

uint64_t mlc_event_record()
{
  return MEMORY[0x24BE623A8]();
}

uint64_t mlc_tensor_dimension()
{
  return MEMORY[0x24BE623B0]();
}

uint64_t mlc_tensor_event()
{
  return MEMORY[0x24BE623B8]();
}

uint64_t mlc_tensor_name()
{
  return MEMORY[0x24BE623C0]();
}

uint64_t mlc_tensor_rank()
{
  return MEMORY[0x24BE623C8]();
}

uint64_t mlc_tensor_set_dimension()
{
  return MEMORY[0x24BE623D8]();
}

uint64_t mlc_tensor_set_stride()
{
  return MEMORY[0x24BE623E0]();
}

uint64_t mlc_tensor_stride()
{
  return MEMORY[0x24BE623E8]();
}

uint64_t mlc_tensor_type()
{
  return MEMORY[0x24BE623F0]();
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x24BDAFD10](__name, __value, *(_QWORD *)&__overwrite);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0648]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x24BDB0730](name, targetq);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

