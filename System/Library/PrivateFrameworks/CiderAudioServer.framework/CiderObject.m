@implementation CiderObject

- (id)init:(shared_ptr<RouteSessionAttributes>)a3
{
  RouteSessionAttributes *ptr;
  char *v4;
  unsigned __int8 v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  __int128 v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *shared_owners;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t *p_shared_weak_owners;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  uint64_t v39;
  std::__shared_weak_count *v40;

  ptr = a3.__ptr_;
  v38.receiver = self;
  v38.super_class = (Class)CiderObject;
  v4 = -[CiderObject init](&v38, sel_init, a3.__ptr_, a3.__cntrl_);
  if (!v4)
    return v4;
  if ((v5 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))std::weak_ptr<ads::Kernel>::~weak_ptr, &util::ref_counted_singleton::get_or_create<ads::Kernel>()::sWeakInstanceRef, &dword_237B88000);
  }
  v39 = 0;
  v40 = 0;
  if (!qword_256872800)
  {
    v7 = 0;
    goto LABEL_8;
  }
  v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_256872800);
  v7 = v6;
  v40 = v6;
  if (!v6 || (v39 = util::ref_counted_singleton::get_or_create<ads::Kernel>()::sWeakInstanceRef) == 0)
  {
LABEL_8:
    v9 = (std::__shared_weak_count *)operator new(0x58uLL);
    v9->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    v9->__shared_weak_owners_ = 0;
    v9->__vftable = (std::__shared_weak_count_vtbl *)&off_2509A2450;
    ads::Kernel::Kernel((ads::Kernel *)&v9[1]);
    *(_QWORD *)&v8 = v9 + 1;
    shared_owners = (std::__shared_weak_count *)v9[1].__shared_owners_;
    if (shared_owners)
    {
      if (shared_owners->__shared_owners_ != -1)
      {
LABEL_21:
        *((_QWORD *)&v8 + 1) = v9;
        p_shared_weak_owners = (unint64_t *)&v9->__shared_weak_owners_;
        do
          v20 = __ldxr(p_shared_weak_owners);
        while (__stxr(v20 + 1, p_shared_weak_owners));
        v21 = (std::__shared_weak_count *)qword_256872800;
        util::ref_counted_singleton::get_or_create<ads::Kernel>()::sWeakInstanceRef = (uint64_t)&v9[1];
        qword_256872800 = (uint64_t)v9;
        if (v21)
        {
          v36 = v8;
          std::__shared_weak_count::__release_weak(v21);
          v8 = v36;
        }
        if (v7)
        {
          v22 = (unint64_t *)&v7->__shared_owners_;
          do
            v23 = __ldaxr(v22);
          while (__stlxr(v23 - 1, v22));
          if (!v23)
          {
            v37 = v8;
            ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
            std::__shared_weak_count::__release_weak(v7);
            v8 = v37;
          }
        }
        goto LABEL_30;
      }
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
      v13 = (unint64_t *)&v9->__shared_weak_owners_;
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
      v9[1].__vftable = (std::__shared_weak_count_vtbl *)&v9[1];
      v9[1].__shared_owners_ = (uint64_t)v9;
      std::__shared_weak_count::__release_weak(shared_owners);
      *(_QWORD *)&v8 = v9 + 1;
    }
    else
    {
      do
        v15 = __ldxr(p_shared_owners);
      while (__stxr(v15 + 1, p_shared_owners));
      v16 = (unint64_t *)&v9->__shared_weak_owners_;
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
      v9[1].__vftable = (std::__shared_weak_count_vtbl *)&v9[1];
      v9[1].__shared_owners_ = (uint64_t)v9;
    }
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      v35 = v8;
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
      *(_QWORD *)&v8 = v35;
    }
    goto LABEL_21;
  }
  *(_QWORD *)&v8 = util::ref_counted_singleton::get_or_create<ads::Kernel>()::sWeakInstanceRef;
  *((_QWORD *)&v8 + 1) = v6;
LABEL_30:
  v24 = (std::__shared_weak_count *)*((_QWORD *)v4 + 2);
  *(_OWORD *)(v4 + 8) = v8;
  if (v24)
  {
    v25 = (unint64_t *)&v24->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v28 = *(_QWORD *)ptr;
  v27 = *((_QWORD *)ptr + 1);
  if (v27)
  {
    v29 = (unint64_t *)(v27 + 8);
    do
      v30 = __ldxr(v29);
    while (__stxr(v30 + 1, v29));
  }
  v31 = (std::__shared_weak_count *)*((_QWORD *)v4 + 4);
  *((_QWORD *)v4 + 3) = v28;
  *((_QWORD *)v4 + 4) = v27;
  if (v31)
  {
    v32 = (unint64_t *)&v31->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  return v4;
}

- (void)clearReporterOpts
{
  RouteSessionAttributes *ptr;

  ptr = self->mRouteSessionAttrsPtr.__ptr_;
  if (*((_BYTE *)ptr + 16))
  {

    *((_BYTE *)ptr + 16) = 0;
    ptr = self->mRouteSessionAttrsPtr.__ptr_;
  }
  if (*((_BYTE *)ptr + 48))
  {

    *((_BYTE *)ptr + 48) = 0;
    ptr = self->mRouteSessionAttrsPtr.__ptr_;
  }
  *((_BYTE *)ptr + 24) = 0;
  *((_BYTE *)ptr + 56) = 0;
}

- (pair<NSError)getPropertyData_NSHelper:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withClass:(Class)a5
{
  uint64_t *v5;
  uint64_t *v10;
  id v11;
  void *v12;
  int v13;
  Kernel *ptr;
  NSObject *v15;
  util *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  std::string *v24;
  AudioObjectPropertySelector mSelector;
  int v26;
  std::string *v27;
  AudioObjectPropertyScope mScope;
  int v29;
  std::string *v30;
  AudioObjectPropertyElement mElement;
  char *v32;
  NSObject *v33;
  AudioObjectPropertySelector v34;
  int v35;
  NSObject *v36;
  AudioObjectPropertySelector v37;
  int v38;
  std::string *v39;
  AudioObjectPropertyScope v40;
  int v41;
  std::string *v42;
  AudioObjectPropertyElement v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  std::string *v48;
  AudioObjectPropertyScope v49;
  int v50;
  std::string *v51;
  AudioObjectPropertyElement v52;
  void *v53;
  void *v54;
  unsigned int __val;
  CFTypeRef cf;
  std::string v57;
  std::string v58;
  std::string v59;
  _BYTE block[40];
  _BYTE v61[14];
  __int16 v62;
  int v63;
  uint64_t v64;
  pair<NSError *, NSObject<NSSecureCoding> *> result;

  v10 = v5;
  v64 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "unsignedIntValue");
    ptr = self->mKernelPtr.__ptr_;
    LODWORD(v58.__r_.__value_.__l.__data_) = v13;
    v59.__r_.__value_.__r.__words[0] = (std::string::size_type)a4;
    v57.__r_.__value_.__r.__words[0] = (std::string::size_type)ptr;
    v57.__r_.__value_.__l.__size_ = (std::string::size_type)&v58;
    v57.__r_.__value_.__r.__words[2] = (std::string::size_type)&v59;
    applesauce::dispatch::v1::queue::operator*(*((id *)ptr + 7));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    __val = 0;
    cf = 0;
    *(_QWORD *)block = MEMORY[0x24BDAC760];
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel23getPropertyData_TypeRefEjPK26AudioObjectPropertyAddressE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS9_17integral_constantIbLb0EEE_block_invoke;
    *(_QWORD *)&block[24] = &__block_descriptor_48_e5_v8__0l;
    *(_QWORD *)&block[32] = &__val;
    *(_QWORD *)v61 = &v57;
    dispatch_sync(v15, block);

    if (__val)
    {
      util::server_log(v16);
      v17 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = bswap32(__val);
        *(_DWORD *)&block[1] = v18;
        if (((char)v18 - 32) > 0x5E
          || (((__int16)v18 >> 8) - 32) > 0x5E
          || ((v18 << 8 >> 24) - 32) > 0x5E
          || ((v18 >> 24) - 32) > 0x5E)
        {
          std::to_string(&v57, __val);
        }
        else
        {
          strcpy(&block[5], "'");
          block[0] = 39;
          std::string::basic_string[abi:ne180100]<0>(&v57, block);
        }
        if ((v57.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v24 = &v57;
        else
          v24 = (std::string *)v57.__r_.__value_.__r.__words[0];
        mSelector = a4->mSelector;
        v26 = bswap32(a4->mSelector);
        *(_DWORD *)&block[1] = v26;
        if (((char)v26 - 32) > 0x5E
          || (((__int16)v26 >> 8) - 32) > 0x5E
          || ((v26 << 8 >> 24) - 32) > 0x5E
          || ((v26 >> 24) - 32) > 0x5E)
        {
          std::to_string(&v59, mSelector);
        }
        else
        {
          strcpy(&block[5], "'");
          block[0] = 39;
          std::string::basic_string[abi:ne180100]<0>(&v59, block);
        }
        if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v27 = &v59;
        else
          v27 = (std::string *)v59.__r_.__value_.__r.__words[0];
        mScope = a4->mScope;
        v29 = bswap32(mScope);
        *(_DWORD *)&block[1] = v29;
        if (((char)v29 - 32) > 0x5E
          || (((__int16)v29 >> 8) - 32) > 0x5E
          || ((v29 << 8 >> 24) - 32) > 0x5E
          || ((v29 >> 24) - 32) > 0x5E)
        {
          std::to_string(&v58, mScope);
        }
        else
        {
          strcpy(&block[5], "'");
          block[0] = 39;
          std::string::basic_string[abi:ne180100]<0>(&v58, block);
        }
        v30 = &v58;
        if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v30 = (std::string *)v58.__r_.__value_.__r.__words[0];
        mElement = a4->mElement;
        *(_DWORD *)block = 136316674;
        *(_QWORD *)&block[4] = "InCider.mm";
        *(_WORD *)&block[12] = 1024;
        *(_DWORD *)&block[14] = 236;
        *(_WORD *)&block[18] = 2080;
        *(_QWORD *)&block[20] = v24;
        *(_WORD *)&block[28] = 2080;
        *(_QWORD *)&block[30] = v27;
        *(_WORD *)&block[38] = 2080;
        *(_QWORD *)v61 = v30;
        *(_WORD *)&v61[8] = 1024;
        *(_DWORD *)&v61[10] = mElement;
        v62 = 1024;
        v63 = v13;
        _os_log_impl(&dword_237B88000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s getting property [%s/%s/%u] on device with ID %u", block, 0x3Cu);
        if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v58.__r_.__value_.__l.__data_);
        if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v59.__r_.__value_.__l.__data_);
        if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v57.__r_.__value_.__l.__data_);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ads::Kernel::getPropertyData_TypeRef"), (int)__val, 0);
      *v10 = objc_claimAutoreleasedReturnValue();
      v10[1] = 0;
LABEL_98:
      if (cf)
        CFRelease(cf);
      goto LABEL_100;
    }
    if ((Class)objc_opt_class() == a5)
    {
      *(_QWORD *)block = 0;
      v23 = applesauce::CF::TypeRef::operator applesauce::CF::ArrayRef((applesauce::CF::ArrayRef *)&v57, &cf);
      *(_QWORD *)block = v57.__r_.__value_.__r.__words[0];
      if (!v57.__r_.__value_.__r.__words[0])
        goto LABEL_49;
    }
    else
    {
      if ((Class)objc_opt_class() != a5)
      {
        v23 = (objc_class *)objc_opt_class();
        if (v23 != a5)
          goto LABEL_57;
        *(_QWORD *)block = 0;
        v23 = applesauce::CF::TypeRef::operator applesauce::CF::StringRef((applesauce::CF::StringRef *)&v57, &cf);
        *(_QWORD *)block = v57.__r_.__value_.__r.__words[0];
        if (v57.__r_.__value_.__r.__words[0])
          goto LABEL_48;
LABEL_49:
        v32 = 0;
LABEL_50:
        if (v32)
        {
          util::server_log(v23);
          v33 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = a4->mSelector;
            v35 = bswap32(a4->mSelector);
            *(_DWORD *)&block[1] = v35;
            if (((char)v35 - 32) > 0x5E
              || (((__int16)v35 >> 8) - 32) > 0x5E
              || ((v35 << 8 >> 24) - 32) > 0x5E
              || ((v35 >> 24) - 32) > 0x5E)
            {
              std::to_string(&v57, v34);
            }
            else
            {
              strcpy(&block[5], "'");
              block[0] = 39;
              std::string::basic_string[abi:ne180100]<0>(&v57, block);
            }
            if ((v57.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v48 = &v57;
            else
              v48 = (std::string *)v57.__r_.__value_.__r.__words[0];
            v49 = a4->mScope;
            v50 = bswap32(v49);
            *(_DWORD *)&block[1] = v50;
            if (((char)v50 - 32) > 0x5E
              || (((__int16)v50 >> 8) - 32) > 0x5E
              || ((v50 << 8 >> 24) - 32) > 0x5E
              || ((v50 >> 24) - 32) > 0x5E)
            {
              std::to_string(&v59, v49);
            }
            else
            {
              strcpy(&block[5], "'");
              block[0] = 39;
              std::string::basic_string[abi:ne180100]<0>(&v59, block);
            }
            v51 = &v59;
            if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
              v51 = (std::string *)v59.__r_.__value_.__r.__words[0];
            v52 = a4->mElement;
            *(_DWORD *)block = 136316418;
            *(_QWORD *)&block[4] = "InCider.mm";
            *(_WORD *)&block[12] = 1024;
            *(_DWORD *)&block[14] = 225;
            *(_WORD *)&block[18] = 2080;
            *(_QWORD *)&block[20] = v48;
            *(_WORD *)&block[28] = 2080;
            *(_QWORD *)&block[30] = v51;
            *(_WORD *)&block[38] = 1024;
            *(_DWORD *)v61 = v52;
            *(_WORD *)&v61[4] = 1024;
            *(_DWORD *)&v61[6] = v13;
            _os_log_impl(&dword_237B88000, v33, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel successfully got property [%s/%s/%u] on device with ID %u", block, 0x32u);
            if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v59.__r_.__value_.__l.__data_);
            if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v57.__r_.__value_.__l.__data_);
          }

          *v10 = 0;
          v10[1] = (uint64_t)v32;
          goto LABEL_98;
        }
LABEL_57:
        util::server_log(v23);
        v36 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = a4->mSelector;
          v38 = bswap32(a4->mSelector);
          *(_DWORD *)((char *)&v59.__r_.__value_.__l.__data_ + 1) = v38;
          if (((char)v38 - 32) > 0x5E
            || (((__int16)v38 >> 8) - 32) > 0x5E
            || ((v38 << 8 >> 24) - 32) > 0x5E
            || ((v38 >> 24) - 32) > 0x5E)
          {
            std::to_string(&v57, v37);
          }
          else
          {
            *(_WORD *)((char *)v59.__r_.__value_.__r.__words + 5) = 39;
            v59.__r_.__value_.__s.__data_[0] = 39;
            std::string::basic_string[abi:ne180100]<0>(&v57, (char *)&v59);
          }
          if ((v57.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v39 = &v57;
          else
            v39 = (std::string *)v57.__r_.__value_.__r.__words[0];
          v40 = a4->mScope;
          v41 = bswap32(v40);
          *(_DWORD *)((char *)&v58.__r_.__value_.__l.__data_ + 1) = v41;
          if (((char)v41 - 32) > 0x5E
            || (((__int16)v41 >> 8) - 32) > 0x5E
            || ((v41 << 8 >> 24) - 32) > 0x5E
            || ((v41 >> 24) - 32) > 0x5E)
          {
            std::to_string(&v59, v40);
          }
          else
          {
            *(_WORD *)((char *)v58.__r_.__value_.__r.__words + 5) = 39;
            v58.__r_.__value_.__s.__data_[0] = 39;
            std::string::basic_string[abi:ne180100]<0>(&v59, (char *)&v58);
          }
          if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v42 = &v59;
          else
            v42 = (std::string *)v59.__r_.__value_.__r.__words[0];
          v43 = a4->mElement;
          NSStringFromClass(a5);
          v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v45 = objc_msgSend(v44, "UTF8String");
          *(_DWORD *)block = 136316674;
          *(_QWORD *)&block[4] = "InCider.mm";
          *(_WORD *)&block[12] = 1024;
          *(_DWORD *)&block[14] = 216;
          *(_WORD *)&block[18] = 2080;
          *(_QWORD *)&block[20] = v39;
          *(_WORD *)&block[28] = 2080;
          *(_QWORD *)&block[30] = v42;
          *(_WORD *)&block[38] = 1024;
          *(_DWORD *)v61 = v43;
          *(_WORD *)&v61[4] = 2080;
          *(_QWORD *)&v61[6] = v45;
          v62 = 1024;
          v63 = v13;
          _os_log_impl(&dword_237B88000, v36, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Error: couldn't convert result for property [%s/%s/%u] to %s on device with ID %u", block, 0x3Cu);

          if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v59.__r_.__value_.__l.__data_);
          if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v57.__r_.__value_.__l.__data_);
        }

        v46 = (void *)MEMORY[0x24BDD1540];
        NSStringFromSelector(a2);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "errorWithDomain:code:userInfo:", v47, 1970171760, 0);
        *v10 = objc_claimAutoreleasedReturnValue();
        v10[1] = 0;

        goto LABEL_98;
      }
      *(_QWORD *)block = 0;
      v23 = applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef((applesauce::CF::DictionaryRef *)&v57, &cf);
      *(_QWORD *)block = v57.__r_.__value_.__r.__words[0];
      if (!v57.__r_.__value_.__r.__words[0])
        goto LABEL_49;
    }
LABEL_48:
    v32 = v57.__r_.__value_.__l.__data_;
    CFRelease(v32);
    goto LABEL_50;
  }
  util::server_log(0);
  v19 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)block = 136315650;
    *(_QWORD *)&block[4] = "InCider.mm";
    *(_WORD *)&block[12] = 1024;
    *(_DWORD *)&block[14] = 180;
    *(_WORD *)&block[18] = 2112;
    *(_QWORD *)&block[20] = v20;
    _os_log_impl(&dword_237B88000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", block, 0x1Cu);

  }
  v21 = (void *)MEMORY[0x24BDD1540];
  NSStringFromSelector(a2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 1852797029, 0);
  *v10 = objc_claimAutoreleasedReturnValue();
  v10[1] = 0;

LABEL_100:
  result.var1 = v54;
  result.var0 = v53;
  return result;
}

- (id)setPropertyDataPrivileged_NSHelper:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInData:(id)a5
{
  id v9;
  util *v10;
  util *v11;
  int v12;
  util *v13;
  util *v14;
  const void *v15;
  const void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  util *v22;
  const void *v23;
  util *v24;
  const void *v25;
  Kernel *ptr;
  void *v27;
  NSObject *v28;
  signed int data;
  util *v30;
  NSObject *v31;
  _BOOL4 v32;
  int v33;
  AudioObjectPropertySelector v34;
  int v35;
  std::string *v36;
  AudioObjectPropertySelector mSelector;
  int v38;
  std::string *v39;
  AudioObjectPropertyScope mScope;
  int v41;
  std::string *p_p;
  AudioObjectPropertyElement mElement;
  std::string *v44;
  AudioObjectPropertyScope v45;
  int v46;
  std::string *v47;
  AudioObjectPropertyElement v48;
  std::string __p;
  std::string v51;
  CFTypeRef v52;
  std::string v53;
  std::string *v54;
  int v55;
  _BYTE cf[40];
  _BYTE v57[10];
  AudioObjectPropertyElement v58;
  __int16 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (util *)a5;
  v11 = v10;
  if (v9 && v10)
  {
    v12 = objc_msgSend(v9, "unsignedIntValue");
    v13 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v13;
      CFRetain(v14);
      applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)cf, v14);

      v15 = *(const void **)cf;
      if (*(_QWORD *)cf)
      {
        CFRetain(*(CFTypeRef *)cf);
        v16 = *(const void **)cf;
        v52 = v15;
        if (*(_QWORD *)cf)
          goto LABEL_17;
        goto LABEL_19;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v13;
        CFRetain(v22);
        applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)cf, v22);

        v23 = *(const void **)cf;
        if (*(_QWORD *)cf)
        {
          CFRetain(*(CFTypeRef *)cf);
          v16 = *(const void **)cf;
          v52 = v23;
          if (*(_QWORD *)cf)
            goto LABEL_17;
          goto LABEL_19;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 = v13;
          CFRetain(v24);
          applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)cf, v24);

          v25 = *(const void **)cf;
          if (*(_QWORD *)cf)
          {
            CFRetain(*(CFTypeRef *)cf);
            v16 = *(const void **)cf;
            v52 = v25;
            if (*(_QWORD *)cf)
LABEL_17:
              CFRelease(v16);
LABEL_19:

            ptr = self->mKernelPtr.__ptr_;
            v55 = v12;
            v51.__r_.__value_.__r.__words[0] = (std::string::size_type)a4;
            v53.__r_.__value_.__r.__words[0] = (std::string::size_type)ptr;
            v53.__r_.__value_.__l.__size_ = (std::string::size_type)&v55;
            v53.__r_.__value_.__r.__words[2] = (std::string::size_type)&v52;
            v54 = &v51;
            v27 = (void *)*((_QWORD *)ptr + 7);
            applesauce::dispatch::v1::queue::operator*(v27);
            v28 = objc_claimAutoreleasedReturnValue();
            LODWORD(__p.__r_.__value_.__l.__data_) = 0;
            *(_QWORD *)cf = MEMORY[0x24BDAC760];
            *(_QWORD *)&cf[8] = 3221225472;
            *(_QWORD *)&cf[16] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel33setPropertyDataPrivileged_TypeRefEjPK26AudioObjectPropertyAddressRKNS_2CF7TypeRefEE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NSD_17integral_constantIbLb0EEE_block_invoke;
            *(_QWORD *)&cf[24] = &__block_descriptor_48_e5_v8__0l;
            *(_QWORD *)&cf[32] = &__p;
            *(_QWORD *)v57 = &v53;
            dispatch_sync(v28, cf);
            data = (signed int)__p.__r_.__value_.__l.__data_;

            util::server_log(v30);
            v31 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
            v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
            if (data)
            {
              if (v32)
              {
                v33 = bswap32(data);
                *(_DWORD *)&cf[1] = v33;
                if (((char)v33 - 32) > 0x5E
                  || (((__int16)v33 >> 8) - 32) > 0x5E
                  || ((v33 << 8 >> 24) - 32) > 0x5E
                  || ((v33 >> 24) - 32) > 0x5E)
                {
                  std::to_string(&v53, data);
                }
                else
                {
                  strcpy(&cf[5], "'");
                  cf[0] = 39;
                  std::string::basic_string[abi:ne180100]<0>(&v53, cf);
                }
                if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v36 = &v53;
                else
                  v36 = (std::string *)v53.__r_.__value_.__r.__words[0];
                mSelector = a4->mSelector;
                v38 = bswap32(a4->mSelector);
                *(_DWORD *)&cf[1] = v38;
                if (((char)v38 - 32) > 0x5E
                  || (((__int16)v38 >> 8) - 32) > 0x5E
                  || ((v38 << 8 >> 24) - 32) > 0x5E
                  || ((v38 >> 24) - 32) > 0x5E)
                {
                  std::to_string(&v51, mSelector);
                }
                else
                {
                  strcpy(&cf[5], "'");
                  cf[0] = 39;
                  std::string::basic_string[abi:ne180100]<0>(&v51, cf);
                }
                if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v39 = &v51;
                else
                  v39 = (std::string *)v51.__r_.__value_.__r.__words[0];
                mScope = a4->mScope;
                v41 = bswap32(mScope);
                *(_DWORD *)&cf[1] = v41;
                if (((char)v41 - 32) > 0x5E
                  || (((__int16)v41 >> 8) - 32) > 0x5E
                  || ((v41 << 8 >> 24) - 32) > 0x5E
                  || ((v41 >> 24) - 32) > 0x5E)
                {
                  std::to_string(&__p, mScope);
                }
                else
                {
                  strcpy(&cf[5], "'");
                  cf[0] = 39;
                  std::string::basic_string[abi:ne180100]<0>(&__p, cf);
                }
                p_p = &__p;
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
                mElement = a4->mElement;
                *(_DWORD *)cf = 136316674;
                *(_QWORD *)&cf[4] = "InCider.mm";
                *(_WORD *)&cf[12] = 1024;
                *(_DWORD *)&cf[14] = 277;
                *(_WORD *)&cf[18] = 2080;
                *(_QWORD *)&cf[20] = v36;
                *(_WORD *)&cf[28] = 2080;
                *(_QWORD *)&cf[30] = v39;
                *(_WORD *)&cf[38] = 2080;
                *(_QWORD *)v57 = p_p;
                *(_WORD *)&v57[8] = 1024;
                v58 = mElement;
                v59 = 1024;
                v60 = v12;
                _os_log_impl(&dword_237B88000, v31, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s setting property [%s/%s/%u] on device with ID %u with privilege", cf, 0x3Cu);
                if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(__p.__r_.__value_.__l.__data_);
                if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v51.__r_.__value_.__l.__data_);
                if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v53.__r_.__value_.__l.__data_);
              }

              objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ads::Kernel::setPropertyDataPrivileged_TypeRef"), data, 0);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v32)
              {
                v34 = a4->mSelector;
                v35 = bswap32(a4->mSelector);
                *(_DWORD *)&cf[1] = v35;
                if (((char)v35 - 32) > 0x5E
                  || (((__int16)v35 >> 8) - 32) > 0x5E
                  || ((v35 << 8 >> 24) - 32) > 0x5E
                  || ((v35 >> 24) - 32) > 0x5E)
                {
                  std::to_string(&v53, v34);
                }
                else
                {
                  strcpy(&cf[5], "'");
                  cf[0] = 39;
                  std::string::basic_string[abi:ne180100]<0>(&v53, cf);
                }
                if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v44 = &v53;
                else
                  v44 = (std::string *)v53.__r_.__value_.__r.__words[0];
                v45 = a4->mScope;
                v46 = bswap32(v45);
                *(_DWORD *)&cf[1] = v46;
                if (((char)v46 - 32) > 0x5E
                  || (((__int16)v46 >> 8) - 32) > 0x5E
                  || ((v46 << 8 >> 24) - 32) > 0x5E
                  || ((v46 >> 24) - 32) > 0x5E)
                {
                  std::to_string(&v51, v45);
                }
                else
                {
                  strcpy(&cf[5], "'");
                  cf[0] = 39;
                  std::string::basic_string[abi:ne180100]<0>(&v51, cf);
                }
                v47 = &v51;
                if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                  v47 = (std::string *)v51.__r_.__value_.__r.__words[0];
                v48 = a4->mElement;
                *(_DWORD *)cf = 136316418;
                *(_QWORD *)&cf[4] = "InCider.mm";
                *(_WORD *)&cf[12] = 1024;
                *(_DWORD *)&cf[14] = 266;
                *(_WORD *)&cf[18] = 2080;
                *(_QWORD *)&cf[20] = v44;
                *(_WORD *)&cf[28] = 2080;
                *(_QWORD *)&cf[30] = v47;
                *(_WORD *)&cf[38] = 1024;
                *(_DWORD *)v57 = v48;
                *(_WORD *)&v57[4] = 1024;
                *(_DWORD *)&v57[6] = v12;
                _os_log_impl(&dword_237B88000, v31, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel successfully set property [%s/%s/%u] on device with ID %u with privilege", cf, 0x32u);
                if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v51.__r_.__value_.__l.__data_);
                if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v53.__r_.__value_.__l.__data_);
              }

              v21 = 0;
            }
            if (v52)
              CFRelease(v52);
            goto LABEL_79;
          }
        }
      }
    }
    v52 = 0;
    goto LABEL_19;
  }
  util::server_log(v10);
  v17 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)cf = 136315650;
    *(_QWORD *)&cf[4] = "InCider.mm";
    *(_WORD *)&cf[12] = 1024;
    *(_DWORD *)&cf[14] = 247;
    *(_WORD *)&cf[18] = 2112;
    *(_QWORD *)&cf[20] = v18;
    _os_log_impl(&dword_237B88000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", cf, 0x1Cu);

  }
  v19 = (void *)MEMORY[0x24BDD1540];
  NSStringFromSelector(a2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 1852797029, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_79:
  return v21;
}

- (void)getADSPluginAOID:(id)a3
{
  ads::Kernel *v3;
  util *ADSPluginAOID;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (ads::Kernel *)a3;
  ADSPluginAOID = (util *)ads::Kernel::getADSPluginAOID(v3);
  util::server_log(ADSPluginAOID);
  v5 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)ADSPluginAOID)
  {
    if (v6)
    {
      v8 = 136315650;
      v9 = "InCider.mm";
      v10 = 1024;
      v11 = 293;
      v12 = 1024;
      v13 = (int)ADSPluginAOID;
      _os_log_impl(&dword_237B88000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel retrieved ADS plugin AOID %u without error", (uint8_t *)&v8, 0x18u);
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", ADSPluginAOID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(ads::Kernel *, _QWORD, void *))v3 + 2))(v3, 0, v7);
  }
  else
  {
    if (v6)
    {
      v8 = 136315394;
      v9 = "InCider.mm";
      v10 = 1024;
      v11 = 288;
      _os_log_impl(&dword_237B88000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error retrieving ADS plugin AOID -- ADS is not enabled", (uint8_t *)&v8, 0x12u);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ads::Kernel::getADSPluginAOID"), 1852797029, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(ads::Kernel *, void *, _QWORD))v3 + 2))(v3, v7, 0);
  }

}

- (void)getADSDeviceMap:(id)a3
{
  void (**v4)(id, _QWORD, CFDictionaryRef);
  NSObject *v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  int64x2_t v17;
  unint64_t v18;
  CFDictionaryRef CFDictionaryRef;
  void *v20;
  NSObject *v21;
  const __CFString *v22;
  void **v23;
  void *__p[2];
  void *v25[2];
  int v26;
  CFDictionaryRef v27;
  int64x2_t v28;
  unint64_t v29;
  _BYTE block[32];
  void **v31;
  int64x2_t *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, CFDictionaryRef))a3;
  v28.i64[0] = (uint64_t)self->mKernelPtr.__ptr_;
  applesauce::dispatch::v1::queue::operator*(*(id *)(v28.i64[0] + 56));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)__p = 0u;
  *(_OWORD *)v25 = 0u;
  v26 = 1065353216;
  *(_QWORD *)block = MEMORY[0x24BDAC760];
  *(_QWORD *)&block[8] = 3221225472;
  *(_QWORD *)&block[16] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel15getADSDeviceMapEvE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke;
  *(_QWORD *)&block[24] = &__block_descriptor_48_e5_v8__0l;
  v31 = __p;
  v32 = &v28;
  dispatch_sync(v5, block);

  v28 = 0uLL;
  v29 = 0;
  std::vector<applesauce::CF::TypeRefPair>::reserve(&v28, (unint64_t)v25[1]);
  v6 = v25;
  while (1)
  {
    v6 = (void **)*v6;
    if (!v6)
      break;
    v7 = v28.i64[1];
    if (v28.i64[1] >= v29)
    {
      v9 = (v28.i64[1] - v28.i64[0]) >> 4;
      if ((unint64_t)(v9 + 1) >> 60)
        std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
      v10 = (uint64_t)(v29 - v28.i64[0]) >> 3;
      if (v10 <= v9 + 1)
        v10 = v9 + 1;
      if (v29 - v28.i64[0] >= 0x7FFFFFFFFFFFFFF0)
        v11 = 0xFFFFFFFFFFFFFFFLL;
      else
        v11 = v10;
      v31 = (void **)&v29;
      if (v11)
        v11 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(v11);
      else
        v12 = 0;
      *(_QWORD *)block = v11;
      *(_QWORD *)&block[8] = v11 + 16 * v9;
      *(_QWORD *)&block[16] = *(_QWORD *)&block[8];
      *(_QWORD *)&block[24] = v11 + 16 * v12;
      applesauce::CF::TypeRefPair::TypeRefPair<std::string const&,unsigned int const&>(*(CFStringRef **)&block[8], (const UInt8 *)v6 + 16, (int *)v6 + 10);
      v13 = *(_QWORD *)&block[8];
      v8 = *(_QWORD *)&block[16] + 16;
      *(_QWORD *)&block[16] += 16;
      v14 = (_QWORD *)v28.i64[1];
      v15 = (_QWORD *)v28.i64[0];
      if (v28.i64[1] == v28.i64[0])
      {
        v17 = vdupq_n_s64(v28.u64[1]);
      }
      else
      {
        do
        {
          v16 = *(v14 - 2);
          v14 -= 2;
          *(_QWORD *)(v13 - 16) = v16;
          v13 -= 16;
          *v14 = 0;
          *(_QWORD *)(v13 + 8) = v14[1];
          v14[1] = 0;
        }
        while (v14 != v15);
        v17 = v28;
        v8 = *(_QWORD *)&block[16];
      }
      v28.i64[0] = v13;
      v28.i64[1] = v8;
      *(int64x2_t *)&block[8] = v17;
      v18 = v29;
      v29 = *(_QWORD *)&block[24];
      *(_QWORD *)&block[24] = v18;
      *(_QWORD *)block = v17.i64[0];
      std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer((uint64_t)block);
    }
    else
    {
      applesauce::CF::TypeRefPair::TypeRefPair<std::string const&,unsigned int const&>((CFStringRef *)v28.i64[1], (const UInt8 *)v6 + 16, (int *)v6 + 10);
      v8 = v7 + 16;
    }
    v28.i64[1] = v8;
  }
  CFDictionaryRef = applesauce::CF::details::make_CFDictionaryRef((void ***)&v28);
  *(_QWORD *)block = &v28;
  std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100]((void ***)block);
  v27 = CFDictionaryRef;
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__deallocate_node((void **)v25[0]);
  v20 = __p[0];
  __p[0] = 0;
  if (v20)
    operator delete(v20);
  util::server_log((util *)v20);
  v21 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = CFCopyDescription(CFDictionaryRef);
    applesauce::CF::details::CFString_get_value<true>((uint64_t)__p, v22);
    if (v22)
      CFRelease(v22);
    v23 = __p;
    if (SHIBYTE(v25[0]) < 0)
      v23 = (void **)__p[0];
    *(_DWORD *)block = 136315650;
    *(_QWORD *)&block[4] = "InCider.mm";
    *(_WORD *)&block[12] = 1024;
    *(_DWORD *)&block[14] = 300;
    *(_WORD *)&block[18] = 2080;
    *(_QWORD *)&block[20] = v23;
    _os_log_impl(&dword_237B88000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel retrieved ADS device map: %s", block, 0x1Cu);
    if (SHIBYTE(v25[0]) < 0)
      operator delete(__p[0]);
  }

  v4[2](v4, 0, CFDictionaryRef);
  CFRelease(CFDictionaryRef);

}

- (void)getAOIDForUUID:(id)a3 withReply:(id)a4
{
  id v7;
  util *v8;
  util *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  Kernel *ptr;
  void *v17;
  NSObject *v18;
  unint64_t v19;
  util *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  unint64_t v25;
  std::string *v26;
  unint64_t v27;
  std::string *v28;
  std::string *p_p;
  void *v30;
  std::string v31;
  std::string v32;
  std::string __p;
  unint64_t v34;
  char v35;
  _BYTE buf[40];
  std::string *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (util *)a4;
  v9 = v8;
  if (!v7)
  {
    util::server_log(v8);
    v10 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "InCider.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 309;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v11;
      _os_log_impl(&dword_237B88000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);

    }
    v12 = (void *)MEMORY[0x24BDD1540];
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 1852797029, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *, _QWORD))v9 + 2))(v9, v14, 0);

  }
  v15 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v15, "UTF8String"));
  ptr = self->mKernelPtr.__ptr_;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v32, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v32 = __p;
  v31.__r_.__value_.__r.__words[0] = (std::string::size_type)ptr;
  v31.__r_.__value_.__l.__size_ = (std::string::size_type)&v32;
  v17 = (void *)*((_QWORD *)ptr + 7);
  applesauce::dispatch::v1::queue::operator*(v17);
  v18 = objc_claimAutoreleasedReturnValue();
  LODWORD(v34) = 0;
  BYTE4(v34) = 0;
  v35 = 0;
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel14getAOIDForUUIDENSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  *(_QWORD *)&buf[24] = &__block_descriptor_48_e5_v8__0l;
  *(_QWORD *)&buf[32] = &v34;
  v37 = &v31;
  dispatch_sync(v18, buf);
  v19 = v34;

  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v32.__r_.__value_.__l.__data_);
  util::server_log(v20);
  v21 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  v22 = v21;
  if ((_DWORD)v19)
  {
    v23 = v21;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = bswap32(v19);
      *(_DWORD *)&buf[1] = v24;
      if (((char)v24 - 32) > 0x5E
        || (((__int16)v24 >> 8) - 32) > 0x5E
        || ((v24 << 8 >> 24) - 32) > 0x5E
        || ((v24 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v31, v19);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v31, buf);
      }
      v28 = &v31;
      if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v28 = (std::string *)v31.__r_.__value_.__r.__words[0];
      p_p = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "InCider.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 322;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v28;
      *(_WORD *)&buf[28] = 2080;
      *(_QWORD *)&buf[30] = p_p;
      _os_log_impl(&dword_237B88000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s retrieving AOID for UUID %s", buf, 0x26u);
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v31.__r_.__value_.__l.__data_);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ads::Kernel::getAOIDForUUID"), (int)v19, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *, _QWORD))v9 + 2))(v9, v30, 0);
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v25 = HIDWORD(v19);
      v26 = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v26 = (std::string *)__p.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "InCider.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 317;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v25;
      *(_WORD *)&buf[24] = 2080;
      *(_QWORD *)&buf[26] = v26;
      _os_log_impl(&dword_237B88000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel retrieved AOID %u for UUID %s without error", buf, 0x22u);
      v27 = v25;
    }
    else
    {
      v27 = HIDWORD(v19);
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, _QWORD, void *))v9 + 2))(v9, 0, v30);
  }

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

}

- (void)getUUIDForAOID:(id)a3 withReply:(id)a4
{
  id v7;
  util *v8;
  util *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  util *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  std::string *v22;
  _BYTE *v23;
  void *v24;
  std::string *v25;
  std::string v26;
  _BYTE v27[12];
  __int16 v28;
  int v29;
  __int16 v30;
  std::string *v31;
  __int16 v32;
  int v33;
  uint8_t buf[4];
  _BYTE __p[14];
  __int16 v36;
  void *v37;
  char v38;
  char v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (util *)a4;
  v9 = v8;
  if (!v7)
  {
    util::server_log(v8);
    v10 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)__p = "InCider.mm";
      *(_WORD *)&__p[8] = 1024;
      *(_DWORD *)&__p[10] = 332;
      v36 = 2112;
      v37 = v11;
      _os_log_impl(&dword_237B88000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);

    }
    v12 = (void *)MEMORY[0x24BDD1540];
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 1852797029, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *, _QWORD))v9 + 2))(v9, v14, 0);

  }
  v15 = objc_msgSend(v7, "unsignedIntValue");
  ads::Kernel::getUUIDForAOID((ads::Kernel *)buf, (uint64_t)self->mKernelPtr.__ptr_, v15);
  v16 = *(_DWORD *)buf;
  util::server_log(v17);
  v18 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  v19 = v18;
  if (v16)
  {
    v20 = v18;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = bswap32(*(unsigned int *)buf);
      *(_DWORD *)&v27[1] = v21;
      if (((char)v21 - 32) > 0x5E
        || (((__int16)v21 >> 8) - 32) > 0x5E
        || ((v21 << 8 >> 24) - 32) > 0x5E
        || ((v21 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v26, *(unsigned int *)buf);
      }
      else
      {
        strcpy(&v27[5], "'");
        v27[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v26, v27);
      }
      v25 = &v26;
      if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v25 = (std::string *)v26.__r_.__value_.__r.__words[0];
      *(_DWORD *)v27 = 136315906;
      *(_QWORD *)&v27[4] = "InCider.mm";
      v28 = 1024;
      v29 = 345;
      v30 = 2080;
      v31 = v25;
      v32 = 1024;
      v33 = v15;
      _os_log_impl(&dword_237B88000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s retrieving UUID for AOID %u", v27, 0x22u);
      if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v26.__r_.__value_.__l.__data_);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ads::Kernel::getUUIDForAOID"), *(int *)buf, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *, _QWORD))v9 + 2))(v9, v24, 0);
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (std::string *)&__p[4];
      if (v38 < 0)
        v22 = *(std::string **)&__p[4];
      *(_DWORD *)v27 = 136315906;
      *(_QWORD *)&v27[4] = "InCider.mm";
      v28 = 1024;
      v29 = 340;
      v30 = 2080;
      v31 = v22;
      v32 = 1024;
      v33 = v15;
      _os_log_impl(&dword_237B88000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel retrieved UUID %s for AOID %u without error", v27, 0x22u);
    }
    if (v38 >= 0)
      v23 = &__p[4];
    else
      v23 = *(_BYTE **)&__p[4];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v23, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, _QWORD, void *))v9 + 2))(v9, 0, v24);
  }

  if (v39 && v38 < 0)
    operator delete(*(void **)&__p[4]);

}

- (void)connectADSDevice:(id)a3 withReply:(id)a4
{
  id v7;
  util *v8;
  util *v9;
  NSObject *v10;
  _BYTE *v11;
  void *v12;
  void *v13;
  void *v14;
  Kernel *ptr;
  CFTypeRef v16;
  unint64_t v17;
  util *v18;
  NSObject *v19;
  int v20;
  unint64_t v21;
  int v22;
  util *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  _BYTE *v28;
  const __CFString *v29;
  std::string *p_p;
  void *v31;
  _BYTE *v32;
  _BYTE *v33;
  void *v34;
  std::string *v35;
  void *exception;
  CFTypeRef v37;
  CFTypeRef cf;
  std::string __p;
  _BYTE v40[28];
  __int16 v41;
  int v42;
  uint8_t buf[4];
  _BYTE v44[14];
  __int16 v45;
  _BYTE *v46;
  __int16 v47;
  std::string *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (util *)a4;
  v9 = v8;
  if (v7)
  {
    CFRetain(v7);
  }
  else
  {
    util::server_log(v8);
    v10 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v44 = "InCider.mm";
      *(_WORD *)&v44[8] = 1024;
      *(_DWORD *)&v44[10] = 356;
      v45 = 2112;
      v46 = v11;
      _os_log_impl(&dword_237B88000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);

    }
    v12 = (void *)MEMORY[0x24BDD1540];
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 1852797029, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *, _QWORD))v9 + 2))(v9, v14, 0);

  }
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v7);

  ptr = self->mKernelPtr.__ptr_;
  v16 = cf;
  if (cf)
    CFRetain(cf);
  v37 = v16;
  v17 = ads::Kernel::connectADSDevice((uint64_t)ptr, (uint64_t)&v37);
  v18 = (util *)v37;
  if (v37)
    CFRelease(v37);
  if ((_DWORD)v17)
  {
    util::server_log(v18);
    v19 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = bswap32(v17);
      *(_DWORD *)((char *)&__p.__r_.__value_.__l.__data_ + 1) = v20;
      if (((char)v20 - 32) > 0x5E
        || (((__int16)v20 >> 8) - 32) > 0x5E
        || ((v20 << 8 >> 24) - 32) > 0x5E
        || ((v20 >> 24) - 32) > 0x5E)
      {
        std::to_string((std::string *)v40, v17);
      }
      else
      {
        *(_WORD *)((char *)__p.__r_.__value_.__r.__words + 5) = 39;
        __p.__r_.__value_.__s.__data_[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(v40, (char *)&__p);
      }
      if (v40[23] >= 0)
        v28 = v40;
      else
        v28 = *(_BYTE **)v40;
      if (!cf)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x23B820E38](exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      v29 = CFCopyDescription(cf);
      applesauce::CF::details::CFString_get_value<true>((uint64_t)&__p, v29);
      if (v29)
        CFRelease(v29);
      p_p = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)v44 = "InCider.mm";
      *(_WORD *)&v44[8] = 1024;
      *(_DWORD *)&v44[10] = 378;
      v45 = 2080;
      v46 = v28;
      v47 = 2080;
      v48 = p_p;
      _os_log_impl(&dword_237B88000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s connecting ADS device with dictionary %s", buf, 0x26u);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if ((v40[23] & 0x80000000) != 0)
        operator delete(*(void **)v40);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ads::Kernel::connectADSDevice"), (int)v17, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *, _QWORD))v9 + 2))(v9, v31, 0);

  }
  else
  {
    v21 = HIDWORD(v17);
    ads::Kernel::getUUIDForAOID((ads::Kernel *)buf, (uint64_t)self->mKernelPtr.__ptr_, SHIDWORD(v17));
    v22 = *(_DWORD *)buf;
    util::server_log(v23);
    v24 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    v25 = v24;
    if (v22)
    {
      v26 = v24;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = bswap32(*(unsigned int *)buf);
        *(_DWORD *)&v40[1] = v27;
        if (((char)v27 - 32) > 0x5E
          || (((__int16)v27 >> 8) - 32) > 0x5E
          || ((v27 << 8 >> 24) - 32) > 0x5E
          || ((v27 >> 24) - 32) > 0x5E)
        {
          std::to_string(&__p, *(unsigned int *)buf);
        }
        else
        {
          strcpy(&v40[5], "'");
          v40[0] = 39;
          std::string::basic_string[abi:ne180100]<0>(&__p, v40);
        }
        v35 = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v35 = (std::string *)__p.__r_.__value_.__r.__words[0];
        *(_DWORD *)v40 = 136315906;
        *(_QWORD *)&v40[4] = "InCider.mm";
        *(_WORD *)&v40[12] = 1024;
        *(_DWORD *)&v40[14] = 372;
        *(_WORD *)&v40[18] = 2080;
        *(_QWORD *)&v40[20] = v35;
        v41 = 1024;
        v42 = v21;
        _os_log_impl(&dword_237B88000, v26, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s getting UUID for newly connected ADS device with AOID %d", v40, 0x22u);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ads::Kernel::getUUIDForAOID"), *(int *)buf, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(util *, void *, _QWORD))v9 + 2))(v9, v34, 0);
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v32 = &v44[4];
        if (SBYTE1(v48) < 0)
          v32 = *(_BYTE **)&v44[4];
        *(_DWORD *)v40 = 136315650;
        *(_QWORD *)&v40[4] = "InCider.mm";
        *(_WORD *)&v40[12] = 1024;
        *(_DWORD *)&v40[14] = 367;
        *(_WORD *)&v40[18] = 2080;
        *(_QWORD *)&v40[20] = v32;
        _os_log_impl(&dword_237B88000, v25, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel connected ADS device with UUID %s without error", v40, 0x1Cu);
      }
      if (SBYTE1(v48) >= 0)
        v33 = &v44[4];
      else
        v33 = *(_BYTE **)&v44[4];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v33, 4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(util *, _QWORD, void *))v9 + 2))(v9, 0, v34);
    }

    if (BYTE2(v48) && SBYTE1(v48) < 0)
      operator delete(*(void **)&v44[4]);
  }
  if (cf)
    CFRelease(cf);

}

- (void)connectADSDevices:(id)a3 withReply:(id)a4
{
  id v7;
  util *v8;
  util *v9;
  NSObject *v10;
  std::string *v11;
  void *v12;
  void *v13;
  void *v14;
  util *v15;
  Kernel *ptr;
  NSObject *v17;
  util *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int *v25;
  int *v26;
  std::vector<std::string>::pointer end;
  std::string *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  std::string *v33;
  util *v34;
  NSObject *v35;
  const __CFString *v36;
  std::string *v37;
  std::string *v38;
  void *v39;
  std::logic_error *v40;
  void *exception;
  CiderObject *v42;
  int *i;
  std::vector<std::string> v44;
  int *v45;
  int *v46;
  uint64_t v47;
  _QWORD v48[3];
  unsigned int __val;
  void *__p;
  _BYTE *v51;
  uint64_t v52;
  int64x2_t v53;
  char v54;
  CFTypeRef cf;
  std::string v56;
  std::__split_buffer<std::string> buf;
  std::string *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (util *)a4;
  v9 = v8;
  if (v7)
  {
    CFRetain(v7);
  }
  else
  {
    util::server_log(v8);
    v10 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (std::string *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.__first_) = 136315650;
      *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"InCider.mm";
      WORD2(buf.__begin_) = 1024;
      *(_DWORD *)((char *)&buf.__begin_ + 6) = 388;
      WORD1(buf.__end_) = 2112;
      *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__end_ + 4) = v11;
      _os_log_impl(&dword_237B88000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", (uint8_t *)&buf, 0x1Cu);

    }
    v12 = (void *)MEMORY[0x24BDD1540];
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 1852797029, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *, _QWORD))v9 + 2))(v9, v14, 0);

  }
  applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&cf, v7);

  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  applesauce::CF::convert_as<std::vector<applesauce::CF::DictionaryRef>,0>(&v53, (const __CFArray *)cf);
  if (v54)
  {
    ptr = self->mKernelPtr.__ptr_;
    memset(v48, 0, sizeof(v48));
    std::vector<applesauce::CF::DictionaryRef>::__init_with_size[abi:ne180100]<applesauce::CF::DictionaryRef*,applesauce::CF::DictionaryRef*>(v48, (CFTypeRef *)v53.i64[0], (CFTypeRef *)v53.i64[1], (v53.i64[1] - v53.i64[0]) >> 3);
    v56.__r_.__value_.__r.__words[0] = (std::string::size_type)ptr;
    v56.__r_.__value_.__l.__size_ = (std::string::size_type)v48;
    applesauce::dispatch::v1::queue::operator*(*((id *)ptr + 7));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    __val = 0;
    v51 = 0;
    v52 = 0;
    __p = 0;
    buf.__first_ = (std::__split_buffer<std::string>::pointer)MEMORY[0x24BDAC760];
    buf.__begin_ = (std::__split_buffer<std::string>::pointer)3221225472;
    buf.__end_ = (std::__split_buffer<std::string>::pointer)___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel17connectADSDevicesENSt3__16vectorINS_2CF13DictionaryRefENS5_9allocatorIS8_EEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke;
    buf.__end_cap_.__value_ = (std::string *)&__block_descriptor_48_e5_v8__0l;
    buf.__end_cap_.__value_ = (std::allocator<std::string> *)&__val;
    v58 = &v56;
    dispatch_sync(v17, &buf);

    buf.__first_ = (std::__split_buffer<std::string>::pointer)v48;
    std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
    if (__val)
    {
      util::server_log(v18);
      v19 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = bswap32(__val);
        *(_DWORD *)((char *)&buf.__first_ + 1) = v20;
        if (((char)v20 - 32) > 0x5E
          || (((__int16)v20 >> 8) - 32) > 0x5E
          || ((v20 << 8 >> 24) - 32) > 0x5E
          || ((v20 >> 24) - 32) > 0x5E)
        {
          std::to_string(&v56, __val);
        }
        else
        {
          strcpy((char *)&buf.__first_ + 5, "'");
          LOBYTE(buf.__first_) = 39;
          std::string::basic_string[abi:ne180100]<0>(&v56, (char *)&buf);
        }
        v38 = &v56;
        if ((v56.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v38 = (std::string *)v56.__r_.__value_.__r.__words[0];
        LODWORD(buf.__first_) = 136315906;
        *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"InCider.mm";
        WORD2(buf.__begin_) = 1024;
        *(_DWORD *)((char *)&buf.__begin_ + 6) = 416;
        WORD1(buf.__end_) = 2080;
        *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__end_ + 4) = v38;
        WORD2(buf.__end_cap_.__value_) = 2048;
        *(std::string **)((char *)&buf.__end_cap_.__value_ + 6) = (std::string *)((v53.i64[1] - v53.i64[0]) >> 3);
        _os_log_impl(&dword_237B88000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s connecting %lu ADS devices", (uint8_t *)&buf, 0x26u);
        if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v56.__r_.__value_.__l.__data_);
      }

    }
    else
    {
      v45 = 0;
      v46 = 0;
      v47 = 0;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v45, __p, (uint64_t)v51, (v51 - (_BYTE *)__p) >> 2);
      memset(&v44, 0, sizeof(v44));
      v25 = v45;
      v26 = v46;
      v42 = self;
      for (i = v25; v25 != v26; ++v25)
      {
        ads::Kernel::getUUIDForAOID((ads::Kernel *)&buf, (uint64_t)self->mKernelPtr.__ptr_, *v25);
        if (LODWORD(buf.__first_))
        {
          v40 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::logic_error::logic_error(v40, "We should never throw here. Successfully connecting a list of ads::Device then failing to get their UUIDs?");
          v40->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8D0] + 16);
          __cxa_throw(v40, (struct type_info *)off_2509A21A0, MEMORY[0x24BEDAB88]);
        }
        if (SHIBYTE(buf.__end_cap_.__value_) < 0)
        {
          std::string::__init_copy_ctor_external(&v56, (const std::string::value_type *)buf.__begin_, (std::string::size_type)buf.__end_);
          if (LOBYTE(buf.__end_cap_.__value_) && SHIBYTE(buf.__end_cap_.__value_) < 0)
            operator delete(buf.__begin_);
        }
        else
        {
          v56 = *(std::string *)&buf.__begin_;
        }
        end = v44.__end_;
        if (v44.__end_ >= v44.__end_cap_.__value_)
        {
          v29 = 0xAAAAAAAAAAAAAAABLL * (((char *)v44.__end_ - (char *)v44.__begin_) >> 3);
          v30 = v29 + 1;
          if (v29 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v44.__end_cap_.__value_ - (char *)v44.__begin_) >> 3) > v30)
            v30 = 0x5555555555555556 * (((char *)v44.__end_cap_.__value_ - (char *)v44.__begin_) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v44.__end_cap_.__value_ - (char *)v44.__begin_) >> 3) >= 0x555555555555555)
            v31 = 0xAAAAAAAAAAAAAAALL;
          else
            v31 = v30;
          buf.__end_cap_.__value_ = (std::allocator<std::string> *)&v44.__end_cap_;
          if (v31)
            v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v31);
          else
            v32 = 0;
          v33 = (std::string *)(v31 + 24 * v29);
          buf.__first_ = (std::__split_buffer<std::string>::pointer)v31;
          buf.__begin_ = v33;
          buf.__end_cap_.__value_ = (std::string *)(v31 + 24 * v32);
          *v33 = v56;
          memset(&v56, 0, sizeof(v56));
          buf.__end_ = v33 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v44, &buf);
          v28 = v44.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&buf);
        }
        else
        {
          *(_OWORD *)v44.__end_ = *(_OWORD *)&v56.__r_.__value_.__l.__data_;
          end->__r_.__value_.__r.__words[2] = v56.__r_.__value_.__r.__words[2];
          memset(&v56, 0, sizeof(v56));
          v28 = end + 1;
        }
        v44.__end_ = v28;
      }

      v34 = applesauce::CF::details::make_CFArrayRef<std::string>((__int128 **)&v44);
      util::server_log(v34);
      v35 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = CFCopyDescription(v34);
        applesauce::CF::details::CFString_get_value<true>((uint64_t)&v56, v36);
        if (v36)
          CFRelease(v36);
        v37 = &v56;
        if ((v56.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v37 = (std::string *)v56.__r_.__value_.__r.__words[0];
        LODWORD(buf.__first_) = 136315650;
        *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"InCider.mm";
        WORD2(buf.__begin_) = 1024;
        *(_DWORD *)((char *)&buf.__begin_ + 6) = 411;
        WORD1(buf.__end_) = 2080;
        *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__end_ + 4) = v37;
        _os_log_impl(&dword_237B88000, v35, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel connected ADS devices with UUIDs %s without error", (uint8_t *)&buf, 0x1Cu);
        if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v56.__r_.__value_.__l.__data_);
      }

      (*((void (**)(util *, _QWORD, util *))v9 + 2))(v9, 0, v34);
      CFRelease(v34);
      buf.__first_ = (std::__split_buffer<std::string>::pointer)&v44;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
      if (i)
        operator delete(i);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ads::Kernel::connectADSDevices"), (int)__val, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *, _QWORD))v9 + 2))(v9, v39, 0);

    if (__p)
    {
      v51 = __p;
      operator delete(__p);
    }
  }
  else
  {
    util::server_log(v15);
    v21 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.__first_) = 136315394;
      *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"InCider.mm";
      WORD2(buf.__begin_) = 1024;
      *(_DWORD *)((char *)&buf.__begin_ + 6) = 422;
      _os_log_impl(&dword_237B88000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject was unable to parse NSArray input as std::vector<ascf::DictionaryRef>", (uint8_t *)&buf, 0x12u);
    }
    v22 = (void *)MEMORY[0x24BDD1540];
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 1852797029, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *, _QWORD))v9 + 2))(v9, v24, 0);

  }
  if (v54)
  {
    buf.__first_ = (std::__split_buffer<std::string>::pointer)&v53;
    std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  }
  if (cf)
    CFRelease(cf);

}

- (void)disconnectADSDeviceByAOID:(id)a3 withReply:(id)a4
{
  id v7;
  util *v8;
  util *v9;
  NSObject *v10;
  std::string *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  util *v16;
  signed int v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  std::string *v22;
  void *v23;
  std::string v24;
  _BYTE buf[12];
  __int16 v26;
  int v27;
  __int16 v28;
  std::string *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (util *)a4;
  v9 = v8;
  if (!v7)
  {
    util::server_log(v8);
    v10 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (std::string *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "InCider.mm";
      v26 = 1024;
      v27 = 433;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_237B88000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);

    }
    v12 = (void *)MEMORY[0x24BDD1540];
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 1852797029, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *))v9 + 2))(v9, v14);

  }
  v15 = objc_msgSend(v7, "unsignedIntValue");
  v16 = (util *)ads::Kernel::disconnectADSDeviceByAOID((ads::Kernel *)self->mKernelPtr.__ptr_, v15);
  v17 = (int)v16;
  util::server_log(v16);
  v18 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  v19 = v18;
  if (v17)
  {
    v20 = v18;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = bswap32(v17);
      *(_DWORD *)&buf[1] = v21;
      if (((char)v21 - 32) > 0x5E
        || (((__int16)v21 >> 8) - 32) > 0x5E
        || ((v21 << 8 >> 24) - 32) > 0x5E
        || ((v21 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v24, v17);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v24, buf);
      }
      v22 = &v24;
      if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v22 = (std::string *)v24.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "InCider.mm";
      v26 = 1024;
      v27 = 446;
      v28 = 2080;
      v29 = v22;
      v30 = 1024;
      v31 = v15;
      _os_log_impl(&dword_237B88000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s disconnecting ADS device with AOID %u", buf, 0x22u);
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v24.__r_.__value_.__l.__data_);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ads::Kernel::disconnectADSDeviceByAOID"), v17, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *))v9 + 2))(v9, v23);

  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "InCider.mm";
      v26 = 1024;
      v27 = 441;
      v28 = 1024;
      LODWORD(v29) = v15;
      _os_log_impl(&dword_237B88000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel disconnected ADS device with AOID %u without error", buf, 0x18u);
    }
    (*((void (**)(util *, _QWORD))v9 + 2))(v9, 0);
  }

}

- (void)disconnectADSDevicesByAOIDs:(id)a3 withReply:(id)a4
{
  id v6;
  util *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CFTypeRef v13;
  CFTypeID TypeID;
  CFTypeID v15;
  CFIndex Count;
  int v17;
  char *v18;
  uint64_t v19;
  char *v20;
  CFIndex v21;
  uint64_t v22;
  char *v23;
  const __CFNumber *ValueAtIndex;
  int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  int v32;
  Kernel *ptr;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  util *v37;
  NSObject *v38;
  _BOOL4 v39;
  int v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  const __CFString *v46;
  std::string *v47;
  std::string *v48;
  const __CFString *v49;
  void **v50;
  void *exception;
  void *v52;
  void *v53;
  const char *v54;
  void *v56;
  util *v57;
  std::string v58;
  void *__p;
  void *v60;
  uint64_t v61;
  CFTypeRef cf;
  void *v63[2];
  char v64;
  _BYTE buf[40];
  std::string *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (util *)a4;
  v56 = v6;
  v57 = v7;
  if (v6)
  {
    CFRetain(v6);
  }
  else
  {
    util::server_log(v7);
    v8 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "InCider.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 456;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v9;
      _os_log_impl(&dword_237B88000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);

    }
    v10 = (void *)MEMORY[0x24BDD1540];
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 1852797029, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *))v57 + 2))(v57, v12);

    v6 = 0;
  }
  applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&cf, v6);

  v13 = cf;
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  TypeID = CFArrayGetTypeID();
  v15 = CFGetTypeID(v13);
  if (TypeID != v15)
  {
LABEL_46:
    util::server_log((util *)v15);
    v41 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "InCider.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 479;
      _os_log_impl(&dword_237B88000, v41, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject was unable to parse NSArray input as std::vector<AudioObjectID>", buf, 0x12u);
    }
    v42 = (void *)MEMORY[0x24BDD1540];
    NSStringFromSelector(a2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "errorWithDomain:code:userInfo:", v43, 1852797029, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *))v57 + 2))(v57, v44);

    v23 = 0;
    v45 = 1;
    goto LABEL_72;
  }
  v54 = a2;
  Count = CFArrayGetCount((CFArrayRef)v13);
  v17 = Count;
  if (Count << 32)
  {
    if (Count << 32 < 0)
LABEL_79:
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((int)Count);
    v20 = &v18[4 * v19];
  }
  else
  {
    v20 = 0;
    v18 = 0;
  }
  if (v17 >= 1)
  {
    v21 = 0;
    v22 = v17;
    v23 = v18;
    while (1)
    {
      ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)v13, v21);
      v15 = (CFTypeID)applesauce::CF::convert_as<unsigned int,0>(ValueAtIndex);
      if (!HIDWORD(v15))
        break;
      v25 = v15;
      if (v18 >= v20)
      {
        v27 = (v18 - v23) >> 2;
        v28 = v27 + 1;
        if ((unint64_t)(v27 + 1) >> 62)
          goto LABEL_79;
        if ((v20 - v23) >> 1 > v28)
          v28 = (v20 - v23) >> 1;
        if ((unint64_t)(v20 - v23) >= 0x7FFFFFFFFFFFFFFCLL)
          v29 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v29 = v28;
        if (v29)
          v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v29);
        else
          v30 = 0;
        v31 = (char *)(v29 + 4 * v27);
        *(_DWORD *)v31 = v25;
        v26 = (uint64_t)(v31 + 4);
        while (v18 != v23)
        {
          v32 = *((_DWORD *)v18 - 1);
          v18 -= 4;
          *((_DWORD *)v31 - 1) = v32;
          v31 -= 4;
        }
        v20 = (char *)(v29 + 4 * v30);
        if (v23)
          operator delete(v23);
        v23 = v31;
      }
      else
      {
        *(_DWORD *)v18 = v15;
        v26 = (uint64_t)(v18 + 4);
      }
      ++v21;
      v18 = (char *)v26;
      if (v21 == v22)
        goto LABEL_35;
    }
    a2 = v54;
    if (v23)
      operator delete(v23);
    goto LABEL_46;
  }
  v26 = (uint64_t)v18;
  v23 = v18;
LABEL_35:
  ptr = self->mKernelPtr.__ptr_;
  v60 = 0;
  v61 = 0;
  __p = 0;
  std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&__p, v23, v26, (v26 - (uint64_t)v23) >> 2);
  v58.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
  v58.__r_.__value_.__l.__size_ = (std::string::size_type)ptr;
  v34 = (void *)*((_QWORD *)ptr + 7);
  applesauce::dispatch::v1::queue::operator*(v34);
  v35 = objc_claimAutoreleasedReturnValue();
  LODWORD(v63[0]) = 0;
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel27disconnectADSDevicesByAOIDsENSt3__16vectorIjNS5_9allocatorIjEEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  *(_QWORD *)&buf[24] = &__block_descriptor_48_e5_v8__0l;
  *(_QWORD *)&buf[32] = v63;
  v66 = &v58;
  dispatch_sync(v35, buf);
  v36 = SLODWORD(v63[0]);

  v37 = (util *)__p;
  if (__p)
  {
    v60 = __p;
    operator delete(__p);
  }
  util::server_log(v37);
  v38 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v36)
  {
    if (v39)
    {
      v40 = bswap32(v36);
      *(_DWORD *)((char *)v63 + 1) = v40;
      if (((char)v40 - 32) > 0x5E
        || (((__int16)v40 >> 8) - 32) > 0x5E
        || ((v40 << 8 >> 24) - 32) > 0x5E
        || ((v40 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v58, v36);
      }
      else
      {
        *(_WORD *)((char *)v63 + 5) = 39;
        LOBYTE(v63[0]) = 39;
        std::string::basic_string[abi:ne180100]<0>(&v58, (char *)v63);
      }
      if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v48 = &v58;
      else
        v48 = (std::string *)v58.__r_.__value_.__r.__words[0];
      if (!cf)
      {
        v52 = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x23B820E38](v52, "Could not construct");
        __cxa_throw(v52, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      v49 = CFCopyDescription(cf);
      applesauce::CF::details::CFString_get_value<true>((uint64_t)v63, v49);
      if (v49)
        CFRelease(v49);
      v50 = v63;
      if (v64 < 0)
        v50 = (void **)v63[0];
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "InCider.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 473;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v48;
      *(_WORD *)&buf[28] = 2080;
      *(_QWORD *)&buf[30] = v50;
      _os_log_impl(&dword_237B88000, v38, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s disconnecting ADS devices with AOIDs %s", buf, 0x26u);
      if (v64 < 0)
        operator delete(v63[0]);
      if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v58.__r_.__value_.__l.__data_);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ads::Kernel::disconnectADSDevicesByAOIDs"), v36, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *))v57 + 2))(v57, v43);
    v45 = 0;
LABEL_72:

    goto LABEL_73;
  }
  if (v39)
  {
    if (!cf)
    {
      v53 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x23B820E38](v53, "Could not construct");
      __cxa_throw(v53, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
    v46 = CFCopyDescription(cf);
    applesauce::CF::details::CFString_get_value<true>((uint64_t)&v58, v46);
    if (v46)
      CFRelease(v46);
    v47 = &v58;
    if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v47 = (std::string *)v58.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "InCider.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 468;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = v47;
    _os_log_impl(&dword_237B88000, v38, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel disconnected ADS devices with AOIDs %s without error", buf, 0x1Cu);
    if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v58.__r_.__value_.__l.__data_);
  }

  (*((void (**)(util *, _QWORD))v57 + 2))(v57, 0);
  v45 = 0;
LABEL_73:
  if ((v45 & 1) == 0 && v23)
    operator delete(v23);
  if (cf)
    CFRelease(cf);

}

- (void)disconnectADSDeviceByUUID:(id)a3 withReply:(id)a4
{
  id v7;
  util *v8;
  util *v9;
  NSObject *v10;
  std::string *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  Kernel *ptr;
  util *v17;
  signed int v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  std::string *v23;
  std::string *v24;
  std::string *p_p;
  void *v26;
  std::string v27;
  std::string v28;
  std::string __p;
  _BYTE buf[12];
  __int16 v31;
  int v32;
  __int16 v33;
  std::string *v34;
  __int16 v35;
  std::string *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (util *)a4;
  v9 = v8;
  if (!v7)
  {
    util::server_log(v8);
    v10 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (std::string *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "InCider.mm";
      v31 = 1024;
      v32 = 489;
      v33 = 2112;
      v34 = v11;
      _os_log_impl(&dword_237B88000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);

    }
    v12 = (void *)MEMORY[0x24BDD1540];
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 1852797029, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *))v9 + 2))(v9, v14);

  }
  v15 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v15, "UTF8String"));
  ptr = self->mKernelPtr.__ptr_;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v28, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v28 = __p;
  v17 = (util *)ads::Kernel::disconnectADSDeviceByUUID((uint64_t)ptr, (uint64_t)&v28);
  v18 = (int)v17;
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v28.__r_.__value_.__l.__data_);
  util::server_log(v17);
  v19 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  v20 = v19;
  if (v18)
  {
    v21 = v19;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = bswap32(v18);
      *(_DWORD *)&buf[1] = v22;
      if (((char)v22 - 32) > 0x5E
        || (((__int16)v22 >> 8) - 32) > 0x5E
        || ((v22 << 8 >> 24) - 32) > 0x5E
        || ((v22 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v27, v18);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v27, buf);
      }
      v24 = &v27;
      if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v24 = (std::string *)v27.__r_.__value_.__r.__words[0];
      p_p = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "InCider.mm";
      v31 = 1024;
      v32 = 502;
      v33 = 2080;
      v34 = v24;
      v35 = 2080;
      v36 = p_p;
      _os_log_impl(&dword_237B88000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s disconnecting ADS device with UUID %s", buf, 0x26u);
      if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v27.__r_.__value_.__l.__data_);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ads::Kernel::disconnectADSDeviceByUUID"), v18, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *))v9 + 2))(v9, v26);

  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v23 = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v23 = (std::string *)__p.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "InCider.mm";
      v31 = 1024;
      v32 = 497;
      v33 = 2080;
      v34 = v23;
      _os_log_impl(&dword_237B88000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel disconnected ADS device with UUID %s without error", buf, 0x1Cu);
    }
    (*((void (**)(util *, _QWORD))v9 + 2))(v9, 0);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

}

- (void)disconnectADSDevicesByUUIDs:(id)a3 withReply:(id)a4
{
  id v6;
  util *v7;
  NSObject *v8;
  std::string *v9;
  void *v10;
  void *v11;
  void *v12;
  CFTypeRef v13;
  CFTypeID TypeID;
  util *v15;
  CFIndex Count;
  int v17;
  uint64_t v18;
  CFIndex v19;
  const __CFString *ValueAtIndex;
  std::vector<std::string>::pointer end;
  std::string *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  std::string *v27;
  Kernel *ptr;
  void *v29;
  NSObject *v30;
  signed int begin;
  util *v32;
  NSObject *v33;
  _BOOL4 v34;
  uint64_t v35;
  int v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  std::string *v42;
  std::string *v43;
  const __CFString *v44;
  std::string *v45;
  void *exception;
  void *v47;
  void *v48;
  void *v50;
  util *v51;
  _QWORD v52[3];
  std::vector<std::string> v53;
  char v54;
  CFTypeRef cf;
  std::string __p;
  char v57;
  std::vector<std::string> v58;
  std::__split_buffer<std::string> buf;
  std::string *p_p;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (util *)a4;
  v50 = v6;
  v51 = v7;
  if (v6)
  {
    CFRetain(v6);
  }
  else
  {
    util::server_log(v7);
    v8 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v9 = (std::string *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.__first_) = 136315650;
      *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"InCider.mm";
      WORD2(buf.__begin_) = 1024;
      *(_DWORD *)((char *)&buf.__begin_ + 6) = 512;
      WORD1(buf.__end_) = 2112;
      *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__end_ + 4) = v9;
      _os_log_impl(&dword_237B88000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", (uint8_t *)&buf, 0x1Cu);

    }
    v10 = (void *)MEMORY[0x24BDD1540];
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 1852797029, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *))v51 + 2))(v51, v12);

    v6 = 0;
  }
  applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&cf, v6);

  v13 = cf;
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x23B820E38](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  TypeID = CFArrayGetTypeID();
  v15 = (util *)CFGetTypeID(v13);
  if ((util *)TypeID != v15)
  {
    LOBYTE(v53.__begin_) = 0;
    v54 = 0;
LABEL_38:
    util::server_log(v15);
    v37 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.__first_) = 136315394;
      *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"InCider.mm";
      WORD2(buf.__begin_) = 1024;
      *(_DWORD *)((char *)&buf.__begin_ + 6) = 535;
      _os_log_impl(&dword_237B88000, v37, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject was unable to parse NSArray input as std::vector<std::string>", (uint8_t *)&buf, 0x12u);
    }
    v38 = (void *)MEMORY[0x24BDD1540];
    NSStringFromSelector(a2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", v39, 1852797029, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *))v51 + 2))(v51, v40);

    goto LABEL_64;
  }
  Count = CFArrayGetCount((CFArrayRef)v13);
  v17 = Count;
  memset(&v58, 0, sizeof(v58));
  if (Count << 32)
  {
    if (Count << 32 < 0)
LABEL_70:
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    buf.__end_cap_.__value_ = (std::allocator<std::string> *)&v58.__end_cap_;
    buf.__first_ = (std::__split_buffer<std::string>::pointer)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((int)Count);
    buf.__begin_ = buf.__first_;
    buf.__end_ = buf.__first_;
    buf.__end_cap_.__value_ = &buf.__first_[v18];
    std::vector<std::string>::__swap_out_circular_buffer(&v58, &buf);
    std::__split_buffer<std::string>::~__split_buffer(&buf);
  }
  if (v17 < 1)
  {
LABEL_27:
    v53 = v58;
    memset(&v58, 0, sizeof(v58));
    v54 = 1;
  }
  else
  {
    v19 = 0;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v13, v19);
      applesauce::CF::convert_as<std::string,0>((uint64_t)&__p, ValueAtIndex);
      if (!v57)
        break;
      end = v58.__end_;
      if (v58.__end_ >= v58.__end_cap_.__value_)
      {
        v23 = 0xAAAAAAAAAAAAAAABLL * (((char *)v58.__end_ - (char *)v58.__begin_) >> 3);
        v24 = v23 + 1;
        if (v23 + 1 > 0xAAAAAAAAAAAAAAALL)
          goto LABEL_70;
        if (0x5555555555555556 * (((char *)v58.__end_cap_.__value_ - (char *)v58.__begin_) >> 3) > v24)
          v24 = 0x5555555555555556 * (((char *)v58.__end_cap_.__value_ - (char *)v58.__begin_) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v58.__end_cap_.__value_ - (char *)v58.__begin_) >> 3) >= 0x555555555555555)
          v25 = 0xAAAAAAAAAAAAAAALL;
        else
          v25 = v24;
        buf.__end_cap_.__value_ = (std::allocator<std::string> *)&v58.__end_cap_;
        if (v25)
          v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v25);
        else
          v26 = 0;
        v27 = (std::string *)(v25 + 24 * v23);
        buf.__first_ = (std::__split_buffer<std::string>::pointer)v25;
        buf.__begin_ = v27;
        buf.__end_cap_.__value_ = (std::string *)(v25 + 24 * v26);
        *v27 = __p;
        memset(&__p, 0, sizeof(__p));
        buf.__end_ = v27 + 1;
        std::vector<std::string>::__swap_out_circular_buffer(&v58, &buf);
        v22 = v58.__end_;
        std::__split_buffer<std::string>::~__split_buffer(&buf);
      }
      else
      {
        *(_OWORD *)v58.__end_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        end->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
        memset(&__p, 0, sizeof(__p));
        v22 = end + 1;
      }
      v58.__end_ = v22;
      if (v17 == ++v19)
        goto LABEL_27;
    }
    LOBYTE(v53.__begin_) = 0;
    v54 = 0;
  }
  buf.__first_ = (std::__split_buffer<std::string>::pointer)&v58;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (!v54)
    goto LABEL_38;
  ptr = self->mKernelPtr.__ptr_;
  memset(v52, 0, sizeof(v52));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((uint64_t)v52, (__int128 *)v53.__begin_, (__int128 *)v53.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)v53.__end_ - (char *)v53.__begin_) >> 3));
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v52;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)ptr;
  v29 = (void *)*((_QWORD *)ptr + 7);
  applesauce::dispatch::v1::queue::operator*(v29);
  v30 = objc_claimAutoreleasedReturnValue();
  LODWORD(v58.__begin_) = 0;
  buf.__first_ = (std::__split_buffer<std::string>::pointer)MEMORY[0x24BDAC760];
  buf.__begin_ = (std::__split_buffer<std::string>::pointer)3221225472;
  buf.__end_ = (std::__split_buffer<std::string>::pointer)___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel27disconnectADSDevicesByUUIDsENSt3__16vectorINS5_12basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEENSA_ISC_EEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  buf.__end_cap_.__value_ = (std::string *)&__block_descriptor_48_e5_v8__0l;
  buf.__end_cap_.__value_ = (std::allocator<std::string> *)&v58;
  p_p = &__p;
  dispatch_sync(v30, &buf);
  begin = (signed int)v58.__begin_;

  buf.__first_ = (std::__split_buffer<std::string>::pointer)v52;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  util::server_log(v32);
  v33 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
  if (begin)
  {
    v35 = begin;
    if (v34)
    {
      v36 = bswap32(begin);
      *(_DWORD *)((char *)&v58.__begin_ + 1) = v36;
      if (((char)v36 - 32) > 0x5E
        || (((__int16)v36 >> 8) - 32) > 0x5E
        || ((v36 << 8 >> 24) - 32) > 0x5E
        || ((v36 >> 24) - 32) > 0x5E)
      {
        std::to_string(&__p, begin);
      }
      else
      {
        *(_WORD *)((char *)&v58.__begin_ + 5) = 39;
        LOBYTE(v58.__begin_) = 39;
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)&v58);
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v43 = &__p;
      else
        v43 = (std::string *)__p.__r_.__value_.__r.__words[0];
      if (!cf)
      {
        v47 = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x23B820E38](v47, "Could not construct");
        __cxa_throw(v47, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      v44 = CFCopyDescription(cf);
      applesauce::CF::details::CFString_get_value<true>((uint64_t)&v58, v44);
      if (v44)
        CFRelease(v44);
      v45 = (std::string *)&v58;
      if (SHIBYTE(v58.__end_cap_.__value_) < 0)
        v45 = v58.__begin_;
      LODWORD(buf.__first_) = 136315906;
      *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"InCider.mm";
      WORD2(buf.__begin_) = 1024;
      *(_DWORD *)((char *)&buf.__begin_ + 6) = 529;
      WORD1(buf.__end_) = 2080;
      *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__end_ + 4) = v43;
      WORD2(buf.__end_cap_.__value_) = 2080;
      *(std::string **)((char *)&buf.__end_cap_.__value_ + 6) = v45;
      _os_log_impl(&dword_237B88000, v33, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s disconnecting ADS devices with UUIDs %s", (uint8_t *)&buf, 0x26u);
      if (SHIBYTE(v58.__end_cap_.__value_) < 0)
        operator delete(v58.__begin_);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ads::Kernel::disconnectADSDeviceByUUIDs"), v35, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *))v51 + 2))(v51, v39);
LABEL_64:

    goto LABEL_65;
  }
  if (v34)
  {
    if (!cf)
    {
      v48 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x23B820E38](v48, "Could not construct");
      __cxa_throw(v48, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
    v41 = CFCopyDescription(cf);
    applesauce::CF::details::CFString_get_value<true>((uint64_t)&__p, v41);
    if (v41)
      CFRelease(v41);
    v42 = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v42 = (std::string *)__p.__r_.__value_.__r.__words[0];
    LODWORD(buf.__first_) = 136315650;
    *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"InCider.mm";
    WORD2(buf.__begin_) = 1024;
    *(_DWORD *)((char *)&buf.__begin_ + 6) = 524;
    WORD1(buf.__end_) = 2080;
    *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__end_ + 4) = v42;
    _os_log_impl(&dword_237B88000, v33, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel disconnected ADS devices with UUIDs %s without error", (uint8_t *)&buf, 0x1Cu);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }

  (*((void (**)(util *, _QWORD))v51 + 2))(v51, 0);
LABEL_65:
  if (v54)
  {
    buf.__first_ = (std::__split_buffer<std::string>::pointer)&v53;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  }
  if (cf)
    CFRelease(cf);

}

- (void)disconnectAllADSDevices:(id)a3
{
  void (**v4)(id, void *);
  util *v5;
  signed int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  std::string *v11;
  void *v12;
  std::string v13;
  _BYTE buf[12];
  __int16 v15;
  int v16;
  __int16 v17;
  std::string *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  v5 = (util *)ads::Kernel::disconnectAllADSDevices((ads::Kernel *)self->mKernelPtr.__ptr_);
  v6 = (int)v5;
  util::server_log(v5);
  v7 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  v8 = v7;
  if (v6)
  {
    v9 = v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = bswap32(v6);
      *(_DWORD *)&buf[1] = v10;
      if (((char)v10 - 32) > 0x5E
        || (((__int16)v10 >> 8) - 32) > 0x5E
        || ((v10 << 8 >> 24) - 32) > 0x5E
        || ((v10 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v13, v6);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v13, buf);
      }
      v11 = &v13;
      if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v11 = (std::string *)v13.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "InCider.mm";
      v15 = 1024;
      v16 = 549;
      v17 = 2080;
      v18 = v11;
      _os_log_impl(&dword_237B88000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s disconnecting all ADS devices", buf, 0x1Cu);
      if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v13.__r_.__value_.__l.__data_);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ads::Kernel::disconnectAllADSDevices"), v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v12);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "InCider.mm";
      v15 = 1024;
      v16 = 544;
      _os_log_impl(&dword_237B88000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel disconnected all ADS devices without error", buf, 0x12u);
    }
    v4[2](v4, 0);
  }

}

- (void)isDeviceWithAOIDConnected:(id)a3 withReply:(id)a4
{
  id v7;
  util *v8;
  util *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  Kernel *ptr;
  void *v17;
  NSObject *v18;
  int v19;
  util *v20;
  NSObject *v21;
  const char *v22;
  _QWORD v23[2];
  int v24;
  unsigned __int8 v25;
  _BYTE buf[40];
  _QWORD *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (util *)a4;
  v9 = v8;
  if (!v7)
  {
    util::server_log(v8);
    v10 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "InCider.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 560;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v11;
      _os_log_impl(&dword_237B88000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);

    }
    v12 = (void *)MEMORY[0x24BDD1540];
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 1852797029, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *, _QWORD))v9 + 2))(v9, v14, 0);

  }
  v15 = objc_msgSend(v7, "unsignedIntValue");
  ptr = self->mKernelPtr.__ptr_;
  v24 = v15;
  v23[0] = ptr;
  v23[1] = &v24;
  v17 = (void *)*((_QWORD *)ptr + 7);
  applesauce::dispatch::v1::queue::operator*(v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v25 = 0;
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25isDeviceWithAOIDConnectedEjE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke;
  *(_QWORD *)&buf[24] = &__block_descriptor_48_e5_v8__0l;
  *(_QWORD *)&buf[32] = &v25;
  v27 = v23;
  dispatch_sync(v18, buf);
  v19 = v25;

  util::server_log(v20);
  v21 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = "it isn't";
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "InCider.mm";
    *(_DWORD *)&buf[14] = 567;
    *(_WORD *)&buf[12] = 1024;
    if (v19)
      v22 = "it is";
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v15;
    *(_WORD *)&buf[24] = 2080;
    *(_QWORD *)&buf[26] = v22;
    _os_log_impl(&dword_237B88000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel checked if device with AOID %u is connected (%s)", buf, 0x22u);
  }
  (*((void (**)(util *, _QWORD, BOOL))v9 + 2))(v9, 0, v19 != 0);

}

- (void)isDeviceWithUUIDConnected:(id)a3 withReply:(id)a4
{
  id v7;
  util *v8;
  util *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  Kernel *ptr;
  void *v17;
  NSObject *v18;
  int v19;
  util *v20;
  NSObject *v21;
  std::string *v22;
  const char *v23;
  std::string __p;
  std::string v25;
  _QWORD v26[2];
  unsigned __int8 v27;
  _BYTE buf[40];
  _QWORD *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (util *)a4;
  v9 = v8;
  if (!v7)
  {
    util::server_log(v8);
    v10 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "InCider.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 576;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v11;
      _os_log_impl(&dword_237B88000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);

    }
    v12 = (void *)MEMORY[0x24BDD1540];
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 1852797029, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *, _QWORD))v9 + 2))(v9, v14, 0);

  }
  v15 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:ne180100]<0>(&v25, (char *)objc_msgSend(v15, "UTF8String"));
  ptr = self->mKernelPtr.__ptr_;
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v25.__r_.__value_.__l.__data_, v25.__r_.__value_.__l.__size_);
  else
    __p = v25;
  v26[0] = ptr;
  v26[1] = &__p;
  v17 = (void *)*((_QWORD *)ptr + 7);
  applesauce::dispatch::v1::queue::operator*(v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v27 = 0;
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25isDeviceWithUUIDConnectedENSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  *(_QWORD *)&buf[24] = &__block_descriptor_48_e5_v8__0l;
  *(_QWORD *)&buf[32] = &v27;
  v29 = v26;
  dispatch_sync(v18, buf);
  v19 = v27;

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  util::server_log(v20);
  v21 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = &v25;
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v22 = (std::string *)v25.__r_.__value_.__r.__words[0];
    *(_QWORD *)&buf[4] = "InCider.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 583;
    v23 = "it is";
    *(_DWORD *)buf = 136315906;
    if (!v19)
      v23 = "it isn't";
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = v22;
    *(_WORD *)&buf[28] = 2080;
    *(_QWORD *)&buf[30] = v23;
    _os_log_impl(&dword_237B88000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel checked if device with UUID %s is connected (%s)", buf, 0x26u);
  }
  (*((void (**)(util *, _QWORD, BOOL))v9 + 2))(v9, 0, v19 != 0);
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v25.__r_.__value_.__l.__data_);

}

- (void)serializeNonADSDevices:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  void **v5;
  int v6;
  __int128 *v7[3];
  __int128 **v8;

  v3 = (void (**)(id, void *, _QWORD))a3;
  util::WriteDevicesExceptionSafe((util *)&v6);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ads::Kernel::serializeNonADSDevices"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v4, 0);

  }
  else
  {
    v5 = (void **)applesauce::CF::details::make_CFArrayRef<std::string>(v7);
    v8 = (__int128 **)v5;
    ((void (**)(id, void *, void **))v3)[2](v3, 0, v5);
    CFRelease(v5);
  }
  v8 = v7;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);

}

- (void)hasProperty:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withReply:(id)a5
{
  id v9;
  util *v10;
  util *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  Kernel *ptr;
  void *v19;
  NSObject *v20;
  std::string::size_type v21;
  util *v22;
  NSObject *v23;
  _BOOL4 v24;
  int v25;
  AudioObjectPropertySelector v26;
  int v27;
  std::string *v28;
  AudioObjectPropertySelector mSelector;
  int v30;
  std::string *v31;
  AudioObjectPropertyScope mScope;
  int v33;
  std::string *p_p;
  AudioObjectPropertyElement mElement;
  void *v36;
  std::string *v37;
  AudioObjectPropertyScope v38;
  int v39;
  std::string *v40;
  AudioObjectPropertyElement v41;
  const char *v42;
  std::string __p;
  std::string v44;
  std::string v45;
  int v46;
  _BYTE buf[60];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (util *)a5;
  v11 = v10;
  if (!v9)
  {
    util::server_log(v10);
    v12 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "InCider.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 605;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v13;
      _os_log_impl(&dword_237B88000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);

    }
    v14 = (void *)MEMORY[0x24BDD1540];
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 1852797029, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *, _QWORD))v11 + 2))(v11, v16, 0);

  }
  v17 = objc_msgSend(v9, "unsignedIntValue");
  ptr = self->mKernelPtr.__ptr_;
  v46 = v17;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a4;
  v45.__r_.__value_.__r.__words[0] = (std::string::size_type)ptr;
  v45.__r_.__value_.__l.__size_ = (std::string::size_type)&v46;
  v45.__r_.__value_.__r.__words[2] = (std::string::size_type)&__p;
  v19 = (void *)*((_QWORD *)ptr + 7);
  applesauce::dispatch::v1::queue::operator*(v19);
  v20 = objc_claimAutoreleasedReturnValue();
  LODWORD(v44.__r_.__value_.__l.__data_) = 0;
  WORD2(v44.__r_.__value_.__r.__words[0]) = 0;
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel11hasPropertyEjPK26AudioObjectPropertyAddressE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS9_17integral_constantIbLb0EEE_block_invoke;
  *(_QWORD *)&buf[24] = &__block_descriptor_48_e5_v8__0l;
  *(_QWORD *)&buf[32] = &v44;
  *(_QWORD *)&buf[40] = &v45;
  dispatch_sync(v20, buf);
  v21 = v44.__r_.__value_.__r.__words[0];

  util::server_log(v22);
  v23 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v21)
  {
    if (v24)
    {
      v25 = bswap32(v21);
      *(_DWORD *)&buf[1] = v25;
      if (((char)v25 - 32) > 0x5E
        || (((__int16)v25 >> 8) - 32) > 0x5E
        || ((v25 << 8 >> 24) - 32) > 0x5E
        || ((v25 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v45, v21);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v45, buf);
      }
      if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v28 = &v45;
      else
        v28 = (std::string *)v45.__r_.__value_.__r.__words[0];
      mSelector = a4->mSelector;
      v30 = bswap32(a4->mSelector);
      *(_DWORD *)&buf[1] = v30;
      if (((char)v30 - 32) > 0x5E
        || (((__int16)v30 >> 8) - 32) > 0x5E
        || ((v30 << 8 >> 24) - 32) > 0x5E
        || ((v30 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v44, mSelector);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v44, buf);
      }
      if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v31 = &v44;
      else
        v31 = (std::string *)v44.__r_.__value_.__r.__words[0];
      mScope = a4->mScope;
      v33 = bswap32(mScope);
      *(_DWORD *)&buf[1] = v33;
      if (((char)v33 - 32) > 0x5E
        || (((__int16)v33 >> 8) - 32) > 0x5E
        || ((v33 << 8 >> 24) - 32) > 0x5E
        || ((v33 >> 24) - 32) > 0x5E)
      {
        std::to_string(&__p, mScope);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&__p, buf);
      }
      p_p = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      mElement = a4->mElement;
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = "InCider.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 633;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v28;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v17;
      *(_WORD *)&buf[34] = 2080;
      *(_QWORD *)&buf[36] = v31;
      *(_WORD *)&buf[44] = 2080;
      *(_QWORD *)&buf[46] = p_p;
      *(_WORD *)&buf[54] = 1024;
      *(_DWORD *)&buf[56] = mElement;
      _os_log_impl(&dword_237B88000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s checking if device with ID %u has property [%s/%s/%u]", buf, 0x3Cu);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v44.__r_.__value_.__l.__data_);
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v45.__r_.__value_.__l.__data_);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ads::Kernel::hasProperty"), (int)v21, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *, _QWORD))v11 + 2))(v11, v36, 0);

  }
  else
  {
    if (v24)
    {
      v26 = a4->mSelector;
      v27 = bswap32(a4->mSelector);
      *(_DWORD *)&buf[1] = v27;
      if (((char)v27 - 32) > 0x5E
        || (((__int16)v27 >> 8) - 32) > 0x5E
        || ((v27 << 8 >> 24) - 32) > 0x5E
        || ((v27 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v45, v26);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v45, buf);
      }
      if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v37 = &v45;
      else
        v37 = (std::string *)v45.__r_.__value_.__r.__words[0];
      v38 = a4->mScope;
      v39 = bswap32(v38);
      *(_DWORD *)&buf[1] = v39;
      if (((char)v39 - 32) > 0x5E
        || (((__int16)v39 >> 8) - 32) > 0x5E
        || ((v39 << 8 >> 24) - 32) > 0x5E
        || ((v39 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v44, v38);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v44, buf);
      }
      v40 = &v44;
      if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v40 = (std::string *)v44.__r_.__value_.__r.__words[0];
      v41 = a4->mElement;
      v42 = "it does";
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = "InCider.mm";
      if (!BYTE4(v21))
        v42 = "'it doesn't";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 622;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v17;
      *(_WORD *)&buf[24] = 2080;
      *(_QWORD *)&buf[26] = v37;
      *(_WORD *)&buf[34] = 2080;
      *(_QWORD *)&buf[36] = v40;
      *(_WORD *)&buf[44] = 1024;
      *(_DWORD *)&buf[46] = v41;
      *(_WORD *)&buf[50] = 2080;
      *(_QWORD *)&buf[52] = v42;
      _os_log_impl(&dword_237B88000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel successfully checked if device with ID %u has property [%s/%s/%u] (%s)", buf, 0x3Cu);
      if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v44.__r_.__value_.__l.__data_);
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v45.__r_.__value_.__l.__data_);
    }

    (*((void (**)(util *, _QWORD, BOOL))v11 + 2))(v11, 0, BYTE4(v21) != 0);
  }

}

- (void)getPropertyDataSize:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInQualifierData:(id)a5 withReply:(id)a6
{
  id v11;
  id v12;
  util *v13;
  util *v14;
  NSObject *v15;
  std::string *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  Kernel *ptr;
  int v23;
  const void *v24;
  Kernel *v25;
  int v26;
  AudioObjectPropertyAddress *v27;
  int v28;
  unint64_t PropertyDataSize;
  NSObject *v30;
  _BOOL4 v31;
  int v32;
  AudioObjectPropertySelector v33;
  int v34;
  std::string *v35;
  AudioObjectPropertySelector mSelector;
  int v37;
  std::string *v38;
  AudioObjectPropertyScope mScope;
  int v40;
  std::string *v41;
  AudioObjectPropertyElement mElement;
  void *v43;
  std::string *v44;
  AudioObjectPropertyScope v45;
  int v46;
  std::string *v47;
  AudioObjectPropertyElement v48;
  std::string v49;
  std::string v50;
  std::string v51;
  _BYTE buf[12];
  __int16 v53;
  int v54;
  __int16 v55;
  std::string *v56;
  __int16 v57;
  std::string *v58;
  __int16 v59;
  _BYTE v60[10];
  AudioObjectPropertyElement v61;
  __int16 v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = (util *)a6;
  v14 = v13;
  if (!v11)
  {
    util::server_log(v13);
    v15 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v16 = (std::string *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "InCider.mm";
      v53 = 1024;
      v54 = 645;
      v55 = 2112;
      v56 = v16;
      _os_log_impl(&dword_237B88000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);

    }
    v17 = (void *)MEMORY[0x24BDD1540];
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 1852797029, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *, _QWORD))v14 + 2))(v14, v19, 0);

  }
  v20 = objc_msgSend(v11, "unsignedIntValue");
  if (v12 && (v21 = objc_retainAutorelease(v12), objc_msgSend(v21, "bytes")))
  {
    ptr = self->mKernelPtr.__ptr_;
    v23 = objc_msgSend(v21, "length");
    v24 = (const void *)objc_msgSend(objc_retainAutorelease(v21), "bytes");
    v25 = ptr;
    v26 = v20;
    v27 = a4;
    v28 = v23;
  }
  else
  {
    v25 = self->mKernelPtr.__ptr_;
    v26 = v20;
    v27 = a4;
    v28 = 0;
    v24 = 0;
  }
  PropertyDataSize = ads::Kernel::getPropertyDataSize((ads::Kernel *)v25, v26, v27, v28, v24);
  util::server_log((util *)PropertyDataSize);
  v30 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)PropertyDataSize)
  {
    if (v31)
    {
      v32 = bswap32(PropertyDataSize);
      *(_DWORD *)&buf[1] = v32;
      if (((char)v32 - 32) > 0x5E
        || (((__int16)v32 >> 8) - 32) > 0x5E
        || ((v32 << 8 >> 24) - 32) > 0x5E
        || ((v32 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v51, PropertyDataSize);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v51, buf);
      }
      if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v35 = &v51;
      else
        v35 = (std::string *)v51.__r_.__value_.__r.__words[0];
      mSelector = a4->mSelector;
      v37 = bswap32(a4->mSelector);
      *(_DWORD *)&buf[1] = v37;
      if (((char)v37 - 32) > 0x5E
        || (((__int16)v37 >> 8) - 32) > 0x5E
        || ((v37 << 8 >> 24) - 32) > 0x5E
        || ((v37 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v50, mSelector);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v50, buf);
      }
      if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v38 = &v50;
      else
        v38 = (std::string *)v50.__r_.__value_.__r.__words[0];
      mScope = a4->mScope;
      v40 = bswap32(mScope);
      *(_DWORD *)&buf[1] = v40;
      if (((char)v40 - 32) > 0x5E
        || (((__int16)v40 >> 8) - 32) > 0x5E
        || ((v40 << 8 >> 24) - 32) > 0x5E
        || ((v40 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v49, mScope);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v49, buf);
      }
      v41 = &v49;
      if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v41 = (std::string *)v49.__r_.__value_.__r.__words[0];
      mElement = a4->mElement;
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = "InCider.mm";
      v53 = 1024;
      v54 = 682;
      v55 = 2080;
      v56 = v35;
      v57 = 2080;
      v58 = v38;
      v59 = 2080;
      *(_QWORD *)v60 = v41;
      *(_WORD *)&v60[8] = 1024;
      v61 = mElement;
      v62 = 1024;
      v63 = v20;
      _os_log_impl(&dword_237B88000, v30, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s getting property data size for [%s/%s/%u] on device with ID %u", buf, 0x3Cu);
      if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v49.__r_.__value_.__l.__data_);
      if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v50.__r_.__value_.__l.__data_);
      if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v51.__r_.__value_.__l.__data_);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ads::Kernel::getPropertyDataSize"), (int)PropertyDataSize, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *, _QWORD))v14 + 2))(v14, v43, 0);

  }
  else
  {
    if (v31)
    {
      v33 = a4->mSelector;
      v34 = bswap32(a4->mSelector);
      *(_DWORD *)&buf[1] = v34;
      if (((char)v34 - 32) > 0x5E
        || (((__int16)v34 >> 8) - 32) > 0x5E
        || ((v34 << 8 >> 24) - 32) > 0x5E
        || ((v34 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v51, v33);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v51, buf);
      }
      if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v44 = &v51;
      else
        v44 = (std::string *)v51.__r_.__value_.__r.__words[0];
      v45 = a4->mScope;
      v46 = bswap32(v45);
      *(_DWORD *)&buf[1] = v46;
      if (((char)v46 - 32) > 0x5E
        || (((__int16)v46 >> 8) - 32) > 0x5E
        || ((v46 << 8 >> 24) - 32) > 0x5E
        || ((v46 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v50, v45);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v50, buf);
      }
      v47 = &v50;
      if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v47 = (std::string *)v50.__r_.__value_.__r.__words[0];
      v48 = a4->mElement;
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "InCider.mm";
      v53 = 1024;
      v54 = 671;
      v55 = 2080;
      v56 = v44;
      v57 = 2080;
      v58 = v47;
      v59 = 1024;
      *(_DWORD *)v60 = v48;
      *(_WORD *)&v60[4] = 1024;
      *(_DWORD *)&v60[6] = v20;
      _os_log_impl(&dword_237B88000, v30, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel successfully got property data size for [%s/%s/%u] on device with ID %u", buf, 0x32u);
      if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v50.__r_.__value_.__l.__data_);
      if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v51.__r_.__value_.__l.__data_);
    }

    (*((void (**)(util *, _QWORD, unint64_t))v14 + 2))(v14, 0, HIDWORD(PropertyDataSize));
  }

}

- (void)getPropertyDataSize:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withReply:(id)a5
{
  -[CiderObject getPropertyDataSize:withInAddress:withInQualifierData:withReply:](self, "getPropertyDataSize:withInAddress:withInQualifierData:withReply:", a3, a4, 0, a5);
}

- (void)getPropertyData_Arithmetic:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInQualifierData:(id)a5 withReply:(id)a6
{
  id v11;
  util *v12;
  util *v13;
  NSObject *v14;
  std::string *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  Kernel *ptr;
  uint64_t v22;
  uint64_t v23;
  Kernel *v24;
  const AudioObjectPropertyAddress *v25;
  AudioObjectPropertyAddress *v26;
  const void *v27;
  signed int v28;
  const void *v29;
  _BOOL4 v30;
  util *v31;
  NSObject *v32;
  _BOOL4 v33;
  int v34;
  AudioObjectPropertySelector mSelector;
  int v36;
  std::string *v37;
  AudioObjectPropertySelector v38;
  int v39;
  std::string *v40;
  AudioObjectPropertyScope v41;
  int v42;
  std::string *v43;
  AudioObjectPropertyElement v44;
  void *v45;
  std::string *v46;
  AudioObjectPropertyScope mScope;
  int v48;
  std::string *v49;
  AudioObjectPropertyElement mElement;
  id v51;
  id v52;
  std::string v53;
  std::string v54;
  std::string v55;
  int v56;
  uint64_t v57;
  _BYTE buf[18];
  __int16 v59;
  std::string *v60;
  __int16 v61;
  std::string *v62;
  __int16 v63;
  _BYTE v64[10];
  AudioObjectPropertyElement v65;
  __int16 v66;
  int v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v51 = a5;
  v12 = (util *)a6;
  v13 = v12;
  if (!v11)
  {
    util::server_log(v12);
    v14 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v15 = (std::string *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "InCider.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 700;
      v59 = 2112;
      v60 = v15;
      _os_log_impl(&dword_237B88000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);

    }
    v16 = (void *)MEMORY[0x24BDD1540];
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 1852797029, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *, _QWORD))v13 + 2))(v13, v18, 0);

  }
  v19 = objc_msgSend(v11, "unsignedIntValue", v51);
  v56 = 0;
  v57 = 0;
  if (v52 && (v20 = objc_retainAutorelease(v52), objc_msgSend(v20, "bytes")))
  {
    ptr = self->mKernelPtr.__ptr_;
    v22 = objc_msgSend(v20, "length");
    v23 = objc_msgSend(objc_retainAutorelease(v20), "bytes");
    v24 = ptr;
    v25 = (const AudioObjectPropertyAddress *)v19;
    v26 = a4;
    v27 = (const void *)v22;
  }
  else
  {
    v24 = self->mKernelPtr.__ptr_;
    v25 = (const AudioObjectPropertyAddress *)v19;
    v26 = a4;
    v27 = 0;
    v23 = 0;
  }
  ads::Kernel::getPropertyData((ads::Kernel *)buf, (uint64_t)v24, v25, (uint64_t)v26, v27, v23);
  v28 = *(_DWORD *)buf;
  v56 = *(_DWORD *)buf;
  v29 = *(const void **)&buf[8];
  v57 = *(_QWORD *)&buf[8];
  v30 = *(_DWORD *)buf == 0;
  util::server_log(v31);
  v32 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
  if (v30)
  {
    if (v33)
    {
      mSelector = a4->mSelector;
      v36 = bswap32(a4->mSelector);
      *(_DWORD *)&buf[1] = v36;
      if (((char)v36 - 32) > 0x5E
        || (((__int16)v36 >> 8) - 32) > 0x5E
        || ((v36 << 8 >> 24) - 32) > 0x5E
        || ((v36 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v55, mSelector);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v55, buf);
      }
      if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v46 = &v55;
      else
        v46 = (std::string *)v55.__r_.__value_.__r.__words[0];
      mScope = a4->mScope;
      v48 = bswap32(mScope);
      *(_DWORD *)&buf[1] = v48;
      if (((char)v48 - 32) > 0x5E
        || (((__int16)v48 >> 8) - 32) > 0x5E
        || ((v48 << 8 >> 24) - 32) > 0x5E
        || ((v48 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v54, mScope);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v54, buf);
      }
      v49 = &v54;
      if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v49 = (std::string *)v54.__r_.__value_.__r.__words[0];
      mElement = a4->mElement;
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "InCider.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 726;
      v59 = 2080;
      v60 = v46;
      v61 = 2080;
      v62 = v49;
      v63 = 1024;
      *(_DWORD *)v64 = mElement;
      *(_WORD *)&v64[4] = 1024;
      *(_DWORD *)&v64[6] = v19;
      _os_log_impl(&dword_237B88000, v32, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel successfully got property [%s/%s/%u] on device with ID %u", buf, 0x32u);
      if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v54.__r_.__value_.__l.__data_);
      if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v55.__r_.__value_.__l.__data_);
    }

    (*((void (**)(util *, _QWORD, const void *))v13 + 2))(v13, 0, v29);
  }
  else
  {
    if (v33)
    {
      v34 = bswap32(v28);
      *(_DWORD *)&buf[1] = v34;
      if (((char)v34 - 32) > 0x5E
        || (((__int16)v34 >> 8) - 32) > 0x5E
        || ((v34 << 8 >> 24) - 32) > 0x5E
        || ((v34 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v55, v28);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v55, buf);
      }
      if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v37 = &v55;
      else
        v37 = (std::string *)v55.__r_.__value_.__r.__words[0];
      v38 = a4->mSelector;
      v39 = bswap32(a4->mSelector);
      *(_DWORD *)&buf[1] = v39;
      if (((char)v39 - 32) > 0x5E
        || (((__int16)v39 >> 8) - 32) > 0x5E
        || ((v39 << 8 >> 24) - 32) > 0x5E
        || ((v39 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v54, v38);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v54, buf);
      }
      if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v40 = &v54;
      else
        v40 = (std::string *)v54.__r_.__value_.__r.__words[0];
      v41 = a4->mScope;
      v42 = bswap32(v41);
      *(_DWORD *)&buf[1] = v42;
      if (((char)v42 - 32) > 0x5E
        || (((__int16)v42 >> 8) - 32) > 0x5E
        || ((v42 << 8 >> 24) - 32) > 0x5E
        || ((v42 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v53, v41);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v53, buf);
      }
      v43 = &v53;
      if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v43 = (std::string *)v53.__r_.__value_.__r.__words[0];
      v44 = a4->mElement;
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = "InCider.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 737;
      v59 = 2080;
      v60 = v37;
      v61 = 2080;
      v62 = v40;
      v63 = 2080;
      *(_QWORD *)v64 = v43;
      *(_WORD *)&v64[8] = 1024;
      v65 = v44;
      v66 = 1024;
      v67 = v19;
      _os_log_impl(&dword_237B88000, v32, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s getting property [%s/%s/%u] on device with ID %u", buf, 0x3Cu);
      if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v53.__r_.__value_.__l.__data_);
      if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v54.__r_.__value_.__l.__data_);
      if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v55.__r_.__value_.__l.__data_);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ads::Kernel::getPropertyData"), v28, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *, _QWORD))v13 + 2))(v13, v45, 0);

  }
  if (v29)
    CFRelease(v29);

}

- (void)getPropertyData_Arithmetic:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withReply:(id)a5
{
  -[CiderObject getPropertyData_Arithmetic:withInAddress:withInQualifierData:withReply:](self, "getPropertyData_Arithmetic:withInAddress:withInQualifierData:withReply:", a3, a4, 0, a5);
}

- (void)getPropertyData_Array:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withReply:(id)a5
{
  id v8;
  void (**v9)(id, id, id);
  id v10;
  id v11;

  v8 = a3;
  v9 = (void (**)(id, id, id))a5;
  -[CiderObject getPropertyData_NSHelper:withInAddress:withClass:](self, "getPropertyData_NSHelper:withInAddress:withClass:", v8, a4, objc_opt_class());
  v9[2](v9, v10, v11);

}

- (void)getPropertyData_Dict:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withReply:(id)a5
{
  id v8;
  void (**v9)(id, id, id);
  id v10;
  id v11;

  v8 = a3;
  v9 = (void (**)(id, id, id))a5;
  -[CiderObject getPropertyData_NSHelper:withInAddress:withClass:](self, "getPropertyData_NSHelper:withInAddress:withClass:", v8, a4, objc_opt_class());
  v9[2](v9, v10, v11);

}

- (void)getPropertyData_String:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withReply:(id)a5
{
  id v8;
  void (**v9)(id, id, id);
  id v10;
  id v11;

  v8 = a3;
  v9 = (void (**)(id, id, id))a5;
  -[CiderObject getPropertyData_NSHelper:withInAddress:withClass:](self, "getPropertyData_NSHelper:withInAddress:withClass:", v8, a4, objc_opt_class());
  v9[2](v9, v10, v11);

}

- (void)setPropertyDataPrivileged_Arithmetic:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInQualifierData:(id)a5 withInData:(id)a6 withReply:(id)a7
{
  id v13;
  id v14;
  util *v15;
  util *v16;
  NSObject *v17;
  std::string *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  Kernel *ptr;
  int v25;
  uint64_t v26;
  int v27;
  const void *v28;
  ads::Kernel *v29;
  int v30;
  AudioObjectPropertyAddress *v31;
  int v32;
  const void *v33;
  int v34;
  Kernel *v35;
  int v36;
  util *v37;
  signed int v38;
  _BOOL4 v39;
  NSObject *v40;
  _BOOL4 v41;
  int v42;
  AudioObjectPropertySelector mSelector;
  int v44;
  std::string *v45;
  AudioObjectPropertySelector v46;
  int v47;
  std::string *v48;
  AudioObjectPropertyScope v49;
  int v50;
  std::string *v51;
  AudioObjectPropertyElement v52;
  void *v53;
  std::string *v54;
  AudioObjectPropertyScope mScope;
  int v56;
  std::string *v57;
  AudioObjectPropertyElement mElement;
  id v59;
  id v60;
  std::string v61;
  std::string v62;
  std::string v63;
  _BYTE buf[12];
  __int16 v65;
  int v66;
  __int16 v67;
  std::string *v68;
  __int16 v69;
  std::string *v70;
  __int16 v71;
  _BYTE v72[10];
  AudioObjectPropertyElement v73;
  __int16 v74;
  int v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v59 = a5;
  v14 = a6;
  v15 = (util *)a7;
  v16 = v15;
  if (!v13 || !v14 || (v15 = (util *)objc_msgSend(objc_retainAutorelease(v14), "bytes")) == 0)
  {
    util::server_log(v15);
    v17 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v18 = (std::string *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "InCider.mm";
      v65 = 1024;
      v66 = 779;
      v67 = 2112;
      v68 = v18;
      _os_log_impl(&dword_237B88000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Pre-kernel CiderObject encountered nil parameter in method %@", buf, 0x1Cu);

    }
    v19 = (void *)MEMORY[0x24BDD1540];
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 1852797029, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *))v16 + 2))(v16, v21);

  }
  v22 = objc_msgSend(v13, "unsignedIntValue", v59);
  if (v60 && (v23 = objc_retainAutorelease(v60), objc_msgSend(v23, "bytes")))
  {
    ptr = self->mKernelPtr.__ptr_;
    v25 = objc_msgSend(v23, "length");
    v26 = objc_msgSend(objc_retainAutorelease(v23), "bytes");
    v27 = objc_msgSend(v14, "length");
    v28 = (const void *)objc_msgSend(objc_retainAutorelease(v14), "bytes");
    v29 = (ads::Kernel *)ptr;
    v30 = v22;
    v31 = a4;
    v32 = v25;
    v33 = (const void *)v26;
    v34 = v27;
  }
  else
  {
    v35 = self->mKernelPtr.__ptr_;
    v36 = objc_msgSend(v14, "length");
    v28 = (const void *)objc_msgSend(objc_retainAutorelease(v14), "bytes");
    v29 = (ads::Kernel *)v35;
    v30 = v22;
    v31 = a4;
    v32 = 0;
    v33 = 0;
    v34 = v36;
  }
  v37 = (util *)ads::Kernel::setPropertyDataPrivileged(v29, v30, v31, v32, v33, v34, v28);
  v38 = (int)v37;
  v39 = (_DWORD)v37 == 0;
  util::server_log(v37);
  v40 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
  if (v39)
  {
    if (v41)
    {
      mSelector = a4->mSelector;
      v44 = bswap32(a4->mSelector);
      *(_DWORD *)&buf[1] = v44;
      if (((char)v44 - 32) > 0x5E
        || (((__int16)v44 >> 8) - 32) > 0x5E
        || ((v44 << 8 >> 24) - 32) > 0x5E
        || ((v44 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v63, mSelector);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v63, buf);
      }
      if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v54 = &v63;
      else
        v54 = (std::string *)v63.__r_.__value_.__r.__words[0];
      mScope = a4->mScope;
      v56 = bswap32(mScope);
      *(_DWORD *)&buf[1] = v56;
      if (((char)v56 - 32) > 0x5E
        || (((__int16)v56 >> 8) - 32) > 0x5E
        || ((v56 << 8 >> 24) - 32) > 0x5E
        || ((v56 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v62, mScope);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v62, buf);
      }
      v57 = &v62;
      if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v57 = (std::string *)v62.__r_.__value_.__r.__words[0];
      mElement = a4->mElement;
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "InCider.mm";
      v65 = 1024;
      v66 = 809;
      v67 = 2080;
      v68 = v54;
      v69 = 2080;
      v70 = v57;
      v71 = 1024;
      *(_DWORD *)v72 = mElement;
      *(_WORD *)&v72[4] = 1024;
      *(_DWORD *)&v72[6] = v22;
      _os_log_impl(&dword_237B88000, v40, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel successfully set property [%s/%s/%u] on device with ID %u with privilege", buf, 0x32u);
      if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v62.__r_.__value_.__l.__data_);
      if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v63.__r_.__value_.__l.__data_);
    }

    (*((void (**)(util *, _QWORD))v16 + 2))(v16, 0);
  }
  else
  {
    if (v41)
    {
      v42 = bswap32(v38);
      *(_DWORD *)&buf[1] = v42;
      if (((char)v42 - 32) > 0x5E
        || (((__int16)v42 >> 8) - 32) > 0x5E
        || ((v42 << 8 >> 24) - 32) > 0x5E
        || ((v42 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v63, v38);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v63, buf);
      }
      if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v45 = &v63;
      else
        v45 = (std::string *)v63.__r_.__value_.__r.__words[0];
      v46 = a4->mSelector;
      v47 = bswap32(a4->mSelector);
      *(_DWORD *)&buf[1] = v47;
      if (((char)v47 - 32) > 0x5E
        || (((__int16)v47 >> 8) - 32) > 0x5E
        || ((v47 << 8 >> 24) - 32) > 0x5E
        || ((v47 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v62, v46);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v62, buf);
      }
      if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v48 = &v62;
      else
        v48 = (std::string *)v62.__r_.__value_.__r.__words[0];
      v49 = a4->mScope;
      v50 = bswap32(v49);
      *(_DWORD *)&buf[1] = v50;
      if (((char)v50 - 32) > 0x5E
        || (((__int16)v50 >> 8) - 32) > 0x5E
        || ((v50 << 8 >> 24) - 32) > 0x5E
        || ((v50 >> 24) - 32) > 0x5E)
      {
        std::to_string(&v61, v49);
      }
      else
      {
        strcpy(&buf[5], "'");
        buf[0] = 39;
        std::string::basic_string[abi:ne180100]<0>(&v61, buf);
      }
      v51 = &v61;
      if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v51 = (std::string *)v61.__r_.__value_.__r.__words[0];
      v52 = a4->mElement;
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = "InCider.mm";
      v65 = 1024;
      v66 = 820;
      v67 = 2080;
      v68 = v45;
      v69 = 2080;
      v70 = v48;
      v71 = 2080;
      *(_QWORD *)v72 = v51;
      *(_WORD *)&v72[8] = 1024;
      v73 = v52;
      v74 = 1024;
      v75 = v22;
      _os_log_impl(&dword_237B88000, v40, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Kernel encountered error %s setting property [%s/%s/%u] on device with ID %u with privilege", buf, 0x3Cu);
      if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v61.__r_.__value_.__l.__data_);
      if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v62.__r_.__value_.__l.__data_);
      if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v63.__r_.__value_.__l.__data_);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ads::Kernel::setPropertyDataPrivileged"), v38, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(util *, void *))v16 + 2))(v16, v53);

  }
}

- (void)setPropertyDataPrivileged_Arithmetic:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInData:(id)a5 withReply:(id)a6
{
  -[CiderObject setPropertyDataPrivileged_Arithmetic:withInAddress:withInQualifierData:withInData:withReply:](self, "setPropertyDataPrivileged_Arithmetic:withInAddress:withInQualifierData:withInData:withReply:", a3, a4, 0, a5, a6);
}

- (void)setPropertyDataPrivileged_Array:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInData:(id)a5 withReply:(id)a6
{
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a6;
  -[CiderObject setPropertyDataPrivileged_NSHelper:withInAddress:withInData:](self, "setPropertyDataPrivileged_NSHelper:withInAddress:withInData:", a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v10);

}

- (void)setPropertyDataPrivileged_Dict:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInData:(id)a5 withReply:(id)a6
{
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a6;
  -[CiderObject setPropertyDataPrivileged_NSHelper:withInAddress:withInData:](self, "setPropertyDataPrivileged_NSHelper:withInAddress:withInData:", a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v10);

}

- (void)setPropertyDataPrivileged_String:(id)a3 withInAddress:(AudioObjectPropertyAddress *)a4 withInData:(id)a5 withReply:(id)a6
{
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a6;
  -[CiderObject setPropertyDataPrivileged_NSHelper:withInAddress:withInData:](self, "setPropertyDataPrivileged_NSHelper:withInAddress:withInData:", a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v10);

}

- (void)registerForRouteReport:(id)a3
{
  uint64_t (**v4)(_QWORD);
  util *v5;
  RouteSessionAttributes *ptr;
  NSObject *v7;
  const char *v8;
  util *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t (**)(_QWORD))a3;
  v5 = (util *)std::optional<void({block_pointer} {__strong})(NSDictionary *)>::operator=[abi:ne180100]<void({block_pointer} {__strong}&)(NSDictionary *),void>((uint64_t)self->mRouteSessionAttrsPtr.__ptr_ + 8, (uint64_t)v4);
  ptr = self->mRouteSessionAttrsPtr.__ptr_;
  if (*(_QWORD *)ptr)
  {
    if (*((_BYTE *)ptr + 24))
    {
      util::server_log(v5);
      v7 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315394;
        v11 = "InCider.mm";
        v12 = 1024;
        v13 = 868;
        v8 = "%25s:%-5d Stored reply block for same reporter, no route configuration sent";
LABEL_9:
        _os_log_impl(&dword_237B88000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x12u);
      }
    }
    else
    {
      *((_BYTE *)ptr + 24) = 1;
      v9 = (util *)v4[2](v4);
      util::server_log(v9);
      v7 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315394;
        v11 = "InCider.mm";
        v12 = 1024;
        v13 = 865;
        v8 = "%25s:%-5d Stored reply block for new reporter and sent route configuration";
        goto LABEL_9;
      }
    }
  }
  else
  {
    util::server_log(v5);
    v7 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "InCider.mm";
      v12 = 1024;
      v13 = 871;
      v8 = "%25s:%-5d Stored reply block for reporter, no route configuration present";
      goto LABEL_9;
    }
  }

}

- (void)registerForSessionReport:(id)a3
{
  uint64_t (**v4)(_QWORD);
  util *v5;
  RouteSessionAttributes *ptr;
  NSObject *v7;
  const char *v8;
  util *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t (**)(_QWORD))a3;
  v5 = (util *)std::optional<void({block_pointer} {__strong})(NSDictionary *)>::operator=[abi:ne180100]<void({block_pointer} {__strong}&)(NSDictionary *),void>((uint64_t)self->mRouteSessionAttrsPtr.__ptr_ + 40, (uint64_t)v4);
  ptr = self->mRouteSessionAttrsPtr.__ptr_;
  if (*((_QWORD *)ptr + 4))
  {
    if (*((_BYTE *)ptr + 56))
    {
      util::server_log(v5);
      v7 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315394;
        v11 = "InCider.mm";
        v12 = 1024;
        v13 = 888;
        v8 = "%25s:%-5d Stored reply block for same reporter, no session configuration sent";
LABEL_9:
        _os_log_impl(&dword_237B88000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x12u);
      }
    }
    else
    {
      *((_BYTE *)ptr + 56) = 1;
      v9 = (util *)v4[2](v4);
      util::server_log(v9);
      v7 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315394;
        v11 = "InCider.mm";
        v12 = 1024;
        v13 = 885;
        v8 = "%25s:%-5d Stored reply block for new reporter and sent session configuration";
        goto LABEL_9;
      }
    }
  }
  else
  {
    util::server_log(v5);
    v7 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "InCider.mm";
      v12 = 1024;
      v13 = 891;
      v8 = "%25s:%-5d Stored reply block for reporter, no session configuration present";
      goto LABEL_9;
    }
  }

}

- (void).cxx_destruct
{
  std::shared_ptr<RouteSessionAttributes>::~shared_ptr[abi:ne180100]((uint64_t)&self->mRouteSessionAttrsPtr);
  std::shared_ptr<RouteSessionAttributes>::~shared_ptr[abi:ne180100]((uint64_t)&self->mKernelPtr);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
