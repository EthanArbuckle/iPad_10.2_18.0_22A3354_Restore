@implementation _EXExtensionProcess(MTSDeviceSetupExtensionProcess)

- (MTSXPCConnection)makeMTSXPCConnectionWithError:()MTSDeviceSetupExtensionProcess
{
  void *v1;
  MTSXPCConnection *v2;

  objc_msgSend(a1, "makeXPCConnectionWithError:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = -[MTSXPCConnection initWithXPCConnection:]([MTSXPCConnection alloc], "initWithXPCConnection:", v1);
  else
    v2 = 0;

  return v2;
}

@end
