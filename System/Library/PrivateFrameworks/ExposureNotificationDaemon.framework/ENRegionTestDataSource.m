@implementation ENRegionTestDataSource

- (ENRegionTestDataSource)initWithDelegate:(id)a3
{
  id v4;
  ENRegionTestDataSource *v5;
  ENRegionTestDataSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENRegionTestDataSource;
  v5 = -[ENRegionTestDataSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ENRegionTestDataSource setDelegate:](v5, "setDelegate:", v4);

  return v6;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3938];
  -[ENRegionTestDataSource currentRegionVisit](self, "currentRegionVisit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("ENRegionTestDataSource: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)dealloc
{
  objc_super v3;

  if (gLogCategory_ENRegionTestDataSource <= 30
    && (gLogCategory_ENRegionTestDataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  CFPrefs_RemoveValue();
  v3.receiver = self;
  v3.super_class = (Class)ENRegionTestDataSource;
  -[ENRegionTestDataSource dealloc](&v3, sel_dealloc);
}

- (void)startMonitoring
{
  objc_class *v3;
  void *v4;
  id v5;

  if (gLogCategory_ENRegionTestDataSource <= 30
    && (gLogCategory_ENRegionTestDataSource != -1 || _LogCategory_Initialize()))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
}

- (void)stopMonitoring
{
  objc_class *v3;
  void *v4;
  id v5;

  if (gLogCategory_ENRegionTestDataSource <= 30
    && (gLogCategory_ENRegionTestDataSource != -1 || _LogCategory_Initialize()))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
}

- (id)currentRegionVisit
{
  void *v2;
  void *v3;
  uint64_t v5;

  CFDataGetTypeID();
  v2 = (void *)CFPrefs_CopyTypedValue();
  if (!objc_msgSend(v2, "length")
    || (v5 = 0,
        objc_msgSend(MEMORY[0x1E0CB3708], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v5),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (gLogCategory_ENRegionTestDataSource <= 30
      && (gLogCategory_ENRegionTestDataSource != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v3 = 0;
  }

  return v3;
}

- (void)regionChanged
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  id v8;

  -[ENRegionTestDataSource currentRegionVisit](self, "currentRegionVisit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSensitiveLoggingAllowed");

    if ((v5 & 1) != 0
      && gLogCategory_ENRegionTestDataSource <= 30
      && (gLogCategory_ENRegionTestDataSource != -1 || _LogCategory_Initialize()))
    {
      v7 = v8;
      LogPrintF_safe();
    }
    -[ENRegionTestDataSource delegate](self, "delegate", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "regionDataSource:updatedWithVisit:", self, v8);

    v3 = v8;
  }

}

- (ENRegionMonitorSourceDelegate)delegate
{
  return (ENRegionMonitorSourceDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
}

@end
