@implementation CNAutocompleteResultValue

+ (id)resultValueWithAddress:(id)a3 addressType:(int64_t)a4
{
  return (id)objc_msgSend(a1, "resultValueWithAddress:addressType:label:", a3, a4, &stru_1E70E0E70);
}

+ (id)resultValueWithAddress:(id)a3 addressType:(int64_t)a4 label:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "setAddress:", v9);

  objc_msgSend(v10, "setAddressType:", a4);
  objc_msgSend(v10, "setLabel:", v8);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  NSString *address;
  int v6;
  NSString *identifier;
  NSString *label;
  NSString *instantMessageAddressService;

  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_addressType == *((_QWORD *)a3 + 2))
    {
      address = self->_address;
      if (!((unint64_t)address | *((_QWORD *)a3 + 1)) || (v6 = -[NSString isEqual:](address, "isEqual:")) != 0)
      {
        identifier = self->_identifier;
        if (!((unint64_t)identifier | *((_QWORD *)a3 + 4))
          || (v6 = -[NSString isEqual:](identifier, "isEqual:")) != 0)
        {
          label = self->_label;
          if (!((unint64_t)label | *((_QWORD *)a3 + 5)) || (v6 = -[NSString isEqual:](label, "isEqual:")) != 0)
          {
            instantMessageAddressService = self->_instantMessageAddressService;
            if (!((unint64_t)instantMessageAddressService | *((_QWORD *)a3 + 3))
              || (v6 = -[NSString isEqual:](instantMessageAddressService, "isEqual:")) != 0)
            {
              LOBYTE(v6) = 1;
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
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
  unint64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD aBlock[5];
  _QWORD v15[5];

  v3 = (void *)MEMORY[0x1E0D13A78];
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __33__CNAutocompleteResultValue_hash__block_invoke;
  v15[3] = &unk_1E70DFEB8;
  v15[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__CNAutocompleteResultValue_hash__block_invoke_2;
  aBlock[3] = &unk_1E70DFEB8;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __33__CNAutocompleteResultValue_hash__block_invoke_3;
  v13[3] = &unk_1E70DFEB8;
  v13[4] = self;
  v6 = _Block_copy(v13);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __33__CNAutocompleteResultValue_hash__block_invoke_4;
  v12[3] = &unk_1E70DFEB8;
  v12[4] = self;
  v7 = _Block_copy(v12);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __33__CNAutocompleteResultValue_hash__block_invoke_5;
  v11[3] = &unk_1E70DFEB8;
  v11[4] = self;
  v8 = _Block_copy(v11);
  v9 = objc_msgSend(v3, "hashWithBlocks:", v15, v5, v6, v7, v8, 0);

  return v9;
}

uint64_t __33__CNAutocompleteResultValue_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __33__CNAutocompleteResultValue_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __33__CNAutocompleteResultValue_hash__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __33__CNAutocompleteResultValue_hash__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "instantMessageAddressService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __33__CNAutocompleteResultValue_hash__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "integerHash:", objc_msgSend(*(id *)(a1 + 32), "addressType"));
}

- (id)stringForHashing
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[CNAutocompleteResultValue stringForHashingMemo](self, "stringForHashingMemo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend((id)objc_opt_class(), "stringForHashingValue:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*MEMORY[0x1E0D13878] + 16))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResultValue setStringForHashingMemo:](self, "setStringForHashingMemo:", v5);

  }
  v6 = *MEMORY[0x1E0D13880];
  -[CNAutocompleteResultValue stringForHashingMemo](self, "stringForHashingMemo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)stringForHashingValue:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = *MEMORY[0x1E0D13848];
  objc_msgSend(v4, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ((v5 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(a1, "normalizedAddressForValue:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@+%lu"), v8, objc_msgSend(v4, "addressType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)normalizedAddressForValue:(id)a3
{
  id v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "addressType") == 2)
    v4 = (uint64_t *)&CNAutocompleteResultAddressStringForHashingPhoneNumberTransform;
  else
    v4 = (uint64_t *)&CNAutocompleteResultAddressStringForHashingEmailTransform;
  v5 = *v4;
  objc_msgSend(v3, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)stringForSorting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[CNAutocompleteResultValue addressType](self, "addressType") == 3)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[CNAutocompleteResultValue address](self, "address");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResultValue instantMessageAddressService](self, "instantMessageAddressService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%@>"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNAutocompleteResultValue address](self, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)addressExactlyMatchesSearchTerm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  -[CNAutocompleteResultValue address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNAutocompleteResultValue address](self, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_cn_caseInsensitiveIsEqual:", v4);

    if ((v7 & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v9 = v4;
      if ((objc_msgSend(v9, "_cn_containsSubstring:", CFSTR("@")) & 1) == 0)
      {
        objc_msgSend(v9, "stringByAppendingString:", CFSTR("@"));
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v10;
      }
      -[CNAutocompleteResultValue address](self, "address");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "rangeOfString:options:", v9, 137);

      v8 = v12 != 0x7FFFFFFFFFFFFFFFLL;
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
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultValue address](self, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("address"), v4);

  -[CNAutocompleteResultValue identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("id"), v6);

  -[CNAutocompleteResultValue label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("label"), v8);

  -[CNAutocompleteResultValue addressTypeDescription](self, "addressTypeDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("addressType"), v10);

  -[CNAutocompleteResultValue instantMessageAddressService](self, "instantMessageAddressService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("instantMessageAddressService"), v12);

  objc_msgSend(v3, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)addressTypeDescription
{
  int64_t v2;

  v2 = -[CNAutocompleteResultValue addressType](self, "addressType");
  if ((unint64_t)(v2 - 1) > 4)
    return CFSTR("unknown");
  else
    return off_1E70DFED8[v2 - 1];
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (int64_t)addressType
{
  return self->_addressType;
}

- (void)setAddressType:(int64_t)a3
{
  self->_addressType = a3;
}

- (NSString)instantMessageAddressService
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInstantMessageAddressService:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)stringForHashingMemo
{
  return self->_stringForHashingMemo;
}

- (void)setStringForHashingMemo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringForHashingMemo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_instantMessageAddressService, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
