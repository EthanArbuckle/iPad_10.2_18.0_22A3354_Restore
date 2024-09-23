@implementation RTRoutineManagerRegistrantPeopleDiscovery

- (BOOL)registered
{
  return self->_registered;
}

- (RTRoutineManagerRegistrantPeopleDiscovery)initWithConfigurationIdentifier:(id)a3
{
  id v4;
  RTRoutineManagerRegistrantPeopleDiscovery *v5;
  RTRoutineManagerRegistrantPeopleDiscovery *v6;
  id densityHandler;
  uint64_t v8;
  NSString *configurationIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTRoutineManagerRegistrantPeopleDiscovery;
  v5 = -[RTRoutineManagerRegistrantPeopleDiscovery init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    densityHandler = v5->_densityHandler;
    v5->_densityHandler = 0;

    v8 = objc_msgSend(v4, "copy");
    configurationIdentifier = v6->_configurationIdentifier;
    v6->_configurationIdentifier = (NSString *)v8;

  }
  return v6;
}

- (id)startMonitoringForPeopleDiscovery:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id densityHandler;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "densityCallbackConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "densityCallbackConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "densityUpdateHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v18 = *MEMORY[0x1E0CB2D50];
        v19 = CFSTR("Invalid parameter value for density update handler.  Requires non-nil value.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("RTErrorDomain"), 7, v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      objc_msgSend(v8, "densityUpdateHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      densityHandler = self->_densityHandler;
      self->_densityHandler = v10;

    }
    objc_storeStrong((id *)&self->_configuration, a3);
    v12 = 0;
    self->_registered = 1;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("Invalid configuration to register for people discovery service.  Requires non-nil value.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("RTErrorDomain"), 7, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_8:

  return v12;
}

- (id)stopMonitoringForPeopleDiscovery
{
  id densityHandler;
  RTPeopleDiscoveryServiceConfiguration *configuration;

  self->_registered = 0;
  densityHandler = self->_densityHandler;
  self->_densityHandler = 0;

  configuration = self->_configuration;
  self->_configuration = 0;

  return 0;
}

- (void)onDensityUpdate:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  RTPeopleDiscoveryServiceConfiguration *v9;
  NSObject *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void (**densityHandler)(id, id, id);
  int v15;
  void *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = self->_configuration;
  _rt_log_facility_get_os_log(RTLogFacilityFramework);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_registered)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    -[RTPeopleDiscoveryServiceConfiguration description](v9, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138413314;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    v21 = 2048;
    v22 = objc_msgSend(v7, "count");
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_1A5E26000, v10, OS_LOG_TYPE_INFO, "%@, registered, %@, monitoredConfig, %@, densityBundles count, %lu, error, %@", (uint8_t *)&v15, 0x34u);

  }
  if (self->_registered)
  {
    densityHandler = (void (**)(id, id, id))self->_densityHandler;
    if (densityHandler)
      densityHandler[2](densityHandler, v7, v8);
  }

}

- (NSString)configurationIdentifier
{
  return self->_configurationIdentifier;
}

- (RTPeopleDiscoveryServiceConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
  objc_storeStrong(&self->_densityHandler, 0);
}

@end
