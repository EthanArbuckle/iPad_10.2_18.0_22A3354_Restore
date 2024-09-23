@implementation _GCDaemonSettings

+ (id)instance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29___GCDaemonSettings_instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (instance_dispatcher_1 != -1)
    dispatch_once(&instance_dispatcher_1, block);
  return (id)instance_sharedInstance_1;
}

- (_GCDaemonSettings)init
{
  _GCDaemonSettings *v2;
  uint64_t v3;
  NSUserDefaults *defaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GCDaemonSettings;
  v2 = -[_GCDaemonSettings init](&v6, sel_init);
  if (v2)
  {
    +[NSUserDefaults standardUserDefaults](&off_254DEF040, "standardUserDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

  }
  return v2;
}

- (id)newAnonymizedIdentifiersDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)&off_254DEBD30);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24D30F1A8, CFSTR("nextIdentifier"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("currentCycle"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1B8], CFSTR("identifiers"));
  return v4;
}

- (id)anonymizedIdentifierForControllerIdentifier:(id)a3
{
  id v4;
  _GCDaemonSettings *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (gc_isInternalBuild())
  {
    getGCDLogger();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v4;
      _os_log_impl(&dword_215181000, v24, OS_LOG_TYPE_INFO, "anonymizedIdentifierForControllerIdentifier: %@", buf, 0xCu);
    }

  }
  +[NSDate date](&off_254DF6DA0, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", vcvtmd_s64_f64(v7 / 86400.0 / 91.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults objectForKey:](v5->_defaults, "objectForKey:", CFSTR("anonymizedIdentifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("currentCycle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToNumber:", v8);
    if (v12)
    {
      +[NSMutableDictionary dictionaryWithDictionary:](&off_254DEBD30, "dictionaryWithDictionary:", v10);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = -[_GCDaemonSettings newAnonymizedIdentifiersDictionary:](v5, "newAnonymizedIdentifiersDictionary:", v8);
    }
    v14 = (id)v13;

    v15 = v12 ^ 1;
  }
  else
  {
    v14 = -[_GCDaemonSettings newAnonymizedIdentifiersDictionary:](v5, "newAnonymizedIdentifiersDictionary:", v8);
    v15 = 1;
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("identifiers"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSMutableDictionary dictionaryWithDictionary:](&off_254DEBD30, "dictionaryWithDictionary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKeyedSubscript:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = v18 == 0;

  if ((_DWORD)v16)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("nextIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("controller-%@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, v4);

    +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", objc_msgSend(v19, "intValue") + 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, CFSTR("nextIdentifier"));

    v15 = 1;
  }
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("identifiers"));
  if (v15)
  {
    if (gc_isInternalBuild())
    {
      getGCDLogger();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v14;
        _os_log_impl(&dword_215181000, v25, OS_LOG_TYPE_INFO, "Storing the following anonymizedIdentifiers: %@", buf, 0xCu);
      }

    }
    -[NSUserDefaults setObject:forKey:](v5->_defaults, "setObject:forKey:", v14, CFSTR("anonymizedIdentifiers"));
  }
  else if (gc_isInternalBuild())
  {
    getGCDLogger();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v10;
      _os_log_impl(&dword_215181000, v26, OS_LOG_TYPE_INFO, "Values didn't change. Stored anonymizedIdentifiers are: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v17, "objectForKeyedSubscript:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
