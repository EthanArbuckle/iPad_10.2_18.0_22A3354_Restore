@implementation FCTimeOfDayConfiguration

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[FCTimeOfDayConfiguration start](self, "start"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[FCTimeOfDayConfiguration end](self, "end"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(Start: %@, End: %@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)start
{
  return self->_start;
}

- (int64_t)end
{
  return self->_end;
}

- (FCTimeOfDayConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCTimeOfDayConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCTimeOfDayConfiguration;
  v5 = -[FCTimeOfDayConfiguration init](&v11, sel_init);
  if (v5)
  {
    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("start"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("end"), 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6 && v7)
    {
      v5->_start = objc_msgSend(v6, "longLongValue");
      v5->_end = objc_msgSend(v8, "longLongValue");
    }
    else
    {
      v9 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v4;
        _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "Invalid time of day configuration %{public}@", buf, 0xCu);
      }

      v5 = 0;
    }

  }
  return v5;
}

@end
