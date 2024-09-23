@implementation CLRegulatoryConfig

- (CLRegulatoryConfig)initWithQueue:(id)a3 defaultConfig:(id)a4
{
  id v6;
  uint64_t v7;
  CFPropertyListRef v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLRegulatoryConfig;
  v6 = -[CLRegulatoryConfig init](&v10, sel_init);
  if (v6)
  {
    v7 = operator new();
    *(_OWORD *)v7 = 0u;
    *(_OWORD *)(v7 + 16) = 0u;
    *(_DWORD *)(v7 + 32) = 1065353216;
    *(_QWORD *)(v7 + 40) = 0;
    *(_QWORD *)(v7 + 48) = 0;
    *(_QWORD *)(v7 + 56) = 0;
    *(_QWORD *)(v7 + 72) = 0;
    *(_DWORD *)(v7 + 80) = 0;
    v8 = (id)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a4, 1uLL);
    *(_QWORD *)(v7 + 64) = a3;
    *(_QWORD *)(v7 + 72) = v8;
    dispatch_retain((dispatch_object_t)a3);
    sub_18F647980((uint64_t *)v6 + 1, v7);
  }
  return (CLRegulatoryConfig *)v6;
}

- (BOOL)addConfigForIsoList:(id)a3 config:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v9;
  CLRegulatoryConfigInternal *value;
  void *DeepCopy;
  const char *v12;
  uint64_t v13;
  __objc2_class *v14;
  __objc2_class *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  NSObject *superclass;
  const char *v23;
  char *v24;
  NSObject *v25;
  void **v26;
  uint64_t v27;
  id v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint8x8_t v32;
  unint64_t v33;
  NSObject *v34;
  char *v35;
  unsigned __int8 **v36;
  unsigned __int8 *v37;
  unint64_t v38;
  unsigned __int8 *v39;
  float v40;
  float v41;
  _BOOL8 v42;
  unint64_t v43;
  unint64_t v44;
  int8x8_t prime;
  void *v46;
  _QWORD *v47;
  uint64_t v48;
  unsigned __int8 *v49;
  unint64_t v50;
  uint8x8_t v51;
  unint64_t v52;
  uint8x8_t v53;
  uint64_t v54;
  unsigned __int8 *v55;
  unint64_t v56;
  _QWORD *v57;
  unsigned __int8 **v58;
  unint64_t v59;
  _QWORD *v60;
  void **v61;
  char *v62;
  uint64_t v63;
  BOOL result;
  id v65;
  const char *v66;
  id v67;
  void *v68;
  unsigned __int8 **v69;
  uint64_t v70;
  uint64_t v71;
  void *__p[2];
  uint64_t v73;
  void *__src[2];
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  int v81;
  void **v82;
  uint8_t buf[4];
  void **v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  *a5 = 0;
  if (a3)
  {
    v7 = (uint64_t)a3;
    v9 = objc_msgSend_count(a3, a2, (uint64_t)a3, (uint64_t)a4);
    if (a4)
    {
      if (v9)
      {
        value = self->_config.__ptr_.__value_;
        DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a4, 1uLL);
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_((void *)v7, v12, (uint64_t)&v76, (uint64_t)v80, 16);
        if (!v13)
          return 1;
        v69 = (unsigned __int8 **)((char *)value + 16);
        v14 = &OBJC_METACLASS___CLHeadingInternal;
        v15 = &OBJC_METACLASS___CLHeadingInternal;
        v71 = *(_QWORD *)v77;
        v68 = DeepCopy;
        while (1)
        {
          v16 = 0;
          v70 = v13;
          do
          {
            if (*(_QWORD *)v77 != v71)
              objc_enumerationMutation((id)v7);
            v17 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v16);
            if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              if (v14[5].isa != (__objc2_class *)-1)
                dispatch_once(&qword_1EE1720C8, &unk_1E2991C28);
              superclass = v15[5].superclass;
              if (os_log_type_enabled(superclass, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18F5B3000, superclass, OS_LOG_TYPE_DEFAULT, "#clreg,#warning,addConfigForIsoList,invalidArgs,ignoring", buf, 2u);
              }
              if (sub_18F5C4AE0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (v14[5].isa != (__objc2_class *)-1)
                  dispatch_once(&qword_1EE1720C8, &unk_1E2991C28);
                LOWORD(__src[0]) = 0;
                v24 = (char *)_os_log_send_and_compose_impl();
                sub_18F5F2740("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::addConfigForIsoList(CLRegulatoryIsoList, NSDictionary *)", "CoreLocation: %s\n", v24);
                if (v24 != (char *)buf)
                  free(v24);
              }
              goto LABEL_121;
            }
            v21 = (char *)objc_msgSend_UTF8String(v17, v18, v19, v20);
            sub_18F5D5990(__src, v21);
            if (SHIBYTE(v75) < 0)
            {
              if (!__src[1])
              {
LABEL_35:
                if (v14[5].isa != (__objc2_class *)-1)
                  dispatch_once(&qword_1EE1720C8, &unk_1E2991C28);
                v34 = v15[5].superclass;
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_18F5B3000, v34, OS_LOG_TYPE_DEFAULT, "#clreg,#warning,addConfigForIsoList,emptyIso,ignoring", buf, 2u);
                }
                if (sub_18F5C4AE0(115, 2))
                {
                  bzero(buf, 0x65CuLL);
                  if (v14[5].isa != (__objc2_class *)-1)
                    dispatch_once(&qword_1EE1720C8, &unk_1E2991C28);
                  LOWORD(v81) = 0;
                  v35 = (char *)_os_log_send_and_compose_impl();
                  sub_18F5F2740("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::addConfigForIsoList(CLRegulatoryIsoList, NSDictionary *)", "CoreLocation: %s\n", v35);
                  if (v35 != (char *)buf)
                    free(v35);
                }
                goto LABEL_119;
              }
              sub_18F5C6990(__p, __src[0], (unint64_t)__src[1]);
            }
            else
            {
              if (!HIBYTE(v75))
                goto LABEL_35;
              *(_OWORD *)__p = *(_OWORD *)__src;
              v73 = v75;
            }
            if (qword_1ECD8E758 != -1)
              dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
            v25 = qword_1ECD8E750;
            if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
            {
              v26 = __p;
              if (v73 < 0)
                v26 = (void **)__p[0];
              *(_DWORD *)buf = 136315138;
              v84 = v26;
              _os_log_impl(&dword_18F5B3000, v25, OS_LOG_TYPE_DEFAULT, "#clreg,addConfigForIso,%s", buf, 0xCu);
            }
            v27 = v7;
            if (sub_18F5C4AE0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1ECD8E758 != -1)
                dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
              v61 = __p;
              if (v73 < 0)
                v61 = (void **)__p[0];
              v81 = 136315138;
              v82 = v61;
              v62 = (char *)_os_log_send_and_compose_impl();
              sub_18F5F2740("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::addConfigForIso(std::string, NSDictionary *)", "CoreLocation: %s\n", v62);
              if (v62 != (char *)buf)
                free(v62);
            }
            v28 = DeepCopy;
            v29 = sub_18F647398((uint64_t)__p);
            v30 = v29;
            v31 = *((_QWORD *)value + 1);
            if (!v31)
              goto LABEL_58;
            v32 = (uint8x8_t)vcnt_s8((int8x8_t)v31);
            v32.i16[0] = vaddlv_u8(v32);
            v33 = v32.u32[0];
            if (v32.u32[0] > 1uLL)
            {
              v7 = v29;
              if (v29 >= v31)
                v7 = v29 % v31;
            }
            else
            {
              v7 = (v31 - 1) & v29;
            }
            v36 = *(unsigned __int8 ***)(*(_QWORD *)value + 8 * v7);
            if (!v36 || (v37 = *v36) == 0)
            {
LABEL_58:
              v39 = (unsigned __int8 *)operator new(0x30uLL);
              v37 = v39;
              *(_QWORD *)v39 = 0;
              *((_QWORD *)v39 + 1) = v30;
              if (SHIBYTE(v73) < 0)
              {
                sub_18F5C6990(v39 + 16, __p[0], (unint64_t)__p[1]);
              }
              else
              {
                *((_OWORD *)v39 + 1) = *(_OWORD *)__p;
                *((_QWORD *)v39 + 4) = v73;
              }
              *((_QWORD *)v37 + 5) = 0;
              v40 = (float)(unint64_t)(*((_QWORD *)value + 3) + 1);
              v41 = *((float *)value + 8);
              if (!v31 || (float)(v41 * (float)v31) < v40)
              {
                v42 = (v31 & (v31 - 1)) != 0;
                if (v31 < 3)
                  v42 = 1;
                v43 = v42 | (2 * v31);
                v44 = vcvtps_u32_f32(v40 / v41);
                if (v43 <= v44)
                  prime = (int8x8_t)v44;
                else
                  prime = (int8x8_t)v43;
                if (*(_QWORD *)&prime == 1)
                {
                  prime = (int8x8_t)2;
                }
                else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
                {
                  prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
                }
                v31 = *((_QWORD *)value + 1);
                if (*(_QWORD *)&prime <= v31)
                {
                  if (*(_QWORD *)&prime < v31)
                  {
                    v52 = vcvtps_u32_f32((float)*((unint64_t *)value + 3) / *((float *)value + 8));
                    if (v31 < 3
                      || (v53 = (uint8x8_t)vcnt_s8((int8x8_t)v31), v53.i16[0] = vaddlv_u8(v53), v53.u32[0] > 1uLL))
                    {
                      v52 = std::__next_prime(v52);
                    }
                    else
                    {
                      v54 = 1 << -(char)__clz(v52 - 1);
                      if (v52 >= 2)
                        v52 = v54;
                    }
                    if (*(_QWORD *)&prime <= v52)
                      prime = (int8x8_t)v52;
                    if (*(_QWORD *)&prime >= v31)
                    {
                      v31 = *((_QWORD *)value + 1);
                    }
                    else
                    {
                      if (prime)
                        goto LABEL_73;
                      v60 = *(_QWORD **)value;
                      *(_QWORD *)value = 0;
                      if (v60)
                        operator delete(v60);
                      v31 = 0;
                      *((_QWORD *)value + 1) = 0;
                    }
                  }
                }
                else
                {
LABEL_73:
                  if (*(_QWORD *)&prime >> 61)
                    sub_18F5F689C();
                  v46 = operator new(8 * *(_QWORD *)&prime);
                  v47 = *(_QWORD **)value;
                  *(_QWORD *)value = v46;
                  if (v47)
                    operator delete(v47);
                  v48 = 0;
                  *((int8x8_t *)value + 1) = prime;
                  do
                    *(_QWORD *)(*(_QWORD *)value + 8 * v48++) = 0;
                  while (*(_QWORD *)&prime != v48);
                  v49 = *v69;
                  if (*v69)
                  {
                    v50 = *((_QWORD *)v49 + 1);
                    v51 = (uint8x8_t)vcnt_s8(prime);
                    v51.i16[0] = vaddlv_u8(v51);
                    if (v51.u32[0] > 1uLL)
                    {
                      if (v50 >= *(_QWORD *)&prime)
                        v50 %= *(_QWORD *)&prime;
                    }
                    else
                    {
                      v50 &= *(_QWORD *)&prime - 1;
                    }
                    *(_QWORD *)(*(_QWORD *)value + 8 * v50) = v69;
                    v55 = *(unsigned __int8 **)v49;
                    if (*(_QWORD *)v49)
                    {
                      do
                      {
                        v56 = *((_QWORD *)v55 + 1);
                        if (v51.u32[0] > 1uLL)
                        {
                          if (v56 >= *(_QWORD *)&prime)
                            v56 %= *(_QWORD *)&prime;
                        }
                        else
                        {
                          v56 &= *(_QWORD *)&prime - 1;
                        }
                        if (v56 != v50)
                        {
                          if (!*(_QWORD *)(*(_QWORD *)value + 8 * v56))
                          {
                            *(_QWORD *)(*(_QWORD *)value + 8 * v56) = v49;
                            goto LABEL_98;
                          }
                          *(_QWORD *)v49 = *(_QWORD *)v55;
                          *(_QWORD *)v55 = **(_QWORD **)(*(_QWORD *)value + 8 * v56);
                          **(_QWORD **)(*(_QWORD *)value + 8 * v56) = v55;
                          v55 = v49;
                        }
                        v56 = v50;
LABEL_98:
                        v49 = v55;
                        v55 = *(unsigned __int8 **)v55;
                        v50 = v56;
                      }
                      while (v55);
                    }
                  }
                  v31 = (unint64_t)prime;
                }
                if ((v31 & (v31 - 1)) != 0)
                {
                  if (v30 >= v31)
                    v7 = v30 % v31;
                  else
                    v7 = v30;
                }
                else
                {
                  v7 = (v31 - 1) & v30;
                }
              }
              v57 = *(_QWORD **)value;
              v58 = *(unsigned __int8 ***)(*(_QWORD *)value + 8 * v7);
              if (v58)
              {
                *(_QWORD *)v37 = *v58;
                v7 = v27;
                v13 = v70;
                v14 = &OBJC_METACLASS___CLHeadingInternal;
                v15 = &OBJC_METACLASS___CLHeadingInternal;
                goto LABEL_115;
              }
              *(_QWORD *)v37 = *v69;
              *v69 = v37;
              v57[v7] = v69;
              v7 = v27;
              v13 = v70;
              v14 = &OBJC_METACLASS___CLHeadingInternal;
              v15 = &OBJC_METACLASS___CLHeadingInternal;
              if (*(_QWORD *)v37)
              {
                v59 = *(_QWORD *)(*(_QWORD *)v37 + 8);
                if ((v31 & (v31 - 1)) != 0)
                {
                  if (v59 >= v31)
                    v59 %= v31;
                }
                else
                {
                  v59 &= v31 - 1;
                }
                v58 = (unsigned __int8 **)(*(_QWORD *)value + 8 * v59);
LABEL_115:
                *v58 = v37;
              }
              ++*((_QWORD *)value + 3);
              goto LABEL_117;
            }
            while (1)
            {
              v38 = *((_QWORD *)v37 + 1);
              if (v38 == v30)
                break;
              if (v33 > 1)
              {
                if (v38 >= v31)
                  v38 %= v31;
              }
              else
              {
                v38 &= v31 - 1;
              }
              if (v38 != v7)
              {
LABEL_57:
                DeepCopy = v68;
                goto LABEL_58;
              }
LABEL_56:
              v37 = *(unsigned __int8 **)v37;
              if (!v37)
                goto LABEL_57;
            }
            if (!sub_18F6477E8(v37 + 16, (unsigned __int8 *)__p))
              goto LABEL_56;
            v7 = v27;
            DeepCopy = v68;
            v13 = v70;
            v14 = &OBJC_METACLASS___CLHeadingInternal;
            v15 = &OBJC_METACLASS___CLHeadingInternal;
LABEL_117:
            *((_QWORD *)v37 + 5) = v28;
            if (SHIBYTE(v73) < 0)
              operator delete(__p[0]);
LABEL_119:
            if (SHIBYTE(v75) < 0)
              operator delete(__src[0]);
LABEL_121:
            ++v16;
          }
          while (v16 != v13);
          v63 = objc_msgSend_countByEnumeratingWithState_objects_count_((void *)v7, v23, (uint64_t)&v76, (uint64_t)v80, 16);
          v13 = v63;
          if (!v63)
            return 1;
        }
      }
    }
  }
  v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v67 = (id)objc_msgSend_initWithDomain_code_userInfo_(v65, v66, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 7, 0);
  result = 0;
  *a5 = v67;
  return result;
}

- (BOOL)addConfigForRegionList:(id)a3 config:(id)a4 error:(id *)a5
{
  uint64_t v9;
  CLRegulatoryConfigInternal *value;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  const char *v51;
  id v52;
  unint64_t v53;
  char *v54;
  _QWORD *v55;
  NSObject *v56;
  NSObject *v57;
  char *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  __int128 v66;
  char *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  BOOL result;
  id v85;
  const char *v86;
  id v87;
  void *DeepCopy;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  int v94;
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  uint64_t v99;
  uint8_t buf[4];
  uint64_t v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  uint64_t v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  *a5 = 0;
  if (a3)
  {
    v9 = objc_msgSend_count(a3, a2, (uint64_t)a3, (uint64_t)a4);
    if (a4)
    {
      if (v9)
      {
        value = self->_config.__ptr_.__value_;
        DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a4, 1uLL);
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        v92 = 0u;
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v11, (uint64_t)&v89, (uint64_t)v93, 16);
        if (!v12)
          return 1;
        v13 = *(_QWORD *)v90;
        while (1)
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v90 != v13)
              objc_enumerationMutation(a3);
            v15 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v14);
            if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_msgSend_radius(v15, v16, v17, v18);
              if (v19 > 0.0)
              {
                if (qword_1ECD8E758 != -1)
                  dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
                v20 = qword_1ECD8E750;
                if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend_center(v15, v21, v22, v23);
                  v25 = v24;
                  objc_msgSend_center(v15, v26, v27, v28);
                  v30 = v29;
                  objc_msgSend_radius(v15, v31, v32, v33);
                  *(_DWORD *)buf = 134218496;
                  v101 = v25;
                  v102 = 2048;
                  v103 = v30;
                  v104 = 2048;
                  v105 = v34;
                  _os_log_impl(&dword_18F5B3000, v20, OS_LOG_TYPE_DEFAULT, "#clreg,addConfigForCircularRegion,%.6f,%.6f,%.2f", buf, 0x20u);
                }
                if (sub_18F5C4AE0(115, 2))
                {
                  bzero(buf, 0x65CuLL);
                  if (qword_1ECD8E758 != -1)
                    dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
                  objc_msgSend_center(v15, v68, v69, v70);
                  v72 = v71;
                  objc_msgSend_center(v15, v73, v74, v75);
                  v77 = v76;
                  objc_msgSend_radius(v15, v78, v79, v80);
                  v94 = 134218496;
                  v95 = v72;
                  v96 = 2048;
                  v97 = v77;
                  v98 = 2048;
                  v99 = v81;
                  v82 = (char *)_os_log_send_and_compose_impl();
                  sub_18F5F2740("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::addConfigForCircularRegion(CLCircularRegion *, NSDictionary *)", "CoreLocation: %s\n", v82);
                  if (v82 != (char *)buf)
                    free(v82);
                }
                objc_msgSend_center(v15, v35, v36, v37);
                v39 = v38;
                objc_msgSend_center(v15, v40, v41, v42);
                v44 = v43;
                objc_msgSend_radius(v15, v45, v46, v47);
                v49 = v48;
                v50 = DeepCopy;
                v52 = v50;
                v54 = (char *)*((_QWORD *)value + 6);
                v53 = *((_QWORD *)value + 7);
                if ((unint64_t)v54 >= v53)
                {
                  v58 = (char *)*((_QWORD *)value + 5);
                  v59 = (v54 - v58) >> 5;
                  v60 = v59 + 1;
                  if ((unint64_t)(v59 + 1) >> 59)
                    sub_18F5F7864();
                  v61 = v53 - (_QWORD)v58;
                  if (v61 >> 4 > v60)
                    v60 = v61 >> 4;
                  if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFE0)
                    v62 = 0x7FFFFFFFFFFFFFFLL;
                  else
                    v62 = v60;
                  if (v62)
                  {
                    if (v62 >> 59)
                      sub_18F5F689C();
                    v63 = (char *)operator new(32 * v62);
                  }
                  else
                  {
                    v63 = 0;
                  }
                  v64 = &v63[32 * v59];
                  *(_QWORD *)v64 = v39;
                  *((_QWORD *)v64 + 1) = v44;
                  *((_QWORD *)v64 + 2) = v49;
                  *((_QWORD *)v64 + 3) = v52;
                  v65 = v64;
                  if (v54 != v58)
                  {
                    do
                    {
                      v66 = *((_OWORD *)v54 - 1);
                      *((_OWORD *)v65 - 2) = *((_OWORD *)v54 - 2);
                      *((_OWORD *)v65 - 1) = v66;
                      v65 -= 32;
                      v54 -= 32;
                    }
                    while (v54 != v58);
                    v54 = (char *)*((_QWORD *)value + 5);
                  }
                  v55 = v64 + 32;
                  *((_QWORD *)value + 5) = v65;
                  *((_QWORD *)value + 6) = v64 + 32;
                  *((_QWORD *)value + 7) = &v63[32 * v62];
                  if (v54)
                    operator delete(v54);
                }
                else
                {
                  *(_QWORD *)v54 = v39;
                  *((_QWORD *)v54 + 1) = v44;
                  *((_QWORD *)v54 + 2) = v49;
                  v55 = v54 + 32;
                  *((_QWORD *)v54 + 3) = v50;
                }
                *((_QWORD *)value + 6) = v55;
                goto LABEL_24;
              }
              if (qword_1EE1720C8 != -1)
                dispatch_once(&qword_1EE1720C8, &unk_1E2991C28);
              v57 = qword_1EE1720D0;
              if (os_log_type_enabled((os_log_t)qword_1EE1720D0, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18F5B3000, v57, OS_LOG_TYPE_DEFAULT, "#clreg,#warning,addConfigForCircularRegionList,invalidRadius,ignoring", buf, 2u);
              }
              if (sub_18F5C4AE0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1EE1720C8 == -1)
                {
LABEL_50:
                  LOWORD(v94) = 0;
                  v67 = (char *)_os_log_send_and_compose_impl();
                  sub_18F5F2740("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::addConfigForCircularRegionList(CLRegulatoryCircularRegionList, NSDictionary *)", "CoreLocation: %s\n", v67);
                  if (v67 != (char *)buf)
                    free(v67);
                  goto LABEL_24;
                }
LABEL_56:
                dispatch_once(&qword_1EE1720C8, &unk_1E2991C28);
                goto LABEL_50;
              }
            }
            else
            {
              if (qword_1EE1720C8 != -1)
                dispatch_once(&qword_1EE1720C8, &unk_1E2991C28);
              v56 = qword_1EE1720D0;
              if (os_log_type_enabled((os_log_t)qword_1EE1720D0, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18F5B3000, v56, OS_LOG_TYPE_DEFAULT, "#clreg,#warning,addConfigForCircularRegionList,invalidArgs,ignoring", buf, 2u);
              }
              if (sub_18F5C4AE0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1EE1720C8 == -1)
                  goto LABEL_50;
                goto LABEL_56;
              }
            }
LABEL_24:
            ++v14;
          }
          while (v14 != v12);
          v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v51, (uint64_t)&v89, (uint64_t)v93, 16);
          v12 = v83;
          if (!v83)
            return 1;
        }
      }
    }
  }
  v85 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v87 = (id)objc_msgSend_initWithDomain_code_userInfo_(v85, v86, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 7, 0);
  result = 0;
  *a5 = v87;
  return result;
}

- (void)fetchConfigForLocation:(id)a3 withReply:(id)a4
{
  CLRegulatoryConfigInternal *value;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  NSObject *v29;
  NSObject *v30;
  void (*v31)(uint64_t);
  NSObject *v32;
  _BYTE *v33;
  double *v34;
  double *v35;
  double v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  NSObject *v48;
  double v49;
  uint64_t v50;
  void *v51;
  char *v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  int v67;
  _BYTE *v68;
  NSObject *v69;
  double v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  char *v88;
  char *v89;
  char *v90;
  char *v91;
  char *v92;
  char *v93;
  CLRegulatoryConfigInternal *v94;
  _BYTE v95[24];
  void *v96;
  id v97;
  uint64_t v98;
  _BYTE buf[24];
  void *v100;
  __int128 v101;
  uint64_t v102;
  int v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  value = self->_config.__ptr_.__value_;
  if (!a3)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
    v32 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v32, OS_LOG_TYPE_DEFAULT, "#clreg,fetchConfigForLocation,#warning,location is nil", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
      *(_WORD *)v95 = 0;
      v89 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::fetchConfigForLocation(CLLocation *, CLRegulatoryConfigCallback)", "CoreLocation: %s\n", v89);
      if (v89 != buf)
        free(v89);
    }
    v30 = *((_QWORD *)value + 8);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    v31 = sub_18F6431F4;
    goto LABEL_20;
  }
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_coordinate(a3, v8, v9, v10);
    v12 = v11;
    objc_msgSend_coordinate(a3, v13, v14, v15);
    v17 = v16;
    objc_msgSend_horizontalAccuracy(a3, v18, v19, v20);
    *(_DWORD *)buf = 134284033;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2049;
    *(_QWORD *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2049;
    v100 = v21;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "#clreg,fetchConfigForLocation,%{private}.6f,%{private}.6f,%{private}.2f", buf, 0x20u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
    objc_msgSend_coordinate(a3, v74, v75, v76);
    v78 = v77;
    objc_msgSend_coordinate(a3, v79, v80, v81);
    v83 = v82;
    objc_msgSend_horizontalAccuracy(a3, v84, v85, v86);
    *(_DWORD *)v95 = 134284033;
    *(_QWORD *)&v95[4] = v78;
    *(_WORD *)&v95[12] = 2049;
    *(_QWORD *)&v95[14] = v83;
    *(_WORD *)&v95[22] = 2049;
    v96 = v87;
    v88 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::fetchConfigForLocation(CLLocation *, CLRegulatoryConfigCallback)", "CoreLocation: %s\n", v88);
    if (v88 != buf)
      free(v88);
  }
  objc_msgSend_horizontalAccuracy(a3, v22, v23, v24);
  if (v28 < 0.0)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
    v29 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v29, OS_LOG_TYPE_DEFAULT, "#clreg,fetchConfigForLocation,#warning,invalidAccuracy", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
      *(_WORD *)v95 = 0;
      v90 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::fetchConfigForLocation(CLLocation *, CLRegulatoryConfigCallback)", "CoreLocation: %s\n", v90);
      if (v90 != buf)
        free(v90);
    }
    v30 = *((_QWORD *)value + 8);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    v31 = sub_18F643208;
LABEL_20:
    *(_QWORD *)&buf[16] = v31;
    v100 = &unk_1E2991AA0;
    *((_QWORD *)&v101 + 1) = value;
LABEL_21:
    *(_QWORD *)&v101 = a4;
    v33 = buf;
LABEL_22:
    dispatch_async(v30, v33);
    return;
  }
  v94 = value;
  v35 = (double *)*((_QWORD *)value + 5);
  v34 = (double *)*((_QWORD *)value + 6);
  if (v35 != v34)
  {
    while (1)
    {
      objc_msgSend_coordinate(a3, v25, v26, v27);
      v37 = v36;
      objc_msgSend_coordinate(a3, v38, v39, v40);
      v42 = sub_18F5BD12C(v37, v41, *v35, v35[1]);
      v43 = v35[2];
      objc_msgSend_horizontalAccuracy(a3, v44, v45, v46);
      if (v42 < v43 + v47)
        break;
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
      v48 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
      {
        v49 = *v35;
        v50 = *((_QWORD *)v35 + 1);
        v51 = (void *)*((_QWORD *)v35 + 2);
        *(_DWORD *)buf = 134284289;
        *(double *)&buf[4] = v49;
        *(_WORD *)&buf[12] = 2049;
        *(_QWORD *)&buf[14] = v50;
        *(_WORD *)&buf[22] = 2049;
        v100 = v51;
        LOWORD(v101) = 2049;
        *(double *)((char *)&v101 + 2) = v42;
        _os_log_impl(&dword_18F5B3000, v48, OS_LOG_TYPE_DEBUG, "#clreg,fetchRAEConfig,%{private}.6f,%{private}.6f,%{private}.2f,distToLocation,%{private}2.f,result,notFound", buf, 0x2Au);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
        v52 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLRegulatoryConfigInternal::fetchRAEConfig(CLLocation *, CLRegulatoryConfigCallback)", "CoreLocation: %s\n", v52);
        if (v52 != buf)
          free(v52);
      }
      v35 += 4;
      if (v35 == v34)
        goto LABEL_36;
    }
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
    v69 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
    {
      v70 = *v35;
      v71 = *((_QWORD *)v35 + 1);
      v72 = (void *)*((_QWORD *)v35 + 2);
      *(_DWORD *)buf = 134284289;
      *(double *)&buf[4] = v70;
      *(_WORD *)&buf[12] = 2049;
      *(_QWORD *)&buf[14] = v71;
      *(_WORD *)&buf[22] = 2049;
      v100 = v72;
      LOWORD(v101) = 2049;
      *(double *)((char *)&v101 + 2) = v42;
      _os_log_impl(&dword_18F5B3000, v69, OS_LOG_TYPE_DEBUG, "#clreg,fetchRAEConfig,%{private}.6f,%{private}.6f,%{private}.2f,distToLocation,%{private}2.f,result,found", buf, 0x2Au);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
      v92 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLRegulatoryConfigInternal::fetchRAEConfig(CLLocation *, CLRegulatoryConfigCallback)", "CoreLocation: %s\n", v92);
      if (v92 != buf)
        free(v92);
    }
    v30 = *((_QWORD *)v94 + 8);
    *(_QWORD *)v95 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v95[8] = 3221225472;
    *(_QWORD *)&v95[16] = sub_18F641404;
    v96 = &unk_1E2991AA0;
    v97 = a4;
    v98 = (uint64_t)v35;
    v33 = v95;
    goto LABEL_22;
  }
LABEL_36:
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
  v53 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v53, OS_LOG_TYPE_DEBUG, "#clreg,fetchRAEConfig,no RAEs matched", buf, 2u);
  }
  v57 = (uint64_t)v94;
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
    v91 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLRegulatoryConfigInternal::fetchRAEConfig(CLLocation *, CLRegulatoryConfigCallback)", "CoreLocation: %s\n", v91);
    if (v91 != buf)
      free(v91);
    v57 = (uint64_t)v94;
  }
  v58 = sub_18F6415D4(a3, v54, v55, v56);
  if (!v58)
  {
    if (qword_1EE1720C8 != -1)
      dispatch_once(&qword_1EE1720C8, &unk_1E2991C28);
    v73 = qword_1EE1720D0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720D0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v73, OS_LOG_TYPE_DEFAULT, "#clreg,#warning,fetchIsoOrDefaultConfig,geoLocationAllocFailed", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720C8 != -1)
        dispatch_once(&qword_1EE1720C8, &unk_1E2991C28);
      *(_WORD *)v95 = 0;
      v93 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::fetchIsoOrDefaultConfig(CLLocation *, CLRegulatoryConfigCallback)", "CoreLocation: %s\n", v93);
      if (v93 != buf)
        free(v93);
      v57 = (uint64_t)v94;
    }
    v30 = *(NSObject **)(v57 + 64);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_18F642A44;
    v100 = &unk_1E2991AA0;
    *((_QWORD *)&v101 + 1) = v57;
    goto LABEL_21;
  }
  v62 = v58;
  objc_msgSend_horizontalAccuracy(v58, v59, v60, v61);
  *(_QWORD *)v95 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v95[8] = 3221225472;
  *(_QWORD *)&v95[16] = sub_18F642A58;
  v96 = &unk_1E2991AF0;
  v97 = a4;
  v98 = v57;
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = sub_18F642C6C;
  v100 = &unk_1E2991B40;
  *((_QWORD *)&v101 + 1) = a4;
  v102 = v57;
  *(_QWORD *)&v101 = v62;
  v103 = (int)v66;
  v67 = *(_DWORD *)(v57 + 80);
  if (v67 <= (int)v66)
  {
    v68 = v95;
  }
  else
  {
    objc_msgSend_setHorizontalAccuracy_(v62, v63, v64, v65, (double)v67);
    v68 = buf;
  }
  sub_18F641D18(v57, v62, (uint64_t)v68);
}

- (void)fetchInfoForLocation:(id)a3 withReply:(id)a4
{
  CLRegulatoryConfigInternal *value;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  NSObject *v46;
  double v47;
  uint64_t v48;
  void *v49;
  double v50;
  uint64_t v51;
  void *v52;
  char *v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  int v67;
  _BYTE *v68;
  NSObject *v69;
  double v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  NSObject *v74;
  char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  char *v90;
  char *v91;
  char *v92;
  double v93;
  uint64_t v94;
  void *v95;
  char *v96;
  _BYTE v97[24];
  void *v98;
  __int128 v99;
  _BYTE buf[24];
  void *v101;
  __int128 v102;
  CLRegulatoryConfigInternal *v103;
  int v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  value = self->_config.__ptr_.__value_;
  if (!a3)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
    v30 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v30, OS_LOG_TYPE_DEFAULT, "#clreg,fetchInfoForLocation,#warning,location is nil", buf, 2u);
    }
    if (!sub_18F5C4AE0(115, 2))
      goto LABEL_21;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
    *(_WORD *)v97 = 0;
    goto LABEL_69;
  }
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_coordinate(a3, v8, v9, v10);
    v12 = v11;
    objc_msgSend_coordinate(a3, v13, v14, v15);
    v17 = v16;
    objc_msgSend_horizontalAccuracy(a3, v18, v19, v20);
    *(_DWORD *)buf = 134284033;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2049;
    *(_QWORD *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2049;
    v101 = v21;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "#clreg,fetchInfoForLocation,%{private}.6f,%{private}.6f,%{private}.2f", buf, 0x20u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
    objc_msgSend_coordinate(a3, v76, v77, v78);
    v80 = v79;
    objc_msgSend_coordinate(a3, v81, v82, v83);
    v85 = v84;
    objc_msgSend_horizontalAccuracy(a3, v86, v87, v88);
    *(_DWORD *)v97 = 134284033;
    *(_QWORD *)&v97[4] = v80;
    *(_WORD *)&v97[12] = 2049;
    *(_QWORD *)&v97[14] = v85;
    *(_WORD *)&v97[22] = 2049;
    v98 = v89;
    v90 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::fetchInfoForLocation(CLLocation *, CLRegulatoryInfoCallback)", "CoreLocation: %s\n", v90);
    if (v90 != buf)
      free(v90);
  }
  objc_msgSend_horizontalAccuracy(a3, v22, v23, v24);
  if (v28 < 0.0)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
    v29 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v29, OS_LOG_TYPE_DEFAULT, "#clreg,fetchInfoForLocation,#warning,invalidAccuracy", buf, 2u);
    }
    if (!sub_18F5C4AE0(115, 2))
      goto LABEL_21;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
    *(_WORD *)v97 = 0;
LABEL_69:
    v91 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::fetchInfoForLocation(CLLocation *, CLRegulatoryInfoCallback)", "CoreLocation: %s\n", v91);
    if (v91 != buf)
      free(v91);
LABEL_21:
    v31 = *((_QWORD *)value + 8);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_18F64321C;
    v101 = &unk_1E2991AA0;
    *(_QWORD *)&v102 = a4;
    *((_QWORD *)&v102 + 1) = value;
LABEL_22:
    dispatch_async(v31, buf);
    return;
  }
  v33 = *((_QWORD *)value + 5);
  v32 = *((_QWORD *)value + 6);
  if (v33 != v32)
  {
    while (1)
    {
      objc_msgSend_coordinate(a3, v25, v26, v27);
      v35 = v34;
      objc_msgSend_coordinate(a3, v36, v37, v38);
      v40 = sub_18F5BD12C(v35, v39, *(double *)v33, *(double *)(v33 + 8));
      v41 = *(double *)(v33 + 16);
      objc_msgSend_horizontalAccuracy(a3, v42, v43, v44);
      if (v40 < v41 + v45)
        break;
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
      v46 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
      {
        v47 = *(double *)v33;
        v48 = *(_QWORD *)(v33 + 8);
        v49 = *(void **)(v33 + 16);
        *(_DWORD *)buf = 134284289;
        *(double *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 2049;
        *(_QWORD *)&buf[14] = v48;
        *(_WORD *)&buf[22] = 2049;
        v101 = v49;
        LOWORD(v102) = 2049;
        *(double *)((char *)&v102 + 2) = v40;
        _os_log_impl(&dword_18F5B3000, v46, OS_LOG_TYPE_DEBUG, "#clreg,findRAEConfig,%{private}.6f,%{private}.6f,%{private}.2f,distToLocation,%{private}2.f,result,notFound", buf, 0x2Au);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
        v50 = *(double *)v33;
        v51 = *(_QWORD *)(v33 + 8);
        v52 = *(void **)(v33 + 16);
        *(_DWORD *)v97 = 134284289;
        *(double *)&v97[4] = v50;
        *(_WORD *)&v97[12] = 2049;
        *(_QWORD *)&v97[14] = v51;
        *(_WORD *)&v97[22] = 2049;
        v98 = v52;
        LOWORD(v99) = 2049;
        *(double *)((char *)&v99 + 2) = v40;
        v53 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "const CLRegulatoryConfigInternal::CircularZoneConfig *CLRegulatoryConfigInternal::findRAEConfig(CLLocation *)", "CoreLocation: %s\n", v53);
        if (v53 != buf)
          free(v53);
      }
      v33 += 32;
      if (v33 == v32)
        goto LABEL_36;
    }
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
    v69 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
    {
      v70 = *(double *)v33;
      v71 = *(_QWORD *)(v33 + 8);
      v72 = *(void **)(v33 + 16);
      *(_DWORD *)buf = 134284289;
      *(double *)&buf[4] = v70;
      *(_WORD *)&buf[12] = 2049;
      *(_QWORD *)&buf[14] = v71;
      *(_WORD *)&buf[22] = 2049;
      v101 = v72;
      LOWORD(v102) = 2049;
      *(double *)((char *)&v102 + 2) = v40;
      _os_log_impl(&dword_18F5B3000, v69, OS_LOG_TYPE_DEBUG, "#clreg,findRAEConfig,%{private}.6f,%{private}.6f,%{private}.2f,distToLocation,%{private}2.f,result,found", buf, 0x2Au);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
      v93 = *(double *)v33;
      v94 = *(_QWORD *)(v33 + 8);
      v95 = *(void **)(v33 + 16);
      *(_DWORD *)v97 = 134284289;
      *(double *)&v97[4] = v93;
      *(_WORD *)&v97[12] = 2049;
      *(_QWORD *)&v97[14] = v94;
      *(_WORD *)&v97[22] = 2049;
      v98 = v95;
      LOWORD(v99) = 2049;
      *(double *)((char *)&v99 + 2) = v40;
      v96 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "const CLRegulatoryConfigInternal::CircularZoneConfig *CLRegulatoryConfigInternal::findRAEConfig(CLLocation *)", "CoreLocation: %s\n", v96);
      if (v96 != buf)
        free(v96);
    }
    v73 = *(_QWORD *)(v33 + 24);
    v31 = *((_QWORD *)value + 8);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_18F643238;
    v101 = &unk_1E2990F20;
    *(_QWORD *)&v102 = v73;
    *((_QWORD *)&v102 + 1) = a4;
    goto LABEL_22;
  }
LABEL_36:
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
  v54 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v54, OS_LOG_TYPE_DEBUG, "#clreg,findRAEConfig,no RAEs matched", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29903F0);
    *(_WORD *)v97 = 0;
    v92 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "const CLRegulatoryConfigInternal::CircularZoneConfig *CLRegulatoryConfigInternal::findRAEConfig(CLLocation *)", "CoreLocation: %s\n", v92);
    if (v92 != buf)
      free(v92);
  }
  v58 = sub_18F6415D4(a3, v55, v56, v57);
  if (!v58)
  {
    if (qword_1EE1720C8 != -1)
      dispatch_once(&qword_1EE1720C8, &unk_1E2991C28);
    v74 = qword_1EE1720D0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720D0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v74, OS_LOG_TYPE_DEFAULT, "#clreg,#warning,fetchIsoOrDefaultConfig,geoLocationAllocFailed", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720C8 != -1)
        dispatch_once(&qword_1EE1720C8, &unk_1E2991C28);
      *(_WORD *)v97 = 0;
      v75 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::sendIsoOrDefaultInfo(CLLocation *, CLRegulatoryInfoCallback)", "CoreLocation: %s\n", v75);
      if (v75 != buf)
        free(v75);
    }
    goto LABEL_21;
  }
  v62 = v58;
  objc_msgSend_horizontalAccuracy(v58, v59, v60, v61);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = sub_18F644740;
  v101 = &unk_1E2991BE0;
  *((_QWORD *)&v102 + 1) = a4;
  v103 = value;
  *(_QWORD *)&v102 = v62;
  v104 = (int)v66;
  v67 = *((_DWORD *)value + 20);
  if (v67 <= (int)v66)
  {
    *(_QWORD *)v97 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v97[8] = 3221225472;
    *(_QWORD *)&v97[16] = sub_18F644924;
    v98 = &unk_1E2991C08;
    *(_QWORD *)&v99 = a4;
    *((_QWORD *)&v99 + 1) = value;
    v68 = v97;
  }
  else
  {
    objc_msgSend_setHorizontalAccuracy_(v62, v63, v64, v65, (double)v67);
    v68 = buf;
  }
  sub_18F6439CC((uint64_t)value, v62, (uint64_t)v68);
}

- (BOOL)setExtendedBorderDetection:(BOOL)a3 withExtendedDistance:(int)a4
{
  if (!a3)
    a4 = 0;
  *((_DWORD *)self->_config.__ptr_.__value_ + 20) = a4;
  return 1;
}

- (void).cxx_destruct
{
  sub_18F647980((uint64_t *)&self->_config, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
