@implementation UARPSupportedAccessoryPencil

- (UARPSupportedAccessoryPencil)init
{
  UARPSupportedAccessoryPencil *v2;
  UARPSupportedAccessoryPencil *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UARPSupportedAccessoryPencil;
  v2 = -[UARPSupportedAccessoryHID init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("Apple Pencil"));
  return v3;
}

+ (unsigned)vendorID
{
  return 76;
}

@end
