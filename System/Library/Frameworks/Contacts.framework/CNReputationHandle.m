@implementation CNReputationHandle

+ (CNReputationHandle)handleWithStringValue:(id)a3
{
  id v3;
  _CNReputationGenericHandle *v4;

  v3 = a3;
  v4 = -[CNReputationHandle initWithStringValue:type:]([_CNReputationGenericHandle alloc], "initWithStringValue:type:", v3, 0);

  return (CNReputationHandle *)v4;
}

+ (CNReputationHandle)handleWithEmailAddress:(id)a3
{
  id v3;
  _CNReputationEmailAddressHandle *v4;

  v3 = a3;
  v4 = -[CNReputationHandle initWithStringValue:type:]([_CNReputationEmailAddressHandle alloc], "initWithStringValue:type:", v3, 1);

  return (CNReputationHandle *)v4;
}

+ (CNReputationHandle)handleWithPhoneNumber:(id)a3
{
  id v3;
  _CNReputationPhoneNumberHandle *v4;

  v3 = a3;
  v4 = -[CNReputationHandle initWithStringValue:type:]([_CNReputationPhoneNumberHandle alloc], "initWithStringValue:type:", v3, 2);

  return (CNReputationHandle *)v4;
}

- (CNReputationHandle)initWithStringValue:(id)a3 type:(int64_t)a4
{
  id v6;
  CNReputationHandle *v7;
  uint64_t v8;
  NSString *stringValue;
  CNReputationHandle *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNReputationHandle;
  v7 = -[CNReputationHandle init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    stringValue = v7->_stringValue;
    v7->_stringValue = (NSString *)v8;

    v7->_type = a4;
    v10 = v7;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNReputationHandle stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("handle"), v4);

  objc_msgSend((id)objc_opt_class(), "descriptionForType:", -[CNReputationHandle type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("type"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)descriptionForType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3 == 2)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (phone)"), v4);
  }
  else if (a3 == 1)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (email)"), v4);
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (invalid)"), v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (unknown)"), v4);
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t aBlock;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  CNReputationHandle *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D13A40];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __30__CNReputationHandle_isEqual___block_invoke;
  v16[3] = &unk_1E29F7D70;
  v16[4] = self;
  v17 = v4;
  aBlock = v5;
  v11 = 3221225472;
  v12 = __30__CNReputationHandle_isEqual___block_invoke_2;
  v13 = &unk_1E29F7D70;
  v14 = self;
  v15 = v17;
  v7 = v17;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v7, self, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

uint64_t __30__CNReputationHandle_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isInteger:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "type"), objc_msgSend(*(id *)(a1 + 40), "type"));
}

uint64_t __30__CNReputationHandle_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD aBlock[5];
  _QWORD v7[5];

  v2 = (void *)MEMORY[0x1E0D13A78];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__CNReputationHandle_hash__block_invoke;
  v7[3] = &unk_1E29F7D98;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __26__CNReputationHandle_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v3 = _Block_copy(aBlock);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __26__CNReputationHandle_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __26__CNReputationHandle_hash__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "integerHash:", objc_msgSend(*(id *)(a1 + 32), "type"));
}

- (void)configureBuilder:(id)a3
{
  id v4;
  CNReputationHandle *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
