@implementation SUUISizeValue

- (SUUISizeValue)initWithSize:(CGSize)a3
{
  double height;
  double width;
  SUUISizeValue *result;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SUUISizeValue;
  result = -[SUUISizeValue init](&v6, sel_init);
  if (result)
  {
    result->_height = (uint64_t)height;
    result->_width = (uint64_t)width;
  }
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = (double)self->_width;
  height = (double)self->_height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)unionWithSize:(CGSize)a3
{
  float64x2_t v3;
  CGFloat width;

  v3 = vcvtq_f64_s64(*(int64x2_t *)&self->_height);
  width = a3.width;
  *(int64x2_t *)&self->_height = vcvtq_s64_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(*(float64x2_t *)&a3.height, v3), *(int8x16_t *)&a3.height, (int8x16_t)v3));
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  CGSize v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SUUISizeValue;
  -[SUUISizeValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISizeValue size](self, "size");
  NSStringFromCGSize(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  return self->_width;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v5 == objc_opt_class() && self->_width == v4[2] && self->_height == v4[1];

  return v6;
}

@end
