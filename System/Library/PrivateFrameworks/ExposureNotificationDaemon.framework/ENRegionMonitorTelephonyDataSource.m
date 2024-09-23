@implementation ENRegionMonitorTelephonyDataSource

- (void)telephonyUtility:(id)a3 mobileCountryCodeChanged:(id)a4 andCountryCodeISO:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8 && v9 && objc_msgSend(v9, "length"))
  {
    -[ENRegionMonitorTelephonyDataSource mobileCountryCodeChanged:withISOString:](self, "mobileCountryCodeChanged:withISOString:", v8, v10);
  }
  else if (gLogCategory__ENRegionMonitorTelephonyDataSource <= 90
         && (gLogCategory__ENRegionMonitorTelephonyDataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)mobileCountryCodeChanged:(id)a3 withISOString:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[ENRegionMonitorTelephonyDataSource cachedRegionVisit](self, "cachedRegionVisit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    && gLogCategory_ENRegionMonitorTelephonyDataSource <= 30
    && (gLogCategory_ENRegionMonitorTelephonyDataSource != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v13, "integerValue");
    LogPrintF_safe();
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA378]), "initWithCountryCode:", v6);

  v9 = objc_alloc(MEMORY[0x1E0CAA3B0]);
  objc_msgSend(MEMORY[0x1E0C99D60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithRegion:date:", v8, v10);

  -[ENRegionMonitorTelephonyDataSource setCachedRegionVisit:](self, "setCachedRegionVisit:", v11);
  -[ENRegionMonitorTelephonyDataSource delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "regionDataSource:updatedWithVisit:", self, v11);

}

- (void)setCachedRegionVisit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (ENRegionMonitorSourceDelegate)delegate
{
  return (ENRegionMonitorSourceDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (ENRegionVisit)cachedRegionVisit
{
  return self->_cachedRegionVisit;
}

- (ENRegionMonitorTelephonyDataSource)initWithDelegate:(id)a3
{
  id v4;
  ENRegionMonitorTelephonyDataSource *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ENRegionMonitorTelephonyDataSource;
  v5 = -[ENRegionMonitorTelephonyDataSource init](&v10, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.exposureNotification.regionSource.telephony", v6);
    -[ENRegionMonitorTelephonyDataSource setDataSourceQueue:](v5, "setDataSourceQueue:", v7);

    -[ENRegionMonitorTelephonyDataSource setDelegate:](v5, "setDelegate:", v4);
    +[ENCoreTelephonyUtility sharedInstance](ENCoreTelephonyUtility, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENRegionMonitorTelephonyDataSource setTelephonyUtility:](v5, "setTelephonyUtility:", v8);

  }
  return v5;
}

- (void)startMonitoring
{
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (gLogCategory_ENRegionMonitorTelephonyDataSource <= 30
    && (gLogCategory_ENRegionMonitorTelephonyDataSource != -1 || _LogCategory_Initialize()))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  -[ENRegionMonitorTelephonyDataSource telephonyUtility](self, "telephonyUtility", v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:", self);

}

- (void)stopMonitoring
{
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (gLogCategory_ENRegionMonitorTelephonyDataSource <= 30
    && (gLogCategory_ENRegionMonitorTelephonyDataSource != -1 || _LogCategory_Initialize()))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  -[ENRegionMonitorTelephonyDataSource telephonyUtility](self, "telephonyUtility", v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (OS_dispatch_queue)dataSourceQueue
{
  return self->_dataSourceQueue;
}

- (void)setDataSourceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceQueue, a3);
}

- (ENCoreTelephonyUtility)telephonyUtility
{
  return self->_telephonyUtility;
}

- (void)setTelephonyUtility:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyUtility, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyUtility, 0);
  objc_storeStrong((id *)&self->_dataSourceQueue, 0);
  objc_storeStrong((id *)&self->_cachedRegionVisit, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
