@implementation CNContactRecentsReference

- (CNContactRecentsReference)init
{
  CNContactRecentsReference *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNContactRecentsReference)initWithRecentContactID:(id)a3 domain:(id)a4
{
  id v7;
  id v8;
  CNContactRecentsReference *v9;
  CNContactRecentsReference *v10;
  CNContactRecentsReference *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactRecentsReference;
  v9 = -[CNContactRecentsReference init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recentContactID, a3);
    objc_storeStrong((id *)&v10->_domain, a4);
    v11 = v10;
  }

  return v10;
}

- (CNContactRecentsReference)initWithCoder:(id)a3
{
  id v4;
  CNContactRecentsReference *v5;
  void *v6;
  uint64_t v7;
  NSNumber *recentContactID;
  void *v9;
  uint64_t v10;
  NSString *domain;
  CNContactRecentsReference *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNContactRecentsReference;
  v5 = -[CNContactRecentsReference init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recentContactID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    recentContactID = v5->_recentContactID;
    v5->_recentContactID = (NSNumber *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_domain"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    domain = v5->_domain;
    v5->_domain = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *recentContactID;
  id v5;

  recentContactID = self->_recentContactID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", recentContactID, CFSTR("_recentContactID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domain, CFSTR("_domain"));

}

- (NSNumber)recentContactID
{
  return self->_recentContactID;
}

- (NSString)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_recentContactID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
