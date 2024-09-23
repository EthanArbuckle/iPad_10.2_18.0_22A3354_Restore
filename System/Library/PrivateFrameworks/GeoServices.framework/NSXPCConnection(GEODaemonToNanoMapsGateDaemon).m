@implementation NSXPCConnection(GEODaemonToNanoMapsGateDaemon)

+ (id)geo_createGEODaemonToNanoMapsGateDaemonConnection
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__NSXPCConnection_GEODaemonToNanoMapsGateDaemon__geo_createGEODaemonToNanoMapsGateDaemonConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECDBBAD8 != -1)
    dispatch_once(&qword_1ECDBBAD8, block);
  return (id)_MergedGlobals_195;
}

+ (void)geo_withNanoMapsGateDaemon:()GEODaemonToNanoMapsGateDaemon errorHandler:
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
  objc_msgSend(a1, "geo_createGEODaemonToNanoMapsGateDaemonConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__NSXPCConnection_GEODaemonToNanoMapsGateDaemon__geo_withNanoMapsGateDaemon_errorHandler___block_invoke;
  v11[3] = &unk_1E1C03638;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v10);

}

@end
