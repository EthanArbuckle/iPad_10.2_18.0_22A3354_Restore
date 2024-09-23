@implementation AudioComponentPrefRegConnection

- (AudioComponentPrefRegConnection)initWithRegistrar:(void *)a3 connection:(id)a4
{
  id v6;
  AudioComponentPrefRegConnection *v7;
  AudioComponentPrefRegConnection *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AudioComponentPrefRegConnection;
  v7 = -[AudioComponentPrefRegConnection init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->mImpl = a3;
    objc_storeWeak((id *)&v7->mConnInfo.mConnection, v6);
  }

  return v8;
}

- (void)setExtensionComponentList:(id)a3 linkedSDKRequiresEntitlement:(BOOL)a4 components:(id)a5 reply:(id)a6
{
  AudioComponentRegistrarImpl *mImpl;
  id v10;
  id v11;
  void (**v12)(id, uint64_t);
  int mExtUsePermission;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  id v17;
  id *Extension;
  AudioComponentVector *v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  void *v28;
  id v29;
  NSString *v30;
  AudioComponentVector v31;
  AudioComponentVector v32;
  AudioComponentVector v33;
  AudioComponentVector *v34;
  std::__shared_weak_count *v35;
  void **v36[2];

  self->mConnInfo.mLinkedSDKRequiresEntitlement = a4;
  mImpl = (AudioComponentRegistrarImpl *)self->mImpl;
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, uint64_t))a6;
  mExtUsePermission = self->mConnInfo.mExtUsePermission;
  if (mExtUsePermission == -1)
  {
    mExtUsePermission = ConnectionInfo::_canUseExtensions(&self->mConnInfo);
    self->mConnInfo.mExtUsePermission = mExtUsePermission;
  }
  v14 = 4294900548;
  if (mExtUsePermission == 1)
  {
    v15 = *((_QWORD *)mImpl + 32);
    if (v15)
    {
      memset(&v32, 0, 24);
      v32.mSorted = 1;
      memset(&v31, 0, 24);
      v31.mSorted = 1;
      os_unfair_lock_lock((os_unfair_lock_t)v15);
      v16 = (NSString *)v10;
      v17 = v11;
      Extension = AUExtensionScanner::findExtension((AUExtensionScanner *)(v15 + 8), v16);
      if (*(id **)(v15 + 144) == Extension)
      {
        v14 = 4294900552;
      }
      else
      {
        v29 = v17;
        v30 = v16;
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.audio.ComponentRegistrationOverrides"));
        objc_msgSend(v28, "setObject:forKey:", v17, v16);
        objc_msgSend(v28, "synchronize");
        v19 = (AudioComponentVector *)Extension[2];
        v20 = (std::__shared_weak_count *)Extension[3];
        if (v20)
        {
          p_shared_owners = (unint64_t *)&v20->__shared_owners_;
          do
            v22 = __ldxr(p_shared_owners);
          while (__stxr(v22 + 1, p_shared_owners));
        }
        AUExtensionScanner::componentsForExtension((AUExtensionScanner *)&v34, (NSExtension *)(v15 + 8), *Extension);
        std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>::operator=[abi:ne180100](Extension + 2, (uint64_t)v34, (uint64_t)v35);
        AudioComponentVector::subtract(&v33, v19, v34);
        std::vector<std::shared_ptr<APComponent>>::__vdeallocate(&v31.__begin_);
        v31 = v33;
        memset(&v33, 0, 24);
        v36[0] = (void **)&v33;
        std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100](v36);
        AudioComponentVector::subtract(&v33, v34, v19);
        std::vector<std::shared_ptr<APComponent>>::__vdeallocate(&v32.__begin_);
        v32 = v33;
        memset(&v33, 0, 24);
        v36[0] = (void **)&v33;
        std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100](v36);
        v23 = v35;
        v17 = v29;
        if (v35)
        {
          v24 = (unint64_t *)&v35->__shared_owners_;
          do
            v25 = __ldaxr(v24);
          while (__stlxr(v25 - 1, v24));
          if (!v25)
          {
            ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
            std::__shared_weak_count::__release_weak(v23);
          }
        }
        v16 = v30;
        if (v20)
        {
          v26 = (unint64_t *)&v20->__shared_owners_;
          do
            v27 = __ldaxr(v26);
          while (__stlxr(v27 - 1, v26));
          if (!v27)
          {
            ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
            std::__shared_weak_count::__release_weak(v20);
          }
        }

        v14 = 0;
      }

      os_unfair_lock_unlock((os_unfair_lock_t)v15);
      AudioComponentRegistrarImpl::addRemoveComponents(mImpl, &v32, &v31);
      v33.__begin_ = &v31;
      std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
      v33.__begin_ = &v32;
      std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
    }
    else
    {
      v14 = 4294967292;
    }
  }
  v12[2](v12, v14);

}

- (void)getExtensionComponentList:(id)a3 linkedSDKRequiresEntitlement:(BOOL)a4 reply:(id)a5
{
  os_unfair_lock_t *mImpl;
  void (**v8)(id, void *);
  int mExtUsePermission;
  os_unfair_lock_s *v10;
  void *v11;
  NSString *v12;

  self->mConnInfo.mLinkedSDKRequiresEntitlement = a4;
  mImpl = (os_unfair_lock_t *)self->mImpl;
  v12 = (NSString *)a3;
  v8 = (void (**)(id, void *))a5;
  mExtUsePermission = self->mConnInfo.mExtUsePermission;
  if (mExtUsePermission == -1)
  {
    mExtUsePermission = ConnectionInfo::_canUseExtensions(&self->mConnInfo);
    self->mConnInfo.mExtUsePermission = mExtUsePermission;
  }
  if (mExtUsePermission == 1 && (v10 = mImpl[32]) != 0)
  {
    os_unfair_lock_lock(mImpl[32]);
    AUExtensionScanner::getExtensionComponentList((AUExtensionScanner *)&v10[2], v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v10);
  }
  else
  {
    v11 = 0;
  }
  v8[2](v8, v11);

}

- (void)getComponentUserTags:(id)a3 reply:(id)a4
{
  _BYTE *mImpl;
  NSDictionary *v7;
  NSDictionary *v8;
  id v9;
  void *v10;
  OSType componentType;
  OSType componentSubType;
  OSType componentManufacturer;
  void *v14;
  void *v15;
  void *v16;
  int16x8_t v17;
  int8x8_t v18;
  int8x8_t v19;
  void *v20;
  int16x4_t v21;
  int16x4_t v22;
  void *v23;
  void *v24;
  id v25;
  void (**v26)(id, id);
  unsigned int v27;
  AudioComponentDescription v28;
  unsigned __int32 v29;
  char v30;
  unsigned __int32 v31;
  char v32;
  unsigned __int32 v33;
  char v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v26 = (void (**)(id, id))a4;
  mImpl = self->mImpl;
  v7 = (NSDictionary *)a3;
  v8 = v7;
  if (*mImpl)
  {
    v9 = 0;
  }
  else
  {
    memset(&v28, 0, sizeof(v28));
    v27 = 0;
    dictionaryToComponentDescription(v7, &v28, &v27);
    v10 = (void *)MEMORY[0x1E0CB3940];
    componentType = v28.componentType;
    CAX4CCString::CAX4CCString((CAX4CCString *)&v33, v28.componentType);
    componentSubType = v28.componentSubType;
    CAX4CCString::CAX4CCString((CAX4CCString *)&v31, v28.componentSubType);
    componentManufacturer = v28.componentManufacturer;
    CAX4CCString::CAX4CCString((CAX4CCString *)&v29, v28.componentManufacturer);
    objc_msgSend(v10, "stringWithFormat:", CFSTR("2-%s-%s-%s"), &v33, &v31, &v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.audio.UserComponentTags"));
    objc_msgSend(v15, "synchronize");
    objc_msgSend(v15, "objectForKey:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v16;
    if (v16)
    {
      v9 = v16;
    }
    else
    {
      v17.i32[0] = componentType;
      *(int8x8_t *)v17.i8 = vzip1_s8(*(int8x8_t *)v17.i8, *(int8x8_t *)v17.i8);
      v18.i32[0] = componentSubType;
      v21 = (int16x4_t)vzip1_s8(v18, *(int8x8_t *)v17.i8);
      v19.i32[0] = componentManufacturer;
      v22 = (int16x4_t)vzip1_s8(v19, *(int8x8_t *)v17.i8);
      *(int16x4_t *)v17.i8 = vrev64_s16(*(int16x4_t *)v17.i8);
      v33 = vmovn_s16(v17).u32[0];
      v34 = 0;
      *(int16x4_t *)v17.i8 = vrev64_s16(v21);
      v31 = vmovn_s16(v17).u32[0];
      v32 = 0;
      *(int16x4_t *)v17.i8 = vrev64_s16(v22);
      v29 = vmovn_s16(v17).u32[0];
      v30 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("1-'%s'-'%s'-'%s'-0x%X"), &v33, &v31, &v29, v27);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.audio.ComponentTagHelper"));
      objc_msgSend(v24, "synchronize");
      objc_msgSend(v24, "objectForKey:", v23);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v15, "setObject:forKey:", v9, v14);
        objc_msgSend(v15, "synchronize");
        v25 = v9;
      }

    }
  }

  v26[2](v26, v9);
}

- (void)setComponentUserTags:(id)a3 tags:(id)a4
{
  _BYTE *mImpl;
  NSDictionary *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  AudioComponentDescription v12;
  _BYTE v13[16];
  _BYTE v14[16];
  _BYTE v15[16];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  mImpl = self->mImpl;
  v6 = (NSDictionary *)a3;
  v7 = a4;
  if (!*mImpl)
  {
    memset(&v12, 0, sizeof(v12));
    dictionaryToComponentDescription(v6, &v12, &v11);
    v8 = (void *)MEMORY[0x1E0CB3940];
    CAX4CCString::CAX4CCString((CAX4CCString *)v15, v12.componentType);
    CAX4CCString::CAX4CCString((CAX4CCString *)v14, v12.componentSubType);
    CAX4CCString::CAX4CCString((CAX4CCString *)v13, v12.componentManufacturer);
    objc_msgSend(v8, "stringWithFormat:", CFSTR("2-%s-%s-%s"), v15, v14, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.audio.UserComponentTags"));
    objc_msgSend(v10, "setObject:forKey:", v7, v9);
    objc_msgSend(v10, "synchronize");

  }
}

- (BOOL)isGenericAppIcon:(id)a3 size:(CGSize)a4 scale:(double)a5
{
  double height;
  double width;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  UIImage *v12;
  void *v13;
  char v14;
  _QWORD v16[2];

  height = a4.height;
  width = a4.width;
  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(getISIconClass(), "genericApplicationIcon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc((Class)getISImageDescriptorClass()), "initWithSize:scale:", width, height, a5);
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prepareImagesForImageDescriptors:", v11);

  objc_msgSend(getUIImageClass(), "imageWithCGImage:scale:orientation:", objc_msgSend(v9, "CGImageForDescriptor:", v10), 0, a5);
  v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
  localUIImagePNGRepresentation(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "isEqualToData:", v13);

  return v14;
}

- (void)getExtensionIcon:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id ISImageDescriptorClass;
  id *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  UIImage *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  ISImageDescriptorClass = getISImageDescriptorClass();
  v30 = 0;
  v31 = (uint64_t)&v30;
  v32 = 0x2020000000;
  v9 = (id *)getkISImageDescriptorHomeScreenSymbolLoc(void)::ptr;
  v33 = (void *)getkISImageDescriptorHomeScreenSymbolLoc(void)::ptr;
  if (!getkISImageDescriptorHomeScreenSymbolLoc(void)::ptr)
  {
    v10 = IconServicesLibrary();
    v9 = (id *)dlsym(v10, "kISImageDescriptorHomeScreen");
    *(_QWORD *)(v31 + 24) = v9;
    getkISImageDescriptorHomeScreenSymbolLoc(void)::ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v30, 8);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkISImageDescriptorHomeScreen()");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("AudioComponentRegistrar.mm"), 630, CFSTR("%s"), dlerror(), v30);

    __break(1u);
  }
  v11 = *v9;
  objc_msgSend(ISImageDescriptorClass, "imageDescriptorNamed:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "size");
  v14 = v13;
  v16 = v15;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2050000000;
  v17 = (void *)getUIScreenClass(void)::softClass;
  v38 = getUIScreenClass(void)::softClass;
  if (!getUIScreenClass(void)::softClass)
  {
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = (uint64_t)___ZL16getUIScreenClassv_block_invoke;
    v33 = &unk_1E29222D8;
    v34 = &v35;
    ___ZL16getUIScreenClassv_block_invoke((uint64_t)&v30);
    v17 = (void *)v36[3];
  }
  v18 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v35, 8);
  objc_msgSend(v18, "mainScreen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scale");
  v21 = v20;

  v22 = (void *)objc_msgSend(objc_alloc((Class)getISIconClass()), "initWithBundleIdentifier:", v6);
  v23 = (void *)objc_msgSend(objc_alloc((Class)getISImageDescriptorClass()), "initWithSize:scale:", v14, v16, v21);
  v39[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "prepareImagesForImageDescriptors:", v24);

  objc_msgSend(getUIImageClass(), "imageWithCGImage:scale:orientation:", objc_msgSend(v22, "CGImageForDescriptor:", v23), 0, v21);
  v25 = (UIImage *)objc_claimAutoreleasedReturnValue();
  localUIImagePNGRepresentation(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AudioComponentPrefRegConnection isGenericAppIcon:size:scale:](self, "isGenericAppIcon:size:scale:", v26, v14, v16, v21))
  {
    v27 = 0;
  }
  else
  {
    v27 = v26;
  }
  ((void (**)(id, void *))v7)[2](v7, v27);

}

- (void)getInterAppIcon:(id)a3 reply:(id)a4
{
  void (**v5)(id, void *);
  double v6;
  UIImage *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void (**)(id, void *))a4;
  if (v9)
  {
    objc_msgSend((id)-[objc_class mainScreen](NSClassFromString(CFSTR("UIScreen")), "mainScreen"), "scale");
    v7 = (UIImage *)(id)-[objc_class _applicationIconImageForBundleIdentifier:format:scale:](NSClassFromString(CFSTR("UIImage")), "_applicationIconImageForBundleIdentifier:format:scale:", v9, 2, v6);
    localUIImagePNGRepresentation(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v8);

  }
  v5[2](v5, 0);

}

- (void)copyConfigurationInfoFromCache:(id)a3 reply:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (void (**)(id, void *))a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.audio.AudioComponentCache"));
  objc_msgSend(v6, "dictionaryForKey:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v7);

}

- (void)writeConfigurationInfoToCache:(id)a3 configurationInfo:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.audio.AudioComponentCache"));
  objc_msgSend(v6, "setValue:forKey:", v5, v7);

}

- (void)clearConfigurationInfoCache:(id)a3
{
  __CFString *v3;
  const __CFString *v4;
  CFArrayRef v5;
  const __CFArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.audio.AudioComponentCache");
  if (v3 && -[__CFString length](v3, "length"))
  {
    CFPreferencesSetAppValue(v3, 0, v4);
  }
  else
  {
    v5 = CFPreferencesCopyKeyList(v4, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = v5;
    v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v6);
          CFPreferencesSetAppValue(*(CFStringRef *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 0, v4);
        }
        while (v7 != v9);
        v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
  CFPreferencesAppSynchronize(v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mConnInfo.mConnection);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_DWORD *)self + 6) = -1;
  *((_BYTE *)self + 28) = 0;
  return self;
}

@end
