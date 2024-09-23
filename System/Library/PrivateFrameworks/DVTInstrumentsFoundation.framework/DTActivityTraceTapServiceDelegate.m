@implementation DTActivityTraceTapServiceDelegate

+ (void)registerCapabilities:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24EB4E9F0, CFSTR("com.apple.instruments.server.services.activitytracetap"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24EB4EA08, CFSTR("com.apple.instruments.server.services.activitytracetap.deferred"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24EB4EA08, CFSTR("com.apple.instruments.server.services.activitytracetap.immediate"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24EB4EA08, CFSTR("com.apple.instruments.server.services.activitytracetap.windowed"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24EB4EA20, CFSTR("com.apple.instruments.server.services.httparchiverecording"));
  +[DTTapService registerCapabilities:forDelegateClass:forConnection:](DTTapService, "registerCapabilities:forDelegateClass:forConnection:", v5, a1, v4);

}

- (DTActivityTraceTapServiceDelegate)initWithMessageSender:(id)a3
{
  id v5;
  DTActivityTraceTapServiceDelegate *v6;
  DTActivityTraceTapServiceDelegate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTActivityTraceTapServiceDelegate;
  v6 = -[DTActivityTraceTapServiceDelegate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_messageSender, a3);

  return v7;
}

- (id)createConfigWithPlist:(id)a3
{
  id v3;
  DTActivityTraceTapConfig *v4;

  v3 = a3;
  v4 = -[DTTapConfig initWithPlist:]([DTActivityTraceTapConfig alloc], "initWithPlist:", v3);

  -[DTTapConfig setRunningMetadataChangedHandler:](v4, "setRunningMetadataChangedHandler:", &unk_24EB27870);
  return v4;
}

- (BOOL)validateConfig:(id)a3
{
  return 1;
}

- (BOOL)requiresExpiredPIDCacheForConfig:(id)a3
{
  return MEMORY[0x24BEDD108](a3, sel_trackExpiredPIDs);
}

- (id)willStartWithConfig:(id)a3
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setKind:", 0);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSender, 0);
}

@end
