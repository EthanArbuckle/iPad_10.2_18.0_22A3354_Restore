@implementation FHTransactionDescriptionGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FHTransactionDescriptionGroup)initWithCoder:(id)a3
{
  id v4;
  FHTransactionDescriptionGroup *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FHTransactionDescriptionGroup;
  v5 = -[FHTransactionGroup initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_exemplarDescription = (NSString *)(id)objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exemplarDescription"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FHTransactionDescriptionGroup;
  v4 = a3;
  -[FHTransactionGroup encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_exemplarDescription, CFSTR("exemplarDescription"), v5.receiver, v5.super_class);

}

- (FHTransactionDescriptionGroup)initWithExemplarDescription:(id)a3 groupIdentifier:(id)a4 transactionIds:(id)a5 creditDebitType:(unint64_t)a6 category:(id)a7
{
  id v12;
  FHTransactionDescriptionGroup *v13;
  FHTransactionDescriptionGroup *v14;
  objc_super v16;

  v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FHTransactionDescriptionGroup;
  v13 = -[FHTransactionGroup initWithGroupIdentifier:transactionIds:groupingMethod:creditDebitType:category:](&v16, sel_initWithGroupIdentifier_transactionIds_groupingMethod_creditDebitType_category_, a4, a5, 3, a6, a7);
  v14 = v13;
  if (v13)
    -[FHTransactionDescriptionGroup setExemplarDescription:](v13, "setExemplarDescription:", v12);

  return v14;
}

- (NSString)exemplarDescription
{
  return self->_exemplarDescription;
}

- (void)setExemplarDescription:(id)a3
{
  self->_exemplarDescription = (NSString *)a3;
}

@end
