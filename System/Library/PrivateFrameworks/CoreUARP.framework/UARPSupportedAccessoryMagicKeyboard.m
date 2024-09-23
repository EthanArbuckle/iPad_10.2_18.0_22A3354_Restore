@implementation UARPSupportedAccessoryMagicKeyboard

- (UARPSupportedAccessoryMagicKeyboard)init
{
  UARPSupportedAccessoryMagicKeyboard *v2;
  UARPSupportedAccessoryMagicKeyboard *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UARPSupportedAccessoryMagicKeyboard;
  v2 = -[UARPSupportedAccessoryHID init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UARPSupportedAccessory setUploaderResponseTimeout:](v2, "setUploaderResponseTimeout:", 5000);
  return v3;
}

@end
