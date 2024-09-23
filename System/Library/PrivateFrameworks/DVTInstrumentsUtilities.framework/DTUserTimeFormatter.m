@implementation DTUserTimeFormatter

+ (void)initialize
{
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    v3 = (void *)qword_25583C8A8;
    qword_25583C8A8 = (uint64_t)v2;

    objc_msgSend_positiveInfinitySymbol((void *)qword_25583C8A8, v4, v5, v6, v7);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v19, v8, v9, v10, v11) == 2)
    {
      objc_msgSend_substringFromIndex_(v19, v12, 1, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPositiveInfinitySymbol_((void *)qword_25583C8A8, v16, (uint64_t)v15, v17, v18);

    }
  }
}

+ (id)stringForNanoseconds:(unint64_t)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  char __str[128];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return CFSTR("0 s");
  if (a3 > 0x3E7)
  {
    if (a3 > 0xF423F)
    {
      if (a3 > 0x3B9AC9FF)
      {
        if (a3 > 0xDF84757FFLL)
          snprintf(__str, 0x80uLL, "%3.2f min");
        else
          snprintf(__str, 0x80uLL, "%3.2f s");
      }
      else
      {
        snprintf(__str, 0x80uLL, "%3.2f ms");
      }
    }
    else
    {
      snprintf(__str, 0x80uLL, "%3.2f µs");
    }
  }
  else
  {
    snprintf(__str, 0x80uLL, "%llu ns");
  }
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v3, (uint64_t)__str, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)stringForNanoseconds:(unint64_t)a3 highestResolutionTimeEnabled:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%llu ns"), a4, v4, a3);
  else
    objc_msgSend_stringForNanoseconds_(a1, a2, a3, a4, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)stringForObjectValue:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_retainAutorelease(v3);
    v13 = (const char *)objc_msgSend_objCType(v8, v9, v10, v11, v12);
    if (!strcmp(v13, "f") || !strcmp(v13, "d"))
    {
      objc_msgSend_doubleValue(v8, v14, v15, v16, v17);
      if (fabs(v18) == INFINITY)
      {
        v26 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_stringFromNumber_((void *)qword_25583C8A8, v14, (uint64_t)v8, v16, v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v26, v28, (uint64_t)CFSTR("%@ s"), v29, v30, v27);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
    }
    v19 = objc_msgSend_unsignedLongLongValue(v8, v14, v15, v16, v17);
    objc_msgSend_stringForNanoseconds_(DTUserTimeFormatter, v20, v19, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_description(v3, v4, v5, v6, v7);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v23;
LABEL_8:

  return v24;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_retainAutorelease(v4);
    v10 = (const char *)objc_msgSend_objCType(v5, v6, v7, v8, v9);
    if (!strcmp(v10, "f") || !strcmp(v10, "d"))
    {
      objc_msgSend_doubleValue(v5, v11, v12, v13, v14);
      if (fabs(v15) == INFINITY)
      {
        v23 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_stringFromNumber_((void *)qword_25583C8A8, v11, (uint64_t)v5, v13, v14);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v23, v25, (uint64_t)CFSTR("%@ s"), v26, v27, v24);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
    }
    v16 = objc_msgSend_unsignedLongLongValue(v5, v11, v12, v13, v14);
    objc_msgSend_stringForNanoseconds_(DTUserTimeFormatter, v17, v16, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)DTUserTimeFormatter;
    -[DTUserTimeFormatter stringForObjectValue:](&v28, sel_stringForObjectValue_, v4);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v20;
LABEL_8:

  return v21;
}

@end
