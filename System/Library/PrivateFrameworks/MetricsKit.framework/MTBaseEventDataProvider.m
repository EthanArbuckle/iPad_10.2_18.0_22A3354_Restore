@implementation MTBaseEventDataProvider

- (id)knownFields
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[MTEventDataProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "knownFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)xpVersionMetricsKit:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  _QWORD block[5];

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "xpVersionMetricsKit:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("xpVersionMetricsKit"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __47__MTBaseEventDataProvider_xpVersionMetricsKit___block_invoke;
      block[3] = &unk_24C7A0748;
      block[4] = self;
      if (xpVersionMetricsKit__onceToken != -1)
        dispatch_once(&xpVersionMetricsKit__onceToken, block);
      v8 = (id)xpVersionMetricsKit__bundleVersion;
    }
  }

  return v8;
}

- (id)timezoneOffset:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timezoneOffset:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timezoneOffset"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      v11 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "secondsFromGMT");
      v14 = ((unsigned __int128)(v13 * (__int128)0x7777777777777777) >> 64) - v13;
      objc_msgSend(v11, "numberWithInteger:", (v14 >> 5) + ((unint64_t)v14 >> 63));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)osVersion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "osVersion:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("osVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "osVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)osBuildNumber:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "osBuildNumber:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("osBuildNumber"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "osBuildNumber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)os:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "os:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("os"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "os");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)hardwareFamily:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hardwareFamily:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hardwareFamily"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hardwareFamily");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)eventTime:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventTime:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9)
    {
      v8 = v9;
      v7 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "mt_millisecondsSince1970");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v10 = v8;

  return v10;
}

- (id)connection:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connection:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "connectionType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)clientEventId:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientEventId:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mt_base62String");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("1_1_%@"), v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)appVersion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appVersion:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)app:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "app:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("app"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "app");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)baseVersion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "baseVersion:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("baseVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9)
    {
      v8 = v9;
      v7 = v8;
    }
    else
    {
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 1);
    }
  }
  v10 = v8;

  return v10;
}

- (id)capacityData:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "capacityData:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("capacityData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "capacityData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)capacityDataAvailable:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "capacityDataAvailable:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("capacityDataAvailable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "capacityDataAvailable");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)capacityDisk:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "capacityDisk:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("capacityDisk"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "capacityDisk");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)capacitySystem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "capacitySystem:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("capacitySystem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "capacitySystem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)capacitySystemAvailable:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "capacitySystemAvailable:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("capacityDataAvailable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "capacitySystemAvailable");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)fetchAllCookies
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[MTObject metricsKit](self, "metricsKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "system");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cookies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v5 = (void *)MEMORY[0x24BDBD1B8];
    }
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (id)clientId:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientId:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "config");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "configValueForKeyPath:default:", CFSTR("ignoreClientIdCookie"), MEMORY[0x24BDBD1C0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __36__MTBaseEventDataProvider_clientId___block_invoke;
      v15[3] = &unk_24C7A1630;
      v15[4] = self;
      objc_msgSend(v13, "thenWithBlock:", v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

id __36__MTBaseEventDataProvider_clientId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (objc_msgSend(a2, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchAllCookies");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "thenWithBlock:", &__block_literal_global_14);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __36__MTBaseEventDataProvider_clientId___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("xp_ci"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)cookies:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cookies:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MTBaseEventDataProvider fetchAllCookies](self, "fetchAllCookies");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __35__MTBaseEventDataProvider_cookies___block_invoke;
    v11[3] = &unk_24C7A03D0;
    v11[4] = self;
    objc_msgSend(v7, "thenWithBlock:", v11);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

id __35__MTBaseEventDataProvider_cookies___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "metricsKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __35__MTBaseEventDataProvider_cookies___block_invoke_2;
  v9[3] = &unk_24C7A1658;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "computeWithConfigSources:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __35__MTBaseEventDataProvider_cookies___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "metricsKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configValueForKeyPath:sources:", CFSTR("fieldsMap.cookies"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTReflectUtil objectAsArray:](MTReflectUtil, "objectAsArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        +[MTReflectUtil objectAsString:](MTReflectUtil, "objectAsString:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13), (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "length"))
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setValue:forKey:", v15, v14);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
    v16 = (void *)objc_msgSend(v8, "copy");
  else
    v16 = 0;

  return v16;
}

- (id)dsId:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dsId:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dsId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dsId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)hardwareModel:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hardwareModel:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hardwareModel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hardwareModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)hostApp:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hostApp:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hostApp"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hostApp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)hostAppVersion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hostAppVersion:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hostAppVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hostAppVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)isSignedIn:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t isKindOfClass;
  void *v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "isSignedIn:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSignedIn"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSignedIn"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    -[MTBaseEventDataProvider dsId:](self, "dsId:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __38__MTBaseEventDataProvider_isSignedIn___block_invoke_2;
      v14[3] = &unk_24C7A16C0;
      v15 = &__block_literal_global_59;
      objc_msgSend(v7, "thenWithBlock:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "catchWithBlock:", &__block_literal_global_63);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_4;
    }
    __38__MTBaseEventDataProvider_isSignedIn___block_invoke(isKindOfClass, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_4:

LABEL_7:
  return v9;
}

id __38__MTBaseEventDataProvider_isSignedIn___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x24BDD14A8];
    v4 = v2;
    objc_msgSend(v3, "whitespaceCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "length") != 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v2, "integerValue") != 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)MEMORY[0x24BDBD1C0];
    }
  }

  return v7;
}

id __38__MTBaseEventDataProvider_isSignedIn___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

MTPromise *__38__MTBaseEventDataProvider_isSignedIn___block_invoke_3()
{
  return +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", MEMORY[0x24BDBD1C0]);
}

- (id)page:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "page:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("page"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("page"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageType"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10
      || (v11 = (void *)v10,
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageId")),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          !v12))
    {
      v8 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTObject metricsKit](self, "metricsKit");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "config");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configValueForKeyPath:default:", CFSTR("compoundSeparator"), CFSTR("_"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __32__MTBaseEventDataProvider_page___block_invoke;
    v20[3] = &unk_24C7A1728;
    v21 = v13;
    v22 = v14;
    v18 = v14;
    v7 = v13;
    objc_msgSend(v17, "thenWithBlock:", v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_10:

  return v8;
}

id __32__MTBaseEventDataProvider_page___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@"), *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pageContext:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pageContext:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)pageDetails:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pageDetails:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageDetails"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)pageId:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pageId:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)pageType:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pageType:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)pageUrl:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pageUrl:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageUrl"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pageUrl");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)parentPageUrl:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parentPageUrl:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parentPageUrl"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "parentPageUrl");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)pixelRatio:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pixelRatio:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pixelRatio"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pixelRatio");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)resourceRevNum:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resourceRevNum:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resourceRevNum"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "resourceRevNum");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)screenHeight:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screenHeight:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("screenHeight"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "screenHeight");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)screenWidth:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screenWidth:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("screenWidth"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "screenWidth");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)storeFrontHeader:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storeFrontHeader:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storeFrontHeader"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "storeFrontHeader");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)userAgent:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userAgent:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userAgent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "userAgent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)windowInnerHeight:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowInnerHeight:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("windowInnerHeight"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "windowInnerHeight");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)windowInnerWidth:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowInnerWidth:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("windowInnerWidth"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "windowInnerWidth");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)windowOuterHeight:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowOuterHeight:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("windowOuterHeight"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "windowOuterHeight");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)windowOuterWidth:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowOuterWidth:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("windowOuterWidth"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "windowOuterWidth");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)xpPostFrequency:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "xpPostFrequency:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("xpPostFrequency"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "config");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __43__MTBaseEventDataProvider_xpPostFrequency___block_invoke;
      v14[3] = &unk_24C7A0330;
      v14[4] = self;
      objc_msgSend(v12, "computeWithConfigSources:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

id __43__MTBaseEventDataProvider_xpPostFrequency___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metricsKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configValueForKeyPath:sources:", CFSTR("postFrequency"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)xpSendMethod:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "xpSendMethod:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("xpSendMethod"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "system");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "eventRecorder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sendMethod");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_7:

  return v10;
}

void __47__MTBaseEventDataProvider_xpVersionMetricsKit___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valueForKey:", CFSTR("CFBundleShortVersionString"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)xpVersionMetricsKit__bundleVersion;
  xpVersionMetricsKit__bundleVersion = v1;

}

@end
