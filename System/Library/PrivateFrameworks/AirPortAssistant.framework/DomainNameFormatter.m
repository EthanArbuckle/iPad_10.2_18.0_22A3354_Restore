@implementation DomainNameFormatter

+ (id)domainNameFormatter:(unint64_t)a3
{
  DomainNameFormatter *v3;
  const char *v4;

  v3 = [DomainNameFormatter alloc];
  return (id)objc_msgSend_initWithMaxLength_(v3, v4, 0);
}

- (DomainNameFormatter)initWithMaxLength:(unint64_t)a3
{
  const char *v3;
  uint64_t v4;
  DomainNameFormatter *v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DomainNameFormatter;
  v5 = -[APFormatter initWithMaxLength:](&v13, sel_initWithMaxLength_, a3);
  if (v5)
  {
    v6 = (void *)objc_msgSend_domainNameSet(DomainNameFormatter, v3, v4);
    objc_msgSend_setCharacterSet_(v5, v7, (uint64_t)v6);
    v10 = objc_msgSend_invertedSet(v6, v8, v9);
    objc_msgSend_setInvertedCharacterSet_(v5, v11, v10);
  }
  return v5;
}

+ (id)domainNameSet
{
  id v2;
  const char *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;

  v2 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend_addCharactersInString_(v2, v3, (uint64_t)CFSTR(".:-*/"));
  objc_msgSend_addCharactersInString_(v2, v4, (uint64_t)CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"));
  v7 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x24BDD14A8], v5, v6);
  objc_msgSend_formUnionWithCharacterSet_(v2, v8, v7);
  return v2;
}

@end
