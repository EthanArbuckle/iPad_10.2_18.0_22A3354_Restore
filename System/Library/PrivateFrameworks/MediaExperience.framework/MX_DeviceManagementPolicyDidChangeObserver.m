@implementation MX_DeviceManagementPolicyDidChangeObserver

- (void)deviceManagementPolicyDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = MXGetSerialQueue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__MX_DeviceManagementPolicyDidChangeObserver_deviceManagementPolicyDidChange___block_invoke;
  v6[3] = &unk_1E3099900;
  v6[4] = a3;
  MXDispatchAsync((uint64_t)"-[MX_DeviceManagementPolicyDidChangeObserver deviceManagementPolicyDidChange:]", (uint64_t)"MX_CoreServices.m", 258, 0, 0, v5, (uint64_t)v6);
}

@end
