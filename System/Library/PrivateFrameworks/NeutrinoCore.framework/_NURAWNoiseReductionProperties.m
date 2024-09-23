@implementation _NURAWNoiseReductionProperties

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_NURAWNoiseReductionProperties luminance](self, "luminance");
  v6 = v5;
  -[_NURAWNoiseReductionProperties color](self, "color");
  v8 = v7;
  -[_NURAWNoiseReductionProperties sharpness](self, "sharpness");
  v10 = v9;
  -[_NURAWNoiseReductionProperties contrast](self, "contrast");
  v12 = v11;
  -[_NURAWNoiseReductionProperties detail](self, "detail");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> luminance=%f color=%f sharpness=%f contrast=%f detail=%f"), v4, self, v6, v8, v10, v12, v13);
}

- (double)luminance
{
  return self->_luminance;
}

- (void)setLuminance:(double)a3
{
  self->_luminance = a3;
}

- (double)color
{
  return self->_color;
}

- (void)setColor:(double)a3
{
  self->_color = a3;
}

- (double)sharpness
{
  return self->_sharpness;
}

- (void)setSharpness:(double)a3
{
  self->_sharpness = a3;
}

- (double)contrast
{
  return self->_contrast;
}

- (void)setContrast:(double)a3
{
  self->_contrast = a3;
}

- (double)detail
{
  return self->_detail;
}

- (void)setDetail:(double)a3
{
  self->_detail = a3;
}

@end
