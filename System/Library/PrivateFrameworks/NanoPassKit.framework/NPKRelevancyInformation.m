@implementation NPKRelevancyInformation

- (NPKRelevancyInformation)initWithPassUniqueID:(id)a3 groupID:(id)a4 relevantText:(id)a5
{
  id v9;
  id v10;
  id v11;
  NPKRelevancyInformation *v12;
  NPKRelevancyInformation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NPKRelevancyInformation;
  v12 = -[NPKRelevancyInformation init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_passUniqueID, a3);
    objc_storeStrong((id *)&v13->_groupID, a4);
    objc_storeStrong((id *)&v13->_relevantText, a5);
  }

  return v13;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p\n\tpassUniqueID: %@\n\tgroupID: %@\n\trelevantText: %@\n>"), objc_opt_class(), self, self->_passUniqueID, self->_groupID, self->_relevantText);
}

- (NPKRelevancyInformation)initWithCoder:(id)a3
{
  id v4;
  NPKRelevancyInformation *v5;
  uint64_t v6;
  NSString *passUniqueID;
  uint64_t v8;
  NSString *groupID;
  uint64_t v10;
  NSString *relevantText;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPKRelevancyInformation;
  v5 = -[NPKRelevancyInformation init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passUniqueID"));
    v6 = objc_claimAutoreleasedReturnValue();
    passUniqueID = v5->_passUniqueID;
    v5->_passUniqueID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupID"));
    v8 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relevantText"));
    v10 = objc_claimAutoreleasedReturnValue();
    relevantText = v5->_relevantText;
    v5->_relevantText = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *passUniqueID;
  id v5;

  passUniqueID = self->_passUniqueID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", passUniqueID, CFSTR("passUniqueID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupID, CFSTR("groupID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relevantText, CFSTR("relevantText"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)passUniqueID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPassUniqueID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)relevantText
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRelevantText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantText, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
}

@end
