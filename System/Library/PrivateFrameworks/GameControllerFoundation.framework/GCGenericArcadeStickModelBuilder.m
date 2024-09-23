@implementation GCGenericArcadeStickModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCGenericArcadeStickModelBuilder;
  -[GCGenericDeviceModelBuilder initializeWithModel:](&v3, sel_initializeWithModel_, a3);
}

- (id)build
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCGenericArcadeStickModelBuilder;
  -[GCGenericDeviceModelBuilder build](&v3, sel_build);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
