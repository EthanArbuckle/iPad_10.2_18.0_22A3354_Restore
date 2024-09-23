@implementation CNChangeHistoryLabeledValueChange

- (CNChangeHistoryLabeledValueChange)initWithContactIdentifier:(id)a3 propertyKey:(id)a4 labeledValueIdentifier:(id)a5 changeType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  CNChangeHistoryLabeledValueChange *v13;
  uint64_t v14;
  NSString *contactIdentifier;
  uint64_t v16;
  NSString *propertyKey;
  uint64_t v18;
  NSString *labeledValueIdentifier;
  CNChangeHistoryLabeledValueChange *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CNChangeHistoryLabeledValueChange;
  v13 = -[CNChangeHistoryLabeledValueChange init](&v22, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    contactIdentifier = v13->_contactIdentifier;
    v13->_contactIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    propertyKey = v13->_propertyKey;
    v13->_propertyKey = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    labeledValueIdentifier = v13->_labeledValueIdentifier;
    v13->_labeledValueIdentifier = (NSString *)v18;

    v13->_changeType = a6;
    v20 = v13;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryLabeledValueChange)initWithCoder:(id)a3
{
  id v4;
  CNChangeHistoryLabeledValueChange *v5;
  void *v6;
  uint64_t v7;
  NSString *contactIdentifier;
  void *v9;
  uint64_t v10;
  NSString *propertyKey;
  void *v12;
  uint64_t v13;
  NSString *labeledValueIdentifier;
  CNChangeHistoryLabeledValueChange *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CNChangeHistoryLabeledValueChange;
  v5 = -[CNChangeHistoryLabeledValueChange init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contactIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_propertyKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    propertyKey = v5->_propertyKey;
    v5->_propertyKey = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_labeledValueIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    labeledValueIdentifier = v5->_labeledValueIdentifier;
    v5->_labeledValueIdentifier = (NSString *)v13;

    v5->_changeType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_changeType"));
    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contactIdentifier;
  id v5;

  contactIdentifier = self->_contactIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contactIdentifier, CFSTR("_contactIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_propertyKey, CFSTR("_propertyKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_labeledValueIdentifier, CFSTR("_labeledValueIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_changeType, CFSTR("_changeType"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0D13A08];
  -[CNChangeHistoryLabeledValueChange contactIdentifier](self, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryLabeledValueChange propertyKey](self, "propertyKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryLabeledValueChange labeledValueIdentifier](self, "labeledValueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CNChangeHistoryLabeledValueChange changeType](self, "changeType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForObject:withNamesAndObjects:", self, CFSTR("contactIdentifier"), v4, CFSTR("propertyKey"), v5, CFSTR("labeledValueIdentifier"), v6, CFSTR("changeType"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  CNChangeHistoryLabeledValueChange *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD aBlock[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D13A40];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __45__CNChangeHistoryLabeledValueChange_isEqual___block_invoke;
  v24[3] = &unk_1E29F7D70;
  v24[4] = self;
  v25 = v4;
  aBlock[0] = v5;
  aBlock[1] = 3221225472;
  aBlock[2] = __45__CNChangeHistoryLabeledValueChange_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E29F7D70;
  aBlock[4] = self;
  v7 = v25;
  v23 = v7;
  v8 = _Block_copy(aBlock);
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __45__CNChangeHistoryLabeledValueChange_isEqual___block_invoke_3;
  v20[3] = &unk_1E29F7D70;
  v20[4] = self;
  v9 = v7;
  v21 = v9;
  v10 = _Block_copy(v20);
  v14 = v5;
  v15 = 3221225472;
  v16 = __45__CNChangeHistoryLabeledValueChange_isEqual___block_invoke_4;
  v17 = &unk_1E29F7D70;
  v18 = self;
  v19 = v9;
  v11 = v9;
  v12 = _Block_copy(&v14);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v11, self, v24, v8, v10, v12, 0, v14, v15, v16, v17, v18);

  return (char)self;
}

uint64_t __45__CNChangeHistoryLabeledValueChange_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __45__CNChangeHistoryLabeledValueChange_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "propertyKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "propertyKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __45__CNChangeHistoryLabeledValueChange_isEqual___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "labeledValueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "labeledValueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __45__CNChangeHistoryLabeledValueChange_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isInteger:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "changeType"), objc_msgSend(*(id *)(a1 + 40), "changeType"));
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)propertyKey
{
  return self->_propertyKey;
}

- (NSString)labeledValueIdentifier
{
  return self->_labeledValueIdentifier;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labeledValueIdentifier, 0);
  objc_storeStrong((id *)&self->_propertyKey, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end
