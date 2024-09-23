@implementation MSASComment

- (MSASComment)init
{
  MSASComment *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSASComment;
  v2 = -[MSASComment init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "MSMakeUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASComment setGUID:](v2, "setGUID:", v3);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASComment setTimestamp:](v2, "setTimestamp:", v4);

    -[MSASComment setID:](v2, "setID:", 0xFFFFFFFFLL);
  }
  return v2;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MSASComment GUID](self, "GUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MSASComment GUID](self, "GUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "GUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MSASComment;
    v7 = -[MSASComment isEqual:](&v9, sel_isEqual_, v4);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *GUID;
  NSDate *timestamp;
  NSDate *clientTimestamp;
  NSString *content;
  NSString *personID;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  GUID = self->_GUID;
  v18 = v4;
  if (GUID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", GUID, CFSTR("GUID"));
    v4 = v18;
  }
  objc_msgSend(v4, "encodeInt:forKey:", self->_ID, CFSTR("ID"));
  timestamp = self->_timestamp;
  if (timestamp)
    objc_msgSend(v18, "encodeObject:forKey:", timestamp, CFSTR("timestamp"));
  clientTimestamp = self->_clientTimestamp;
  if (clientTimestamp)
    objc_msgSend(v18, "encodeObject:forKey:", clientTimestamp, CFSTR("clientTimestamp"));
  objc_msgSend(v18, "encodeBool:forKey:", self->_isLike, CFSTR("isLike"));
  objc_msgSend(v18, "encodeBool:forKey:", self->_isCaption, CFSTR("isCaption"));
  objc_msgSend(v18, "encodeBool:forKey:", self->_isBatchComment, CFSTR("isBatchComment"));
  objc_msgSend(v18, "encodeBool:forKey:", self->_isMine, CFSTR("isMine"));
  objc_msgSend(v18, "encodeBool:forKey:", self->_isDeletable, CFSTR("isDeletable"));
  content = self->_content;
  if (content)
    objc_msgSend(v18, "encodeObject:forKey:", content, CFSTR("content"));
  personID = self->_personID;
  if (personID)
    objc_msgSend(v18, "encodeObject:forKey:", personID, CFSTR("personID"));
  -[MSASComment firstName](self, "firstName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MSASComment firstName](self, "firstName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v11, CFSTR("firstName"));

  }
  -[MSASComment lastName](self, "lastName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MSASComment lastName](self, "lastName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v13, CFSTR("lastName"));

  }
  -[MSASComment fullName](self, "fullName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MSASComment fullName](self, "fullName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v15, CFSTR("fullName"));

  }
  -[MSASComment email](self, "email");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MSASComment email](self, "email");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v17, CFSTR("email"));

  }
}

- (MSASComment)initWithCoder:(id)a3
{
  id v4;
  MSASComment *v5;
  uint64_t v6;
  NSString *GUID;
  uint64_t v8;
  NSDate *timestamp;
  uint64_t v10;
  NSDate *clientTimestamp;
  uint64_t v12;
  NSString *content;
  uint64_t v14;
  NSString *personID;
  uint64_t v16;
  NSString *firstName;
  uint64_t v18;
  NSString *lastName;
  uint64_t v20;
  NSString *fullName;
  uint64_t v22;
  NSString *email;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MSASComment;
  v5 = -[MSASComment init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    GUID = v5->_GUID;
    v5->_GUID = (NSString *)v6;

    v5->_ID = objc_msgSend(v4, "decodeIntForKey:", CFSTR("ID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v8 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientTimestamp"));
    v10 = objc_claimAutoreleasedReturnValue();
    clientTimestamp = v5->_clientTimestamp;
    v5->_clientTimestamp = (NSDate *)v10;

    v5->_isLike = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLike"));
    v5->_isCaption = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCaption"));
    v5->_isBatchComment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBatchComment"));
    v5->_isMine = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMine"));
    v5->_isDeletable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDeletable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("content"));
    v12 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personID"));
    v14 = objc_claimAutoreleasedReturnValue();
    personID = v5->_personID;
    v5->_personID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstName"));
    v16 = objc_claimAutoreleasedReturnValue();
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastName"));
    v18 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullName"));
    v20 = objc_claimAutoreleasedReturnValue();
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("email"));
    v22 = objc_claimAutoreleasedReturnValue();
    email = v5->_email;
    v5->_email = (NSString *)v22;

  }
  return v5;
}

- (id)description
{
  int mode;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  void *v26;
  const __CFString *v27;
  _BOOL8 v28;
  const __CFString *v30;
  _BOOL8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  objc_super v37;
  objc_super v38;

  mode = os_trace_get_mode();
  v36 = (void *)MEMORY[0x1E0CB3940];
  if ((mode & 0x1000000) != 0)
  {
    v38.receiver = self;
    v38.super_class = (Class)MSASComment;
    -[MSASComment description](&v38, sel_description);
    v35 = objc_claimAutoreleasedReturnValue();
    -[MSASComment GUID](self, "GUID");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = -[MSASComment ID](self, "ID");
    -[MSASComment fullName](self, "fullName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASComment email](self, "email");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASComment personID](self, "personID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASComment timestamp](self, "timestamp");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASComment clientTimestamp](self, "clientTimestamp");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[MSASComment isLike](self, "isLike");
    v23 = -[MSASComment isCaption](self, "isCaption");
    v24 = -[MSASComment isBatchComment](self, "isBatchComment");
    v25 = -[MSASComment isMine](self, "isMine");
    -[MSASComment content](self, "content");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "length"))
      v27 = CFSTR("(Present)");
    else
      v27 = CFSTR("(No)");
    v28 = v24;
    v18 = (void *)v35;
    v31 = v25;
    v16 = (void *)v32;
    objc_msgSend(v36, "stringWithFormat:", CFSTR("%@, GUID: %@, ID: %d, name: %@ (%@ %@) server timestamp: %@, client timestamp: %@, is Like: %d, is Caption: %d, is Batch Comment: %d, is Mine: %d, content: %@"), v35, v32, v33, v6, v7, v12, v20, v21, v22, v23, v28, v31, v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v37.receiver = self;
    v37.super_class = (Class)MSASComment;
    -[MSASComment description](&v37, sel_description);
    v34 = objc_claimAutoreleasedReturnValue();
    -[MSASComment GUID](self, "GUID");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = -[MSASComment ID](self, "ID");
    -[MSASComment timestamp](self, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASComment clientTimestamp](self, "clientTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MSASComment isLike](self, "isLike");
    v9 = -[MSASComment isCaption](self, "isCaption");
    v10 = -[MSASComment isBatchComment](self, "isBatchComment");
    v11 = -[MSASComment isMine](self, "isMine");
    -[MSASComment content](self, "content");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");
    v14 = CFSTR("(Present)");
    if (!v13)
      v14 = CFSTR("(No)");
    v30 = v14;
    v15 = v9;
    v16 = (void *)v4;
    v17 = v8;
    v18 = (void *)v34;
    objc_msgSend(v36, "stringWithFormat:", CFSTR("%@, GUID: %@, ID: %d, server timestamp: %@, client timestamp: %@, is Like: %d, is Caption: %d, is Batch Comment: %d, is Mine: %d, content: %@"), v34, v4, v5, v6, v7, v17, v15, v10, v11, v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (NSString)fullName
{
  NSString *fullName;
  NSString **p_fullName;
  void *v5;
  void *v6;
  void *v7;

  p_fullName = &self->_fullName;
  fullName = self->_fullName;
  if (!fullName)
  {
    +[MSASPersonInfoManager sharedManager](MSASPersonInfoManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "fullNameForPersonID:", self->_personID);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_storeStrong((id *)p_fullName, v7);

    }
    fullName = *p_fullName;
  }
  return fullName;
}

- (NSString)firstName
{
  NSString *firstName;
  NSString **p_firstName;
  void *v5;
  void *v6;
  void *v7;

  p_firstName = &self->_firstName;
  firstName = self->_firstName;
  if (!firstName)
  {
    +[MSASPersonInfoManager sharedManager](MSASPersonInfoManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "firstNameForPersonID:", self->_personID);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_storeStrong((id *)p_firstName, v7);

    }
    firstName = *p_firstName;
  }
  return firstName;
}

- (NSString)lastName
{
  NSString *lastName;
  NSString **p_lastName;
  void *v5;
  void *v6;
  void *v7;

  p_lastName = &self->_lastName;
  lastName = self->_lastName;
  if (!lastName)
  {
    +[MSASPersonInfoManager sharedManager](MSASPersonInfoManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "lastNameForPersonID:", self->_personID);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_storeStrong((id *)p_lastName, v7);

    }
    lastName = *p_lastName;
  }
  return lastName;
}

- (NSString)email
{
  NSString *email;
  NSString **p_email;
  void *v5;
  void *v6;
  void *v7;

  p_email = &self->_email;
  email = self->_email;
  if (!email)
  {
    +[MSASPersonInfoManager sharedManager](MSASPersonInfoManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "emailForPersonID:", self->_personID);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_storeStrong((id *)p_email, v7);

    }
    email = *p_email;
  }
  return email;
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)setGUID:(id)a3
{
  objc_storeStrong((id *)&self->_GUID, a3);
}

- (int)ID
{
  return self->_ID;
}

- (void)setID:(int)a3
{
  self->_ID = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSDate)clientTimestamp
{
  return self->_clientTimestamp;
}

- (void)setClientTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_clientTimestamp, a3);
}

- (BOOL)isLike
{
  return self->_isLike;
}

- (void)setIsLike:(BOOL)a3
{
  self->_isLike = a3;
}

- (BOOL)isCaption
{
  return self->_isCaption;
}

- (void)setIsCaption:(BOOL)a3
{
  self->_isCaption = a3;
}

- (BOOL)isBatchComment
{
  return self->_isBatchComment;
}

- (void)setIsBatchComment:(BOOL)a3
{
  self->_isBatchComment = a3;
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
  objc_storeStrong((id *)&self->_personID, a3);
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (void)setFullName:(id)a3
{
  objc_storeStrong((id *)&self->_fullName, a3);
}

- (void)setEmail:(id)a3
{
  objc_storeStrong((id *)&self->_email, a3);
}

- (BOOL)isDeletable
{
  return self->_isDeletable;
}

- (void)setIsDeletable:(BOOL)a3
{
  self->_isDeletable = a3;
}

- (BOOL)isMine
{
  return self->_isMine;
}

- (void)setIsMine:(BOOL)a3
{
  self->_isMine = a3;
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_clientTimestamp, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

+ (id)comment
{
  return objc_alloc_init((Class)a1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)MSASPCommentFromProtocolDictionary:(id)a3
{
  id v3;
  MSASComment *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;

  v3 = a3;
  v4 = objc_alloc_init(MSASComment);
  objc_msgSend(v3, "objectForKey:", CFSTR("commentposition"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("commentposition"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[MSASComment setID:](v4, "setID:", objc_msgSend(v7, "intValue"));
  if ((isKindOfClass & 1) != 0)

  objc_msgSend(v3, "objectForKey:", CFSTR("comment"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("comment"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASComment setContent:](v4, "setContent:", v9);

  }
  else
  {
    -[MSASComment setContent:](v4, "setContent:", 0);
  }

  objc_msgSend(v3, "objectForKey:", CFSTR("commenttimestamp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("commenttimestamp"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_14;
    v12 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASComment setClientTimestamp:](v4, "setClientTimestamp:", v10);
  }
  else
  {
    v11 = 0;
  }

LABEL_14:
  objc_msgSend(v3, "objectForKey:", CFSTR("commentservertimestamp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v14 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("commentservertimestamp"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14 || (v15 = v14, !objc_msgSend(v14, "length")))
  {
LABEL_19:
    v15 = v11;

    if (!v15)
      goto LABEL_21;
  }
  v16 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v15, "doubleValue");
  objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASComment setTimestamp:](v4, "setTimestamp:", v17);

LABEL_21:
  objc_msgSend(v3, "objectForKey:", CFSTR("personid"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("personid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASComment setPersonID:](v4, "setPersonID:", v19);

  }
  else
  {
    -[MSASComment setPersonID:](v4, "setPersonID:", 0);
  }

  objc_msgSend(v3, "objectForKey:", CFSTR("firstname"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("firstname"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASComment setFirstName:](v4, "setFirstName:", v21);

  }
  else
  {
    -[MSASComment setFirstName:](v4, "setFirstName:", 0);
  }

  objc_msgSend(v3, "objectForKey:", CFSTR("lastname"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("lastname"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASComment setLastName:](v4, "setLastName:", v23);

  }
  else
  {
    -[MSASComment setLastName:](v4, "setLastName:", 0);
  }

  objc_msgSend(v3, "objectForKey:", CFSTR("fullname"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("fullname"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASComment setFullName:](v4, "setFullName:", v25);

  }
  else
  {
    -[MSASComment setFullName:](v4, "setFullName:", 0);
  }

  objc_msgSend(v3, "objectForKey:", CFSTR("email"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("email"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASComment setEmail:](v4, "setEmail:", v27);

  }
  else
  {
    -[MSASComment setEmail:](v4, "setEmail:", 0);
  }

  objc_msgSend(v3, "objectForKey:", CFSTR("createdbyme"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v29 = objc_opt_isKindOfClass();
  if ((v29 & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("createdbyme"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }
  -[MSASComment setIsMine:](v4, "setIsMine:", objc_msgSend(v30, "isEqualToString:", CFSTR("1")));
  if ((v29 & 1) != 0)

  objc_msgSend(v3, "objectForKey:", CFSTR("candelete"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v32 = objc_opt_isKindOfClass();
  if ((v32 & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("candelete"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
  -[MSASComment setIsDeletable:](v4, "setIsDeletable:", objc_msgSend(v33, "isEqualToString:", CFSTR("1")));
  if ((v32 & 1) != 0)

  objc_msgSend(v3, "objectForKey:", CFSTR("iscaption"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v35 = objc_opt_isKindOfClass();
  if ((v35 & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("iscaption"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  -[MSASComment setIsCaption:](v4, "setIsCaption:", objc_msgSend(v36, "isEqualToString:", CFSTR("1")));
  if ((v35 & 1) != 0)

  objc_msgSend(v3, "objectForKey:", CFSTR("isbatchcomment"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v38 = objc_opt_isKindOfClass();
  if ((v38 & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("isbatchcomment"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = 0;
  }
  -[MSASComment setIsBatchComment:](v4, "setIsBatchComment:", objc_msgSend(v39, "isEqualToString:", CFSTR("1")));
  if ((v38 & 1) != 0)

  objc_msgSend(v3, "objectForKey:", CFSTR("commenttype"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v41 = objc_opt_isKindOfClass();
  if ((v41 & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("commenttype"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = 0;
  }
  -[MSASComment setIsLike:](v4, "setIsLike:", objc_msgSend(v42, "isEqualToString:", CFSTR("1")));
  if ((v41 & 1) != 0)

  return v4;
}

@end
