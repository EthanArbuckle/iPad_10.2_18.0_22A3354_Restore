@implementation AURemoteHost

- (id)_getBus:(unsigned int)a3 scope:(unsigned int)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a4 == 2)
  {
    -[AUAudioUnit outputBusses](self->_audioUnit, "outputBusses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 1)
    {
      v8 = 0;
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10866, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v9 = 0;
        *a5 = v10;
        goto LABEL_13;
      }
LABEL_12:
      v9 = 0;
      goto LABEL_13;
    }
    -[AUAudioUnit inputBusses](self->_audioUnit, "inputBusses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  if (objc_msgSend(v7, "count") <= (unint64_t)a3)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10877, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_msgSend(v8, "objectAtIndexedSubscript:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v9;
}

- (BOOL)_identifyBus:(id)a3 scope:(unsigned int *)a4 element:(unsigned int *)a5
{
  AUAudioUnit *v8;
  AUAudioUnit *audioUnit;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  BOOL v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = (AUAudioUnit *)a3;
  audioUnit = self->_audioUnit;
  if (audioUnit == v8)
  {
    *a4 = 0;
    *a5 = 0;
LABEL_22:
    v22 = 1;
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[AUAudioUnit inputBusses](audioUnit, "inputBusses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v11)
    {
      v12 = 0;
      v13 = *(_QWORD *)v29;
      while (2)
      {
        v14 = 0;
        v15 = v12;
        v12 += v11;
        do
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          if (*(AUAudioUnit **)(*((_QWORD *)&v28 + 1) + 8 * v14) == v8)
          {
            *a4 = 1;
            *a5 = v15 + v14;

            goto LABEL_22;
          }
          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v11)
          continue;
        break;
      }
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[AUAudioUnit outputBusses](self->_audioUnit, "outputBusses", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v17)
    {
      v18 = 0;
      v19 = *(_QWORD *)v25;
      while (2)
      {
        v20 = 0;
        v21 = v18;
        v18 += v17;
        do
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          if (*(AUAudioUnit **)(*((_QWORD *)&v24 + 1) + 8 * v20) == v8)
          {
            *a4 = 1;
            *a5 = v21 + v20;

            goto LABEL_22;
          }
          ++v20;
        }
        while (v17 != v20);
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v17)
          continue;
        break;
      }
    }

    v22 = 0;
  }

  return v22;
}

- (AURemoteHost)initWithConnection:(id)a3 config:(id)a4 timeOutHandler:(function<void)(
{
  id v8;
  AURemoteHost *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *propertyObserverQueue;
  uint64_t v12;
  NSMutableArray *pendingChangedProperties;
  uint64_t v14;
  NSUUID *audioUnitUUID;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  AURemoteHost *v26;
  ServiceProcessGlobals *v28;
  objc_super v29;
  _BYTE v30[24];
  _BYTE *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  +[AURemoteHost _staticInit](AURemoteHost, "_staticInit");
  v29.receiver = self;
  v29.super_class = (Class)AURemoteHost;
  v9 = -[AURemoteHost init](&v29, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create("AUExtension.propertyObserver", 0);
    propertyObserverQueue = v9->_propertyObserverQueue;
    v9->_propertyObserverQueue = (OS_dispatch_queue *)v10;

    v12 = objc_opt_new();
    pendingChangedProperties = v9->_pendingChangedProperties;
    v9->_pendingChangedProperties = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v9->_remoteHostXPCConnection, a3);
    v14 = objc_opt_new();
    audioUnitUUID = v9->_audioUnitUUID;
    v9->_audioUnitUUID = (NSUUID *)v14;

    if ((v16 & 1) == 0)
    {
      if ((_DWORD)v28)
      {
        ServiceProcessGlobals::ServiceProcessGlobals(v28);
      }
    }
    v17 = ServiceProcessGlobals::instance(void)::global;
    v18 = ServiceProcessGlobals::instance(void)::global;
    if (ServiceProcessGlobals::instance(void)::global)
    {
      v19 = (unint64_t *)(ServiceProcessGlobals::instance(void)::global + 8);
      do
        v20 = __ldxr(v19);
      while (__stxr(v20 + 1, v19));
    }
    cntrl = (std::__shared_weak_count *)v9->_workgroupMirror.__cntrl_;
    v9->_workgroupMirror.__ptr_ = (WorkgroupMirror *)v17;
    v9->_workgroupMirror.__cntrl_ = (__shared_weak_count *)v18;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v23 = __ldaxr(p_shared_owners);
      while (__stlxr(v23 - 1, p_shared_owners));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v30, (uint64_t)a5);
    caulk::xpc::reply_watchdog_factory::init2();
    v24 = v31;
    if (v31 == v30)
    {
      v25 = 4;
      v24 = v30;
    }
    else
    {
      if (!v31)
      {
LABEL_16:
        v26 = v9;
        goto LABEL_17;
      }
      v25 = 5;
    }
    (*(void (**)(void))(*v24 + 8 * v25))();
    goto LABEL_16;
  }
LABEL_17:

  return v9;
}

- (AURemoteHost)initWithConnection:(id)a3 config:(id)a4
{
  AURemoteHost *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &off_1E29137A0;
  v9 = v8;
  v4 = -[AURemoteHost initWithConnection:config:timeOutHandler:](self, "initWithConnection:config:timeOutHandler:", a3, a4, v8);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_5;
  }
  if (v9)
  {
    v6 = 5;
LABEL_5:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return v4;
}

- (id)_getSpeechSynthesisProviderAudioUnit
{
  AUAudioUnit *audioUnit;

  if (-[AUAudioUnit isSpeechSynthesisProvider](self->_audioUnit, "isSpeechSynthesisProvider"))
    audioUnit = self->_audioUnit;
  else
    audioUnit = 0;
  return audioUnit;
}

- (void)close:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSXPCConnection *remoteHostXPCConnection;
  void (**v8)(id, _QWORD);

  v4 = a3;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v4);
  v8 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();

  KVOAggregator::removeAllObservations(&self->_kvoAggregator, &self->super);
  -[AUAudioUnit setProfileChangedBlock:](self->_audioUnit, "setProfileChangedBlock:", 0);
  -[AURemoteHost _getSpeechSynthesisProviderAudioUnit](self, "_getSpeechSynthesisProviderAudioUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setSpeechSynthesisOutputMetadataBlock:", 0);

  remoteHostXPCConnection = self->_remoteHostXPCConnection;
  self->_remoteHostXPCConnection = 0;

  v8[2](v8, 0);
}

- (void)dealloc
{
  XOSTransactor *value;
  NSObject *presetFolderWatcher;
  OS_dispatch_source *v5;
  OS_dispatch_queue *presetMonitoringQueue;
  void *v7;
  void *v8;
  __end_ **begin;
  __end_cap_ **var0;
  __end_ *v11;
  __end_ **v12;
  void *v13;
  objc_super v14;

  value = self->_transactorIO.__ptr_.__value_;
  if (value)
    XOSTransactor::endTransaction(value);
  presetFolderWatcher = self->_presetFolderWatcher;
  if (presetFolderWatcher)
  {
    dispatch_source_cancel(presetFolderWatcher);
    v5 = self->_presetFolderWatcher;
    self->_presetFolderWatcher = 0;

    presetMonitoringQueue = self->_presetMonitoringQueue;
    self->_presetMonitoringQueue = 0;

  }
  +[AUAudioUnitProperty propertyWithKey:](AUAudioUnitProperty, "propertyWithKey:", CFSTR("inputBusses"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AURemoteHost removePropertyObserver:context:reply:](self, "removePropertyObserver:context:reply:", v7, self, &__block_literal_global_11);

  +[AUAudioUnitProperty propertyWithKey:](AUAudioUnitProperty, "propertyWithKey:", CFSTR("outputBusses"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AURemoteHost removePropertyObserver:context:reply:](self, "removePropertyObserver:context:reply:", v8, self, &__block_literal_global_14);

  if (self->_renderServerUser.__engaged_)
  {
    AUOOPRenderingServerUser::~AUOOPRenderingServerUser((AUOOPRenderingServerUser *)&self->_renderServerUser);
    self->_renderServerUser.__engaged_ = 0;
  }
  KVOAggregator::removeAllObservations(&self->_kvoAggregator, &self->super);
  begin = self->_remoteMessageChannels.__begin_;
  var0 = self->_remoteMessageChannels.var0;
  if (begin != var0)
  {
    do
    {
      v11 = *begin;
      -[__end_ retainSelfIfRequired](v11, "retainSelfIfRequired");

      ++begin;
    }
    while (begin != var0);
    v12 = self->_remoteMessageChannels.__begin_;
    begin = self->_remoteMessageChannels.var0;
    if (begin != v12)
    {
      do
      {
        v13 = *--begin;

      }
      while (begin != v12);
      begin = v12;
    }
  }
  self->_remoteMessageChannels.var0 = begin;
  v14.receiver = self;
  v14.super_class = (Class)AURemoteHost;
  -[AURemoteHost dealloc](&v14, sel_dealloc);
}

- (void)setBlocks
{
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self->_remoteHostXPCConnection);
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__AURemoteHost_setBlocks__block_invoke;
  v7[3] = &unk_1E2919B18;
  objc_copyWeak(&v8, &location);
  -[AUAudioUnit setProfileChangedBlock:](self->_audioUnit, "setProfileChangedBlock:", v7);
  -[AURemoteHost _getSpeechSynthesisProviderAudioUnit](self, "_getSpeechSynthesisProviderAudioUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __25__AURemoteHost_setBlocks__block_invoke_3;
    v5[3] = &unk_1E2919B40;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "setSpeechSynthesisOutputMetadataBlock:", v5);
    objc_destroyWeak(&v6);
  }

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)openImpl:(id)a3 reply:(id)a4
{
  id v5;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  char v14;
  int i;
  std::string *v16;
  objc_class *v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  NSObject *v22;
  const char *Name;
  size_t size;
  size_t v25;
  uint8_t *v26;
  std::string *p_p;
  uint8_t *v28;
  objc_class *Superclass;
  AUAudioUnitBusArray *v30;
  void *v31;
  AUAudioUnitBusArray *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  char v41;
  int v42;
  mach_timebase_info info;
  std::string v44;
  std::string __p;
  char __str[8];
  uint64_t v47;
  _QWORD v48[2];
  uint8_t buf[32];
  uint64_t v50;

  v5 = a3;
  v50 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v39 = a4;
  objc_storeStrong((id *)&self->_audioUnit, v5);

  objc_msgSend(v40, "setLoadedOutOfProcess");
  LODWORD(v5) = getpid();
  v7 = operator new();
  *(_BYTE *)v7 = 1;
  *(_QWORD *)(v7 + 8) = "AUHostingService";
  *(_DWORD *)(v7 + 16) = (_DWORD)v5;
  *(_QWORD *)(v7 + 24) = 0;
  std::unique_ptr<XOSTransactor>::reset[abi:ne180100]((uint64_t *)&self->_transactorIO, v7);
  XOSTransactor::beginTransaction(self->_transactorIO.__ptr_.__value_);
  -[AURemoteHost setBlocks](self, "setBlocks");
  -[AUAudioUnit renderBlock](self->_audioUnit, "renderBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[AUAudioUnitProperty propertyWithKey:](AUAudioUnitProperty, "propertyWithKey:", CFSTR("inputBusses"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AURemoteHost addPropertyObserver:context:reply:](self, "addPropertyObserver:context:reply:", v9, self, &__block_literal_global_23);

  +[AUAudioUnitProperty propertyWithKey:](AUAudioUnitProperty, "propertyWithKey:", CFSTR("outputBusses"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AURemoteHost addPropertyObserver:context:reply:](self, "addPropertyObserver:context:reply:", v10, self, &__block_literal_global_24);

  mach_timebase_info(&info);
  v11 = v40;
  if (v40)
  {
    objc_msgSend(v40, "componentDescription");
    if (v42 == 760105261)
    {
      v12 = 0;
      v13 = 0;
      v48[0] = "NICocoaWindow";
      v48[1] = "NICocoaPanel";
      do
      {
        v14 = v12;
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)v48[v13]);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&v44, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        else
          v44 = __p;
        v41 = v14;
        for (i = 1; ; ++i)
        {
          v16 = (v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
              ? &v44
              : (std::string *)v44.__r_.__value_.__r.__words[0];
          v17 = objc_lookUpClass((const char *)v16);
          if (!v17)
            break;
          if ((v18 & 1) == 0
          {
            native_instruments_window_workaround(AudioComponentDescription const&)::$_0::operator() const(objc_class *)::sel_canBecomeKeyWindow = (uint64_t)sel_registerName("canBecomeKeyWindow");
          }
          if ((v19 & 1) == 0
          {
            native_instruments_window_workaround(AudioComponentDescription const&)::$_0::operator() const(objc_class *)::sel_canBecomeMainWindow = (uint64_t)sel_registerName("canBecomeMainWindow");
          }
          if ((v20 & 1) == 0
          {
            Superclass = class_getSuperclass(v17);
            native_instruments_window_workaround(AudioComponentDescription const&)::$_0::operator() const(objc_class *)::imp_valueForKey = (uint64_t (*)(_QWORD, _QWORD, _QWORD))class_getMethodImplementation(Superclass, sel_valueForKey_);
          }
          if ((char *)class_getMethodImplementation(v17, sel_valueForKey_) != (char *)native_instruments_window_workaround(AudioComponentDescription const&)::$_0::operator() const(objc_class *)::{lambda(objc_object *,objc_selector *,NSString *)#1}::__invoke)
          {
            class_replaceMethod(v17, sel_valueForKey_, (IMP)native_instruments_window_workaround(AudioComponentDescription const&)::$_0::operator() const(objc_class *)::{lambda(objc_object *,objc_selector *,NSString *)#1}::__invoke, "@@:");
            {
              caulk::log_category::log_category((caulk::log_category *)&auhs_log_category(void)::category, "com.apple.coreaudio", "AUHostingService");
            }
            v22 = objc_retainAutorelease((id)auhs_log_category(void)::category);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              Name = class_getName(v17);
              *(_DWORD *)buf = 136315650;
              *(_QWORD *)&buf[4] = "AURemoteExtensionContext.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 313;
              *(_WORD *)&buf[18] = 2080;
              *(_QWORD *)&buf[20] = Name;
              _os_log_impl(&dword_18EE07000, v22, OS_LOG_TYPE_INFO, "%25s:%-5d Treating NICocoaWindow class: %s", buf, 0x1Cu);
            }

          }
          *(_QWORD *)__str = 0;
          v47 = 0;
          snprintf(__str, 0x10uLL, "%04d", i);
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          else
            size = __p.__r_.__value_.__l.__size_;
          v25 = strlen(__str);
          std::string::basic_string[abi:ne180100]((uint64_t)buf, size + v25);
          if ((buf[23] & 0x80u) == 0)
            v26 = buf;
          else
            v26 = *(uint8_t **)buf;
          if (size)
          {
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              p_p = &__p;
            else
              p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
            memmove(v26, p_p, size);
          }
          v28 = &v26[size];
          if (v25)
            memmove(v28, __str, v25);
          v28[v25] = 0;
          if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v44.__r_.__value_.__l.__data_);
          v44 = *(std::string *)buf;
        }
        if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v44.__r_.__value_.__l.__data_);
        v11 = v40;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        v12 = 1;
        v13 = 1;
      }
      while ((v41 & 1) == 0);
    }
  }
  objc_msgSend(v11, "inputBusses");
  v30 = (AUAudioUnitBusArray *)objc_claimAutoreleasedReturnValue();
  MarshalBusArray(v30, 1u);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "outputBusses");
  v32 = (AUAudioUnitBusArray *)objc_claimAutoreleasedReturnValue();
  MarshalBusArray(v32, 2u);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "inputBusses");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isCountChangeable");
  objc_msgSend(v40, "outputBusses");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "isCountChangeable");
  LODWORD(v38) = getpid();
  (*((void (**)(id, _QWORD, BOOL, _QWORD, void *, void *, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))v39 + 2))(v39, 0, v8 != 0, 0, v31, v33, v35, v37, v38, info.numer, info.denom);

}

- (void)open:(AudioComponentDescription *)a3 instanceUUID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  AUAudioUnit *audioUnit;
  void (**v16)(_QWORD);
  pid_t v17;
  _QWORD v18[5];
  id v19;
  __int128 v20;
  UInt32 componentFlagsMask;
  id v22;
  void *v23;
  _QWORD aBlock[4];
  id v25;
  id v26;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  if (self->_replyWatchdogFactory.mDebugging)
  {
    v11 = _Block_copy(v9);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorbbU8__strongP7NSArrayS8_bbimmEEEU13block_pointerFvDpT_ESC_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c162_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorbbU8__strongP7NSArrayS8_bbimmEEEU13block_pointerFvDpT_ESC_iEUlS4_bbS7_S7_bbimmE__e62_v68__0__NSError_8B16B20__NSArray_24__NSArray_32B40B44i48Q52Q60l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    v23 = _Block_copy(v9);
    v25 = v22;
    v26 = _Block_copy(v23);
    v11 = _Block_copy(aBlock);

    v12 = v25;
    v25 = 0;

    v13 = v22;
    v22 = 0;

  }
  -[AURemoteHost audioUnitUUID](self, "audioUnitUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqual:", v8))
  {
    audioUnit = self->_audioUnit;

    if (audioUnit)
    {
      -[AURemoteHost openImpl:reply:](self, "openImpl:reply:", self->_audioUnit, v11);
      goto LABEL_12;
    }
  }
  else
  {

  }
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __40__AURemoteHost_open_instanceUUID_reply___block_invoke;
  v18[3] = &unk_1E2919BB0;
  v20 = *(_OWORD *)&a3->componentType;
  componentFlagsMask = a3->componentFlagsMask;
  v18[4] = self;
  v19 = v11;
  v16 = (void (**)(_QWORD))_Block_copy(v18);
  v17 = -[NSXPCConnection processIdentifier](self->_remoteHostXPCConnection, "processIdentifier");
  if (v17 == getpid())
    v16[2](v16);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v16);

LABEL_12:
}

- (void)getBusses:(unsigned int)a3 reply:(id)a4
{
  id v6;
  AUAudioUnit *audioUnit;
  AUAudioUnitBusArray *v8;
  void *v9;
  void (**v10)(id, _QWORD, void *);

  v6 = a4;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v6);
  v10 = (void (**)(id, _QWORD, void *))objc_claimAutoreleasedReturnValue();

  audioUnit = self->_audioUnit;
  if (a3 == 1)
    -[AUAudioUnit inputBusses](audioUnit, "inputBusses");
  else
    -[AUAudioUnit outputBusses](audioUnit, "outputBusses");
  v8 = (AUAudioUnitBusArray *)objc_claimAutoreleasedReturnValue();
  MarshalBusArray(v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, 0, v9);

}

- (void)initialize:(unint64_t)a3 reply:(id)a4
{
  char v4;
  id v6;
  optional<AUOOPRenderingServerUser> *v7;
  id v8;
  AUAudioUnit *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  unint64_t v16;
  BOOL v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id mRetainedRenderBlock;
  AUAudioUnit *audioUnit;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  OS_voucher *v37;
  OS_voucher *initializationVoucher;
  AUAudioUnit *v39;
  void (**v40)(void *, id, uint64_t, id, uint64_t, void *, BOOL, _QWORD);
  void **p_aBlock;
  uint64_t v42;
  id v43;
  id v44[2];
  void *aBlock;
  uint64_t v46;
  void *v47;
  void *v48;
  optional<AUOOPRenderingServerUser> *p_renderServerUser;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, unint64_t, char, MIDI::EventList *);
  void *v54;
  optional<AUOOPRenderingServerUser> *v55;

  v4 = a3;
  v6 = a4;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    v40 = (void (**)(void *, id, uint64_t, id, uint64_t, void *, BOOL, _QWORD))_Block_copy(v6);
  }
  else
  {
    aBlock = (void *)MEMORY[0x1E0C809B0];
    v46 = 3321888768;
    v47 = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrormmmU8__strongP6NSDatabjEEEU13block_pointerFvDpT_ESC_i_block_invoke;
    v48 = &__block_descriptor_48_ea8_32c151_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrormmmU8__strongP6NSDatabjEEEU13block_pointerFvDpT_ESC_iEUlS4_mmmS7_bjE__e43_v56__0__NSError_8Q16Q24Q32__NSData_40B48I52l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    v52 = (uint64_t)_Block_copy(v6);
    p_renderServerUser = (optional<AUOOPRenderingServerUser> *)v51;
    v50 = _Block_copy((const void *)v52);
    v40 = (void (**)(void *, id, uint64_t, id, uint64_t, void *, BOOL, _QWORD))_Block_copy(&aBlock);

    v7 = p_renderServerUser;
    p_renderServerUser = 0;

    v8 = v51;
    v51 = 0;

  }
  PropertyNotificationDeferrer::PropertyNotificationDeferrer((PropertyNotificationDeferrer *)v44, self);
  if (self->_renderServerUser.__engaged_)
  {
    AUOOPRenderingServerUser::~AUOOPRenderingServerUser((AUOOPRenderingServerUser *)&self->_renderServerUser);
    self->_renderServerUser.__engaged_ = 0;
  }
  v39 = self->_audioUnit;
  BaseOpaqueObject::BaseOpaqueObject((BaseOpaqueObject *)&self->_renderServerUser);
  self->_renderServerUser.var0.__val_.mRetainedRenderBlock = 0;
  self->_renderServerUser.var0.__val_._vptr$CAPrint = (void **)&off_1E2908C28;
  self->_renderServerUser.var0.__val_.mAUAudioUnit = v39;
  self->_renderServerUser.var0.__val_.mRenderBlock = 0;
  v9 = v39;
  if (!-[AUAudioUnit canProcessInPlace](v9, "canProcessInPlace", v39))
    goto LABEL_12;
  -[AUAudioUnit inputBusses](v9, "inputBusses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  -[AUAudioUnit outputBusses](v9, "outputBusses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v11 == v13)
  {
    v14 = 0;
    while (1)
    {
      -[AUAudioUnit inputBusses](v9, "inputBusses");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      v17 = v16 > v14;
      v18 = v16 <= v14;
      if (!v17)
        break;
      -[AUAudioUnit inputBusses](v9, "inputBusses");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "format");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[AUAudioUnit outputBusses](v9, "outputBusses");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", v14);
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v23, "format");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v23) = objc_msgSend(v21, "isEqual:", v24);
      ++v14;
      if ((v23 & 1) == 0)
        goto LABEL_12;
    }
  }
  else
  {
LABEL_12:
    v18 = 0;
  }

  self->_renderServerUser.var0.__val_.mCanProcessInPlace = v18;
  objc_opt_class();
  self->_renderServerUser.var0.__val_.mIsV2AudioUnit = objc_opt_isKindOfClass() & 1;
  self->_renderServerUser.var0.__val_.mMIDIOutBaseSampleTime = 0;
  self->_renderServerUser.var0.__val_.mEventSchedule = (AUEventSchedule *)-[AUAudioUnit eventSchedule](v9, "eventSchedule");
  self->_renderServerUser.var0.__val_.mSharedBuffers = 0;
  self->_renderServerUser.var0.__val_.mRenderThreadId.var0.__null_state_ = 0;
  self->_renderServerUser.var0.__val_.mRenderThreadId.__engaged_ = 0;
  AUOOPRenderingServerUser::updateHostCallbacks((AUOOPRenderingServerUser *)&self->_renderServerUser, v4);
  if ((v4 & 4) != 0)
  {
    aBlock = (void *)MEMORY[0x1E0C809B0];
    v46 = 3221225472;
    v47 = ___ZN24AUOOPRenderingServerUserC2EP11AUAudioUnitm_block_invoke;
    v48 = &__block_descriptor_40_e18_i36__0q8C16q20r_28l;
    p_renderServerUser = &self->_renderServerUser;
    -[AUAudioUnit setMIDIOutputEventBlock:](self->_renderServerUser.var0.__val_.mAUAudioUnit, "setMIDIOutputEventBlock:", &aBlock);
  }
  else
  {
    -[AUAudioUnit setMIDIOutputEventBlock:](self->_renderServerUser.var0.__val_.mAUAudioUnit, "setMIDIOutputEventBlock:", 0);
  }
  if ((v4 & 8) != 0)
  {
    v51 = (id)MEMORY[0x1E0C809B0];
    v52 = 3221225472;
    v53 = ___ZN24AUOOPRenderingServerUserC2EP11AUAudioUnitm_block_invoke_2;
    v54 = &__block_descriptor_40_e61_i28__0q8C16r__MIDIEventList_iI_1_MIDIEventPacket_QI_64I____20l;
    v55 = &self->_renderServerUser;
    -[AUAudioUnit setMIDIOutputEventListBlock:](self->_renderServerUser.var0.__val_.mAUAudioUnit, "setMIDIOutputEventListBlock:", &v51);
  }
  else
  {
    -[AUAudioUnit setMIDIOutputEventListBlock:](self->_renderServerUser.var0.__val_.mAUAudioUnit, "setMIDIOutputEventListBlock:", 0);
  }
  -[AUAudioUnit internalRenderBlock](self->_renderServerUser.var0.__val_.mAUAudioUnit, "internalRenderBlock");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  mRetainedRenderBlock = self->_renderServerUser.var0.__val_.mRetainedRenderBlock;
  self->_renderServerUser.var0.__val_.mRetainedRenderBlock = v25;

  self->_renderServerUser.var0.__val_.mRenderBlock = self->_renderServerUser.var0.__val_.mRetainedRenderBlock;
  self->_renderServerUser.__engaged_ = 1;
  audioUnit = self->_audioUnit;
  v43 = 0;
  -[AUAudioUnit allocateRenderResourcesAndReturnError:](audioUnit, "allocateRenderResourcesAndReturnError:", &v43);
  v28 = v43;
  v51 = 0;
  v42 = 0;
  if (v28)
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
  }
  else
  {
    LODWORD(v31) = -[AUAudioUnit maximumFramesToRender](self->_audioUnit, "maximumFramesToRender");
    -[AUAudioUnit inputBusses](self->_audioUnit, "inputBusses");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (id)objc_msgSend(v33, "count");

    -[AUAudioUnit outputBusses](self->_audioUnit, "outputBusses");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v34, "count");

    aBlock = 0;
    v46 = 0;
    v47 = 0;
    p_aBlock = &aBlock;
    -[AUAudioUnit inputBusses](self->_audioUnit, "inputBusses");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[AURemoteHost initialize:reply:]::$_2::operator()(&p_aBlock, v35, &v51);

    -[AUAudioUnit outputBusses](self->_audioUnit, "outputBusses");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AURemoteHost initialize:reply:]::$_2::operator()(&p_aBlock, v36, &v42);

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", aBlock, v46 - (_QWORD)aBlock);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (OS_voucher *)voucher_copy();
    initializationVoucher = self->_initializationVoucher;
    self->_initializationVoucher = v37;

    maintainWakeMonitor(1);
    v31 = v31;
    if (aBlock)
    {
      v46 = (uint64_t)aBlock;
      operator delete(aBlock);
    }
    v30 = v51;
    v29 = v42;
  }
  v40[2](v40, v28, v31, v30, v29, v32, -[AUAudioUnit canProcessInPlace](self->_audioUnit, "canProcessInPlace"), self->_renderServerUser.var0.__val_.mSerialNum);

  PropertyNotificationDeferrer::~PropertyNotificationDeferrer(v44);
}

- (void)updateHostCallbacks:(unint64_t)a3 reply:(id)a4
{
  char v4;
  void (**v6)(id, _QWORD);

  v4 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (self->_renderServerUser.__engaged_)
    AUOOPRenderingServerUser::updateHostCallbacks((AUOOPRenderingServerUser *)&self->_renderServerUser, v4);
  v6[2](v6, 0);

}

- (void)updateWorkgroupMirror:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  WorkgroupMirror *ptr;
  id v9;
  xpc_object_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  ptr = self->_workgroupMirror.__ptr_;
  v9 = v6;
  v10 = v9;
  if (!v9)
    v10 = xpc_null_create();

  v11 = v10;
  v12 = v11;
  v14 = v11;
  if (!v11 || object_getClass(v11) != (Class)MEMORY[0x1E0C812F8])
  {
    v14 = xpc_null_create();

  }
  auoop::WorkgroupMirror::update((auoop::WorkgroupMirror *)ptr, (const applesauce::xpc::dict *)&v14);
  v13 = v14;
  v14 = 0;

  v7[2](v7, 0);
}

- (void)createRenderPipe:(int)a3 formats:(id)a4 maxFrames:(unsigned int)a5 midiOutSizeHint:(unsigned int)a6 resources:(id)a7 reply:(id)a8
{
  id v12;
  void *v13;
  void *v14;
  id v15;
  const void *v16;
  uint64_t v17;
  int64_t v18;
  double *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  xpc_object_t v24;
  id v25;
  void *v26;
  BaseOpaqueObject *v27;
  BaseOpaqueObject *v28;
  __shared_weak_count *cntrl;
  unint64_t *v30;
  unint64_t v31;
  caulk::mach::details *v32;
  void *v33;
  void *v34;
  void *v35;
  std::string *v36;
  std::string::size_type size;
  std::string *v38;
  std::string::size_type v39;
  int v40;
  NSObject *v41;
  id v42;
  caulk::mach *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  std::string::value_type *__s;
  void *v51;
  double *v54;
  id v55;
  id v56;
  void (**v57)(void *, id, _QWORD);
  int v58;
  id v59;
  __int128 v60;
  std::string v61;
  _DWORD v62[2];
  uint64_t v63;
  _BYTE aBlock[32];
  _BYTE v65[29];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v56 = a4;
  v55 = a7;
  v12 = a8;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    v57 = (void (**)(void *, id, _QWORD))_Block_copy(v12);
  }
  else
  {
    *(_QWORD *)aBlock = MEMORY[0x1E0C809B0];
    *(_QWORD *)&aBlock[8] = 3321888768;
    *(_QWORD *)&aBlock[16] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorjEEEU13block_pointerFvDpT_ES9_i_block_invoke;
    *(_QWORD *)&aBlock[24] = &__block_descriptor_48_ea8_32c122_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorjEEEU13block_pointerFvDpT_ES9_iEUlS4_jE__e20_v20__0__NSError_8I16l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    v61.__r_.__value_.__l.__size_ = (std::string::size_type)_Block_copy(v12);
    *(_QWORD *)v65 = v61.__r_.__value_.__l.__data_;
    *(_QWORD *)&v65[8] = _Block_copy((const void *)v61.__r_.__value_.__l.__size_);
    v57 = (void (**)(void *, id, _QWORD))_Block_copy(aBlock);

    v13 = *(void **)v65;
    *(_QWORD *)v65 = 0;

    v14 = (void *)v61.__r_.__value_.__r.__words[0];
    v61.__r_.__value_.__r.__words[0] = 0;

  }
  v15 = objc_retainAutorelease(v56);
  v16 = (const void *)objc_msgSend(v15, "bytes");
  v51 = v15;
  v17 = objc_msgSend(v15, "length");
  v18 = v17;
  if (v17)
  {
    if (0xCCCCCCCCCCCCCCCDLL * (v17 >> 3) >= 0x666666666666667)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v19 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<ISOLoudnessInfo>>(0xCCCCCCCCCCCCCCCDLL * (v17 >> 3));
    memmove(v19, v16, v18);
    v54 = &v19[v18 >> 3];
  }
  else
  {
    v19 = 0;
    v54 = 0;
  }
  -[AUAudioUnit inputBusses](self->_audioUnit, "inputBusses");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v20, "count");

  -[AUAudioUnit outputBusses](self->_audioUnit, "outputBusses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  v23 = v55;
  v24 = v23;
  if (!v23)
    v24 = xpc_null_create();

  v25 = v24;
  v26 = v25;
  v59 = v25;
  if (!v25 || object_getClass(v25) != (Class)MEMORY[0x1E0C812F8])
  {
    v59 = xpc_null_create();

  }
  v27 = (BaseOpaqueObject *)operator new();
  v28 = v27;
  cntrl = self->_workgroupMirror.__cntrl_;
  *(_QWORD *)&v60 = self->_workgroupMirror.__ptr_;
  *((_QWORD *)&v60 + 1) = cntrl;
  if (cntrl)
  {
    v30 = (unint64_t *)((char *)cntrl + 8);
    do
      v31 = __ldxr(v30);
    while (__stxr(v31 + 1, v30));
  }
  BaseOpaqueObject::BaseOpaqueObject(v27);
  *(_QWORD *)v28 = &off_1E2907FE8;
  *((_DWORD *)v28 + 3) = a3;
  *((_DWORD *)v28 + 4) = v58;
  *(_OWORD *)((char *)v28 + 24) = v60;
  *((_DWORD *)v28 + 5) = v22;
  v60 = 0uLL;
  *((_BYTE *)v28 + 40) = 0;
  *((_BYTE *)v28 + 56) = 0;
  *(_QWORD *)aBlock = &v59;
  *(_QWORD *)&aBlock[8] = "sharedMemory";
  applesauce::xpc::dict::object_proxy::operator*((uint64_t)aBlock);
  v32 = (caulk::mach::details *)objc_claimAutoreleasedReturnValue();
  v61.__r_.__value_.__r.__words[0] = caulk::mach::details::retain_os_object(v32, v33);
  caulk::mach::details::release_os_object(0, v34);
  MEMORY[0x193FFDCB0]((char *)v28 + 64, &v61);
  caulk::mach::details::release_os_object((caulk::mach::details *)v61.__r_.__value_.__l.__data_, v35);

  *((_QWORD *)v28 + 11) = caulk::ipc::mapped_memory::get_raw_ptr((BaseOpaqueObject *)((char *)v28 + 64), 0) + 8;
  *((_QWORD *)v28 + 12) = caulk::ipc::mapped_memory::get_raw_ptr((BaseOpaqueObject *)((char *)v28 + 64), 0);
  *((_QWORD *)v28 + 13) = caulk::ipc::mapped_memory::get_raw_ptr((BaseOpaqueObject *)((char *)v28 + 64), 0x10uLL);
  *((_WORD *)v28 + 56) = 1;
  audioipc::eventlink_primitive::eventlink_primitive((BaseOpaqueObject *)((char *)v28 + 120), v59);
  *((_QWORD *)v28 + 18) = 0;
  *((_BYTE *)v28 + 200) = 0;
  *((_QWORD *)v28 + 19) = 0;
  *((_QWORD *)v28 + 20) = 0;
  *((_BYTE *)v28 + 168) = 0;
  *((_OWORD *)v28 + 13) = 0u;
  *((_OWORD *)v28 + 14) = 0u;
  *((_DWORD *)v28 + 60) = 0;
  std::string::basic_string[abi:ne180100]<0>(aBlock, "AUOOPRenderingServer-");
  std::to_string(&v61, *((_DWORD *)v28 + 2));
  if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v36 = &v61;
  else
    v36 = (std::string *)v61.__r_.__value_.__r.__words[0];
  if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v61.__r_.__value_.__r.__words[2]);
  else
    size = v61.__r_.__value_.__l.__size_;
  v38 = std::string::append((std::string *)aBlock, (const std::string::value_type *)v36, size);
  v39 = v38->__r_.__value_.__l.__size_;
  __s = (std::string::value_type *)v38->__r_.__value_.__r.__words[0];
  v62[0] = v38->__r_.__value_.__r.__words[2];
  *(_DWORD *)((char *)v62 + 3) = *(_DWORD *)((char *)&v38->__r_.__value_.__r.__words[2] + 3);
  v40 = SHIBYTE(v38->__r_.__value_.__r.__words[2]);
  v38->__r_.__value_.__l.__size_ = 0;
  v38->__r_.__value_.__r.__words[2] = 0;
  v38->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v61.__r_.__value_.__l.__data_);
  if ((aBlock[23] & 0x80000000) != 0)
    operator delete(*(void **)aBlock);
  if (kInterAppAudioScope)
  {
    v41 = *(id *)kInterAppAudioScope;
    if (!v41)
      goto LABEL_33;
  }
  else
  {
    v41 = MEMORY[0x1E0C81028];
    v42 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)aBlock = 136315650;
    *(_QWORD *)&aBlock[4] = "AUOOPRenderingServer.mm";
    *(_WORD *)&aBlock[12] = 1024;
    *(_DWORD *)&aBlock[14] = 308;
    *(_WORD *)&aBlock[18] = 2048;
    *(_QWORD *)&aBlock[20] = v28;
    _os_log_impl(&dword_18EE07000, v41, OS_LOG_TYPE_DEBUG, "%25s:%-5d AUOOPRenderingServer@%p", aBlock, 0x1Cu);
  }

LABEL_33:
  if (v22 + v58 != -858993459 * (v54 - v19) || v19 == v54)
    std::terminate();
  v61.__r_.__value_.__r.__words[0] = (std::string::size_type)v19;
  v61.__r_.__value_.__l.__size_ = 0xCCCCCCCCCCCCCCCDLL * (v54 - v19);
  v61.__r_.__value_.__r.__words[2] = __PAIR64__(a6, a5);
  AUOOPSharedMemory::init2((uint64_t)v28 + 144, (AUOOPSharedMemory::InitializationParams *)&v61, *((_DWORD **)v28 + 13), *((_QWORD *)v28 + 9) - 16);
  v45 = (uint64_t)((double)a5 / *v19 * 24000000.0);
  if (v45 >> 5 <= 0x176)
    caulk::mach::throw_if_mach_error(v43, v44);
  if (v40 < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)aBlock, __s, v39);
  }
  else
  {
    *(_QWORD *)aBlock = __s;
    *(_QWORD *)&aBlock[8] = v39;
    *(_DWORD *)&aBlock[16] = v62[0];
    *(_DWORD *)&aBlock[19] = *(_DWORD *)((char *)v62 + 3);
    aBlock[23] = v40;
  }
  aBlock[24] = 1;
  *(_DWORD *)v65 = v45;
  *(_DWORD *)&v65[4] = 12000;
  *(_DWORD *)&v65[8] = v45;
  *(_QWORD *)&v65[12] = 0x100000001;
  v65[20] = 1;
  v65[24] = 0;
  v65[28] = 0;
  *((_DWORD *)v28 + 56) = v45;
  *((_DWORD *)v28 + 57) = 12000;
  *((_DWORD *)v28 + 58) = v45;
  *((_DWORD *)v28 + 59) = 1;
  if (*((_BYTE *)v28 + 56))
  {
    caulk::thread::~thread((BaseOpaqueObject *)((char *)v28 + 40));
    *((_BYTE *)v28 + 56) = 0;
  }
  *((_QWORD *)v28 + 5) = 0;
  *((_BYTE *)v28 + 48) = 0;
  v46 = operator new();
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]((std::string *)v46, (__int128 *)aBlock);
  *(_OWORD *)(v46 + 32) = *(_OWORD *)v65;
  *(_OWORD *)(v46 + 45) = *(_OWORD *)&v65[13];
  *(_QWORD *)(v46 + 64) = v28;
  v63 = v46;
  caulk::thread::start((BaseOpaqueObject *)((char *)v28 + 40), (caulk::thread::attributes *)v46, (void *(*)(void *))caulk::thread_proxy<std::tuple<caulk::thread::attributes,AUOOPRenderingServer::AUOOPRenderingServer(int,int,int,std::vector<AudioStreamBasicDescription> const&,unsigned int,unsigned int,applesauce::xpc::dict const&,std::shared_ptr<auoop::WorkgroupMirror>)::$_0,std::tuple<>>>, (void *)v46);
  v63 = 0;
  std::unique_ptr<std::tuple<caulk::thread::attributes,AUOOPRenderingServer::AUOOPRenderingServer(int,int,int,std::vector<AudioStreamBasicDescription> const&,unsigned int,unsigned int,applesauce::xpc::dict const&,std::shared_ptr<auoop::WorkgroupMirror>)::$_0,std::tuple<>>>::~unique_ptr[abi:ne180100](&v63);
  *((_BYTE *)v28 + 56) = 1;
  if ((aBlock[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)aBlock);
    if ((v40 & 0x80000000) == 0)
      goto LABEL_43;
  }
  else if ((v40 & 0x80000000) == 0)
  {
    goto LABEL_43;
  }
  operator delete(__s);
LABEL_43:
  v47 = *((unsigned int *)v28 + 2);
  v48 = v59;
  v59 = 0;

  v49 = 0;
  v57[2](v57, v49, v47);

  if (v19)
    operator delete(v19);

}

- (void)destroyRenderPipe:(unsigned int)a3 reply:(id)a4
{
  id v5;
  uint64_t v6;
  void (**v7)(id, _QWORD);

  v5 = a4;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v5);
  v7 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();

  v6 = BaseOpaqueObject::ResolveOpaqueRef();
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  v7[2](v7, 0);

}

- (void)uninitialize:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  OS_voucher *initializationVoucher;
  id v7;

  v4 = a3;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[AUAudioUnit deallocateRenderResources](self->_audioUnit, "deallocateRenderResources");
  v5 = (void (**)(_QWORD, _QWORD))v7;
  if (self->_renderServerUser.__engaged_)
  {
    AUOOPRenderingServerUser::~AUOOPRenderingServerUser((AUOOPRenderingServerUser *)&self->_renderServerUser);
    v5 = (void (**)(_QWORD, _QWORD))v7;
    self->_renderServerUser.__engaged_ = 0;
  }
  initializationVoucher = self->_initializationVoucher;
  if (initializationVoucher)
  {
    self->_initializationVoucher = 0;

    maintainWakeMonitor(0);
    v5 = (void (**)(_QWORD, _QWORD))v7;
  }
  if (v5)
  {
    ((void (**)(id, _QWORD))v5)[2](v7, 0);
    v5 = (void (**)(_QWORD, _QWORD))v7;
  }

}

- (void)reset:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  -[AUAudioUnit reset](self->_audioUnit, "reset");
  v4[2](v4, 0);

}

- (void)valueForKey:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},objc_object * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v6);
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  -[AUAudioUnit valueForKey:](self->_audioUnit, "valueForKey:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v8);

}

- (void)setValue:(id)a3 forKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  id v13[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v10);
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  PropertyNotificationDeferrer::PropertyNotificationDeferrer((PropertyNotificationDeferrer *)v13, self);
  -[AUAudioUnit setValue:forKey:](self->_audioUnit, "setValue:forKey:", v8, v9);
  PropertyNotificationDeferrer::changedProperties(v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v12);

  PropertyNotificationDeferrer::~PropertyNotificationDeferrer(v13);
}

- (void)valueForProperty:(id)a3 propagateError:(BOOL)a4 reply:(id)a5
{
  _BOOL4 v6;
  _QWORD *v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  AUAudioUnit *audioUnit;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},objc_object * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v9);
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    audioUnit = self->_audioUnit;
    v18 = 0;
    -[AUAudioUnit _valueForProperty:error:](audioUnit, "_valueForProperty:error:", v8, &v18);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v18;
    v14 = (void *)v12;
  }
  else if (*(_QWORD *)((char *)v8 + 20))
  {
    v17 = 0;
    -[AURemoteHost _getBus:scope:error:](self, "_getBus:scope:error:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v17;
    if (v15)
    {
      objc_msgSend(v15, "valueForKey:", v8[1]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

    v13 = 0;
  }
  else
  {
    v13 = 0;
    -[AUAudioUnit valueForKey:](self->_audioUnit, "valueForKey:", v8[1]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  ((void (**)(_QWORD, id, void *))v10)[2](v10, v13, v14);

}

- (void)setValue:(id)a3 forProperty:(id)a4 propagateError:(BOOL)a5 reply:(id)a6
{
  _BOOL4 v7;
  id v10;
  _QWORD *v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  AUAudioUnit *audioUnit;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20[2];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v12);
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  PropertyNotificationDeferrer::PropertyNotificationDeferrer((PropertyNotificationDeferrer *)v20, self);
  if (*(_QWORD *)((char *)v11 + 20))
  {
    -[AURemoteHost _getBus:scope:error:](self, "_getBus:scope:error:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    if (v17)
      objc_msgSend(v17, "setValue:forKey:", v10, v11[1]);

  }
  else
  {
    audioUnit = self->_audioUnit;
    v15 = v11[1];
    if (v7)
    {
      v19 = 0;
      -[AUAudioUnit _setValue:forKey:error:](audioUnit, "_setValue:forKey:error:", v10, v15, &v19);
      v16 = v19;
    }
    else
    {
      v16 = 0;
      -[AUAudioUnit setValue:forKey:](audioUnit, "setValue:forKey:", v10, v15);
    }
  }
  PropertyNotificationDeferrer::changedProperties(v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, void *))v13)[2](v13, v16, v18);

  PropertyNotificationDeferrer::~PropertyNotificationDeferrer(v20);
}

- (void)addPropertyObserver:(id)a3 context:(unint64_t)a4 reply:(id)a5
{
  char *v7;
  void (**v8)(id, _QWORD);
  NSObject *v9;
  id v10;
  id v11;

  v7 = (char *)a3;
  v8 = (void (**)(id, _QWORD))a5;
  if (*(_QWORD *)(v7 + 20))
  {
    v11 = 0;
    -[AURemoteHost _getBus:scope:error:](self, "_getBus:scope:error:");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v11;
    if (v9)
      KVOAggregator::addObserver(&self->_kvoAggregator, &self->super, v9, *((NSString **)v7 + 1));

  }
  else
  {
    KVOAggregator::addObserver(&self->_kvoAggregator, &self->super, &self->_audioUnit->super, *((NSString **)v7 + 1));
  }
  v8[2](v8, 0);

}

- (void)removePropertyObserver:(id)a3 context:(unint64_t)a4 reply:(id)a5
{
  char *v7;
  void (**v8)(id, _QWORD);
  NSObject *v9;
  id v10;
  id v11;

  v7 = (char *)a3;
  v8 = (void (**)(id, _QWORD))a5;
  if (*(_QWORD *)(v7 + 20))
  {
    v11 = 0;
    -[AURemoteHost _getBus:scope:error:](self, "_getBus:scope:error:");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v11;
    if (v9)
      KVOAggregator::removeObserver(&self->_kvoAggregator, &self->super, v9, *((NSString **)v7 + 1));

  }
  else
  {
    KVOAggregator::removeObserver(&self->_kvoAggregator, &self->super, &self->_audioUnit->super, *((NSString **)v7 + 1));
  }
  v8[2](v8, 0);

}

- (void)setBusFormat:(unsigned int)a3 scope:(unsigned int)a4 format:(id)a5 reply:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18[2];

  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v11 = a6;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v11);
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  PropertyNotificationDeferrer::PropertyNotificationDeferrer((PropertyNotificationDeferrer *)v18, self);
  v17 = 0;
  -[AURemoteHost _getBus:scope:error:](self, "_getBus:scope:error:", v8, v7, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v17;
  if (!v14)
  {
    v16 = 0;
    objc_msgSend(v13, "setFormat:error:", v10, &v16);
    v14 = v16;
  }
  PropertyNotificationDeferrer::changedProperties(v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, void *))v12)[2](v12, v14, v15);

  PropertyNotificationDeferrer::~PropertyNotificationDeferrer(v18);
}

- (void)setBusName:(unsigned int)a3 scope:(unsigned int)a4 name:(id)a5 reply:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;
  void (**v12)(void *, void *);
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id aBlock[4];
  id v22;
  id v23;

  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v11 = a6;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    v12 = (void (**)(void *, void *))_Block_copy(v11);
  }
  else
  {
    aBlock[0] = (id)MEMORY[0x1E0C809B0];
    aBlock[1] = (id)3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSArrayEEEU13block_pointerFvDpT_ES9_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c120_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSArrayEEEU13block_pointerFvDpT_ES9_iEUlS4_E__e17_v16__0__NSArray_8l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    v20 = _Block_copy(v11);
    v22 = v19;
    v23 = _Block_copy(v20);
    v12 = (void (**)(void *, void *))_Block_copy(aBlock);

    v13 = v22;
    v22 = 0;

    v14 = v19;
    v19 = 0;

  }
  PropertyNotificationDeferrer::PropertyNotificationDeferrer((PropertyNotificationDeferrer *)aBlock, self);
  v18 = 0;
  -[AURemoteHost _getBus:scope:error:](self, "_getBus:scope:error:", v8, v7, &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v18;
  if (!v16)
    objc_msgSend(v15, "setName:", v10);
  PropertyNotificationDeferrer::changedProperties(aBlock);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, v17);

  PropertyNotificationDeferrer::~PropertyNotificationDeferrer(aBlock);
}

- (void)setBusCount:(unint64_t)a3 scope:(unsigned int)a4 reply:(id)a5
{
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  id *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16[2];

  v8 = a5;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v8);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  PropertyNotificationDeferrer::PropertyNotificationDeferrer((PropertyNotificationDeferrer *)v16, self);
  if (a4 == 2)
  {
    -[AUAudioUnit outputBusses](self->_audioUnit, "outputBusses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v11 = (id *)&v14;
    objc_msgSend(v10, "setBusCount:error:", a3, &v14);
  }
  else
  {
    if (a4 != 1)
    {
      v12 = 0;
      goto LABEL_7;
    }
    -[AUAudioUnit inputBusses](self->_audioUnit, "inputBusses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v11 = (id *)&v15;
    objc_msgSend(v10, "setBusCount:error:", a3, &v15);
  }
  v12 = *v11;

LABEL_7:
  PropertyNotificationDeferrer::changedProperties(v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, void *))v9)[2](v9, v12, v13);

  PropertyNotificationDeferrer::~PropertyNotificationDeferrer(v16);
}

- (id)currentParameterTree
{
  AUParameterTree *cachedParameterTree;
  AUParameterTree *v4;
  AUParameterTree *v5;

  -[AUAudioUnit parameterTree](self->_audioUnit, "parameterTree");
  cachedParameterTree = (AUParameterTree *)objc_claimAutoreleasedReturnValue();
  v4 = cachedParameterTree;
  if (cachedParameterTree != self->_cachedParameterTree)
  {
    objc_storeStrong((id *)&self->_cachedParameterTree, cachedParameterTree);
    -[AUParameterTree setRemoteParameterSynchronizerXPCConnection:](v4, "setRemoteParameterSynchronizerXPCConnection:", self->_remoteHostXPCConnection);
    cachedParameterTree = self->_cachedParameterTree;
  }
  v5 = cachedParameterTree;

  return v5;
}

- (void)getParameterTree:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  _QWORD aBlock[4];
  id v11;
  id v12;

  v4 = a3;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    v7 = (void (**)(id, _QWORD, void *))_Block_copy(v4);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP15AUParameterTreeEEEU13block_pointerFvDpT_ESC_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c151_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP15AUParameterTreeEEEU13block_pointerFvDpT_ESC_iEUlS4_S7_E__e37_v24__0__NSError_8__AUParameterTree_16l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    v9 = _Block_copy(v4);
    v11 = v8;
    v12 = _Block_copy(v9);
    v7 = (void (**)(id, _QWORD, void *))_Block_copy(aBlock);

    v5 = v11;
    v11 = 0;

  }
  -[AURemoteHost currentParameterTree](self, "currentParameterTree");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v6);

}

- (void)parametersForOverviewWithCount:(int64_t)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;
  id v14;

  v6 = a4;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    v9 = (void (**)(id, _QWORD, void *))_Block_copy(v6);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP7NSArrayIP8NSNumberEEEEU13block_pointerFvDpT_ESF_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c154_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP7NSArrayIP8NSNumberEEEEU13block_pointerFvDpT_ESF_iEUlS4_SA_E__e29_v24__0__NSError_8__NSArray_16l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    v11 = _Block_copy(v6);
    v13 = v10;
    v14 = _Block_copy(v11);
    v9 = (void (**)(id, _QWORD, void *))_Block_copy(aBlock);

    v7 = v13;
    v13 = 0;

  }
  -[AUAudioUnit parametersForOverviewWithCount:](self->_audioUnit, "parametersForOverviewWithCount:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, 0, v8);

}

- (void)syncParameter:(unint64_t)a3 value:(float)a4 extOriginator:(unint64_t)a5 hostTime:(unint64_t)a6 eventType:(unsigned int)a7
{
  uint64_t v7;
  double v12;
  id v13;

  v7 = *(_QWORD *)&a7;
  -[AUAudioUnit parameterTree](self->_audioUnit, "parameterTree");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = a4;
  objc_msgSend(v13, "remoteSyncParameter:value:extOriginator:hostTime:eventType:", a3, a5, a6, v7, v12);

}

- (void)getParameter:(unint64_t)a3 sequenceNumber:(unsigned int)a4 reply:(id)a5
{
  id v8;
  void *v9;
  AURemoteHost *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  AURemoteHost *v16;
  unint64_t v17;
  __int128 v18;
  NSObject *v19;
  id v20;
  AURemoteHost *v21;
  unint64_t v22;
  unsigned int v23;
  __int128 v24;
  id location;
  id *v26;

  v8 = a5;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},float>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = self;
  v11 = _Block_copy(v9);
  if (a4)
  {
    objc_initWeak(&location, v10);
    if ((v12 & 1) == 0
    {
      dispatch_get_global_queue(25, 0);
      v19 = objc_claimAutoreleasedReturnValue();
      AUv2GetParameterSynchronizer::parameterSyncQueue(void)::global = (uint64_t)dispatch_queue_create_with_target_V2("AUv2GetParameterSynchronizer", 0, v19);

    }
    v13 = (void *)AUv2GetParameterSynchronizer::parameterSyncQueue(void)::global;
    applesauce::dispatch::v1::source::operator*((id)AUv2GetParameterSynchronizer::parameterSyncQueue(void)::global);
    objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v20, &location);
    v21 = v10;
    v22 = a3;
    v23 = a4;
    *(_QWORD *)&v24 = _Block_copy(v11);
    *((_QWORD *)&v24 + 1) = _Block_copy(v9);
    v14 = v13;
    v15 = operator new();
    objc_moveWeak((id *)v15, &v20);
    v16 = v21;
    v17 = v22;
    *(_QWORD *)(v15 + 8) = v16;
    *(_QWORD *)(v15 + 16) = v17;
    *(_DWORD *)(v15 + 24) = v23;
    v18 = v24;
    v24 = 0uLL;
    *(_OWORD *)(v15 + 32) = v18;
    v26 = 0;
    dispatch_async_f(v14, (void *)v15, (dispatch_function_t)applesauce::dispatch::v1::async<-[AURemoteHost getParameter:sequenceNumber:reply:]::$_4>(NSObject  {objcproto17OS_dispatch_queue}*,-[AURemoteHost getParameter:sequenceNumber:reply:]::$_4 &&)::{lambda(void *)#1}::__invoke);
    std::unique_ptr<-[AURemoteHost getParameter:sequenceNumber:reply:]::$_4>::~unique_ptr[abi:ne180100](&v26);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    -[AUAudioUnit getV2Parameter:sequenceNumber:](v10->_audioUnit, "getV2Parameter:sequenceNumber:", a3, 0);
    (*((void (**)(void *, _QWORD))v11 + 2))(v11, 0);
  }

}

- (void)parameterStringFromValue:(float)a3 currentValue:(BOOL)a4 address:(unint64_t)a5 reply:(id)a6
{
  _BOOL4 v7;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  float *v13;
  void *v14;
  float v15;

  v7 = a4;
  v15 = a3;
  v9 = a6;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSString * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v9);
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  -[AURemoteHost currentParameterTree](self, "currentParameterTree");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "parameterWithAddress:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v7)
      v13 = 0;
    else
      v13 = &v15;
    objc_msgSend(v12, "stringFromValue:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  ((void (**)(_QWORD, _QWORD, void *))v10)[2](v10, 0, v14);

}

- (void)parameterValueFromString:(id)a3 address:(unint64_t)a4 reply:(id)a5
{
  id v8;
  void (**v9)(_QWORD, _QWORD, __n128);
  void *v10;
  void *v11;
  __n128 v12;
  id v13;

  v13 = a3;
  v8 = a5;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},float>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v8);
  v9 = (void (**)(_QWORD, _QWORD, __n128))objc_claimAutoreleasedReturnValue();

  -[AURemoteHost currentParameterTree](self, "currentParameterTree");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parameterWithAddress:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v11, "valueFromString:", v13);
  else
    v12.n128_u32[0] = 0;
  v9[2](v9, 0, v12);

}

- (void)parameterNode:(id)a3 displayNameWithLength:(int64_t)a4 reply:(id)a5
{
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a5;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSString * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v8);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  -[AURemoteHost currentParameterTree](self, "currentParameterTree");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKeyPath:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "displayNameWithLength:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v12);

}

- (id)_fetchAndClearPendingChangedProperties
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  NSMutableArray *pendingChangedProperties;

  v3 = self->_pendingChangedProperties;
  v4 = (NSMutableArray *)objc_opt_new();
  pendingChangedProperties = self->_pendingChangedProperties;
  self->_pendingChangedProperties = v4;

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  NSObject *propertyObserverQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  AURemoteHost *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  propertyObserverQueue = self->_propertyObserverQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AURemoteHost_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E2919BF8;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_sync(propertyObserverQueue, block);

}

- (void)supportedViewConfigurations:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(void *, _QWORD, void *);
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD aBlock[4];
  id v14;
  id v15;

  v10 = a3;
  v6 = a4;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    v7 = (void (**)(void *, _QWORD, void *))_Block_copy(v6);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP10NSIndexSetEEEU13block_pointerFvDpT_ESC_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c146_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP10NSIndexSetEEEU13block_pointerFvDpT_ESC_iEUlS4_S7_E__e32_v24__0__NSError_8__NSIndexSet_16l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    v12 = _Block_copy(v6);
    v14 = v11;
    v15 = _Block_copy(v12);
    v7 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);

    v8 = v14;
    v14 = 0;

  }
  -[AUAudioUnit supportedViewConfigurations:](self->_audioUnit, "supportedViewConfigurations:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v9);

}

- (void)selectViewConfiguration:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = a3;
  v6 = a4;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v6);
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  -[AUAudioUnit selectViewConfiguration:](self->_audioUnit, "selectViewConfiguration:", v8);
  v7[2](v7, 0);

}

- (void)profileStateForCable:(unsigned __int8)a3 channel:(unsigned __int8)a4 reply:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  void *v13;
  _QWORD aBlock[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    v11 = (void (**)(id, _QWORD, void *))_Block_copy(v8);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP18MIDICIProfileStateEEEU13block_pointerFvDpT_ESC_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c154_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP18MIDICIProfileStateEEEU13block_pointerFvDpT_ESC_iEUlS4_S7_E__e40_v24__0__NSError_8__MIDICIProfileState_16l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    v13 = _Block_copy(v8);
    v15 = v12;
    v16 = _Block_copy(v13);
    v11 = (void (**)(id, _QWORD, void *))_Block_copy(aBlock);

    v9 = v15;
    v15 = 0;

  }
  -[AUAudioUnit profileStateForCable:channel:](self->_audioUnit, "profileStateForCable:channel:", v6, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, 0, v10);

}

- (void)enableProfile:(id)a3 cable:(unsigned __int8)a4 onChannel:(unsigned __int8)a5 reply:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  AUAudioUnit *audioUnit;
  id v14;
  id v15;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v11);
  v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  audioUnit = self->_audioUnit;
  v15 = 0;
  -[AUAudioUnit enableProfile:cable:onChannel:error:](audioUnit, "enableProfile:cable:onChannel:error:", v10, v8, v7, &v15);
  v14 = v15;
  ((void (**)(_QWORD, id))v12)[2](v12, v14);

}

- (void)disableProfile:(id)a3 cable:(unsigned __int8)a4 onChannel:(unsigned __int8)a5 reply:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  AUAudioUnit *audioUnit;
  id v14;
  id v15;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v11);
  v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  audioUnit = self->_audioUnit;
  v15 = 0;
  -[AUAudioUnit disableProfile:cable:onChannel:error:](audioUnit, "disableProfile:cable:onChannel:error:", v10, v8, v7, &v15);
  v14 = v15;
  ((void (**)(_QWORD, id))v12)[2](v12, v14);

}

- (void)loadUserPresets:(id)a3
{
  id v4;
  id v5;
  AUAudioUnit *audioUnit;
  void *v7;
  uint64_t v8;
  NSMutableArray **p_userPresets;
  NSMutableArray *userPresets;
  void (**v11)(id, _QWORD, NSMutableArray *);
  void *v12;
  void *v13;
  _QWORD aBlock[4];
  id v15;
  id v16;

  v4 = a3;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    v11 = (void (**)(id, _QWORD, NSMutableArray *))_Block_copy(v4);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP7NSArrayIP17AUAudioUnitPresetEEEEU13block_pointerFvDpT_ESF_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c164_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP7NSArrayIP17AUAudioUnitPresetEEEEU13block_pointerFvDpT_ESF_iEUlS4_SA_E__e29_v24__0__NSError_8__NSArray_16l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    v13 = _Block_copy(v4);
    v15 = v12;
    v16 = _Block_copy(v13);
    v11 = (void (**)(id, _QWORD, NSMutableArray *))_Block_copy(aBlock);

    v5 = v15;
    v15 = 0;

  }
  audioUnit = self->_audioUnit;
  if (audioUnit)
  {
    -[AUAudioUnit userPresets](audioUnit, "userPresets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mutableCopy");
    userPresets = self->_userPresets;
    p_userPresets = &self->_userPresets;
    *p_userPresets = (NSMutableArray *)v8;

  }
  else
  {
    p_userPresets = &self->_userPresets;
  }
  v11[2](v11, 0, *p_userPresets);

}

- (void)saveUserPreset:(id)a3 state:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  AUAudioUnit *audioUnit;
  id v11;
  id v12;

  v7 = a3;
  v8 = a5;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v8);
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  audioUnit = self->_audioUnit;
  if (audioUnit)
  {
    v12 = 0;
    -[AUAudioUnit saveUserPreset:error:](audioUnit, "saveUserPreset:error:", v7, &v12);
    v11 = v12;
    ((void (**)(_QWORD, id))v9)[2](v9, v11);
  }
  else
  {
    v11 = 0;
    v9[2](v9, 0);
  }

}

- (void)deleteUserPreset:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  AUAudioUnit *audioUnit;
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v7);
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  audioUnit = self->_audioUnit;
  if (audioUnit)
  {
    v11 = 0;
    -[AUAudioUnit deleteUserPreset:error:](audioUnit, "deleteUserPreset:error:", v6, &v11);
    v10 = v11;
    ((void (**)(_QWORD, id))v8)[2](v8, v10);
  }
  else
  {
    v10 = 0;
    v8[2](v8, 0);
  }

}

- (void)presetStateFor:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void (**v8)(void *, id, void *);
  id v9;
  id v10;
  AUAudioUnit *audioUnit;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD aBlock[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    v8 = (void (**)(void *, id, void *))_Block_copy(v7);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP12NSDictionaryIP8NSStringP11objc_objectEEEEU13block_pointerFvDpT_ESH_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c174_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP12NSDictionaryIP8NSStringP11objc_objectEEEEU13block_pointerFvDpT_ESH_iEUlS4_SC_E__e34_v24__0__NSError_8__NSDictionary_16l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    v16 = _Block_copy(v7);
    v18 = v15;
    v19 = _Block_copy(v16);
    v8 = (void (**)(void *, id, void *))_Block_copy(aBlock);

    v9 = v18;
    v18 = 0;

    v10 = v15;
    v15 = 0;

  }
  audioUnit = self->_audioUnit;
  if (audioUnit)
  {
    v14 = 0;
    -[AUAudioUnit presetStateFor:error:](audioUnit, "presetStateFor:error:", v6, &v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14;
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
  v8[2](v8, v13, v12);

}

- (void)startUserPresetFolderMonitoring
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *presetMonitoringQueue;
  OS_dispatch_queue *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *presetFolderWatcher;
  _QWORD v9[4];
  id v10;
  id location;

  if (!self->_presetFolderWatcher)
  {
    if (!self->_presetMonitoringQueue)
    {
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (OS_dispatch_queue *)dispatch_queue_create("AUExtension.PresetMonitoring", v3);
      presetMonitoringQueue = self->_presetMonitoringQueue;
      self->_presetMonitoringQueue = v4;

    }
    objc_initWeak(&location, self);
    v6 = self->_presetMonitoringQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__AURemoteHost_startUserPresetFolderMonitoring__block_invoke;
    v9[3] = &unk_1E29225C8;
    objc_copyWeak(&v10, &location);
    +[AUAudioUnit _monitorUserPresets:callback:](AUAudioUnit, "_monitorUserPresets:callback:", v6, v9);
    v7 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
    presetFolderWatcher = self->_presetFolderWatcher;
    self->_presetFolderWatcher = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)synthesizeSpeechRequest:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v6);
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  -[AURemoteHost _getSpeechSynthesisProviderAudioUnit](self, "_getSpeechSynthesisProviderAudioUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "synthesizeSpeechRequest:", v10);

  v7[2](v7, 0);
}

- (void)cancelSpeechRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (**v7)(id, _QWORD);

  v4 = a3;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v4);
  v7 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();

  -[AURemoteHost _getSpeechSynthesisProviderAudioUnit](self, "_getSpeechSynthesisProviderAudioUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "cancelSpeechRequest");

  v7[2](v7, 0);
}

- (void)getSpeechVoices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, _QWORD, void *);

  v4 = a3;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v4);
  v8 = (void (**)(id, _QWORD, void *))objc_claimAutoreleasedReturnValue();

  -[AURemoteHost _getSpeechSynthesisProviderAudioUnit](self, "_getSpeechSynthesisProviderAudioUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "speechVoices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v7);

  }
  else
  {
    v8[2](v8, 0, 0);
  }

}

- (id)audioUnit
{
  return self->_audioUnit;
}

- (void)getCustomMessageChannelFor:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  AURemoteMessageChannel *v8;
  AURemoteMessageChannel *v9;
  id *value;
  __end_cap_ **var0;
  __end_cap_ **v12;
  __end_ **begin;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  __end_ **v19;
  id *v20;
  __end_cap_ **v21;
  __end_ **v22;
  __end_ *v23;
  int64x2_t v24;
  char *v25;
  char *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[AUAudioUnit messageChannelFor:](self->_audioUnit, "messageChannelFor:", v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[AURemoteMessageChannel initWithMessageChannel:]([AURemoteMessageChannel alloc], "initWithMessageChannel:", v7);
    v9 = v8;
    var0 = self->_remoteMessageChannels.var0;
    value = self->_remoteMessageChannels.var1.__value_;
    if (var0 >= (__end_cap_ **)value)
    {
      begin = self->_remoteMessageChannels.__begin_;
      v14 = var0 - begin;
      if ((unint64_t)(v14 + 1) >> 61)
        std::vector<float>::__throw_length_error[abi:ne180100]();
      v15 = (char *)value - (char *)begin;
      v16 = v15 >> 2;
      if (v15 >> 2 <= (unint64_t)(v14 + 1))
        v16 = v14 + 1;
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
        v17 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v17 = v16;
      if (v17)
      {
        if (v17 >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v18 = (char *)operator new(8 * v17);
      }
      else
      {
        v18 = 0;
      }
      v19 = (__end_ **)&v18[8 * v14];
      v20 = (id *)&v18[8 * v17];
      *v19 = (__end_ *)v9;
      v12 = v19 + 1;
      v22 = self->_remoteMessageChannels.__begin_;
      v21 = self->_remoteMessageChannels.var0;
      if (v21 == v22)
      {
        v24 = vdupq_n_s64((unint64_t)v21);
      }
      else
      {
        do
        {
          v23 = *--v21;
          *v21 = 0;
          *--v19 = v23;
        }
        while (v21 != v22);
        v24 = *(int64x2_t *)&self->_remoteMessageChannels.__begin_;
      }
      self->_remoteMessageChannels.__begin_ = v19;
      self->_remoteMessageChannels.var0 = v12;
      self->_remoteMessageChannels.var1.__value_ = v20;
      v26 = (char *)v24.i64[1];
      v25 = (char *)v24.i64[0];
      while (v26 != v25)
      {
        v27 = (void *)*((_QWORD *)v26 - 1);
        v26 -= 8;

      }
      if (v25)
        operator delete(v25);
    }
    else
    {
      *var0 = (__end_cap_ *)v8;
      v12 = var0 + 1;
    }
    self->_remoteMessageChannels.var0 = v12;
    -[AURemoteMessageChannel endpoint](v9, "endpoint");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v28);

  }
  else
  {
    v6[2](v6, 0, 0);
  }

}

- (void)retrieveInstanceUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (**v7)(id, _QWORD, void *);

  v4 = a3;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSString * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v4);
  v7 = (void (**)(id, _QWORD, void *))objc_claimAutoreleasedReturnValue();

  -[AURemoteHost audioUnitUUID](self, "audioUnitUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, 0, v6);
}

- (void)localCachingDisabled:(BOOL)a3 newValue:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  id v9;
  void (**v10)(id, _QWORD, BOOL);
  void *v11;
  void *v12;
  _QWORD aBlock[4];
  id v14;
  id v15;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    v10 = (void (**)(id, _QWORD, BOOL))_Block_copy(v8);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorbEEEU13block_pointerFvDpT_ES9_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c122_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorbEEEU13block_pointerFvDpT_ES9_iEUlS4_bE__e20_v20__0__NSError_8B16l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    v12 = _Block_copy(v8);
    v14 = v11;
    v15 = _Block_copy(v12);
    v10 = (void (**)(id, _QWORD, BOOL))_Block_copy(aBlock);

    v9 = v14;
    v14 = 0;

  }
  if (v6)
    -[AURemoteHost setLocalCachingDisabled:](self, "setLocalCachingDisabled:", v5);
  v10[2](v10, 0, -[AURemoteHost localCachingDisabled](self, "localCachingDisabled"));

}

- (id)readHostEntitlement:(id)a3
{
  -[NSXPCConnection valueForEntitlement:](self->_remoteHostXPCConnection, "valueForEntitlement:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- ($115C4C562B26FF47E01F9F4EA65B5887)hostAuditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_remoteHostXPCConnection;
  if (result)
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 auditToken](result, "auditToken");
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (NSUUID)audioUnitUUID
{
  return self->_audioUnitUUID;
}

- (BOOL)localCachingDisabled
{
  return self->_localCachingDisabled;
}

- (void)setLocalCachingDisabled:(BOOL)a3
{
  self->_localCachingDisabled = a3;
}

- (OS_dispatch_queue)propertyObserverQueue
{
  return self->_propertyObserverQueue;
}

- (int)deferPropertyChangeNotifications
{
  return self->_deferPropertyChangeNotifications;
}

- (void)setDeferPropertyChangeNotifications:(int)a3
{
  self->_deferPropertyChangeNotifications = a3;
}

- (NSMutableArray)pendingChangedProperties
{
  return self->_pendingChangedProperties;
}

- (void).cxx_destruct
{
  __end_ **begin;
  __end_cap_ **var0;
  __end_ **v5;
  void *v6;
  Record *v7;
  AURemoteHost *f;
  uint64_t v9;

  objc_storeStrong((id *)&self->_pendingChangedProperties, 0);
  objc_storeStrong((id *)&self->_propertyObserverQueue, 0);
  std::unique_ptr<XOSTransactor>::reset[abi:ne180100]((uint64_t *)&self->_transactorIO, 0);
  begin = self->_remoteMessageChannels.__begin_;
  if (begin)
  {
    var0 = self->_remoteMessageChannels.var0;
    v5 = self->_remoteMessageChannels.__begin_;
    if (var0 != begin)
    {
      do
      {
        v6 = *--var0;

      }
      while (var0 != begin);
      v5 = self->_remoteMessageChannels.__begin_;
    }
    self->_remoteMessageChannels.var0 = begin;
    operator delete(v5);
  }
  v7 = self->_kvoAggregator.mRecords.__begin_;
  if (v7)
  {
    std::vector<KVOAggregator::Record>::__base_destruct_at_end[abi:ne180100]((uint64_t)&self->_kvoAggregator, (uint64_t)v7);
    operator delete(self->_kvoAggregator.mRecords.__begin_);
  }
  std::shared_ptr<MP4OTISpecificBase>::~shared_ptr[abi:ne180100]((uint64_t)&self->_workgroupMirror);
  objc_storeStrong((id *)&self->_audioUnitUUID, 0);
  objc_storeStrong((id *)&self->_userPresets, 0);
  objc_storeStrong((id *)&self->_presetFolderWatcher, 0);
  objc_storeStrong((id *)&self->_presetMonitoringQueue, 0);
  f = (AURemoteHost *)self->_replyWatchdogFactory.mTimeoutHandler.__f_.__f_;
  if (f == (AURemoteHost *)&self->_replyWatchdogFactory.mTimeoutHandler)
  {
    v9 = 4;
    f = (AURemoteHost *)&self->_replyWatchdogFactory.mTimeoutHandler;
  }
  else
  {
    if (!f)
      goto LABEL_13;
    v9 = 5;
  }
  (*((void (**)(void))f->super.isa + v9))();
LABEL_13:
  objc_storeStrong((id *)&self->_cachedParameterTree, 0);
  objc_storeStrong((id *)&self->_initializationVoucher, 0);
  if (self->_renderServerUser.__engaged_)
    AUOOPRenderingServerUser::~AUOOPRenderingServerUser((AUOOPRenderingServerUser *)&self->_renderServerUser);
  objc_storeStrong((id *)&self->_remoteHostXPCConnection, 0);
  objc_storeStrong((id *)&self->_audioUnit, 0);
}

- (id).cxx_construct
{
  self->_renderServerUser.var0.__null_state_ = 0;
  self->_renderServerUser.__engaged_ = 0;
  caulk::xpc::reply_watchdog_factory::reply_watchdog_factory((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
  self->_transactorIO.__ptr_.__value_ = 0;
  *(_OWORD *)&self->_kvoAggregator.mRecords.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_remoteMessageChannels.var0 = 0u;
  self->_workgroupMirror = 0u;
  *(_OWORD *)&self->_kvoAggregator.mRecords.__begin_ = 0u;
  return self;
}

void __47__AURemoteHost_startUserPresetFolderMonitoring__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD v13[3];
  _QWORD *v14;
  void *v15;
  _BYTE v16[24];
  _BYTE *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[24];
    WeakRetained[24] = 0;

    v4 = (void *)v2[2];
    v13[0] = &off_1E2913638;
    v13[1] = &__block_literal_global_30;
    v14 = v13;
    caulk::xpc::message<objc_object  {objcproto23AUAudioUnitHostProtocol}* {__strong}>::message(&v15, v4, (uint64_t)v13);
    v5 = v14;
    if (v14 == v13)
    {
      v6 = 4;
      v5 = v13;
    }
    else
    {
      if (!v14)
        goto LABEL_7;
      v6 = 5;
    }
    (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_7:
    caulk::xpc::message<objc_object  {objcproto23AUAudioUnitHostProtocol}* {__strong}>::async_proxy(&v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99D20];
    +[AUAudioUnitProperty propertyWithKey:](AUAudioUnitProperty, "propertyWithKey:", CFSTR("userPresets"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithObjects:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "propertiesChanged:", v10);

    v11 = v17;
    if (v17 == v16)
    {
      v12 = 4;
      v11 = v16;
    }
    else
    {
      if (!v17)
      {
LABEL_12:

        goto LABEL_13;
      }
      v12 = 5;
    }
    (*(void (**)(void))(*v11 + 8 * v12))();
    goto LABEL_12;
  }
LABEL_13:

}

void __63__AURemoteHost_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[3];
  _QWORD *v21;
  void *v22;
  _BYTE v23[24];
  _BYTE *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[AUAudioUnitProperty propertyWithKey:](AUAudioUnitProperty, "propertyWithKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "_identifyBus:scope:element:", *(_QWORD *)(a1 + 48), v2 + 20, v2 + 24) & 1) != 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = *(id *)(*(_QWORD *)(a1 + 40) + 296);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v17;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v17 != v5)
            objc_enumerationMutation(v3);
          v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
          if (*(_DWORD *)(v2 + 20) == *(_DWORD *)(v7 + 20)
            && *(_DWORD *)(v2 + 24) == *(_DWORD *)(v7 + 24)
            && (objc_msgSend(*(id *)(v2 + 8), "isEqualToString:", *(_QWORD *)(v7 + 8), (_QWORD)v16) & 1) != 0)
          {

            goto LABEL_18;
          }
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
        if (v4)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 296), "addObject:", v2);
    v8 = *(_QWORD *)(a1 + 40);
    if (!*(_DWORD *)(v8 + 284))
    {
      if (objc_msgSend(*(id *)(v8 + 296), "count"))
      {
        v9 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
        v20[0] = &off_1E2913638;
        v20[1] = &__block_literal_global_28;
        v21 = v20;
        caulk::xpc::message<objc_object  {objcproto23AUAudioUnitHostProtocol}* {__strong}>::message(&v22, v9, (uint64_t)v20);
        v10 = v21;
        if (v21 == v20)
        {
          v11 = 4;
          v10 = v20;
        }
        else
        {
          if (!v21)
            goto LABEL_21;
          v11 = 5;
        }
        (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_21:
        caulk::xpc::message<objc_object  {objcproto23AUAudioUnitHostProtocol}* {__strong}>::async_proxy(&v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_fetchAndClearPendingChangedProperties");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "propertiesChanged:", v13);

        v14 = v24;
        if (v24 == v23)
        {
          v15 = 4;
          v14 = v23;
        }
        else
        {
          if (!v24)
          {
LABEL_26:

            goto LABEL_18;
          }
          v15 = 5;
        }
        (*(void (**)(void))(*v14 + 8 * v15))();
        goto LABEL_26;
      }
    }
  }
LABEL_18:

}

- (id)getParameter:(NSObject  *){objcproto17OS_dispatch_queue} sequenceNumber:(id)&& reply:
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id *v6;

  v6 = (id *)a1;
  WeakRetained = objc_loadWeakRetained((id *)a1);
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 8) + 8), "getV2Parameter:sequenceNumber:", *(_QWORD *)(a1 + 16), *(unsigned int *)(a1 + 24));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -66749, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, float))(v3 + 16))(v3, v4, 0.0);

  }
  return std::unique_ptr<-[AURemoteHost getParameter:sequenceNumber:reply:]::$_4>::~unique_ptr[abi:ne180100](&v6);
}

- (id)getParameter:(id *)a1 sequenceNumber:reply:
{
  id *v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {

    objc_destroyWeak(v2);
    MEMORY[0x193FFE460](v2, 0x10C0C4089E62035);
  }
  return a1;
}

- (void)initialize:reply:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void **v13;
  char *v14;
  char *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  id obj;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  *a3 = objc_msgSend(v5, "count", v5);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(obj);
        v9 = *(id *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v9, "format");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v31 = 0;
        v29 = 0u;
        v30 = 0u;
        if (v10)
        {
          v12 = objc_msgSend(v10, "streamDescription");
          v29 = *(_OWORD *)v12;
          v30 = *(_OWORD *)(v12 + 16);
          v31 = *(_QWORD *)(v12 + 32);
        }
        v13 = *a1;
        v14 = (char *)(*a1)[1];
        v15 = (char *)(*a1)[2];
        if (v14 >= v15)
        {
          v17 = 0xCCCCCCCCCCCCCCCDLL * ((v14 - (_BYTE *)*v13) >> 3);
          v18 = v17 + 1;
          if (v17 + 1 > 0x666666666666666)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v19 = 0xCCCCCCCCCCCCCCCDLL * ((v15 - (_BYTE *)*v13) >> 3);
          if (2 * v19 > v18)
            v18 = 2 * v19;
          if (v19 >= 0x333333333333333)
            v20 = 0x666666666666666;
          else
            v20 = v18;
          if (v20)
            v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<ISOLoudnessInfo>>(v20);
          else
            v21 = 0;
          v22 = v20 + 40 * v17;
          *(_OWORD *)v22 = v29;
          *(_OWORD *)(v22 + 16) = v30;
          *(_QWORD *)(v22 + 32) = v31;
          v24 = (char *)*v13;
          v23 = (char *)v13[1];
          v25 = (char *)v22;
          if (v23 != *v13)
          {
            do
            {
              v26 = *(_OWORD *)(v23 - 40);
              v27 = *(_OWORD *)(v23 - 24);
              *((_QWORD *)v25 - 1) = *((_QWORD *)v23 - 1);
              *(_OWORD *)(v25 - 24) = v27;
              *(_OWORD *)(v25 - 40) = v26;
              v25 -= 40;
              v23 -= 40;
            }
            while (v23 != v24);
            v23 = (char *)*v13;
          }
          v16 = (void *)(v22 + 40);
          *v13 = v25;
          v13[1] = (void *)(v22 + 40);
          v13[2] = (void *)(v20 + 40 * v21);
          if (v23)
            operator delete(v23);
        }
        else
        {
          *(_OWORD *)v14 = v29;
          *((_OWORD *)v14 + 1) = v30;
          *((_QWORD *)v14 + 4) = v31;
          v16 = v14 + 40;
        }
        v13[1] = v16;

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v6);
  }

}

void __40__AURemoteHost_open_instanceUUID_reply___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD v3[5];
  id v4;
  __int128 v5;
  int v6;

  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_DWORD *)(a1 + 64);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__AURemoteHost_open_instanceUUID_reply___block_invoke_2;
  v3[3] = &unk_1E2919B88;
  v2 = *(id *)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  +[AUAudioUnit instantiateWithComponentDescription:options:completionHandler:](AUAudioUnit, "instantiateWithComponentDescription:options:completionHandler:", &v5, 2147483650, v3);

}

void __40__AURemoteHost_open_instanceUUID_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  pid_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (!v8 || v5)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = getpid();
    (*(void (**)(uint64_t, id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, pid_t, _QWORD, _QWORD))(v6 + 16))(v6, v5, 0, 0, 0, 0, 0, 0, v7, 0, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "openImpl:reply:", v8, *(_QWORD *)(a1 + 40));
  }

}

void __25__AURemoteHost_setBlocks__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v9;
  id WeakRetained;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD v16[3];
  _QWORD *v17;
  void *v18;
  _BYTE v19[24];
  _BYTE *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v16[0] = &off_1E2913638;
  v16[1] = &__block_literal_global_18;
  v17 = v16;
  caulk::xpc::message<objc_object  {objcproto23AUAudioUnitHostProtocol}* {__strong}>::message(&v18, WeakRetained, (uint64_t)v16);
  v11 = v17;
  if (v17 == v16)
  {
    v12 = 4;
    v11 = v16;
  }
  else
  {
    if (!v17)
      goto LABEL_6;
    v12 = 5;
  }
  (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_6:

  caulk::xpc::message<objc_object  {objcproto23AUAudioUnitHostProtocol}* {__strong}>::async_proxy(&v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "MIDICIProfileChanged:channel:profile:enabled:", a2, a3, v9, a5);

  v14 = v20;
  if (v20 == v19)
  {
    v15 = 4;
    v14 = v19;
    goto LABEL_10;
  }
  if (v20)
  {
    v15 = 5;
LABEL_10:
    (*(void (**)(void))(*v14 + 8 * v15))();
  }

}

void __25__AURemoteHost_setBlocks__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD v13[3];
  _QWORD *v14;
  void *v15;
  _BYTE v16[24];
  _BYTE *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v13[0] = &off_1E2913638;
  v13[1] = &__block_literal_global_20;
  v14 = v13;
  caulk::xpc::message<objc_object  {objcproto23AUAudioUnitHostProtocol}* {__strong}>::message(&v15, WeakRetained, (uint64_t)v13);
  v8 = v14;
  if (v14 == v13)
  {
    v9 = 4;
    v8 = v13;
  }
  else
  {
    if (!v14)
      goto LABEL_6;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_6:

  caulk::xpc::message<objc_object  {objcproto23AUAudioUnitHostProtocol}* {__strong}>::async_proxy(&v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "speechSynthesisMetadataAvailable:speechRequest:", v5, v6);

  v11 = v17;
  if (v17 == v16)
  {
    v12 = 4;
    v11 = v16;
    goto LABEL_10;
  }
  if (v17)
  {
    v12 = 5;
LABEL_10:
    (*(void (**)(void))(*v11 + 8 * v12))();
  }

}

- (void)initWithConnection:config:
{
  *a2 = &off_1E29137A0;
}

- (_QWORD)initWithConnection:config:
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E29137A0;
  return result;
}

+ (void)_staticInit
{
  if (+[AURemoteHost _staticInit]::once[0] != -1)
    dispatch_once(+[AURemoteHost _staticInit]::once, &__block_literal_global_1607);
}

void __27__AURemoteHost__staticInit__block_invoke()
{
  if (initInterAppAudioLogging::once != -1)
    dispatch_once(&initInterAppAudioLogging::once, &__block_literal_global_10577);
}

@end
