@implementation RFSelfAuthExtensionHelper

- (RFSelfAuthExtensionHelper)init
{
  char *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RFSelfAuthExtensionHelper;
  v2 = -[RFSelfAuthExtensionHelper init](&v8, "init");
  BasebandRFDiagnostics::create((BasebandRFDiagnostics *)v2);
  v3 = (std::__shared_weak_count *)*((_QWORD *)v2 + 2);
  *(_OWORD *)(v2 + 8) = v7;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  return (RFSelfAuthExtensionHelper *)v2;
}

- (void)dealloc
{
  os_log_s *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "RFSelfAuthExtensionHelper dealloc", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)RFSelfAuthExtensionHelper;
  -[RFSelfAuthExtensionHelper dealloc](&v4, "dealloc");
}

- (void)resetAll
{
  BasebandRFDiagnostics *ptr;
  os_log_s *v3;
  uint8_t v4[16];

  ptr = self->fBasebandDiagnostics.__ptr_;
  if (ptr)
    BasebandRFDiagnostics::resetAll(ptr);
  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "RFSelfAuthExtensionHelper reset", v4, 2u);
  }
}

- (void)clearRFSelfTestTicket
{
  BasebandRFDiagnostics::clearRFSelfTestTicket(self->fBasebandDiagnostics.__ptr_);
}

- (int64_t)getSignedTicketAndStore:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t SignedTicketAndStore;
  uint64_t v5;
  int64_t v6;
  os_log_s *v7;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;

  v3 = a3;
  SignedTicketAndStore = BasebandRFDiagnostics::getSignedTicketAndStore(self->fBasebandDiagnostics.__ptr_, a3);
  v5 = SignedTicketAndStore;
  if (SignedTicketAndStore > 5)
    v6 = -99;
  else
    v6 = qword_1000038E0[(int)SignedTicketAndStore];
  v7 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = v3;
    v10 = 2080;
    v11 = BasebandRFDiagnostics::asString(v5);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Get signed tiket with APTag(=%d) and store:  %s", (uint8_t *)v9, 0x12u);
  }
  return v6;
}

- (int64_t)getPersonalizationInfo
{
  uint64_t PersonalizationInfo;
  os_log_s *v3;
  int v5;
  uint64_t v6;

  PersonalizationInfo = BasebandRFDiagnostics::getPersonalizationInfo(self->fBasebandDiagnostics.__ptr_);
  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = BasebandRFDiagnostics::asString(PersonalizationInfo);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Get personalization info: %s", (uint8_t *)&v5, 0xCu);
  }
  return (_DWORD)PersonalizationInfo != 0;
}

- (BOOL)loadTestConfigFromUserDefaults
{
  BasebandRFDiagnostics *ptr;
  BasebandRFDiagnostics *v4;
  os_log_s *v5;
  _BOOL4 overrideTestConfigEnable;
  os_log_s *v7;
  _BOOL4 override_addAPTagToTicket;
  void *__p;
  __int128 v11;

  ptr = self->fBasebandDiagnostics.__ptr_;
  __p = operator new(0x20uLL);
  v11 = xmmword_1000038C0;
  strcpy((char *)__p, "overrideTestConfigEnable");
  self->testConfig.overrideTestConfigEnable = BasebandDiagnostics::readIntegerFromUserDefaults(ptr, &__p) != 0;
  if (SHIBYTE(v11) < 0)
    operator delete(__p);
  v4 = self->fBasebandDiagnostics.__ptr_;
  __p = operator new(0x20uLL);
  v11 = xmmword_1000038D0;
  strcpy((char *)__p, "override_addAPTagToTicket");
  self->testConfig.override_addAPTagToTicket = BasebandDiagnostics::readIntegerFromUserDefaults(v4, &__p) != 0;
  if (SHIBYTE(v11) < 0)
    operator delete(__p);
  v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    overrideTestConfigEnable = self->testConfig.overrideTestConfigEnable;
    LODWORD(__p) = 67109120;
    HIDWORD(__p) = overrideTestConfigEnable;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Test config: overrides test config enabled = %d", (uint8_t *)&__p, 8u);
  }
  if (self->testConfig.overrideTestConfigEnable)
  {
    v7 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      override_addAPTagToTicket = self->testConfig.override_addAPTagToTicket;
      LODWORD(__p) = 67109120;
      HIDWORD(__p) = override_addAPTagToTicket;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "\taddTagToTicket=%d", (uint8_t *)&__p, 8u);
    }
  }
  return self->testConfig.overrideTestConfigEnable;
}

- (TestConfigFlag)testConfiguration
{
  return self->testConfig;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->fBasebandDiagnostics.__cntrl_;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
