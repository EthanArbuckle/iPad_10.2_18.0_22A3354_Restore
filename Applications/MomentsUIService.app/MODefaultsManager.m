@implementation MODefaultsManager

- (MODefaultsManager)init
{
  return -[MODefaultsManager initWithUniverse:](self, "initWithUniverse:", 0);
}

- (MODefaultsManager)initWithUniverse:(id)a3
{
  MODefaultsManager *v3;
  uint64_t v4;
  NSUserDefaults *userDefaults;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MODefaultsManager;
  v3 = -[MODefaultsManager init](&v7, "init", a3);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    userDefaults = v3->_userDefaults;
    v3->_userDefaults = (NSUserDefaults *)v4;

  }
  return v3;
}

- (id)objectForKey:(id)a3
{
  id v5;
  void *v6;
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a3;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", v5));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[MODefaultsManager objectForKey:].cold.3((uint64_t)v5, (uint64_t)v6, v8);
  }
  else
  {
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager objectForKey:].cold.2();

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MODefaultsManager.m"), 32, CFSTR("Invalid parameter not satisfying: key (in %s:%d)"), "-[MODefaultsManager objectForKey:]", 32);

    v12 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    v8 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager objectForKey:].cold.1(v8, v13, v14, v15, v16, v17, v18, v19);
    v6 = 0;
  }

  return v6;
}

- (id)objectForKeyWithoutLog:(id)a3
{
  void *v4;
  id os_log;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:"));
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager objectForKeyWithoutLog:].cold.2();

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MODefaultsManager.m"), 52, CFSTR("Invalid parameter not satisfying: key (in %s:%d)"), "-[MODefaultsManager objectForKeyWithoutLog:]", 52);

    v9 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager objectForKeyWithoutLog:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    v4 = 0;
  }
  return v4;
}

- (void)deleteObjectForKey:(id)a3
{
  id v5;
  id os_log;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;

  v5 = a3;
  if (v5)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[MODefaultsManager deleteObjectForKey:]";
      v13 = 2112;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s, deleting key, %@", buf, 0x16u);
    }

    -[NSUserDefaults removeObjectForKey:](self->_userDefaults, "removeObjectForKey:", v5);
  }
  else
  {
    v8 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager deleteObjectForKey:].cold.1();

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MODefaultsManager.m"), 66, CFSTR("Invalid parameter not satisfying: key (in %s:%d)"), "-[MODefaultsManager deleteObjectForKey:]", 66);

  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  id os_log;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[MODefaultsManager setObject:forKey:]";
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s, key, %@, value, %@", buf, 0x20u);
    }

    -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v7, v8);
  }
  else
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager setObject:forKey:].cold.1();

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MODefaultsManager.m"), 80, CFSTR("Invalid parameter not satisfying: key (in %s:%d)"), "-[MODefaultsManager setObject:forKey:]", 80);

  }
}

- (void)setObjectWithoutLog:(id)a3 forKey:(id)a4
{
  id os_log;
  NSObject *v7;
  void *v8;

  if (a4)
  {
    -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", a3);
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager setObjectWithoutLog:forKey:].cold.1();

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MODefaultsManager.m"), 97, CFSTR("Invalid parameter not satisfying: key (in %s:%d)"), "-[MODefaultsManager setObjectWithoutLog:forKey:]", 97);

  }
}

- (MODefaultsManager)initWithSuiteName:(id)a3
{
  id v4;
  MODefaultsManager *v5;
  NSUserDefaults *v6;
  NSUserDefaults *userDefaults;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MODefaultsManager;
  v5 = -[MODefaultsManager init](&v9, "init");
  if (v5)
  {
    v6 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", v4);
    userDefaults = v5->_userDefaults;
    v5->_userDefaults = v6;

  }
  return v5;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)objectForKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0((void *)&_mh_execute_header, a1, a3, "%s, key cannot be nil!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)objectForKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)objectForKey:(os_log_t)log .cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  v3 = 136315650;
  v4 = "-[MODefaultsManager objectForKey:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s, key, %@, value, %@", (uint8_t *)&v3, 0x20u);
}

- (void)objectForKeyWithoutLog:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0((void *)&_mh_execute_header, a1, a3, "%s, key cannot be nil!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)objectForKeyWithoutLog:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)deleteObjectForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)setObject:forKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)setObjectWithoutLog:forKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

@end
