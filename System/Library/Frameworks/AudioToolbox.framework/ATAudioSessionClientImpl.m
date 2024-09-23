@implementation ATAudioSessionClientImpl

- (ATAudioSessionClientImpl)initWithSession:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  ATAudioSessionClientImpl *v7;
  ATAudioSessionClientImpl *v8;
  CFRunLoopRef Main;
  __CFRunLoop *v10;
  __CFRunLoop *mCFObject;
  const void *v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t value;
  ATAudioSessionPropertyManager *v16;
  ATAudioSessionPropertyManager *propertyManager;
  ATAudioSessionClientImpl *v18;
  objc_super v20;
  _BYTE buf[12];
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kAudioSessionClientLogSubsystem)
  {
    v5 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "ATAudioSessionClientImpl.mm";
    v22 = 1024;
    v23 = 136;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d initWithSession", buf, 0x12u);
  }

LABEL_8:
  v20.receiver = self;
  v20.super_class = (Class)ATAudioSessionClientImpl;
  v7 = -[ATAudioSessionClientImpl init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_weakSession, v4);
    v8->_isConfigured = 0;
    v8->_clientUserData = 0;
    Main = CFRunLoopGetMain();
    v10 = Main;
    if (Main)
      CFRetain(Main);
    mCFObject = v8->_clientRunLoop.mCFObject;
    v8->_clientRunLoop.mCFObject = v10;
    if (mCFObject)
      CFRelease(mCFObject);
    v12 = (const void *)*MEMORY[0x1E0C9B280];
    if (*MEMORY[0x1E0C9B280])
      CFRetain((CFTypeRef)*MEMORY[0x1E0C9B280]);
    applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)buf, v12);
    v13 = v8->_clientRunLoopMode.mObject.mCFObject;
    v8->_clientRunLoopMode.mObject.mCFObject = *(__CFString **)buf;
    *(_QWORD *)buf = v13;
    if (v13)
      CFRelease(v13);
    v8->_clientInterruptionListenerProc = 0;
    v8->_interruptionType = 0;
    v14 = operator new();
    *(_QWORD *)v14 = 0;
    *(_QWORD *)(v14 + 8) = 0;
    *(_DWORD *)(v14 + 24) = 0;
    *(_QWORD *)(v14 + 16) = 0;
    value = (uint64_t)v8->_propertyListeners.__ptr_.__value_;
    v8->_propertyListeners.__ptr_.__value_ = (AudioSessionPropertyListeners *)v14;
    if (value)
      std::default_delete<AudioSessionPropertyListeners>::operator()[abi:ne180100](value);
    v16 = -[ATAudioSessionPropertyManager initWithATAudioSessionClientImpl:]([ATAudioSessionPropertyManager alloc], "initWithATAudioSessionClientImpl:", v8);
    propertyManager = v8->_propertyManager;
    v8->_propertyManager = v16;

    v18 = v8;
  }

  return v8;
}

- (ATAudioSessionClientImpl)initWithStrongSession:(id)a3
{
  id v5;
  ATAudioSessionClientImpl *v6;
  ATAudioSessionClientImpl *v7;

  v5 = a3;
  v6 = -[ATAudioSessionClientImpl initWithSession:](self, "initWithSession:", v5);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_strongSession, a3);

  return v7;
}

- (BOOL)isValid
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_weakSession);
  v3 = WeakRetained != 0;

  return v3;
}

- (int)setClientConfiguration:(__CFRunLoop *)a3 runLoopMode:(__CFString *)a4 listenerProc:(void *)a5 userData:(void *)a6
{
  NSObject *v11;
  id v12;
  int v13;
  id WeakRetained;
  __CFRunLoop *mCFObject;
  __CFString *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  _BYTE buf[12];
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (kAudioSessionClientLogSubsystem)
  {
    v11 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v11)
      goto LABEL_8;
  }
  else
  {
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "ATAudioSessionClientImpl.mm";
    v25 = 1024;
    v26 = 172;
    _os_log_impl(&dword_1A0F4D000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setClientConfiguration", buf, 0x12u);
  }

LABEL_8:
  if (!self->_isConfigured)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_weakSession);
    if (!WeakRetained)
    {
      v13 = 2003329396;
      if (kAudioSessionClientLogSubsystem)
      {
        v17 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v17)
        {
LABEL_41:

          return v13;
        }
      }
      else
      {
        v17 = MEMORY[0x1E0C81028];
        v19 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "ATAudioSessionClientImpl.mm";
        v25 = 1024;
        v26 = 228;
        _os_log_impl(&dword_1A0F4D000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create AVAudioSession shared instance.", buf, 0x12u);
      }

      goto LABEL_41;
    }
    if (a3)
    {
      CFRetain(a3);
      mCFObject = self->_clientRunLoop.mCFObject;
      self->_clientRunLoop.mCFObject = a3;
      if (mCFObject)
        CFRelease(mCFObject);
    }
    if (a4)
    {
      CFRetain(a4);
      applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)buf, a4);
      v16 = self->_clientRunLoopMode.mObject.mCFObject;
      self->_clientRunLoopMode.mObject.mCFObject = *(__CFString **)buf;
      *(_QWORD *)buf = v16;
      if (v16)
        CFRelease(v16);
    }
    if (a5)
    {
      self->_clientInterruptionListenerProc = a5;
LABEL_33:
      if (a6)
        self->_clientUserData = a6;
      -[ATAudioSessionClientImpl setInterruptionType:](self, "setInterruptionType:", 0);
      if (UseNewNotifications(void)::once != -1)
        dispatch_once(&UseNewNotifications(void)::once, &__block_literal_global_139);
      if (UseNewNotifications(void)::sUseNewNotifications)
      {
        objc_initWeak((id *)buf, self);
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __85__ATAudioSessionClientImpl_setClientConfiguration_runLoopMode_listenerProc_userData___block_invoke;
        v22[3] = &unk_1E4509230;
        objc_copyWeak(&v23, (id *)buf);
        -[ATAudioSessionClientImpl addNSNotificationListenerFor:session:block:](self, "addNSNotificationListenerFor:session:block:", *MEMORY[0x1E0CFF000], WeakRetained, v22);
        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        -[ATAudioSessionClientImpl addNSNotificationListenerFor:session:selector:](self, "addNSNotificationListenerFor:session:selector:", *MEMORY[0x1E0CFF000], WeakRetained, sel_handleInterruption_);
      }
      v13 = 0;
      self->_isConfigured = 1;
      goto LABEL_41;
    }
    if (kAudioSessionClientLogSubsystem)
    {
      v18 = *(id *)kAudioSessionClientLogSubsystem;
      if (!v18)
        goto LABEL_33;
    }
    else
    {
      v18 = MEMORY[0x1E0C81028];
      v20 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "ATAudioSessionClientImpl.mm";
      v25 = 1024;
      v26 = 193;
      _os_log_impl(&dword_1A0F4D000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d No Interruption listener provided", buf, 0x12u);
    }

    goto LABEL_33;
  }
  return 1768843636;
}

- (int)resetClientConfiguration
{
  CFRunLoopRef Main;
  __CFRunLoop *v4;
  __CFRunLoop *mCFObject;
  const void *v6;
  const void *v7;
  AudioSessionPropertyListeners *v8;
  AudioSessionPropertyListeners *value;
  CADeprecated::CAMutex *StateMutex;
  int v11;
  __CFString *v13;

  self->_isConfigured = 0;
  self->_clientUserData = 0;
  self->_interruptionType = 0;
  Main = CFRunLoopGetMain();
  v4 = Main;
  if (Main)
    CFRetain(Main);
  mCFObject = self->_clientRunLoop.mCFObject;
  self->_clientRunLoop.mCFObject = v4;
  if (mCFObject)
    CFRelease(mCFObject);
  v6 = (const void *)*MEMORY[0x1E0C9B280];
  if (*MEMORY[0x1E0C9B280])
  {
    CFRetain((CFTypeRef)*MEMORY[0x1E0C9B280]);
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v13, v7);
  v8 = (AudioSessionPropertyListeners *)self->_clientRunLoopMode.mObject.mCFObject;
  self->_clientRunLoopMode.mObject.mCFObject = v13;
  v13 = (__CFString *)v8;
  if (v8)
    CFRelease(v8);
  self->_clientInterruptionListenerProc = 0;
  value = self->_propertyListeners.__ptr_.__value_;
  StateMutex = AudioSessionPropertyListeners::GetStateMutex(v8);
  v11 = (*(uint64_t (**)(CADeprecated::CAMutex *))(*(_QWORD *)StateMutex + 16))(StateMutex);
  AudioSessionPropertyListeners::RemovePropertyListenersForAllPropertiesImp(value);
  if (v11)
    (*(void (**)(CADeprecated::CAMutex *))(*(_QWORD *)StateMutex + 24))(StateMutex);
  return 0;
}

- (AVAudioSession)avas
{
  return (AVAudioSession *)objc_loadWeakRetained((id *)&self->_weakSession);
}

- (int)AudioSessionSetActiveImpl:(unsigned __int8)a3 flags:(unsigned int)a4
{
  int v5;
  NSObject *v7;
  id v8;
  id WeakRetained;
  void *v10;
  char v11;
  id v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  const __CFString *v17;
  id v18;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v5 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (kAudioSessionClientLogSubsystem)
  {
    v7 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "ATAudioSessionClientImpl.mm";
    v23 = 1024;
    v24 = 260;
    _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d AudioSessionSetActiveImpl", buf, 0x12u);
  }

LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakSession);
  v10 = WeakRetained;
  if (WeakRetained)
  {
    v20 = 0;
    v11 = objc_msgSend(WeakRetained, "setActive:withOptions:error:", v5 == 1, a4, &v20);
    v12 = v20;
    v13 = v12;
    if ((v11 & 1) != 0)
    {
      if (kAudioSessionClientLogSubsystem)
      {
        v14 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v14)
        {
          v15 = 0;
LABEL_30:

          goto LABEL_31;
        }
      }
      else
      {
        v14 = MEMORY[0x1E0C81028];
        v16 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v17 = CFSTR("Activated");
        v22 = "ATAudioSessionClientImpl.mm";
        *(_DWORD *)buf = 136315650;
        if (!v5)
          v17 = CFSTR("Deactivated");
        v23 = 1024;
        v24 = 285;
        v25 = 2112;
        v26 = v17;
        _os_log_impl(&dword_1A0F4D000, v14, OS_LOG_TYPE_INFO, "%25s:%-5d Session %@ !", buf, 0x1Cu);
      }
      v15 = 0;
    }
    else
    {
      v15 = 2003329396;
      if (v12 && objc_msgSend(v12, "code"))
        v15 = objc_msgSend(v13, "code");
      if (kAudioSessionClientLogSubsystem)
      {
        v14 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v14)
          goto LABEL_30;
      }
      else
      {
        v14 = MEMORY[0x1E0C81028];
        v18 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v22 = "ATAudioSessionClientImpl.mm";
        v23 = 1024;
        v24 = 281;
        v25 = 1024;
        LODWORD(v26) = v15;
        _os_log_impl(&dword_1A0F4D000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d activation failed. status = %d", buf, 0x18u);
      }
    }

    goto LABEL_30;
  }
  v15 = 560557673;
LABEL_31:

  return v15;
}

- (int)AudioSessionGetPropertyImpl:(unsigned int)a3 size:(unsigned int *)a4 data:(void *)a5
{
  uint64_t v7;
  NSObject *v9;
  int v10;
  id v11;
  NSObject *v12;
  id v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v7 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  if (!kAudioSessionClientLogSubsystem)
  {
    v9 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
LABEL_6:
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v15 = 136315394;
      v16 = "ATAudioSessionClientImpl.mm";
      v17 = 1024;
      v18 = 295;
      _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVAudioSessionGetProperty", (uint8_t *)&v15, 0x12u);
    }

    if (a5)
      return -[ATAudioSessionPropertyManager GetProperty:size:data:](self->_propertyManager, "GetProperty:size:data:", v7, a4, a5);
    goto LABEL_9;
  }
  v9 = *(id *)kAudioSessionClientLogSubsystem;
  if (v9)
    goto LABEL_6;
  if (a5)
    return -[ATAudioSessionPropertyManager GetProperty:size:data:](self->_propertyManager, "GetProperty:size:data:", v7, a4, a5);
LABEL_9:
  v10 = 2003329396;
  if (kAudioSessionClientLogSubsystem)
  {
    v12 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v12)
      return v10;
  }
  else
  {
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v15 = 136315394;
    v16 = "ATAudioSessionClientImpl.mm";
    v17 = 1024;
    v18 = 299;
    _os_log_impl(&dword_1A0F4D000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid data", (uint8_t *)&v15, 0x12u);
  }

  return v10;
}

- (int)AudioSessionSetPropertyImpl:(unsigned int)a3 size:(unsigned int)a4 data:(const void *)a5
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v9;
  int v10;
  id v11;
  NSObject *v12;
  id v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  if (!kAudioSessionClientLogSubsystem)
  {
    v9 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
LABEL_6:
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v15 = 136315394;
      v16 = "ATAudioSessionClientImpl.mm";
      v17 = 1024;
      v18 = 310;
      _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVAudioSessionSetProperty", (uint8_t *)&v15, 0x12u);
    }

    if (a5)
      return -[ATAudioSessionPropertyManager SetProperty:size:data:](self->_propertyManager, "SetProperty:size:data:", v7, v6, a5);
    goto LABEL_9;
  }
  v9 = *(id *)kAudioSessionClientLogSubsystem;
  if (v9)
    goto LABEL_6;
  if (a5)
    return -[ATAudioSessionPropertyManager SetProperty:size:data:](self->_propertyManager, "SetProperty:size:data:", v7, v6, a5);
LABEL_9:
  v10 = 2003329396;
  if (kAudioSessionClientLogSubsystem)
  {
    v12 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v12)
      return v10;
  }
  else
  {
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v15 = 136315394;
    v16 = "ATAudioSessionClientImpl.mm";
    v17 = 1024;
    v18 = 313;
    _os_log_impl(&dword_1A0F4D000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid data input", (uint8_t *)&v15, 0x12u);
  }

  return v10;
}

- (int)AudioSessionGetPropertySizeImpl:(unsigned int)a3 size:(unsigned int *)a4
{
  NSObject *v6;
  id v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (kAudioSessionClientLogSubsystem)
  {
    v6 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315394;
    v10 = "ATAudioSessionClientImpl.mm";
    v11 = 1024;
    v12 = 322;
    _os_log_impl(&dword_1A0F4D000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d AudioSessionGetPropertySizeImpl", (uint8_t *)&v9, 0x12u);
  }

LABEL_8:
  asPropertyInfo::GetPropertyInfo((char *)&v9, a3);
  *a4 = v10;
  return 0;
}

- (int)AudioSessionAddPropertyListenerImpl:(unsigned int)a3 userProc:(void *)a4 userData:(void *)a5
{
  uint64_t v7;
  NSObject *v9;
  id v10;
  id WeakRetained;
  char *PropertyInfo;
  int v13;
  NSObject *v14;
  NSObject *v15;
  AudioSessionPropertyListeners *value;
  CADeprecated::CAMutex *StateMutex;
  int v18;
  uint64_t v19;
  id *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  char **v28;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _BYTE location[12];
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v7 = *(_QWORD *)&a3;
  v47 = *MEMORY[0x1E0C80C00];
  if (kAudioSessionClientLogSubsystem)
  {
    v9 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "ATAudioSessionClientImpl.mm";
    v45 = 1024;
    v46 = 333;
    _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVAudioSessionAddPropertyListener", buf, 0x12u);
  }

LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakSession);
  if (!WeakRetained)
  {
    v13 = 560557673;
    if (kAudioSessionClientLogSubsystem)
    {
      v15 = *(id *)kAudioSessionClientLogSubsystem;
      if (!v15)
        goto LABEL_64;
    }
    else
    {
      v15 = MEMORY[0x1E0C81028];
      v21 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "ATAudioSessionClientImpl.mm";
      v45 = 1024;
      v46 = 339;
      _os_log_impl(&dword_1A0F4D000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: session no longer valid", buf, 0x12u);
    }

    goto LABEL_64;
  }
  PropertyInfo = asPropertyInfo::GetPropertyInfo((char *)buf, v7);
  if ((buf[0] & 1) != 0)
  {
    if (a4)
    {
      value = self->_propertyListeners.__ptr_.__value_;
      if (value)
      {
        StateMutex = AudioSessionPropertyListeners::GetStateMutex((AudioSessionPropertyListeners *)PropertyInfo);
        v18 = (*(uint64_t (**)(CADeprecated::CAMutex *))(*(_QWORD *)StateMutex + 16))(StateMutex);
        AudioSessionPropertyListeners::AddPropertyListenerImp(value, v7, (void (*)(void *, unsigned int, unsigned int, const void *))a4, (void (*)(void *, unsigned int, unsigned int, const void *))a5);
        if (v18)
          (*(void (**)(CADeprecated::CAMutex *))(*(_QWORD *)StateMutex + 24))(StateMutex);
        objc_initWeak((id *)location, self);
        switch((_DWORD)v7)
        {
          case 0x64696564:
            if (UseNewNotifications(void)::once != -1)
              dispatch_once(&UseNewNotifications(void)::once, &__block_literal_global_139);
            v25 = *MEMORY[0x1E0CFF060];
            if (UseNewNotifications(void)::sUseNewNotifications)
            {
              v26 = MEMORY[0x1E0C809B0];
              v32[0] = MEMORY[0x1E0C809B0];
              v32[1] = 3221225472;
              v32[2] = __82__ATAudioSessionClientImpl_AudioSessionAddPropertyListenerImpl_userProc_userData___block_invoke_3;
              v32[3] = &unk_1E4509230;
              v20 = &v33;
              objc_copyWeak(&v33, (id *)location);
              -[ATAudioSessionClientImpl addNSNotificationListenerFor:session:block:](self, "addNSNotificationListenerFor:session:block:", v25, WeakRetained, v32);
              v30[0] = v26;
              v30[1] = 3221225472;
              v30[2] = __82__ATAudioSessionClientImpl_AudioSessionAddPropertyListenerImpl_userProc_userData___block_invoke_4;
              v30[3] = &unk_1E4509230;
              objc_copyWeak(&v31, (id *)location);
              -[ATAudioSessionClientImpl addNSNotificationListenerFor:session:block:](self, "addNSNotificationListenerFor:session:block:", *MEMORY[0x1E0CFF068], WeakRetained, v30);
              objc_destroyWeak(&v31);
              goto LABEL_53;
            }
            -[ATAudioSessionClientImpl addNSNotificationListenerFor:session:selector:](self, "addNSNotificationListenerFor:session:selector:", v25, WeakRetained, sel_handleServerDeath_);
            v19 = *MEMORY[0x1E0CFF068];
            v28 = &selRef_handleServerReset_;
            break;
          case 0x696E7472:
            if (UseNewNotifications(void)::once != -1)
              dispatch_once(&UseNewNotifications(void)::once, &__block_literal_global_139);
            v19 = *MEMORY[0x1E0CFF000];
            if (UseNewNotifications(void)::sUseNewNotifications)
            {
              v34[0] = MEMORY[0x1E0C809B0];
              v34[1] = 3221225472;
              v34[2] = __82__ATAudioSessionClientImpl_AudioSessionAddPropertyListenerImpl_userProc_userData___block_invoke_2;
              v34[3] = &unk_1E4509230;
              v20 = &v35;
              objc_copyWeak(&v35, (id *)location);
              -[ATAudioSessionClientImpl addNSNotificationListenerFor:session:block:](self, "addNSNotificationListenerFor:session:block:", v19, WeakRetained, v34);
              goto LABEL_53;
            }
            v28 = &selRef_handleInterruption_;
            break;
          case 0x726F6368:
            if (UseNewNotifications(void)::once != -1)
              dispatch_once(&UseNewNotifications(void)::once, &__block_literal_global_139);
            v19 = *MEMORY[0x1E0CFF180];
            if (UseNewNotifications(void)::sUseNewNotifications)
            {
              v36[0] = MEMORY[0x1E0C809B0];
              v36[1] = 3221225472;
              v36[2] = __82__ATAudioSessionClientImpl_AudioSessionAddPropertyListenerImpl_userProc_userData___block_invoke;
              v36[3] = &unk_1E4509230;
              v20 = &v37;
              objc_copyWeak(&v37, (id *)location);
              -[ATAudioSessionClientImpl addNSNotificationListenerFor:session:block:](self, "addNSNotificationListenerFor:session:block:", v19, WeakRetained, v36);
LABEL_53:
              objc_destroyWeak(v20);
LABEL_63:
              objc_destroyWeak((id *)location);
              v13 = 0;
              goto LABEL_64;
            }
            v28 = &selRef_handleRouteChange_;
            break;
          default:
            -[ATAudioSessionClientImpl addAVAudioSessionKVOObservers:session:](self, "addAVAudioSessionKVOObservers:session:", v7, WeakRetained);
            goto LABEL_63;
        }
        -[ATAudioSessionClientImpl addNSNotificationListenerFor:session:selector:](self, "addNSNotificationListenerFor:session:selector:", v19, WeakRetained, *v28);
        goto LABEL_63;
      }
      v13 = 2003329396;
      if (kAudioSessionClientLogSubsystem)
      {
        v23 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v23)
          goto LABEL_64;
      }
      else
      {
        v23 = MEMORY[0x1E0C81028];
        v27 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136315394;
        *(_QWORD *)&location[4] = "ATAudioSessionClientImpl.mm";
        v39 = 1024;
        v40 = 359;
        _os_log_impl(&dword_1A0F4D000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Failed: 'propertyListener' is invalid", location, 0x12u);
      }
    }
    else
    {
      v13 = 2003329396;
      if (kAudioSessionClientLogSubsystem)
      {
        v23 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v23)
          goto LABEL_64;
      }
      else
      {
        v23 = MEMORY[0x1E0C81028];
        v24 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136315394;
        *(_QWORD *)&location[4] = "ATAudioSessionClientImpl.mm";
        v39 = 1024;
        v40 = 353;
        _os_log_impl(&dword_1A0F4D000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Failed: nil client proc", location, 0x12u);
      }
    }

    goto LABEL_64;
  }
  v13 = 2003329396;
  if (kAudioSessionClientLogSubsystem)
  {
    v14 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v14)
      goto LABEL_64;
  }
  else
  {
    v14 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)location = 136315650;
    *(_QWORD *)&location[4] = "ATAudioSessionClientImpl.mm";
    v39 = 1024;
    v40 = 347;
    v41 = 1024;
    v42 = v7;
    _os_log_impl(&dword_1A0F4D000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Failed: property %d does not support listening", location, 0x18u);
  }

LABEL_64:
  return v13;
}

- (int)AudioSessionRemovePropertyListenerImpl:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  id v6;
  char *PropertyInfo;
  int v8;
  NSObject *v9;
  AudioSessionPropertyListeners *value;
  CADeprecated::CAMutex *StateMutex;
  int v12;
  id v13;
  NSObject *v14;
  id v15;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v3 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (kAudioSessionClientLogSubsystem)
  {
    v5 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "ATAudioSessionClientImpl.mm";
    v25 = 1024;
    v26 = 449;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVAudioSessionRemovePropertyListener", buf, 0x12u);
  }

LABEL_8:
  PropertyInfo = asPropertyInfo::GetPropertyInfo((char *)buf, v3);
  if ((buf[0] & 1) != 0)
  {
    value = self->_propertyListeners.__ptr_.__value_;
    if (value)
    {
      StateMutex = AudioSessionPropertyListeners::GetStateMutex((AudioSessionPropertyListeners *)PropertyInfo);
      v12 = (*(uint64_t (**)(CADeprecated::CAMutex *))(*(_QWORD *)StateMutex + 16))(StateMutex);
      AudioSessionPropertyListeners::RemoveAllPropertyListenersImp(value, v3);
      if (v12)
        (*(void (**)(CADeprecated::CAMutex *))(*(_QWORD *)StateMutex + 24))(StateMutex);
      v8 = 0;
      if ((_DWORD)v3 != 1684628836 && (_DWORD)v3 != 1768846450 && (_DWORD)v3 != 1919902568)
      {
        -[ATAudioSessionClientImpl removeAVAudioSessionKVOObservers:](self, "removeAVAudioSessionKVOObservers:", v3);
        return 0;
      }
    }
    else
    {
      v8 = 2003329396;
      if (kAudioSessionClientLogSubsystem)
      {
        v14 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v14)
          return v8;
      }
      else
      {
        v14 = MEMORY[0x1E0C81028];
        v15 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v17 = 136315394;
        v18 = "ATAudioSessionClientImpl.mm";
        v19 = 1024;
        v20 = 463;
        _os_log_impl(&dword_1A0F4D000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Failed: 'propertyListener' is invalid", (uint8_t *)&v17, 0x12u);
      }

    }
  }
  else
  {
    v8 = 2003329396;
    if (kAudioSessionClientLogSubsystem)
    {
      v9 = *(id *)kAudioSessionClientLogSubsystem;
      if (!v9)
        return v8;
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315650;
      v18 = "ATAudioSessionClientImpl.mm";
      v19 = 1024;
      v20 = 457;
      v21 = 1024;
      v22 = v3;
      _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Failed: property %d does not support listening", (uint8_t *)&v17, 0x18u);
    }

  }
  return v8;
}

- (int)AudioSessionRemovePropertyListenerWithUserDataImpl:(unsigned int)a3 userProc:(void *)a4 userData:(void *)a5
{
  uint64_t v7;
  NSObject *v9;
  id v10;
  char *PropertyInfo;
  int v12;
  NSObject *v13;
  AudioSessionPropertyListeners *value;
  CADeprecated::CAMutex *StateMutex;
  int v16;
  AudioSessionPropertyListeners *v17;
  id v18;
  AudioSessionPropertyListeners *v19;
  CADeprecated::CAMutex *v20;
  int v21;
  int *v22;
  int *v23;
  int v24;
  int v25;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v7 = *(_QWORD *)&a3;
  v37 = *MEMORY[0x1E0C80C00];
  if (kAudioSessionClientLogSubsystem)
  {
    v9 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "ATAudioSessionClientImpl.mm";
    v35 = 1024;
    v36 = 491;
    _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVAudioSessionRemovePropertyListenerWithUserData", buf, 0x12u);
  }

LABEL_8:
  PropertyInfo = asPropertyInfo::GetPropertyInfo((char *)buf, v7);
  if ((buf[0] & 1) != 0)
  {
    value = self->_propertyListeners.__ptr_.__value_;
    StateMutex = AudioSessionPropertyListeners::GetStateMutex((AudioSessionPropertyListeners *)PropertyInfo);
    v16 = (*(uint64_t (**)(CADeprecated::CAMutex *))(*(_QWORD *)StateMutex + 16))(StateMutex);
    if ((_DWORD)v7 == -1)
    {
      v17 = AudioSessionPropertyListeners::RemovePropertyListenersForAllPropertiesImp(value);
      if (!v16)
      {
LABEL_21:
        v12 = 0;
        if ((_DWORD)v7 == 1684628836 || (_DWORD)v7 == 1768846450 || (_DWORD)v7 == 1919902568)
          return v12;
        v19 = self->_propertyListeners.__ptr_.__value_;
        v20 = AudioSessionPropertyListeners::GetStateMutex(v17);
        v21 = (*(uint64_t (**)(CADeprecated::CAMutex *))(*(_QWORD *)v20 + 16))(v20);
        v22 = *(int **)v19;
        v23 = (int *)*((_QWORD *)v19 + 1);
        if (*(int **)v19 == v23)
        {
          v24 = 0;
          if (!v21)
          {
LABEL_33:
            if (!v24)
              -[ATAudioSessionClientImpl removeAVAudioSessionKVOObservers:](self, "removeAVAudioSessionKVOObservers:", v7);
            return 0;
          }
        }
        else
        {
          v24 = 0;
          do
          {
            v25 = *v22;
            v22 += 6;
            if (v25 == (_DWORD)v7)
              ++v24;
          }
          while (v22 != v23);
          if (!v21)
            goto LABEL_33;
        }
        (*(void (**)(CADeprecated::CAMutex *))(*(_QWORD *)v20 + 24))(v20);
        goto LABEL_33;
      }
    }
    else
    {
      v17 = AudioSessionPropertyListeners::RemovePropertyListenerImp(value, v7, (void (*)(void *, unsigned int, unsigned int, const void *))a4, a5);
      if (!v16)
        goto LABEL_21;
    }
    v17 = (AudioSessionPropertyListeners *)(*(uint64_t (**)(CADeprecated::CAMutex *))(*(_QWORD *)StateMutex
                                                                                              + 24))(StateMutex);
    goto LABEL_21;
  }
  v12 = 2003329396;
  if (kAudioSessionClientLogSubsystem)
  {
    v13 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v13)
      return v12;
  }
  else
  {
    v13 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v27 = 136315650;
    v28 = "ATAudioSessionClientImpl.mm";
    v29 = 1024;
    v30 = 499;
    v31 = 1024;
    v32 = v7;
    _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Failed: property %d does not support listening", (uint8_t *)&v27, 0x18u);
  }

  return v12;
}

- (void)addNSNotificationListenerFor:(id)a3 session:(id)a4 selector:(SEL)a5
{
  id v8;
  id v9;
  id v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<OldNotificationCenterObserver>>, void *>>> *left;
  uint64_t **p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<OldNotificationCenterObserver>>, void *>>> *v13;
  char v14;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<OldNotificationCenterObserver>>, void *>>> **v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  ATAudioSessionClientImpl *v18;
  id v19;
  id v20;
  ATAudioSessionClientImpl *v21;
  id v22;
  id v23;
  void *v24;
  unint64_t v25;
  uint64_t *v26;
  uint64_t **v27;
  uint64_t **v28;
  _QWORD *v29;
  char *v30;
  std::string *v31;
  void *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  id v38;
  std::string v39;
  __int128 v40;
  std::__shared_weak_count *v41;
  std::__shared_weak_count *v42;
  std::string __p;
  _QWORD v44[2];
  char v45;

  v8 = a3;
  v9 = a4;
  v10 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v10, "UTF8String"));
  p_pair1 = (uint64_t **)&self->_oldNotificationCenterObservers.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<OldNotificationCenterObserver>>, void *>>> *)self->_oldNotificationCenterObservers.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_11;
  v13 = &self->_oldNotificationCenterObservers.__tree_.__pair1_;
  do
  {
    v14 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&left[4].__value_.__left_, &__p);
    if (v14 >= 0)
      v15 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<OldNotificationCenterObserver>>, void *>>> **)left;
    else
      v15 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<OldNotificationCenterObserver>>, void *>>> **)&left[1];
    if (v14 >= 0)
      v13 = left;
    left = *v15;
  }
  while (*v15);
  if (v13 == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<OldNotificationCenterObserver>>, void *>>> *)p_pair1
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, &v13[4].__value_.__left_) & 0x80) != 0)
  {
LABEL_11:
    v38 = v9;
    v16 = (std::__shared_weak_count *)operator new(0x30uLL);
    v16->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    v16->__shared_weak_owners_ = 0;
    v16->__vftable = (std::__shared_weak_count_vtbl *)&off_1E45092D0;
    v18 = self;
    v19 = v10;
    v20 = v9;
    v21 = v18;
    v16[1].__vftable = (std::__shared_weak_count_vtbl *)v21;
    v22 = v19;
    v16[1].__shared_owners_ = (uint64_t)v22;
    v23 = v20;
    v16[1].__shared_weak_owners_ = (uint64_t)v23;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v16[1].__vftable, a5, v16[1].__shared_owners_, v16[1].__shared_weak_owners_);

    v41 = v16 + 1;
    v42 = v16;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v39, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    else
      v39 = __p;
    *(_QWORD *)&v40 = v16 + 1;
    *((_QWORD *)&v40 + 1) = v16;
    do
      v25 = __ldxr(p_shared_owners);
    while (__stxr(v25 + 1, p_shared_owners));
    v26 = *p_pair1;
    v27 = p_pair1;
    v28 = p_pair1;
    if (*p_pair1)
    {
      while (1)
      {
        while (1)
        {
          v27 = (uint64_t **)v26;
          v29 = v26 + 4;
          if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v39, v26 + 4) & 0x80) == 0)
            break;
          v26 = *v27;
          v28 = v27;
          if (!*v27)
            goto LABEL_22;
        }
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v29, &v39) & 0x80) == 0)
          break;
        v28 = v27 + 1;
        v26 = v27[1];
        if (!v26)
          goto LABEL_22;
      }
      v9 = v38;
    }
    else
    {
LABEL_22:
      v30 = (char *)operator new(0x48uLL);
      v44[0] = v30;
      v44[1] = p_pair1;
      v45 = 0;
      v31 = (std::string *)(v30 + 32);
      if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(v31, v39.__r_.__value_.__l.__data_, v39.__r_.__value_.__l.__size_);
      }
      else
      {
        *(_OWORD *)&v31->__r_.__value_.__l.__data_ = *(_OWORD *)&v39.__r_.__value_.__l.__data_;
        *((_QWORD *)v30 + 6) = *((_QWORD *)&v39.__r_.__value_.__l + 2);
      }
      *(_OWORD *)(v30 + 56) = v40;
      v40 = 0uLL;
      v45 = 1;
      *(_QWORD *)v30 = 0;
      *((_QWORD *)v30 + 1) = 0;
      *((_QWORD *)v30 + 2) = v27;
      *v28 = (uint64_t *)v30;
      v32 = *(void **)v21->_oldNotificationCenterObservers.__tree_.__begin_node_;
      if (v32)
      {
        v21->_oldNotificationCenterObservers.__tree_.__begin_node_ = v32;
        v30 = (char *)*v28;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*p_pair1, (uint64_t *)v30);
      ++v21->_oldNotificationCenterObservers.__tree_.__pair3_.__value_;
      v44[0] = 0;
      std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>,void *>>>>::reset[abi:ne180100]((uint64_t)v44);
      v16 = (std::__shared_weak_count *)*((_QWORD *)&v40 + 1);
      v9 = v38;
      if (!*((_QWORD *)&v40 + 1))
        goto LABEL_34;
    }
    v33 = (unint64_t *)&v16->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
LABEL_34:
    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v39.__r_.__value_.__l.__data_);
    v35 = v42;
    if (v42)
    {
      v36 = (unint64_t *)&v42->__shared_owners_;
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

}

- (void)addNSNotificationListenerFor:(id)a3 session:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> *v14;
  char v15;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> **v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  std::__shared_weak_count_vtbl *v24;
  unint64_t v25;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> *v26;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> *v27;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> *v28;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> *v29;
  char *v30;
  std::string *v31;
  void *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  id v38;
  id v39;
  std::string v40;
  __int128 v41;
  std::__shared_weak_count *v42;
  std::__shared_weak_count *v43;
  std::string __p;
  _QWORD v45[2];
  char v46;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v11, "UTF8String"));
  p_pair1 = &self->_newNotificationCenterObservers.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> *)self->_newNotificationCenterObservers.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_11;
  v14 = &self->_newNotificationCenterObservers.__tree_.__pair1_;
  do
  {
    v15 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&left[4].__value_.__left_, &__p);
    if (v15 >= 0)
      v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> **)left;
    else
      v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> **)&left[1];
    if (v15 >= 0)
      v14 = left;
    left = *v16;
  }
  while (*v16);
  if (v14 == p_pair1
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, &v14[4].__value_.__left_) & 0x80) != 0)
  {
LABEL_11:
    v38 = v10;
    v39 = v9;
    v17 = (std::__shared_weak_count *)operator new(0x30uLL);
    v17->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    v17->__shared_weak_owners_ = 0;
    v17->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4509308;
    v19 = v11;
    v20 = v9;
    v21 = v10;
    v17[1].__vftable = 0;
    v22 = v19;
    v17[1].__shared_owners_ = (uint64_t)v22;
    objc_initWeak((id *)&v17[1].__shared_weak_owners_, v20);
    objc_msgSend(v20, "addObserverForType:name:block:", 1, v17[1].__shared_owners_, v21);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v17[1].__vftable;
    v17[1].__vftable = (std::__shared_weak_count_vtbl *)v23;

    v42 = v17 + 1;
    v43 = v17;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v40, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    else
      v40 = __p;
    *(_QWORD *)&v41 = v17 + 1;
    *((_QWORD *)&v41 + 1) = v17;
    do
      v25 = __ldxr(p_shared_owners);
    while (__stxr(v25 + 1, p_shared_owners));
    v26 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> *)p_pair1->__value_.__left_;
    v27 = &self->_newNotificationCenterObservers.__tree_.__pair1_;
    v28 = &self->_newNotificationCenterObservers.__tree_.__pair1_;
    if (p_pair1->__value_.__left_)
    {
      while (1)
      {
        while (1)
        {
          v27 = v26;
          v29 = v26 + 4;
          if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v40, &v26[4].__value_.__left_) & 0x80) == 0)break;
          v26 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> *)v27->__value_.__left_;
          v28 = v27;
          if (!v27->__value_.__left_)
            goto LABEL_22;
        }
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v29, &v40) & 0x80) == 0)
          break;
        v28 = v27 + 1;
        v26 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<NewNotificationCenterObserver>>, void *>>> *)v27[1].__value_.__left_;
        if (!v26)
          goto LABEL_22;
      }
      v10 = v38;
      v9 = v39;
    }
    else
    {
LABEL_22:
      v30 = (char *)operator new(0x48uLL);
      v45[0] = v30;
      v45[1] = &self->_newNotificationCenterObservers.__tree_.__pair1_;
      v46 = 0;
      v31 = (std::string *)(v30 + 32);
      if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(v31, v40.__r_.__value_.__l.__data_, v40.__r_.__value_.__l.__size_);
      }
      else
      {
        *(_OWORD *)&v31->__r_.__value_.__l.__data_ = *(_OWORD *)&v40.__r_.__value_.__l.__data_;
        *((_QWORD *)v30 + 6) = *((_QWORD *)&v40.__r_.__value_.__l + 2);
      }
      *(_OWORD *)(v30 + 56) = v41;
      v41 = 0uLL;
      v46 = 1;
      *(_QWORD *)v30 = 0;
      *((_QWORD *)v30 + 1) = 0;
      *((_QWORD *)v30 + 2) = v27;
      v28->__value_.__left_ = v30;
      v32 = *(void **)self->_newNotificationCenterObservers.__tree_.__begin_node_;
      if (v32)
      {
        self->_newNotificationCenterObservers.__tree_.__begin_node_ = v32;
        v30 = (char *)v28->__value_.__left_;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_newNotificationCenterObservers.__tree_.__pair1_.__value_.__left_, (uint64_t *)v30);
      ++self->_newNotificationCenterObservers.__tree_.__pair3_.__value_;
      v45[0] = 0;
      std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>,void *>>>>::reset[abi:ne180100]((uint64_t)v45);
      v17 = (std::__shared_weak_count *)*((_QWORD *)&v41 + 1);
      v10 = v38;
      v9 = v39;
      if (!*((_QWORD *)&v41 + 1))
        goto LABEL_34;
    }
    v33 = (unint64_t *)&v17->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
LABEL_34:
    if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v40.__r_.__value_.__l.__data_);
    v35 = v43;
    if (v43)
    {
      v36 = (unint64_t *)&v43->__shared_owners_;
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

}

- (void)addAVAudioSessionKVOObservers:(unsigned int)a3 session:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v4 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (kAudioSessionClientLogSubsystem)
  {
    v7 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315650;
    v13 = "ATAudioSessionClientImpl.mm";
    v14 = 1024;
    v15 = 555;
    v16 = 1024;
    v17 = v4;
    _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d Adding KVO for %d", (uint8_t *)&v12, 0x18u);
  }

LABEL_8:
  +[ATAudioSessionUtils getAVASProperty:](ATAudioSessionUtils, "getAVASProperty:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, v9, 3, 0);
  }
  else
  {
    if (kAudioSessionClientLogSubsystem)
    {
      v10 = *(id *)kAudioSessionClientLogSubsystem;
      if (!v10)
        goto LABEL_17;
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315650;
      v13 = "ATAudioSessionClientImpl.mm";
      v14 = 1024;
      v15 = 559;
      v16 = 1024;
      v17 = v4;
      _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Attempt to add KVO for unsupported property %d", (uint8_t *)&v12, 0x18u);
    }

  }
LABEL_17:

}

- (void)removeAVAudioSessionKVOObservers:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  if (kAudioSessionClientLogSubsystem)
  {
    v5 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315650;
    v13 = "ATAudioSessionClientImpl.mm";
    v14 = 1024;
    v15 = 568;
    v16 = 1024;
    v17 = v3;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Removing KVO for %d", (uint8_t *)&v12, 0x18u);
  }

LABEL_8:
  +[ATAudioSessionUtils getAVASProperty:](ATAudioSessionUtils, "getAVASProperty:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_weakSession);
    v9 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", self, v7, 0);

    }
  }
  else
  {
    if (kAudioSessionClientLogSubsystem)
    {
      v10 = *(id *)kAudioSessionClientLogSubsystem;
      if (!v10)
        goto LABEL_18;
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315650;
      v13 = "ATAudioSessionClientImpl.mm";
      v14 = 1024;
      v15 = 572;
      v16 = 1024;
      v17 = v3;
      _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Attempt to remove KVO for unsupported property %d", (uint8_t *)&v12, 0x18u);
    }

  }
LABEL_18:

}

- (void)handleInterruption:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  _BOOL8 v13;
  void *v14;
  __CFRunLoop *mCFObject;
  __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  _BOOL4 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kAudioSessionClientLogSubsystem)
  {
    v5 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v26 = "ATAudioSessionClientImpl.mm";
    v27 = 1024;
    v28 = 595;
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Interruption received %@", buf, 0x1Cu);

  }
LABEL_8:
  if (v4)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CFF030]);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = -[NSObject unsignedLongValue](v11, "unsignedLongValue");
      if (v12)
      {
        v13 = v12 == 1;
      }
      else
      {
        objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CFF010]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATAudioSessionClientImpl setInterruptionType:](self, "setInterruptionType:", objc_msgSend(v14, "unsignedIntValue"));

        v13 = 0;
      }
      objc_initWeak((id *)buf, self);
      if (-[ATAudioSessionClientImpl clientInterruptionListenerProc](self, "clientInterruptionListenerProc"))
      {
        mCFObject = self->_clientRunLoop.mCFObject;
        v16 = self->_clientRunLoopMode.mObject.mCFObject;
        v19 = MEMORY[0x1E0C809B0];
        v20 = 3221225472;
        v21 = __47__ATAudioSessionClientImpl_handleInterruption___block_invoke;
        v22 = &unk_1E4509258;
        objc_copyWeak(&v23, (id *)buf);
        v24 = v13;
        CFRunLoopPerformBlock(mCFObject, v16, &v19);
        objc_destroyWeak(&v23);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13, v19, v20, v21, v22);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioSessionClientImpl callPropertyListeners:data:](self, "callPropertyListeners:data:", 1768846450, v17);

      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (kAudioSessionClientLogSubsystem)
      {
        v11 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v11)
          goto LABEL_20;
      }
      else
      {
        v11 = MEMORY[0x1E0C81028];
        v18 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "ATAudioSessionClientImpl.mm";
        v27 = 1024;
        v28 = 606;
        _os_log_impl(&dword_1A0F4D000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to post interruption:Invalid notification info", buf, 0x12u);
      }
    }

LABEL_20:
  }

}

- (void)handleRouteChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kAudioSessionClientLogSubsystem)
  {
    v5 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315650;
    v18 = "ATAudioSessionClientImpl.mm";
    v19 = 1024;
    v20 = 649;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Route change received %@", (uint8_t *)&v17, 0x1Cu);

  }
LABEL_8:
  if (v4)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      if (kAudioSessionClientLogSubsystem)
      {
        v14 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v14)
          goto LABEL_26;
      }
      else
      {
        v14 = MEMORY[0x1E0C81028];
        v15 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v17 = 136315394;
        v18 = "ATAudioSessionClientImpl.mm";
        v19 = 1024;
        v20 = 660;
        _os_log_impl(&dword_1A0F4D000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to post route change:Invalid notification info", (uint8_t *)&v17, 0x12u);
      }

      goto LABEL_26;
    }
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CFF198]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (v12)
    {
      if (kAudioSessionClientLogSubsystem)
      {
        v13 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v13)
          goto LABEL_25;
      }
      else
      {
        v13 = MEMORY[0x1E0C81028];
        v16 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v17 = 136315394;
        v18 = "ATAudioSessionClientImpl.mm";
        v19 = 1024;
        v20 = 666;
        _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d nil route change reason", (uint8_t *)&v17, 0x12u);
      }

    }
LABEL_25:
    -[ATAudioSessionClientImpl callPropertyListeners:data:](self, "callPropertyListeners:data:", 1919902568, v10);
LABEL_26:

  }
}

- (void)handleServerDeath:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kAudioSessionClientLogSubsystem)
  {
    v5 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "ATAudioSessionClientImpl.mm";
    v9 = 1024;
    v10 = 675;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Server death notification received", (uint8_t *)&v7, 0x12u);
  }

LABEL_8:
  -[ATAudioSessionClientImpl callPropertyListeners:data:](self, "callPropertyListeners:data:", 1684628836, 0);
  -[ATAudioSessionClientImpl resetClientConfiguration](self, "resetClientConfiguration");

}

- (void)handleServerReset:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (kAudioSessionClientLogSubsystem)
  {
    v4 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "ATAudioSessionClientImpl.mm";
    v8 = 1024;
    v9 = 683;
    _os_log_impl(&dword_1A0F4D000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Server reset notification received", (uint8_t *)&v6, 0x12u);
  }

LABEL_8:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id WeakRetained;
  char isKindOfClass;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakSession);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v13 = +[ATAudioSessionUtils getAudioSessionProperty:](ATAudioSessionUtils, "getAudioSessionProperty:", v15);
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATAudioSessionClientImpl callPropertyListeners:data:](self, "callPropertyListeners:data:", v13, v14);

  }
}

- (void)callPropertyListeners:(unsigned int)a3 data:(id)a4
{
  id v6;
  __CFRunLoop *mCFObject;
  __CFString *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  ATAudioSessionClientImpl *v14;
  id v15;
  unsigned int v16;
  _BYTE location[12];
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!self->_clientRunLoop.mCFObject || !self->_clientRunLoopMode.mObject.mCFObject)
  {
    if (kAudioSessionClientLogSubsystem)
    {
      v9 = *(id *)kAudioSessionClientLogSubsystem;
      if (!v9)
        goto LABEL_12;
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "ATAudioSessionClientImpl.mm";
      v18 = 1024;
      v19 = 702;
      _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to call property listener: Either clientRunLoop or clientRunLoopMode is invalid", location, 0x12u);
    }
    goto LABEL_11;
  }
  if (!self->_propertyListeners.__ptr_.__value_)
  {
    if (kAudioSessionClientLogSubsystem)
    {
      v9 = *(id *)kAudioSessionClientLogSubsystem;
      if (!v9)
        goto LABEL_12;
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "ATAudioSessionClientImpl.mm";
      v18 = 1024;
      v19 = 708;
      _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Failed: 'propertyListener' is invalid", location, 0x12u);
    }
LABEL_11:

    goto LABEL_12;
  }
  objc_initWeak((id *)location, self);
  mCFObject = self->_clientRunLoop.mCFObject;
  v8 = self->_clientRunLoopMode.mObject.mCFObject;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__ATAudioSessionClientImpl_callPropertyListeners_data___block_invoke;
  v12[3] = &unk_1E4509280;
  objc_copyWeak(&v15, (id *)location);
  v16 = a3;
  v13 = v6;
  v14 = self;
  CFRunLoopPerformBlock(mCFObject, v8, v12);
  CFRunLoopWakeUp(self->_clientRunLoop.mCFObject);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)location);
LABEL_12:

}

- (unsigned)interruptionType
{
  return self->_interruptionType;
}

- (void)setInterruptionType:(unsigned int)a3
{
  self->_interruptionType = a3;
}

- (void)clientInterruptionListenerProc
{
  return self->_clientInterruptionListenerProc;
}

- (void)setClientInterruptionListenerProc:(void *)a3
{
  self->_clientInterruptionListenerProc = a3;
}

- (void)clientUserData
{
  return self->_clientUserData;
}

- (void)setClientUserData:(void *)a3
{
  self->_clientUserData = a3;
}

- (BOOL)isConfigured
{
  return self->_isConfigured;
}

- (void)setIsConfigured:(BOOL)a3
{
  self->_isConfigured = a3;
}

- (void).cxx_destruct
{
  __CFString *mCFObject;
  __CFRunLoop *v4;
  AudioSessionPropertyListeners *value;

  mCFObject = self->_clientRunLoopMode.mObject.mCFObject;
  if (mCFObject)
    CFRelease(mCFObject);
  v4 = self->_clientRunLoop.mCFObject;
  if (v4)
    CFRelease(v4);
  std::__tree<std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>>>::destroy((_QWORD *)self->_newNotificationCenterObservers.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<NewNotificationCenterObserver>>>>::destroy((_QWORD *)self->_oldNotificationCenterObservers.__tree_.__pair1_.__value_.__left_);
  value = self->_propertyListeners.__ptr_.__value_;
  self->_propertyListeners.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<AudioSessionPropertyListeners>::operator()[abi:ne180100]((uint64_t)value);
  objc_storeStrong((id *)&self->_propertyManager, 0);
  objc_storeStrong((id *)&self->_strongSession, 0);
  objc_destroyWeak((id *)&self->_weakSession);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = (char *)self + 48;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = (char *)self + 72;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 10) = 0;
  return self;
}

void __55__ATAudioSessionClientImpl_callPropertyListeners_data___block_invoke(uint64_t a1)
{
  AudioSessionPropertyListeners **WeakRetained;
  AudioSessionPropertyListeners **v3;
  int v4;
  int v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = (AudioSessionPropertyListeners **)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_18;
  v4 = *(_DWORD *)(a1 + 56);
  if (v4 <= 1684628835)
  {
    if (v4 > 1667788642)
    {
      if (v4 != 1667788643)
      {
        if (v4 != 1667788662)
          goto LABEL_18;
LABEL_16:
        objc_msgSend(*(id *)(a1 + 32), "floatValue");
        v15 = v6;
        AudioSessionPropertyListeners::CallPropertyListeners(v3[4], *(unsigned int *)(a1 + 56), (const void *)4, (uint64_t)&v15);
        goto LABEL_18;
      }
    }
    else if (v4 != 1634296182)
    {
      v5 = 1667787107;
LABEL_12:
      if (v4 != v5)
        goto LABEL_18;
    }
    v15 = objc_msgSend(*(id *)(a1 + 32), "unsignedIntValue");
    AudioSessionPropertyListeners::CallPropertyListeners(v3[4], *(unsigned int *)(a1 + 56), (const void *)4, (uint64_t)&v15);
    goto LABEL_18;
  }
  if (v4 <= 1768387426)
  {
    if (v4 == 1684628836)
    {
      AudioSessionPropertyListeners::CallPropertyListeners(WeakRetained[4], 1684628836, (const void *)4, 0);
      goto LABEL_18;
    }
    v5 = 1768382838;
    goto LABEL_12;
  }
  if (v4 == 1768387427)
    goto LABEL_16;
  if (v4 != 1919902568)
  {
    v5 = 1768846450;
    goto LABEL_12;
  }
  v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  if (v7)
  {
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CFF190]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATAudioSessionUtils getRouteDescriptionFromAVASRouteDescription:](ATAudioSessionUtils, "getRouteDescriptionFromAVASRouteDescription:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "currentRoute");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATAudioSessionUtils getRouteDescriptionFromAVASRouteDescription:](ATAudioSessionUtils, "getRouteDescriptionFromAVASRouteDescription:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = CFSTR("OutputDeviceDidChange_Reason");
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CFF198]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    v17[1] = v10;
    v16[1] = CFSTR("ActiveAudioRouteDidChange_OldDetailedRoute");
    v16[2] = CFSTR("ActiveAudioRouteDidChange_NewDetailedRoute");
    v17[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    AudioSessionPropertyListeners::CallPropertyListeners(v3[4], *(unsigned int *)(a1 + 56), (const void *)8, (uint64_t)v14);
  }
LABEL_18:

}

void __47__ATAudioSessionClientImpl_handleInterruption___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    (*((void (**)(_QWORD, _QWORD))WeakRetained + 14))(*((_QWORD *)WeakRetained + 15), *(unsigned int *)(a1 + 40));

}

void __82__ATAudioSessionClientImpl_AudioSessionAddPropertyListenerImpl_userProc_userData___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleRouteChange:", v5);

}

void __82__ATAudioSessionClientImpl_AudioSessionAddPropertyListenerImpl_userProc_userData___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleInterruption:", v5);

}

void __82__ATAudioSessionClientImpl_AudioSessionAddPropertyListenerImpl_userProc_userData___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleServerDeath:", v5);

}

void __82__ATAudioSessionClientImpl_AudioSessionAddPropertyListenerImpl_userProc_userData___block_invoke_4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleServerReset:", v5);

}

void __85__ATAudioSessionClientImpl_setClientConfiguration_runLoopMode_listenerProc_userData___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleInterruption:", v5);

}

@end
