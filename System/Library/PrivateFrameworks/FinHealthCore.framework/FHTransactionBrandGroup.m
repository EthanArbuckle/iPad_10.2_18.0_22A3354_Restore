@implementation FHTransactionBrandGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FHTransactionBrandGroup)initWithCoder:(id)a3
{
  id v4;
  FHTransactionBrandGroup *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FHTransactionBrandGroup;
  v5 = -[FHTransactionGroup initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_brandMuid = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("brandMuid"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FHTransactionBrandGroup;
  v4 = a3;
  -[FHTransactionGroup encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_brandMuid, CFSTR("brandMuid"), v5.receiver, v5.super_class);

}

- (FHTransactionBrandGroup)initWithBrandMuid:(unint64_t)a3 groupIdentifier:(id)a4 transactionIds:(id)a5 creditDebitType:(unint64_t)a6 category:(id)a7
{
  FHTransactionBrandGroup *v8;
  FHTransactionBrandGroup *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FHTransactionBrandGroup;
  v8 = -[FHTransactionGroup initWithGroupIdentifier:transactionIds:groupingMethod:creditDebitType:category:](&v11, sel_initWithGroupIdentifier_transactionIds_groupingMethod_creditDebitType_category_, a4, a5, 1, a6, a7);
  v9 = v8;
  if (v8)
    -[FHTransactionBrandGroup setBrandMuid:](v8, "setBrandMuid:", a3);
  return v9;
}

- (unint64_t)brandMuid
{
  return self->_brandMuid;
}

- (void)setBrandMuid:(unint64_t)a3
{
  self->_brandMuid = a3;
}

@end
