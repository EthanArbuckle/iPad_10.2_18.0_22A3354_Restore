@implementation ULLogicAdapter

void __59__ULLogicAdapter__handleULDisplayMonitorEventDisplayState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const __CFString *v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  id v13;
  CFAbsoluteTime v14;
  _BYTE buf[12];
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14 = cl::chrono::CFAbsoluteTimeClock::now();
  if (objc_msgSend(*(id *)(a1 + 32), "displayOnChanged"))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
    v2 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(*(id *)(a1 + 32), "displayOn");
      v4 = CFSTR("Off");
      if (v3)
        v4 = CFSTR("On");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "_handleULDisplayMonitorEventDisplayState: display: %@", buf, 0xCu);
    }

    CLMicroLocationLogic::setDisplayState((_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 224), objc_msgSend(*(id *)(a1 + 32), "displayOn"), &v14);
    CLMicroLocationLegacyClient::onDisplayState(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 2848, objc_msgSend(*(id *)(a1 + 32), "displayOn"), &v14);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "screenLockedChanged"))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
    v5 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "screenLocked");
      v7 = CFSTR("Unlocked");
      if (v6)
        v7 = CFSTR("Locked");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "_handleULDisplayMonitorEventDisplayState: screen: %@", buf, 0xCu);
    }

    CLMicroLocationLogic::setLockScreenState((CLMicroLocationLogic *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 224), objc_msgSend(*(id *)(a1 + 32), "screenLocked"));
  }
  if (objc_msgSend(*(id *)(a1 + 32), "appInFocusChanged"))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
    v8 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "appInFocus");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "_handleULDisplayMonitorEventDisplayState: appInFocus: %@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "appInFocus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

    if (!v11)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      objc_msgSend(*(id *)(a1 + 32), "appInFocus");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(v13, "UTF8String"));
      CLMicroLocationLegacyClient::onAppLaunch((CLMicroLocationLegacyClient *)(v12 + 2848), (uint64_t)buf, &v14);
      if (v16 < 0)
        operator delete(*(void **)buf);

    }
  }
}

- (ULLogicAdapter)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _ULRequireInitializer(v2, sel_initWithEnvironment_delegate_);
}

- (ULLogicAdapter)initWithEnvironment:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  ULLogicAdapter *v9;
  ULLogicAdapter *v10;
  void *v11;
  uint64_t v12;
  ULLogicAdapterImpl *value;
  void *v14;
  ULLogicAdapterImpl *v15;
  void *v16;
  CFAbsoluteTime v17;
  _QWORD *v18;
  _QWORD v20[5];
  objc_super v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v21.receiver = self;
  v21.super_class = (Class)ULLogicAdapter;
  v9 = -[ULLogicAdapter init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    -[ULLogicAdapter setEnvironment:](v9, "setEnvironment:", v6);
    objc_msgSend(v6, "queue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = operator new();
    ULLogicAdapterImpl::ULLogicAdapterImpl(v12, v7, v10, v10, v11);
    value = v10->logicAdapterImpl.__ptr_.__value_;
    v10->logicAdapterImpl.__ptr_.__value_ = (ULLogicAdapterImpl *)v12;
    if (value)
      (*(void (**)(ULLogicAdapterImpl *))(*(_QWORD *)value + 8))(value);

    +[ULHomeSlamAnalytics shared](ULHomeSlamAnalytics, "shared");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10->logicAdapterImpl.__ptr_.__value_;
    -[ULLogicAdapter environment](v10, "environment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDependenciesAndRegisterToBackgroundTaskWithDB:environment:", (char *)v15 + 40, v16);

    v17 = cl::chrono::CFAbsoluteTimeClock::now();
    v18 = (_QWORD *)((char *)v10->logicAdapterImpl.__ptr_.__value_ + 40);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __47__ULLogicAdapter_initWithEnvironment_delegate___block_invoke;
    v20[3] = &__block_descriptor_40_e5_v8__0l;
    *(CFAbsoluteTime *)&v20[4] = v17;
    ULDatabase::registerDatabaseValidCallback(v18, v20);
    -[ULLogicAdapter _start](v10, "_start");
  }

  return v10;
}

void __47__ULLogicAdapter_initWithEnvironment_delegate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "databaseValid - log daemon started", v4, 2u);
  }
  +[ULHomeSlamAnalytics shared](ULHomeSlamAnalytics, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logEventDaemonStartedAtTimestamp:", *(double *)(a1 + 32));

}

- (void)dealloc
{
  objc_super v3;

  -[ULLogicAdapter _stop](self, "_stop");
  -[ULLogicAdapter setEnvironment:](self, "setEnvironment:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ULLogicAdapter;
  -[ULLogicAdapter dealloc](&v3, sel_dealloc);
}

- (BOOL)purgeMicroLocationData
{
  void *v3;
  NSObject *v4;
  char v5;

  -[ULLogicAdapter environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = CLMicroLocationLogic::onResetLocationData((CLMicroLocationLogic *)((char *)self->logicAdapterImpl.__ptr_.__value_
                                                                        + 224));
  if ((objc_msgSend(MEMORY[0x24BE669E0], "isMac") & 1) == 0)
    +[ULCoreDuetPublisher clearMicroLocationVisitStream](ULCoreDuetPublisher, "clearMicroLocationVisitStream");
  return v5;
}

- (void)_startSensors
{
}

- (id)deleteServiceWithIdentifier:(id)a3 clientIdentifier:(id)a4
{
  CLMicroLocationProtobufHelper *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  std::string *v11;
  std::string *v12;
  std::string *v13;
  ULLogicAdapterImpl *value;
  std::string::size_type v15;
  double v16;
  ULLogicAdapterImpl *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  int v25;
  int v26;
  std::string *v27;
  std::string *v28;
  int v29;
  void *__p[2];
  char v31;
  uint64_t v32;
  const __CFString *v33;
  std::string __str;
  char v35[8];
  uint64_t v36;
  std::string v37;
  uuid v38;
  char v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = (CLMicroLocationProtobufHelper *)a3;
  v7 = a4;
  -[ULLogicAdapter environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  std::string::basic_string[abi:ne180100]<0>(__p, "");
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v6, (uint64_t)&v38);
  if (!v39)
  {
    -[ULLogicAdapter deleteServiceWithIdentifier:clientIdentifier:].cold.1(&__str);

    abort_report_np();
    __break(1u);
  }
  CLMicroLocationProto::ServiceDelete::ServiceDelete((CLMicroLocationProto::ServiceDelete *)&v26);
  v10 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v10, "UTF8String"));
  v29 |= 2u;
  v11 = v27;
  v12 = (std::string *)MEMORY[0x24BEDD958];
  if (v27 == (std::string *)MEMORY[0x24BEDD958])
  {
    v11 = (std::string *)operator new();
    v11->__r_.__value_.__r.__words[0] = 0;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v27 = v11;
  }
  std::string::operator=(v11, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (!v39)
    std::__throw_bad_optional_access[abi:ne180100]();
  memset(&v37, 0, sizeof(v37));
  if ((boost::conversion::detail::try_lexical_convert<std::string,boost::uuids::uuid>((uint64_t)&v38, &v37) & 1) == 0)
  {
    std::bad_cast::bad_cast((std::bad_cast *)&__str);
    __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_2511D2C18;
    boost::throw_exception<boost::bad_lexical_cast>((uint64_t)&__str);
  }
  v29 |= 4u;
  v13 = v28;
  if (v28 == v12)
  {
    v13 = (std::string *)operator new();
    v13->__r_.__value_.__r.__words[0] = 0;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v28 = v13;
  }
  std::string::operator=(v13, &v37);
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v37.__r_.__value_.__l.__data_);
  value = self->logicAdapterImpl.__ptr_.__value_;
  v25 = 0;
  boost::uuids::detail::random_provider_base::random_provider_base((boost::uuids::detail::random_provider_base *)&v25);
  v37.__r_.__value_.__r.__words[0] = boost::uuids::random_generator_pure::operator()((uint64_t)&v25);
  v37.__r_.__value_.__l.__size_ = v15;
  v16 = cl::chrono::CFAbsoluteTimeClock::now();
  CLMicroLocationProtobufHelper::createLoggedEvent<CLMicroLocationProto::ServiceDelete>(&v37, &v26, (uint64_t)&__str, v16);
  (*(void (**)(ULLogicAdapterImpl *, std::string *))(*(_QWORD *)value + 72))(value, &__str);
  CLMicroLocationProto::ReceivedEvent::~ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)v35);
  boost::uuids::detail::random_provider_base::destroy((boost::uuids::detail::random_provider_base *)&v25);
  v17 = self->logicAdapterImpl.__ptr_.__value_;
  v18 = objc_retainAutorelease(v10);
  std::string::basic_string[abi:ne180100]<0>(&v37, (char *)objc_msgSend(v18, "UTF8String"));
  if (!v39)
    std::__throw_bad_optional_access[abi:ne180100]();
  CLMicroLocationLogic::deleteService((uint64_t)v17 + 224, (unsigned __int8 *)&v37, v38, (uint64_t *)__p, (uint64_t)&__str);
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v37.__r_.__value_.__l.__data_);
  v19 = (void *)objc_opt_new();
  if (v35[0])
  {
    v20 = +[ULLogicAdapter _newULServiceDescriptorFromInternalDescriptor:](ULLogicAdapter, "_newULServiceDescriptorFromInternalDescriptor:", &__str);
    objc_msgSend(v19, "setServiceDescriptor:", v20);

  }
  if (v36 != -1)
  {
    v32 = *MEMORY[0x24BDD0FC8];
    v33 = CFSTR("deleteServiceWithIdentifier failed internally");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc(MEMORY[0x24BDD1540]);
    v23 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", CFSTR("ULLogicDomain"), v36, v21);
    objc_msgSend(v19, "setError:", v23);

  }
  CLMicroLocationProto::ServiceDelete::~ServiceDelete((CLMicroLocationProto::ServiceDelete *)&v26);
  if (v31 < 0)
    operator delete(__p[0]);

  return v19;
}

- (id)queryServicesForClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  ULLogicAdapterImpl *value;
  id v8;
  void *v9;
  char *v10;
  char *v11;
  id v12;
  void *v13;
  void *__p[2];
  char v16;
  void *v17;
  char *v18;
  void *v19[2];
  char v20;

  v4 = a3;
  -[ULLogicAdapter environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  std::string::basic_string[abi:ne180100]<0>(v19, "");
  value = self->logicAdapterImpl.__ptr_.__value_;
  v8 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v8, "UTF8String"));
  CLMicroLocationLogic::queryServices((uint64_t)value + 224, (uint64_t *)__p, (uint64_t)v19, (uint64_t)&v17);
  if (v16 < 0)
    operator delete(__p[0]);
  v9 = (void *)objc_opt_new();
  v10 = (char *)v17;
  v11 = v18;
  if (v17 != v18)
  {
    do
    {
      v12 = +[ULLogicAdapter _newULServiceDescriptorFromInternalDescriptor:](ULLogicAdapter, "_newULServiceDescriptorFromInternalDescriptor:", v10);
      objc_msgSend(v9, "addObject:", v12);

      v10 += 32;
    }
    while (v10 != v11);
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (char *)v17;
    operator delete(v17);
  }
  if (v20 < 0)
    operator delete(v19[0]);

  return v13;
}

- (void)connectWithServiceIdentifier:(id)a3 legacyServiceIdentifier:(id)a4 clientIdentifier:(id)a5 connectionToken:(id)a6 requestIdentifier:(id)a7
{
  CLMicroLocationProtobufHelper *v12;
  CLMicroLocationProtobufHelper *v13;
  id v14;
  CLMicroLocationProtobufHelper *v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  std::string *v20;
  std::string *v21;
  std::string *v22;
  ULLogicAdapterImpl *value;
  std::string::size_type v24;
  double v25;
  ULLogicAdapterImpl *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  int v37;
  int v38;
  std::string *v39;
  std::string *v40;
  int v41;
  void *__p[2];
  char v43;
  uint64_t v44;
  const __CFString *v45;
  __int128 v46;
  std::string::value_type v47;
  _BYTE __str[28];
  __int16 v49;
  const char *v50;
  std::string v51;
  uint64_t v52[2];
  char v53;
  uint64_t v54[2];
  char v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v12 = (CLMicroLocationProtobufHelper *)a3;
  v13 = (CLMicroLocationProtobufHelper *)a4;
  v14 = a5;
  v15 = (CLMicroLocationProtobufHelper *)a6;
  v16 = a7;
  -[ULLogicAdapter environment](self, "environment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "queue");
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v18);

  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v12, (uint64_t)v54);
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v15, (uint64_t)v52);
  if (!v55)
  {
    _CLLogObjectForCategory_MicroLocation_Default();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      *(_QWORD *)__str = 68289539;
      *(_WORD *)&__str[8] = 2082;
      *(_QWORD *)&__str[10] = "";
      *(_WORD *)&__str[18] = 2082;
      *(_QWORD *)&__str[20] = "assert";
      v49 = 2081;
      v50 = "serviceId.has_value()";
      _os_log_impl(&dword_2419D9000, v32, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Connect to service without identifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", __str, 0x26u);
    }

    _CLLogObjectForCategory_MicroLocation_Default();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v33))
    {
      *(_QWORD *)__str = 68289539;
      *(_WORD *)&__str[8] = 2082;
      *(_QWORD *)&__str[10] = "";
      *(_WORD *)&__str[18] = 2082;
      *(_QWORD *)&__str[20] = "assert";
      v49 = 2081;
      v50 = "serviceId.has_value()";
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Connect to service without identifier", "{\"msg%{public}.0s\":\"Connect to service without identifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", __str, 0x26u);
    }

    _CLLogObjectForCategory_MicroLocation_Default();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_QWORD *)__str = 68289539;
      *(_WORD *)&__str[8] = 2082;
      *(_QWORD *)&__str[10] = "";
      *(_WORD *)&__str[18] = 2082;
      *(_QWORD *)&__str[20] = "assert";
      v49 = 2081;
      v50 = "serviceId.has_value()";
      _os_log_impl(&dword_2419D9000, v34, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Connect to service without identifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", __str, 0x26u);
    }
LABEL_38:

    abort_report_np();
    __break(1u);
  }
  if (!v53)
  {
    _CLLogObjectForCategory_MicroLocation_Default();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_QWORD *)__str = 68289539;
      *(_WORD *)&__str[8] = 2082;
      *(_QWORD *)&__str[10] = "";
      *(_WORD *)&__str[18] = 2082;
      *(_QWORD *)&__str[20] = "assert";
      v49 = 2081;
      v50 = "connectionId.has_value()";
      _os_log_impl(&dword_2419D9000, v35, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Connect to service without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", __str, 0x26u);
    }

    _CLLogObjectForCategory_MicroLocation_Default();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v36))
    {
      *(_QWORD *)__str = 68289539;
      *(_WORD *)&__str[8] = 2082;
      *(_QWORD *)&__str[10] = "";
      *(_WORD *)&__str[18] = 2082;
      *(_QWORD *)&__str[20] = "assert";
      v49 = 2081;
      v50 = "connectionId.has_value()";
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Connect to service without connectionToken", "{\"msg%{public}.0s\":\"Connect to service without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", __str, 0x26u);
    }

    _CLLogObjectForCategory_MicroLocation_Default();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_QWORD *)__str = 68289539;
      *(_WORD *)&__str[8] = 2082;
      *(_QWORD *)&__str[10] = "";
      *(_WORD *)&__str[18] = 2082;
      *(_QWORD *)&__str[20] = "assert";
      v49 = 2081;
      v50 = "connectionId.has_value()";
      _os_log_impl(&dword_2419D9000, v34, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Connect to service without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", __str, 0x26u);
    }
    goto LABEL_38;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  CLMicroLocationProto::ServiceConnect::ServiceConnect((CLMicroLocationProto::ServiceConnect *)&v38);
  v19 = objc_retainAutorelease(v14);
  std::string::basic_string[abi:ne180100]<0>(__str, (char *)objc_msgSend(v19, "UTF8String"));
  v41 |= 2u;
  v20 = v39;
  v21 = (std::string *)MEMORY[0x24BEDD958];
  if (v39 == (std::string *)MEMORY[0x24BEDD958])
  {
    v20 = (std::string *)operator new();
    v20->__r_.__value_.__r.__words[0] = 0;
    v20->__r_.__value_.__l.__size_ = 0;
    v20->__r_.__value_.__r.__words[2] = 0;
    v39 = v20;
  }
  std::string::operator=(v20, (const std::string *)__str);
  if ((__str[23] & 0x80000000) != 0)
    operator delete(*(void **)__str);
  if (!v55)
    std::__throw_bad_optional_access[abi:ne180100]();
  memset(&v51, 0, sizeof(v51));
  if ((boost::conversion::detail::try_lexical_convert<std::string,boost::uuids::uuid>((uint64_t)v54, &v51) & 1) == 0)
  {
    std::bad_cast::bad_cast((std::bad_cast *)__str);
    *(_QWORD *)__str = &unk_2511D2C18;
    boost::throw_exception<boost::bad_lexical_cast>((uint64_t)__str);
  }
  v41 |= 4u;
  v22 = v40;
  if (v40 == v21)
  {
    v22 = (std::string *)operator new();
    v22->__r_.__value_.__r.__words[0] = 0;
    v22->__r_.__value_.__l.__size_ = 0;
    v22->__r_.__value_.__r.__words[2] = 0;
    v40 = v22;
  }
  std::string::operator=(v22, &v51);
  if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v51.__r_.__value_.__l.__data_);
  value = self->logicAdapterImpl.__ptr_.__value_;
  v37 = 0;
  boost::uuids::detail::random_provider_base::random_provider_base((boost::uuids::detail::random_provider_base *)&v37);
  v51.__r_.__value_.__r.__words[0] = boost::uuids::random_generator_pure::operator()((uint64_t)&v37);
  v51.__r_.__value_.__l.__size_ = v24;
  v25 = cl::chrono::CFAbsoluteTimeClock::now();
  CLMicroLocationProtobufHelper::createLoggedEvent<CLMicroLocationProto::ServiceConnect>(&v51, &v38, (uint64_t)__str, v25);
  (*(void (**)(ULLogicAdapterImpl *, _BYTE *))(*(_QWORD *)value + 72))(value, __str);
  CLMicroLocationProto::ReceivedEvent::~ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)((char *)&v50 + 2));
  boost::uuids::detail::random_provider_base::destroy((boost::uuids::detail::random_provider_base *)&v37);
  if (v13)
  {
    CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v13, (uint64_t)&v51);
  }
  else
  {
    v51.__r_.__value_.__s.__data_[0] = 0;
    v51.__r_.__value_.__s.__data_[16] = 0;
  }
  v26 = self->logicAdapterImpl.__ptr_.__value_;
  v27 = objc_retainAutorelease(v19);
  std::string::basic_string[abi:ne180100]<0>(__str, (char *)objc_msgSend(v27, "UTF8String"));
  if (!v55 || (v46 = *(_OWORD *)&v51.__r_.__value_.__l.__data_, v47 = v51.__r_.__value_.__s.__data_[16], !v53))
    std::__throw_bad_optional_access[abi:ne180100]();
  v28 = CLMicroLocationLogic::connectToService((uint64_t)v26 + 224, (uint64_t)__str, v54[0], v54[1], &v46, v52[0], v52[1], (uint64_t)__p);
  if ((__str[23] & 0x80000000) != 0)
    operator delete(*(void **)__str);
  if (v28 != -1)
  {
    v29 = (void *)MEMORY[0x24BDD1540];
    v44 = *MEMORY[0x24BDD0FC8];
    v45 = CFSTR("connectWithServiceIdentifier failed internally");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("ULLogicDomain"), v28, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*((id *)self->logicAdapterImpl.__ptr_.__value_ + 374), "didFailWithError:toConnection:", v31, v15);
  }
  CLMicroLocationProto::ServiceConnect::~ServiceConnect((CLMicroLocationProto::ServiceConnect *)&v38);
  if (v43 < 0)
    operator delete(__p[0]);

}

- (void)disconnectWithConnectionToken:(id)a3 clientIdentifier:(id)a4 requestIdentifier:(id)a5
{
  CLMicroLocationProtobufHelper *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  ULLogicAdapterImpl *value;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  std::string __p;
  void *v19[2];
  char v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23[2];
  char v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = (CLMicroLocationProtobufHelper *)a3;
  v9 = a4;
  v10 = a5;
  -[ULLogicAdapter environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v8, (uint64_t)v23);
  if (!v24)
  {
    -[ULLogicAdapter disconnectWithConnectionToken:clientIdentifier:requestIdentifier:].cold.1(v19);

    abort_report_np();
    __break(1u);
  }
  std::string::basic_string[abi:ne180100]<0>(v19, "");
  value = self->logicAdapterImpl.__ptr_.__value_;
  v14 = objc_retainAutorelease(v9);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v14, "UTF8String"));
  if (!v24)
    std::__throw_bad_optional_access[abi:ne180100]();
  v15 = CLMicroLocationLogic::disconnectFromService((uint64_t)value + 224, &__p, v23[0], v23[1], (unsigned __int8 *)v19);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v15 != -1)
  {
    v21 = *MEMORY[0x24BDD0FC8];
    v22 = CFSTR("disconnect service failed internally");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ULLogicDomain"), v15, v16);
    objc_msgSend(*((id *)self->logicAdapterImpl.__ptr_.__value_ + 374), "didCompleteRequest:withError:toConnection:", v10, v17, v8);

  }
  if (v20 < 0)
    operator delete(v19[0]);

}

- (void)requestObservationForConnectionToken:(id)a3 clientIdentifier:(id)a4 requestIdentifier:(id)a5
{
  CLMicroLocationProtobufHelper *v8;
  id v9;
  CLMicroLocationProtobufHelper *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  const __CFString *v22;
  __int128 v23;
  char v24;
  uint8_t buf[8];
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32[2];
  char v33;
  uuid v34;
  char v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = (CLMicroLocationProtobufHelper *)a3;
  v9 = a4;
  v10 = (CLMicroLocationProtobufHelper *)a5;
  -[ULLogicAdapter environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v8, (uint64_t)&v34);
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v10, (uint64_t)v32);
  if (!v35)
  {
    _CLLogObjectForCategory_MicroLocation_Default();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2082;
      v29 = "assert";
      v30 = 2081;
      v31 = "connectionId.has_value()";
      _os_log_impl(&dword_2419D9000, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"request observation without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    _CLLogObjectForCategory_MicroLocation_Default();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v17))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2082;
      v29 = "assert";
      v30 = 2081;
      v31 = "connectionId.has_value()";
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "request observation without connectionToken", "{\"msg%{public}.0s\":\"request observation without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    _CLLogObjectForCategory_MicroLocation_Default();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2082;
      v29 = "assert";
      v30 = 2081;
      v31 = "connectionId.has_value()";
      _os_log_impl(&dword_2419D9000, v18, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"request observation without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_21:

    abort_report_np();
    __break(1u);
  }
  if (!v33)
  {
    _CLLogObjectForCategory_MicroLocation_Default();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2082;
      v29 = "assert";
      v30 = 2081;
      v31 = "requestId.has_value()";
      _os_log_impl(&dword_2419D9000, v19, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"request observation without requestIdentifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    _CLLogObjectForCategory_MicroLocation_Default();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2082;
      v29 = "assert";
      v30 = 2081;
      v31 = "requestId.has_value()";
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "request observation without requestIdentifier", "{\"msg%{public}.0s\":\"request observation without requestIdentifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    _CLLogObjectForCategory_MicroLocation_Default();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2082;
      v29 = "assert";
      v30 = 2081;
      v31 = "requestId.has_value()";
      _os_log_impl(&dword_2419D9000, v18, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"request observation without requestIdentifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_21;
  }
  *(_QWORD *)buf = cl::chrono::CFAbsoluteTimeClock::now();
  if (!v35 || !v33)
    std::__throw_bad_optional_access[abi:ne180100]();
  v13 = (char *)self->logicAdapterImpl.__ptr_.__value_ + 224;
  LOBYTE(v23) = 0;
  v24 = 0;
  if ((CLMicroLocationLogic::requestObservation((uint64_t)v13, v34, v32[0], v32[1], &v23, (double *)buf) & 1) == 0)
  {
    v21 = *MEMORY[0x24BDD0FC8];
    v22 = CFSTR("request observation failed internally");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ULLogicDomain"), 12, v14);
    objc_msgSend(*((id *)self->logicAdapterImpl.__ptr_.__value_ + 374), "didCompleteRequest:withError:toConnection:", v10, v15, v8);

  }
}

- (void)requestPredictionForConnectionToken:(id)a3 clientIdentifier:(id)a4 requestIdentifier:(id)a5
{
  CLMicroLocationProtobufHelper *v8;
  id v9;
  CLMicroLocationProtobufHelper *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  const __CFString *v21;
  uint8_t buf[8];
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  uuid v29;
  char v30;
  uuid v31;
  char v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = (CLMicroLocationProtobufHelper *)a3;
  v9 = a4;
  v10 = (CLMicroLocationProtobufHelper *)a5;
  -[ULLogicAdapter environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v8, (uint64_t)&v31);
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v10, (uint64_t)&v29);
  if (!v32)
  {
    _CLLogObjectForCategory_MicroLocation_Default();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2082;
      v26 = "assert";
      v27 = 2081;
      v28 = "connectionId.has_value()";
      _os_log_impl(&dword_2419D9000, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"request prediction without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    _CLLogObjectForCategory_MicroLocation_Default();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2082;
      v26 = "assert";
      v27 = 2081;
      v28 = "connectionId.has_value()";
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "request prediction without connectionToken", "{\"msg%{public}.0s\":\"request prediction without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    _CLLogObjectForCategory_MicroLocation_Default();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2082;
      v26 = "assert";
      v27 = 2081;
      v28 = "connectionId.has_value()";
      _os_log_impl(&dword_2419D9000, v17, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"request prediction without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_21:

    abort_report_np();
    __break(1u);
  }
  if (!v30)
  {
    _CLLogObjectForCategory_MicroLocation_Default();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2082;
      v26 = "assert";
      v27 = 2081;
      v28 = "requestId.has_value()";
      _os_log_impl(&dword_2419D9000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"request prediction without requestIdentifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    _CLLogObjectForCategory_MicroLocation_Default();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2082;
      v26 = "assert";
      v27 = 2081;
      v28 = "requestId.has_value()";
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "request prediction without requestIdentifier", "{\"msg%{public}.0s\":\"request prediction without requestIdentifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    _CLLogObjectForCategory_MicroLocation_Default();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2082;
      v26 = "assert";
      v27 = 2081;
      v28 = "requestId.has_value()";
      _os_log_impl(&dword_2419D9000, v17, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"request prediction without requestIdentifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_21;
  }
  *(_QWORD *)buf = cl::chrono::CFAbsoluteTimeClock::now();
  if (!v32 || !v30)
    std::__throw_bad_optional_access[abi:ne180100]();
  if ((CLMicroLocationLogic::predictionRequest((uint64_t)self->logicAdapterImpl.__ptr_.__value_ + 224, v31, &v29, (double *)buf, 1) & 1) == 0)
  {
    v20 = *MEMORY[0x24BDD0FC8];
    v21 = CFSTR("request prediction failed internally");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ULLogicDomain"), 29, v13);
    objc_msgSend(*((id *)self->logicAdapterImpl.__ptr_.__value_ + 374), "didCompleteRequest:withError:toConnection:", v10, v14, v8);

  }
}

- (void)labelObservationForConnectionToken:(id)a3 withRequestIdentifier:(id)a4 andPlaceIdentifier:(id)a5 andReturnIdentifier:(id)a6
{
  CLMicroLocationProtobufHelper *v10;
  CLMicroLocationProtobufHelper *v11;
  CLMicroLocationProtobufHelper *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  uuid v33;
  char v34;
  uuid v35;
  char v36;
  uuid v37;
  char v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = (CLMicroLocationProtobufHelper *)a3;
  v11 = (CLMicroLocationProtobufHelper *)a4;
  v12 = (CLMicroLocationProtobufHelper *)a5;
  v13 = a6;
  -[ULLogicAdapter environment](self, "environment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v15);

  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v10, (uint64_t)&v37);
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v11, (uint64_t)&v35);
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v12, (uint64_t)&v33);
  if (!v38)
  {
    _CLLogObjectForCategory_MicroLocation_Default();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      v29 = 2082;
      v30 = "assert";
      v31 = 2081;
      v32 = "connectionId.has_value()";
      _os_log_impl(&dword_2419D9000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"request observation without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    _CLLogObjectForCategory_MicroLocation_Default();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 68289539;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      v29 = 2082;
      v30 = "assert";
      v31 = 2081;
      v32 = "connectionId.has_value()";
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "request observation without connectionToken", "{\"msg%{public}.0s\":\"request observation without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    _CLLogObjectForCategory_MicroLocation_Default();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      v29 = 2082;
      v30 = "assert";
      v31 = 2081;
      v32 = "connectionId.has_value()";
      _os_log_impl(&dword_2419D9000, v20, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"request observation without connectionToken\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_20:

    abort_report_np();
    __break(1u);
  }
  if (!v36)
  {
    _CLLogObjectForCategory_MicroLocation_Default();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      v29 = 2082;
      v30 = "assert";
      v31 = 2081;
      v32 = "requestId.has_value()";
      _os_log_impl(&dword_2419D9000, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"request observation without requestIdentifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    _CLLogObjectForCategory_MicroLocation_Default();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      *(_DWORD *)buf = 68289539;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      v29 = 2082;
      v30 = "assert";
      v31 = 2081;
      v32 = "requestId.has_value()";
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "request observation without requestIdentifier", "{\"msg%{public}.0s\":\"request observation without requestIdentifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    _CLLogObjectForCategory_MicroLocation_Default();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      v29 = 2082;
      v30 = "assert";
      v31 = 2081;
      v32 = "requestId.has_value()";
      _os_log_impl(&dword_2419D9000, v20, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"request observation without requestIdentifier\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_20;
  }
  if (!v34)
    std::__throw_bad_optional_access[abi:ne180100]();
  if (!CLMicroLocationLogic::labelObservation((CLMicroLocationLogic *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 224), v37, v35, v33))
  {
    v23 = *MEMORY[0x24BDD0FC8];
    v24 = CFSTR("request label single observation failed internally");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ULLogicDomain"), 13, v16);
    objc_msgSend(*((id *)self->logicAdapterImpl.__ptr_.__value_ + 374), "didCompleteRequest:withError:toConnection:", v13, v17, v10);

  }
}

- (void)startUpdatingForConnectionToken:(id)a3 updateConfiguration:(id)a4 requestIdentifier:(id)a5
{
  CLMicroLocationProtobufHelper *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  ULLogicAdapterImpl *value;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  const __CFString *v21;
  _QWORD v22[2];
  char v23;
  uint64_t v24;
  uuid v25;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = (CLMicroLocationProtobufHelper *)a3;
  v9 = a4;
  v10 = a5;
  -[ULLogicAdapter environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v8, (uint64_t)v22);
  if (!v23)
  {
    -[ULLogicAdapter startUpdatingForConnectionToken:updateConfiguration:requestIdentifier:].cold.1(&v19);

    abort_report_np();
    __break(1u);
  }
  value = self->logicAdapterImpl.__ptr_.__value_;
  v14 = v22[0];
  v15 = v22[1];
  v16 = objc_msgSend(v9, "isLowLatency");
  *(_QWORD *)v25.var0 = v14;
  *(_QWORD *)&v25.var0[8] = v15;
  if (CLMicroLocationLogic::startUpdating((CLMicroLocationLogic *)((char *)value + 224), v25, v16))
  {
    v17 = 0;
  }
  else
  {
    v20 = *MEMORY[0x24BDD0FC8];
    v21 = CFSTR("start updating failed internally");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ULLogicDomain"), 16, v18);

  }
  objc_msgSend(*((id *)self->logicAdapterImpl.__ptr_.__value_ + 374), "didCompleteRequest:withError:toConnection:", v10, v17, v8);

}

- (void)stopUpdatingForConnectionToken:(id)a3 requestIdentifier:(id)a4
{
  CLMicroLocationProtobufHelper *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  const __CFString *v12;
  uuid v13;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = (CLMicroLocationProtobufHelper *)a3;
  v7 = a4;
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v6, (uint64_t)&v13);
  if (!v14)
  {
    -[ULLogicAdapter stopUpdatingForConnectionToken:requestIdentifier:].cold.1(&v10);

    abort_report_np();
    __break(1u);
  }
  if (CLMicroLocationLogic::stopUpdating((CLMicroLocationLogic *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 224), &v13))
  {
    v8 = 0;
  }
  else
  {
    v11 = *MEMORY[0x24BDD0FC8];
    v12 = CFSTR("stop updating failed internally");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ULLogicDomain"), 17, v9);

  }
  objc_msgSend(*((id *)self->logicAdapterImpl.__ptr_.__value_ + 374), "didCompleteRequest:withError:toConnection:", v7, v8, v6);

}

- (void)createCustomLoiAtCurrentLocationForConnectionToken:(id)a3 withConfiguration:(id)a4
{
  CLMicroLocationProtobufHelper *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  const __CFString *v15;
  uint8_t buf[4];
  CLMicroLocationProtobufHelper *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (CLMicroLocationProtobufHelper *)a3;
  v7 = a4;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v8 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "createCustomLoiAtCurrentLocationForConnectionToken: %@ withConfiguration: %@", buf, 0x16u);
  }
  -[ULLogicAdapter environment](self, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v6, (uint64_t)buf);
  if (!BYTE2(v19))
  {
    -[ULLogicAdapter createCustomLoiAtCurrentLocationForConnectionToken:withConfiguration:].cold.1(&v13);

    abort_report_np();
    __break(1u);
  }
  if ((CLMicroLocationLogic::createCustomLoiAtCurrentLocation((uint64_t)self->logicAdapterImpl.__ptr_.__value_ + 224, (const uuid *)buf, v7) & 1) == 0)
  {
    v14 = *MEMORY[0x24BDD0FC8];
    v15 = CFSTR("Enable MicroLocation at current location failed");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ULLogicDomain"), 34, v11);
    objc_msgSend(*((id *)self->logicAdapterImpl.__ptr_.__value_ + 374), "didCreateCustomLoiAtCurrentLocationWithError:forConnection:", v12, v6);

  }
}

- (void)removeCustomLoiWithIdentifier:(id)a3 forConnectionToken:(id)a4
{
  id v6;
  CLMicroLocationProtobufHelper *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  _BYTE buf[12];
  __int16 v17;
  CLMicroLocationProtobufHelper *v18;
  char v19;
  uuid v20;
  char v21;
  uuid v22;
  char v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (CLMicroLocationProtobufHelper *)a4;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v8 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "removeCustomLoiWithIdentifier: %@, forConnectionToken: %@", buf, 0x16u);
  }
  -[ULLogicAdapter environment](self, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v7, (uint64_t)&v22);
  if (!v23)
  {
    -[ULLogicAdapter removeCustomLoiWithIdentifier:forConnectionToken:].cold.1(buf);

    abort_report_np();
    goto LABEL_17;
  }
  v11 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(v11, "UTF8String"));
  CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)buf, (uint64_t)&v20);
  if (v19 < 0)
    operator delete(*(void **)buf);
  if (!v21)
  {
    -[ULLogicAdapter removeCustomLoiWithIdentifier:forConnectionToken:].cold.2(buf);

    abort_report_np();
LABEL_17:
    __break(1u);
  }
  if (!v23)
    std::__throw_bad_optional_access[abi:ne180100]();
  if ((CLMicroLocationLogic::removeCustomLoiWithIdentifier((CLMicroLocationLogic *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 224), &v20, v22) & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v14 = *MEMORY[0x24BDD0FC8];
    v15 = CFSTR("Remove Custom Loi failed");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ULLogicDomain"), 0, v13);

  }
  objc_msgSend(*((id *)self->logicAdapterImpl.__ptr_.__value_ + 374), "didRemoveCustomLoiWithIdentifier:forConnection:withError:", v11, v7, v12);

}

- (void)removePendingConnectionRequestsByConnectionToken:(id)a3
{
  CLMicroLocationProtobufHelper *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uuid buf;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (CLMicroLocationProtobufHelper *)a3;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf.var0 = 138412290;
    *(_QWORD *)&buf.var0[4] = v4;
    _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "remove pending connection requests by ConnectionToken: %@", buf.var0, 0xCu);
  }
  -[ULLogicAdapter environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v4, (uint64_t)&buf);
  if (!v10)
  {
    -[ULLogicAdapter removePendingConnectionRequestsByConnectionToken:].cold.1(&v8);

    abort_report_np();
    __break(1u);
  }
  CLMicroLocationLogic::removePendingConnectionRequestsByConnectionToken((CLMicroLocationLogic *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 224), buf);

}

- (id)exportDatabase
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  ULDatabase::exportDatabase((ULDatabase *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExportedURLs:", v4);

  objc_msgSend(v3, "exportedURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    v10 = *MEMORY[0x24BDD0FC8];
    v11[0] = CFSTR("export database failed internally");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ULLogicDomain"), 36, v7);
    objc_msgSend(v3, "setError:", v8);

  }
  return v3;
}

- (id)purgeDatabase
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (-[ULLogicAdapter purgeMicroLocationData](self, "purgeMicroLocationData"))
    return 0;
  v5 = *MEMORY[0x24BDD0FC8];
  v6[0] = CFSTR("purge database failed internally");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ULLogicDomain"), 37, v3);

  return v4;
}

- (void)requestModelLearningForConnectionToken:(id)a3 requestIdentifier:(id)a4
{
  CLMicroLocationProtobufHelper *v6;
  CLMicroLocationProtobufHelper *v7;
  ULLogicAdapterImpl *value;
  void *__p[2];
  uint64_t v10;
  uuid v11;
  char v12;
  uint64_t v13[2];
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = (CLMicroLocationProtobufHelper *)a3;
  v7 = (CLMicroLocationProtobufHelper *)a4;
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v6, (uint64_t)v13);
  if (!v14)
  {
    -[ULLogicAdapter requestModelLearningForConnectionToken:requestIdentifier:].cold.1(__p);

    abort_report_np();
    goto LABEL_10;
  }
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v7, (uint64_t)&v11);
  if (!v12)
  {
    -[ULLogicAdapter requestModelLearningForConnectionToken:requestIdentifier:].cold.2(__p);

    abort_report_np();
LABEL_10:
    __break(1u);
  }
  value = self->logicAdapterImpl.__ptr_.__value_;
  __p[0] = 0;
  __p[1] = 0;
  v10 = 0;
  if (!v14)
    std::__throw_bad_optional_access[abi:ne180100]();
  CLMicroLocationLogic::requestMicroLocationLearning((uint64_t)value + 224, (uint64_t)__p, v13[0], v13[1], &v11);
  if (SHIBYTE(v10) < 0)
    operator delete(__p[0]);

}

- (id)getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 shouldForceRecording:(BOOL)a4 handler:(id)a5 clientId:(id)a6
{
  _BOOL8 v8;
  NSDictionary *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  ULLogicAdapterImpl *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  ULLogicAdapterImpl *value;
  char v22;
  char v23;
  CFAbsoluteTime v25;
  uint64_t v26;
  void *v27;
  _BYTE buf[12];
  __int16 v29;
  void *v30;
  char v31;
  uint64_t v32;

  v8 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v10 = (NSDictionary *)a3;
  v11 = a5;
  v12 = a6;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v13 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v12;
    v29 = 2112;
    v30 = v14;
    _os_log_impl(&dword_2419D9000, v13, OS_LOG_TYPE_DEFAULT, "received recording scan request, clientId: %@, forced: %@", buf, 0x16u);

  }
  if (!CLMicroLocationLegacyClient::isHomeKitRequest((CLMicroLocationLegacyClient *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 2848), v10))
  {
    value = self->logicAdapterImpl.__ptr_.__value_;
    std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
    v25 = cl::chrono::CFAbsoluteTimeClock::now();
    v22 = CLMicroLocationLegacyClient::onRecordingRequest((CLMicroLocationLegacyClient *)((char *)value + 2848), (uint64_t)buf, v10, &v25);
    v23 = v22;
    if (v31 < 0)
    {
      operator delete(*(void **)buf);
      if ((v23 & 1) == 0)
        goto LABEL_7;
    }
    else if ((v22 & 1) == 0)
    {
      goto LABEL_7;
    }
LABEL_10:
    v20 = 0;
    goto LABEL_11;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:copyItems:", v10, 1);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_2511EE368, CFSTR("shouldTriggerRecordingScan"));
  v16 = self->logicAdapterImpl.__ptr_.__value_;
  *(_QWORD *)buf = cl::chrono::CFAbsoluteTimeClock::now();
  LOBYTE(v16) = CLMicroLocationLegacyClient::onHomeKit((CLMicroLocationLegacyClient *)((char *)v16 + 2848), v15, (double *)buf);

  if ((v16 & 1) != 0)
    goto LABEL_10;
LABEL_7:
  v17 = objc_alloc(MEMORY[0x24BDD1540]);
  v26 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("requestMicroLocationRecordingScan failed internally, MiLo is not at right state"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("ULLogicDomain"), 39, v19);

LABEL_11:
  return v20;
}

- (id)donateMicroLocationTruthTagWithTagUUID:(id)a3 correspondingToTriggerUUID:(id)a4 handler:(id)a5 clientId:(id)a6
{
  CLMicroLocationProtobufHelper *v10;
  CLMicroLocationProtobufHelper *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *__p[2];
  char v19;
  uint64_t v20;
  const __CFString *v21;
  _QWORD v22[2];
  char v23;
  _QWORD v24[2];
  char v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = (CLMicroLocationProtobufHelper *)a3;
  v11 = (CLMicroLocationProtobufHelper *)a4;
  v12 = a5;
  v13 = objc_retainAutorelease(a6);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v13, "UTF8String"));
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v10, (uint64_t)v24);
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v11, (uint64_t)v22);
  if (!v25 || !v23)
    std::__throw_bad_optional_access[abi:ne180100]();
  if ((CLMicroLocationLegacyClient::donateTruthTagLabel((uint64_t)self->logicAdapterImpl.__ptr_.__value_ + 2848, (uint64_t)__p, v24, v22) & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x24BDD1540]);
    v20 = *MEMORY[0x24BDD0FC8];
    v21 = CFSTR("donateTruthTagLabelForClient failed internally");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("ULLogicDomain"), 40, v16);

  }
  if (v19 < 0)
    operator delete(__p[0]);

  return v14;
}

- (id)donateMicroLocationTruthTagWithTagUUID:(id)a3 forRecordingEventsBetweenDate:(id)a4 andDate:(id)a5 handler:(id)a6 clientId:(id)a7
{
  CLMicroLocationProtobufHelper *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *__p[2];
  char v22;
  uint64_t v23;
  const __CFString *v24;
  _BYTE v25[17];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v12 = (CLMicroLocationProtobufHelper *)a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = objc_retainAutorelease(a7);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v16, "UTF8String"));
  CLMicroLocationProtobufHelper::boostUuidFromNSUUID(v12, (uint64_t)v25);
  if (!v25[16])
    std::__throw_bad_optional_access[abi:ne180100]();
  if ((CLMicroLocationLegacyClient::donateTruthTagLabelForRecordingEventsBetweenDates((uint64_t)self->logicAdapterImpl.__ptr_.__value_ + 2848, (uint64_t)__p, (uint64_t)v25, v13, v14) & 1) != 0)
  {
    v17 = 0;
  }
  else
  {
    v18 = objc_alloc(MEMORY[0x24BDD1540]);
    v23 = *MEMORY[0x24BDD0FC8];
    v24 = CFSTR("donateTruthTagLabelForClient failed internally");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", CFSTR("ULLogicDomain"), 40, v19);

  }
  if (v22 < 0)
    operator delete(__p[0]);

  return v17;
}

- (void)requestCurrentMicroLocationWithAdditionalInformation:(id)a3 clientId:(id)a4
{
  NSDictionary *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  ULLogicAdapterImpl *value;
  ULLogicAdapterImpl *v12;
  CFAbsoluteTime v13;
  std::string buf;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = (NSDictionary *)a3;
  v7 = a4;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v8 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v7;
    _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "Client request Current microlocation, clientIdentifier: %@", (uint8_t *)&buf, 0xCu);
  }
  v9 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(v9, "UTF8String"));
  if (CLMicroLocationLegacyClient::isHomeKitRequest((CLMicroLocationLegacyClient *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 2848), v6))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:copyItems:", v6, 1);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_2511EE368, CFSTR("shouldTriggerLocalizationScan"));
    value = self->logicAdapterImpl.__ptr_.__value_;
    v13 = cl::chrono::CFAbsoluteTimeClock::now();
    CLMicroLocationLegacyClient::onHomeKit((CLMicroLocationLegacyClient *)((char *)value + 2848), v10, &v13);

  }
  else
  {
    v12 = self->logicAdapterImpl.__ptr_.__value_;
    v13 = cl::chrono::CFAbsoluteTimeClock::now();
    CLMicroLocationLegacyClient::onLocalizationRequest((CLMicroLocationLegacyClient *)((char *)v12 + 2848), &buf, &v13);
  }
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);

}

- (void)requestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 clientId:(id)a4
{
  NSDictionary *v6;
  id v7;
  void *v8;
  ULLogicAdapterImpl *value;
  ULLogicAdapterImpl *v10;
  CFAbsoluteTime v11;
  void *__p[2];
  char v13;

  v6 = (NSDictionary *)a3;
  v7 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
  if (CLMicroLocationLegacyClient::isHomeKitRequest((CLMicroLocationLegacyClient *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 2848), v6))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:copyItems:", v6, 1);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_2511EE368, CFSTR("shouldTriggerRecordingScan"));
    value = self->logicAdapterImpl.__ptr_.__value_;
    v11 = cl::chrono::CFAbsoluteTimeClock::now();
    CLMicroLocationLegacyClient::onHomeKit((CLMicroLocationLegacyClient *)((char *)value + 2848), v8, &v11);

  }
  else
  {
    v10 = self->logicAdapterImpl.__ptr_.__value_;
    v11 = cl::chrono::CFAbsoluteTimeClock::now();
    CLMicroLocationLegacyClient::onRecordingRequest((CLMicroLocationLegacyClient *)((char *)v10 + 2848), (uint64_t)__p, v6, &v11);
  }
  if (v13 < 0)
    operator delete(__p[0]);

}

- (id)getMicroLocationInternalVersion
{
  void *v2;
  void **v3;
  void *v4;
  void *__p[2];
  char v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  ULSettings::get<ULSettings::Version>((uint64_t)__p);
  if (v7 >= 0)
    v3 = __p;
  else
    v3 = (void **)__p[0];
  objc_msgSend(v2, "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 < 0)
    operator delete(__p[0]);
  return v4;
}

- (void)startRapportSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[ULLogicAdapter environment](self, "environment");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rapportMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULEvent eventName](ULRapportMonitorEventIdentities, "eventName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:eventName:", self, sel__handleULRapportMonitorEventIdentities_, v4);

  -[ULLogicAdapter environment](self, "environment");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rapportMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULEvent eventName](ULRapportMonitorEventDeviceFound, "eventName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:eventName:", self, sel__handleULRapportMonitorEventDeviceFound_, v6);

}

- (void)stopRapportSession
{
  void *v3;
  id v4;

  -[ULLogicAdapter environment](self, "environment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rapportMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (BOOL)isDataAvailable
{
  void *v2;
  void *v3;
  char v4;

  -[ULLogicAdapter environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataProtectionMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDataAvailable");

  return v4;
}

- (void)_start
{
  void *v3;
  void *v4;

  -[ULLogicAdapter _registerOnDatabaseValidNotification](self, "_registerOnDatabaseValidNotification");
  -[ULLogicAdapter _startMonitoringEvents](self, "_startMonitoringEvents");
  -[ULLogicAdapter environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "diagnostics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addProvider:", self);

  -[ULLogicAdapter _startSensors](self, "_startSensors");
  -[ULLogicAdapter _registerOrUnregisterForActivities:](self, "_registerOrUnregisterForActivities:", 1);
}

- (void)_registerOnDatabaseValidNotification
{
  _QWORD *v2;
  _QWORD v3[5];

  v2 = (_QWORD *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__ULLogicAdapter__registerOnDatabaseValidNotification__block_invoke;
  v3[3] = &unk_2511D4650;
  v3[4] = self;
  ULDatabase::registerDatabaseValidCallback(v2, v3);
}

void __54__ULLogicAdapter__registerOnDatabaseValidNotification__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__ULLogicAdapter__registerOnDatabaseValidNotification__block_invoke_2;
  block[3] = &unk_2511D4650;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v3, block);

}

uint64_t __54__ULLogicAdapter__registerOnDatabaseValidNotification__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "handling database valid notification", v4, 2u);
  }
  CLMicroLocationLogic::onDatabaseBecameValid((CLMicroLocationLogic *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 224));
  CLMicroLocationLegacyClient::databaseAvailable((CLMicroLocationLegacyClient *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                               + 2848));
  return notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BE669A0], "UTF8String"));
}

- (void)_stop
{
  void *v3;
  id v4;

  -[ULLogicAdapter _stopMonitoringEvents](self, "_stopMonitoringEvents");
  -[ULLogicAdapter _registerOrUnregisterForActivities:](self, "_registerOrUnregisterForActivities:", 0);
  -[ULLogicAdapter environment](self, "environment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "diagnostics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeProvider:", self);

}

- (void)_startMonitoringEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  -[ULLogicAdapter environment](self, "environment");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "dataProtectionMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULEvent eventName](ULDataProtectionMonitorEventDataAvailable, "eventName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:eventName:", self, sel__handleULDataProtectionMonitorEventDataAvailable_, v4);

  -[ULLogicAdapter environment](self, "environment");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "airplaneModeMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULEvent eventName](ULAirplaneModeMonitorEventAirplaneMode, "eventName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:eventName:", self, sel__handleULAirplaneModeMonitorEventAirplaneMode_, v6);

  -[ULLogicAdapter environment](self, "environment");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "batteryModeMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULEvent eventName](ULBatteryModeMonitorEventUnlimitedPower, "eventName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:eventName:", self, sel__handleULBatteryModeMonitorEventUnlimitedPower_, v8);

  -[ULLogicAdapter environment](self, "environment");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "batteryModeMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULEvent eventName](ULBatteryModeMonitorEventLowPowerMode, "eventName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:eventName:", self, sel__handleULBatteryModeMonitorEventLowPowerMode_, v10);

  -[ULLogicAdapter environment](self, "environment");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bluetoothMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULEvent eventName](ULBluetoothMonitorEventPowerOn, "eventName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:eventName:", self, sel__handleULBluetoothMonitorEventPowerOn_, v12);

  -[ULLogicAdapter environment](self, "environment");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "displayMonitor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULEvent eventName](ULDisplayMonitorEventDisplayState, "eventName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:eventName:", self, sel__handleULDisplayMonitorEventDisplayState_, v14);

  -[ULLogicAdapter environment](self, "environment");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "displayMonitor_OSX");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULEvent eventName](ULDisplayMonitorEventDisplayState_OSX, "eventName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:eventName:", self, sel__handleULDisplayMonitorEventDisplayState_OSX_, v16);

  -[ULLogicAdapter environment](self, "environment");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "internalNotifyMonitor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULEvent eventName](ULInternalNotifyMonitorEventLocalize, "eventName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:eventName:", self, sel__handleULInternalNotifyMonitorEventLocalize_, v18);

  -[ULLogicAdapter environment](self, "environment");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "internalNotifyMonitor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULEvent eventName](ULInternalNotifyMonitorEventRecord, "eventName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObserver:selector:eventName:", self, sel__handleULInternalNotifyMonitorEventRecord_, v20);

  -[ULLogicAdapter environment](self, "environment");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "internalNotifyMonitor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULEvent eventName](ULInternalNotifyMonitorEventPurge, "eventName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObserver:selector:eventName:", self, sel__handleULInternalNotifyMonitorEventPurge_, v22);

  -[ULLogicAdapter environment](self, "environment");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "internalNotifyMonitor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULEvent eventName](ULInternalNotifyMonitorEventSettingsRefresh, "eventName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObserver:selector:eventName:", self, sel__handleULInternalNotifyMonitorEventSettingsRefrsh_, v24);

  -[ULLogicAdapter environment](self, "environment");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "privacyMonitor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULEvent eventName](ULPrivacyMonitorEventLocationServices, "eventName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObserver:selector:eventName:", self, sel__handleULPrivacyMonitorEventLocationServices_, v26);

  -[ULLogicAdapter environment](self, "environment");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "buddyMonitor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULEvent eventName](ULBuddyMonitorEventBuddyComplete, "eventName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:selector:eventName:", self, sel__handleULBuddyMonitorEventBuddyComplete_, v28);

}

- (void)_stopMonitoringEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  -[ULLogicAdapter environment](self, "environment");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataProtectionMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[ULLogicAdapter environment](self, "environment");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "airplaneModeMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[ULLogicAdapter environment](self, "environment");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "batteryModeMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[ULLogicAdapter environment](self, "environment");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bluetoothMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[ULLogicAdapter environment](self, "environment");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "displayMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  -[ULLogicAdapter environment](self, "environment");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "displayMonitor_OSX");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  -[ULLogicAdapter environment](self, "environment");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "internalNotifyMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:", self);

  -[ULLogicAdapter environment](self, "environment");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "privacyMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

  -[ULLogicAdapter environment](self, "environment");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "buddyMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:", self);

}

- (void)_registerOrUnregisterForActivities:(BOOL)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  +[ULBGRepeatingSystemTaskRequest learningULBGRepeatingSystemTaskRequest](ULBGRepeatingSystemTaskRequest, "learningULBGRepeatingSystemTaskRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ULLogicAdapter _registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:](self, "_registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:");

  +[ULBGRepeatingSystemTaskRequest maintenanceULBGRepeatingSystemTaskRequest](ULBGRepeatingSystemTaskRequest, "maintenanceULBGRepeatingSystemTaskRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ULLogicAdapter _registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:](self, "_registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:");

  +[ULBGRepeatingSystemTaskRequest routineStateAnalyzerULBGRepeatingSystemTaskRequest](ULBGRepeatingSystemTaskRequest, "routineStateAnalyzerULBGRepeatingSystemTaskRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ULLogicAdapter _registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:](self, "_registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:");

  +[ULBGRepeatingSystemTaskRequest analyticsULBGRepeatingSystemTaskRequest](ULBGRepeatingSystemTaskRequest, "analyticsULBGRepeatingSystemTaskRequest");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ULLogicAdapter _registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:](self, "_registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:");

  +[ULBGRepeatingSystemTaskRequest wifiAnalyzerULBGRepeatingSystemTaskRequest](ULBGRepeatingSystemTaskRequest, "wifiAnalyzerULBGRepeatingSystemTaskRequest");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ULLogicAdapter _registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:](self, "_registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:");

  +[ULBGRepeatingSystemTaskRequest exportBackupULBGRepeatingSystemTaskRequest](ULBGRepeatingSystemTaskRequest, "exportBackupULBGRepeatingSystemTaskRequest");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[ULLogicAdapter _registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:](self, "_registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:");

}

- (void)_registerOrUnregisterForBackgroundTaskWithRequest:(id)a3 withSelector:(SEL)a4 requiresMiLoEnabled:(BOOL)a5 isRegister:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27[2];
  BOOL v28;
  id location;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v6 = a6;
  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    _CLLogObjectForCategory_MicroLocation_Default();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector(a4);
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      location = (id)68289795;
      v30 = 2082;
      v31 = "";
      v32 = 2082;
      v33 = objc_msgSend(v19, "UTF8String");
      v34 = 2082;
      v35 = "assert";
      v36 = 2081;
      v37 = "[self respondsToSelector:selector]";
      _os_log_impl(&dword_2419D9000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"ULLogicAdapter does not respond to selector\", \"selector\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&location, 0x30u);

    }
    _CLLogObjectForCategory_MicroLocation_Default();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
    {
      NSStringFromSelector(a4);
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v22 = objc_msgSend(v21, "UTF8String");
      location = (id)68289795;
      v30 = 2082;
      v31 = "";
      v32 = 2082;
      v33 = v22;
      v34 = 2082;
      v35 = "assert";
      v36 = 2081;
      v37 = "[self respondsToSelector:selector]";
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ULLogicAdapter does not respond to selector", "{\"msg%{public}.0s\":\"ULLogicAdapter does not respond to selector\", \"selector\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&location, 0x30u);

    }
    _CLLogObjectForCategory_MicroLocation_Default();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a4);
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[ULLogicAdapter _registerOrUnregisterForBackgroundTaskWithRequest:withSelector:requiresMiLoEnabled:isRegister:].cold.1(objc_msgSend(v24, "UTF8String"), (uint8_t *)&location, v23, v24);
    }

    abort_report_np();
    __break(1u);
  }
  if (v6)
  {
    objc_initWeak(&location, self);
    -[ULLogicAdapter environment](self, "environment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backgroundSystemTaskManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULLogicAdapter environment](self, "environment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "queue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __112__ULLogicAdapter__registerOrUnregisterForBackgroundTaskWithRequest_withSelector_requiresMiLoEnabled_isRegister___block_invoke;
    v25[3] = &unk_2511DB348;
    objc_copyWeak(v27, &location);
    v28 = a5;
    v26 = v10;
    v27[1] = (id)a4;
    objc_msgSend(v12, "registerAndSubmitTaskWithRequest:usingQueue:launchHandler:", v26, v14, v25);

    objc_destroyWeak(v27);
    objc_destroyWeak(&location);
  }
  else
  {
    -[ULLogicAdapter environment](self, "environment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "backgroundSystemTaskManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "deregisterAndCancelTaskWithIdentifier:", v17);

  }
}

void __112__ULLogicAdapter__registerOrUnregisterForBackgroundTaskWithRequest_withSelector_requiresMiLoEnabled_isRegister___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    if (*(_BYTE *)(a1 + 56) && (CLMicroLocationLogic::enabled((CLMicroLocationLogic *)(v5[1] + 224)) & 1) == 0)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
      v10 = (id)logObject_MicroLocation_Default;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_INFO, "Skipping run of background system task %@ due to Microlocations disabled.", buf, 0xCu);

      }
    }
    else
    {
      +[ULTransactionManager shared](ULTransactionManager, "shared");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __112__ULLogicAdapter__registerOrUnregisterForBackgroundTaskWithRequest_withSelector_requiresMiLoEnabled_isRegister___block_invoke_148;
      v12[3] = &unk_2511D4628;
      v9 = *(_QWORD *)(a1 + 48);
      v12[4] = v5;
      v14 = v9;
      v13 = v3;
      objc_msgSend(v8, "performUnderTransaction:block:", CFSTR("com.apple.milod.backgroundTasks"), v12);

    }
  }

}

uint64_t __112__ULLogicAdapter__registerOrUnregisterForBackgroundTaskWithRequest_withSelector_requiresMiLoEnabled_isRegister___block_invoke_148(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_learnExecute:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[5];
  uint64_t v7;
  id v8;
  void **v9;
  _QWORD v10[3];
  _QWORD *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  CLMicroLocationLearner::CLMicroLocationLearner(v6, (char *)self->logicAdapterImpl.__ptr_.__value_ + 8, (char *)self->logicAdapterImpl.__ptr_.__value_ + 40);
  v10[0] = &off_2511DB910;
  v10[1] = &v8;
  v11 = v10;
  CLMicroLocationLearner::executeWorkItems(v6, (uint64_t)v10);
  v4 = v11;
  if (v11 == v10)
  {
    v5 = 4;
    v4 = v10;
    goto LABEL_5;
  }
  if (v11)
  {
    v5 = 5;
LABEL_5:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  v9 = (void **)&v7;
  std::vector<std::function<void ()(std::function<BOOL ()(void)>)>>::__destroy_vector::operator()[abi:ne180100](&v9);

}

- (void)_maintenanceExecute:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void **v9;
  _QWORD v10[3];
  _QWORD *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  CLMicroLocationMaintenance::CLMicroLocationMaintenance((CLMicroLocationMaintenance *)&v6, (ULDatabase *)((char *)self->logicAdapterImpl.__ptr_.__value_ + 40));
  v10[0] = &off_2511DB990;
  v10[1] = &v8;
  v11 = v10;
  CLMicroLocationMaintenance::executeWorkItems(&v6, (uint64_t)v10);
  v4 = v11;
  if (v11 == v10)
  {
    v5 = 4;
    v4 = v10;
    goto LABEL_5;
  }
  if (v11)
  {
    v5 = 5;
LABEL_5:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  v9 = (void **)&v7;
  std::vector<std::function<void ()(std::function<BOOL ()(void)>)>>::__destroy_vector::operator()[abi:ne180100](&v9);

}

- (void)_routineStateAnalyzerExecute:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void **v9;
  _QWORD v10[3];
  _QWORD *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  CLMicroLocationRoutineStateAnalyzer::CLMicroLocationRoutineStateAnalyzer(&v6, (char *)self->logicAdapterImpl.__ptr_.__value_ + 16);
  v10[0] = &off_2511DBA10;
  v10[1] = &v8;
  v11 = v10;
  CLMicroLocationRoutineStateAnalyzer::executeWorkItems(&v6, (uint64_t)v10);
  v4 = v11;
  if (v11 == v10)
  {
    v5 = 4;
    v4 = v10;
    goto LABEL_5;
  }
  if (v11)
  {
    v5 = 5;
LABEL_5:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  v9 = (void **)&v7;
  std::vector<std::function<void ()(std::function<BOOL ()(void)>)>>::__destroy_vector::operator()[abi:ne180100](&v9);

}

- (void)_analyticsExecute:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[2];
  uint64_t v7;
  id v8;
  void **v9;
  _QWORD v10[3];
  _QWORD *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  CLMicroLocationAnalytics::CLMicroLocationAnalytics(v6, (char *)self->logicAdapterImpl.__ptr_.__value_ + 24, (char *)self->logicAdapterImpl.__ptr_.__value_ + 40);
  v10[0] = &off_2511DBA90;
  v10[1] = &v8;
  v11 = v10;
  CLMicroLocationAnalytics::executeWorkItems(v6, (uint64_t)v10);
  v4 = v11;
  if (v11 == v10)
  {
    v5 = 4;
    v4 = v10;
    goto LABEL_5;
  }
  if (v11)
  {
    v5 = 5;
LABEL_5:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  v9 = (void **)&v7;
  std::vector<std::function<void ()(std::function<BOOL ()(void)>)>>::__destroy_vector::operator()[abi:ne180100](&v9);

}

- (void)_wifiAnalyticsExecute:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[3];
  _QWORD *v10;
  _QWORD v11[2];
  _BYTE v12[24];
  _BYTE *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  ULWiFiHistogramAnalyzer::ULWiFiHistogramAnalyzer(v11, (uint64_t)self->logicAdapterImpl.__ptr_.__value_ + 32, (uint64_t)self->logicAdapterImpl.__ptr_.__value_ + 40);
  v9[0] = &off_2511DBB10;
  v9[1] = &v8;
  v10 = v9;
  ULWiFiHistogramAnalyzer::executeWiFiItem((uint64_t)v11, (uint64_t)v9);
  v4 = v10;
  if (v10 == v9)
  {
    v5 = 4;
    v4 = v9;
  }
  else
  {
    if (!v10)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(_QWORD *))(*v4 + 8 * v5))(v4);
LABEL_6:
  v6 = v13;
  if (v13 == v12)
  {
    v7 = 4;
    v6 = v12;
    goto LABEL_10;
  }
  if (v13)
  {
    v7 = 5;
LABEL_10:
    (*(void (**)(_QWORD *))(*v6 + 8 * v7))(v6);
  }

}

- (void)_exportiCloudBackupExecute:(id)a3
{
  ULBackupAndRestore *v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v4 = -[ULBackupAndRestore initWithDatabase:andEventLogger:]([ULBackupAndRestore alloc], "initWithDatabase:andEventLogger:", (char *)self->logicAdapterImpl.__ptr_.__value_ + 40, (char *)self->logicAdapterImpl.__ptr_.__value_ + 192);
  v8[0] = &off_2511DBB90;
  v8[1] = &v7;
  v9 = v8;
  -[ULBackupAndRestore exportiCloudBackupWithCancelFunc:](v4, "exportiCloudBackupWithCancelFunc:", v8);
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
    (*(void (**)(_QWORD *))(*v5 + 8 * v6))(v5);
  }

}

- (void)_handleULDataProtectionMonitorEventDataAvailable:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v7, "dataAvailable");
    v10 = CFSTR("NO");
    if (v9)
      v10 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v15 = v10;
    _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "_handleULDataProtectionMonitorEventDataAvailable: dataAvailable: %@", buf, 0xCu);
  }

  if ((objc_msgSend(v7, "dataAvailable") & 1) != 0)
  {
    -[ULLogicAdapter environment](self, "environment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__ULLogicAdapter__handleULDataProtectionMonitorEventDataAvailable___block_invoke;
    block[3] = &unk_2511D4650;
    block[4] = self;
    dispatch_async(v12, block);

  }
}

void __67__ULLogicAdapter__handleULDataProtectionMonitorEventDataAvailable___block_invoke(uint64_t a1)
{
  CLMicroLocationLogic::onKeybagUnlocked((ULDatabase **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 224));
}

- (void)_handleULAirplaneModeMonitorEventAirplaneMode:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v7, "airplaneMode");
    v10 = CFSTR("NO");
    if (v9)
      v10 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "_handleULAirplaneModeMonitorEventAirplaneMode: airplaneMode: %@", buf, 0xCu);
  }

  -[ULLogicAdapter environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __64__ULLogicAdapter__handleULAirplaneModeMonitorEventAirplaneMode___block_invoke;
  v14[3] = &unk_2511DB370;
  v14[4] = self;
  v15 = v7;
  v13 = v7;
  dispatch_async(v12, v14);

}

void __64__ULLogicAdapter__handleULAirplaneModeMonitorEventAirplaneMode___block_invoke(uint64_t a1)
{
  CLMicroLocationLegacyClient::setAirplaneMode(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 2848, objc_msgSend(*(id *)(a1 + 40), "airplaneMode"));
  CLMicroLocationLogic::setAirplaneMode((CLMicroLocationLogic *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 224), objc_msgSend(*(id *)(a1 + 40), "airplaneMode"));
}

- (void)_handleULBatteryModeMonitorEventUnlimitedPower:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v7, "unlimitedPower");
    v10 = CFSTR("NO");
    if (v9)
      v10 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "_handleULBatteryModeMonitorEventUnlimitedPower: unlimitedPower: %@", buf, 0xCu);
  }

  -[ULLogicAdapter environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __65__ULLogicAdapter__handleULBatteryModeMonitorEventUnlimitedPower___block_invoke;
  v14[3] = &unk_2511DB370;
  v14[4] = self;
  v15 = v7;
  v13 = v7;
  dispatch_async(v12, v14);

}

uint64_t __65__ULLogicAdapter__handleULBatteryModeMonitorEventUnlimitedPower___block_invoke(uint64_t a1)
{
  CLMicroLocationLegacyClient *v2;
  char v3;
  CFAbsoluteTime v5;

  v2 = (CLMicroLocationLegacyClient *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 2848);
  v3 = objc_msgSend(*(id *)(a1 + 40), "unlimitedPower");
  v5 = cl::chrono::CFAbsoluteTimeClock::now();
  CLMicroLocationLegacyClient::onBatteryState(v2, v3, &v5);
  return CLMicroLocationLogic::onMacPowerChange((CLMicroLocationLogic *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 224), objc_msgSend(*(id *)(a1 + 40), "unlimitedPower"));
}

- (void)_handleULBatteryModeMonitorEventLowPowerMode:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v7, "lowPowerMode");
    v10 = CFSTR("NO");
    if (v9)
      v10 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "_handleULBatteryModeMonitorEventLowPowerMode: lowPowerMode: %@", buf, 0xCu);
  }

  -[ULLogicAdapter environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __63__ULLogicAdapter__handleULBatteryModeMonitorEventLowPowerMode___block_invoke;
  v14[3] = &unk_2511DB370;
  v14[4] = self;
  v15 = v7;
  v13 = v7;
  dispatch_async(v12, v14);

}

void __63__ULLogicAdapter__handleULBatteryModeMonitorEventLowPowerMode___block_invoke(uint64_t a1)
{
  CLMicroLocationLegacyClient::setLowPowerMode(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 2848, objc_msgSend(*(id *)(a1 + 40), "lowPowerMode"));
  CLMicroLocationLogic::setPowerMode((CLMicroLocationLogic *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 224), objc_msgSend(*(id *)(a1 + 40), "lowPowerMode"));
}

- (void)_handleULBluetoothMonitorEventPowerOn:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v7, "powerOn");
    v10 = CFSTR("NO");
    if (v9)
      v10 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "_handleULBluetoothMonitorEventPowerOn: powerOn: %@", buf, 0xCu);
  }

  -[ULLogicAdapter environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__ULLogicAdapter__handleULBluetoothMonitorEventPowerOn___block_invoke;
  v14[3] = &unk_2511DB370;
  v14[4] = self;
  v15 = v7;
  v13 = v7;
  dispatch_async(v12, v14);

}

uint64_t __56__ULLogicAdapter__handleULBluetoothMonitorEventPowerOn___block_invoke(uint64_t a1)
{
  return CLMicroLocationLogic::setBluetoothPower(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 224, objc_msgSend(*(id *)(a1 + 40), "powerOn"));
}

- (void)_handleULRapportMonitorEventIdentities:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ULLogicAdapter *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "_handleULRapportMonitorEventIdentities: identities: %@", buf, 0xCu);

  }
  -[ULLogicAdapter environment](self, "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__ULLogicAdapter__handleULRapportMonitorEventIdentities___block_invoke;
  v13[3] = &unk_2511DB370;
  v14 = v7;
  v15 = self;
  v12 = v7;
  dispatch_async(v11, v13);

}

void __57__ULLogicAdapter__handleULRapportMonitorEventIdentities___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "identities", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v7, "btAddress");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(v7, "btIRKData");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9 == 0;

          if (!v10)
          {
            v11 = objc_alloc_init(MEMORY[0x24BDBB270]);
            objc_msgSend(v7, "btAddress");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setBtAddressData:", v12);

            objc_msgSend(v7, "btIRKData");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setIrkData:", v13);

            objc_msgSend(v2, "addObject:", v11);
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v4);
  }

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v14 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = objc_msgSend(v2, "count");
    *(_DWORD *)buf = 68289282;
    v21 = 0;
    v22 = 2082;
    v23 = "";
    v24 = 2050;
    v25 = v15;
    _os_log_impl(&dword_2419D9000, v14, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"BLE oobkey updated\", \"key array size\":%{public}lu}", buf, 0x1Cu);
  }

  CLMicroLocationLogic::updateBleOobKeys(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 224, v2);
}

- (void)_handleULRapportMonitorEventDeviceFound:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ULLogicAdapter *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "_handleULRapportMonitorEventDeviceFound: new device: %@", buf, 0xCu);

  }
  -[ULLogicAdapter environment](self, "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__ULLogicAdapter__handleULRapportMonitorEventDeviceFound___block_invoke;
  v13[3] = &unk_2511DB370;
  v14 = v7;
  v15 = self;
  v12 = v7;
  dispatch_async(v11, v13);

}

void __58__ULLogicAdapter__handleULRapportMonitorEventDeviceFound___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *__p[2];
  char v16;
  void *v17[2];
  char v18;
  void *v19[2];
  char v20;

  objc_msgSend(*(id *)(a1 + 32), "device");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "idsDeviceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_13;
  objc_msgSend(*(id *)(a1 + 32), "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

LABEL_13:
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    objc_msgSend(*(id *)(a1 + 32), "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "idsDeviceIdentifier");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v19, (char *)objc_msgSend(v9, "UTF8String"));
    objc_msgSend(*(id *)(a1 + 32), "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "model");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v17, (char *)objc_msgSend(v11, "UTF8String"));
    objc_msgSend(*(id *)(a1 + 32), "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v13, "UTF8String"));
    CLMicroLocationLogic::onRapportCompanionDeviceFound(v7 + 224, (uint64_t)v19, (uint64_t)v17, (__int128 *)__p);
    if (v16 < 0)
      operator delete(__p[0]);

    if (v18 < 0)
      operator delete(v17[0]);

    if (v20 < 0)
      operator delete(v19[0]);

  }
}

- (void)_handleULDisplayMonitorEventDisplayState:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ULLogicAdapter *v13;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  -[ULLogicAdapter environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__ULLogicAdapter__handleULDisplayMonitorEventDisplayState___block_invoke;
  v11[3] = &unk_2511DB370;
  v12 = v7;
  v13 = self;
  v10 = v7;
  dispatch_async(v9, v11);

}

- (void)_handleULDisplayMonitorEventDisplayState_OSX:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ULLogicAdapter *v13;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  -[ULLogicAdapter environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__ULLogicAdapter__handleULDisplayMonitorEventDisplayState_OSX___block_invoke;
  v11[3] = &unk_2511DB370;
  v12 = v7;
  v13 = self;
  v10 = v7;
  dispatch_async(v9, v11);

}

void __63__ULLogicAdapter__handleULDisplayMonitorEventDisplayState_OSX___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const __CFString *v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "screenOnChanged"))
    CLMicroLocationLogic::onDisplayStateChange_OSX((CLMicroLocationLogic *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 224), objc_msgSend(*(id *)(a1 + 32), "screenOn"));
  if (objc_msgSend(*(id *)(a1 + 32), "clamshellModeChanged"))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
    v2 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(*(id *)(a1 + 32), "clamshellMode");
      v4 = CFSTR("Off");
      if (v3)
        v4 = CFSTR("On");
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "_handleULDisplayMonitorEventDisplayState_OSX: clamshellMode: %@", (uint8_t *)&v8, 0xCu);
    }

    CLMicroLocationLogic::onMacExternalScreenChange((CLMicroLocationLogic *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 224), objc_msgSend(*(id *)(a1 + 32), "clamshellMode"));
  }
  if (objc_msgSend(*(id *)(a1 + 32), "screenLockedChanged"))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
    v5 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "screenLocked");
      v7 = CFSTR("Off");
      if (v6)
        v7 = CFSTR("On");
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "_handleULDisplayMonitorEventDisplayState_OSX: screenLock: %@", (uint8_t *)&v8, 0xCu);
    }

    CLMicroLocationLogic::setLockScreenState((CLMicroLocationLogic *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 224), objc_msgSend(*(id *)(a1 + 32), "screenLocked"));
  }
}

- (void)_handleULInternalNotifyMonitorEventLocalize:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  objc_opt_isKindOfClass();

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "_handleULInternalNotifyMonitorEventLocalize: localize", buf, 2u);
  }
  -[ULLogicAdapter environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__ULLogicAdapter__handleULInternalNotifyMonitorEventLocalize___block_invoke;
  block[3] = &unk_2511D4650;
  block[4] = self;
  dispatch_async(v8, block);

}

void __62__ULLogicAdapter__handleULInternalNotifyMonitorEventLocalize___block_invoke(uint64_t a1)
{
  uint64_t v1;
  CFAbsoluteTime v2;
  std::string __p;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  std::string::basic_string[abi:ne180100]<0>(&__p, "NotificationCenter");
  v2 = cl::chrono::CFAbsoluteTimeClock::now();
  CLMicroLocationLegacyClient::onLocalizationRequest((CLMicroLocationLegacyClient *)(v1 + 2848), &__p, &v2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

- (void)_handleULInternalNotifyMonitorEventRecord:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  objc_opt_isKindOfClass();

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "_handleULInternalNotifyMonitorEventRecord: record", buf, 2u);
  }
  -[ULLogicAdapter environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__ULLogicAdapter__handleULInternalNotifyMonitorEventRecord___block_invoke;
  block[3] = &unk_2511D4650;
  block[4] = self;
  dispatch_async(v8, block);

}

void __60__ULLogicAdapter__handleULInternalNotifyMonitorEventRecord___block_invoke(uint64_t a1)
{
  CLMicroLocationLegacyClient *v1;
  CFAbsoluteTime v2;

  v1 = (CLMicroLocationLegacyClient *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 2848);
  v2 = cl::chrono::CFAbsoluteTimeClock::now();
  CLMicroLocationLegacyClient::onForcedRecording(v1, &v2);
}

- (void)_handleULInternalNotifyMonitorEventPurge:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  objc_opt_isKindOfClass();

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "_handleULInternalNotifyMonitorEventPurge: purge", buf, 2u);
  }
  -[ULLogicAdapter environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__ULLogicAdapter__handleULInternalNotifyMonitorEventPurge___block_invoke;
  block[3] = &unk_2511D4650;
  block[4] = self;
  dispatch_async(v8, block);

}

uint64_t __59__ULLogicAdapter__handleULInternalNotifyMonitorEventPurge___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "purgeMicroLocationData");
}

- (void)_handleULInternalNotifyMonitorEventSettingsRefrsh:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  objc_opt_isKindOfClass();

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "_handleULInternalNotifyMonitorEventSettingsRefrsh: refresh", buf, 2u);
  }
  -[ULLogicAdapter environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__ULLogicAdapter__handleULInternalNotifyMonitorEventSettingsRefrsh___block_invoke;
  block[3] = &unk_2511D4650;
  block[4] = self;
  dispatch_async(v8, block);

}

void __68__ULLogicAdapter__handleULInternalNotifyMonitorEventSettingsRefrsh___block_invoke(ULSettings *a1)
{
  ULSettings::refresh(a1);
  CLMicroLocationLogic::refreshSettings((CLMicroLocationLogic *)(*(_QWORD *)(*((_QWORD *)a1 + 4) + 8) + 224));
}

- (void)_handleULPrivacyMonitorEventLocationServices:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v7, "locationServicesEnabled");
    v10 = CFSTR("NO");
    if (v9)
      v10 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "_handleULPrivacyMonitorEventLocationServices: locationServicesEnabled: %@", buf, 0xCu);
  }

  -[ULLogicAdapter environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __63__ULLogicAdapter__handleULPrivacyMonitorEventLocationServices___block_invoke;
  v14[3] = &unk_2511DB370;
  v14[4] = self;
  v15 = v7;
  v13 = v7;
  dispatch_async(v12, v14);

}

void __63__ULLogicAdapter__handleULPrivacyMonitorEventLocationServices___block_invoke(uint64_t a1)
{
  CLMicroLocationLogic::setLocationServicesEnabled((CLMicroLocationLogic *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 224), objc_msgSend(*(id *)(a1 + 40), "locationServicesEnabled"));
  CLMicroLocationLogic::setSignificantLocationsEnabled((CLMicroLocationLogic *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 224), objc_msgSend(*(id *)(a1 + 40), "locationServicesEnabled"));
}

- (void)_handleULBuddyMonitorEventBuddyComplete:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_608);
  v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v7, "buddyComplete");
    v10 = CFSTR("NO");
    if (v9)
      v10 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "_handleULBuddyMonitorEventBuddyComplete: buddyComplete: %@", buf, 0xCu);
  }

  -[ULLogicAdapter environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __58__ULLogicAdapter__handleULBuddyMonitorEventBuddyComplete___block_invoke;
  v14[3] = &unk_2511DB370;
  v14[4] = self;
  v15 = v7;
  v13 = v7;
  dispatch_async(v12, v14);

}

void __58__ULLogicAdapter__handleULBuddyMonitorEventBuddyComplete___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  CLMicroLocationLegacyClient::setBuddyComplete(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 2848, objc_msgSend(*(id *)(a1 + 40), "buddyComplete"));
  CLMicroLocationLogic::onBuddyComplete((CLMicroLocationLogic *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 224), objc_msgSend(*(id *)(a1 + 40), "buddyComplete"));
  if (objc_msgSend(*(id *)(a1 + 40), "buddyComplete"))
  {
    objc_msgSend(*(id *)(a1 + 32), "environment");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "buddyMonitor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 32));

  }
}

+ (id)_newULServiceDescriptorFromInternalDescriptor:(const void *)a3
{
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_opt_new();
  for (i = 0; i != 32; ++i)
  {
    if (((*((_QWORD *)a3 + 3) >> i) & 1) != 0)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66948]), "initWithLocationTypeEnum:", i);
      objc_msgSend(v4, "addObject:", v6);

    }
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3);
  v8 = objc_alloc(MEMORY[0x24BE66960]);
  v9 = *((_QWORD *)a3 + 2);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithServiceIdentifier:serviceType:locationTypes:", v7, v9, v10);

  return v11;
}

- (ULEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (void).cxx_destruct
{
  ULLogicAdapterImpl *value;

  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_loiBridge, 0);
  value = self->logicAdapterImpl.__ptr_.__value_;
  self->logicAdapterImpl.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(ULLogicAdapterImpl *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (id)diagnosticInfo
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[ULLogicAdapter environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__22;
  v14 = __Block_byref_object_dispose__22;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[ULLogicAdapter environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__ULLogicAdapter_ULDiagnosticsProvider__diagnosticInfo__block_invoke;
  v9[3] = &unk_2511D40E0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __55__ULLogicAdapter_ULDiagnosticsProvider__diagnosticInfo__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("Date");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  CLMicroLocationLogic::logState((CLMicroLocationLogic *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 224));
}

- (uint64_t)_startSensors
{
    return a1 + 8;
  else
    return 0;
}

- (_QWORD)_startSensors
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_2511DB880;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

- (id)_startSensors
{
  id result;

  *a2 = &off_2511DB880;
  result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- (ULWiFiScanProvider)_startSensors
{
  id v3;
  ULWiFiScanProvider *v4;

  v3 = *a2;
  v4 = -[ULWiFiScanProvider initWithDelegate:andQueue:]([ULWiFiScanProvider alloc], "initWithDelegate:andQueue:", v3, *(_QWORD *)(a1 + 8));

  return v4;
}

- (ULOdometryProvider)_startSensors
{
  id v3;
  ULOdometryProvider *v4;

  v3 = *a2;
  v4 = -[ULOdometryProvider initWithQueue:delegate:]([ULOdometryProvider alloc], "initWithQueue:delegate:", *(_QWORD *)(a1 + 8), v3);

  return v4;
}

- (void)_learnExecute:
{
}

- (_QWORD)_learnExecute:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_2511DB910;
  result[1] = v3;
  return result;
}

- (uint64_t)_learnExecute:
{
    return a1 + 8;
  else
    return 0;
}

- (void)_maintenanceExecute:
{
}

- (_QWORD)_maintenanceExecute:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_2511DB990;
  result[1] = v3;
  return result;
}

- (uint64_t)_maintenanceExecute:
{
    return a1 + 8;
  else
    return 0;
}

- (void)_routineStateAnalyzerExecute:
{
}

- (_QWORD)_routineStateAnalyzerExecute:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_2511DBA10;
  result[1] = v3;
  return result;
}

- (uint64_t)_routineStateAnalyzerExecute:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)_analyticsExecute:
{
}

- (_QWORD)_analyticsExecute:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_2511DBA90;
  result[1] = v3;
  return result;
}

- (uint64_t)_analyticsExecute:
{
    return a1 + 8;
  else
    return 0;
}

- (void)_wifiAnalyticsExecute:
{
}

- (_QWORD)_wifiAnalyticsExecute:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_2511DBB10;
  result[1] = v3;
  return result;
}

- (uint64_t)_wifiAnalyticsExecute:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)_exportiCloudBackupExecute:
{
}

- (_QWORD)_exportiCloudBackupExecute:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_2511DBB90;
  result[1] = v3;
  return result;
}

- (uint64_t)_exportiCloudBackupExecute:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)_registerOrUnregisterForBackgroundTaskWithRequest:(uint64_t)a1 withSelector:(uint8_t *)buf requiresMiLoEnabled:(os_log_t)log isRegister:(void *)a4 .cold.1(uint64_t a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_QWORD *)buf = 68289795;
  *((_WORD *)buf + 4) = 2082;
  *(_QWORD *)(buf + 10) = "";
  *((_WORD *)buf + 9) = 2082;
  *(_QWORD *)(buf + 20) = a1;
  *((_WORD *)buf + 14) = 2082;
  *(_QWORD *)(buf + 30) = "assert";
  *((_WORD *)buf + 19) = 2081;
  *((_QWORD *)buf + 5) = "[self respondsToSelector:selector]";
  _os_log_impl(&dword_2419D9000, log, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"ULLogicAdapter does not respond to selector\", \"selector\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);

}

@end
