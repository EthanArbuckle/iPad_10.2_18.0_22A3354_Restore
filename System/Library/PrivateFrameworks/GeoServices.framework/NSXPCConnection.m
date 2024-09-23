@implementation NSXPCConnection

uint64_t __99__NSXPCConnection_GEODaemonToNanoMapsGateDaemon__geo_createGEODaemonToNanoMapsGateDaemonConnection__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _NanoMapsGateDaemonHelper *v5;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithMachServiceName:options:", CFSTR("com.apple.nanomaps.xpc.GeoServices"), 0);
  v2 = (void *)_MergedGlobals_195;
  _MergedGlobals_195 = v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE046AE8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_195, "setRemoteObjectInterface:", v3);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF6A078);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_195, "setExportedInterface:", v4);

  v5 = objc_alloc_init(_NanoMapsGateDaemonHelper);
  objc_msgSend((id)_MergedGlobals_195, "setExportedObject:", v5);

  return objc_msgSend((id)_MergedGlobals_195, "resume");
}

void __90__NSXPCConnection_GEODaemonToNanoMapsGateDaemon__geo_withNanoMapsGateDaemon_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (qword_1ECDBBAE8 != -1)
    dispatch_once(&qword_1ECDBBAE8, &__block_literal_global_31);
  v4 = qword_1ECDBBAE0;
  if (os_log_type_enabled((os_log_t)qword_1ECDBBAE0, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_ERROR, "Error sending message to mapspushd: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __99__NSXPCConnection_GEODaemonToMapsPushDaemon__geo_createGEODaemonToMapsNotificationDaemonConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithMachServiceName:options:", CFSTR("com.apple.Maps.mapspushd.geoservices"), 0);
  v3 = (void *)_MergedGlobals_262;
  _MergedGlobals_262 = v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "geo_MapsNotificationDaemonFromGeodInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_262, "setRemoteObjectInterface:", v4);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF52580);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_262, "setExportedInterface:", v5);

  objc_msgSend((id)_MergedGlobals_262, "setExportedObject:", *(_QWORD *)(a1 + 32));
  return objc_msgSend((id)_MergedGlobals_262, "resume");
}

void __98__NSXPCConnection_GEODaemonToMapsPushDaemon__geo_withMapsNotificationProviderDaemon_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (qword_1ECDBC2B0 != -1)
    dispatch_once(&qword_1ECDBC2B0, &__block_literal_global_122);
  v4 = qword_1ECDBC2A8;
  if (os_log_type_enabled((os_log_t)qword_1ECDBC2A8, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_ERROR, "Error sending message to notification daemon: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
