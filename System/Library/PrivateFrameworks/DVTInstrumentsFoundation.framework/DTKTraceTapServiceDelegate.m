@implementation DTKTraceTapServiceDelegate

+ (void)registerCapabilities:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[DTDeviceKTraceSupport capabilities](DTDeviceKTraceSupport, "capabilities");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[DTTapService registerCapabilities:forDelegateClass:forConnection:](DTTapService, "registerCapabilities:forDelegateClass:forConnection:", v5, a1, v4);

}

- (DTKTraceTapServiceDelegate)initWithMessageSender:(id)a3
{
  id v5;
  DTKTraceTapServiceDelegate *v6;
  DTKTraceTapServiceDelegate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTKTraceTapServiceDelegate;
  v6 = -[DTKTraceTapServiceDelegate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_messageSender, a3);

  return v7;
}

- (id)createConfigWithPlist:(id)a3
{
  id v4;
  DTKTraceTapConfig *v5;
  _QWORD v7[5];

  v4 = a3;
  v5 = -[DTTapConfig initWithPlist:]([DTKTraceTapConfig alloc], "initWithPlist:", v4);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_222B8B178;
  v7[3] = &unk_24EB29FB8;
  v7[4] = self;
  -[DTTapConfig setRunningMetadataChangedHandler:](v5, "setRunningMetadataChangedHandler:", v7);
  return v5;
}

- (BOOL)requiresExpiredPIDCacheForConfig:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_222B8B2B8;
  v6[3] = &unk_24EB295F0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateTriggerConfigs:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)willStartWithConfig:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setKind:", 0);
  v5 = objc_msgSend(v3, "triggerConfigCount");

  objc_msgSend(v4, "setTriggerCount:", v5);
  objc_msgSend(v4, "setCoreCount:", DTGetCoreCount());
  objc_msgSend(v4, "setTapVersion:", 0x10000);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSender, 0);
}

@end
