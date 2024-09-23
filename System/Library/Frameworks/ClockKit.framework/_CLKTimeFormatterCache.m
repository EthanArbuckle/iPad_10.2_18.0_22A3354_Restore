@implementation _CLKTimeFormatterCache

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40___CLKTimeFormatterCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (id)sharedInstance___sharedInstance_0;
}

+ (id)timeZoneName:(id)a3
{
  if (!a3)
    return CFSTR("[NSTimeZone localTimeZone]");
  objc_msgSend(a3, "name");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_CLKTimeFormatterCache)init
{
  _CLKTimeFormatterCache *v2;
  _CLKTimeFormatterCache *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_CLKTimeFormatterCache;
  v2 = -[_CLKTimeFormatterCache init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cacheLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__invalidateFormatters, *MEMORY[0x24BDBCA70], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_CLKTimeFormatterCache;
  -[_CLKTimeFormatterCache dealloc](&v4, sel_dealloc);
}

- (id)timeOnlyFormatterForTimeZone:(id)a3 hasSeconds:(BOOL)a4 forcedNumberSystem:(unint64_t)a5
{
  _BOOL4 v6;
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *timeOnlyFormatters;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;

  v6 = a4;
  v8 = a3;
  os_unfair_lock_lock(&self->_cacheLock);
  if (!self->_timeOnlyFormatters)
  {
    v9 = (NSMutableDictionary *)objc_opt_new();
    timeOnlyFormatters = self->_timeOnlyFormatters;
    self->_timeOnlyFormatters = v9;

  }
  objc_msgSend((id)objc_opt_class(), "timeZoneName:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("%i%lu"), v6, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_timeOnlyFormatters, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v14 = (void *)objc_opt_new();
    v13 = v14;
    if (a5 != -1)
      _ForceDateFormatterLocaleToUseNumberSystem(v14, a5);
    if (v8)
    {
      objc_msgSend(v13, "setTimeZone:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTimeZone:", v15);

    }
    if (v6)
      v16 = CFSTR("Jmmss");
    else
      v16 = CFSTR("Jmm");
    objc_msgSend(v13, "setLocalizedDateFormatFromTemplate:", v16);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_timeOnlyFormatters, "setObject:forKeyedSubscript:", v13, v12);
  }
  os_unfair_lock_unlock(&self->_cacheLock);

  return v13;
}

- (id)timeAndDesignatorFormatterForTimeZone:(id)a3 suppressWhitespace:(BOOL)a4 forcedNumberSystem:(unint64_t)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  NSMutableDictionary *timeAndDesignatorFormattersSuppressingWhitespace;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *timeAndDesignatorFormatters;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v6 = a4;
  v8 = a3;
  os_unfair_lock_lock(&self->_cacheLock);
  objc_msgSend((id)objc_opt_class(), "timeZoneName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("%lu"), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    timeAndDesignatorFormattersSuppressingWhitespace = self->_timeAndDesignatorFormattersSuppressingWhitespace;
    if (!timeAndDesignatorFormattersSuppressingWhitespace)
    {
      v12 = (NSMutableDictionary *)objc_opt_new();
      v13 = self->_timeAndDesignatorFormattersSuppressingWhitespace;
      self->_timeAndDesignatorFormattersSuppressingWhitespace = v12;

      timeAndDesignatorFormattersSuppressingWhitespace = self->_timeAndDesignatorFormattersSuppressingWhitespace;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](timeAndDesignatorFormattersSuppressingWhitespace, "objectForKeyedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v15 = (void *)objc_opt_new();
      v14 = v15;
      if (a5 != -1)
        _ForceDateFormatterLocaleToUseNumberSystem(v15, a5);
      if (v8)
      {
        objc_msgSend(v14, "setTimeZone:", v8);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTimeZone:", v20);

      }
      _BasicTimeFormat();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((CLKDesignatorRequiresWhitespace() & 1) == 0)
      {
        objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", CFSTR("a "), CFSTR("a"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" a"), CFSTR("a"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v14, "setDateFormat:", v21);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_timeAndDesignatorFormattersSuppressingWhitespace, "setObject:forKeyedSubscript:", v14, v10);

    }
  }
  else
  {
    timeAndDesignatorFormatters = self->_timeAndDesignatorFormatters;
    if (!timeAndDesignatorFormatters)
    {
      v17 = (NSMutableDictionary *)objc_opt_new();
      v18 = self->_timeAndDesignatorFormatters;
      self->_timeAndDesignatorFormatters = v17;

      timeAndDesignatorFormatters = self->_timeAndDesignatorFormatters;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](timeAndDesignatorFormatters, "objectForKeyedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v19 = (void *)objc_opt_new();
      v14 = v19;
      if (v8)
      {
        objc_msgSend(v19, "setTimeZone:", v8);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTimeZone:", v23);

      }
      _BasicTimeFormat();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDateFormat:", v24);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_timeAndDesignatorFormatters, "setObject:forKeyedSubscript:", v14, v10);
    }
  }
  os_unfair_lock_unlock(&self->_cacheLock);

  return v14;
}

- (void)_invalidateFormatters
{
  os_unfair_lock_s *p_cacheLock;
  NSMutableDictionary *timeOnlyFormatters;
  NSMutableDictionary *timeAndDesignatorFormatters;
  NSMutableDictionary *timeAndDesignatorFormattersSuppressingWhitespace;
  id v7;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  timeOnlyFormatters = self->_timeOnlyFormatters;
  self->_timeOnlyFormatters = 0;

  timeAndDesignatorFormatters = self->_timeAndDesignatorFormatters;
  self->_timeAndDesignatorFormatters = 0;

  timeAndDesignatorFormattersSuppressingWhitespace = self->_timeAndDesignatorFormattersSuppressingWhitespace;
  self->_timeAndDesignatorFormattersSuppressingWhitespace = 0;

  os_unfair_lock_unlock(p_cacheLock);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("_FormatterCacheInvalidatedNotification"), 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeAndDesignatorFormattersSuppressingWhitespace, 0);
  objc_storeStrong((id *)&self->_timeAndDesignatorFormatters, 0);
  objc_storeStrong((id *)&self->_timeOnlyFormatters, 0);
}

@end
