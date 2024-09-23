@implementation _ACComponentWrapper

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ACComponentWrapper)initWithCoder:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  int v14;
  NSString *v15;
  id v16;
  void *v17;
  __shared_weak_count *v18;
  APComponent *v19;
  unint64_t *v20;
  unint64_t v21;
  __shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  unsigned __int8 v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  __shared_weak_count *v37;
  APComponent *v38;
  unint64_t *v39;
  unint64_t v40;
  __shared_weak_count *cntrl;
  unint64_t *v42;
  unint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  APComponent *ptr;
  _ACComponentWrapper *v48;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  const void *v54;
  APComponent *v55;
  uint64_t v56;
  _BYTE v57[64];
  CFTypeRef v58;
  CFTypeRef v59;
  CFTypeRef v60;
  CFTypeRef cf;
  const void *v62;
  CFTypeRef v63;
  _DWORD v64[3];
  int v65;
  int v66;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("implType"));
  v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("priority"));
  v64[0] = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("type"));
  v64[1] = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("subType"));
  v64[2] = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("manufacturer"));
  v65 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("flags"));
  v66 = 0;
  v7 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("version"));
  {
    v50 = (void *)MEMORY[0x1E0C99E60];
    v51 = objc_opt_class();
    objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    -[_ACComponentWrapper initWithCoder:]::arrayOfString = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    CFRetain(v9);
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v63, v10);

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", -[_ACComponentWrapper initWithCoder:]::arrayOfString, CFSTR("tags"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    CFRetain(v11);
  applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&v62, v12);

  v13 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("wasValidated"));
  v14 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("validationResult"));
  if (v5 == 1)
  {
    {
      v52 = (void *)MEMORY[0x1E0C99E60];
      v53 = objc_opt_class();
      objc_msgSend(v52, "setWithObjects:", v53, objc_opt_class(), 0);
      -[_ACComponentWrapper initWithCoder:]::arrayOfNumber = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundlePath"));
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
      CFRetain(v29);
    applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, v30);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", -[_ACComponentWrapper initWithCoder:]::arrayOfNumber, CFSTR("archs"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
      CFRetain(v31);
    applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&v60, v32);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("factoryFunctionName"));
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
      CFRetain(v33);
    applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v59, v34);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("className"));
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
      CFRetain(v35);
    applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v58, v36);

    AudioComponentRegistrationInfo::AudioComponentRegistrationInfo((uint64_t)v57, (uint64_t)v64, v65, &v63, v7, &v59, &v58, &v62);
    v54 = 0;
    APComponent_FromBundle_Loadable::create_shared((std::__shared_weak_count_vtbl **)&v55, v6, &cf, &v54, &v60, (uint64_t)v57);
    v38 = v55;
    v37 = (__shared_weak_count *)v56;
    if (v56)
    {
      v39 = (unint64_t *)(v56 + 8);
      do
        v40 = __ldxr(v39);
      while (__stxr(v40 + 1, v39));
    }
    cntrl = self->mComponent.__cntrl_;
    self->mComponent.__ptr_ = v38;
    self->mComponent.__cntrl_ = v37;
    if (cntrl)
    {
      v42 = (unint64_t *)((char *)cntrl + 8);
      do
        v43 = __ldaxr(v42);
      while (__stlxr(v43 - 1, v42));
      if (!v43)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
    v44 = (std::__shared_weak_count *)v56;
    if (v56)
    {
      v45 = (unint64_t *)(v56 + 8);
      do
        v46 = __ldaxr(v45);
      while (__stlxr(v46 - 1, v45));
      if (!v46)
      {
        ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
        std::__shared_weak_count::__release_weak(v44);
      }
    }
    AudioComponentRegistrationInfo::~AudioComponentRegistrationInfo((AudioComponentRegistrationInfo *)v57);
    if (v58)
      CFRelease(v58);
    if (v59)
      CFRelease(v59);
    if (v60)
      CFRelease(v60);
    if (cf)
      CFRelease(cf);
  }
  else
  {
    if (v5 != 3)
      __assert_rtn("-[_ACComponentWrapper initWithCoder:]", "AudioComponentVector.mm", 287, "0");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionIdentifier"));
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("factoryFunctionName"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      CFRetain(v16);
    applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, v17);

    v55 = 0;
    AudioComponentRegistrationInfo::AudioComponentRegistrationInfo((uint64_t)v57, (uint64_t)v64, v65, &v63, v7, &cf, (const void **)&v55, &v62);
    APComponent_NSExtension::create_shared((APComponent_NSExtension *)&v55, (const AudioComponentRegistrationInfo *)v57, v15, 0);
    v19 = v55;
    v18 = (__shared_weak_count *)v56;
    if (v56)
    {
      v20 = (unint64_t *)(v56 + 8);
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    v22 = self->mComponent.__cntrl_;
    self->mComponent.__ptr_ = v19;
    self->mComponent.__cntrl_ = v18;
    if (v22)
    {
      v23 = (unint64_t *)((char *)v22 + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)v22 + 16))(v22);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v22);
      }
    }
    v25 = (std::__shared_weak_count *)v56;
    if (v56)
    {
      v26 = (unint64_t *)(v56 + 8);
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
    AudioComponentRegistrationInfo::~AudioComponentRegistrationInfo((AudioComponentRegistrationInfo *)v57);
    if (cf)
      CFRelease(cf);

  }
  if (v13)
  {
    ptr = self->mComponent.__ptr_;
    *((_BYTE *)ptr + 128) = 1;
    *((_DWORD *)ptr + 33) = v14;
  }
  v48 = self;
  if (v62)
    CFRelease(v62);
  if (v63)
    CFRelease(v63);

  return v48;
}

- (void).cxx_destruct
{
  std::shared_ptr<MP4OTISpecificBase>::~shared_ptr[abi:ne180100]((uint64_t)&self->mComponent);
}

- (_ACComponentWrapper)initWithComponent:(void *)a3
{
  std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>::operator=[abi:ne180100](&self->mComponent.__ptr_, *(_QWORD *)a3, *((_QWORD *)a3 + 1));
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  APComponent *ptr;
  const void *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const void *v12;

  v4 = a3;
  ptr = self->mComponent.__ptr_;
  v11 = v4;
  objc_msgSend(v4, "encodeInt:forKey:", *((unsigned int *)ptr + 8), CFSTR("implType"));
  objc_msgSend(v11, "encodeInt:forKey:", *((unsigned int *)ptr + 15), CFSTR("priority"));
  objc_msgSend(v11, "encodeInt32:forKey:", *((unsigned int *)ptr + 9), CFSTR("type"));
  objc_msgSend(v11, "encodeInt32:forKey:", *((unsigned int *)ptr + 10), CFSTR("subType"));
  objc_msgSend(v11, "encodeInt32:forKey:", *((unsigned int *)ptr + 11), CFSTR("manufacturer"));
  objc_msgSend(v11, "encodeInt32:forKey:", *((unsigned int *)ptr + 12), CFSTR("flags"));
  objc_msgSend(v11, "encodeInt32:forKey:", *((unsigned int *)ptr + 14), CFSTR("version"));
  APComponent::name((APComponent *)&v12, *((const void **)ptr + 8));
  v6 = v12;
  objc_msgSend(v11, "encodeObject:forKey:", v12, CFSTR("name"));
  if (v6)
    CFRelease(v6);
  objc_msgSend(v11, "encodeObject:forKey:", *((_QWORD *)ptr + 15), CFSTR("tags"));
  objc_msgSend(v11, "encodeInt:forKey:", *((unsigned __int8 *)ptr + 128), CFSTR("validated"));
  objc_msgSend(v11, "encodeInt:forKey:", *((unsigned int *)ptr + 33), CFSTR("validationResult"));
  v7 = (*(uint64_t (**)(APComponent *))(*(_QWORD *)ptr + 80))(ptr);
  v8 = (_QWORD *)v7;
  if (v7)
  {
    objc_msgSend(v11, "encodeObject:forKey:", *(_QWORD *)(v7 + 160), CFSTR("bundlePath"));
    objc_msgSend(v11, "encodeObject:forKey:", v8[21], CFSTR("archs"));
    objc_msgSend(v11, "encodeObject:forKey:", v8[22], CFSTR("factoryFunctionName"));
    objc_msgSend(v11, "encodeObject:forKey:", v8[23], CFSTR("className"));
  }
  v9 = (*(uint64_t (**)(APComponent *))(*(_QWORD *)ptr + 64))(ptr);
  v10 = v11;
  if (v9)
  {
    objc_msgSend(v11, "encodeObject:forKey:", *(_QWORD *)(v9 + 160), CFSTR("extensionIdentifier"));
    objc_msgSend(v11, "encodeObject:forKey:", *(_QWORD *)(v9 + 192), CFSTR("factoryFunctionName"));
    v10 = v11;
  }

}

@end
