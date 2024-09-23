@implementation _ACPluginDBBundle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ACPluginDBBundle)initWithPath:(id)a3 infoPlistModDate:(double)a4 rsrcModDate:(double)a5
{
  objc_storeStrong((id *)&self->mFullPath, a3);
  self->mInfoPlistModDate = a4;
  self->mRsrcModDate = a5;
  return self;
}

- (_ACPluginDBBundle)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *mFullPath;
  double v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  mFullPath = self->mFullPath;
  self->mFullPath = v5;

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("infoPlistModDate"));
  self->mInfoPlistModDate = v7;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("components"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (&self->mBundleComponentVector != (AudioComponentVector *)(v8 + 8))
      std::vector<std::shared_ptr<APComponent>>::__assign_with_size[abi:ne180100]<std::shared_ptr<APComponent>*,std::shared_ptr<APComponent>*>((uint64_t)&self->mBundleComponentVector, *(uint64_t **)(v8 + 8), *(uint64_t **)(v8 + 16), (uint64_t)(*(_QWORD *)(v8 + 16) - *(_QWORD *)(v8 + 8)) >> 4);
    self->mBundleComponentVector.mSorted = *(_BYTE *)(v8 + 32);
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  _ACComponentVector *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->mFullPath, CFSTR("path"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("infoPlistModDate"), self->mInfoPlistModDate);
  v4 = -[_ACComponentVector initWithVector:]([_ACComponentVector alloc], "initWithVector:", &self->mBundleComponentVector);
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("components"));

}

- (void)loadAllComponents:(void *)a3
{
  AudioComponentVector::append((AudioComponentVector *)a3, (AudioComponentVector *)self->mBundleComponentVector.__begin_, (const AudioComponentVector *)self->mBundleComponentVector.__end_);
}

- (void)scanWithPriority:(int)a3 loadable:(BOOL)a4 infoPlistPath:(id)a5
{
  id v6;
  uint64_t i;
  void *begin;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  os_log_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  const void *v18;
  _QWORD *v19;
  NSObject *v20;
  id v21;
  void *v22;
  const void *v23;
  NSString *v24;
  NSString *v25;
  void *v26;
  id v27;
  void *v28;
  CFTypeRef v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  CFTypeRef v33;
  CFTypeRef v34;
  id v35;
  BOOL v36;
  int v37;
  _ACPluginDBBundle *v38;
  _BYTE v39[24];
  _BYTE *v40;
  _BYTE cf[12];
  __int16 v42;
  int v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v38 = self;
  v37 = a3;
  v36 = a4;
  v6 = a5;
  begin = self->mBundleComponentVector.__begin_;
  for (i = (uint64_t)self->mBundleComponentVector.__end_;
        (void *)i != begin;
  self->mBundleComponentVector.__end_ = begin;
  self->mBundleComponentVector.mSorted = 1;
  v9 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v9, "dictionaryWithContentsOfURL:error:", v10, &v35);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v35;

  if (!v12)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AudioComponents"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
LABEL_37:

      goto LABEL_38;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      CFRetain(v15);
    applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)cf, v16);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v14;
      CFRetain(v17);
      applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&v34, v17);

      v18 = *(const void **)cf;
      *(_QWORD *)cf = v34;
      v34 = v18;
      if (v18)
        CFRelease(v18);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v14, 0);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
          CFRetain(v21);
        applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&v34, v22);

        v23 = *(const void **)cf;
        *(_QWORD *)cf = v34;
        v34 = v23;
        if (v23)
          CFRelease(v23);

      }
    }
    v24 = v38->mFullPath;
    v25 = v24;
    if (v24)
      CFRetain(v24);
    applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v34, v25);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v38->mFullPath);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "executableArchitectures");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
      CFRetain(v27);
    applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&v33, v28);

    v29 = v34;
    v40 = 0;
    v30 = operator new(0x30uLL);
    *v30 = &off_1E2913878;
    v30[1] = &v36;
    v30[2] = &v37;
    v30[3] = &v34;
    v30[4] = &v33;
    v30[5] = &v38;
    v40 = v30;
    AudioComponentRegistrationInfo::parseInfoPlistArray(0, (uint64_t)v29, (CFArrayRef *)cf, (uint64_t)v39);
    v31 = v40;
    if (v40 == v39)
    {
      v32 = 4;
      v31 = v39;
    }
    else
    {
      if (!v40)
      {
LABEL_31:
        if (v33)
          CFRelease(v33);

        if (v34)
          CFRelease(v34);
        if (*(_QWORD *)cf)
          CFRelease(*(CFTypeRef *)cf);
        goto LABEL_37;
      }
      v32 = 5;
    }
    (*(void (**)(void))(*v31 + 8 * v32))();
    goto LABEL_31;
  }
  if (gAudioComponentLogCategory)
  {
    v13 = *(os_log_t *)gAudioComponentLogCategory;
  }
  else
  {
    v19 = (_QWORD *)operator new();
    v19[1] = 0;
    v13 = os_log_create("com.apple.coreaudio", "audiocomp");
    *v19 = v13;
    gAudioComponentLogCategory = (uint64_t)v19;
  }
  v20 = objc_retainAutorelease(v13);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)cf = 136315906;
    *(_QWORD *)&cf[4] = "AudioComponentPluginScanner.mm";
    v42 = 1024;
    v43 = 167;
    v44 = 2112;
    v45 = v6;
    v46 = 2112;
    v47 = v12;
    _os_log_impl(&dword_18EE07000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d Can't read %@ error: %@", cf, 0x26u);
  }
LABEL_38:

}

- (void).cxx_destruct
{
  AudioComponentVector *p_mBundleComponentVector;

  p_mBundleComponentVector = &self->mBundleComponentVector;
  std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_mBundleComponentVector);
  objc_storeStrong((id *)&self->mFullPath, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_BYTE *)self + 56) = 1;
  return self;
}

- (void)scanWithPriority:loadable:infoPlistPath:
{
  const void **v4;
  int v5;
  std::__shared_weak_count *v6;
  int64x2_t *v7;
  BOOL v8;
  const void **v9;
  int v10;
  const void **v11;
  uint64_t v12;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t *p_shared_weak_owners;
  unint64_t v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  const void *v27;
  __int128 v28;

  if (*(_OWORD *)(a2 + 40) == 0)
    return;
  if (**(_BYTE **)(a1 + 8))
  {
    v4 = *(const void ***)(a1 + 24);
    v5 = **(_DWORD **)(a1 + 16);
    v27 = 0;
    APComponent_FromBundle_Loadable::create_shared((std::__shared_weak_count_vtbl **)&v28, v5, v4, &v27, *(const void ***)(a1 + 32), a2);
    v6 = (std::__shared_weak_count *)*((_QWORD *)&v28 + 1);
    v7 = (int64x2_t *)(**(_QWORD **)(a1 + 40) + 32);
    v8 = *((_QWORD *)&v28 + 1) == 0;
    if (!*((_QWORD *)&v28 + 1))
      goto LABEL_21;
    goto LABEL_19;
  }
  v9 = *(const void ***)(a1 + 24);
  v10 = **(_DWORD **)(a1 + 16);
  v11 = *(const void ***)(a1 + 32);
  v12 = operator new();
  APComponent_FromBundle_Base::APComponent_FromBundle_Base(v12, v10, v9, v11, a2);
  v6 = (std::__shared_weak_count *)operator new();
  v6->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2917EF8;
  v6->__shared_weak_owners_ = 0;
  v6[1].__vftable = (std::__shared_weak_count_vtbl *)v12;
  v14 = *(std::__shared_weak_count **)(v12 + 16);
  if (!v14)
  {
    do
      v18 = __ldxr(p_shared_owners);
    while (__stxr(v18 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
    do
      v20 = __ldxr(p_shared_weak_owners);
    while (__stxr(v20 + 1, p_shared_weak_owners));
    *(_QWORD *)(v12 + 8) = v12;
    *(_QWORD *)(v12 + 16) = v6;
    do
LABEL_15:
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
    goto LABEL_18;
  }
  if (v14->__shared_owners_ == -1)
  {
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
    v16 = (unint64_t *)&v6->__shared_weak_owners_;
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
    *(_QWORD *)(v12 + 8) = v12;
    *(_QWORD *)(v12 + 16) = v6;
    std::__shared_weak_count::__release_weak(v14);
    goto LABEL_15;
  }
LABEL_18:
  v8 = 0;
  v7 = (int64x2_t *)(**(_QWORD **)(a1 + 40) + 32);
  *(_QWORD *)&v28 = v12;
  *((_QWORD *)&v28 + 1) = v6;
LABEL_19:
  v22 = (unint64_t *)&v6->__shared_owners_;
  do
    v23 = __ldxr(v22);
  while (__stxr(v23 + 1, v22));
LABEL_21:
  AudioComponentVector::add(v7, &v28);
  if (!v8)
  {
    v24 = (unint64_t *)&v6->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
    do
      v26 = __ldaxr(v24);
    while (__stlxr(v26 - 1, v24));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

- (__n128)scanWithPriority:loadable:infoPlistPath:
{
  __n128 result;
  __int128 v3;

  *(_QWORD *)a2 = &off_1E2913878;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

@end
