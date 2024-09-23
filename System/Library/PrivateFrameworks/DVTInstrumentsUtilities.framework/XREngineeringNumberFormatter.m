@implementation XREngineeringNumberFormatter

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_opt_new();
    v3 = (void *)qword_25583C890;
    qword_25583C890 = v2;

    objc_msgSend_systemLocale(MEMORY[0x24BDBCEA0], v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLocale_((void *)qword_25583C890, v9, (uint64_t)v8, v10, v11);

    objc_msgSend_setUsesGroupingSeparator_((void *)qword_25583C890, v12, 0, v13, v14);
  }
}

+ (id)CLIPSLiteralFormatter
{
  return (id)qword_25583C890;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  objc_super v17;
  uint64_t v18;

  v8 = a4;
  v18 = 0;
  if (objc_msgSend_xr_getLongLong_(v8, v9, (uint64_t)&v18, v10, v11))
  {
    if (a3)
    {
      objc_msgSend_numberWithLongLong_(MEMORY[0x24BDD16E0], v12, v18, v13, v14);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = 1;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)XREngineeringNumberFormatter;
    v15 = -[XREngineeringNumberFormatter getObjectValue:forString:errorDescription:](&v17, sel_getObjectValue_forString_errorDescription_, a3, v8, a5);
  }

  return v15;
}

@end
