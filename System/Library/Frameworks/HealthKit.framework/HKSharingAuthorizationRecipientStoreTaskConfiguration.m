@implementation HKSharingAuthorizationRecipientStoreTaskConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  HKSharingAuthorizationRecipientStoreTaskConfiguration *v4;
  void *v5;

  v4 = objc_alloc_init(HKSharingAuthorizationRecipientStoreTaskConfiguration);
  v5 = (void *)-[NSArray copy](self->_sharingAuthorizations, "copy");
  -[HKSharingAuthorizationRecipientStoreTaskConfiguration setSharingAuthorizations:](v4, "setSharingAuthorizations:", v5);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSharingAuthorizationRecipientStoreTaskConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKSharingAuthorizationRecipientStoreTaskConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSArray *sharingAuthorizations;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKSharingAuthorizationRecipientStoreTaskConfiguration;
  v5 = -[HKTaskConfiguration initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("SharingAuthorizations"));
    v7 = objc_claimAutoreleasedReturnValue();
    sharingAuthorizations = v5->_sharingAuthorizations;
    v5->_sharingAuthorizations = (NSArray *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKSharingAuthorizationRecipientStoreTaskConfiguration;
  v4 = a3;
  -[HKTaskConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sharingAuthorizations, CFSTR("SharingAuthorizations"), v5.receiver, v5.super_class);

}

- (NSArray)sharingAuthorizations
{
  return self->_sharingAuthorizations;
}

- (void)setSharingAuthorizations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingAuthorizations, 0);
}

@end
