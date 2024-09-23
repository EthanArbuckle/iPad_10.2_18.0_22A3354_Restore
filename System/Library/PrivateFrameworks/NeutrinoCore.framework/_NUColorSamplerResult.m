@implementation _NUColorSamplerResult

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)_NUColorSamplerResult;
  -[_NUColorSamplerResult dealloc](&v3, sel_dealloc);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)point
{
  int64_t v2;
  int64_t v3;
  _QWORD v4[2];
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  objc_copyStruct(v4, &self->_point, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setPoint:(id)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3;

  v3 = a3;
  objc_copyStruct(&self->_point, &v3, 16, 1, 0);
}

- (CGColor)color
{
  return self->_color;
}

- (void)setColor:(CGColor *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
