@implementation HKSharedSummaryTransactionBuilderTaskConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSharedSummaryTransactionBuilderTaskConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKSharedSummaryTransactionBuilderTaskConfiguration *v5;
  uint64_t v6;
  NSUUID *transactionUUID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSharedSummaryTransactionBuilderTaskConfiguration;
  v5 = -[HKTaskConfiguration initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    transactionUUID = v5->_transactionUUID;
    v5->_transactionUUID = (NSUUID *)v6;

    v5->_allowCommitted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowCommitted"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKSharedSummaryTransactionBuilderTaskConfiguration;
  v4 = a3;
  -[HKTaskConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionUUID, CFSTR("transactionUUID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowCommitted, CFSTR("allowCommitted"));

}

- (NSUUID)transactionUUID
{
  return self->_transactionUUID;
}

- (void)setTransactionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)allowCommitted
{
  return self->_allowCommitted;
}

- (void)setAllowCommitted:(BOOL)a3
{
  self->_allowCommitted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionUUID, 0);
}

@end
