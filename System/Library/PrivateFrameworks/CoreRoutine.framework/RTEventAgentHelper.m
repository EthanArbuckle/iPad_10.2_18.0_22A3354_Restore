@implementation RTEventAgentHelper

- (RTEventAgentHelper)initWithRestorationIdentifier:(id)a3
{
  id v4;
  RTEventAgentHelper *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSString *restorationIdentifier;
  xpc_object_t v10;
  void *v11;
  xpc_object_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  RTEventAgentHelper *v17;
  _QWORD handler[4];
  RTEventAgentHelper *v20;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && +[RTEventAgentHelper launchdManaged](RTEventAgentHelper, "launchdManaged"))
  {
    v21.receiver = self;
    v21.super_class = (Class)RTEventAgentHelper;
    v5 = -[RTEventAgentHelper init](&v21, sel_init);
    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB3940]);
      +[RTEventAgentHelper signingIdentifierFromSelf](RTEventAgentHelper, "signingIdentifierFromSelf");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "initWithFormat:", CFSTR("%@-%@"), v7, v4);
      restorationIdentifier = v5->_restorationIdentifier;
      v5->_restorationIdentifier = (NSString *)v8;

      if (v5->_restorationIdentifier)
      {
        v10 = xpc_dictionary_create(0, 0, 0);
        if (v10)
        {
          v11 = v10;
          v12 = xpc_string_create(-[NSString UTF8String](v5->_restorationIdentifier, "UTF8String"));
          if (v12)
          {
            v13 = v12;
            xpc_dictionary_set_value(v11, "RestorationIdentifier", v12);
            objc_msgSend(CFSTR("com.apple.routined-events"), "UTF8String");
            xpc_set_event();
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              -[RTEventAgentHelper restorationIdentifier](v5, "restorationIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v23 = v15;
              _os_log_impl(&dword_1A5E26000, v14, OS_LOG_TYPE_INFO, "setup client with restorationIdentifier, %@", buf, 0xCu);

            }
            v16 = (const char *)objc_msgSend(CFSTR("com.apple.routined-events"), "UTF8String");
            handler[0] = MEMORY[0x1E0C809B0];
            handler[1] = 3221225472;
            handler[2] = __52__RTEventAgentHelper_initWithRestorationIdentifier___block_invoke;
            handler[3] = &unk_1E4FB1600;
            v20 = v5;
            xpc_set_event_stream_handler(v16, MEMORY[0x1E0C80D38], handler);

          }
        }
      }
    }
    self = v5;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restorationIdentifier, 0);
}

+ (BOOL)launchdManaged
{
  vproc_swap_integer();
  return 0;
}

+ (id)signingIdentifierFromSelf
{
  __SecTask *v2;
  __SecTask *v3;
  __CFString *v4;

  v2 = SecTaskCreateFromSelf(0);
  if (v2)
  {
    v3 = v2;
    v4 = (__CFString *)SecTaskCopySigningIdentifier(v2, 0);
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

void __52__RTEventAgentHelper_initWithRestorationIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "restorationIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A5E26000, v2, OS_LOG_TYPE_INFO, "client with restorationIdentifier, %@, woken up by CoreRoutine", (uint8_t *)&v4, 0xCu);

  }
}

- (NSString)restorationIdentifier
{
  return self->_restorationIdentifier;
}

- (void)setRestorationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_restorationIdentifier, a3);
}

@end
