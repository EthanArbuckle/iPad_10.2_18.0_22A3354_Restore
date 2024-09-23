@implementation CLPair

- (CLPair)initWithFirst:(int)a3 second:(int)a4
{
  CLPair *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLPair;
  result = -[CLPair init](&v7, sel_init);
  if (result)
  {
    result->_first = a3;
    result->_second = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLPair *v4;
  const char *v5;

  v4 = [CLPair alloc];
  return (id)objc_msgSend_initWithFirst_second_(v4, v5, self->_first, self->_second);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;

  v6 = objc_msgSend_first(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeInt_forKey_(a3, v7, v6, (uint64_t)CFSTR("first"));
  v11 = objc_msgSend_second(self, v8, v9, v10);
  objc_msgSend_encodeInt_forKey_(a3, v12, v11, (uint64_t)CFSTR("second"));
}

- (CLPair)initWithCoder:(id)a3
{
  CLPair *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;

  v4 = [CLPair alloc];
  v7 = objc_msgSend_decodeIntForKey_(a3, v5, (uint64_t)CFSTR("first"), v6);
  v10 = objc_msgSend_decodeIntForKey_(a3, v8, (uint64_t)CFSTR("second"), v9);
  return (CLPair *)objc_msgSend_initWithFirst_second_(v4, v11, v7, v10);
}

- (int)first
{
  return self->_first;
}

- (int)second
{
  return self->_second;
}

@end
