@implementation AVAudioMicrophoneMonitor

- (BOOL)setState:(BOOL)a3 clientType:(int64_t)a4 clientID:(unint64_t)a5 clientDescription:(const char *)a6
{
  _BOOL4 v9;
  std::mutex *v11;
  unsigned __int8 v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  AVAudioMicrophoneMonitor *v18;
  BOOL result;
  void *v20;
  void *v21;
  __int128 __p;
  uint64_t v23;
  void *v24;

  v9 = a3;
    return 0;
  v11 = (std::mutex *)((char *)self + 32);
  std::mutex::lock((std::mutex *)((char *)self + 32));
  if (!v9)
  {
    *(_QWORD *)&__p = a4;
    *((_QWORD *)&__p + 1) = a5;
    v18 = (AVAudioMicrophoneMonitor *)std::__tree<std::pair<AVAudioMicrophoneMonitorClientType,unsigned long long>>::find<std::pair<AVAudioMicrophoneMonitorClientType,unsigned long long>>((uint64_t)self + 8, (uint64_t *)&__p);
    if ((AVAudioMicrophoneMonitor *)((char *)self + 16) == v18
      || (std::__tree<std::pair<AVAudioMicrophoneMonitorClientType,unsigned long long>>::__remove_node_pointer((uint64_t **)self + 1, (uint64_t *)v18), operator delete(v18), *((_QWORD *)self + 3)))
    {
      v13 = 0;
    }
    else
    {
      v13 = 1;
    }
    goto LABEL_22;
  }
  *(_QWORD *)&__p = a4;
  *((_QWORD *)&__p + 1) = a5;
  std::__tree<std::pair<AVAudioMicrophoneMonitorClientType,unsigned long long>>::__emplace_unique_key_args<std::pair<AVAudioMicrophoneMonitorClientType,unsigned long long>,std::pair<AVAudioMicrophoneMonitorClientType,unsigned long long>>((uint64_t **)self + 1, (uint64_t *)&__p, &__p);
  v13 = v12;
  if (v12)
  if (a6)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)a6);
    if (v23 >= 0)
      v14 = HIBYTE(v23);
    else
      v14 = *((_QWORD *)&__p + 1);
    if (SHIBYTE(v23) < 0)
      operator delete((void *)__p);
    if (!v14)
      a6 = 0;
  }
  *(_QWORD *)&__p = 0;
  *((_QWORD *)&__p + 1) = &__p;
  v23 = 0x2020000000;
  v15 = getMSNMonitorSetLastMicrophoneClientSymbolLoc(void)::ptr;
  v24 = getMSNMonitorSetLastMicrophoneClientSymbolLoc(void)::ptr;
  if (!getMSNMonitorSetLastMicrophoneClientSymbolLoc(void)::ptr)
  {
    v16 = MediaSafetyNetLibrary();
    v15 = dlsym(v16, "MSNMonitorSetLastMicrophoneClient");
    *(_QWORD *)(*((_QWORD *)&__p + 1) + 24) = v15;
    getMSNMonitorSetLastMicrophoneClientSymbolLoc(void)::ptr = v15;
  }
  _Block_object_dispose(&__p, 8);
  if (v15)
  {
    ((void (*)(const char *))v15)(a6);
LABEL_22:
    v17 = v13 != 0;
    std::mutex::unlock(v11);
    return v17;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void ATMSNMonitorSetLastMicrophoneClient(const char *)");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("MSNSoftLink.h"), 23, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (id)sharedInstance
{
  unsigned __int8 v2;

  {
    +[AVAudioMicrophoneMonitor sharedInstance]::gShared = objc_alloc_init(AVAudioMicrophoneMonitor);
  }
  return (id)+[AVAudioMicrophoneMonitor sharedInstance]::gShared;
}

- (AVAudioMicrophoneMonitor)init
{
  objc_super v4;

  {
    v4.receiver = self;
    v4.super_class = (Class)AVAudioMicrophoneMonitor;
    return -[AVAudioMicrophoneMonitor init](&v4, sel_init);
  }
  else
  {

    return 0;
  }
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 32));
  std::__tree<std::pair<AVAudioMicrophoneMonitorClientType,unsigned long long>>::destroy((uint64_t)self + 8, *((_QWORD **)self + 2));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 850045863;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_QWORD *)self + 11) = 0;
  return self;
}

@end
