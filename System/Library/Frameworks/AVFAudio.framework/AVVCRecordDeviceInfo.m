@implementation AVVCRecordDeviceInfo

- (AVVCRecordDeviceInfo)initWithRecordingEngine:(shared_ptr<AVVCRecordingEngine>)a3
{
  AVVCRecordingEngine *var0;
  AVVCRecordDeviceInfo *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  unint64_t *v15;
  unint64_t v16;
  NSString *recordRoute;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  NSString *remoteDeviceUIDString;
  NSString *remoteProductIdentifier;
  NSUUID *remoteDeviceUID;
  uint64_t v24;
  __CFString *v25;
  NSString *v26;
  NSUUID *v27;
  std::mutex *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  NSString *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  NSUUID *v36;
  uint64_t v37;
  unsigned int v38;
  std::mutex *v39;
  NSObject *v40;
  NSObject *v41;
  unsigned int remoteDeviceCategory;
  objc_super v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  __CFString *v50;
  __int16 v51;
  AVVCRecordDeviceInfo *v52;
  uint64_t v53;

  var0 = a3.var0;
  v53 = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)AVVCRecordDeviceInfo;
  v4 = -[AVVCRecordDeviceInfo init](&v44, sel_init, a3.var0, a3.var1);
  if (v4)
  {
    if (!kAVVCScope)
      goto LABEL_22;
    if ((*(_BYTE *)(kAVVCScope + 8) & 1) == 0)
      goto LABEL_22;
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_22;
    v6 = v5;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
LABEL_21:

LABEL_22:
      recordRoute = v4->_recordRoute;
      v4->_recordRoute = 0;

      (*(void (**)(_QWORD, NSString **))(**(_QWORD **)var0 + 328))(*(_QWORD *)var0, &v4->_recordRoute);
      v18 = *(_QWORD *)var0;
      v4->_isUpsamplingSourceAudio = *(_BYTE *)(*(_QWORD *)var0 + 328);
      AVVCRouteManager::getRecordDeviceUID(*(id **)(v18 + 376));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v19);
        v20 = objc_claimAutoreleasedReturnValue();
        remoteDeviceUIDString = v4->_remoteDeviceUIDString;
        v4->_remoteDeviceUIDString = (NSString *)v20;
      }
      else
      {
        remoteDeviceUIDString = v4->_remoteDeviceUIDString;
        v4->_remoteDeviceUIDString = 0;
      }

      if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)var0 + 320))(*(_QWORD *)var0) == 2)
      {
        v4->_isRemoteDevice = 0;
        remoteProductIdentifier = v4->_remoteProductIdentifier;
        v4->_remoteProductIdentifier = 0;

        remoteDeviceUID = v4->_remoteDeviceUID;
        v4->_remoteDeviceUID = 0;

      }
      else
      {
        v4->_isRemoteDevice = 1;
        if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)var0 + 320))(*(_QWORD *)var0) == 1)
        {
          v24 = *(_QWORD *)(*(_QWORD *)var0 + 376);
          if (IsSerializationEnabled(void)::onceToken != -1)
            dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
          if (IsSerializationEnabled(void)::enable)
          {
            v25 = (__CFString *)*(id *)v24;
          }
          else
          {
            v28 = (std::mutex *)(v24 + 56);
            std::mutex::lock((std::mutex *)(v24 + 56));
            v25 = (__CFString *)*(id *)v24;
            std::mutex::unlock(v28);
          }
          if (kAVVCScope)
          {
            if ((*(_BYTE *)(kAVVCScope + 8) & 1) != 0)
            {
              v29 = *(id *)kAVVCScope;
              if (v29)
              {
                v30 = v29;
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  v46 = "AVVoiceController.mm";
                  v47 = 1024;
                  v48 = 192;
                  v49 = 2112;
                  v50 = v25;
                  _os_log_impl(&dword_19B733000, v30, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVVCRecordDeviceInfo initWithRecordingEngine: recordDeviceName(%@)", buf, 0x1Cu);
                }

              }
            }
          }
          if (v25)
          {
            v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v25);
            v32 = v4->_remoteProductIdentifier;
            v4->_remoteProductIdentifier = (NSString *)v31;
          }
          else
          {
            v32 = v4->_remoteProductIdentifier;
            v4->_remoteProductIdentifier = 0;
          }

          if (kAVVCScope)
          {
            if ((*(_BYTE *)(kAVVCScope + 8) & 1) != 0)
            {
              v33 = *(id *)kAVVCScope;
              if (v33)
              {
                v34 = v33;
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  v46 = "AVVoiceController.mm";
                  v47 = 1024;
                  v48 = 194;
                  v49 = 2112;
                  v50 = v19;
                  _os_log_impl(&dword_19B733000, v34, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVVCRecordDeviceInfo initWithRecordingEngine: remoteDeviceUUID(%@)", buf, 0x1Cu);
                }

              }
            }
          }
          if (v19)
          {
            v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v19);
            v36 = v4->_remoteDeviceUID;
            v4->_remoteDeviceUID = (NSUUID *)v35;
          }
          else
          {
            v36 = v4->_remoteDeviceUID;
            v4->_remoteDeviceUID = 0;
          }

          v37 = *(_QWORD *)(*(_QWORD *)var0 + 376);
          if (IsSerializationEnabled(void)::onceToken != -1)
            dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
          if (IsSerializationEnabled(void)::enable)
          {
            v38 = *(_DWORD *)(v37 + 8);
          }
          else
          {
            v39 = (std::mutex *)(v37 + 56);
            std::mutex::lock((std::mutex *)(v37 + 56));
            v38 = *(_DWORD *)(v37 + 8);
            std::mutex::unlock(v39);
          }
          v4->_remoteDeviceCategory = v38;
          if (kAVVCScope)
          {
            if ((*(_BYTE *)(kAVVCScope + 8) & 1) != 0)
            {
              v40 = *(id *)kAVVCScope;
              if (v40)
              {
                v41 = v40;
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                {
                  remoteDeviceCategory = v4->_remoteDeviceCategory;
                  *(_DWORD *)buf = 136315650;
                  v46 = "AVVoiceController.mm";
                  v47 = 1024;
                  v48 = 197;
                  v49 = 1024;
                  LODWORD(v50) = remoteDeviceCategory;
                  _os_log_impl(&dword_19B733000, v41, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVVCRecordDeviceInfo initWithVoiceController: remoteDeviceCategory(%d)", buf, 0x18u);
                }

              }
            }
          }

          goto LABEL_65;
        }
        v26 = v4->_remoteProductIdentifier;
        v4->_remoteProductIdentifier = 0;

        v27 = v4->_remoteDeviceUID;
        v4->_remoteDeviceUID = 0;

      }
      v4->_remoteDeviceCategory = 0;
LABEL_65:

      return v4;
    }
    v7 = *(_QWORD *)var0;
    v8 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
      if (v7)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        v12 = *(_QWORD *)(v7 + 272);
        v13 = *p_shared_owners + 1;
LABEL_13:
        objc_msgSend(v11, "stringWithFormat:", CFSTR("(%p) streamID: %d, use_count:%ld"), v7, v12, v13);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    else if (v7)
    {
      v13 = 0;
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = *(_QWORD *)(v7 + 272);
      goto LABEL_13;
    }
    v14 = CFSTR("(0x0) use_count:0");
LABEL_15:
    *(_DWORD *)buf = 136315906;
    v46 = "AVVoiceController.mm";
    v47 = 1024;
    v48 = 171;
    v49 = 2112;
    v50 = v14;
    v51 = 2048;
    v52 = v4;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVVCRecordDeviceInfo initWithRecordingEngine[%@]. self(%p)", buf, 0x26u);
    if (v8)
    {
      v15 = (unint64_t *)&v8->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }

    goto LABEL_21;
  }
  return v4;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  AVVCRecordDeviceInfo *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    if ((*(_BYTE *)(kAVVCScope + 8) & 1) != 0)
    {
      v3 = *(id *)kAVVCScope;
      if (v3)
      {
        v4 = v3;
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v7 = "AVVoiceController.mm";
          v8 = 1024;
          v9 = 210;
          v10 = 2048;
          v11 = self;
          _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVVCRecordDeviceInfo dealloc. self(%p)", buf, 0x1Cu);
        }

      }
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AVVCRecordDeviceInfo;
  -[AVVCRecordDeviceInfo dealloc](&v5, sel_dealloc);
}

- (NSString)recordRoute
{
  return self->_recordRoute;
}

- (BOOL)isRemoteDevice
{
  return self->_isRemoteDevice;
}

- (NSString)remoteProductIdentifier
{
  return self->_remoteProductIdentifier;
}

- (NSUUID)remoteDeviceUID
{
  return self->_remoteDeviceUID;
}

- (unsigned)remoteDeviceCategory
{
  return self->_remoteDeviceCategory;
}

- (BOOL)isUpsamplingSourceAudio
{
  return self->_isUpsamplingSourceAudio;
}

- (NSString)remoteDeviceUIDString
{
  return self->_remoteDeviceUIDString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDeviceUIDString, 0);
  objc_storeStrong((id *)&self->_remoteDeviceUID, 0);
  objc_storeStrong((id *)&self->_remoteProductIdentifier, 0);
  objc_storeStrong((id *)&self->_recordRoute, 0);
}

@end
