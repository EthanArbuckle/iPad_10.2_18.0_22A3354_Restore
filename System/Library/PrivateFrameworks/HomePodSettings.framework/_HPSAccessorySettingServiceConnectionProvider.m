@implementation _HPSAccessorySettingServiceConnectionProvider

- (NSXPCConnection)accessorySettingServiceConnection
{
  _HPSAccessorySettingServiceConnectionProvider *v2;
  NSXPCConnection *v3;
  NSXPCConnection *accessorySettingServiceConnection;
  uint64_t v5;
  NSXPCConnection *v6;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_accessorySettingServiceConnection;
  if (!v3)
  {
    accessorySettingServiceConnection = v2->_accessorySettingServiceConnection;
    if (!accessorySettingServiceConnection)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.homepodaccessorysettings.server"), 4096);
      v6 = v2->_accessorySettingServiceConnection;
      v2->_accessorySettingServiceConnection = (NSXPCConnection *)v5;

      accessorySettingServiceConnection = v2->_accessorySettingServiceConnection;
    }
    v3 = accessorySettingServiceConnection;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySettingServiceConnection, 0);
}

@end
