@implementation BCSAnalyticsLogger

+ (id)sharedLogger
{
  if (sharedLogger_onceToken != -1)
    dispatch_once(&sharedLogger_onceToken, &__block_literal_global_3);
  return (id)sharedLogger_sharedLogger;
}

void __34__BCSAnalyticsLogger_sharedLogger__block_invoke()
{
  NSObject *v0;
  id v1;
  void *v2;
  dispatch_queue_t v3;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.BarcodeSupport.Analytics", v0);

  v1 = -[BCSAnalyticsLogger _initWithQueue:]([BCSAnalyticsLogger alloc], "_initWithQueue:", v3);
  v2 = (void *)sharedLogger_sharedLogger;
  sharedLogger_sharedLogger = (uint64_t)v1;

}

- (id)_initWithQueue:(id)a3
{
  id v5;
  BCSAnalyticsLogger *v6;
  BCSAnalyticsLogger *v7;
  BCSAnalyticsLogger *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCSAnalyticsLogger;
  v6 = -[BCSAnalyticsLogger init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = v7;
  }

  return v7;
}

- (void)didActivateNFCReader
{
  -[BCSAnalyticsLogger _sendEventLazyWithName:payload:](self, "_sendEventLazyWithName:payload:", CFSTR("com.apple.BarcodeSupport.DidActivateNFCReader"), MEMORY[0x24BDBD1B8]);
}

- (void)didScanNFCTagOfType:(int64_t)a3
{
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
    v4 = CFSTR("appclip");
  else
    v4 = CFSTR("url");
  v8 = CFSTR("tagDataType");
  v9[0] = v4;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = v4;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[BCSAnalyticsLogger _sendEventLazyWithName:payload:](self, "_sendEventLazyWithName:payload:", CFSTR("com.apple.BarcodeSupport.DidScanNFCTag"), v7);
}

- (void)_sendEventLazyWithName:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__BCSAnalyticsLogger__sendEventLazyWithName_payload___block_invoke;
  v11[3] = &unk_24D7879A0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

}

void __53__BCSAnalyticsLogger__sendEventLazyWithName_payload___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  AnalyticsSendEventLazy();

}

id __53__BCSAnalyticsLogger__sendEventLazyWithName_payload___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_stringForCodeType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("QR");
  if (a3 == 2)
    v3 = CFSTR("NFC");
  if (a3 == 3)
    return CFSTR("Appclip");
  else
    return (id)v3;
}

- (id)_stringForDataType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x10)
    return CFSTR("Other");
  else
    return *(&off_24D7879C0 + a3);
}

- (id)_eventPayloadForAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("client"));

    -[BCSAnalyticsLogger _stringForCodeType:](self, "_stringForCodeType:", objc_msgSend(v4, "codeType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("codeType"));

    objc_msgSend(v4, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSAnalyticsLogger _stringForDataType:](self, "_stringForDataType:", objc_msgSend(v9, "type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("dataType"));

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)MEMORY[0x24BDD16E0];
      v12 = v4;
      objc_msgSend(v12, "appLinks");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("applinks"));

      v15 = (void *)MEMORY[0x24BDD16E0];
      v16 = objc_msgSend(v12, "mustOpenAppLinkInApp");

      objc_msgSend(v15, "numberWithBool:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("openInApp"));

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)logBarcodeDetectedEventForAction:(id)a3 startTime:(unint64_t)a4
{
  -[BCSAnalyticsLogger logBarcodeDetectedEventForAction:fromBundleID:](self, "logBarcodeDetectedEventForAction:fromBundleID:", a3, 0);
}

- (void)logBarcodeDetectedEventForAction:(id)a3 fromBundleID:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[BCSAnalyticsLogger _eventPayloadForAction:](self, "_eventPayloadForAction:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (v8)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("client"));
  -[BCSAnalyticsLogger _sendEventLazyWithName:payload:](self, "_sendEventLazyWithName:payload:", CFSTR("com.apple.BarcodeSupport.DidDetectBarcode"), v7);

}

- (void)logBarcodeActivatedEventForAction:(id)a3
{
  id v4;

  -[BCSAnalyticsLogger _eventPayloadForAction:](self, "_eventPayloadForAction:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BCSAnalyticsLogger _sendEventLazyWithName:payload:](self, "_sendEventLazyWithName:payload:", CFSTR("com.apple.BarcodeSupport.DidActivateBarcode"), v4);

}

- (void)logBarcodePreviewedEventForContentType:(int64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("contentType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSAnalyticsLogger _sendEventLazyWithName:payload:](self, "_sendEventLazyWithName:payload:", CFSTR("com.apple.BarcodeSupport.DidPreviewContent"), v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
