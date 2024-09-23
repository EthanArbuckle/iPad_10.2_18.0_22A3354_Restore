@implementation _MTLResource

- (_MTLResource)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTLResource;
  return -[_MTLAllocation initWithAllocationType:](&v3, sel_initWithAllocationType_, 1);
}

- (unint64_t)allocationID
{
  return 0;
}

- (int64_t)compressionType
{
  return -[_MTLResource compressionFootprint](self, "compressionFootprint") != 0;
}

- (unint64_t)compressionFootprint
{
  return 0;
}

- (unint64_t)colorSpaceConversionMatrix
{
  return 0;
}

@end
