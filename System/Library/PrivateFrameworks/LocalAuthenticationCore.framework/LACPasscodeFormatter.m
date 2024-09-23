@implementation LACPasscodeFormatter

- (LACPasscodeFormatter)init
{
  LACPasscodeFormatter *v2;
  uint64_t v3;
  NSNumberFormatter *formatter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LACPasscodeFormatter;
  v2 = -[LACPasscodeFormatter init](&v6, sel_init);
  if (v2)
  {
    __28__LACPasscodeFormatter_init__block_invoke();
    v3 = objc_claimAutoreleasedReturnValue();
    formatter = v2->_formatter;
    v2->_formatter = (NSNumberFormatter *)v3;

  }
  return v2;
}

id __28__LACPasscodeFormatter_init__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setLocale:", v1);

  return v0;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_4);
  return (id)sharedInstance_sharedInstance_2;
}

void __38__LACPasscodeFormatter_sharedInstance__block_invoke()
{
  LACPasscodeFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(LACPasscodeFormatter);
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;

}

- (id)localizePasscode:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int16 v15;

  v6 = a3;
  v7 = v6;
  if (a4 == 3)
  {
    v8 = v6;
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    if (objc_msgSend(v7, "length"))
    {
      v10 = 0;
      while (1)
      {
        v15 = 0;
        v15 = objc_msgSend(v7, "characterAtIndex:", v10);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v15, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSNumberFormatter numberFromString:](self->_formatter, "numberFromString:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          break;
        v13 = v12;
        objc_msgSend(v9, "appendFormat:", CFSTR("%d"), objc_msgSend(v12, "intValue"));

        if (++v10 >= (unint64_t)objc_msgSend(v7, "length"))
          goto LABEL_7;
      }

      v8 = 0;
    }
    else
    {
LABEL_7:
      v8 = v9;
    }

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end
