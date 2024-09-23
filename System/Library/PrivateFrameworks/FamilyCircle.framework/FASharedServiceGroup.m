@implementation FASharedServiceGroup

- (FASharedServiceGroup)initWithServerResponse:(id)a3
{
  id v4;
  FASharedServiceGroup *v5;
  uint64_t v6;
  NSString *headerText;
  uint64_t v8;
  NSString *footerText;
  uint64_t v10;
  NSNumber *groupID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FASharedServiceGroup;
  v5 = -[FASharedServiceGroup init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupHeaderText"));
    v6 = objc_claimAutoreleasedReturnValue();
    headerText = v5->_headerText;
    v5->_headerText = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupFooterText"));
    v8 = objc_claimAutoreleasedReturnValue();
    footerText = v5->_footerText;
    v5->_footerText = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupID"));
    v10 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSNumber *)v10;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FASharedServiceGroup headerText](self, "headerText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FASharedServiceGroup groupID](self, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FASharedServiceGroup services](self, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Header:%@ ID:%@ Services Count:%lu"), v4, v5, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)headerText
{
  return self->_headerText;
}

- (void)setHeaderText:(id)a3
{
  objc_storeStrong((id *)&self->_headerText, a3);
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
  objc_storeStrong((id *)&self->_footerText, a3);
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
  objc_storeStrong((id *)&self->_services, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
}

@end
