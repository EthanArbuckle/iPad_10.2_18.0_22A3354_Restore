@implementation _HKSharedSummaryTransactionQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKSharedSummaryTransactionQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setCommittedTransactions:", self->_committedTransactions);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKSharedSummaryTransactionQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKSharedSummaryTransactionQueryServerConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_HKSharedSummaryTransactionQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_committedTransactions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("committed-transactions"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKSharedSummaryTransactionQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_committedTransactions, CFSTR("committed-transactions"), v5.receiver, v5.super_class);

}

- (BOOL)committedTransactions
{
  return self->_committedTransactions;
}

- (void)setCommittedTransactions:(BOOL)a3
{
  self->_committedTransactions = a3;
}

@end
