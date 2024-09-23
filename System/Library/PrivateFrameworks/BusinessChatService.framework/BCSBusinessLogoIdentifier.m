@implementation BCSBusinessLogoIdentifier

- (BCSBusinessLogoIdentifier)initWithBusinessId:(id)a3
{
  id v5;
  BCSBusinessLogoIdentifier *v6;
  BCSBusinessLogoIdentifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCSBusinessLogoIdentifier;
  v6 = -[BCSBusinessLogoIdentifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_businessId, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    -[BCSBusinessLogoIdentifier businessId](self, "businessId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    v7 = (void *)v4[1];
    v4[1] = v6;

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_businessId, CFSTR("BusinessId"));
}

- (BCSBusinessLogoIdentifier)initWithCoder:(id)a3
{
  id v4;
  BCSBusinessLogoIdentifier *v5;
  uint64_t v6;
  NSString *businessId;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCSBusinessLogoIdentifier;
  v5 = -[BCSBusinessLogoIdentifier init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BusinessId"));
    v6 = objc_claimAutoreleasedReturnValue();
    businessId = v5->_businessId;
    v5->_businessId = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessId, 0);
}

@end
