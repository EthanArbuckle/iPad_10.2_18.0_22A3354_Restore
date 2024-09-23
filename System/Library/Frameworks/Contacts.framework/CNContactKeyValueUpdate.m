@implementation CNContactKeyValueUpdate

- (BOOL)applyToABPerson:(void *)a3 withPropertiesContext:(id)a4 logger:(id)a5 error:(id *)a6
{
  id v10;
  id value;
  CNPropertyDescription *property;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  id v20;

  v10 = a5;
  value = self->_value;
  property = self->_property;
  v13 = a4;
  -[CNPropertyDescription key](property, "key");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applyContactUpdateOfKind:value:property:", "single value", value, v14);

  -[CNContactKeyValueUpdate property](self, "property");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactKeyValueUpdate value](self, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "setCNValue:onABPerson:withDependentPropertiesContext:error:", v16, a3, v13, a6);

  if (!v17 || a6 && *a6)
  {
    v18 = self->_value;
    -[CNPropertyDescription key](self->_property, "key");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a6)
      v20 = *a6;
    else
      v20 = 0;
    objc_msgSend(v10, "failedToApplyContactUpdateOfKind:value:property:error:", "single value", v18, v19, v20);

  }
  return v17;
}

- (CNContactKeyValueUpdate)initWithProperty:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  CNContactKeyValueUpdate *v9;
  CNContactKeyValueUpdate *v10;
  CNContactKeyValueUpdate *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactKeyValueUpdate;
  v9 = -[CNContactKeyValueUpdate init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_property, a3);
    objc_storeStrong(&v10->_value, a4);
    v11 = v10;
  }

  return v10;
}

- (void)applyToMutableContact:(id)a3 withIdentifierMap:(id)a4
{
  id value;
  CNPropertyDescription *property;
  id v6;
  id v7;

  value = self->_value;
  property = self->_property;
  v6 = a3;
  -[CNPropertyDescription key](property, "key");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", value, v7);

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0D13A08], "descriptionForObject:withNamesAndObjects:", self->_property, CFSTR("value"), self->_value, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t aBlock;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  CNContactKeyValueUpdate *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v14 = v4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __35__CNContactKeyValueUpdate_isEqual___block_invoke;
  v15[3] = &unk_1E29F7D70;
  v15[4] = self;
  v16 = v4;
  aBlock = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __35__CNContactKeyValueUpdate_isEqual___block_invoke_2;
  v12 = &unk_1E29F7D70;
  v13 = self;
  v6 = v4;
  v7 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToOther:withBlocks:", self, v6, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

uint64_t __35__CNContactKeyValueUpdate_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "property");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __35__CNContactKeyValueUpdate_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "value");
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
  v7[2] = __31__CNContactKeyValueUpdate_hash__block_invoke;
  v7[3] = &unk_1E29F7D98;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __31__CNContactKeyValueUpdate_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v3 = _Block_copy(aBlock);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __31__CNContactKeyValueUpdate_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "property");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __31__CNContactKeyValueUpdate_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (CNPropertyDescription)property
{
  return (CNPropertyDescription *)objc_getProperty(self, a2, 8, 1);
}

- (id)value
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

@end
