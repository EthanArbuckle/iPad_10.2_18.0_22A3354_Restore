@implementation HKSharingRecipientAuthorizationStoreTaskConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  HKSharingRecipientAuthorizationStoreTaskConfiguration *v4;

  v4 = objc_alloc_init(HKSharingRecipientAuthorizationStoreTaskConfiguration);
  -[HKSharingRecipientAuthorizationStoreTaskConfiguration setRecipientIdentifier:](v4, "setRecipientIdentifier:", self->_recipientIdentifier);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSharingRecipientAuthorizationStoreTaskConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKSharingRecipientAuthorizationStoreTaskConfiguration *v5;
  uint64_t v6;
  HKSharingRecipientIdentifier *recipientIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSharingRecipientAuthorizationStoreTaskConfiguration;
  v5 = -[HKTaskConfiguration initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RecipientIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    recipientIdentifier = v5->_recipientIdentifier;
    v5->_recipientIdentifier = (HKSharingRecipientIdentifier *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKSharingRecipientAuthorizationStoreTaskConfiguration;
  v4 = a3;
  -[HKTaskConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_recipientIdentifier, CFSTR("RecipientIdentifier"), v5.receiver, v5.super_class);

}

- (HKSharingRecipientIdentifier)recipientIdentifier
{
  return self->_recipientIdentifier;
}

- (void)setRecipientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientIdentifier, 0);
}

@end
