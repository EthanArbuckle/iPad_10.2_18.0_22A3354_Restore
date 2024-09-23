@implementation IMBaseCommandHandlerRegistry

- (IMBaseCommandHandlerRegistry)init
{
  IMBaseCommandHandlerRegistry *v2;
  uint64_t v3;
  NSMutableDictionary *standardHandlers;
  uint64_t v5;
  NSMutableDictionary *lockdownHandlers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMBaseCommandHandlerRegistry;
  v2 = -[IMBaseCommandHandlerRegistry init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    standardHandlers = v2->_standardHandlers;
    v2->_standardHandlers = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    lockdownHandlers = v2->_lockdownHandlers;
    v2->_lockdownHandlers = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (id)noopHandlerForCommand:(id)a3
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  IMLogHandleForCategory("IMBaseCommandHandlerRegistry");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_error_impl(&dword_19E239000, v4, OS_LOG_TYPE_ERROR, "noopHandler is a required override for %@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("noopHandler is a required override for IMBaseCommandHandlerRegistry"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (BOOL)canAddCommand:(id)a3
{
  return 1;
}

- (BOOL)hasHandlerForCommand:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_standardHandlers, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isLockedDown
{
  return +[IMDeviceUtilities deviceIsLockedDown](IMDeviceUtilities, "deviceIsLockedDown");
}

- (BOOL)hasLockdownHandlerForCommand:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_lockdownHandlers, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)setLockdownHandler:(id)a3 forCommand:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[IMBaseCommandHandlerRegistry canAddCommand:](self, "canAddCommand:", v7);
  IMLogHandleForCategory("IMBaseCommandHandlerRegistry");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v7;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "lockdown handler for command '%@' in %@: ADDED", (uint8_t *)&v15, 0x16u);

    }
    v9 = objc_msgSend(v6, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lockdownHandlers, "setObject:forKeyedSubscript:", v9, v7);
  }
  else if (v10)
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v7;
    v17 = 2112;
    v18 = v14;
    _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "lockdown handler for command '%@' in %@: NOT ADDED (Command not ready for Blastdoor)", (uint8_t *)&v15, 0x16u);

  }
}

- (void)setPassThroughLockdownHandlerForCommand:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMBaseCommandHandlerRegistry canAddCommand:](self, "canAddCommand:", v4))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_standardHandlers, "objectForKeyedSubscript:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    IMLogHandleForCategory("IMBaseCommandHandlerRegistry");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412546;
        v14 = v4;
        v15 = 2112;
        v16 = v9;
        _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "lockdown passThrough handler for command '%@' in %@: ADDED", (uint8_t *)&v13, 0x16u);

      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_19E36C760((uint64_t)v4, (uint64_t)self, v7);

      -[IMBaseCommandHandlerRegistry noopHandlerForCommand:](self, "noopHandlerForCommand:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v12 = -[NSObject copy](v5, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lockdownHandlers, "setObject:forKeyedSubscript:", v12, v4);

  }
  else
  {
    IMLogHandleForCategory("IMBaseCommandHandlerRegistry");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v4;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "lockdown passThrought handler for command '%@' in %@: NOT ADDED (Command not ready for Blastdoor)", (uint8_t *)&v13, 0x16u);

    }
  }

}

- (void)setStandardHandler:(id)a3 forCommand:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  const char *v17;
  objc_class *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[IMBaseCommandHandlerRegistry canAddCommand:](self, "canAddCommand:", v7))
  {
    IMLogHandleForCategory("IMBaseCommandHandlerRegistry");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v7;
      v21 = 2112;
      v22 = v16;
      v17 = "handler for command '%@' in %@: NOT ADDED (Command not ready for Blastdoor)";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  v8 = (void *)objc_msgSend(v6, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_standardHandlers, "setObject:forKeyedSubscript:", v8, v7);

  IMLogHandleForCategory("IMBaseCommandHandlerRegistry");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v7;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "blastdoor handler for command '%@' in %@: ADDED", (uint8_t *)&v19, 0x16u);

  }
  if (-[IMBaseCommandHandlerRegistry isLockedDown](self, "isLockedDown"))
  {
    -[IMBaseCommandHandlerRegistry noopHandlerForCommand:](self, "noopHandlerForCommand:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lockdownHandlers, "setObject:forKeyedSubscript:", v13, v7);

    IMLogHandleForCategory("IMBaseCommandHandlerRegistry");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v7;
      v21 = 2112;
      v22 = v16;
      v17 = "added noop lockdown handler for command '%@' in %@";
LABEL_9:
      _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v19, 0x16u);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:

}

- (NSDictionary)handlers
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = -[IMBaseCommandHandlerRegistry isLockedDown](self, "isLockedDown");
  v4 = 8;
  if (v3)
    v4 = 16;
  return (NSDictionary *)*(id *)((char *)&self->super.isa + v4);
}

- (id)handlerForCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMBaseCommandHandlerRegistry handlers](self, "handlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)standardHandlers
{
  return &self->_standardHandlers->super;
}

- (NSDictionary)lockdownHandlers
{
  return &self->_lockdownHandlers->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockdownHandlers, 0);
  objc_storeStrong((id *)&self->_standardHandlers, 0);
}

@end
