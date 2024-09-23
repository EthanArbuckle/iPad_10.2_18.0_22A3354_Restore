@implementation MIOMutableModel

- (MIOModelDescription)modelDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MIOMutableModel;
  -[MIOModel modelDescription](&v3, sel_modelDescription);
  return (MIOModelDescription *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setModelDescription:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MIOMutableModel;
  -[MIOModel setModelDescription:](&v3, sel_setModelDescription_, a3);
}

@end
