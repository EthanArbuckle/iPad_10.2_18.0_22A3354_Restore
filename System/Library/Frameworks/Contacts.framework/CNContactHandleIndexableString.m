@implementation CNContactHandleIndexableString

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_equivalenceStrategy, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_indexKey, 0);
}

- (CNContactHandleIndexableString)initWithString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CNContactHandleIndexableString *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "equivalenceStrategyWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "indexKeyForString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNContactHandleIndexableString initWithFullString:indexKey:equivalenceStrategy:](self, "initWithFullString:indexKey:equivalenceStrategy:", v4, v6, v5);

  return v7;
}

- (CNContactHandleIndexableString)initWithFullString:(id)a3 indexKey:(id)a4 equivalenceStrategy:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNContactHandleIndexableString *v11;
  uint64_t v12;
  NSString *stringValue;
  uint64_t v14;
  NSString *indexKey;
  CNContactHandleIndexableString *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNContactHandleIndexableString;
  v11 = -[CNContactHandleIndexableString init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    stringValue = v11->_stringValue;
    v11->_stringValue = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    indexKey = v11->_indexKey;
    v11->_indexKey = (NSString *)v14;

    objc_storeStrong((id *)&v11->_equivalenceStrategy, a5);
    v16 = v11;
  }

  return v11;
}

- (NSString)indexKey
{
  return self->_indexKey;
}

+ (id)equivalenceStrategyWithString:(id)a3
{
  id v3;
  _CNContactEmailAddressEquivalence *v4;
  _CNContactEmailAddressEquivalence *v5;

  v3 = a3;
  if (objc_msgSend(v3, "_cn_containsSubstring:", CFSTR("@")))
    v4 = -[_CNContactEmailAddressEquivalence initWithEmailAddress:]([_CNContactEmailAddressEquivalence alloc], "initWithEmailAddress:", v3);
  else
    v4 = -[_CNContactPhoneNumberEquivalence initWithPhoneNumberString:]([_CNContactPhoneNumberEquivalence alloc], "initWithPhoneNumberString:", v3);
  v5 = v4;

  return v5;
}

+ (id)emailIndexKey:(id)a3
{
  return +[_CNContactEmailAddressEquivalence indexKeyForString:](_CNContactEmailAddressEquivalence, "indexKeyForString:", a3);
}

+ (id)phoneNumberIndexKey:(id)a3
{
  return +[_CNContactPhoneNumberEquivalence indexKeyForString:](_CNContactPhoneNumberEquivalence, "indexKeyForString:", a3);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("string"), self->_stringValue);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("indexKey"), self->_indexKey);
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("equivalence strategy"), self->_equivalenceStrategy);
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CNContactHandleIndexableString *v4;
  NSString *stringValue;
  NSString *indexKey;
  BOOL v7;

  v4 = (CNContactHandleIndexableString *)a3;
  v7 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (stringValue = self->_stringValue, (unint64_t)stringValue | (unint64_t)v4->_stringValue)
      && !-[NSString isEqual:](stringValue, "isEqual:")
      || (indexKey = self->_indexKey, (unint64_t)indexKey | (unint64_t)v4->_indexKey)
      && !-[NSString isEqual:](indexKey, "isEqual:"))
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_stringValue);
  return objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_indexKey) - v3 + 32 * v3 + 16337;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactHandleIndexableString)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CNContactHandleIndexableString *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CNContactHandleIndexableString initWithString:](self, "initWithString:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_stringValue, CFSTR("stringValue"));
}

- (BOOL)isEquivalentToString:(id)a3 strict:(BOOL *)a4
{
  return -[_CNContactHandleStringEquivalenceStrategy isEquivalentToString:strict:](self->_equivalenceStrategy, "isEquivalentToString:strict:", a3, a4);
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (_CNContactHandleStringEquivalenceStrategy)equivalenceStrategy
{
  return self->_equivalenceStrategy;
}

@end
