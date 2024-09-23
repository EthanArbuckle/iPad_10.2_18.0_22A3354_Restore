@implementation SOConfigurationVersion

- (SOConfigurationVersion)initWithMode:(int64_t)a3
{
  NSObject *v5;
  SOConfigurationVersion *v6;
  SOConfigurationVersion *v7;
  NSObject *v8;
  objc_super v10;

  SO_LOG_SOConfigurationVersion();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SOConfigurationVersion initWithMode:].cold.2(a3, (uint64_t)self, v5);

  v10.receiver = self;
  v10.super_class = (Class)SOConfigurationVersion;
  v6 = -[SOConfigurationVersion init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_token = -1;
    v6->_mode = a3;
    v6->_version = 0;
    if (notify_register_check("/com.apple.AppSSO.version", &v6->_token))
    {
      SO_LOG_SOConfigurationVersion();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SOConfigurationVersion initWithMode:].cold.1();

    }
  }
  return v7;
}

- (int64_t)checkVersion
{
  SOConfigurationVersion *v2;
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  NSObject *v6;
  unint64_t version;
  int v9;
  const char *v10;
  __int16 v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  SOConfigurationVersion *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[SOConfigurationVersion _state](v2, "_state");
  v4 = v3;
  if (v3 == -1)
  {
    v2->_version = -1;
    v5 = 2;
    goto LABEL_10;
  }
  if (!v3)
  {
LABEL_9:
    v5 = 1;
    goto LABEL_10;
  }
  if (v3 != v2->_version)
  {
    SO_LOG_SOConfigurationVersion();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      version = v2->_version;
      v9 = 136315906;
      v10 = "-[SOConfigurationVersion checkVersion]";
      v11 = 2048;
      v12 = version;
      v13 = 2048;
      v14 = v4;
      v15 = 2112;
      v16 = v2;
      _os_log_impl(&dword_1CF39B000, v6, OS_LOG_TYPE_DEFAULT, "%s config version changed from from 0x%016llX to 0x%016llX on %@", (uint8_t *)&v9, 0x2Au);
    }

    v2->_version = v4;
    goto LABEL_9;
  }
  v5 = 0;
LABEL_10:
  objc_sync_exit(v2);

  return v5;
}

- (unint64_t)_state
{
  int token;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t state64;

  state64 = -1;
  token = self->_token;
  if (token == -1)
  {
    SO_LOG_SOConfigurationVersion();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[SOConfigurationVersion _state].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    goto LABEL_7;
  }
  if (notify_get_state(token, &state64))
  {
    SO_LOG_SOConfigurationVersion();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[SOConfigurationVersion _state].cold.2();
LABEL_7:

  }
  return state64;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF39B000, v0, v1, "notify_cancel() failed with %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)increaseVersionWithMessage:(id)a3
{
  id v4;
  SOConfigurationVersion *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  unint64_t version;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  SOConfigurationVersion *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_mode)
  {
    SO_LOG_SOConfigurationVersion();
    v5 = (SOConfigurationVersion *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
      -[SOConfigurationVersion increaseVersionWithMessage:].cold.1(&v5->super, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    v5 = self;
    objc_sync_enter(v5);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSince1970");
    v5->_version = (unint64_t)(v14 * 1000.0);

    SO_LOG_SOConfigurationVersion();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = -[SOConfigurationVersion _state](v5, "_state");
      version = v5->_version;
      v18 = 136316162;
      v19 = "-[SOConfigurationVersion increaseVersionWithMessage:]";
      v20 = 2048;
      v21 = v16;
      v22 = 2048;
      v23 = version;
      v24 = 2114;
      v25 = v4;
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_1CF39B000, v15, OS_LOG_TYPE_DEFAULT, "%s config version increased from 0x%016llX to 0x%016llX (%{public}@) on %@", (uint8_t *)&v18, 0x34u);
    }

    -[SOConfigurationVersion _setStateAndNotify:](v5, "_setStateAndNotify:", v5->_version);
    objc_sync_exit(v5);
  }

}

- (void)setAppSSOUnavailable
{
  OUTLINED_FUNCTION_2_0(&dword_1CF39B000, a1, a3, "unable to set config version to AppSSO unavailable (not host)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (int64_t)version
{
  return self->_version;
}

+ (void)reset
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int out_token;

  out_token = 0;
  v2 = notify_register_check("/com.apple.AppSSO.version", &out_token);
  if ((_DWORD)v2)
  {
    NSLog(CFSTR("notify_register_check() failed with %u (test)"), v2);
  }
  else
  {
    v3 = notify_set_state(out_token, 0);
    if ((_DWORD)v3)
    {
      NSLog(CFSTR("notify_set_state() failed with error %u"), v3);
      notify_cancel(out_token);
    }
    else
    {
      v4 = notify_cancel(out_token);
      if ((_DWORD)v4)
        NSLog(CFSTR("notify_cancel() failed with error %u"), v4);
    }
  }
}

- (void)_setStateAndNotify:(unint64_t)a3
{
  NSObject *v3;
  NSObject *v4;

  if (notify_set_state(self->_token, a3))
  {
    SO_LOG_SOConfigurationVersion();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[SOConfigurationVersion _setStateAndNotify:].cold.2();

  }
  if (notify_post("/com.apple.AppSSO.version"))
  {
    SO_LOG_SOConfigurationVersion();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SOConfigurationVersion _setStateAndNotify:].cold.1();

  }
}

- (void)initWithMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF39B000, v0, v1, "notify_register_check() failed with %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithMode:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  const char *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = "NO";
  v5 = "-[SOConfigurationVersion initWithMode:]";
  v4 = 136315650;
  if (!a1)
    v3 = "YES";
  v6 = 2080;
  v7 = v3;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_1CF39B000, log, OS_LOG_TYPE_DEBUG, "%s host = %s on %@", (uint8_t *)&v4, 0x20u);
}

- (void)increaseVersionWithMessage:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1CF39B000, a1, a3, "unable to increase version from a client", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_state
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF39B000, v0, v1, "notify_get_state() failed with error %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_setStateAndNotify:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF39B000, v0, v1, "notify_post() failed with error %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_setStateAndNotify:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF39B000, v0, v1, "notify_set_state() failed with error %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
