@implementation MTLRasterizationRateSampleArrayInternal

- (MTLRasterizationRateSampleArrayInternal)initWithData:(float *)a3 numElements:(unint64_t)a4
{
  MTLRasterizationRateSampleArrayInternal *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLRasterizationRateSampleArrayInternal;
  result = -[MTLRasterizationRateSampleArrayInternal init](&v7, sel_init);
  if (result)
  {
    result->_data = a3;
    result->_count = a4;
  }
  return result;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  double v3;

  LODWORD(v3) = 0;
  if (self->_count > a3)
    *(float *)&v3 = self->_data[a3];
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  float v6;

  if (self->_count > a4)
  {
    objc_msgSend(a3, "floatValue");
    self->_data[a4] = v6;
  }
}

- (float)__getRawArray:(unint64_t *)a3
{
  *a3 = self->_count;
  return self->_data;
}

@end
