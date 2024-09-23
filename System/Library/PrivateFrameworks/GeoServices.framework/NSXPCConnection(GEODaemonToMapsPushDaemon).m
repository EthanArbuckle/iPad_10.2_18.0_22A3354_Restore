@implementation NSXPCConnection(GEODaemonToMapsPushDaemon)

+ (id)geo_createGEODaemonToMapsNotificationDaemonConnection
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__NSXPCConnection_GEODaemonToMapsPushDaemon__geo_createGEODaemonToMapsNotificationDaemonConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECDBC2A0 != -1)
    dispatch_once(&qword_1ECDBC2A0, block);
  return (id)_MergedGlobals_262;
}

+ (void)geo_withMapsNotificationProviderDaemon:()GEODaemonToMapsPushDaemon errorHandler:
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "geo_createGEODaemonToMapsNotificationDaemonConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98__NSXPCConnection_GEODaemonToMapsPushDaemon__geo_withMapsNotificationProviderDaemon_errorHandler___block_invoke;
  v11[3] = &unk_1E1C03638;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v10);

}

@end
