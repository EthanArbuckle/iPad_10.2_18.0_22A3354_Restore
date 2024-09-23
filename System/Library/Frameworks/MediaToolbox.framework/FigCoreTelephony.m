@implementation FigCoreTelephony

- (int)bars
{
  int bars;

  MEMORY[0x19402EA0C](self->_cellStatsLock, a2);
  bars = self->bars;
  MEMORY[0x19402EA24](self->_cellStatsLock);
  return bars;
}

- (NSDictionary)signalStrength
{
  void *v3;

  MEMORY[0x19402EA0C](self->_cellStatsLock, a2);
  v3 = (void *)-[NSDictionary copy](self->signalStrength, "copy");
  MEMORY[0x19402EA24](self->_cellStatsLock);
  return (NSDictionary *)v3;
}

- (NSString)carrierName
{
  void *v3;

  MEMORY[0x19402EA0C](self->_cellStatsLock, a2);
  v3 = (void *)-[NSString copy](self->carrierName, "copy");
  MEMORY[0x19402EA24](self->_cellStatsLock);
  return (NSString *)v3;
}

- (void)saveSignalStrengthInfo
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v11 = 0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v3)
  {
    v4 = -[CoreTelephonyClient getCurrentDataServiceDescriptorSync:](self->ctClient, "getCurrentDataServiceDescriptorSync:", &v11);
    if (!v11)
    {
      v5 = v4;
      v6 = (void *)-[CoreTelephonyClient getSignalStrengthMeasurements:error:](self->ctClient, "getSignalStrengthMeasurements:error:", v4, &v11);
      if (!v11)
      {
        v7 = v6;
        objc_msgSend(v3, "setValue:forKey:", objc_msgSend(v6, "rssi"), CFSTR("rssi"));
        objc_msgSend(v3, "setValue:forKey:", objc_msgSend(v7, "rsrp"), CFSTR("rsrp"));
        objc_msgSend(v3, "setValue:forKey:", objc_msgSend(v7, "rscp"), CFSTR("rscp"));
        objc_msgSend(v3, "setValue:forKey:", objc_msgSend(v7, "rsrq"), CFSTR("rsrq"));
        objc_msgSend(v3, "setValue:forKey:", objc_msgSend(v7, "snr"), CFSTR("snr"));
        v8 = objc_msgSend(MEMORY[0x1E0CA6E28], "contextWithServiceDescriptor:", v5);
        if (v8)
        {
          v9 = -[CoreTelephonyClient getSignalStrengthInfo:error:](self->ctClient, "getSignalStrengthInfo:error:", v8, &v11);
          if (v9)
          {
            v10 = (void *)v9;
            MEMORY[0x19402EA0C](self->_cellStatsLock);
            self->bars = objc_msgSend((id)objc_msgSend(v10, "bars"), "intValue");
            MEMORY[0x19402EA24](self->_cellStatsLock);
          }
        }
        MEMORY[0x19402EA0C](self->_cellStatsLock);

        self->signalStrength = (NSDictionary *)objc_msgSend(v3, "copy");
        MEMORY[0x19402EA24](self->_cellStatsLock);
      }
    }
  }

}

- (FigCoreTelephony)initWithError:(id *)a3
{
  FigCoreTelephony *v4;
  FigCoreTelephony *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FigCoreTelephony;
  v4 = -[FigCoreTelephony init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", 0);
    v5->ctClient = (CoreTelephonyClient *)v6;
    if (v6 && (v7 = FigReentrantMutexCreate(), (v5->_cellStatsLock = (OpaqueFigReentrantMutex *)v7) != 0))
    {
      v5->signalStrength = 0;
      v5->carrierName = 0;
      -[FigCoreTelephony saveCarrierName](v5, "saveCarrierName");
      -[FigCoreTelephony saveSignalStrengthInfo](v5, "saveSignalStrengthInfo");
      -[CoreTelephonyClient setDelegate:](v5->ctClient, "setDelegate:", v5);
      v4 = 0;
    }
    else
    {
      v4 = (FigCoreTelephony *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreMediaErrorDomain"), -19250, 0);
    }
  }
  *a3 = v4;
  return v5;
}

- (void)saveCarrierName
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = 0;
  v3 = (void *)-[CoreTelephonyClient getPreferredDataSubscriptionContextSync:](self->ctClient, "getPreferredDataSubscriptionContextSync:", 0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6D00]), "initWithBundleType:", 1);
    if (v4)
    {
      v5 = -[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:](self->ctClient, "copyCarrierBundleValue:key:bundleType:error:", v3, CFSTR("CarrierName"), v4, &v6);
      v3 = (void *)v5;
      if (!v6 && v5)
      {
        MEMORY[0x19402EA0C](self->_cellStatsLock);

        self->carrierName = (NSString *)objc_msgSend((id)-[CoreTelephonyClient getEnglishCarrierNameFor:error:](self->ctClient, "getEnglishCarrierNameFor:error:", v3, &v6), "copy");
        MEMORY[0x19402EA24](self->_cellStatsLock);
      }
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  -[FigCoreTelephony saveSignalStrengthInfo](self, "saveSignalStrengthInfo", a3);
  MEMORY[0x19402EA0C](self->_cellStatsLock);
  self->bars = objc_msgSend((id)objc_msgSend(a4, "bars"), "intValue");
  JUMPOUT(0x19402EA24);
}

- (void)dealloc
{
  objc_super v3;

  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)FigCoreTelephony;
  -[FigCoreTelephony dealloc](&v3, sel_dealloc);
}

@end
