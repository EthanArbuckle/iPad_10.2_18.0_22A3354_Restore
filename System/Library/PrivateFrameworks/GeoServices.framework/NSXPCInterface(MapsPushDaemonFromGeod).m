@implementation NSXPCInterface(MapsPushDaemonFromGeod)

+ (id)geo_MapsNotificationDaemonFromGeodInterface
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "interfaceWithProtocol:", &unk_1EE046DE8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_expiredOfflineSubscriptions_withDisplayNames_forReason_, 0, 0);

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_expiredOfflineSubscriptions_withDisplayNames_forReason_, 1, 0);

  return v1;
}

@end
