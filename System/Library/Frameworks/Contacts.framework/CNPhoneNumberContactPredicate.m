@implementation CNPhoneNumberContactPredicate

- (BOOL)returnsMultipleResults
{
  if (result)
    return *(_BYTE *)(result + 40) != 0;
  return result;
}

- (uint64_t)prefixHint
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)groupIdentifiers
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (uint64_t)digits
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (id)initWithPhoneNumber:(char)a3 returnMultipleResults:
{
  if (result)
    return -[CNPhoneNumberContactPredicate initWithPhoneNumber:prefixHint:groupIdentifiers:returnMultipleResults:](result, a2, 0, 0, a3);
  return result;
}

- (id)initWithPhoneNumber:(void *)a3 prefixHint:(void *)a4 groupIdentifiers:(char)a5 returnMultipleResults:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)CNPhoneNumberContactPredicate;
    a1 = objc_msgSendSuper2(&v19, sel_initWithPredicate_, 0);
    if (a1)
    {
      v12 = objc_msgSend(v9, "copy");
      v13 = (void *)*((_QWORD *)a1 + 6);
      *((_QWORD *)a1 + 6) = v12;

      v14 = objc_msgSend(v10, "copy");
      v15 = (void *)*((_QWORD *)a1 + 7);
      *((_QWORD *)a1 + 7) = v14;

      *((_BYTE *)a1 + 40) = a5;
      v16 = objc_msgSend(v11, "copy");
      v17 = (void *)*((_QWORD *)a1 + 10);
      *((_QWORD *)a1 + 10) = v16;

    }
  }

  return a1;
}

- (uint64_t)phoneNumber
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (uint64_t)countryCode
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_digits, 0);
  objc_storeStrong((id *)&self->_prefixHint, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

- (id)initWithPhoneNumber:(void *)a3 prefixHint:(char)a4 returnMultipleResults:
{
  if (result)
    return -[CNPhoneNumberContactPredicate initWithPhoneNumber:prefixHint:groupIdentifiers:returnMultipleResults:](result, a2, a3, 0, a4);
  return result;
}

- (_QWORD)initWithDigits:(void *)a3 countryCode:(char)a4 returnMultipleResults:
{
  id v7;
  id v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    +[CNPhoneNumber phoneNumberWithDigits:countryCode:](CNPhoneNumber, "phoneNumberWithDigits:countryCode:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CNPhoneNumberContactPredicate initWithPhoneNumber:prefixHint:groupIdentifiers:returnMultipleResults:](a1, v9, 0, 0, a4);

    if (v10)
    {
      objc_msgSend(v7, "_cn_stringBySanitizingPhoneNumber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      v13 = (void *)v10[8];
      v10[8] = v12;

      v14 = objc_msgSend(v8, "copy");
      v15 = (void *)v10[9];
      v10[9] = v14;

      v10 = v10;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNPhoneNumberContactPredicate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CNPhoneNumberContactPredicate *v12;
  void *v13;
  uint64_t v14;
  NSString *digits;
  void *v16;
  uint64_t v17;
  NSString *countryCode;
  CNPhoneNumberContactPredicate *v19;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_phoneNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_returnsMultipleResults"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_prefixHint"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_groupIdentifiers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (CNPhoneNumberContactPredicate *)-[CNPhoneNumberContactPredicate initWithPhoneNumber:prefixHint:groupIdentifiers:returnMultipleResults:](self, v5, v7, v11, v6);
  if (v12)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_digits"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    digits = v12->_digits;
    v12->_digits = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_countryCode"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    countryCode = v12->_countryCode;
    v12->_countryCode = (NSString *)v17;

    v19 = v12;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNPhoneNumberContactPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_phoneNumber, CFSTR("_phoneNumber"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_prefixHint, CFSTR("_prefixHint"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_returnsMultipleResults, CFSTR("_returnsMultipleResults"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_digits, CFSTR("_digits"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_countryCode, CFSTR("_countryCode"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_groupIdentifiers, CFSTR("_groupIdentifiers"));

}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  NSString *prefixHint;
  id v8;
  id v9;
  NSString *digits;
  id v11;
  NSArray *groupIdentifiers;
  id v13;
  void *v14;
  id v16;
  id v17;
  id v18;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsMatchingPhoneNumber:]"));
  if (self)
  {
    v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("phoneNumber"), self->_phoneNumber);
    v6 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("returnsMultipleResults"), self->_returnsMultipleResults);
    prefixHint = self->_prefixHint;
  }
  else
  {
    v16 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("phoneNumber"), 0);
    v17 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("returnsMultipleResults"), 0);
    prefixHint = 0;
  }
  v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("prefixHint"), prefixHint);
  if (self)
  {
    v9 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("countryCode"), self->_countryCode);
    digits = self->_digits;
  }
  else
  {
    v18 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("countryCode"), 0);
    digits = 0;
  }
  v11 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("digits"), digits);
  if (self)
    groupIdentifiers = self->_groupIdentifiers;
  else
    groupIdentifiers = 0;
  v13 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("groupIdentifiers"), groupIdentifiers);
  objc_msgSend(v3, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (id)shortDebugDescription
{
  return CFSTR("PhoneNumberPredicate");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  CNPhoneNumberContactPredicate *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD aBlock[5];
  id v31;
  _QWORD v32[5];
  id v33;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D13A40];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __41__CNPhoneNumberContactPredicate_isEqual___block_invoke;
  v32[3] = &unk_1E29F7D70;
  v32[4] = self;
  v33 = v4;
  aBlock[0] = v5;
  aBlock[1] = 3221225472;
  aBlock[2] = __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E29F7D70;
  aBlock[4] = self;
  v7 = v33;
  v31 = v7;
  v8 = _Block_copy(aBlock);
  v28[0] = v5;
  v28[1] = 3221225472;
  v28[2] = __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_3;
  v28[3] = &unk_1E29F7D70;
  v28[4] = self;
  v9 = v7;
  v29 = v9;
  v10 = _Block_copy(v28);
  v26[0] = v5;
  v26[1] = 3221225472;
  v26[2] = __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_4;
  v26[3] = &unk_1E29F7D70;
  v26[4] = self;
  v11 = v9;
  v27 = v11;
  v12 = _Block_copy(v26);
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_5;
  v24[3] = &unk_1E29F7D70;
  v24[4] = self;
  v13 = v11;
  v25 = v13;
  v14 = _Block_copy(v24);
  v18 = v5;
  v19 = 3221225472;
  v20 = __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_6;
  v21 = &unk_1E29F7D70;
  v22 = self;
  v23 = v13;
  v15 = v13;
  v16 = _Block_copy(&v18);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v15, self, v32, v8, v10, v12, v14, v16, 0, v18, v19, v20, v21, v22);

  return (char)self;
}

uint64_t __41__CNPhoneNumberContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v1 = (void *)MEMORY[0x1E0D13A40];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[6];
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(_QWORD *)(v3 + 48);
  else
    v4 = 0;
  v5 = v2;
  v6 = objc_msgSend(v1, "isObject:equalToOther:", v5, v4);

  return v6;
}

uint64_t __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _BOOL8 v2;
  uint64_t v3;
  _BOOL8 v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(unsigned __int8 *)(v1 + 40) != 0;
  else
    v2 = 0;
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(unsigned __int8 *)(v3 + 40) != 0;
  else
    v4 = 0;
  return objc_msgSend(MEMORY[0x1E0D13A40], "isBool:equalToOther:", v2, v4);
}

uint64_t __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v1 = (void *)MEMORY[0x1E0D13A40];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[7];
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(_QWORD *)(v3 + 56);
  else
    v4 = 0;
  v5 = v2;
  v6 = objc_msgSend(v1, "isObject:equalToOther:", v5, v4);

  return v6;
}

uint64_t __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v1 = (void *)MEMORY[0x1E0D13A40];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[9];
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(_QWORD *)(v3 + 72);
  else
    v4 = 0;
  v5 = v2;
  v6 = objc_msgSend(v1, "isObject:equalToOther:", v5, v4);

  return v6;
}

uint64_t __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_5(uint64_t a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v1 = (void *)MEMORY[0x1E0D13A40];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[8];
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(_QWORD *)(v3 + 64);
  else
    v4 = 0;
  v5 = v2;
  v6 = objc_msgSend(v1, "isObject:equalToOther:", v5, v4);

  return v6;
}

uint64_t __41__CNPhoneNumberContactPredicate_isEqual___block_invoke_6(uint64_t a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v1 = (void *)MEMORY[0x1E0D13A40];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[10];
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(_QWORD *)(v3 + 80);
  else
    v4 = 0;
  v5 = v2;
  v6 = objc_msgSend(v1, "isObject:equalToOther:", v5, v4);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD aBlock[5];
  _QWORD v17[5];

  v3 = (void *)MEMORY[0x1E0D13A78];
  v4 = MEMORY[0x1E0C809B0];
  aBlock[4] = self;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __37__CNPhoneNumberContactPredicate_hash__block_invoke;
  v17[3] = &unk_1E29F7D98;
  v17[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__CNPhoneNumberContactPredicate_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v5 = _Block_copy(aBlock);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __37__CNPhoneNumberContactPredicate_hash__block_invoke_3;
  v15[3] = &unk_1E29F7D98;
  v15[4] = self;
  v6 = _Block_copy(v15);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __37__CNPhoneNumberContactPredicate_hash__block_invoke_4;
  v14[3] = &unk_1E29F7D98;
  v14[4] = self;
  v7 = _Block_copy(v14);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __37__CNPhoneNumberContactPredicate_hash__block_invoke_5;
  v13[3] = &unk_1E29F7D98;
  v13[4] = self;
  v8 = _Block_copy(v13);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __37__CNPhoneNumberContactPredicate_hash__block_invoke_6;
  v12[3] = &unk_1E29F7D98;
  v12[4] = self;
  v9 = _Block_copy(v12);
  v10 = objc_msgSend(v3, "hashWithBlocks:", v17, v5, v6, v7, v8, v9, 0);

  return v10;
}

uint64_t __37__CNPhoneNumberContactPredicate_hash__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(_QWORD *)(v1 + 48);
  else
    v2 = 0;
  return objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", v2);
}

uint64_t __37__CNPhoneNumberContactPredicate_hash__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _BOOL8 v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(unsigned __int8 *)(v1 + 40) != 0;
  else
    v2 = 0;
  return objc_msgSend(MEMORY[0x1E0D13A78], "BOOLHash:", v2);
}

uint64_t __37__CNPhoneNumberContactPredicate_hash__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(_QWORD *)(v1 + 56);
  else
    v2 = 0;
  return objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", v2);
}

uint64_t __37__CNPhoneNumberContactPredicate_hash__block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(_QWORD *)(v1 + 72);
  else
    v2 = 0;
  return objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", v2);
}

uint64_t __37__CNPhoneNumberContactPredicate_hash__block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(_QWORD *)(v1 + 64);
  else
    v2 = 0;
  return objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", v2);
}

uint64_t __37__CNPhoneNumberContactPredicate_hash__block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(_QWORD *)(v1 + 80);
  else
    v2 = 0;
  return objc_msgSend(MEMORY[0x1E0D13A78], "arrayHash:", v2);
}

- (BOOL)cn_hasHighSpecificity
{
  void *v2;
  BOOL v3;

  if (self)
    self = (CNPhoneNumberContactPredicate *)self->_phoneNumber;
  -[CNPhoneNumberContactPredicate digits](self, "digits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "length") > 5;

  return v3;
}

- (void)cn_triageWithLog:(id)a3 serialNumber:(unint64_t)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)MEMORY[0x1E0D13A38];
    v7 = a3;
    objc_msgSend(v6, "currentEnvironment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultCountryCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218242;
    v11 = a4;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_INFO, "%04llx Default country code: %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

- (id)sgContactMatchesWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a5;
  -[CNPhoneNumberContactPredicate phoneNumber]((uint64_t)self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contactMatchesByPhoneNumber:error:", v10, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
