@implementation MTPAFBaseEventDataProvider

- (id)knownFields
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTPAFBaseEventDataProvider;
  -[MTBaseEventDataProvider knownFields](&v7, sel_knownFields);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("app"), CFSTR("appVersion"), CFSTR("baseVersion"), CFSTR("clientEventId"), CFSTR("clientId"), CFSTR("connection"), CFSTR("dsId"), CFSTR("eventTime"), CFSTR("eventVersion"), CFSTR("hardwareFamily"), CFSTR("hardwareModel"), CFSTR("isOffline"), CFSTR("os"), CFSTR("osBuildNumber"), CFSTR("osLanguages"), CFSTR("osVersion"), CFSTR("resourceRevNum"),
      CFSTR("storeFrontHeader"),
      CFSTR("timezoneOffset"),
      CFSTR("userAgent"),
      CFSTR("xpPostFrequency"),
      CFSTR("xpSendMethod"),
      CFSTR("xpVersionMetricsKit"),
      0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)isOffline:(id)a3
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
    objc_msgSend(v7, "isOffline:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)osLanguages:(id)a3
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
    objc_msgSend(v7, "osLanguages:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("osLanguages"));
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
      objc_msgSend(v13, "osLanguages");
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

@end
