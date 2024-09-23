@implementation ULScanProviderMutableBool

- (ULScanProviderMutableBool)initWithBool:(BOOL)a3
{
  _BOOL8 v3;
  ULScanProviderMutableBool *v4;
  ULScanProviderMutableBool *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ULScanProviderMutableBool;
  v4 = -[ULScanProviderMutableBool init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[ULScanProviderMutableBool setBoolValue:](v4, "setBoolValue:", v3);
  return v5;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (void)setBoolValue:(BOOL)a3
{
  self->_BOOLValue = a3;
}

@end
