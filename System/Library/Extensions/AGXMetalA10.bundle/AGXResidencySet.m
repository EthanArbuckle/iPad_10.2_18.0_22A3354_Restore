@implementation AGXResidencySet

- (AGXResidencySet)initWithDevice:(id)a3 descriptor:(id)a4
{
  objc_super v8;
  _OWORD v9[6];
  uint64_t v10;

  v10 = 0;
  memset(v9, 0, sizeof(v9));
  bzero(v9, 0x68uLL);
  v8.receiver = self;
  v8.super_class = (Class)AGXResidencySet;
  return -[IOGPUMetalResidencySet initWithDevice:descriptor:args:argsSize:](&v8, sel_initWithDevice_descriptor_args_argsSize_, a3, a4, v9, 104);
}

@end
