@implementation ExternalPurchaseLinkResponse

- (ExternalPurchaseLinkResponse)initWithSingle:(id)a3 multi:(id)a4
{
  id v7;
  id v8;
  ExternalPurchaseLinkResponse *v9;
  ExternalPurchaseLinkResponse *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[ExternalPurchaseLinkResponse init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_single, a3);
    objc_storeStrong((id *)&v10->_multi, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ExternalPurchaseLinkResponse single](self, "single");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("single"));

  -[ExternalPurchaseLinkResponse multi](self, "multi");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("multi"));

}

- (ExternalPurchaseLinkResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  ExternalPurchaseLinkResponse *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("single"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("multi"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ExternalPurchaseLinkResponse initWithSingle:multi:](self, "initWithSingle:multi:", v5, v9);
  return v10;
}

- (NSURL)single
{
  return self->_single;
}

- (NSArray)multi
{
  return self->_multi;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multi, 0);
  objc_storeStrong((id *)&self->_single, 0);
}

@end
