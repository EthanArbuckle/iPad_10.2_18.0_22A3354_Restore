@implementation MSASSharingRelationship

- (MSASSharingRelationship)init
{
  MSASSharingRelationship *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSASSharingRelationship;
  result = -[MSASSharingRelationship init](&v3, sel_init);
  if (result)
    result->_isMine = 0;
  return result;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_GUID, "hash");
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
    -[MSASSharingRelationship GUID](self, "GUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "GUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MSASSharingRelationship;
    v7 = -[MSASSharingRelationship isEqual:](&v9, sel_isEqual_, v4);
  }

  return v7;
}

- (id)_fullName
{
  return self->_fullName;
}

- (BOOL)isEqualToSharingRelationship:(id)a3
{
  id v4;
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
  void *v17;
  void *v18;
  _BOOL4 v19;
  _BOOL4 v20;
  int v21;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v4 = a3;
  -[MSASSharingRelationship GUID](self, "GUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "GUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (MSObjectsAreEquivalent(v5, v6))
  {
    -[MSASSharingRelationship albumGUID](self, "albumGUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "albumGUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (MSObjectsAreEquivalent(v7, v8))
    {
      -[MSASSharingRelationship email](self, "email");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "email");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (MSObjectsAreEquivalent(v9, v10))
      {
        -[MSASSharingRelationship emails](self, "emails");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "emails");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (MSObjectsAreEquivalent(v11, v12))
        {
          v34 = v11;
          -[MSASSharingRelationship phones](self, "phones");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "phones");
          v36 = v13;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (MSObjectsAreEquivalent(v13, v35))
          {
            -[MSASSharingRelationship firstName](self, "firstName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "firstName");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v14;
            if (MSObjectsAreEquivalent(v14, v32))
            {
              -[MSASSharingRelationship lastName](self, "lastName");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "lastName");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v15;
              if (MSObjectsAreEquivalent(v15, v30))
              {
                -[MSASSharingRelationship _fullName](self, "_fullName");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "_fullName");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = v16;
                if (MSObjectsAreEquivalent(v16, v28))
                {
                  -[MSASSharingRelationship personID](self, "personID");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "personID");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = v17;
                  if (MSObjectsAreEquivalent(v17, v26))
                  {
                    -[MSASSharingRelationship subscriptionDate](self, "subscriptionDate");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "subscriptionDate");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = v18;
                    v19 = MSObjectsAreEquivalent(v18, v24);
                    v11 = v34;
                    if (v19
                      && (v23 = -[MSASSharingRelationship state](self, "state"),
                          v23 == objc_msgSend(v4, "state")))
                    {
                      v20 = -[MSASSharingRelationship isMine](self, "isMine");
                      v21 = v20 ^ objc_msgSend(v4, "isMine") ^ 1;
                    }
                    else
                    {
                      LOBYTE(v21) = 0;
                    }

                  }
                  else
                  {
                    LOBYTE(v21) = 0;
                    v11 = v34;
                  }

                }
                else
                {
                  LOBYTE(v21) = 0;
                  v11 = v34;
                }

              }
              else
              {
                LOBYTE(v21) = 0;
                v11 = v34;
              }

            }
            else
            {
              LOBYTE(v21) = 0;
              v11 = v34;
            }

          }
          else
          {
            LOBYTE(v21) = 0;
            v11 = v34;
          }

        }
        else
        {
          LOBYTE(v21) = 0;
        }

      }
      else
      {
        LOBYTE(v21) = 0;
      }

    }
    else
    {
      LOBYTE(v21) = 0;
    }

  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MSASSharingRelationship *v4;
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

  v4 = objc_alloc_init(MSASSharingRelationship);
  -[MSASSharingRelationship GUID](self, "GUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASSharingRelationship setGUID:](v4, "setGUID:", v5);

  -[MSASSharingRelationship albumGUID](self, "albumGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASSharingRelationship setAlbumGUID:](v4, "setAlbumGUID:", v6);

  -[MSASSharingRelationship email](self, "email");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASSharingRelationship setEmail:](v4, "setEmail:", v7);

  -[MSASSharingRelationship emails](self, "emails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASSharingRelationship setEmails:](v4, "setEmails:", v8);

  -[MSASSharingRelationship phones](self, "phones");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASSharingRelationship setPhones:](v4, "setPhones:", v9);

  -[MSASSharingRelationship _fullName](self, "_fullName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASSharingRelationship setFullName:](v4, "setFullName:", v10);

  -[MSASSharingRelationship firstName](self, "firstName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASSharingRelationship setFirstName:](v4, "setFirstName:", v11);

  -[MSASSharingRelationship lastName](self, "lastName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASSharingRelationship setLastName:](v4, "setLastName:", v12);

  -[MSASSharingRelationship personID](self, "personID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASSharingRelationship setPersonID:](v4, "setPersonID:", v13);

  -[MSASSharingRelationship subscriptionDate](self, "subscriptionDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASSharingRelationship setSubscriptionDate:](v4, "setSubscriptionDate:", v14);

  -[MSASSharingRelationship setState:](v4, "setState:", -[MSASSharingRelationship state](self, "state"));
  -[MSASSharingRelationship setIsMine:](v4, "setIsMine:", -[MSASSharingRelationship isMine](self, "isMine"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *GUID;
  NSString *albumGUID;
  NSString *email;
  NSArray *emails;
  NSArray *phones;
  NSString *firstName;
  NSString *lastName;
  NSString *fullName;
  NSString *personID;
  NSDate *subscriptionDate;
  id v15;

  v4 = a3;
  GUID = self->_GUID;
  v15 = v4;
  if (GUID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", GUID, CFSTR("GUID"));
    v4 = v15;
  }
  albumGUID = self->_albumGUID;
  if (albumGUID)
  {
    objc_msgSend(v15, "encodeObject:forKey:", albumGUID, CFSTR("albumGUID"));
    v4 = v15;
  }
  email = self->_email;
  if (email)
  {
    objc_msgSend(v15, "encodeObject:forKey:", email, CFSTR("email"));
    v4 = v15;
  }
  emails = self->_emails;
  if (emails)
  {
    objc_msgSend(v15, "encodeObject:forKey:", emails, CFSTR("emails"));
    v4 = v15;
  }
  phones = self->_phones;
  if (phones)
  {
    objc_msgSend(v15, "encodeObject:forKey:", phones, CFSTR("phones"));
    v4 = v15;
  }
  firstName = self->_firstName;
  if (firstName)
  {
    objc_msgSend(v15, "encodeObject:forKey:", firstName, CFSTR("firstName"));
    v4 = v15;
  }
  lastName = self->_lastName;
  if (lastName)
  {
    objc_msgSend(v15, "encodeObject:forKey:", lastName, CFSTR("lastName"));
    v4 = v15;
  }
  fullName = self->_fullName;
  if (fullName)
  {
    objc_msgSend(v15, "encodeObject:forKey:", fullName, CFSTR("fullName"));
    v4 = v15;
  }
  personID = self->_personID;
  if (personID)
  {
    objc_msgSend(v15, "encodeObject:forKey:", personID, CFSTR("personID"));
    v4 = v15;
  }
  subscriptionDate = self->_subscriptionDate;
  if (subscriptionDate)
  {
    objc_msgSend(v15, "encodeObject:forKey:", subscriptionDate, CFSTR("subscriptionDate"));
    v4 = v15;
  }
  objc_msgSend(v4, "encodeInt:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v15, "encodeBool:forKey:", self->_isMine, CFSTR("isMine"));

}

- (MSASSharingRelationship)initWithCoder:(id)a3
{
  id v4;
  MSASSharingRelationship *v5;
  uint64_t v6;
  NSString *GUID;
  uint64_t v8;
  NSString *albumGUID;
  uint64_t v10;
  NSString *email;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *emails;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *phones;
  uint64_t v22;
  NSString *firstName;
  uint64_t v24;
  NSString *lastName;
  uint64_t v26;
  NSString *fullName;
  uint64_t v28;
  NSString *personID;
  uint64_t v30;
  NSDate *subscriptionDate;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MSASSharingRelationship;
  v5 = -[MSASSharingRelationship init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    GUID = v5->_GUID;
    v5->_GUID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("albumGUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    albumGUID = v5->_albumGUID;
    v5->_albumGUID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("email"));
    v10 = objc_claimAutoreleasedReturnValue();
    email = v5->_email;
    v5->_email = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("emails"));
    v15 = objc_claimAutoreleasedReturnValue();
    emails = v5->_emails;
    v5->_emails = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("phones"));
    v20 = objc_claimAutoreleasedReturnValue();
    phones = v5->_phones;
    v5->_phones = (NSArray *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstName"));
    v22 = objc_claimAutoreleasedReturnValue();
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastName"));
    v24 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullName"));
    v26 = objc_claimAutoreleasedReturnValue();
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personID"));
    v28 = objc_claimAutoreleasedReturnValue();
    personID = v5->_personID;
    v5->_personID = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subscriptionDate"));
    v30 = objc_claimAutoreleasedReturnValue();
    subscriptionDate = v5->_subscriptionDate;
    v5->_subscriptionDate = (NSDate *)v30;

    v5->_state = objc_msgSend(v4, "decodeIntForKey:", CFSTR("state"));
    v5->_isMine = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMine"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t state;
  const __CFString *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MSASSharingRelationship;
  -[MSASSharingRelationship description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_GUID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" GUID: %@"), self->_GUID);
  if (self->_albumGUID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" Album GUID: %@"), self->_albumGUID);
  if (self->_email)
    objc_msgSend(v4, "appendFormat:", CFSTR(" email: %@"), self->_email);
  if (self->_emails)
    objc_msgSend(v4, "appendFormat:", CFSTR(" emails: %@"), self->_emails);
  if (self->_phones)
    objc_msgSend(v4, "appendFormat:", CFSTR(" phones: %@"), self->_phones);
  -[MSASSharingRelationship fullName](self, "fullName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    objc_msgSend(v4, "appendFormat:", CFSTR(" Full Name: %@"), v5);
  if (self->_personID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" PersonID: %@"), self->_personID);
  if (self->_subscriptionDate)
    objc_msgSend(v4, "appendFormat:", CFSTR(" Subscription Date: %@"), self->_subscriptionDate);
  state = self->_state;
  if (state > 5)
    v8 = CFSTR("undefined");
  else
    v8 = off_1E95BC1D0[state];
  objc_msgSend(v4, "appendFormat:", CFSTR(" State: %@"), v8);
  if (self->_isMine)
    objc_msgSend(v4, "appendString:", CFSTR(" IsMine"));

  return v4;
}

- (id)redactedDescription
{
  void *v3;
  void *v4;
  uint64_t state;
  const __CFString *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSASSharingRelationship;
  -[MSASSharingRelationship description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_GUID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" GUID: %@"), self->_GUID);
  if (self->_albumGUID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" Album GUID: %@"), self->_albumGUID);
  if (self->_personID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" PersonID: %@"), self->_personID);
  if (self->_subscriptionDate)
    objc_msgSend(v4, "appendFormat:", CFSTR(" Subscription Date: %@"), self->_subscriptionDate);
  state = self->_state;
  if (state > 5)
    v6 = CFSTR("undefined");
  else
    v6 = off_1E95BC1D0[state];
  objc_msgSend(v4, "appendFormat:", CFSTR(" State: %@"), v6);
  if (self->_isMine)
    objc_msgSend(v4, "appendString:", CFSTR(" IsMine"));
  return v4;
}

- (NSString)fullName
{
  NSString *fullName;
  NSString *v3;
  NSString *lastName;

  fullName = self->_fullName;
  if (fullName)
    goto LABEL_2;
  fullName = self->_firstName;
  lastName = self->_lastName;
  if (fullName)
  {
    if (lastName)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), fullName, lastName);
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
LABEL_2:
    v3 = fullName;
    return v3;
  }
  if (lastName)
    return lastName;
  else
    return (NSString *)0;
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)setGUID:(id)a3
{
  objc_storeStrong((id *)&self->_GUID, a3);
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (void)setAlbumGUID:(id)a3
{
  objc_storeStrong((id *)&self->_albumGUID, a3);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_storeStrong((id *)&self->_email, a3);
}

- (NSArray)emails
{
  return self->_emails;
}

- (void)setEmails:(id)a3
{
  objc_storeStrong((id *)&self->_emails, a3);
}

- (NSArray)phones
{
  return self->_phones;
}

- (void)setPhones:(id)a3
{
  objc_storeStrong((id *)&self->_phones, a3);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (void)setFullName:(id)a3
{
  objc_storeStrong((id *)&self->_fullName, a3);
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
  objc_storeStrong((id *)&self->_personID, a3);
}

- (NSDate)subscriptionDate
{
  return self->_subscriptionDate;
}

- (void)setSubscriptionDate:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionDate, a3);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (BOOL)isMine
{
  return self->_isMine;
}

- (void)setIsMine:(BOOL)a3
{
  self->_isMine = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionDate, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_phones, 0);
  objc_storeStrong((id *)&self->_emails, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)MSASPSharingRelationshipFromProtocolDictionary:(id)a3
{
  id v3;
  MSASSharingRelationship *v4;
  int v5;
  MSASSharingRelationship *v6;
  MSASSharingRelationship *v7;

  v3 = a3;
  v4 = objc_alloc_init(MSASSharingRelationship);
  v5 = _setFieldsInSharingRelationship(v4, v3);

  if (v5)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

@end
