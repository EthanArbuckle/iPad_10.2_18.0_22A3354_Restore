@implementation MTPerfBaseEventDataProvider

id __48__MTPerfBaseEventDataProvider_xpSamplingForced___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v5, "configValueForKeyPath:sources:", CFSTR("performance.samplingForced"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)knownFields
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v12;
  _QWORD v13[12];

  v13[11] = *MEMORY[0x24BDAC8D0];
  -[MTEventDataProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "knownFields");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MTPerfBaseEventDataProvider;
    -[MTBaseEventDataProvider knownFields](&v12, sel_knownFields);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v13[0] = CFSTR("app");
      v13[1] = CFSTR("appVersion");
      v13[2] = CFSTR("hardwareFamily");
      v13[3] = CFSTR("os");
      v13[4] = CFSTR("osBuildNumber");
      v13[5] = CFSTR("osVersion");
      v13[6] = CFSTR("connection");
      v13[7] = CFSTR("clientEventId");
      v13[8] = CFSTR("timezoneOffset");
      v13[9] = CFSTR("eventTime");
      v13[10] = CFSTR("xpVersionMetricsKit");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 11);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v9;

    objc_msgSend(v5, "arrayByAddingObject:", CFSTR("xpSamplingForced"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v6;

  return v10;
}

- (id)xpSamplingForced:(id)a3
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
    objc_msgSend(v7, "xpSamplingForced:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("xpSamplingForced"));
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
      v14[2] = __48__MTPerfBaseEventDataProvider_xpSamplingForced___block_invoke;
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

@end
