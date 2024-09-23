@implementation CNChangeHistoryClearRequest

- (CNChangeHistoryClearRequest)initWithClientIdentifier:(id)a3
{
  id v4;
  CNChangeHistoryClearRequest *v5;
  uint64_t v6;
  NSString *clientIdentifier;
  CNChangeHistoryClearRequest *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNChangeHistoryClearRequest;
  v5 = -[CNChangeHistoryClearRequest init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryClearRequest)initWithCoder:(id)a3
{
  id v4;
  CNChangeHistoryClearRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *clientIdentifier;
  void *v9;
  uint64_t v10;
  CNChangeHistoryAnchor *toChangeAnchor;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *contactChangeIDs;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *groupChangeIDs;
  void *v24;
  uint64_t v25;
  NSString *containerIdentifier;
  CNChangeHistoryClearRequest *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CNChangeHistoryClearRequest;
  v5 = -[CNChangeHistoryClearRequest init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_toChangeAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    toChangeAnchor = v5->_toChangeAnchor;
    v5->_toChangeAnchor = (CNChangeHistoryAnchor *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("_contactChangeIDs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    contactChangeIDs = v5->_contactChangeIDs;
    v5->_contactChangeIDs = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("_groupChangeIDs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    groupChangeIDs = v5->_groupChangeIDs;
    v5->_groupChangeIDs = (NSArray *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_containerIdentifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v25;

    v27 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *clientIdentifier;
  id v5;

  clientIdentifier = self->_clientIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", clientIdentifier, CFSTR("_clientIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_toChangeAnchor, CFSTR("_toChangeAnchor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactChangeIDs, CFSTR("_contactChangeIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupChangeIDs, CFSTR("_groupChangeIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerIdentifier, CFSTR("_containerIdentifier"));

}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryClearRequest clientIdentifier](self, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("clientIdentifier"), v4);

  -[CNChangeHistoryClearRequest toChangeAnchor](self, "toChangeAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("toChangeAnchor"), v6);

  -[CNChangeHistoryClearRequest contactChangeIDs](self, "contactChangeIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("contactChangeIDs"), v8);

  -[CNChangeHistoryClearRequest groupChangeIDs](self, "groupChangeIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("groupChangeIDs"), v10);

  -[CNChangeHistoryClearRequest containerIdentifier](self, "containerIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("containerIdentifier"), v12);

  objc_msgSend(v3, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (CNChangeHistoryAnchor)toChangeAnchor
{
  return self->_toChangeAnchor;
}

- (void)setToChangeAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_toChangeAnchor, a3);
}

- (NSArray)contactChangeIDs
{
  return self->_contactChangeIDs;
}

- (void)setContactChangeIDs:(id)a3
{
  objc_storeStrong((id *)&self->_contactChangeIDs, a3);
}

- (NSArray)groupChangeIDs
{
  return self->_groupChangeIDs;
}

- (void)setGroupChangeIDs:(id)a3
{
  objc_storeStrong((id *)&self->_groupChangeIDs, a3);
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containerIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_groupChangeIDs, 0);
  objc_storeStrong((id *)&self->_contactChangeIDs, 0);
  objc_storeStrong((id *)&self->_toChangeAnchor, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
