@implementation MSASAlbum

- (NSString)ownerFullName
{
  NSString *ownerFullName;
  NSString **p_ownerFullName;
  void *v5;
  void *v6;
  void *v7;

  p_ownerFullName = &self->_ownerFullName;
  ownerFullName = self->_ownerFullName;
  if (!ownerFullName)
  {
    +[MSASPersonInfoManager sharedManager](MSASPersonInfoManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "fullNameForPersonID:", self->_ownerPersonID);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_storeStrong((id *)p_ownerFullName, v7);

    }
    ownerFullName = *p_ownerFullName;
  }
  return ownerFullName;
}

- (NSString)ownerFirstName
{
  NSString *ownerFirstName;
  NSString **p_ownerFirstName;
  void *v5;
  void *v6;
  void *v7;

  p_ownerFirstName = &self->_ownerFirstName;
  ownerFirstName = self->_ownerFirstName;
  if (!ownerFirstName)
  {
    +[MSASPersonInfoManager sharedManager](MSASPersonInfoManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "firstNameForPersonID:", self->_ownerPersonID);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_storeStrong((id *)p_ownerFirstName, v7);

    }
    ownerFirstName = *p_ownerFirstName;
  }
  return ownerFirstName;
}

- (NSString)ownerLastName
{
  NSString *ownerLastName;
  NSString **p_ownerLastName;
  void *v5;
  void *v6;
  void *v7;

  p_ownerLastName = &self->_ownerLastName;
  ownerLastName = self->_ownerLastName;
  if (!ownerLastName)
  {
    +[MSASPersonInfoManager sharedManager](MSASPersonInfoManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "lastNameForPersonID:", self->_ownerPersonID);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_storeStrong((id *)p_ownerLastName, v7);

    }
    ownerLastName = *p_ownerLastName;
  }
  return ownerLastName;
}

- (NSString)ownerEmail
{
  NSString *ownerEmail;
  NSString **p_ownerEmail;
  void *v5;
  void *v6;
  void *v7;

  p_ownerEmail = &self->_ownerEmail;
  ownerEmail = self->_ownerEmail;
  if (!ownerEmail)
  {
    +[MSASPersonInfoManager sharedManager](MSASPersonInfoManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "emailForPersonID:", self->_ownerPersonID);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_storeStrong((id *)p_ownerEmail, v7);

    }
    ownerEmail = *p_ownerEmail;
  }
  return ownerEmail;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *GUID;
  void *v6;
  BOOL v7;
  BOOL v9;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    GUID = self->_GUID;
    objc_msgSend(v4, "GUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[NSString isEqualToString:](GUID, "isEqualToString:", v6);
    return v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MSASAlbum;
    v9 = -[MSASAlbum isEqual:](&v10, sel_isEqual_, v4);

    return v9;
  }
}

- (unint64_t)hash
{
  return -[NSString hash](self->_GUID, "hash");
}

- (BOOL)useForeignCtag
{
  return -[MSASAlbum relationshipState](self, "relationshipState") != 0;
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[MSASAlbum metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MSASAlbum metadata](self, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v10)
    objc_msgSend(v9, "setObject:forKey:", v10, v6);
  else
    objc_msgSend(v9, "removeObjectForKey:", v6);
  -[MSASAlbum setMetadata:](self, "setMetadata:", v9);

}

- (id)metadataValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MSASAlbum metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  +[MSASAlbum albumWithAlbum:](MSASAlbum, "albumWithAlbum:", self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MSASAlbum)initWithCoder:(id)a3
{
  id v4;
  MSASAlbum *v5;
  uint64_t v6;
  NSString *ownerEmail;
  uint64_t v8;
  NSString *ownerPersonID;
  uint64_t v10;
  NSString *ownerFullName;
  uint64_t v12;
  NSString *ownerFirstName;
  uint64_t v14;
  NSString *ownerLastName;
  uint64_t v16;
  NSDate *subscriptionDate;
  uint64_t v18;
  NSString *GUID;
  uint64_t v20;
  NSString *ctag;
  uint64_t v22;
  NSString *foreignCtag;
  uint64_t v24;
  NSString *URLString;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSDictionary *metadata;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id context;
  uint64_t v41;
  NSString *publicURLString;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)MSASAlbum;
  v5 = -[MSASAlbum init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerEmail"));
    v6 = objc_claimAutoreleasedReturnValue();
    ownerEmail = v5->_ownerEmail;
    v5->_ownerEmail = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerPersonID"));
    v8 = objc_claimAutoreleasedReturnValue();
    ownerPersonID = v5->_ownerPersonID;
    v5->_ownerPersonID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerFullName"));
    v10 = objc_claimAutoreleasedReturnValue();
    ownerFullName = v5->_ownerFullName;
    v5->_ownerFullName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerFirstName"));
    v12 = objc_claimAutoreleasedReturnValue();
    ownerFirstName = v5->_ownerFirstName;
    v5->_ownerFirstName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerLastName"));
    v14 = objc_claimAutoreleasedReturnValue();
    ownerLastName = v5->_ownerLastName;
    v5->_ownerLastName = (NSString *)v14;

    v5->_ownerIsWhitelisted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ownerIsWhitelisted"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subscriptionDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    subscriptionDate = v5->_subscriptionDate;
    v5->_subscriptionDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GUID"));
    v18 = objc_claimAutoreleasedReturnValue();
    GUID = v5->_GUID;
    v5->_GUID = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ctag"));
    v20 = objc_claimAutoreleasedReturnValue();
    ctag = v5->_ctag;
    v5->_ctag = (NSString *)v20;

    v5->_relationshipState = objc_msgSend(v4, "decodeIntForKey:", CFSTR("relationshipState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("foreignCtag"));
    v22 = objc_claimAutoreleasedReturnValue();
    foreignCtag = v5->_foreignCtag;
    v5->_foreignCtag = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("urlString"));
    v24 = objc_claimAutoreleasedReturnValue();
    URLString = v5->_URLString;
    v5->_URLString = (NSString *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    v31 = objc_opt_class();
    v32 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, v28, v29, v30, v31, v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("metadata"));
    v34 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v34;

    v36 = (void *)MEMORY[0x1E0C99E60];
    v37 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("context"));
    v39 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (id)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicURLString"));
    v41 = objc_claimAutoreleasedReturnValue();
    publicURLString = v5->_publicURLString;
    v5->_publicURLString = (NSString *)v41;

    v5->_isFamilySharedAlbum = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("familySharedAlbum"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *ownerPersonID;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *GUID;
  NSString *ctag;
  NSString *foreignCtag;
  NSString *URLString;
  NSDictionary *metadata;
  void *v22;
  id context;
  NSString *publicURLString;
  id v25;

  v4 = a3;
  ownerPersonID = self->_ownerPersonID;
  v25 = v4;
  if (ownerPersonID)
    objc_msgSend(v4, "encodeObject:forKey:", ownerPersonID, CFSTR("ownerPersonID"));
  -[MSASAlbum ownerFirstName](self, "ownerFirstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MSASAlbum ownerFirstName](self, "ownerFirstName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "encodeObject:forKey:", v7, CFSTR("ownerFirstName"));

  }
  -[MSASAlbum ownerLastName](self, "ownerLastName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MSASAlbum ownerLastName](self, "ownerLastName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "encodeObject:forKey:", v9, CFSTR("ownerLastName"));

  }
  -[MSASAlbum ownerFullName](self, "ownerFullName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MSASAlbum ownerFullName](self, "ownerFullName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "encodeObject:forKey:", v11, CFSTR("ownerFullName"));

  }
  -[MSASAlbum ownerEmail](self, "ownerEmail");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MSASAlbum ownerEmail](self, "ownerEmail");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "encodeObject:forKey:", v13, CFSTR("ownerEmail"));

  }
  -[MSASAlbum subscriptionDate](self, "subscriptionDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v25;
  if (v14)
  {
    -[MSASAlbum subscriptionDate](self, "subscriptionDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "encodeObject:forKey:", v16, CFSTR("subscriptionDate"));

    v15 = v25;
  }
  objc_msgSend(v15, "encodeBool:forKey:", self->_ownerIsWhitelisted, CFSTR("ownerIsWhitelisted"));
  GUID = self->_GUID;
  if (GUID)
    objc_msgSend(v25, "encodeObject:forKey:", GUID, CFSTR("GUID"));
  ctag = self->_ctag;
  if (ctag)
    objc_msgSend(v25, "encodeObject:forKey:", ctag, CFSTR("ctag"));
  objc_msgSend(v25, "encodeInt:forKey:", self->_relationshipState, CFSTR("relationshipState"));
  foreignCtag = self->_foreignCtag;
  if (foreignCtag)
    objc_msgSend(v25, "encodeObject:forKey:", foreignCtag, CFSTR("foreignCtag"));
  URLString = self->_URLString;
  if (URLString)
    objc_msgSend(v25, "encodeObject:forKey:", URLString, CFSTR("urlString"));
  metadata = self->_metadata;
  v22 = v25;
  if (metadata)
  {
    objc_msgSend(v25, "encodeObject:forKey:", metadata, CFSTR("metadata"));
    v22 = v25;
  }
  context = self->_context;
  if (context)
  {
    objc_msgSend(v25, "encodeObject:forKey:", context, CFSTR("context"));
    v22 = v25;
  }
  publicURLString = self->_publicURLString;
  if (publicURLString)
  {
    objc_msgSend(v25, "encodeObject:forKey:", publicURLString, CFSTR("publicURLString"));
    v22 = v25;
  }
  objc_msgSend(v22, "encodeBool:forKey:", self->_isFamilySharedAlbum, CFSTR("familySharedAlbum"));

}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSASAlbum;
  -[MSASAlbum description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_GUID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" GUID: %@"), self->_GUID);
  if (_thePlatform && objc_msgSend((id)_thePlatform, "shouldLogAtLevel:", 7))
  {
    if (self->_ownerFullName && (os_trace_get_mode() & 0x1000000) != 0)
      objc_msgSend(v4, "appendFormat:", CFSTR(" owner: %@ (%@ %@)"), self->_ownerFullName, self->_ownerEmail, self->_ownerPersonID);
    objc_msgSend(v4, "appendFormat:", CFSTR(" owner is whitelisted: %d"), self->_ownerIsWhitelisted);
    if (self->_subscriptionDate)
      objc_msgSend(v4, "appendFormat:", CFSTR(" subscription date: %@"), self->_subscriptionDate);
    if (self->_ctag)
      objc_msgSend(v4, "appendFormat:", CFSTR(" ctag: %@"), self->_ctag);
    objc_msgSend(v4, "appendFormat:", CFSTR(" Relationship: %d"), self->_relationshipState);
    if (self->_foreignCtag)
      objc_msgSend(v4, "appendFormat:", CFSTR(" foreign ctag: %@"), self->_foreignCtag);
    if (self->_URLString)
      objc_msgSend(v4, "appendFormat:", CFSTR(" URL: %@"), self->_URLString);
    if (-[NSDictionary count](self->_metadata, "count") && (os_trace_get_mode() & 0x1000000) != 0)
      objc_msgSend(v4, "appendFormat:", CFSTR(" metadata: %@"), self->_metadata);
    if (self->_publicURLString)
      objc_msgSend(v4, "appendFormat:", CFSTR(" Public URL: %@"), self->_publicURLString);
    if (self->_isFamilySharedAlbum)
      objc_msgSend(v4, "appendString:", CFSTR(" Family shared album"));
  }
  return v4;
}

- (void)setOwnerEmail:(id)a3
{
  objc_storeStrong((id *)&self->_ownerEmail, a3);
}

- (NSString)ownerPersonID
{
  return self->_ownerPersonID;
}

- (void)setOwnerPersonID:(id)a3
{
  objc_storeStrong((id *)&self->_ownerPersonID, a3);
}

- (void)setOwnerFullName:(id)a3
{
  objc_storeStrong((id *)&self->_ownerFullName, a3);
}

- (void)setOwnerFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_ownerFirstName, a3);
}

- (void)setOwnerLastName:(id)a3
{
  objc_storeStrong((id *)&self->_ownerLastName, a3);
}

- (BOOL)ownerIsWhitelisted
{
  return self->_ownerIsWhitelisted;
}

- (void)setOwnerIsWhitelisted:(BOOL)a3
{
  self->_ownerIsWhitelisted = a3;
}

- (NSDate)subscriptionDate
{
  return self->_subscriptionDate;
}

- (void)setSubscriptionDate:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionDate, a3);
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)setGUID:(id)a3
{
  objc_storeStrong((id *)&self->_GUID, a3);
}

- (NSString)ctag
{
  return self->_ctag;
}

- (void)setCtag:(id)a3
{
  objc_storeStrong((id *)&self->_ctag, a3);
}

- (int)relationshipState
{
  return self->_relationshipState;
}

- (void)setRelationshipState:(int)a3
{
  self->_relationshipState = a3;
}

- (NSString)foreignCtag
{
  return self->_foreignCtag;
}

- (void)setForeignCtag:(id)a3
{
  objc_storeStrong((id *)&self->_foreignCtag, a3);
}

- (NSString)URLString
{
  return self->_URLString;
}

- (void)setURLString:(id)a3
{
  objc_storeStrong((id *)&self->_URLString, a3);
}

- (NSString)publicURLString
{
  return self->_publicURLString;
}

- (void)setPublicURLString:(id)a3
{
  objc_storeStrong((id *)&self->_publicURLString, a3);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (BOOL)isFamilySharedAlbum
{
  return self->_isFamilySharedAlbum;
}

- (void)setIsFamilySharedAlbum:(BOOL)a3
{
  self->_isFamilySharedAlbum = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_publicURLString, 0);
  objc_storeStrong((id *)&self->_URLString, 0);
  objc_storeStrong((id *)&self->_foreignCtag, 0);
  objc_storeStrong((id *)&self->_ctag, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_subscriptionDate, 0);
  objc_storeStrong((id *)&self->_ownerLastName, 0);
  objc_storeStrong((id *)&self->_ownerFirstName, 0);
  objc_storeStrong((id *)&self->_ownerFullName, 0);
  objc_storeStrong((id *)&self->_ownerPersonID, 0);
  objc_storeStrong((id *)&self->_ownerEmail, 0);
}

+ (id)album
{
  return objc_alloc_init(MSASAlbum);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MSASAlbum)albumWithAlbum:(id)a3
{
  id v3;
  MSASAlbum *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v4 = objc_alloc_init(MSASAlbum);
  objc_msgSend(v3, "ownerEmail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAlbum setOwnerEmail:](v4, "setOwnerEmail:", v5);

  objc_msgSend(v3, "ownerPersonID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAlbum setOwnerPersonID:](v4, "setOwnerPersonID:", v6);

  objc_msgSend(v3, "ownerFullName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAlbum setOwnerFullName:](v4, "setOwnerFullName:", v7);

  objc_msgSend(v3, "ownerFirstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAlbum setOwnerFirstName:](v4, "setOwnerFirstName:", v8);

  objc_msgSend(v3, "ownerLastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAlbum setOwnerLastName:](v4, "setOwnerLastName:", v9);

  -[MSASAlbum setOwnerIsWhitelisted:](v4, "setOwnerIsWhitelisted:", objc_msgSend(v3, "ownerIsWhitelisted"));
  objc_msgSend(v3, "subscriptionDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAlbum setSubscriptionDate:](v4, "setSubscriptionDate:", v10);

  objc_msgSend(v3, "GUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAlbum setGUID:](v4, "setGUID:", v11);

  objc_msgSend(v3, "ctag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAlbum setCtag:](v4, "setCtag:", v12);

  -[MSASAlbum setRelationshipState:](v4, "setRelationshipState:", objc_msgSend(v3, "relationshipState"));
  objc_msgSend(v3, "foreignCtag");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAlbum setForeignCtag:](v4, "setForeignCtag:", v13);

  objc_msgSend(v3, "URLString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAlbum setURLString:](v4, "setURLString:", v14);

  objc_msgSend(v3, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAlbum setMetadata:](v4, "setMetadata:", v15);

  objc_msgSend(v3, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAlbum setContext:](v4, "setContext:", v16);

  v17 = objc_msgSend(v3, "isFamilySharedAlbum");
  -[MSASAlbum setIsFamilySharedAlbum:](v4, "setIsFamilySharedAlbum:", v17);
  return v4;
}

@end
