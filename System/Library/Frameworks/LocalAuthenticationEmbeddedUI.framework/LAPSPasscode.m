@implementation LAPSPasscode

- (LAPSPasscode)initWithPasscode:(id)a3
{
  id v4;
  void *v5;
  LAPSPasscode *v6;

  v4 = a3;
  +[LAPSPasscodeType typeAllowingString:](LAPSPasscodeType, "typeAllowingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LAPSPasscode initWithPasscode:type:](self, "initWithPasscode:type:", v4, v5);

  return v6;
}

- (LAPSPasscode)initWithLocalizedPasscode:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  LAPSPasscode *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __47__LAPSPasscode_initWithLocalizedPasscode_type___block_invoke;
  v12[3] = &unk_24FDCD438;
  v13 = v6;
  v7 = v6;
  v8 = a4;
  __47__LAPSPasscode_initWithLocalizedPasscode_type___block_invoke((uint64_t)v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[LAPSPasscode initWithPasscode:type:](self, "initWithPasscode:type:", v9, v8);

  return v10;
}

id __47__LAPSPasscode_initWithLocalizedPasscode_type___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v20;

  +[LAPSPasscodeType typeAllowingString:](LAPSPasscodeType, "typeAllowingString:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[LAPSPasscodeType alphanumericType](LAPSPasscodeType, "alphanumericType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  v5 = *(id *)(a1 + 32);
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Numeric passcode contains non-numeric characters"), 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v20);
    }
    if (LAPSPasscodeLatinDigitsPasscodeFromLocalizedNumericPasscode_onceToken != -1)
      dispatch_once(&LAPSPasscodeLatinDigitsPasscodeFromLocalizedNumericPasscode_onceToken, &__block_literal_global_5);
    v7 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    if (objc_msgSend(v6, "length"))
    {
      v11 = 0;
      do
      {
        v12 = (void *)LAPSPasscodeLatinDigitsPasscodeFromLocalizedNumericPasscode_fmt;
        objc_msgSend(v6, "substringWithRange:", v11, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "numberFromString:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)LAPSPasscodeLatinDigitsPasscodeFromLocalizedNumericPasscode_fmt;
        objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setLocale:", v16);

        objc_msgSend((id)LAPSPasscodeLatinDigitsPasscodeFromLocalizedNumericPasscode_fmt, "stringFromNumber:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendString:", v17);

        ++v11;
      }
      while (v11 < objc_msgSend(v6, "length"));
    }
    v18 = objc_msgSend(v7, "length");
    if (v18 != objc_msgSend(v6, "length"))
      __47__LAPSPasscode_initWithLocalizedPasscode_type___block_invoke_cold_1();

  }
  return v7;
}

+ (id)emptyPasscode
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[LAPSPasscodeType noneType](LAPSPasscodeType, "noneType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithPasscode:type:", &stru_24FDCE800, v3);

  return v4;
}

- (LAPSPasscode)initWithPasscode:(id)a3 type:(id)a4
{
  __CFString *v6;
  id v7;
  LAPSPasscode *v8;
  LAPSPasscode *v9;
  __CFString *v10;
  id v12;
  objc_super v13;

  v6 = (__CFString *)a3;
  v7 = a4;
  if ((objc_msgSend(v7, "allowsString:", v6) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Passcode type %@, does not allow string"), v7);
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_claimAutoreleasedReturnValue(), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)LAPSPasscode;
  v8 = -[LAPSPasscode init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v6)
      v10 = v6;
    else
      v10 = &stru_24FDCE800;
    objc_storeStrong((id *)&v8->_passcode, v10);
    objc_storeStrong((id *)&v9->_type, a4);
  }

  return v9;
}

- (NSData)data
{
  return -[NSString dataUsingEncoding:](self->_passcode, "dataUsingEncoding:", 4);
}

- (id)externalizePasscode
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = objc_alloc_init(MEMORY[0x24BDDA938]);
  -[LAPSPasscode data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "setCredential:type:", v4, -9);

  if (v5)
    v6 = v3;
  else
    v6 = 0;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[LAPSPasscode passcode](self, "passcode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passcode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
    {
      -[LAPSPasscode type](self, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "type");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (LAPSPasscodeType)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
}

void __47__LAPSPasscode_initWithLocalizedPasscode_type___block_invoke_cold_1()
{
  __assert_rtn("LAPSPasscodeLatinDigitsPasscodeFromLocalizedNumericPasscode", "LAPSPasscode.m", 130, "[result length] == [numericPasscode length]");
}

@end
