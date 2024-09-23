@implementation LAPSPasscodeType

- (LAPSPasscodeType)initWithIdentifier:(int64_t)a3 length:(unint64_t)a4
{
  LAPSPasscodeType *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LAPSPasscodeType;
  result = -[LAPSPasscodeType init](&v7, sel_init);
  if (result)
  {
    result->_identifier = a3;
    result->_length = a4;
  }
  return result;
}

+ (id)typeAllowingString:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v3 = a3;
  +[LAPSPasscodeType numericFourDigitsType](LAPSPasscodeType, "numericFourDigitsType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsString:", v3);

  if (v5)
  {
    +[LAPSPasscodeType numericFourDigitsType](LAPSPasscodeType, "numericFourDigitsType");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[LAPSPasscodeType numericSixDigitsType](LAPSPasscodeType, "numericSixDigitsType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "allowsString:", v3);

    if (v8)
    {
      +[LAPSPasscodeType numericSixDigitsType](LAPSPasscodeType, "numericSixDigitsType");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[LAPSPasscodeType numericCustomDigitsType](LAPSPasscodeType, "numericCustomDigitsType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "allowsString:", v3);

      if (v10)
      {
        +[LAPSPasscodeType numericCustomDigitsType](LAPSPasscodeType, "numericCustomDigitsType");
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[LAPSPasscodeType alphanumericType](LAPSPasscodeType, "alphanumericType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "allowsString:", v3);

        if (v12)
        {
          +[LAPSPasscodeType alphanumericType](LAPSPasscodeType, "alphanumericType");
          v6 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[LAPSPasscodeType noneType](LAPSPasscodeType, "noneType");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "allowsString:", v3) & 1) == 0)
            +[LAPSPasscodeType typeAllowingString:].cold.1();

          +[LAPSPasscodeType noneType](LAPSPasscodeType, "noneType");
          v6 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  v14 = (void *)v6;

  return v14;
}

+ (id)noneType
{
  return -[LAPSPasscodeType initWithIdentifier:length:]([LAPSPasscodeType alloc], "initWithIdentifier:length:", 0, 0);
}

+ (id)numericFourDigitsType
{
  return -[LAPSPasscodeType initWithIdentifier:length:]([LAPSPasscodeType alloc], "initWithIdentifier:length:", 1, 4);
}

+ (id)numericSixDigitsType
{
  return -[LAPSPasscodeType initWithIdentifier:length:]([LAPSPasscodeType alloc], "initWithIdentifier:length:", 2, 6);
}

+ (id)numericCustomDigitsType
{
  return -[LAPSPasscodeType initWithIdentifier:length:]([LAPSPasscodeType alloc], "initWithIdentifier:length:", 3, -1);
}

+ (id)alphanumericType
{
  return -[LAPSPasscodeType initWithIdentifier:length:]([LAPSPasscodeType alloc], "initWithIdentifier:length:", 4, -1);
}

- (int64_t)complexityRating
{
  if ((unint64_t)(self->_identifier - 1) >= 4)
    return -1;
  else
    return self->_identifier - 1;
}

- (BOOL)allowsLength:(int64_t)a3
{
  if (-[LAPSPasscodeType hasFixedLength](self, "hasFixedLength"))
    return -[LAPSPasscodeType length](self, "length") == a3;
  else
    return a3 > 0;
}

- (BOOL)allowsString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  _QWORD v9[5];

  v4 = a3;
  if (v4)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __33__LAPSPasscodeType_allowsString___block_invoke;
    v9[3] = &unk_24FDCE110;
    v9[4] = self;
    __33__LAPSPasscodeType_allowsString___block_invoke((uint64_t)v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")) != 0x7FFFFFFFFFFFFFFFLL
      && v6 == objc_msgSend(v4, "length");

  }
  else
  {
    v7 = -[LAPSPasscodeType identifier](self, "identifier") == 0;
  }

  return v7;
}

id __33__LAPSPasscodeType_allowsString___block_invoke(uint64_t a1)
{
  unint64_t v1;
  const __CFString *v2;
  void *v3;
  id v5;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v1 > 4)
    v2 = CFSTR("^\\d{4}$");
  else
    v2 = off_24FDCE130[v1];
  v5 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v2, 1, &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    __33__LAPSPasscodeType_allowsString___block_invoke_cold_1();
  return v3;
}

- (id)localizedName
{
  switch(self->_identifier)
  {
    case 0:
      +[LALocalizedString passcodeTypeNone](LALocalizedString, "passcodeTypeNone");
      self = (LAPSPasscodeType *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      +[LALocalizedString passcodeTypeNumericFourDigits](LALocalizedString, "passcodeTypeNumericFourDigits");
      self = (LAPSPasscodeType *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      +[LALocalizedString passcodeTypeNumericSixDigits](LALocalizedString, "passcodeTypeNumericSixDigits");
      self = (LAPSPasscodeType *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      +[LALocalizedString passcodeTypeNumericCustomDigits](LALocalizedString, "passcodeTypeNumericCustomDigits");
      self = (LAPSPasscodeType *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      +[LALocalizedString passcodeTypeAlphanumeric](LALocalizedString, "passcodeTypeAlphanumeric");
      self = (LAPSPasscodeType *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return self;
  }
  return self;
}

- (BOOL)hasFixedLength
{
  return -[LAPSPasscodeType length](self, "length") != -1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[LAPSPasscodeType initWithIdentifier:length:]([LAPSPasscodeType alloc], "initWithIdentifier:length:", -[LAPSPasscodeType identifier](self, "identifier"), -[LAPSPasscodeType length](self, "length"));
}

- (unint64_t)hash
{
  int64_t v3;

  v3 = -[LAPSPasscodeType identifier](self, "identifier");
  return -[LAPSPasscodeType length](self, "length") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "identifier");
    if (v6 == -[LAPSPasscodeType identifier](self, "identifier"))
    {
      v7 = objc_msgSend(v5, "length");
      v8 = v7 == -[LAPSPasscodeType length](self, "length");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  unint64_t v2;

  v2 = -[LAPSPasscodeType identifier](self, "identifier");
  if (v2 > 4)
    return CFSTR("LAPSPasscodeTypeIdentifierUnknown");
  else
    return off_24FDCE158[v2];
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (unint64_t)length
{
  return self->_length;
}

+ (void)typeAllowingString:.cold.1()
{
  __assert_rtn("+[LAPSPasscodeType typeAllowingString:]", "LAPSPasscodeType.m", 66, "[[LAPSPasscodeType noneType] allowsString:string]");
}

void __33__LAPSPasscodeType_allowsString___block_invoke_cold_1()
{
  __assert_rtn("-[LAPSPasscodeType allowsString:]_block_invoke", "LAPSPasscodeType.m", 141, "error == nil");
}

@end
