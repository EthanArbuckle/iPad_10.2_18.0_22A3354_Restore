@implementation CNContactProperty

- (id)sourceContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CNContactProperty value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProperty identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProperty key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProperty contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN sourceContactForValue:labeledValueIdentifier:propertyKey:inUnifiedContact:](CN, "sourceContactForValue:labeledValueIdentifier:propertyKey:inUnifiedContact:", v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)label
{
  void *v2;
  void *v3;

  -[CNContactProperty labeledValue](self, "labeledValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)value
{
  void *v3;
  void *v4;

  if (-[CNContactProperty isMultiValueProperty](self))
  {
    -[CNContactProperty labeledValue](self, "labeledValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNContactProperty primitiveValue](self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)labeledValue
{
  void *v3;
  void *v4;

  -[CNContactProperty contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProperty labeledValueForContact:](self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CNContact)contact
{
  return self->_internalContact;
}

- (id)labeledValueForContact:(void *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];

  v3 = a2;
  if (a1)
  {
    v4 = *MEMORY[0x1E0D13848];
    objc_msgSend(a1, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    if ((v4 & 1) != 0)
    {
      a1 = 0;
    }
    else
    {
      objc_opt_class();
      -[CNContactProperty primitiveValue](a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
      v8 = v7;

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __44__CNContactProperty_labeledValueForContact___block_invoke;
      v10[3] = &unk_1E29F91C0;
      v10[4] = a1;
      objc_msgSend(v8, "_cn_firstObjectPassingTest:", v10);
      a1 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return a1;
}

uint64_t __44__CNContactProperty_labeledValueForContact___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)primitiveValue
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  if (a1)
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "key");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "CNValueForContact:", v5);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (NSString)key
{
  return self->_key;
}

- (void)isMultiValueProperty
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  if (result)
  {
    v1 = result;
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "key");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "isMultiValue");
    return (void *)v5;
  }
  return result;
}

+ (CNContactProperty)contactPropertyWithContact:(id)a3 propertyKey:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  const char *v13;
  SEL v14;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_alloc_init((Class)a1);
  v12 = (void *)objc_msgSend(v10, "copy");

  -[CNChangesNotifierProxy setRemovalBlocks:]((uint64_t)v11, v12);
  if (v11)
  {
    objc_setProperty_nonatomic_copy(v11, v13, v8, 8);
    objc_setProperty_nonatomic_copy(v11, v14, v9, 16);
  }

  return (CNContactProperty *)v11;
}

+ (CNContactProperty)contactPropertyWithContactNoCopy:(id)a3 propertyKey:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  SEL v13;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_alloc_init((Class)a1);
  -[CNChangesNotifierProxy setRemovalBlocks:]((uint64_t)v11, v10);

  if (v11)
  {
    objc_setProperty_nonatomic_copy(v11, v12, v8, 8);
    objc_setProperty_nonatomic_copy(v11, v13, v9, 16);
  }

  return (CNContactProperty *)v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalContact, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactProperty)initWithCoder:(id)a3
{
  id v4;
  CNContactProperty *v5;
  void *v6;
  uint64_t v7;
  CNContact *internalContact;
  void *v9;
  uint64_t v10;
  NSString *key;
  void *v12;
  uint64_t v13;
  NSString *identifier;
  CNContactProperty *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CNContactProperty;
  v5 = -[CNContactProperty init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_internalContact"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    internalContact = v5->_internalContact;
    v5->_internalContact = (CNContact *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_key"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    key = v5->_key;
    v5->_key = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CNContact *internalContact;
  id v5;

  internalContact = self->_internalContact;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", internalContact, CFSTR("_internalContact"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_key, CFSTR("_key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  _QWORD aBlock[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __29__CNContactProperty_isEqual___block_invoke;
  v17[3] = &unk_1E29F7D70;
  v17[4] = self;
  v18 = v4;
  aBlock[0] = v7;
  aBlock[1] = 3221225472;
  aBlock[2] = __29__CNContactProperty_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E29F7D70;
  aBlock[4] = self;
  v8 = v18;
  v16 = v8;
  v9 = _Block_copy(aBlock);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __29__CNContactProperty_isEqual___block_invoke_3;
  v13[3] = &unk_1E29F7D70;
  v13[4] = self;
  v14 = v8;
  v10 = v8;
  v11 = _Block_copy(v13);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v10, v6, self, v17, v9, v11, 0);

  return (char)self;
}

uint64_t __29__CNContactProperty_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __29__CNContactProperty_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __29__CNContactProperty_isEqual___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[5];
  _QWORD aBlock[5];
  _QWORD v11[5];

  v3 = (void *)MEMORY[0x1E0D13A78];
  v4 = MEMORY[0x1E0C809B0];
  aBlock[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __25__CNContactProperty_hash__block_invoke;
  v11[3] = &unk_1E29F7D98;
  v11[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __25__CNContactProperty_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v5 = _Block_copy(aBlock);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __25__CNContactProperty_hash__block_invoke_3;
  v9[3] = &unk_1E29F7D98;
  v9[4] = self;
  v6 = _Block_copy(v9);
  v7 = objc_msgSend(v3, "hashWithBlocks:", v11, v5, v6, 0);

  return v7;
}

uint64_t __25__CNContactProperty_hash__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(_QWORD *)(v1 + 24);
  else
    v2 = 0;
  return objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", v2);
}

uint64_t __25__CNContactProperty_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __25__CNContactProperty_hash__block_invoke_3(uint64_t a1)
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

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  CNContact *internalContact;
  void *v7;
  void *v8;
  __CFString *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact identifier](self->_internalContact, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("contact identifier"), v4);

  internalContact = self->_internalContact;
  +[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(internalContact) = -[CNContact areKeysAvailable:](internalContact, "areKeysAvailable:", v8);

  if ((_DWORD)internalContact)
  {
    +[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", self->_internalContact, 0);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("<not fetched>");
  }
  v10 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("contact name"), v9);
  v11 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("key"), self->_key);
  if (self->_identifier)
    v12 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifier"));
  -[CNContactProperty value](self, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("value"), v13);

  objc_msgSend(v3, "build");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (int)multiValueIdentifier
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;

  -[CNContactProperty contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUnified");

  if (!v4)
  {
    -[CNContactProperty labeledValue](self, "labeledValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_3;
LABEL_5:
    v7 = -1;
    goto LABEL_6;
  }
  -[CNContactProperty sourceContact](self, "sourceContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProperty labeledValueForContact:](self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
LABEL_3:
  v7 = objc_msgSend(v6, "iOSLegacyIdentifier");
LABEL_6:

  return v7;
}

@end
