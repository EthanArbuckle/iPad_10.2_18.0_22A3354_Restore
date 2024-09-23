@implementation CHManagedConfigurations

+ (id)managedConfigurations
{
  return objc_alloc_init(CHManagedConfigurations);
}

- (CHManagedConfigurations)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CHManagedConfigurations *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CHManagedConfigurations;
  v7 = -[CHManagedConfigurations init](&v16, sel_init);
  if (v7)
  {
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v2, v3, v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v8, v9, (uint64_t)v7, (uint64_t)sel__profileSettingsChanged_, *MEMORY[0x1E0D46EC8], 0);

    objc_msgSend__updateSettings(v7, v10, v11, v12, v13, v14);
  }
  return v7;
}

- (void)_updateSettings
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedConnection(MEMORY[0x1E0D47230], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isPersonalizedHandwritingResultsAllowed = objc_msgSend_isPersonalizedHandwritingResultsAllowed(v7, v8, v9, v10, v11, v12);

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v13 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    if (self->_isPersonalizedHandwritingResultsAllowed)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v15 = 138412290;
    v16 = v14;
    _os_log_impl(&dword_1BE607000, v13, OS_LOG_TYPE_DEBUG, "CHManagedConfigurations updated value for _isPersonalizedHandwritingResultsAllowed: %@", (uint8_t *)&v15, 0xCu);
  }

}

- (void)_profileSettingsChanged:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v5 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1BE607000, v5, OS_LOG_TYPE_DEBUG, "CHManagedConfigurations received notification: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE729B14;
  block[3] = &unk_1E77F29A0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (BOOL)isPersonalizedHandwritingResultsAllowed
{
  return self->_isPersonalizedHandwritingResultsAllowed;
}

@end
