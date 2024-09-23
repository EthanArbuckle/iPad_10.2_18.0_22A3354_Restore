@implementation FMNSXPCConnectionConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

+ (FMNSXPCConnectionConfiguration)fmipConfiguration
{
  FMNSXPCConnectionConfiguration *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = objc_alloc_init(FMNSXPCConnectionConfiguration);
  -[FMNSXPCConnectionConfiguration setServiceName:](v2, "setServiceName:", CFSTR("com.apple.icloud.findmydeviced"));
  -[FMNSXPCConnectionConfiguration setOptions:](v2, "setOptions:", 4096);
  -[FMNSXPCConnectionConfiguration setMachService:](v2, "setMachService:", 1);
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF9287A8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_getAccessoriesWithCompletion_, 1, 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_registerDeviceForPairingLock_completion_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_registerDeviceForPairingLock_completion_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_updatePairingLockInfo_completion_, 0, 0);

  -[FMNSXPCConnectionConfiguration setRemoteInterface:](v2, "setRemoteInterface:", v10);
  return v2;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (void)setRemoteInterface:(id)a3
{
  objc_storeStrong((id *)&self->_remoteInterface, a3);
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)setMachService:(BOOL)a3
{
  self->_machService = a3;
}

- (NSXPCInterface)remoteInterface
{
  return self->_remoteInterface;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)machService
{
  return self->_machService;
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

+ (FMNSXPCConnectionConfiguration)identityConfiguration
{
  FMNSXPCConnectionConfiguration *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = objc_alloc_init(FMNSXPCConnectionConfiguration);
  -[FMNSXPCConnectionConfiguration setServiceName:](v2, "setServiceName:", CFSTR("com.apple.icloud.FindMyDevice.FindMyDeviceIdentityXPCService"));
  -[FMNSXPCConnectionConfiguration setOptions:](v2, "setOptions:", 0);
  -[FMNSXPCConnectionConfiguration setMachService:](v2, "setMachService:", 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF9285C8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_baaIdentityAttestationForSigningRequest_completion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_baaIdentityAttestationForSigningRequest_completion_, 1, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_identityForPasscodeActivationUnlockWithContext_completion_, 0, 1);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_identityForPasscodeActivationUnlockWithContext_completion_, 1, 1);
  -[FMNSXPCConnectionConfiguration setRemoteInterface:](v2, "setRemoteInterface:", v3);

  return v2;
}

+ (FMNSXPCConnectionConfiguration)emergencyCallInfoPublisherConfiguration
{
  FMNSXPCConnectionConfiguration *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = objc_alloc_init(FMNSXPCConnectionConfiguration);
  -[FMNSXPCConnectionConfiguration setServiceName:](v2, "setServiceName:", CFSTR("com.apple.icloud.FindMyDevice.FindMyDeviceEmergencyCallInfoPublisherXPCService"));
  -[FMNSXPCConnectionConfiguration setOptions:](v2, "setOptions:", 0);
  -[FMNSXPCConnectionConfiguration setMachService:](v2, "setMachService:", 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF928628);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_publishInfo_completion_, 0, 0);
  -[FMNSXPCConnectionConfiguration setRemoteInterface:](v2, "setRemoteInterface:", v3);

  return v2;
}

+ (FMNSXPCConnectionConfiguration)userNotificationConfiguration
{
  FMNSXPCConnectionConfiguration *v2;
  void *v3;

  v2 = objc_alloc_init(FMNSXPCConnectionConfiguration);
  -[FMNSXPCConnectionConfiguration setServiceName:](v2, "setServiceName:", CFSTR("com.apple.icloud.FindMyDevice.FindMyDeviceUserNotificationsXPCService"));
  -[FMNSXPCConnectionConfiguration setOptions:](v2, "setOptions:", 0);
  -[FMNSXPCConnectionConfiguration setMachService:](v2, "setMachService:", 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF928688);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMNSXPCConnectionConfiguration setRemoteInterface:](v2, "setRemoteInterface:", v3);

  return v2;
}

+ (FMNSXPCConnectionConfiguration)btDiscoveryConfiguration
{
  FMNSXPCConnectionConfiguration *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(FMNSXPCConnectionConfiguration);
  -[FMNSXPCConnectionConfiguration setServiceName:](v2, "setServiceName:", CFSTR("com.apple.icloud.FindMyDevice.FindMyDeviceBTDiscoveryXPCService"));
  -[FMNSXPCConnectionConfiguration setOptions:](v2, "setOptions:", 0);
  -[FMNSXPCConnectionConfiguration setMachService:](v2, "setMachService:", 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF9286E8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMNSXPCConnectionConfiguration setRemoteInterface:](v2, "setRemoteInterface:", v3);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF928748);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMNSXPCConnectionConfiguration setExportedInterface:](v2, "setExportedInterface:", v4);

  return v2;
}

+ (FMNSXPCConnectionConfiguration)helperConfiguration
{
  FMNSXPCConnectionConfiguration *v2;
  void *v3;

  v2 = objc_alloc_init(FMNSXPCConnectionConfiguration);
  -[FMNSXPCConnectionConfiguration setOptions:](v2, "setOptions:", 0);
  -[FMNSXPCConnectionConfiguration setMachService:](v2, "setMachService:", 0);
  -[FMNSXPCConnectionConfiguration setServiceName:](v2, "setServiceName:", CFSTR("com.apple.icloud.FindMyDevice.FindMyDeviceHelperXPCService"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF928808);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMNSXPCConnectionConfiguration setRemoteInterface:](v2, "setRemoteInterface:", v3);

  return v2;
}

+ (FMNSXPCConnectionConfiguration)eraseDeviceServiceConfiguration
{
  FMNSXPCConnectionConfiguration *v2;
  void *v3;

  v2 = objc_alloc_init(FMNSXPCConnectionConfiguration);
  -[FMNSXPCConnectionConfiguration setServiceName:](v2, "setServiceName:", CFSTR("com.apple.icloud.FindMyDevice.FindMyDeviceEraseXPCService"));
  -[FMNSXPCConnectionConfiguration setOptions:](v2, "setOptions:", 0);
  -[FMNSXPCConnectionConfiguration setMachService:](v2, "setMachService:", 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF928868);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMNSXPCConnectionConfiguration setRemoteInterface:](v2, "setRemoteInterface:", v3);

  return v2;
}

- (void)setExportedInterface:(id)a3
{
  objc_storeStrong((id *)&self->_exportedInterface, a3);
}

@end
