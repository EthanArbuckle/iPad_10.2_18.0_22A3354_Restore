@implementation MLModelStructureProgramValue

- (MLModelStructureProgramValue)initWithMILValue:(const IRValue *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MLModelStructureProgramValue;
  return -[MLModelStructureProgramValue init](&v4, sel_init, a3);
}

@end
