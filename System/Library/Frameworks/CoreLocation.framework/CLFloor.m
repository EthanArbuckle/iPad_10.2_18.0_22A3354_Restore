@implementation CLFloor

- (CLFloor)initWithLevel:(int64_t)a3
{
  CLFloor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLFloor;
  result = -[CLFloor init](&v5, sel_init);
  if (result)
    result->level = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  char v6;
  const char *v7;
  uint64_t *p_level;

  v6 = objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3);
  p_level = &self->level;
  if ((v6 & 1) != 0)
    objc_msgSend_encodeInteger_forKey_(a3, v7, *p_level, (uint64_t)CFSTR("kCLLocationCodingKeyFloor"));
  else
    objc_msgSend_encodeValueOfObjCType_at_(a3, v7, (uint64_t)"q", (uint64_t)p_level);
}

- (CLFloor)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CLFloor *v7;
  const char *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLFloor;
  v7 = -[CLFloor init](&v11, sel_init);
  if (v7)
  {
    if ((objc_msgSend_allowsKeyedCoding(a3, v4, v5, v6) & 1) != 0)
      v7->level = objc_msgSend_decodeIntegerForKey_(a3, v8, (uint64_t)CFSTR("kCLLocationCodingKeyFloor"), v9);
    else
      objc_msgSend_decodeValueOfObjCType_at_(a3, v8, (uint64_t)"q", (uint64_t)&v7->level);
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)objc_msgSend_initWithLevel_(v8, v9, self->level, v10);
}

- (NSInteger)level
{
  return self->level;
}

@end
