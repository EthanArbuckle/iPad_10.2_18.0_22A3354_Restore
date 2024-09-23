@implementation AKAuthorizationBiometricImage

+ (id)biometricImage
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  _QWORD *v6;

  objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFaceIDCapable");

  objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "usesTouchID");

  if (v5)
    v6 = (_QWORD *)MEMORY[0x1E0D000D8];
  else
    v6 = (_QWORD *)MEMORY[0x1E0D000D0];
  if (v3)
    v6 = (_QWORD *)MEMORY[0x1E0D000C8];
  objc_msgSend(MEMORY[0x1E0CEA638], "ak_imageNamed:", *v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
