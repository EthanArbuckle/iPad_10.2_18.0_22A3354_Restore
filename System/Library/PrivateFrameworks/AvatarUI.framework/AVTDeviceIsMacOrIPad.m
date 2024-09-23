@implementation AVTDeviceIsMacOrIPad

void __AVTDeviceIsMacOrIPad_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "userInterfaceIdiom") == 1)
  {
    AVTDeviceIsMacOrIPad_deviceIsMacOrIPad = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    AVTDeviceIsMacOrIPad_deviceIsMacOrIPad = objc_msgSend(v0, "userInterfaceIdiom") == 5;

  }
}

@end
