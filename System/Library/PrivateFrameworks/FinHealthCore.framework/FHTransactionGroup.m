@implementation FHTransactionGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FHTransactionGroup)initWithCoder:(id)a3
{
  id v4;
  FHTransactionGroup *v5;
  uint64_t v6;
  NSString *groupIdentifier;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *transactionIds;
  uint64_t v13;
  NSString *category;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FHTransactionGroup;
  v5 = -[FHTransactionGroup init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("transactionIds"));
    v11 = objc_claimAutoreleasedReturnValue();
    transactionIds = v5->_transactionIds;
    v5->_transactionIds = (NSArray *)v11;

    v5->_groupingMethod = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("groupingMethod"));
    v5->_creditDebitType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("creditDebitType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
    v13 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *groupIdentifier;
  id v5;

  groupIdentifier = self->_groupIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", groupIdentifier, CFSTR("groupIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionIds, CFSTR("transactionIds"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_groupingMethod, CFSTR("groupingMethod"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_creditDebitType, CFSTR("creditDebitType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_category, CFSTR("category"));

}

- (FHTransactionGroup)initWithGroupIdentifier:(id)a3 transactionIds:(id)a4 groupingMethod:(unint64_t)a5 creditDebitType:(unint64_t)a6 category:(id)a7
{
  id v13;
  id v14;
  id v15;
  FHTransactionGroup *v16;
  FHTransactionGroup *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)FHTransactionGroup;
  v16 = -[FHTransactionGroup init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_groupIdentifier, a3);
    objc_storeStrong((id *)&v17->_transactionIds, a4);
    v17->_groupingMethod = a5;
    v17->_creditDebitType = a6;
    objc_storeStrong((id *)&v17->_category, a7);
  }

  return v17;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSArray)transactionIds
{
  return self->_transactionIds;
}

- (void)setTransactionIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)groupingMethod
{
  return self->_groupingMethod;
}

- (void)setGroupingMethod:(unint64_t)a3
{
  self->_groupingMethod = a3;
}

- (unint64_t)creditDebitType
{
  return self->_creditDebitType;
}

- (void)setCreditDebitType:(unint64_t)a3
{
  self->_creditDebitType = a3;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_transactionIds, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end
