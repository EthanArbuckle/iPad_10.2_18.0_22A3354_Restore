@implementation IDSSysdiagnoseLogCollector

+ (id)sharedInstance
{
  if (qword_1ECDD47E0 != -1)
    dispatch_once(&qword_1ECDD47E0, &unk_1E3C1BA10);
  return (id)qword_1ECDD4830;
}

- (IDSSysdiagnoseLogCollector)init
{
  IDSSysdiagnoseLogCollector *v2;
  IDSSysdiagnoseLogCollector *v3;
  IDSSysdiagnoseLogCollector *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IDSSysdiagnoseLogCollector;
  v2 = -[IDSSysdiagnoseLogCollector init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)collectSysdiagnoseLog:(id)a3
{
  void (**v4)(id, void *);
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  char isInternalInstall;
  int v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A50], v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isInternalInstall = objc_msgSend_isInternalInstall(v8, v9, v10, v11);

  v13 = _IDSIsLoggingProfileInstalled();
  if ((isInternalInstall & 1) != 0 || v13)
  {
    objc_msgSend__collectSysdiagnoseLog_(self, v14, (uint64_t)v4, v15);
  }
  else
  {
    IMPrintf();
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v16, (uint64_t)CFSTR("Sysdiagnose disabled {isInternalInstall: %@, hasLoggingProfileInstalled: %@}"), v17, CFSTR("NO"), CFSTR("NO"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v26, v20, &v25, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v22, (uint64_t)CFSTR("IDSSysdiagnoseLogCollectorErrorDomain"), v23, -1, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v24);

  }
}

- (void)_collectSysdiagnoseLog:(id)a3
{
  id v3;
  _xpc_connection_s *mach_service;
  xpc_object_t v5;
  void *v6;
  NSObject *v7;
  _QWORD handler[4];
  id v9;

  v3 = a3;
  mach_service = xpc_connection_create_mach_service("com.apple.sysdiagnose.service.xpc", 0, 0);
  if (mach_service)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    v6 = v5;
    if (v5)
    {
      xpc_dictionary_set_string(v5, "run", "sysdiagnose");
      xpc_dictionary_set_BOOL(v6, "compress", 1);
      xpc_connection_set_event_handler(mach_service, &unk_1E3C1BCB0);
      xpc_connection_resume(mach_service);
      IMPrintf();
      im_primary_queue();
      v7 = objc_claimAutoreleasedReturnValue();
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = sub_19BADE008;
      handler[3] = &unk_1E3C22250;
      v9 = v3;
      xpc_connection_send_message_with_reply(mach_service, v6, v7, handler);

    }
  }

}

@end
