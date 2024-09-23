@implementation AVMetadataMachineReadableCodeObjectInternal

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetadataMachineReadableCodeObjectInternal;
  -[AVMetadataMachineReadableCodeObjectInternal dealloc](&v3, sel_dealloc);
}

- (NSArray)corners
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCorners:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)basicDescriptor
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBasicDescriptor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)decoded
{
  return self->decoded;
}

- (void)setDecoded:(BOOL)a3
{
  self->decoded = a3;
}

- (CIBarcodeDescriptor)descriptor
{
  return (CIBarcodeDescriptor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDescriptor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

@end
