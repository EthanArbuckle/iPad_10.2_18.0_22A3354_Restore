@implementation FMKeyFrame

- (FMKeyFrame)initWithValue:(float)a3 atTime:(int64_t)a4
{
  FMKeyFrame *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMKeyFrame;
  result = -[FMKeyFrame init](&v7, sel_init);
  if (result)
  {
    result->_value = a3;
    result->_sampleTime = a4;
  }
  return result;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = objc_msgSend_sampleTime(self, a2, v2, v3, v4);
  objc_msgSend_value(self, v8, v9, v10, v11);
  return (id)objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)CFSTR("t = %d value = %f"), v14, v15, v7, v12);
}

- (int64_t)sampleTime
{
  return self->_sampleTime;
}

- (void)setSampleTime:(int64_t)a3
{
  self->_sampleTime = a3;
}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)a3
{
  self->_value = a3;
}

@end
