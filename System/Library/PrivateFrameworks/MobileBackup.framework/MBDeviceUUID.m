@implementation MBDeviceUUID

uint64_t __MBDeviceUUID_block_invoke()
{
  mach_port_t v0;
  mach_port_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  MBException *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;

  v0 = CryptoAcceleratorConnect();
  if (!v0)
  {
    v9 = [MBException alloc];
    v10 = CFSTR("Unable to connect to CryptoAcceleratorEncrypt");
    goto LABEL_11;
  }
  v1 = v0;
  v2 = CryptoBufferDuplicate("MobileBackup-ID!MobileBackup-ID!", 0x20uLL);
  if (v2)
  {
    v3 = v2;
    v4 = CryptoBufferAllocate(0x20uLL);
    if (v4)
    {
      v5 = v4;
      v6 = CryptoAcceleratorEncrypt(v1, (uint64_t)v3, (uint64_t)v4, 32);
      if (!(_DWORD)v6)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", v5, 20);
        _MBCachedBackupDeviceID = (uint64_t)MBStringWithData(v7);

        free(v5);
        free(v3);
        return CryptoAcceleratorDisconnect(v1);
      }
      v11 = v6;
      v9 = [MBException alloc];
      v12 = v11;
    }
    else
    {
      v9 = [MBException alloc];
      v12 = 0;
    }
    v10 = CFSTR("Unable to encrypt Backup device identifier: %u");
LABEL_11:
    objc_exception_throw(-[MBException initWithCode:format:](v9, "initWithCode:format:", 1, v10, v12));
  }
  return CryptoAcceleratorDisconnect(v1);
}

@end
