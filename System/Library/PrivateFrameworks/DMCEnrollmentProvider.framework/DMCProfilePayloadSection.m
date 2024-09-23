@implementation DMCProfilePayloadSection

- (DMCProfilePayloadSection)init
{
  DMCProfilePayloadSection *v2;
  uint64_t v3;
  NSMutableArray *payloadViewModels;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMCProfilePayloadSection;
  v2 = -[DMCProfilePayloadSection init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    payloadViewModels = v2->_payloadViewModels;
    v2->_payloadViewModels = (NSMutableArray *)v3;

  }
  return v2;
}

- (DMCProfilePayloadSection)initWithSectionTitle:(id)a3 footer:(id)a4 payloadViewModels:(id)a5
{
  id v9;
  id v10;
  id v11;
  DMCProfilePayloadSection *v12;
  DMCProfilePayloadSection *v13;
  uint64_t v14;
  NSMutableArray *payloadViewModels;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DMCProfilePayloadSection;
  v12 = -[DMCProfilePayloadSection init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sectionTitle, a3);
    objc_storeStrong((id *)&v13->_sectionFooter, a4);
    v14 = objc_msgSend(v11, "mutableCopy");
    payloadViewModels = v13->_payloadViewModels;
    v13->_payloadViewModels = (NSMutableArray *)v14;

  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[DMCProfilePayloadSection sectionTitle](self, "sectionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sectionTitle"));

  -[DMCProfilePayloadSection sectionFooter](self, "sectionFooter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sectionFooter"));

  -[DMCProfilePayloadSection payloadViewModels](self, "payloadViewModels");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("payloadViewModels"));

}

- (DMCProfilePayloadSection)initWithCoder:(id)a3
{
  id v4;
  DMCProfilePayloadSection *v5;
  void *v6;
  uint64_t v7;
  NSString *sectionTitle;
  void *v9;
  uint64_t v10;
  NSString *sectionFooter;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSMutableArray *payloadViewModels;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DMCProfilePayloadSection;
  v5 = -[DMCProfilePayloadSection init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("sectionTitle"));
    v7 = objc_claimAutoreleasedReturnValue();
    sectionTitle = v5->_sectionTitle;
    v5->_sectionTitle = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("sectionFooter"));
    v10 = objc_claimAutoreleasedReturnValue();
    sectionFooter = v5->_sectionFooter;
    v5->_sectionFooter = (NSString *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("payloadViewModels"));
    v15 = objc_claimAutoreleasedReturnValue();
    payloadViewModels = v5->_payloadViewModels;
    v5->_payloadViewModels = (NSMutableArray *)v15;

  }
  return v5;
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
  objc_storeStrong((id *)&self->_sectionTitle, a3);
}

- (NSString)sectionFooter
{
  return self->_sectionFooter;
}

- (void)setSectionFooter:(id)a3
{
  objc_storeStrong((id *)&self->_sectionFooter, a3);
}

- (NSMutableArray)payloadViewModels
{
  return self->_payloadViewModels;
}

- (void)setPayloadViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_payloadViewModels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadViewModels, 0);
  objc_storeStrong((id *)&self->_sectionFooter, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
}

@end
