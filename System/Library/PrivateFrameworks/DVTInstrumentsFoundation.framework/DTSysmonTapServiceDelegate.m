@implementation DTSysmonTapServiceDelegate

+ (void)registerCapabilities:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_opt_new();
  v5 = v4;
  if (MEMORY[0x24BEDE3C0])
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24EB4EA38, CFSTR("com.apple.instruments.server.services.sysmontap"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24EB4EA50, CFSTR("com.apple.instruments.server.services.sysmontap.deferred"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24EB4EA50, CFSTR("com.apple.instruments.server.services.sysmontap.immediate"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24EB4EA50, CFSTR("com.apple.instruments.server.services.sysmontap.windowed"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24EB4EA50, CFSTR("com.apple.instruments.server.services.sysmontap.processes"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24EB4EA50, CFSTR("com.apple.instruments.server.services.sysmontap.system"));
  }
  +[DTTapService registerCapabilities:forDelegateClass:forConnection:](DTTapService, "registerCapabilities:forDelegateClass:forConnection:", v5, a1, v6);

}

- (DTSysmonTapServiceDelegate)initWithMessageSender:(id)a3
{
  id v5;
  DTSysmonTapServiceDelegate *v6;
  DTSysmonTapServiceDelegate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTSysmonTapServiceDelegate;
  v6 = -[DTSysmonTapServiceDelegate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_messageSender, a3);

  return v7;
}

- (id)createConfigWithPlist:(id)a3
{
  id v4;
  DTSysmonTapConfig *v5;
  _QWORD v7[5];

  v4 = a3;
  v5 = -[DTTapConfig initWithPlist:]([DTSysmonTapConfig alloc], "initWithPlist:", v4);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_222B66D7C;
  v7[3] = &unk_24EB29FB8;
  v7[4] = self;
  -[DTTapConfig setRunningMetadataChangedHandler:](v5, "setRunningMetadataChangedHandler:", v7);
  return v5;
}

- (BOOL)requiresExpiredPIDCacheForConfig:(id)a3
{
  return 1;
}

- (id)willStartWithConfig:(id)a3
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setKind:", 0);
  objc_msgSend(v3, "setTapVersion:", 0x10000);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSender, 0);
}

@end
