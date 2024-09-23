@implementation CRKDefaultSettingsUIVisibilityProvider

- (CRKDefaultSettingsUIVisibilityProvider)init
{
  CRKDefaultSettingsUIVisibilityProvider *v2;
  CRKUserDefaultsObject *v3;
  CRKUserDefaultsObject *mUIPreviouslyVisible;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKDefaultSettingsUIVisibilityProvider;
  v2 = -[CRKDefaultSettingsUIVisibilityProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = -[CRKUserDefaultsObject initWithKey:]([CRKUserDefaultsObject alloc], "initWithKey:", CFSTR("ClassroomSettingsUIPreviouslyVisible"));
    mUIPreviouslyVisible = v2->mUIPreviouslyVisible;
    v2->mUIPreviouslyVisible = v3;

    -[CRKDefaultSettingsUIVisibilityProvider migrateOldUserDefaultsValues](v2, "migrateOldUserDefaultsValues");
    -[CRKDefaultSettingsUIVisibilityProvider updateVisibilityState](v2, "updateVisibilityState");
  }
  return v2;
}

- (void)migrateOldUserDefaultsValues
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  CRKUserDefaultsObject *v8;
  void *v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(&unk_24DA08120, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(&unk_24DA08120);
        v8 = -[CRKUserDefaultsObject initWithKey:]([CRKUserDefaultsObject alloc], "initWithKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        -[CRKUserDefaultsObject value](v8, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "BOOLValue");

        v5 |= v10;
        -[CRKUserDefaultsObject setValue:](v8, "setValue:", 0);

      }
      v4 = objc_msgSend(&unk_24DA08120, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
    if ((v5 & 1) != 0)
      -[CRKDefaultSettingsUIVisibilityProvider updatePreviouslyVisibleDefaultWithValue:](self, "updatePreviouslyVisibleDefaultWithValue:", 1);
  }
}

- (void)updatePreviouslyVisibleDefaultWithValue:(BOOL)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBD1C8];
  if (!a3)
    v4 = 0;
  v5 = v4;
  _CRKLogSettings_0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 136446466;
    v8 = "-[CRKDefaultSettingsUIVisibilityProvider updatePreviouslyVisibleDefaultWithValue:]";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_218C99000, v6, OS_LOG_TYPE_INFO, "[%{public}s] %{public}@", (uint8_t *)&v7, 0x16u);
  }

  -[CRKUserDefaultsObject setValue:](self->mUIPreviouslyVisible, "setValue:", v5);
}

- (void)updateVisibilityState
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[CRKCourseEnrollmentController settingsUIVisible](self->mEnrollmentController, "settingsUIVisible");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[CRKUserDefaultsObject value](self->mUIPreviouslyVisible, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "BOOLValue");

  }
  _CRKLogSettings_0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("NO");
    if ((_DWORD)v4)
      v7 = CFSTR("YES");
    v8 = v7;
    v9 = 136446466;
    v10 = "-[CRKDefaultSettingsUIVisibilityProvider updateVisibilityState]";
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_218C99000, v6, OS_LOG_TYPE_INFO, "[%{public}s] %{public}@", (uint8_t *)&v9, 0x16u);

  }
  if ((_DWORD)v4 != -[CRKDefaultSettingsUIVisibilityProvider settingsUIVisible](self, "settingsUIVisible"))
    -[CRKDefaultSettingsUIVisibilityProvider setSettingsUIVisible:](self, "setSettingsUIVisible:", v4);
}

- (void)updatePaneStatus
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;

  if (-[CRKDefaultSettingsUIVisibilityProvider isAnyCourseActiveInEnrollmentController:](self, "isAnyCourseActiveInEnrollmentController:", self->mEnrollmentController))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("connected.status"), CFSTR("Connected"), 0);
    v7 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (uint64_t)&stru_24D9CB490;
  }
  -[CRKDefaultSettingsUIVisibilityProvider paneStatus](self, "paneStatus");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4 | v7)
  {
    -[CRKDefaultSettingsUIVisibilityProvider paneStatus](self, "paneStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", v7);

    if ((v6 & 1) == 0)
      -[CRKDefaultSettingsUIVisibilityProvider setPaneStatus:](self, "setPaneStatus:", v7);
  }

}

- (BOOL)isAnyCourseActiveInEnrollmentController:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v3, "courses", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(v3, "isCourseActive:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)connectToDaemon
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __57__CRKDefaultSettingsUIVisibilityProvider_connectToDaemon__block_invoke;
  v2[3] = &unk_24D9C7020;
  v2[4] = self;
  objc_msgSend(MEMORY[0x24BDBCF18], "cat_performBlockOnMainRunLoop:", v2);
}

uint64_t __57__CRKDefaultSettingsUIVisibilityProvider_connectToDaemon__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[CRKCourseEnrollmentController sharedEnrollmentController](CRKCourseEnrollmentController, "sharedEnrollmentController");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addEnrollmentObserver:");
  return objc_msgSend(*(id *)(a1 + 32), "updatePaneStatus");
}

- (void)enrollmentControllerDidUpdateSettingsUIVisibility:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CRKLogSettings_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "settingsUIVisible");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");
    v8 = CFSTR("NO");
    if (v7)
      v8 = CFSTR("YES");
    v9 = v8;
    v11 = 136446466;
    v12 = "-[CRKDefaultSettingsUIVisibilityProvider enrollmentControllerDidUpdateSettingsUIVisibility:]";
    v13 = 2114;
    v14 = v9;
    _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "[%{public}s] %{public}@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(v4, "settingsUIVisible");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKDefaultSettingsUIVisibilityProvider updatePreviouslyVisibleDefaultWithValue:](self, "updatePreviouslyVisibleDefaultWithValue:", objc_msgSend(v10, "BOOLValue"));

  -[CRKDefaultSettingsUIVisibilityProvider updateVisibilityState](self, "updateVisibilityState");
}

- (BOOL)settingsUIVisible
{
  return self->_settingsUIVisible;
}

- (void)setSettingsUIVisible:(BOOL)a3
{
  self->_settingsUIVisible = a3;
}

- (NSString)paneStatus
{
  return self->_paneStatus;
}

- (void)setPaneStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paneStatus, 0);
  objc_storeStrong((id *)&self->mEnrollmentController, 0);
  objc_storeStrong((id *)&self->mUIPreviouslyVisible, 0);
}

@end
