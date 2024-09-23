@implementation AGXA10Device

- (AGXA10Device)initWithAcceleratorPort:(unsigned int)a3
{
  AGXA10Device *v3;
  AGXA10Device *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AGXA10Device;
  v3 = -[AGXA10FamilyDevice initWithAcceleratorPort:simultaneousInstances:](&v6, sel_initWithAcceleratorPort_simultaneousInstances_, *(_QWORD *)&a3, 1024);
  v4 = v3;
  if (v3 && !-[AGXA10FamilyDevice setupCompiler:](v3, "setupCompiler:", 65542))
  {

    return 0;
  }
  return v4;
}

@end
