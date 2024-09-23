@implementation CKDGlobalConfigurationOperation

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/global-configuration", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)shouldCheckAppVersion
{
  return 0;
}

- (void)main
{
  CKDGlobalConfigurationURLRequest *v3;
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  uint8_t v16[16];
  _QWORD v17[4];
  id v18;
  id v19;
  id from;
  id location;

  v3 = [CKDGlobalConfigurationURLRequest alloc];
  v5 = (void *)objc_msgSend_initWithOperation_(v3, v4, (uint64_t)self);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v5);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1BEBBF850;
  v17[3] = &unk_1E782E468;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  objc_msgSend_setCompletionBlock_(v5, v6, (uint64_t)v17);
  objc_msgSend_setRequest_(self, v7, (uint64_t)v5);
  if (*MEMORY[0x1E0C95280]
    && (objc_msgSend_unitTestOverrides(self, v8, v9),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)CFSTR("StallGlobalConfigOperation")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v10,
        v12))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1BE990000, v13, OS_LOG_TYPE_INFO, "Stalling Global Config Operation, you asked for it", v16, 2u);
    }
  }
  else
  {
    objc_msgSend_container(self, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_performRequest_(v14, v15, (uint64_t)v5);

  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (CKDServerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (OS_dispatch_group)configurationFetchedGroup
{
  return self->_configurationFetchedGroup;
}

- (void)setConfigurationFetchedGroup:(id)a3
{
  objc_storeStrong((id *)&self->_configurationFetchedGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationFetchedGroup, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
