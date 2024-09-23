@implementation AVVCDuckLevel

- (AVVCDuckLevel)init
{
  AVVCDuckLevel *v2;
  AVVCDuckLevel *v3;
  NSNumber *value;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVVCDuckLevel;
  v2 = -[AVVCDuckLevel init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    value = v2->_value;
    v2->_value = 0;

    v3->_isBlur = 0;
  }
  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<duckToLevel(%@), isBlur(%d)>"), self->_value, self->_isBlur);
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (BOOL)isBlur
{
  return self->_isBlur;
}

- (void)setIsBlur:(BOOL)a3
{
  self->_isBlur = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
