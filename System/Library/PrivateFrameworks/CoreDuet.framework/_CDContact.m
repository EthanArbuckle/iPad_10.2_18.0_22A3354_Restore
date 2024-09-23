@implementation _CDContact

- (_CDContact)initWithINPerson:(id)a3
{
  id v4;
  void *v5;
  _CDContact *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v33;
  void *v34;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "personHandle");
    v6 = (_CDContact *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "personHandle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      if (!v9)
        goto LABEL_5;
      objc_msgSend(v5, "personHandle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDContactResolver resolveContactIfPossibleFromContactIdentifierString:](_CDContactResolver, "resolveContactIfPossibleFromContactIdentifierString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "identifier");
      v13 = objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
LABEL_5:
        objc_msgSend(v5, "contactIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length");

        if (v15)
        {
          objc_msgSend(v5, "contactIdentifier");
          v13 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = 0;
        }
      }
      objc_msgSend(v5, "personHandle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDContactResolver normalizedStringFromContactString:](_CDContactResolver, "normalizedStringFromContactString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "_stripFZIDPrefix");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "image");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_uri");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)v13;
      if (v20)
      {
        objc_msgSend(v19, "_uri");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v19, "_identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v19, "_identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "URLWithString:", v23);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      objc_msgSend(v5, "personHandle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "type");
      objc_opt_self();
      if (v25 == 1)
        v26 = 2;
      else
        v26 = v25 == 2;
      objc_msgSend(v5, "customIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v5, "suggestionType");
      objc_opt_self();
      if (v29 == 1)
        v30 = 1;
      else
        v30 = 2 * (v29 == 2);
      v31 = 3;
      if (!v34)
        v31 = 0;
      self = -[_CDContact initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:displayImageURL:](self, "initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:displayImageURL:", v33, v26, v27, v28, v30, v34, v31, v21);

      v6 = self;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (_CDContact)contactWithIdentifier:(id)a3 type:(unint64_t)a4 displayName:(id)a5 personId:(id)a6 personIdType:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  _CDContact *v14;

  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = -[_CDContact initWithIdentifier:type:displayName:personId:personIdType:]([_CDContact alloc], "initWithIdentifier:type:displayName:personId:personIdType:", v13, a4, v12, v11, a7);

  return v14;
}

- (_CDContact)initWithIdentifier:(id)a3 type:(unint64_t)a4 displayName:(id)a5 personId:(id)a6 personIdType:(unint64_t)a7
{
  return -[_CDContact initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:](self, "initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:", a3, a4, 0, a5, 0, a6, a7);
}

- (_CDContact)initWithIdentifier:(id)a3 type:(unint64_t)a4 customIdentifier:(id)a5 displayName:(id)a6 displayType:(unint64_t)a7 personId:(id)a8 personIdType:(unint64_t)a9
{
  return -[_CDContact initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:displayImageURL:](self, "initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:displayImageURL:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (_CDContact)initWithIdentifier:(id)a3 type:(unint64_t)a4 customIdentifier:(id)a5 displayName:(id)a6 displayType:(unint64_t)a7 personId:(id)a8 personIdType:(unint64_t)a9 displayImageURL:(id)a10 participantStatus:(int64_t)a11
{
  return -[_CDContact initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:displayImageURL:participantStatus:contactIdType:](self, "initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:displayImageURL:participantStatus:contactIdType:", a3, a4, a5, a6, a7, a8, a9, 0, a11, 2);
}

- (_CDContact)initWithIdentifier:(id)a3 type:(unint64_t)a4 customIdentifier:(id)a5 displayName:(id)a6 displayType:(unint64_t)a7 personId:(id)a8 personIdType:(unint64_t)a9 displayImageURL:(id)a10
{
  return -[_CDContact initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:displayImageURL:participantStatus:](self, "initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:displayImageURL:participantStatus:", a3, a4, a5, a6, a7, a8, a9, a10, 0);
}

- (_CDContact)initWithIdentifier:(id)a3 type:(unint64_t)a4 customIdentifier:(id)a5 displayName:(id)a6 displayType:(unint64_t)a7 personId:(id)a8 personIdType:(unint64_t)a9 displayImageURL:(id)a10 participantStatus:(int64_t)a11 contactIdType:(int64_t)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  _CDContact *v21;
  _CDContact *v22;
  id v26;
  objc_super v27;

  v17 = a3;
  v18 = a5;
  v19 = a6;
  v26 = a8;
  v20 = a10;
  v27.receiver = self;
  v27.super_class = (Class)_CDContact;
  v21 = -[_CDContact init](&v27, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_identifier, a3);
    objc_storeStrong((id *)&v22->_customIdentifier, a5);
    v22->_type = a4;
    objc_storeStrong((id *)&v22->_displayName, a6);
    v22->_displayType = a7;
    objc_storeStrong((id *)&v22->_personId, a8);
    v22->_personIdType = a9;
    objc_storeStrong((id *)&v22->_displayImageURL, a10);
    v22->_participantStatus = a11;
    v22->_contactIdType = a12;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CDContact)initWithCoder:(id)a3
{
  id v4;
  _CDContact *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *customIdentifier;
  void *v12;
  uint64_t v13;
  NSString *personId;
  void *v15;
  uint64_t v16;
  NSString *displayName;
  void *v18;
  uint64_t v19;
  _CDContactStatistics *statistics;
  void *v21;
  uint64_t v22;
  NSURL *displayImageURL;
  _CDContact *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_CDContact;
  v5 = -[_CDContact init](&v26, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("customIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    customIdentifier = v5->_customIdentifier;
    v5->_customIdentifier = (NSString *)v10;

    v5->_type = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type"));
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("personId"));
    v13 = objc_claimAutoreleasedReturnValue();
    personId = v5->_personId;
    v5->_personId = (NSString *)v13;

    v5->_personIdType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("personIdType"));
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("displayName"));
    v16 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v16;

    v5->_displayType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("displayType"));
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("statistics"));
    v19 = objc_claimAutoreleasedReturnValue();
    statistics = v5->_statistics;
    v5->_statistics = (_CDContactStatistics *)v19;

    v5->_participantStatus = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("participantStatus"));
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("displayImageURL"));
    v22 = objc_claimAutoreleasedReturnValue();
    displayImageURL = v5->_displayImageURL;
    v5->_displayImageURL = (NSURL *)v22;

    v5->_contactIdType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("contactIdType"));
    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customIdentifier, CFSTR("customIdentifier"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_personId, CFSTR("personId"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_personIdType, CFSTR("personIdType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_displayType, CFSTR("displayType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_statistics, CFSTR("statistics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayImageURL, CFSTR("displayImageURL"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_participantStatus, CFSTR("participantStatus"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_contactIdType, CFSTR("contactIdType"));

}

- (id)description
{
  NSString *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  const __CFString *displayName;
  __CFString *v9;
  void *v10;
  unint64_t v11;
  id v12;
  unint64_t participantStatus;
  const __CFString *v14;
  void *v15;
  id v16;
  int64_t contactIdType;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;

  v3 = self->_identifier;
  if (self->_type)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[_CDContact typeAsCNContactPropertyKey:](_CDContact, "typeAsCNContactPropertyKey:", self->_type);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithFormat:", CFSTR("%@=%@"), v5, self->_identifier);

    v3 = (NSString *)v6;
  }
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  displayName = (const __CFString *)self->_displayName;
  v9 = &stru_1E26E9728;
  if (!displayName)
    displayName = &stru_1E26E9728;
  v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("'%@'"), displayName);
  v11 = self->_personIdType - 1;
  if (v11 <= 2)
    v9 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", off_1E26E46D0[v11], self->_personId);
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  participantStatus = self->_participantStatus;
  if (participantStatus > 7)
    v14 = CFSTR("Pending");
  else
    v14 = off_1E26E46E8[participantStatus];
  v15 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("ParticipantStatus=%@"), v14);
  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  contactIdType = self->_contactIdType;
  v18 = CFSTR("Person");
  if (contactIdType == 1)
    v18 = CFSTR("Organization");
  if (contactIdType == 2)
    v19 = CFSTR("None");
  else
    v19 = v18;
  v20 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("ContactIdType=%@"), v19);
  v21 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSURL absoluteString](self->_displayImageURL, "absoluteString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%@; %@; %@; %@; displayImageURL=%@; %@"),
                  v3,
                  v10,
                  v9,
                  v15,
                  v22,
                  v20);

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _CDContact *v4;

  v4 = -[_CDContact init](+[_CDContact allocWithZone:](_CDContact, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_identifier, self->_identifier);
  objc_storeStrong((id *)&v4->_customIdentifier, self->_customIdentifier);
  v4->_type = self->_type;
  objc_storeStrong((id *)&v4->_personId, self->_personId);
  v4->_personIdType = self->_personIdType;
  objc_storeStrong((id *)&v4->_displayName, self->_displayName);
  v4->_displayType = self->_displayType;
  objc_storeStrong((id *)&v4->_displayImageURL, self->_displayImageURL);
  v4->_participantStatus = self->_participantStatus;
  v4->_contactIdType = self->_contactIdType;
  return v4;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = self->_type - v3 + 32 * v3;
  return self->_personIdType - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  _CDContact *v4;
  _CDContact *v5;
  _CDContact *v6;
  NSString *identifier;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  char v12;
  NSString *displayName;
  NSString *v15;
  NSString *v16;

  v4 = (_CDContact *)a3;
  if (self == v4)
  {
    v12 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    goto LABEL_11;
  }
  v5 = v4;
  v6 = v5;
  if (self->_type != v5->_type || self->_personIdType != v5->_personIdType)
    goto LABEL_7;
  identifier = self->_identifier;
  v8 = v5->_identifier;
  if (identifier == v8)
  {

LABEL_13:
    displayName = self->_displayName;
    if ((displayName != 0) == (v6->_displayName == 0))
    {
      v12 = 1;
    }
    else
    {
      v15 = displayName;
      v16 = v15;
      if (v15 == v6->_displayName)
        v12 = 1;
      else
        v12 = -[NSString isEqual:](v15, "isEqual:");

    }
    goto LABEL_8;
  }
  v9 = v8;
  v10 = identifier;
  v11 = -[NSString isEqual:](v10, "isEqual:", v9);

  if ((v11 & 1) != 0)
    goto LABEL_13;
LABEL_7:
  v12 = 0;
LABEL_8:

LABEL_11:
  return v12;
}

- (BOOL)mayRepresentSamePersonAs:(id)a3
{
  id v4;
  unint64_t personIdType;
  uint64_t v6;
  unint64_t v7;
  NSString *v8;
  void *v9;
  NSString *personId;
  NSString *identifier;
  void *v12;
  NSString *v13;
  void *v15;

  v4 = a3;
  personIdType = self->_personIdType;
  v6 = objc_msgSend(v4, "personIdType");
  v7 = self->_personIdType;
  if (personIdType == v6)
  {
    if (v7)
    {
      if (!self->_personId)
      {
        LOBYTE(personId) = 0;
        goto LABEL_15;
      }
      objc_msgSend(v4, "personId");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        personId = self->_personId;
        objc_msgSend(v4, "personId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(personId) = -[NSString isEqualToString:](personId, "isEqualToString:", v9);

      }
      else
      {
        LOBYTE(personId) = 0;
      }
      goto LABEL_14;
    }
  }
  else if (v7)
  {
    goto LABEL_9;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend(v4, "identifier");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = identifier;
LABEL_12:
    v13 = v8;
LABEL_13:
    LOBYTE(personId) = objc_msgSend(v12, "isEqualToString:", v13);
LABEL_14:

    goto LABEL_15;
  }
LABEL_9:
  if (!objc_msgSend(v4, "personIdType"))
  {
    objc_msgSend(v4, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (NSString *)v12;
      v13 = self->_identifier;
      goto LABEL_13;
    }
  }
  personId = self->_displayName;
  if (personId)
  {
    objc_msgSend(v4, "displayName");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = personId;
    goto LABEL_12;
  }
LABEL_15:

  return (char)personId;
}

- (int64_t)compare:(id)a3
{
  return -[NSString compare:options:](self->_identifier, "compare:options:", *((_QWORD *)a3 + 2), 2);
}

- (void)mergeWithContact:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;

  v33 = a3;
  objc_msgSend(v33, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContact identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (!v6)
    goto LABEL_27;
  -[_CDContact displayName](self, "displayName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_33;
  v8 = (void *)v7;
  -[_CDContact identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContact displayName](self, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11)
  {
LABEL_33:
    objc_msgSend(v33, "displayName");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v33, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "displayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToString:", v15);

      if ((v16 & 1) == 0)
      {
        objc_msgSend(v33, "displayName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDContact setDisplayName:](self, "setDisplayName:", v17);

      }
    }
  }
  -[_CDContact personId](self, "personId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {

  }
  else
  {
    objc_msgSend(v33, "personId");
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (void *)v29;
      v31 = objc_msgSend(v33, "personIdType");

      if (v31)
      {
        objc_msgSend(v33, "personId");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDContact setPersonId:](self, "setPersonId:", v32);

        -[_CDContact setPersonIdType:](self, "setPersonIdType:", objc_msgSend(v33, "personIdType"));
      }
    }
  }
  if (!-[_CDContact displayType](self, "displayType"))
  {
    v19 = objc_msgSend(v33, "displayType");
    if (v19 != -[_CDContact displayType](self, "displayType"))
      -[_CDContact setDisplayType:](self, "setDisplayType:", objc_msgSend(v33, "displayType"));
  }
  -[_CDContact customIdentifier](self, "customIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    goto LABEL_15;
  objc_msgSend(v33, "customIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v33, "customIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDContact setCustomIdentifier:](self, "setCustomIdentifier:", v20);
LABEL_15:

  }
  -[_CDContact statistics](self, "statistics");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    objc_msgSend(v33, "statistics");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[_CDContact statistics](self, "statistics");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "statistics");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "updateWithStatistics:", v26);
LABEL_22:

      goto LABEL_23;
    }
  }
  -[_CDContact statistics](self, "statistics");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
LABEL_23:

    goto LABEL_24;
  }
  objc_msgSend(v33, "statistics");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v33, "statistics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    -[_CDContact setStatistics:](self, "setStatistics:", v26);
    goto LABEL_22;
  }
LABEL_24:
  v28 = -[_CDContact contactIdType](self, "contactIdType");
  if (v28 != objc_msgSend(v33, "contactIdType") && objc_msgSend(v33, "contactIdType") != 2)
    -[_CDContact setContactIdType:](self, "setContactIdType:", objc_msgSend(v33, "contactIdType"));
LABEL_27:

}

- (BOOL)mayContainPrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContact identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[_CDContact identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  -[_CDContact displayName](self, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    -[_CDContact displayName](self, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsSeparatedByCharactersInSet:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v13);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "length", (_QWORD)v23);
        if (v19 >= objc_msgSend(v4, "length"))
        {
          objc_msgSend(v18, "substringToIndex:", objc_msgSend(v4, "length"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "compare:options:", v4, 129);

          if (!v21)
          {
            LOBYTE(v15) = 1;
            goto LABEL_16;
          }
        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_16:

  return v15;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)customIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCustomIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)personId
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPersonId:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (unint64_t)personIdType
{
  return self->_personIdType;
}

- (void)setPersonIdType:(unint64_t)a3
{
  self->_personIdType = a3;
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(unint64_t)a3
{
  self->_displayType = a3;
}

- (int64_t)participantStatus
{
  return self->_participantStatus;
}

- (void)setParticipantStatus:(int64_t)a3
{
  self->_participantStatus = a3;
}

- (NSURL)displayImageURL
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDisplayImageURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (int64_t)contactIdType
{
  return self->_contactIdType;
}

- (void)setContactIdType:(int64_t)a3
{
  self->_contactIdType = a3;
}

- (_CDContactStatistics)statistics
{
  return (_CDContactStatistics *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStatistics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_displayImageURL, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_personId, 0);
  objc_storeStrong((id *)&self->_customIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)predicateForContactWithType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("type == %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForContactWithIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier == %@"), a3);
}

+ (id)predicateForContactWithDisplayName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("displayName == %@"), a3);
}

+ (id)predicateForContactWithPersonId:(id)a3 personIdType:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("personIdType == %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("personId == %@"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3528];
    v14[0] = v8;
    v14[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }

  return v8;
}

+ (id)predicateForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForContactWithType:", objc_msgSend(v4, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_msgSend(v4, "personId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForContactWithPersonId:personIdType:", v7, objc_msgSend(v4, "personIdType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForContactWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v10);

  objc_msgSend(v4, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    objc_msgSend(v4, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForContactWithDisplayName:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)predicateForContactWithContactIdType:(int64_t *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("contactIdType == %@"), a3);
}

- (_CDContact)initWithContactProperty:(id)a3
{

  return 0;
}

- (id)contactProperty
{
  return 0;
}

- (id)contactPropertyWithMechanismHint:(int64_t)a3
{
  return 0;
}

- (id)contactPropertyWithOptionalMechanismHint:(int64_t *)a3
{
  return 0;
}

+ (id)contactPropertiesForContacts:(id)a3
{
  return 0;
}

+ (id)contactPropertiesForContacts:(id)a3 mechanismHints:(id)a4
{
  return 0;
}

+ (id)_contactPropertiesForContacts:(id)a3 mechanismHints:(id)a4
{
  return 0;
}

+ (id)_CDValueForContactProperty:(id)a3
{
  return 0;
}

+ (_CDContact)contactWithIdentifier:(id)a3 identifierType:(id)a4
{
  return +[_CDContact contactWithIdentifier:identifierType:personId:personIdType:](_CDContact, "contactWithIdentifier:identifierType:personId:personIdType:", a3, a4, 0, 0);
}

+ (_CDContact)contactWithIdentifier:(id)a3 identifierType:(id)a4 personId:(id)a5 personIdType:(unint64_t)a6
{
  return +[_CDContact contactWithIdentifier:identifierType:displayName:personId:personIdType:](_CDContact, "contactWithIdentifier:identifierType:displayName:personId:personIdType:", a3, a4, 0, a5, a6);
}

+ (_CDContact)contactWithIdentifier:(id)a3 identifierType:(id)a4 displayName:(id)a5 personId:(id)a6 personIdType:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;

  v11 = a6;
  v12 = a5;
  v13 = a3;
  +[_CDContact contactWithIdentifier:type:displayName:personId:personIdType:](_CDContact, "contactWithIdentifier:type:displayName:personId:personIdType:", v13, +[_CDContact typeFromString:](_CDContact, "typeFromString:", a4), v12, v11, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (_CDContact *)v14;
}

- (NSString)identifierType
{
  return (NSString *)+[_CDContact typeAsCNContactPropertyKey:](_CDContact, "typeAsCNContactPropertyKey:", -[_CDContact type](self, "type"));
}

- (void)setIdentifierType:(id)a3
{
  -[_CDContact setType:](self, "setType:", +[_CDContact typeFromString:](_CDContact, "typeFromString:", a3));
}

+ (id)normalizedStringKey:(id)a3
{
  __CFString *v3;

  objc_msgSend(a3, "lowercaseString");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = CFSTR("<NIL>");
  return v3;
}

+ (unint64_t)typeFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  _QWORD block[5];

  v4 = a3;
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52___CDContact_BackwardCompatability__typeFromString___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (typeFromString__onceToken != -1)
      dispatch_once(&typeFromString__onceToken, block);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "normalizedStringKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)typeFromString__lookup, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "unsignedIntegerValue");
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)typeAsCNContactPropertyKey:(unint64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 1uLL:
      getCNContactPhoneNumbersKey();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      getCNContactEmailAddressesKey();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      getCNContactInstantMessageAddressesKey();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      getCNContactGivenNameKey();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5uLL:
      getCNContactSocialProfilesKey();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6uLL:
      getCNContactUrlAddressesKey();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7uLL:
      getCNContactPostalAddressesKey();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

@end
