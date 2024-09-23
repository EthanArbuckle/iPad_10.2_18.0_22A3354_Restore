@implementation DTNanoTimestampFormatter

+ (id)stringForNanoseconds:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = CFSTR("--:--.--");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%02llu:%02llu.%03llu.%03llu"), v3, v4, a3 / 0xDF8475800, a3 / 0x3B9ACA00 - 60 * ((a3 / 0x3B9ACA00 * (unsigned __int128)0x444444444444445uLL) >> 64), (_QWORD)(a3 / 0xF4240 - 1000 * ((a3 / 0xF4240 * (unsigned __int128)0x4189374BC6A7F0uLL) >> 64)), (_QWORD)(a3 / 0x3E8 - 1000 * ((a3 / 0x3E8 * (unsigned __int128)0x4189374BC6A7F0uLL) >> 64)));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)stringForNanoseconds:(unint64_t)a3 highestResolutionTimeEnabled:(BOOL)a4
{
  uint64_t v4;
  _BOOL4 v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v5 = a4;
  objc_msgSend_stringForNanoseconds_(DTNanoTimestampFormatter, a2, a3, a4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (v5)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR(".%03llu"), v9, v10, a3 % 0x3E8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(v11, v13, (uint64_t)v12, v14, v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = v7;
  }

  return v16;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  objc_super v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend_unsignedLongLongValue(v4, v5, v6, v7, v8);

    objc_msgSend_stringForNanoseconds_(DTNanoTimestampFormatter, v10, v9, v11, v12);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)DTNanoTimestampFormatter;
    -[DTNanoTimestampFormatter stringForObjectValue:](&v15, sel_stringForObjectValue_, v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    return v14;
  }
}

@end
