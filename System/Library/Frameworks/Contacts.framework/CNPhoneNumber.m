@implementation CNPhoneNumber

+ (CNPhoneNumber)phoneNumberWithCopiedStringValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "primitiveInitWithStringValue:countryCode:", v4, 0);

  return (CNPhoneNumber *)v5;
}

- (id)primitiveInitWithStringValue:(id)a3 countryCode:(id)a4
{
  id v6;
  id v7;
  CNPhoneNumber *v8;
  NSString *v9;
  NSString *stringValue;
  CNPhoneNumber *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (v6
    && (v13.receiver = self,
        v13.super_class = (Class)CNPhoneNumber,
        v8 = -[CNPhoneNumber init](&v13, sel_init),
        (self = v8) != 0))
  {
    v8->_stateLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_initialCountryCode, a4);
    objc_msgSend(v6, "_cn_stringBySanitizingPhoneNumber");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    stringValue = self->_stringValue;
    self->_stringValue = v9;

    self = self;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)formattedStringValue
{
  return (NSString *)-[CNPhoneNumber stringValueWithCFPhoneNumberOptions:](self, "stringValueWithCFPhoneNumberOptions:", 5);
}

- (void)dealloc
{
  __CFPhoneNumber *phoneNumberRef;
  objc_super v4;

  phoneNumberRef = self->_phoneNumberRef;
  if (phoneNumberRef)
    CFRelease(phoneNumberRef);
  v4.receiver = self;
  v4.super_class = (Class)CNPhoneNumber;
  -[CNPhoneNumber dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_initialCountryCode, 0);
}

+ (CNPhoneNumber)phoneNumberWithDigits:(id)a3 countryCode:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStringValue:countryCode:", v7, v6);

  return (CNPhoneNumber *)v8;
}

- (CNPhoneNumber)initWithStringValue:(id)a3 countryCode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  CNPhoneNumber *v9;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  v8 = (void *)objc_msgSend(v6, "copy");

  v9 = -[CNPhoneNumber primitiveInitWithStringValue:countryCode:](self, "primitiveInitWithStringValue:countryCode:", v7, v8);
  return v9;
}

- (BOOL)isLikePhoneNumberForSamePerson:(id)a3
{
  _QWORD *v4;
  NSString *stringValue;
  void *v6;
  int v7;
  BOOL v8;

  v4 = a3;
  stringValue = self->_stringValue;
  if (!stringValue
    || (v6 = (void *)v4[2]) == 0
    || (v7 = comparePhoneNumberStrings(stringValue, v6), v8 = v7 == 0, v7 == 2))
  {
    v8 = -[CNPhoneNumber isLikePhoneNumber:](self, "isLikePhoneNumber:", v4);
  }

  return v8;
}

- (NSString)digits
{
  return (NSString *)-[CNPhoneNumber stringValueWithCFPhoneNumberOptions:](self, "stringValueWithCFPhoneNumberOptions:", 0);
}

+ (id)StringValue
{
  return &__block_literal_global_348;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNPhoneNumber stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("stringValue"));

  -[CNPhoneNumber initialCountryCode](self, "initialCountryCode");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("countryCode"));

}

- (NSString)countryCode
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CNPhoneNumber _countryCodeFromPhoneNumberRef](self, "_countryCodeFromPhoneNumberRef");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[CNPhoneNumber initialCountryCode](self, "initialCountryCode");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (id)_countryCodeFromPhoneNumberRef
{
  __CFPhoneNumber *v3;

  v3 = -[CNPhoneNumber phoneNumberRef](self, "phoneNumberRef");
  if (v3)
  {
    -[CNPhoneNumber phoneNumberRef](self, "phoneNumberRef");
    v3 = (__CFPhoneNumber *)CFPhoneNumberCopyISOCountryCode();
  }
  return v3;
}

- (id)stringValueWithCFPhoneNumberOptions:(unint64_t)a3
{
  void *String;

  if (!-[CNPhoneNumber phoneNumberRef](self, "phoneNumberRef")
    || (os_unfair_lock_lock(&self->_stateLock),
        String = (void *)CFPhoneNumberCreateString(),
        os_unfair_lock_unlock(&self->_stateLock),
        !String))
  {
    -[CNPhoneNumber stringValue](self, "stringValue");
    String = (void *)objc_claimAutoreleasedReturnValue();
  }
  return String;
}

- (__CFPhoneNumber)phoneNumberRef
{
  os_unfair_lock_s *p_stateLock;
  __CFPhoneNumber *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = -[CNPhoneNumber nts_lazyPhoneNumberRef](self, "nts_lazyPhoneNumberRef");
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (__CFPhoneNumber)nts_lazyPhoneNumberRef
{
  __CFPhoneNumber *result;
  void *v4;
  void *v5;
  void *v6;

  result = self->_phoneNumberRef;
  if (!result)
  {
    v4 = (void *)objc_opt_class();
    -[CNPhoneNumber stringValue](self, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhoneNumber initialCountryCode](self, "initialCountryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_phoneNumberRef = (__CFPhoneNumber *)objc_msgSend(v4, "createCFPhoneNumberForStringValue:countryCode:", v5, v6);

    return self->_phoneNumberRef;
  }
  return result;
}

+ (__CFPhoneNumber)createCFPhoneNumberForStringValue:(id)a3 countryCode:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFPhoneNumber *v9;

  v5 = a4;
  objc_msgSend(a3, "_cn_take:", 100);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {
    objc_msgSend(MEMORY[0x1E0D13B00], "countryCodeForNumber:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }
  +[CNCFPhoneNumber makeProxy](CNCFPhoneNumber, "makeProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (__CFPhoneNumber *)objc_msgSend(v8, "create::", v6, v5);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (self == a3)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    v17 = v5;
    v18 = v4;
    v19 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (unint64_t)-[CNPhoneNumber stringValue](self, "stringValue");
      v12 = (unint64_t)(id)objc_msgSend(a3, "stringValue");
      if (!(v11 | v12) || (v13 = objc_msgSend((id)v11, "isEqual:", v12)) != 0)
      {
        v14 = (unint64_t)-[CNPhoneNumber initialCountryCode](self, "initialCountryCode", v6, v17, v18, v19, v7, v8);
        v15 = (unint64_t)(id)objc_msgSend(a3, "initialCountryCode");
        if (!(v14 | v15) || (v13 = objc_msgSend((id)v14, "isEqual:", v15)) != 0)
          LOBYTE(v13) = 1;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  return v13;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhoneNumber stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("stringValue"), v4);

  -[CNPhoneNumber initialCountryCode](self, "initialCountryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("initialCountryCode"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSString)initialCountryCode
{
  return self->_initialCountryCode;
}

- (CNPhoneNumber)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CNPhoneNumber *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CNPhoneNumber initWithStringValue:countryCode:](self, "initWithStringValue:countryCode:", v5, v6);
  return v7;
}

- (NSString)unformattedInternationalStringValue
{
  return (NSString *)-[CNPhoneNumber stringValueWithCFPhoneNumberOptions:](self, "stringValueWithCFPhoneNumberOptions:", 2);
}

+ (CNPhoneNumber)phoneNumberWithStringValue:(NSString *)stringValue
{
  void *v4;
  void *v5;

  v4 = (void *)-[NSString copy](stringValue, "copy");
  objc_msgSend(a1, "phoneNumberWithCopiedStringValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNPhoneNumber *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNPhoneNumber)init
{

  return 0;
}

+ (CNPhoneNumber)new
{
  return 0;
}

- (CNPhoneNumber)initWithStringValue:(NSString *)string
{
  return -[CNPhoneNumber initWithStringValue:countryCode:](self, "initWithStringValue:countryCode:", string, 0);
}

+ (id)defaultCountryCode
{
  return (id)objc_msgSend(MEMORY[0x1E0D13B00], "defaultCountryCode");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v3 = (void *)MEMORY[0x1E0D13A78];
  -[CNPhoneNumber stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "objectHash:", v4);

  v6 = (void *)MEMORY[0x1E0D13A78];
  -[CNPhoneNumber initialCountryCode](self, "initialCountryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "objectHash:", v7) - v5 + 32 * v5 + 16337;

  return v8;
}

- (BOOL)isLikePhoneNumber:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[CNPhoneNumber phoneNumberRef](self, "phoneNumberRef")
    && objc_msgSend(v4, "phoneNumberRef")
    && CFEqual(-[CNPhoneNumber phoneNumberRef](self, "phoneNumberRef"), (CFTypeRef)objc_msgSend(v4, "phoneNumberRef")) != 0;

  return v5;
}

- (id)lastFourDigits
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D13B00];
  -[CNPhoneNumber unformattedInternationalStringValue](self, "unformattedInternationalStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastFourDigitsForNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isValid:(id *)a3
{
  id v5;
  uint64_t v6;
  id v7;
  BOOL v8;

  if (isValid__cn_once_token_0_4 != -1)
    dispatch_once(&isValid__cn_once_token_0_4, &__block_literal_global_132);
  v5 = (id)isValid__cn_once_object_0_4;
  if (isValid__cn_once_token_1_4 != -1)
    dispatch_once(&isValid__cn_once_token_1_4, &__block_literal_global_10_1);
  v6 = isValid__cn_once_token_2_4;
  v7 = (id)isValid__cn_once_object_1_4;
  if (v6 != -1)
    dispatch_once(&isValid__cn_once_token_2_4, &__block_literal_global_11_3);
  v8 = +[CN areValidKeyPaths:forObject:expectedClasses:allowNil:error:](CN, "areValidKeyPaths:forObject:expectedClasses:allowNil:error:", v5, self, v7, isValid__cn_once_object_2_4, a3);

  return v8;
}

void __25__CNPhoneNumber_isValid___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("countryCode");
  v3[1] = CFSTR("digits");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)isValid__cn_once_object_0_4;
  isValid__cn_once_object_0_4 = v1;

}

void __25__CNPhoneNumber_isValid___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)isValid__cn_once_object_1_4;
  isValid__cn_once_object_1_4 = v1;

}

void __25__CNPhoneNumber_isValid___block_invoke_3()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&unk_1E2A406F8, "copy");
  v1 = (void *)isValid__cn_once_object_2_4;
  isValid__cn_once_object_2_4 = v0;

}

- (NSString)formattedInternationalStringValue
{
  return (NSString *)-[CNPhoneNumber stringValueWithCFPhoneNumberOptions:](self, "stringValueWithCFPhoneNumberOptions:", 7);
}

+ (id)unsupportedCountryCodes
{
  if (unsupportedCountryCodes_cn_once_token_3 != -1)
    dispatch_once(&unsupportedCountryCodes_cn_once_token_3, &__block_literal_global_12_0);
  return (id)unsupportedCountryCodes_cn_once_object_3;
}

void __40__CNPhoneNumber_unsupportedCountryCodes__block_invoke()
{
  void *v0;

  v0 = (void *)unsupportedCountryCodes_cn_once_object_3;
  unsupportedCountryCodes_cn_once_object_3 = (uint64_t)&unk_1E2A40710;

}

+ (id)dialingCodeForISOCountryCode:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)_PNCopyInternationalCodeForCountry();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+%@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (BOOL)isFullyQualified
{
  void *v2;
  char v3;

  -[CNPhoneNumber digits](self, "digits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("+"));

  return v3;
}

- (id)fullyQualifiedDigits
{
  void *v3;
  void *v4;
  id v5;

  -[CNPhoneNumber stringValue](self, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhoneNumber _countryCodeFromPhoneNumberRef](self, "_countryCodeFromPhoneNumberRef");
  v4 = (void *)_PNCopyFullyQualifiedNumberForCountry();

  v5 = v4;
  return v5;
}

- (id)digitsRemovingDialingCode
{
  __CFString *v3;
  void *v4;
  void *v5;

  -[CNPhoneNumber countryCode](self, "countryCode");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "_isCountryCodeForNorthAmericanDialingPlan:", v3))
  {

    v3 = CFSTR("us");
  }
  -[CNPhoneNumber stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)PNCreateFormattedStringWithCountry();

  return v5;
}

- (id)formattedStringValueRemovingDialingCode
{
  __CFString *v3;
  void *v4;
  void *v5;

  -[CNPhoneNumber countryCode](self, "countryCode");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "_isCountryCodeForNorthAmericanDialingPlan:", v3))
  {

    v3 = CFSTR("us");
  }
  -[CNPhoneNumber stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)PNCreateFormattedStringWithCountry();

  return v5;
}

+ (BOOL)_isCountryCodeForNorthAmericanDialingPlan:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_countryCodesForNorthAmericanDialingPlan");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

+ (id)_countryCodesForNorthAmericanDialingPlan
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CNPhoneNumber__countryCodesForNorthAmericanDialingPlan__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_countryCodesForNorthAmericanDialingPlan_cn_once_token_4 != -1)
    dispatch_once(&_countryCodesForNorthAmericanDialingPlan_cn_once_token_4, block);
  return (id)_countryCodesForNorthAmericanDialingPlan_cn_once_object_4;
}

void __57__CNPhoneNumber__countryCodesForNorthAmericanDialingPlan__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend((id)objc_opt_class(), "_countryCodeForNorthAmericanDialingPlanAreaCodesExcludingUS");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", CFSTR("us"));
  v4 = objc_msgSend(v3, "copy");

  v5 = (void *)_countryCodesForNorthAmericanDialingPlan_cn_once_object_4;
  _countryCodesForNorthAmericanDialingPlan_cn_once_object_4 = v4;

}

+ (id)_countryCodeForNorthAmericanDialingPlanAreaCodesExcludingUS
{
  if (_countryCodeForNorthAmericanDialingPlanAreaCodesExcludingUS_cn_once_token_5 != -1)
    dispatch_once(&_countryCodeForNorthAmericanDialingPlanAreaCodesExcludingUS_cn_once_token_5, &__block_literal_global_32_1);
  return (id)_countryCodeForNorthAmericanDialingPlanAreaCodesExcludingUS_cn_once_object_5;
}

void __76__CNPhoneNumber__countryCodeForNorthAmericanDialingPlanAreaCodesExcludingUS__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[136];
  _QWORD v63[138];

  v63[136] = *MEMORY[0x1E0C80C00];
  v62[0] = CFSTR("386");
  v62[1] = CFSTR("403");
  v63[0] = CFSTR("ca");
  v63[1] = CFSTR("ca");
  v62[2] = CFSTR("587");
  v62[3] = CFSTR("780");
  v63[2] = CFSTR("ca");
  v63[3] = CFSTR("ca");
  v62[4] = CFSTR("825");
  v62[5] = CFSTR("236");
  v63[4] = CFSTR("ca");
  v63[5] = CFSTR("ca");
  v62[6] = CFSTR("250");
  v62[7] = CFSTR("604");
  v63[6] = CFSTR("ca");
  v63[7] = CFSTR("ca");
  v62[8] = CFSTR("672");
  v62[9] = CFSTR("778");
  v63[8] = CFSTR("ca");
  v63[9] = CFSTR("ca");
  v62[10] = CFSTR("907");
  v62[11] = CFSTR("204");
  v63[10] = CFSTR("ca");
  v63[11] = CFSTR("ca");
  v62[12] = CFSTR("431");
  v62[13] = CFSTR("584");
  v63[12] = CFSTR("ca");
  v63[13] = CFSTR("ca");
  v62[14] = CFSTR("506");
  v62[15] = CFSTR("428");
  v63[14] = CFSTR("ca");
  v63[15] = CFSTR("ca");
  v62[16] = CFSTR("709");
  v62[17] = CFSTR("879");
  v63[16] = CFSTR("ca");
  v63[17] = CFSTR("ca");
  v62[18] = CFSTR("867");
  v62[19] = CFSTR("782");
  v63[18] = CFSTR("ca");
  v63[19] = CFSTR("ca");
  v62[20] = CFSTR("902");
  v62[21] = CFSTR("226");
  v63[20] = CFSTR("ca");
  v63[21] = CFSTR("ca");
  v62[22] = CFSTR("249");
  v62[23] = CFSTR("289");
  v63[22] = CFSTR("ca");
  v63[23] = CFSTR("ca");
  v62[24] = CFSTR("343");
  v62[25] = CFSTR("365");
  v63[24] = CFSTR("ca");
  v63[25] = CFSTR("ca");
  v62[26] = CFSTR("382");
  v62[27] = CFSTR("387");
  v63[26] = CFSTR("ca");
  v63[27] = CFSTR("ca");
  v62[28] = CFSTR("416");
  v62[29] = CFSTR("437");
  v63[28] = CFSTR("ca");
  v63[29] = CFSTR("ca");
  v62[30] = CFSTR("519");
  v62[31] = CFSTR("548");
  v63[30] = CFSTR("ca");
  v63[31] = CFSTR("ca");
  v62[32] = CFSTR("613");
  v62[33] = CFSTR("647");
  v63[32] = CFSTR("ca");
  v63[33] = CFSTR("ca");
  v62[34] = CFSTR("683");
  v62[35] = CFSTR("705");
  v63[34] = CFSTR("ca");
  v63[35] = CFSTR("ca");
  v62[36] = CFSTR("742");
  v62[37] = CFSTR("753");
  v63[36] = CFSTR("ca");
  v63[37] = CFSTR("ca");
  v62[38] = CFSTR("807");
  v62[39] = CFSTR("905");
  v63[38] = CFSTR("ca");
  v63[39] = CFSTR("ca");
  v62[40] = CFSTR("942");
  v62[41] = CFSTR("263");
  v63[40] = CFSTR("ca");
  v63[41] = CFSTR("ca");
  v62[42] = CFSTR("354");
  v62[43] = CFSTR("367");
  v63[42] = CFSTR("ca");
  v63[43] = CFSTR("ca");
  v62[44] = CFSTR("418");
  v62[45] = CFSTR("438");
  v63[44] = CFSTR("ca");
  v63[45] = CFSTR("ca");
  v62[46] = CFSTR("450");
  v62[47] = CFSTR("468");
  v63[46] = CFSTR("ca");
  v63[47] = CFSTR("ca");
  v62[48] = CFSTR("514");
  v62[49] = CFSTR("579");
  v63[48] = CFSTR("ca");
  v63[49] = CFSTR("ca");
  v62[50] = CFSTR("581");
  v62[51] = CFSTR("819");
  v63[50] = CFSTR("ca");
  v63[51] = CFSTR("ca");
  v62[52] = CFSTR("873");
  v62[53] = CFSTR("306");
  v63[52] = CFSTR("ca");
  v63[53] = CFSTR("ca");
  v62[54] = CFSTR("474");
  v62[55] = CFSTR("639");
  v63[54] = CFSTR("ca");
  v63[55] = CFSTR("ca");
  v62[56] = CFSTR("264");
  v62[57] = CFSTR("268");
  v63[56] = CFSTR("ai");
  v63[57] = CFSTR("ag");
  v62[58] = CFSTR("246");
  v62[59] = CFSTR("441");
  v63[58] = CFSTR("bb");
  v63[59] = CFSTR("bm");
  v62[60] = CFSTR("284");
  v62[61] = CFSTR("345");
  v63[60] = CFSTR("vg");
  v63[61] = CFSTR("ky");
  v62[62] = CFSTR("767");
  v62[63] = CFSTR("473");
  v63[62] = CFSTR("dm");
  v63[63] = CFSTR("gd");
  v62[64] = CFSTR("876");
  v63[64] = CFSTR("jm");
  v62[65] = CFSTR("664");
  v63[65] = CFSTR("ms");
  v62[66] = CFSTR("737");
  v63[66] = CFSTR("pr");
  v62[67] = CFSTR("939");
  v63[67] = CFSTR("pr");
  v62[68] = CFSTR("869");
  v63[68] = CFSTR("kn");
  v62[69] = CFSTR("758");
  v63[69] = CFSTR("lc");
  v62[70] = CFSTR("784");
  v63[70] = CFSTR("vc");
  v62[71] = CFSTR("721");
  v63[71] = CFSTR("sx");
  v62[72] = CFSTR("242");
  v63[72] = CFSTR("bs");
  v62[73] = CFSTR("868");
  v63[73] = CFSTR("tt");
  v62[74] = CFSTR("649");
  v63[74] = CFSTR("tc");
  v62[75] = CFSTR("340");
  v63[75] = CFSTR("vi");
  v62[76] = CFSTR("600");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v63[76] = v61;
  v62[77] = CFSTR("622");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v63[77] = v60;
  v62[78] = CFSTR("633");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v63[78] = v59;
  v62[79] = CFSTR("644");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v63[79] = v58;
  v62[80] = CFSTR("655");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v63[80] = v57;
  v62[81] = CFSTR("677");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v63[81] = v56;
  v62[82] = CFSTR("688");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v63[82] = v55;
  v62[83] = CFSTR("700");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v63[83] = v54;
  v62[84] = CFSTR("500");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v63[84] = v53;
  v62[85] = CFSTR("521");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v63[85] = v52;
  v62[86] = CFSTR("522");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v63[86] = v51;
  v62[87] = CFSTR("523");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v63[87] = v50;
  v62[88] = CFSTR("524");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v63[88] = v49;
  v62[89] = CFSTR("525");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v63[89] = v48;
  v62[90] = CFSTR("526");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v63[90] = v47;
  v62[91] = CFSTR("527");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v63[91] = v46;
  v62[92] = CFSTR("528");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v63[92] = v45;
  v62[93] = CFSTR("529");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v63[93] = v44;
  v62[94] = CFSTR("532");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v63[94] = v43;
  v62[95] = CFSTR("533");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v63[95] = v42;
  v62[96] = CFSTR("535");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v63[96] = v41;
  v62[97] = CFSTR("538");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v63[97] = v40;
  v62[98] = CFSTR("542");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v63[98] = v39;
  v62[99] = CFSTR("543");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v63[99] = v38;
  v62[100] = CFSTR("544");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v63[100] = v37;
  v62[101] = CFSTR("545");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v63[101] = v36;
  v62[102] = CFSTR("546");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v63[102] = v35;
  v62[103] = CFSTR("547");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v63[103] = v34;
  v62[104] = CFSTR("549");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v63[104] = v33;
  v62[105] = CFSTR("550");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v63[105] = v32;
  v62[106] = CFSTR("552");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v63[106] = v31;
  v62[107] = CFSTR("553");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v63[107] = v30;
  v62[108] = CFSTR("554");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v63[108] = v29;
  v62[109] = CFSTR("556");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v63[109] = v28;
  v62[110] = CFSTR("566");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v63[110] = v27;
  v62[111] = CFSTR("558");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v63[111] = v26;
  v62[112] = CFSTR("569");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v63[112] = v25;
  v62[113] = CFSTR("577");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v63[113] = v24;
  v62[114] = CFSTR("578");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v63[114] = v23;
  v62[115] = CFSTR("588");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v63[115] = v22;
  v62[116] = CFSTR("589");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v63[116] = v21;
  v62[117] = CFSTR("900");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v63[117] = v20;
  v62[118] = CFSTR("800");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v63[118] = v19;
  v62[119] = CFSTR("822");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v63[119] = v18;
  v62[120] = CFSTR("833");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v63[120] = v17;
  v62[121] = CFSTR("844");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v63[121] = v16;
  v62[122] = CFSTR("855");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v63[122] = v15;
  v62[123] = CFSTR("866");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v63[123] = v14;
  v62[124] = CFSTR("877");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v63[124] = v13;
  v62[125] = CFSTR("880");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v63[125] = v12;
  v62[126] = CFSTR("881");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v63[126] = v0;
  v62[127] = CFSTR("882");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v63[127] = v1;
  v62[128] = CFSTR("883");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v63[128] = v2;
  v62[129] = CFSTR("884");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v63[129] = v3;
  v62[130] = CFSTR("885");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v63[130] = v4;
  v62[131] = CFSTR("886");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v63[131] = v5;
  v62[132] = CFSTR("887");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v63[132] = v6;
  v62[133] = CFSTR("888");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v63[133] = v7;
  v62[134] = CFSTR("889");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v63[134] = v8;
  v62[135] = CFSTR("710");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v63[135] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 136);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_countryCodeForNorthAmericanDialingPlanAreaCodesExcludingUS_cn_once_object_5;
  _countryCodeForNorthAmericanDialingPlanAreaCodesExcludingUS_cn_once_object_5 = v10;

}

@end
