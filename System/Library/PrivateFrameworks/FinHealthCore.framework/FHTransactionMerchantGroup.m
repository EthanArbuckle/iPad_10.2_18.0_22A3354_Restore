@implementation FHTransactionMerchantGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FHTransactionMerchantGroup)initWithCoder:(id)a3
{
  id v4;
  FHTransactionMerchantGroup *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FHTransactionMerchantGroup;
  v5 = -[FHTransactionGroup initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_merchantMuid = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("merchantMuid"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FHTransactionMerchantGroup;
  v4 = a3;
  -[FHTransactionGroup encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_merchantMuid, CFSTR("merchantMuid"), v5.receiver, v5.super_class);

}

- (FHTransactionMerchantGroup)initWithMerchantMuid:(unint64_t)a3 groupIdentifier:(id)a4 transactionIds:(id)a5 creditDebitType:(unint64_t)a6 category:(id)a7
{
  FHTransactionMerchantGroup *v8;
  FHTransactionMerchantGroup *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FHTransactionMerchantGroup;
  v8 = -[FHTransactionGroup initWithGroupIdentifier:transactionIds:groupingMethod:creditDebitType:category:](&v11, sel_initWithGroupIdentifier_transactionIds_groupingMethod_creditDebitType_category_, a4, a5, 2, a6, a7);
  v9 = v8;
  if (v8)
    -[FHTransactionMerchantGroup setMerchantMuid:](v8, "setMerchantMuid:", a3);
  return v9;
}

- (unint64_t)merchantMuid
{
  return self->_merchantMuid;
}

- (void)setMerchantMuid:(unint64_t)a3
{
  self->_merchantMuid = a3;
}

@end
