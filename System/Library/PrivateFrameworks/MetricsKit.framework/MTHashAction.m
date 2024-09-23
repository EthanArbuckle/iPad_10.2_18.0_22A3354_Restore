@implementation MTHashAction

- (MTHashAction)initWithField:(id)a3 configDictionary:(id)a4
{
  id v6;
  MTHashAction *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MTIDScheme *v14;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MTHashAction;
  v7 = -[MTTreatmentAction initWithField:configDictionary:](&v16, sel_initWithField_configDictionary_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("scheme"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("namespace"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
LABEL_7:
        v14 = -[MTIDScheme initWithNamespace:options:]([MTIDScheme alloc], "initWithNamespace:options:", v9, v8);
        -[MTHashAction setScheme:](v7, "setScheme:", v14);

        goto LABEL_8;
      }
    }
    else
    {

      v8 = 0;
    }
    v10 = (void *)MEMORY[0x24BDD17C8];
    +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hostProcessBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTreatmentAction field](v7, "field");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%lx"), v12, objc_msgSend(v13, "hash"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (id)hashOf:(id)a3 userId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "secretStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTHashAction scheme](self, "scheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = CFSTR("syncWaitTime");
  v25[0] = &unk_24C7B8358;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "secretForScheme:options:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v12, "resultWithTimeout:error:", &v21, 5.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;

  if (v13)
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v13, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@\n%@\n%@"), v6, v16, v7);
    v17 = objc_claimAutoreleasedReturnValue();

    -[NSObject mt_SHA1Base62String](v17, "mt_SHA1Base62String");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    MTMetricsKitOSLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[MTHashAction scheme](self, "scheme");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v19;
      _os_log_impl(&dword_20D758000, v17, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to retrieve secret salt for scheme %@", buf, 0xCu);

    }
    v18 = 0;
  }

  return v18;
}

- (id)performAction:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTHashAction;
  -[MTTreatmentAction performAction:context:](&v14, sel_performAction_context_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "stringValue");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_7;
    }
    objc_msgSend(v7, "description");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  v7 = v9;
LABEL_7:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "metrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("userId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[MTHashAction hashOf:userId:](self, "hashOf:userId:", v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (MTIDScheme)scheme
{
  return self->_scheme;
}

- (void)setScheme:(id)a3
{
  objc_storeStrong((id *)&self->_scheme, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheme, 0);
}

@end
