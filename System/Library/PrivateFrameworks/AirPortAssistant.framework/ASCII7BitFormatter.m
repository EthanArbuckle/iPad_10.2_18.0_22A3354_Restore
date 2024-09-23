@implementation ASCII7BitFormatter

+ (id)ascii7BitFormatter:(unint64_t)a3
{
  ASCII7BitFormatter *v4;
  const char *v5;

  v4 = [ASCII7BitFormatter alloc];
  return (id)objc_msgSend_initWithMaxLength_(v4, v5, a3);
}

- (ASCII7BitFormatter)initWithMaxLength:(unint64_t)a3
{
  const char *v3;
  uint64_t v4;
  ASCII7BitFormatter *v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ASCII7BitFormatter;
  v5 = -[APFormatter initWithMaxLength:](&v13, sel_initWithMaxLength_, a3);
  if (v5)
  {
    v6 = (void *)objc_msgSend_ascii7BitSet(ASCII7BitFormatter, v3, v4);
    objc_msgSend_setCharacterSet_(v5, v7, (uint64_t)v6);
    v10 = objc_msgSend_invertedSet(v6, v8, v9);
    objc_msgSend_setInvertedCharacterSet_(v5, v11, v10);
  }
  return v5;
}

+ (id)ascii7BitSet
{
  id v2;
  const char *v3;

  v2 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend_addCharactersInRange_(v2, v3, 32, 95);
  return v2;
}

@end
