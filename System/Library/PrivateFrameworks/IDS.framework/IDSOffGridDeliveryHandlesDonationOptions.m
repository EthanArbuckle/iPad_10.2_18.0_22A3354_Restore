@implementation IDSOffGridDeliveryHandlesDonationOptions

- (IDSOffGridDeliveryHandlesDonationOptions)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IDSOffGridDeliveryHandlesDonationOptions;
  return -[IDSOffGridDeliveryHandlesDonationOptions init](&v3, sel_init);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  _BOOL4 v6;
  const __CFString *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[IDSOffGridDeliveryHandlesDonationOptions priority](self, "priority");
  v6 = -[IDSOffGridDeliveryHandlesDonationOptions isInitialDonation](self, "isInitialDonation");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p priority: %ld, isInitialDonation: %@>"), v4, self, v5, v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSOffGridDeliveryHandlesDonationOptions)initWithCoder:(id)a3
{
  id v4;
  IDSOffGridDeliveryHandlesDonationOptions *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_alloc_init(IDSOffGridDeliveryHandlesDonationOptions);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("priority"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSOffGridDeliveryHandlesDonationOptions setPriority:](v5, "setPriority:", (int)objc_msgSend(v6, "intValue"));

  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isInitialDonation"));
  -[IDSOffGridDeliveryHandlesDonationOptions setIsInitialDonation:](v5, "setIsInitialDonation:", v7);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t priority;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  priority = self->_priority;
  v7 = a3;
  objc_msgSend(v4, "numberWithInteger:", priority);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("priority"));

  objc_msgSend(v7, "encodeBool:forKey:", self->_isInitialDonation, CFSTR("isInitialDonation"));
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (BOOL)isInitialDonation
{
  return self->_isInitialDonation;
}

- (void)setIsInitialDonation:(BOOL)a3
{
  self->_isInitialDonation = a3;
}

@end
