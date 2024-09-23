@implementation PHASESessionInterfaceImpl

- (PHASESessionInterfaceImpl)init
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  gPhaseManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "ATPhasePlatform.mm";
    v7 = 1024;
    v8 = 80;
    _os_log_impl(&dword_1A0F4D000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: unsupported initializer for PHASESessionInterfaceImpl!", (uint8_t *)&v5, 0x12u);
  }

  return 0;
}

- (PHASESessionInterfaceImpl)initWithPhasePlatform:(id)a3
{
  id v4;
  PHASESessionInterfaceImpl *v5;
  PHASESessionInterfaceImpl *v6;
  id muteSessionInputBlock;
  id fadeSessionOutputBlock;
  id activateSessionBlock;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHASESessionInterfaceImpl;
  v5 = -[PHASESessionInterfaceImpl init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_phasePlatform, v4);
    muteSessionInputBlock = v6->_muteSessionInputBlock;
    v6->_muteSessionInputBlock = 0;

    fadeSessionOutputBlock = v6->_fadeSessionOutputBlock;
    v6->_fadeSessionOutputBlock = 0;

    activateSessionBlock = v6->_activateSessionBlock;
    v6->_activateSessionBlock = 0;

  }
  return v6;
}

- (void)dealloc
{
  id muteSessionInputBlock;
  id fadeSessionOutputBlock;
  id activateSessionBlock;
  id sessionVolumeImpl;
  objc_super v7;

  muteSessionInputBlock = self->_muteSessionInputBlock;
  self->_muteSessionInputBlock = 0;

  fadeSessionOutputBlock = self->_fadeSessionOutputBlock;
  self->_fadeSessionOutputBlock = 0;

  activateSessionBlock = self->_activateSessionBlock;
  self->_activateSessionBlock = 0;

  sessionVolumeImpl = self->_sessionVolumeImpl;
  self->_sessionVolumeImpl = 0;

  objc_storeWeak((id *)&self->_phasePlatform, 0);
  v7.receiver = self;
  v7.super_class = (Class)PHASESessionInterfaceImpl;
  -[PHASESessionInterfaceImpl dealloc](&v7, sel_dealloc);
}

- (BOOL)setClientStateOnSession:(unsigned int)a3 clientToken:(void *)a4 modes:(unsigned int)a5 state:(unsigned int)a6 outDuckingInfo:(AudioSessionDuckingInfo *)a7
{
  unsigned __int8 v13;
  id v14;
  char v15;
  _QWORD v17[5];
  id v18[3];
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  id location;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  {
    CASIsDarwinOS(void)::global = os_variant_is_darwinos();
  }
  if (CASIsDarwinOS(void)::global)
  {
    if (a7)
    {
      *(_QWORD *)&a7->var1 = 0x3F80000000000000;
      a7->var0 = 0;
    }
  }
  else
  {
    objc_initWeak(&location, self);
    if (AudioControlQueue(void)::once != -1)
      dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
    v14 = (id)AudioControlQueue(void)::gAudioControlQueue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __92__PHASESessionInterfaceImpl_setClientStateOnSession_clientToken_modes_state_outDuckingInfo___block_invoke;
    v17[3] = &unk_1E450DD48;
    objc_copyWeak(v18, &location);
    v17[4] = &v23;
    v18[1] = a4;
    v18[2] = a7;
    v19 = a3;
    v20 = a5;
    v21 = a6;
    AT::DispatchBlock(v14, v17, 0, (uint64_t)"-[PHASESessionInterfaceImpl setClientStateOnSession:clientToken:modes:state:outDuckingInfo:]", (uint64_t)"ATPhasePlatform.mm", 129);

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  v15 = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v23, 8);
  return v15;
}

- (void)removeInputClientToken:(void *)a3 fromSessionID:(unsigned int)a4
{
  unordered_map<unsigned int, std::unordered_set<void *>, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, std::unordered_set<void *>>>> *p_audioSessionInputClients;
  uint64_t *v8;
  uint64_t *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t *v13;
  unint64_t value;
  unint64_t v15;
  uint8x8_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t *v19;
  PHASESessionInterfaceImpl *v20;
  unint64_t phasePlatform;
  unint64_t v22;
  objc_class *v23;
  unint64_t v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  PHASESessionInterfaceImpl *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  unsigned int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  p_audioSessionInputClients = &self->audioSessionInputClients;
  v8 = std::__hash_table<std::__hash_value_type<unsigned int,std::unique_ptr<SSClientCompletionProcInfo>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<SSClientCompletionProcInfo>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<SSClientCompletionProcInfo>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unique_ptr<SSClientCompletionProcInfo>>>>::find<unsigned int>(&self->audioSessionInputClients.__table_.__bucket_list_.__ptr_.__value_, a4);
  if (v8)
  {
    v9 = v8;
    v10 = v8 + 3;
    v11 = std::__hash_table<void *,std::hash<void *>,std::equal_to<void *>,std::allocator<void *>>::find<void *>(v8 + 3, (unint64_t)a3);
    if (v11)
    {
      std::__hash_table<void *,std::hash<void *>,std::equal_to<void *>,std::allocator<void *>>::erase(v10, v11);
      if (!v9[6])
      {
        v12 = std::__hash_table<std::__hash_value_type<unsigned int,std::unique_ptr<SSClientCompletionProcInfo>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<SSClientCompletionProcInfo>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<SSClientCompletionProcInfo>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unique_ptr<SSClientCompletionProcInfo>>>>::find<unsigned int>(p_audioSessionInputClients, a4);
        if (v12)
        {
          v13 = v12;
          value = self->audioSessionInputClients.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
          v15 = v12[1];
          v16 = (uint8x8_t)vcnt_s8((int8x8_t)value);
          v16.i16[0] = vaddlv_u8(v16);
          if (v16.u32[0] > 1uLL)
          {
            if (v15 >= value)
              v15 %= value;
          }
          else
          {
            v15 &= value - 1;
          }
          v19 = (uint64_t *)p_audioSessionInputClients->__table_.__bucket_list_.__ptr_.__value_[v15];
          do
          {
            v20 = (PHASESessionInterfaceImpl *)v19;
            v19 = (uint64_t *)*v19;
          }
          while (v19 != v12);
          if (v20 == (PHASESessionInterfaceImpl *)&self->audioSessionInputClients.__table_.__p1_)
            goto LABEL_29;
          phasePlatform = (unint64_t)v20->_phasePlatform;
          if (v16.u32[0] > 1uLL)
          {
            if (phasePlatform >= value)
              phasePlatform %= value;
          }
          else
          {
            phasePlatform &= value - 1;
          }
          if (phasePlatform != v15)
          {
LABEL_29:
            if (!*v12)
              goto LABEL_30;
            v22 = *(_QWORD *)(*v12 + 8);
            if (v16.u32[0] > 1uLL)
            {
              if (v22 >= value)
                v22 %= value;
            }
            else
            {
              v22 &= value - 1;
            }
            if (v22 != v15)
LABEL_30:
              p_audioSessionInputClients->__table_.__bucket_list_.__ptr_.__value_[v15] = 0;
          }
          v23 = (objc_class *)*v12;
          if (*v12)
          {
            v24 = *((_QWORD *)v23 + 1);
            if (v16.u32[0] > 1uLL)
            {
              if (v24 >= value)
                v24 %= value;
            }
            else
            {
              v24 &= value - 1;
            }
            if (v24 != v15)
            {
              p_audioSessionInputClients->__table_.__bucket_list_.__ptr_.__value_[v24] = v20;
              v23 = (objc_class *)*v12;
            }
          }
          v20->super.isa = v23;
          *v12 = 0;
          --self->audioSessionInputClients.__table_.__p2_.__value_;
          std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)(v12 + 3));
          operator delete(v13);
        }
      }
    }
    else
    {
      gPhaseManagerLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v25 = 136316162;
        v26 = "ATPhasePlatform.mm";
        v27 = 1024;
        v28 = 160;
        v29 = 2048;
        v30 = self;
        v31 = 2048;
        v32 = a3;
        v33 = 1024;
        v34 = a4;
        _os_log_impl(&dword_1A0F4D000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d sessioninterface@%p: can't remove unknown client@%p from session 0x%x", (uint8_t *)&v25, 0x2Cu);
      }

    }
  }
  else
  {
    gPhaseManagerLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v25 = 136316162;
      v26 = "ATPhasePlatform.mm";
      v27 = 1024;
      v28 = 166;
      v29 = 2048;
      v30 = self;
      v31 = 2048;
      v32 = a3;
      v33 = 1024;
      v34 = a4;
      _os_log_impl(&dword_1A0F4D000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d sessioninterface@%p: can't remove client@%p from unknown session 0x%x", (uint8_t *)&v25, 0x2Cu);
    }

  }
}

- (BOOL)setClientStateFromCallbackOnSession:(unsigned int)a3 clientToken:(void *)a4 modes:(unsigned int)a5 state:(unsigned int)a6 outDuckingInfo:(AudioSessionDuckingInfo *)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  unsigned __int8 v13;
  int v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  PHASESessionInterfaceImpl *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v11 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x1E0C80C00];
  {
    CASIsDarwinOS(void)::global = os_variant_is_darwinos();
  }
  if (CASIsDarwinOS(void)::global)
  {
    if (a7)
    {
      *(_QWORD *)&a7->var1 = 0x3F80000000000000;
      a7->var0 = 0;
    }
    return 1;
  }
  v14 = AudioSessionSetClientPlayState(v11, 1885888883, (uint64_t)a4, v9, v8, (uint64_t)a7, 0);
  if (!v14)
    return 1;
  v15 = v14;
  gPhaseManagerLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if ((_DWORD)v8)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 136316418;
      v20 = "ATPhasePlatform.mm";
      v21 = 1024;
      v22 = 223;
      v23 = 2048;
      v24 = self;
      v25 = 2048;
      v26 = a4;
      v27 = 1024;
      v28 = v8;
      v29 = 1024;
      v30 = v15;
      _os_log_impl(&dword_1A0F4D000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d sessioninterface@%p: error setting client@%p session state %u from callback, err = %d", (uint8_t *)&v19, 0x32u);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136316418;
    v20 = "ATPhasePlatform.mm";
    v21 = 1024;
    v22 = 219;
    v23 = 2048;
    v24 = self;
    v25 = 2048;
    v26 = a4;
    v27 = 1024;
    v28 = 0;
    v29 = 1024;
    v30 = v15;
    _os_log_impl(&dword_1A0F4D000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d sessioninterface@%p: error setting client@%p session state %u from callback, err = %d", (uint8_t *)&v19, 0x32u);
  }

  return 0;
}

- (void)refreshInputMuteOnAllSessions:(float)a3
{
  unsigned __int8 v5;
  void *i;
  unsigned int v7;
  int v8;
  _QWORD *j;
  AT::SessionFacade *v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  AQMESession v17;
  unsigned int v18;
  _BYTE v19[32];
  int v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  PHASESessionInterfaceImpl *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  {
    CASIsDarwinOS(void)::global = os_variant_is_darwinos();
  }
  if (!CASIsDarwinOS(void)::global)
  {
    for (i = self->audioSessionInputClients.__table_.__p1_.__value_.__next_; i; i = *(void **)i)
    {
      v7 = *((_DWORD *)i + 4);
      memset(v19, 0, sizeof(v19));
      v8 = *((_DWORD *)i + 14);
      v18 = v7;
      v20 = v8;
      std::__hash_table<std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>>>::__rehash<true>((uint64_t)v19, *((_QWORD *)i + 4));
      for (j = (_QWORD *)*((_QWORD *)i + 5); j; j = (_QWORD *)*j)
        std::__hash_table<void *,std::hash<void *>,std::equal_to<void *>,std::allocator<void *>>::__emplace_unique_key_args<void *,void * const&>((uint64_t)v19, j[2], j[2]);
      AQMESession::AQMESession(&v17, v18, 0);
      v11 = AT::SessionFacade::global(v10);
      v16 = (*(uint64_t (**)(uint64_t, AQMESession *))(*(_QWORD *)v11 + 64))(v11, &v17);
      if ((v16 & 0xFF00000000) != 0)
      {
        caulk::expected<BOOL,int>::value((uint64_t)&v16);
        v12 = v16;
        gPhaseManagerLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v22 = "ATPhasePlatform.mm";
          v23 = 1024;
          v24 = 264;
          v25 = 2048;
          v26 = self;
          v27 = 1024;
          v28 = v12;
          v29 = 1024;
          v30 = v18;
          _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d platform@%p: refreshAudioSessionInputMute mute=%d for session=0x%x", buf, 0x28u);
        }

        *(float *)&v14 = a3;
        -[PHASESessionInterfaceImpl muteSessionInput:mute:fadeTime:](self, "muteSessionInput:mute:fadeTime:", v18, v12 != 0, v14);
      }
      else
      {
        gPhaseManagerLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v22 = "ATPhasePlatform.mm";
          v23 = 1024;
          v24 = 267;
          v25 = 2048;
          v26 = self;
          v27 = 1024;
          v28 = v16;
          v29 = 1024;
          v30 = v18;
          _os_log_impl(&dword_1A0F4D000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d platform@%p: error %i getting mute value in refreshAudioSessionInputMute for session=0x%x", buf, 0x28u);
        }

      }
      std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v17.mDescription.var0);
      if (*((char *)&v17.mDescription.__r_.__value_.var0.__l + 23) < 0)
        operator delete(v17.mDescription.__r_.__value_.var0.__l.__data_);
      if (v17.mSubsessionRef.mCFObject)
        CFRelease(v17.mSubsessionRef.mCFObject);
      std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)v19);
    }
  }
}

- (id)getInputMuteStateForSession:(unsigned int)a3 fromCallback:(BOOL)a4
{
  uint64_t v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t (*v18)();
  uint64_t v19;
  char v20;
  char v21;
  unsigned int v22;
  char v23;
  _QWORD v24[5];
  _QWORD v25[3];
  _QWORD *v26;
  unsigned int v27;
  _QWORD v28[3];
  _QWORD *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28[0] = &off_1E450DDD8;
  v29 = v28;
  v14 = 0;
  v15 = (char *)&v14;
  v16 = 0x3812000000;
  v17 = __Block_byref_object_copy__4400;
  v18 = __Block_byref_object_dispose__4401;
  v19 = 0;
  v20 = 0;
  v21 = 1;
  if (a4)
  {
    v22 = a3;
    v5 = std::__function::__func<-[PHASESessionInterfaceImpl getInputMuteStateForSession:fromCallback:]::$_0,std::allocator<-[PHASESessionInterfaceImpl getInputMuteStateForSession:fromCallback:]::$_0>,caulk::expected<BOOL,int> ()>::operator()((uint64_t)self, &v22);
    v22 = v5;
    v23 = BYTE4(v5);
    caulk::expected<BOOL,int>::swap((char *)&v22, v15 + 48);
    goto LABEL_15;
  }
  if (AudioControlQueue(void)::once != -1)
    dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
  v6 = (id)AudioControlQueue(void)::gAudioControlQueue;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3321888768;
  v24[2] = __70__PHASESessionInterfaceImpl_getInputMuteStateForSession_fromCallback___block_invoke;
  v24[3] = &unk_1E450DD70;
  v24[4] = &v14;
  v7 = v25;
  v8 = (uint64_t)v29;
  if (!v29)
    goto LABEL_8;
  if (v29 != v28)
  {
    v8 = (*(uint64_t (**)(_QWORD *))(*v29 + 16))(v29);
LABEL_8:
    v26 = (_QWORD *)v8;
    goto LABEL_10;
  }
  v26 = v25;
  (*(void (**)(uint64_t, _QWORD *))(v28[0] + 24))((uint64_t)v28, v25);
LABEL_10:
  v27 = a3;
  AT::DispatchBlock(v6, v24, 0, (uint64_t)"-[PHASESessionInterfaceImpl getInputMuteStateForSession:fromCallback:]", (uint64_t)"ATPhasePlatform.mm", 300);

  if (v26 == v25)
  {
    v9 = 4;
  }
  else
  {
    if (!v26)
      goto LABEL_15;
    v9 = 5;
    v7 = v26;
  }
  (*(void (**)(_QWORD *))(*v7 + 8 * v9))(v7);
LABEL_15:
  if (v15[52])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)caulk::expected<BOOL,int>::value((uint64_t)(v15 + 48)));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v14, 8);
  v11 = v29;
  if (v29 == v28)
  {
    v12 = 4;
    v11 = v28;
    goto LABEL_22;
  }
  if (v29)
  {
    v12 = 5;
LABEL_22:
    (*(void (**)(void))(*v11 + 8 * v12))();
  }
  return v10;
}

- (BOOL)setInputMuteStateOnSession:(unsigned int)a3 clientToken:(void *)a4 isMuted:(BOOL)a5
{
  unsigned __int8 v9;
  id v10;
  BOOL v11;
  _QWORD v13[7];
  unsigned int v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  {
    CASIsDarwinOS(void)::global = os_variant_is_darwinos();
  }
  if (!CASIsDarwinOS(void)::global)
  {
    if (AudioControlQueue(void)::once != -1)
      dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
    v10 = (id)AudioControlQueue(void)::gAudioControlQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__PHASESessionInterfaceImpl_setInputMuteStateOnSession_clientToken_isMuted___block_invoke;
    v13[3] = &unk_1E450DDA8;
    v14 = a3;
    v13[5] = &v16;
    v13[6] = a4;
    v15 = a5;
    v13[4] = self;
    AT::DispatchBlock(v10, v13, 0, (uint64_t)"-[PHASESessionInterfaceImpl setInputMuteStateOnSession:clientToken:isMuted:]", (uint64_t)"ATPhasePlatform.mm", 325);

  }
  v11 = *((_DWORD *)v17 + 6) == 0;
  _Block_object_dispose(&v16, 8);
  return v11;
}

- (BOOL)setInputMuteStateFromCallbackOnSession:(unsigned int)a3 clientToken:(void *)a4 isMuted:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  unsigned __int8 v9;
  int v11;
  int v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  PHASESessionInterfaceImpl *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x1E0C80C00];
  {
    CASIsDarwinOS(void)::global = os_variant_is_darwinos();
  }
  if (CASIsDarwinOS(void)::global)
    return 1;
  v11 = AudioSessionSetClientMuteState(v7, 1885888883, (uint64_t)a4, v5);
  if (!v11)
    return 1;
  v12 = v11;
  gPhaseManagerLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = 136316418;
    v15 = "ATPhasePlatform.mm";
    v16 = 1024;
    v17 = 340;
    v18 = 2048;
    v19 = self;
    v20 = 2048;
    v21 = a4;
    v22 = 1024;
    v23 = v5;
    v24 = 1024;
    v25 = v12;
    _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d sessioninterface@%p: error setting client@%p session mute state %u from callback, err = %d", (uint8_t *)&v14, 0x32u);
  }

  return 0;
}

- (BOOL)registerMuteInputClientsInAudioSessionBlock:(id)a3
{
  id v4;
  id muteSessionInputBlock;
  void *v6;
  id v7;

  v4 = a3;
  if (self->_muteSessionInputBlock != v4)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->_callbackMutex);
    muteSessionInputBlock = self->_muteSessionInputBlock;
    self->_muteSessionInputBlock = 0;

    if (v4)
    {
      v6 = (void *)objc_msgSend(v4, "copy");
      v7 = self->_muteSessionInputBlock;
      self->_muteSessionInputBlock = v6;

    }
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->_callbackMutex);
  }

  return 1;
}

- (BOOL)registerFadeClientsInAudioSessionBlock:(id)a3
{
  id v4;
  id fadeSessionOutputBlock;
  void *v6;
  id v7;

  v4 = a3;
  if (self->_fadeSessionOutputBlock != v4)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->_callbackMutex);
    fadeSessionOutputBlock = self->_fadeSessionOutputBlock;
    self->_fadeSessionOutputBlock = 0;

    if (v4)
    {
      v6 = (void *)objc_msgSend(v4, "copy");
      v7 = self->_fadeSessionOutputBlock;
      self->_fadeSessionOutputBlock = v6;

    }
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->_callbackMutex);
  }

  return 1;
}

- (BOOL)registerActivateAudioSessionBlock:(id)a3
{
  id v4;
  id activateSessionBlock;
  void *v6;
  id v7;

  v4 = a3;
  if (self->_activateSessionBlock != v4)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->_callbackMutex);
    activateSessionBlock = self->_activateSessionBlock;
    self->_activateSessionBlock = 0;

    if (v4)
    {
      v6 = (void *)objc_msgSend(v4, "copy");
      v7 = self->_activateSessionBlock;
      self->_activateSessionBlock = v6;

    }
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->_callbackMutex);
  }

  return 1;
}

- (int)fadeClientsInSession:(unsigned int)a3 activating:(BOOL)a4 fadeLevel:(float)a5 fadeTime:(float)a6
{
  _BOOL8 v8;
  uint64_t v9;
  recursive_mutex *p_callbackMutex;
  uint64_t (**fadeSessionOutputBlock)(id, _QWORD, _BOOL8, float, float);
  int v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  PHASESessionInterfaceImpl *v21;
  uint64_t v22;

  v8 = a4;
  v9 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x1E0C80C00];
  p_callbackMutex = &self->_callbackMutex;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_callbackMutex);
  fadeSessionOutputBlock = (uint64_t (**)(id, _QWORD, _BOOL8, float, float))self->_fadeSessionOutputBlock;
  if (fadeSessionOutputBlock)
  {
    v13 = fadeSessionOutputBlock[2](fadeSessionOutputBlock, v9, v8, a5, a6);
  }
  else
  {
    gPhaseManagerLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v16 = 136315650;
      v17 = "ATPhasePlatform.mm";
      v18 = 1024;
      v19 = 408;
      v20 = 2048;
      v21 = self;
      _os_log_impl(&dword_1A0F4D000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d sessioninterface@%p: no fadeClientsInAudioSessionBlock", (uint8_t *)&v16, 0x1Cu);
    }

    v13 = 0;
  }
  std::recursive_mutex::unlock((std::recursive_mutex *)p_callbackMutex);
  return v13;
}

- (void)activateSession:(unsigned int)a3 activate:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  recursive_mutex *p_callbackMutex;
  void (**activateSessionBlock)(id, _QWORD, _BOOL8);
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  PHASESessionInterfaceImpl *v15;
  uint64_t v16;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
  p_callbackMutex = &self->_callbackMutex;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_callbackMutex);
  activateSessionBlock = (void (**)(id, _QWORD, _BOOL8))self->_activateSessionBlock;
  if (activateSessionBlock)
  {
    activateSessionBlock[2](activateSessionBlock, v5, v4);
  }
  else
  {
    gPhaseManagerLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = 136315650;
      v11 = "ATPhasePlatform.mm";
      v12 = 1024;
      v13 = 421;
      v14 = 2048;
      v15 = self;
      _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d sessioninterface@%p: no activateAudioSessionBlock", (uint8_t *)&v10, 0x1Cu);
    }

  }
  std::recursive_mutex::unlock((std::recursive_mutex *)p_callbackMutex);
}

- (int)muteSessionInput:(unsigned int)a3 mute:(BOOL)a4 fadeTime:(float)a5
{
  _BOOL8 v6;
  uint64_t v7;
  recursive_mutex *p_callbackMutex;
  uint64_t (**muteSessionInputBlock)(id, _QWORD, _BOOL8, float);
  int v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  PHASESessionInterfaceImpl *v19;
  uint64_t v20;

  v6 = a4;
  v7 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x1E0C80C00];
  p_callbackMutex = &self->_callbackMutex;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_callbackMutex);
  muteSessionInputBlock = (uint64_t (**)(id, _QWORD, _BOOL8, float))self->_muteSessionInputBlock;
  if (muteSessionInputBlock)
  {
    v11 = muteSessionInputBlock[2](muteSessionInputBlock, v7, v6, a5);
  }
  else
  {
    gPhaseManagerLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315650;
      v15 = "ATPhasePlatform.mm";
      v16 = 1024;
      v17 = 434;
      v18 = 2048;
      v19 = self;
      _os_log_impl(&dword_1A0F4D000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d sessioninterface@%p: no muteSessionInputBlock", (uint8_t *)&v14, 0x1Cu);
    }

    v11 = 0;
  }
  std::recursive_mutex::unlock((std::recursive_mutex *)p_callbackMutex);
  return v11;
}

- (id)lazyInitSessionVolumeInterface
{
  return self->_sessionVolumeImpl;
}

- (void).cxx_destruct
{
  _QWORD *next;
  _QWORD *v4;
  void **value;

  next = self->audioSessionInputClients.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (_QWORD *)*next;
      std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)(next + 3));
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->audioSessionInputClients.__table_.__bucket_list_.__ptr_.__value_;
  self->audioSessionInputClients.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  objc_storeStrong(&self->_sessionVolumeImpl, 0);
  objc_storeStrong(&self->_activateSessionBlock, 0);
  objc_storeStrong(&self->_fadeSessionOutputBlock, 0);
  objc_storeStrong(&self->_muteSessionInputBlock, 0);
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)&self->_callbackMutex);
  objc_destroyWeak((id *)&self->_phasePlatform);
}

- (id).cxx_construct
{
  MEMORY[0x1A1B07918](&self->_callbackMutex, a2);
  self->audioSessionInputClients.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->audioSessionInputClients.__table_.__p1_.__value_.__next_ = 0u;
  self->audioSessionInputClients.__table_.__p3_.__value_ = 1.0;
  return self;
}

void __76__PHASESessionInterfaceImpl_setInputMuteStateOnSession_clientToken_isMuted___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = AudioSessionSetClientMuteState(*(unsigned int *)(a1 + 56), 1885888883, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 60));
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    gPhaseManagerLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 48);
      v4 = *(unsigned __int8 *)(a1 + 60);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v7 = 136316418;
      v8 = "ATPhasePlatform.mm";
      v9 = 1024;
      v10 = 323;
      v11 = 2048;
      v12 = v5;
      v13 = 2048;
      v14 = v3;
      v15 = 1024;
      v16 = v4;
      v17 = 1024;
      v18 = v6;
      _os_log_impl(&dword_1A0F4D000, v2, OS_LOG_TYPE_ERROR, "%25s:%-5d sessioninterface@%p: error setting client@%p session mute state %u, err = %d", (uint8_t *)&v7, 0x32u);
    }

  }
}

- (uint64_t)getInputMuteStateForSession:fromCallback:
{
  unsigned int v2;
  AT::SessionFacade *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  AQMESession v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *a2;
  AQMESession::AQMESession(&v12, *a2, 0);
  v4 = AT::SessionFacade::global(v3);
  v5 = (*(uint64_t (**)(uint64_t, AQMESession *))(*(_QWORD *)v4 + 64))(v4, &v12);
  v6 = v5;
  v13 = v5;
  v7 = v5 & 0xFF00000000;
  gPhaseManagerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v9)
      goto LABEL_7;
    caulk::expected<BOOL,int>::value((uint64_t)&v13);
    *(_DWORD *)buf = 136315906;
    v15 = "ATPhasePlatform.mm";
    v16 = 1024;
    v17 = 281;
    v18 = 1024;
    v19 = v13;
    v20 = 1024;
    v21 = v2;
    v10 = "%25s:%-5d getInputMuteStateForSession mute=%d for session=0x%x";
  }
  else
  {
    if (!v9)
      goto LABEL_7;
    *(_DWORD *)buf = 136315906;
    v15 = "ATPhasePlatform.mm";
    v16 = 1024;
    v17 = 285;
    v18 = 1024;
    v19 = v6;
    v20 = 1024;
    v21 = v2;
    v10 = "%25s:%-5d error %i getting mute value in getInputMuteStateForSession for session=0x%x";
  }
  _os_log_impl(&dword_1A0F4D000, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0x1Eu);
LABEL_7:

  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v12.mDescription.var0);
  if (*((char *)&v12.mDescription.__r_.__value_.var0.__l + 23) < 0)
    operator delete(v12.mDescription.__r_.__value_.var0.__l.__data_);
  if (v12.mSubsessionRef.mCFObject)
    CFRelease(v12.mSubsessionRef.mCFObject);
  return v13;
}

char *__70__PHASESessionInterfaceImpl_getInputMuteStateForSession_fromCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int v6;
  int v7;
  char v8;

  v6 = *(_DWORD *)(a1 + 72);
  v2 = *(_QWORD *)(a1 + 64);
  if (!v2)
    std::__throw_bad_function_call[abi:ne180100]();
  v3 = (*(uint64_t (**)(uint64_t, int *))(*(_QWORD *)v2 + 48))(v2, &v6);
  v4 = (char *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  v8 = BYTE4(v3);
  v7 = v3;
  return caulk::expected<BOOL,int>::swap((char *)&v7, v4);
}

- (void)getInputMuteStateForSession:fromCallback:
{
  *a2 = &off_1E450DDD8;
}

- (_QWORD)getInputMuteStateForSession:fromCallback:
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E450DDD8;
  return result;
}

void __92__PHASESessionInterfaceImpl_setClientStateOnSession_clientToken_modes_state_outDuckingInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(WeakRetained, "setClientStateFromCallbackOnSession:clientToken:modes:state:outDuckingInfo:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 68), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 56));
    WeakRetained = v3;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

@end
