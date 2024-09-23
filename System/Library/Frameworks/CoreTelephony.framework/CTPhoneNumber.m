@implementation CTPhoneNumber

+ (CTPhoneNumber)phoneNumberWithDigits:(id)a3 countryCode:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDigits:digits:countryCode:", 1, v7, v6);

  return (CTPhoneNumber *)v8;
}

+ (CTPhoneNumber)phoneNumberWithDigits:(int64_t)a3 digits:(id)a4 countryCode:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDigits:digits:countryCode:", a3, v9, v8);

  return (CTPhoneNumber *)v10;
}

- (int64_t)numberOfDigitsForShortCodeNumber
{
  return -[CTPhoneNumber numberOfDigitsForShortCodeNumber:](self, "numberOfDigitsForShortCodeNumber:", 1);
}

- (int64_t)numberOfDigitsForShortCodeNumber:(int64_t)a3
{
  CoreTelephonyClient *v4;
  CTBundle *v5;
  CTXPCServiceSubscriptionContext *v6;
  id v7;
  void *v8;
  BOOL v9;
  int64_t v10;
  uint64_t v12;

  v4 = -[CoreTelephonyClient initWithQueue:]([CoreTelephonyClient alloc], "initWithQueue:", 0);
  v5 = -[CTBundle initWithBundleType:]([CTBundle alloc], "initWithBundleType:", 1);
  v6 = -[CTXPCServiceSubscriptionContext initWithSlot:]([CTXPCServiceSubscriptionContext alloc], "initWithSlot:", a3);
  v12 = 0;
  v7 = -[CoreTelephonyClient copyCarrierBundleValue:keyHierarchy:bundleType:error:](v4, "copyCarrierBundleValue:keyHierarchy:bundleType:error:", v6, &unk_1E1587060, v5, &v12);
  v8 = v7;
  if (v7)
    v9 = v12 == 0;
  else
    v9 = 0;
  if (v9)
    v10 = objc_msgSend(v7, "integerValue");
  else
    v10 = 6;

  return v10;
}

- (CTPhoneNumber)initWithDigits:(int64_t)a3 digits:(id)a4 countryCode:(id)a5
{
  id v8;
  id v9;
  CTPhoneNumber *v10;
  unint64_t v11;
  _WORD *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v18;
  NSString *digits;
  uint64_t v20;
  NSString *countryCode;
  uint64_t v22;
  BOOL v23;
  objc_super v25;

  v8 = a4;
  v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CTPhoneNumber;
  v10 = -[CTPhoneNumber init](&v25, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "length");
    v12 = malloc_type_malloc(2 * v11 + 2, 0x1000040BDFB0063uLL);
    if (v11)
    {
      v13 = 0;
      v14 = 0;
      v15 = 1;
      do
      {
        v16 = objc_msgSend(v8, "characterAtIndex:", v13);
        if (+[CTPhoneNumber isValidPhoneNumberChar:](CTPhoneNumber, "isValidPhoneNumberChar:", v16))
          v12[v14++] = v16;
        v13 = v15;
      }
      while (v11 > v15++);
    }
    else
    {
      v14 = 0;
    }
    v12[v14] = 0;
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v12, v14);
    digits = v10->_digits;
    v10->_digits = (NSString *)v18;

    free(v12);
    v20 = objc_msgSend(v9, "copy");
    countryCode = v10->_countryCode;
    v10->_countryCode = (NSString *)v20;

    v22 = -[CTPhoneNumber numberOfDigitsForShortCodeNumber:](v10, "numberOfDigitsForShortCodeNumber:", a3);
    v23 = v22 >= 1 && objc_msgSend(v8, "length") <= v22;
    v10->_isShortCode = v23;
    v10->_slot = a3;
  }

  return v10;
}

- (CTPhoneNumber)initWithDigits:(id)a3 countryCode:(id)a4
{
  return -[CTPhoneNumber initWithDigits:digits:countryCode:](self, "initWithDigits:digits:countryCode:", 1, a3, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTPhoneNumber *v4;

  v4 = -[CTPhoneNumber initWithDigits:digits:countryCode:](+[CTPhoneNumber allocWithZone:](CTPhoneNumber, "allocWithZone:", a3), "initWithDigits:digits:countryCode:", self->_slot, self->_digits, self->_countryCode);
  -[CTPhoneNumber setIsShortCode:](v4, "setIsShortCode:", self->_isShortCode);
  return v4;
}

- (id)formatForCallingCountry:(id)a3
{
  NSString *v4;

  if (-[NSString compare:](self->_countryCode, "compare:", a3))
  {
    v4 = self->_digits;
  }
  else
  {
    -[CTPhoneNumber canonicalFormat](self, "canonicalFormat");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)canonicalFormat
{
  return self->_digits;
}

- (id)encodedString
{
  _BOOL4 isShortCode;
  void *v3;
  void *v4;
  uint64_t v5;

  isShortCode = self->_isShortCode;
  -[CTPhoneNumber canonicalFormat](self, "canonicalFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!isShortCode)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("/TYPE=PLMN"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

+ (BOOL)isValidPhoneNumberChar:(unsigned __int16)a3
{
  int v3;
  int v4;

  v3 = a3;
  if (a3 > 0x7Fu)
    v4 = __maskrune(a3, 0x500uLL);
  else
    v4 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * a3 + 60) & 0x500;
  return v3 == 35 || v4 != 0 || (v3 & 0xFFFE) == 42;
}

+ (BOOL)isValidPhoneNumber:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  BOOL v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    v5 = v4;
    if (+[CTPhoneNumber isValidPhoneNumberChar:](CTPhoneNumber, "isValidPhoneNumberChar:", objc_msgSend(v3, "characterAtIndex:", 0)))
    {
      v6 = 1;
      do
      {
        v7 = v6;
        if (v5 == v6)
          break;
        v8 = +[CTPhoneNumber isValidPhoneNumberChar:](CTPhoneNumber, "isValidPhoneNumberChar:", objc_msgSend(v3, "characterAtIndex:", v6));
        v6 = v7 + 1;
      }
      while (v8);
      v9 = v7 >= v5;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (NSString)digits
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)countryCode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isShortCode
{
  return self->_isShortCode;
}

- (void)setIsShortCode:(BOOL)a3
{
  self->_isShortCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_digits, 0);
}

@end
