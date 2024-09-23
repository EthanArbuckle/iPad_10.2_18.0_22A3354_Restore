@implementation INCodableIntegerAttributeMetadata

- (void)updateWithDictionary:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INCodableIntegerAttributeMetadata;
  -[INCodableNumberAttributeMetadata updateWithDictionary:](&v4, sel_updateWithDictionary_, a3);
  if (-[INCodableNumberAttributeMetadata type](self, "type") == 2)
    -[INCodableNumberAttributeMetadata setType:](self, "setType:", 1);
}

@end
