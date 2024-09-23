@implementation UTF8Formatter

+ (id)utf8Formatter
{
  UTF8Formatter *v2;
  const char *v3;

  v2 = [UTF8Formatter alloc];
  return (id)objc_msgSend_initWithMaxByteCount_maxLength_(v2, v3, 0, 0);
}

+ (id)utf8Formatter:(unint64_t)a3
{
  UTF8Formatter *v4;
  const char *v5;

  v4 = [UTF8Formatter alloc];
  return (id)objc_msgSend_initWithMaxByteCount_maxLength_(v4, v5, a3, a3);
}

+ (id)utf8FormatterWithMaxByteCount:(unint64_t)a3 maxLength:(unint64_t)a4
{
  UTF8Formatter *v6;
  const char *v7;

  v6 = [UTF8Formatter alloc];
  return (id)objc_msgSend_initWithMaxByteCount_maxLength_(v6, v7, a3, a4);
}

+ (id)afpFormatter:(unint64_t)a3
{
  UTF8Formatter *v4;
  const char *v5;

  v4 = [UTF8Formatter alloc];
  return (id)objc_msgSend_initAFPFormatterWithLength_(v4, v5, a3);
}

- (id)initAFPFormatterWithLength:(unint64_t)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;

  v6 = (void *)objc_msgSend_initWithMaxLength_(self, a2, a3);
  if (v6)
  {
    v7 = (void *)objc_msgSend_afpSet(UTF8Formatter, v4, v5);
    objc_msgSend_setMaxByteCount_(v6, v8, a3);
    v11 = objc_msgSend_invertedSet(v7, v9, v10);
    objc_msgSend_setInvertedCharacterSet_(v6, v12, v11);
    objc_msgSend_setCharacterSet_(v6, v13, (uint64_t)v7);
  }
  return v6;
}

- (UTF8Formatter)initWithMaxByteCount:(unint64_t)a3 maxLength:(unint64_t)a4
{
  UTF8Formatter *v5;
  const char *v6;
  UTF8Formatter *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;

  v5 = (UTF8Formatter *)objc_msgSend_initWithMaxLength_(self, a2, a4);
  v7 = v5;
  if (v5)
  {
    objc_msgSend_setMaxByteCount_(v5, v6, a3);
    v10 = objc_msgSend_controlCharacterSet(MEMORY[0x24BDD14A8], v8, v9);
    objc_msgSend_setInvertedCharacterSet_(v7, v11, v10);
    v14 = (void *)objc_msgSend_invertedCharacterSet(v7, v12, v13);
    v17 = objc_msgSend_invertedSet(v14, v15, v16);
    objc_msgSend_setCharacterSet_(v7, v18, v17);
  }
  return v7;
}

- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5
{
  _BOOL4 v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  unint64_t v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)UTF8Formatter;
  v9 = -[APFormatter isPartialStringValid:newEditingString:errorDescription:](&v20, sel_isPartialStringValid_newEditingString_errorDescription_);
  if (v9)
  {
    if (objc_msgSend_length(a3, v10, v11))
    {
      v14 = objc_msgSend_maxByteCount(self, v12, v13);
      v18 = objc_msgSend_UTF8ByteCount(a3, v15, v16);
      LOBYTE(v9) = 1;
      if (v14 && v18 > v14)
      {
        if (a4)
          *a4 = (id)objc_msgSend_prefixStringWithByteCount_(a3, v17, v14);
        LOBYTE(v9) = 0;
        if (a5)
          *a5 = CFSTR("gErC");
      }
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

- (void)setMaxByteCount:(unint64_t)a3
{
  self->_maxByteCount = a3;
}

- (unint64_t)maxByteCount
{
  return self->_maxByteCount;
}

+ (id)afpSet
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;

  v2 = objc_alloc_init(MEMORY[0x24BDD1690]);
  v5 = objc_msgSend_controlCharacterSet(MEMORY[0x24BDD14A8], v3, v4);
  objc_msgSend_formUnionWithCharacterSet_(v2, v6, v5);
  objc_msgSend_invert(v2, v7, v8);
  objc_msgSend_removeCharactersInRange_(v2, v9, 58, 1);
  objc_msgSend_removeCharactersInRange_(v2, v10, 47, 1);
  return v2;
}

@end
