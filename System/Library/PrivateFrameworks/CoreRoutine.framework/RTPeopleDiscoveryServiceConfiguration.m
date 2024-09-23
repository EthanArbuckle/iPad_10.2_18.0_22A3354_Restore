@implementation RTPeopleDiscoveryServiceConfiguration

- (RTPeopleDiscoveryServiceConfiguration)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithServiceLevel_storageDuration_observationInterval_densityCallbackConfiguration_);
}

- (RTPeopleDiscoveryServiceConfiguration)initWithServiceLevel:(unint64_t)a3 storageDuration:(unint64_t)a4 observationInterval:(unint64_t)a5 densityCallbackConfiguration:(id)a6
{
  id v11;
  RTPeopleDiscoveryServiceConfiguration *v12;
  RTPeopleDiscoveryServiceConfiguration *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)RTPeopleDiscoveryServiceConfiguration;
  v12 = -[RTPeopleDiscoveryServiceConfiguration init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_advertisingCapability = 0;
    if (a3 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v20 = a3;
        _os_log_error_impl(&dword_1A5E26000, v14, OS_LOG_TYPE_ERROR, "serviceLevel %d out of bounds", buf, 8u);
      }

      a3 = 1;
    }
    v13->_serviceLevel = a3;
    if (a4 - 4 <= 0xFFFFFFFFFFFFFFFCLL)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v20 = a4;
        _os_log_error_impl(&dword_1A5E26000, v15, OS_LOG_TYPE_ERROR, "storageDuration %d out of bounds", buf, 8u);
      }

      a4 = 1;
    }
    v13->_storageDuration = a4;
    if (a5 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v20 = a5;
        _os_log_error_impl(&dword_1A5E26000, v16, OS_LOG_TYPE_ERROR, "observationInterval %d out of bounds", buf, 8u);
      }

      a5 = 1;
    }
    v13->_observationInterval = a5;
    objc_storeStrong((id *)&v13->_densityCallbackConfiguration, a6);
  }

  return v13;
}

- (RTPeopleDiscoveryServiceConfiguration)initWithAdvertisingCapability:(unint64_t)a3 serviceLevel:(unint64_t)a4 observationInterval:(unint64_t)a5 storageDuration:(unint64_t)a6 densityCallbackConfiguration:(id)a7
{
  id v13;
  RTPeopleDiscoveryServiceConfiguration *v14;
  RTPeopleDiscoveryServiceConfiguration *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  objc_super v20;
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)RTPeopleDiscoveryServiceConfiguration;
  v14 = -[RTPeopleDiscoveryServiceConfiguration init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_advertisingCapability = a3;
    if (a4 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v22 = a4;
        _os_log_error_impl(&dword_1A5E26000, v16, OS_LOG_TYPE_ERROR, "serviceLevel %d out of bounds", buf, 8u);
      }

      a4 = 1;
    }
    v15->_serviceLevel = a4;
    if (a5 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v22 = a5;
        _os_log_error_impl(&dword_1A5E26000, v17, OS_LOG_TYPE_ERROR, "observationInterval %d out of bounds", buf, 8u);
      }

      a5 = 1;
    }
    v15->_observationInterval = a5;
    if (a6 - 4 <= 0xFFFFFFFFFFFFFFFCLL)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v22 = a6;
        _os_log_error_impl(&dword_1A5E26000, v18, OS_LOG_TYPE_ERROR, "storageDuration %d out of bounds", buf, 8u);
      }

      a6 = 1;
    }
    v15->_storageDuration = a6;
    objc_storeStrong((id *)&v15->_densityCallbackConfiguration, a7);
  }

  return v15;
}

+ (unint64_t)aggregateAdvertisingCapability:(unint64_t)a3 with:(unint64_t)a4
{
  return a4 | a3;
}

+ (unint64_t)aggregateServiceLevel:(unint64_t)a3 with:(unint64_t)a4
{
  int v4;
  int v5;
  BOOL v6;
  BOOL v7;
  NSObject *v8;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  uint64_t v13;

  v4 = a4;
  v5 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (a3 - 3 >= 0xFFFFFFFFFFFFFFFELL)
  {
    v6 = a4 - 3 >= 0xFFFFFFFFFFFFFFFDLL;
    v7 = a4 == 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  if (!v7 && v6)
  {
    if (dword_1A5E6A0C0[a3] <= dword_1A5E6A0C0[a4])
      return a4;
    else
      return a3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109376;
      v10[1] = v5;
      v11 = 1024;
      v12 = v4;
      _os_log_error_impl(&dword_1A5E26000, v8, OS_LOG_TYPE_ERROR, "service level %d or %d out of bounds", (uint8_t *)v10, 0xEu);
    }

    return 1;
  }
}

+ (unint64_t)aggregateObservationInterval:(unint64_t)a3 with:(unint64_t)a4
{
  int v4;
  int v5;
  BOOL v6;
  BOOL v7;
  NSObject *v8;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  uint64_t v13;

  v4 = a4;
  v5 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (a3 - 3 >= 0xFFFFFFFFFFFFFFFELL)
  {
    v6 = a4 - 3 >= 0xFFFFFFFFFFFFFFFDLL;
    v7 = a4 == 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  if (!v7 && v6)
  {
    if (dword_1A5E6A0CC[a3] <= dword_1A5E6A0CC[a4])
      return a4;
    else
      return a3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109376;
      v10[1] = v5;
      v11 = 1024;
      v12 = v4;
      _os_log_error_impl(&dword_1A5E26000, v8, OS_LOG_TYPE_ERROR, "observation interval %d or %d out of bounds", (uint8_t *)v10, 0xEu);
    }

    return 1;
  }
}

+ (unint64_t)aggregateStorageDuration:(unint64_t)a3 with:(unint64_t)a4
{
  int v4;
  int v5;
  BOOL v6;
  BOOL v7;
  NSObject *v8;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  uint64_t v13;

  v4 = a4;
  v5 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (a3 - 4 >= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = a4 - 4 >= 0xFFFFFFFFFFFFFFFCLL;
    v7 = a4 == 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  if (!v7 && v6)
  {
    if (dword_1A5E6A0B0[a3] <= dword_1A5E6A0B0[a4])
      return a4;
    else
      return a3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109376;
      v10[1] = v5;
      v11 = 1024;
      v12 = v4;
      _os_log_error_impl(&dword_1A5E26000, v8, OS_LOG_TYPE_ERROR, "storage duration %d or %d out of bounds", (uint8_t *)v10, 0xEu);
    }

    return 1;
  }
}

+ (double)secondsForStorageDuration:(unint64_t)a3
{
  double result;

  result = 86400.0;
  if (a3 != 2)
    result = 0.0;
  if (a3 == 3)
    return 2419200.0;
  return result;
}

- (RTPeopleDiscoveryServiceConfiguration)initWithAggregation:(id)a3
{
  id v4;
  char *v5;
  RTPeopleDiscoveryServiceConfiguration *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RTPeopleDiscoveryServiceConfiguration;
  v5 = -[RTPeopleDiscoveryServiceConfiguration init](&v18, sel_init);
  v6 = (RTPeopleDiscoveryServiceConfiguration *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = xmmword_1A5E6A0A0;
    *(int64x2_t *)(v5 + 24) = vdupq_n_s64(1uLL);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
          v6->_advertisingCapability = objc_msgSend((id)objc_opt_class(), "aggregateAdvertisingCapability:with:", v6->_advertisingCapability, objc_msgSend(v12, "advertisingCapability", (_QWORD)v14));
          v6->_serviceLevel = objc_msgSend((id)objc_opt_class(), "aggregateServiceLevel:with:", v6->_serviceLevel, objc_msgSend(v12, "serviceLevel"));
          v6->_observationInterval = objc_msgSend((id)objc_opt_class(), "aggregateObservationInterval:with:", v6->_observationInterval, objc_msgSend(v12, "observationInterval"));
          v6->_storageDuration = objc_msgSend((id)objc_opt_class(), "aggregateStorageDuration:with:", v6->_storageDuration, objc_msgSend(v12, "storageDuration"));
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v9);
    }

  }
  return v6;
}

- (BOOL)shouldAdvertise
{
  return -[RTPeopleDiscoveryServiceConfiguration advertisingCapability](self, "advertisingCapability") & 1;
}

- (BOOL)isEqual:(id)a3
{
  RTPeopleDiscoveryServiceConfiguration *v4;
  RTPeopleDiscoveryServiceConfiguration *v5;
  void *v6;
  BOOL v7;
  char v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  void *v15;
  void *v16;

  v4 = (RTPeopleDiscoveryServiceConfiguration *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RTPeopleDiscoveryServiceConfiguration densityCallbackConfiguration](self, "densityCallbackConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = 0;
      }
      else
      {
        -[RTPeopleDiscoveryServiceConfiguration densityCallbackConfiguration](v5, "densityCallbackConfiguration");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v9 == 0;

      }
      v10 = -[RTPeopleDiscoveryServiceConfiguration advertisingCapability](self, "advertisingCapability");
      if (v10 == -[RTPeopleDiscoveryServiceConfiguration advertisingCapability](v5, "advertisingCapability")
        && (v11 = -[RTPeopleDiscoveryServiceConfiguration serviceLevel](self, "serviceLevel"),
            v11 == -[RTPeopleDiscoveryServiceConfiguration serviceLevel](v5, "serviceLevel"))
        && (v12 = -[RTPeopleDiscoveryServiceConfiguration observationInterval](self, "observationInterval"),
            v12 == -[RTPeopleDiscoveryServiceConfiguration observationInterval](v5, "observationInterval")))
      {
        v13 = -[RTPeopleDiscoveryServiceConfiguration storageDuration](self, "storageDuration");
        v8 = v13 == -[RTPeopleDiscoveryServiceConfiguration storageDuration](v5, "storageDuration");
        if (v8)
          v14 = v7;
        else
          v14 = 1;
        if ((v14 & 1) == 0)
        {
          -[RTPeopleDiscoveryServiceConfiguration densityCallbackConfiguration](self, "densityCallbackConfiguration");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTPeopleDiscoveryServiceConfiguration densityCallbackConfiguration](v5, "densityCallbackConfiguration");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v15, "isEqual:", v16);

        }
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)descriptionDictionary
{
  void *v3;
  void *v4;
  const __CFString *v5;
  unint64_t v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  RTPeopleDensityCallbackConfiguration *densityCallbackConfiguration;
  __CFString *v16;
  void *v17;
  objc_class *v19;
  void *v20;
  unint64_t serviceLevel;
  objc_class *v22;
  void *v23;
  unint64_t observationInterval;
  objc_class *v25;
  void *v26;
  unint64_t storageDuration;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  __CFString *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = v3;
  if ((self->_advertisingCapability & 1) != 0)
    v5 = CFSTR("Enabled");
  else
    v5 = CFSTR("Disabled");
  objc_msgSend(v3, "appendString:", v5);
  v6 = self->_serviceLevel - 1;
  if (v6 >= 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      serviceLevel = self->_serviceLevel;
      *(_DWORD *)buf = 138412546;
      v39 = v20;
      v40 = 1024;
      v41 = serviceLevel;
      _os_log_error_impl(&dword_1A5E26000, v7, OS_LOG_TYPE_ERROR, "%@ invalid serviceLevel %d", buf, 0x12u);

    }
  }
  v8 = self->_observationInterval - 1;
  if (v8 >= 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      observationInterval = self->_observationInterval;
      *(_DWORD *)buf = 138412546;
      v39 = v23;
      v40 = 1024;
      v41 = observationInterval;
      _os_log_error_impl(&dword_1A5E26000, v9, OS_LOG_TYPE_ERROR, "%@ invalid observationInterval %d", buf, 0x12u);

    }
  }
  v10 = self->_storageDuration - 1;
  if (v10 >= 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      storageDuration = self->_storageDuration;
      *(_DWORD *)buf = 138412546;
      v39 = v26;
      v40 = 1024;
      v41 = storageDuration;
      _os_log_error_impl(&dword_1A5E26000, v11, OS_LOG_TYPE_ERROR, "%@ invalid storageDuration %d", buf, 0x12u);

    }
  }
  v33 = v4;
  v28 = CFSTR("AdvertisingCapability");
  v29 = CFSTR("ServiceLevel");
  if (v6 > 1)
    v12 = &stru_1E4FB1A18;
  else
    v12 = (const __CFString *)ServiceLevelDescriptor[self->_serviceLevel];
  v34 = v12;
  v30 = CFSTR("ObservationInterval");
  if (v8 > 1)
    v13 = &stru_1E4FB1A18;
  else
    v13 = (const __CFString *)ObservationIntervalDescriptor[self->_observationInterval];
  v35 = v13;
  v31 = CFSTR("StorageDuration");
  if (v10 > 2)
    v14 = &stru_1E4FB1A18;
  else
    v14 = (const __CFString *)StorageDurationDescriptor[self->_storageDuration];
  v36 = v14;
  v32 = CFSTR("DensityCallbackConfig");
  densityCallbackConfiguration = self->_densityCallbackConfiguration;
  if (densityCallbackConfiguration)
  {
    -[RTPeopleDensityCallbackConfiguration description](densityCallbackConfiguration, "description", v28, v29, v30, v31, v32, v33, v34, v35, v36);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = &stru_1E4FB1A18;
  }
  v37 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v28, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (densityCallbackConfiguration)

  return v17;
}

- (id)description
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  objc_class *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[RTPeopleDiscoveryServiceConfiguration descriptionDictionary](self, "descriptionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONStringFromNSDictionary:error:", v2, &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_error_impl(&dword_1A5E26000, v5, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v3;
  }
  v7 = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAdvertisingCapability:serviceLevel:observationInterval:storageDuration:densityCallbackConfiguration:", self->_advertisingCapability, self->_serviceLevel, self->_observationInterval, self->_storageDuration, self->_densityCallbackConfiguration);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPeopleDiscoveryServiceConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  RTPeopleDiscoveryServiceConfiguration *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AdvertisingCapability"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ServiceLevel"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ObservationInterval"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("StorageDuration"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DensityCallbackConfig"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[RTPeopleDiscoveryServiceConfiguration initWithAdvertisingCapability:serviceLevel:observationInterval:storageDuration:densityCallbackConfiguration:](self, "initWithAdvertisingCapability:serviceLevel:observationInterval:storageDuration:densityCallbackConfiguration:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t advertisingCapability;
  id v5;

  advertisingCapability = self->_advertisingCapability;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", advertisingCapability, CFSTR("AdvertisingCapability"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_serviceLevel, CFSTR("ServiceLevel"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_observationInterval, CFSTR("ObservationInterval"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_storageDuration, CFSTR("StorageDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_densityCallbackConfiguration, CFSTR("DensityCallbackConfig"));

}

- (unint64_t)advertisingCapability
{
  return self->_advertisingCapability;
}

- (unint64_t)serviceLevel
{
  return self->_serviceLevel;
}

- (unint64_t)observationInterval
{
  return self->_observationInterval;
}

- (unint64_t)storageDuration
{
  return self->_storageDuration;
}

- (RTPeopleDensityCallbackConfiguration)densityCallbackConfiguration
{
  return self->_densityCallbackConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_densityCallbackConfiguration, 0);
}

@end
