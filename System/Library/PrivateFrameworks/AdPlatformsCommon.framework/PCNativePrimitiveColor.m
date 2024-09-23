@implementation PCNativePrimitiveColor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativePrimitiveColor)initWithRGBA:(int64_t)a3
{
  PCNativePrimitiveColor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PCNativePrimitiveColor;
  result = -[PCNativePrimitiveColor init](&v5, sel_init);
  if (result)
    result->_rawValue = a3;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  id v15;

  v15 = a3;
  v10 = objc_msgSend_rawValue(self, v4, v5, v6, v7, v8, v9);
  objc_msgSend_encodeInt32_forKey_(v15, v11, v10, (uint64_t)CFSTR("rawValue"), v12, v13, v14);

}

- (PCNativePrimitiveColor)initWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;

  v8 = (int)objc_msgSend_decodeInt32ForKey_(a3, a2, (uint64_t)CFSTR("rawValue"), v3, v4, v5, v6);
  return (PCNativePrimitiveColor *)MEMORY[0x24BEDD108](self, sel_initWithRGBA_, v8, v9, v10, v11, v12);
}

- (unsigned)red
{
  return BYTE3(self->_rawValue);
}

- (unsigned)green
{
  return BYTE2(self->_rawValue);
}

- (unsigned)blue
{
  return BYTE1(self->_rawValue);
}

- (unsigned)alpha
{
  return self->_rawValue;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

@end
