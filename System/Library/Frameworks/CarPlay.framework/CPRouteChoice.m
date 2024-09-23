@implementation CPRouteChoice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPRouteChoice)init
{
  return -[CPRouteChoice initWithSummaryVariants:additionalInformationVariants:selectionSummaryVariants:](self, "initWithSummaryVariants:additionalInformationVariants:selectionSummaryVariants:", MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8]);
}

- (CPRouteChoice)initWithSummaryVariants:(NSArray *)summaryVariants additionalInformationVariants:(NSArray *)additionalInformationVariants selectionSummaryVariants:(NSArray *)selectionSummaryVariants
{
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  CPRouteChoice *v12;
  uint64_t v13;
  NSUUID *identifier;
  objc_super v16;

  v9 = summaryVariants;
  v10 = additionalInformationVariants;
  v11 = selectionSummaryVariants;
  v16.receiver = self;
  v16.super_class = (Class)CPRouteChoice;
  v12 = -[CPRouteChoice init](&v16, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_summaryVariants, summaryVariants);
    objc_storeStrong((id *)&v12->_additionalInformationVariants, additionalInformationVariants);
    objc_storeStrong((id *)&v12->_selectionSummaryVariants, selectionSummaryVariants);
  }

  return v12;
}

- (CPRouteChoice)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  CPRouteChoice *v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kCPRouteChoiceSummaryVariantsKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("kCPRouteChoiceAdditionalInformationVariantsKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDBCF20];
  v15 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("kCPRouteChoiceSelectionSummaryVariantsKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[CPRouteChoice initWithSummaryVariants:additionalInformationVariants:selectionSummaryVariants:](self, "initWithSummaryVariants:additionalInformationVariants:selectionSummaryVariants:", v9, v13, v17);
  -[CPRouteChoice setIdentifier:](v18, "setIdentifier:", v5);

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CPRouteChoice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPIdentifierKey"));

  -[CPRouteChoice summaryVariants](self, "summaryVariants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCPRouteChoiceSummaryVariantsKey"));

  -[CPRouteChoice additionalInformationVariants](self, "additionalInformationVariants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kCPRouteChoiceAdditionalInformationVariantsKey"));

  -[CPRouteChoice selectionSummaryVariants](self, "selectionSummaryVariants");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kCPRouteChoiceSelectionSummaryVariantsKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  -[CPRouteChoice summaryVariants](self, "summaryVariants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSummaryVariants:", v6);

  -[CPRouteChoice additionalInformationVariants](self, "additionalInformationVariants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdditionalInformationVariants:", v7);

  -[CPRouteChoice selectionSummaryVariants](self, "selectionSummaryVariants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectionSummaryVariants:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CPRouteChoice identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)CPRouteChoice;
  -[CPRouteChoice description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {identifier: %@, summaryVariants: %@, additionalInformationVariants: %@, selectionSummaryVariants %@}"), v4, self->_identifier, self->_summaryVariants, self->_additionalInformationVariants, self->_selectionSummaryVariants);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)summaryVariants
{
  return self->_summaryVariants;
}

- (void)setSummaryVariants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)selectionSummaryVariants
{
  return self->_selectionSummaryVariants;
}

- (void)setSelectionSummaryVariants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)additionalInformationVariants
{
  return self->_additionalInformationVariants;
}

- (void)setAdditionalInformationVariants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)userInfo
{
  objc_storeStrong(&self->_userInfo, userInfo);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_additionalInformationVariants, 0);
  objc_storeStrong((id *)&self->_selectionSummaryVariants, 0);
  objc_storeStrong((id *)&self->_summaryVariants, 0);
}

@end
