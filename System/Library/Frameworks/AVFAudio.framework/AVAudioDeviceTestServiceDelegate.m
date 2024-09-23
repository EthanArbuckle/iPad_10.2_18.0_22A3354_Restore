@implementation AVAudioDeviceTestServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a4;
  objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.avfaudio.devicetest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE408398);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExportedInterface:", v7);

    v8 = (void *)objc_opt_new();
    objc_msgSend(v4, "setExportedObject:", v8);
    objc_msgSend(v4, "resume");

  }
  else
  {
    objc_msgSend(v4, "invalidate");
  }

  return v6;
}

@end
