@implementation FCTimesOfDayConfiguration

- (FCTimeOfDayConfiguration)morningTimeOfDayConfiguration
{
  return self->_morningTimeOfDayConfiguration;
}

- (FCTimeOfDayConfiguration)afternoonTimeOfDayConfiguration
{
  return self->_afternoonTimeOfDayConfiguration;
}

- (FCTimesOfDayConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCTimesOfDayConfiguration *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  FCTimeOfDayConfiguration *v11;
  void *v12;
  FCTimeOfDayConfiguration *v13;
  void *v14;
  FCTimeOfDayConfiguration *v15;
  FCTimeOfDayConfiguration *v16;
  FCTimeOfDayConfiguration *v17;
  NSObject *v18;
  NSObject *v19;
  _BOOL4 v20;
  const char *v21;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  FCTimeOfDayConfiguration *v26;
  __int16 v27;
  FCTimeOfDayConfiguration *v28;
  __int16 v29;
  FCTimeOfDayConfiguration *v30;
  __int16 v31;
  FCTimeOfDayConfiguration *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)FCTimesOfDayConfiguration;
  v5 = -[FCTimesOfDayConfiguration init](&v24, sel_init);
  if (v5)
  {
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("morning"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("afternoon"), 0);
    v7 = objc_claimAutoreleasedReturnValue();
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("evening"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("night"), 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v6;
    v11 = -[FCTimeOfDayConfiguration initWithDictionary:]([FCTimeOfDayConfiguration alloc], "initWithDictionary:", v6);
    v12 = (void *)v7;
    v13 = -[FCTimeOfDayConfiguration initWithDictionary:]([FCTimeOfDayConfiguration alloc], "initWithDictionary:", v7);
    v14 = (void *)v8;
    v15 = -[FCTimeOfDayConfiguration initWithDictionary:]([FCTimeOfDayConfiguration alloc], "initWithDictionary:", v8);
    v23 = (void *)v9;
    v16 = -[FCTimeOfDayConfiguration initWithDictionary:]([FCTimeOfDayConfiguration alloc], "initWithDictionary:", v9);
    v17 = v16;
    if (v11 && v13 && v15 && v16)
    {
      objc_storeStrong((id *)&v5->_morningTimeOfDayConfiguration, v11);
      objc_storeStrong((id *)&v5->_afternoonTimeOfDayConfiguration, v13);
      objc_storeStrong((id *)&v5->_eveningTimeOfDayConfiguration, v15);
      objc_storeStrong((id *)&v5->_nightTimeOfDayConfiguration, v17);
      v18 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v26 = v11;
        v27 = 2114;
        v28 = v13;
        v29 = 2114;
        v30 = v15;
        v31 = 2114;
        v32 = v17;
        _os_log_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_DEFAULT, "Parsed a times of day configuration with morning: %{public}@, afternoon: %{public}@, evening: %{public}@ and night: %{public}@", buf, 0x2Au);
      }
      goto LABEL_21;
    }
    if (v11)
    {
      if (v13)
      {
        v19 = FCDefaultLog;
        v20 = os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT);
        if (v15)
        {
          if (v20)
          {
            *(_DWORD *)buf = 138543362;
            v26 = v17;
            v21 = "Invalid night time of day configuration in %{public}@";
LABEL_19:
            _os_log_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
          }
        }
        else if (v20)
        {
          *(_DWORD *)buf = 138543362;
          v26 = 0;
          v21 = "Invalid evening time of day configuration in %{public}@";
          goto LABEL_19;
        }
      }
      else
      {
        v19 = FCDefaultLog;
        if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v26 = 0;
          v21 = "Invalid afternoon time of day configuration in %{public}@";
          goto LABEL_19;
        }
      }
    }
    else
    {
      v19 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v26 = 0;
        v21 = "Invalid morning time of day configuration in %{public}@";
        goto LABEL_19;
      }
    }

    v5 = 0;
LABEL_21:

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nightTimeOfDayConfiguration, 0);
  objc_storeStrong((id *)&self->_eveningTimeOfDayConfiguration, 0);
  objc_storeStrong((id *)&self->_afternoonTimeOfDayConfiguration, 0);
  objc_storeStrong((id *)&self->_morningTimeOfDayConfiguration, 0);
}

+ (id)defaultConfiguration
{
  return -[FCTimesOfDayConfiguration initWithDictionary:]([FCTimesOfDayConfiguration alloc], "initWithDictionary:", &unk_1E470D3D0);
}

- (FCTimeOfDayConfiguration)eveningTimeOfDayConfiguration
{
  return self->_eveningTimeOfDayConfiguration;
}

- (FCTimeOfDayConfiguration)nightTimeOfDayConfiguration
{
  return self->_nightTimeOfDayConfiguration;
}

@end
