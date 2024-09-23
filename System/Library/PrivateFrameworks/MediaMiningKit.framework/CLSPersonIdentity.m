@implementation CLSPersonIdentity

- (void)encodeWithCoder:(id)a3
{
  NSString *localIdentifier;
  id v5;

  localIdentifier = self->_localIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localIdentifier, CFSTR("PHIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_CNIdentifier, CFSTR("CNIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shareParticipantLocalIdentifier, CFSTR("ShareParticipantLocalIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fullName, CFSTR("fullName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstName, CFSTR("firstName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedShortName, CFSTR("localizedShortName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_middleName, CFSTR("middleName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastName, CFSTR("lastName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nickname, CFSTR("nickname"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_birthdayDate, CFSTR("birthdayDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_potentialBirthdayDate, CFSTR("potentialBirthdayDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_anniversaryDate, CFSTR("anniversaryDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_companyName, CFSTR("companyName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_socialProfiles, CFSTR("socialProfiles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emailAddresses, CFSTR("emailAddresses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumbers, CFSTR("phoneNumbers"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_relationship, CFSTR("relationship"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sex, CFSTR("sex"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ageCategory, CFSTR("ageCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceURLs, CFSTR("sourceURLs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeAddresses, CFSTR("homeAddresses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workAddresses, CFSTR("workAddresses"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasContactProfilePicture, CFSTR("hasContactProfilePicture"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasPhoneNumber, CFSTR("hasPhoneNumber"));

}

- (CLSPersonIdentity)initWithCoder:(id)a3
{
  id v4;
  CLSPersonIdentity *v5;
  uint64_t v6;
  NSString *localIdentifier;
  uint64_t v8;
  NSString *CNIdentifier;
  uint64_t v10;
  NSString *shareParticipantLocalIdentifier;
  uint64_t v12;
  NSString *fullName;
  uint64_t v14;
  NSString *firstName;
  uint64_t v16;
  NSString *localizedShortName;
  uint64_t v18;
  NSString *middleName;
  uint64_t v20;
  NSString *lastName;
  uint64_t v22;
  NSString *nickname;
  uint64_t v24;
  NSDate *birthdayDate;
  uint64_t v26;
  NSDate *potentialBirthdayDate;
  uint64_t v28;
  NSDate *anniversaryDate;
  uint64_t v30;
  NSString *companyName;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSMutableDictionary *socialProfiles;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSSet *emailAddresses;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSSet *phoneNumbers;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSArray *sourceURLs;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  NSMutableArray *homeAddresses;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  NSMutableArray *workAddresses;
  objc_super v70;

  v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)CLSPersonIdentity;
  v5 = -[CLSPersonIdentity init](&v70, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CNIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    CNIdentifier = v5->_CNIdentifier;
    v5->_CNIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ShareParticipantLocalIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    shareParticipantLocalIdentifier = v5->_shareParticipantLocalIdentifier;
    v5->_shareParticipantLocalIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullName"));
    v12 = objc_claimAutoreleasedReturnValue();
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstName"));
    v14 = objc_claimAutoreleasedReturnValue();
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedShortName"));
    v16 = objc_claimAutoreleasedReturnValue();
    localizedShortName = v5->_localizedShortName;
    v5->_localizedShortName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("middleName"));
    v18 = objc_claimAutoreleasedReturnValue();
    middleName = v5->_middleName;
    v5->_middleName = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastName"));
    v20 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nickname"));
    v22 = objc_claimAutoreleasedReturnValue();
    nickname = v5->_nickname;
    v5->_nickname = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("birthdayDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    birthdayDate = v5->_birthdayDate;
    v5->_birthdayDate = (NSDate *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("potentialBirthdayDate"));
    v26 = objc_claimAutoreleasedReturnValue();
    potentialBirthdayDate = v5->_potentialBirthdayDate;
    v5->_potentialBirthdayDate = (NSDate *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anniversaryDate"));
    v28 = objc_claimAutoreleasedReturnValue();
    anniversaryDate = v5->_anniversaryDate;
    v5->_anniversaryDate = (NSDate *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("companyName"));
    v30 = objc_claimAutoreleasedReturnValue();
    companyName = v5->_companyName;
    v5->_companyName = (NSString *)v30;

    v32 = (void *)MEMORY[0x1E0C99E60];
    v33 = objc_opt_class();
    v34 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("socialProfiles"));
    v36 = objc_claimAutoreleasedReturnValue();
    socialProfiles = v5->_socialProfiles;
    v5->_socialProfiles = (NSMutableDictionary *)v36;

    v38 = (void *)MEMORY[0x1E0C99E60];
    v39 = objc_opt_class();
    v40 = objc_opt_class();
    objc_msgSend(v38, "setWithObjects:", v39, v40, objc_opt_class(), 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("emailAddresses"));
    v42 = objc_claimAutoreleasedReturnValue();
    emailAddresses = v5->_emailAddresses;
    v5->_emailAddresses = (NSSet *)v42;

    v44 = (void *)MEMORY[0x1E0C99E60];
    v45 = objc_opt_class();
    v46 = objc_opt_class();
    objc_msgSend(v44, "setWithObjects:", v45, v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("phoneNumbers"));
    v48 = objc_claimAutoreleasedReturnValue();
    phoneNumbers = v5->_phoneNumbers;
    v5->_phoneNumbers = (NSSet *)v48;

    v5->_relationship = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("relationship"));
    v5->_sex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sex"));
    v5->_ageCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ageCategory"));
    v50 = (void *)MEMORY[0x1E0C99E60];
    v51 = objc_opt_class();
    objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v52, CFSTR("sourceURLs"));
    v53 = objc_claimAutoreleasedReturnValue();
    sourceURLs = v5->_sourceURLs;
    v5->_sourceURLs = (NSArray *)v53;

    v5->_hasContactProfilePicture = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasContactProfilePicture"));
    v5->_hasPhoneNumber = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasPhoneNumber"));
    v55 = (void *)MEMORY[0x1E0C99E60];
    v56 = objc_opt_class();
    v57 = objc_opt_class();
    v58 = objc_opt_class();
    objc_msgSend(v55, "setWithObjects:", v56, v57, v58, objc_opt_class(), 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v59, CFSTR("homeAddresses"));
    v60 = objc_claimAutoreleasedReturnValue();
    homeAddresses = v5->_homeAddresses;
    v5->_homeAddresses = (NSMutableArray *)v60;

    v62 = (void *)MEMORY[0x1E0C99E60];
    v63 = objc_opt_class();
    v64 = objc_opt_class();
    v65 = objc_opt_class();
    objc_msgSend(v62, "setWithObjects:", v63, v64, v65, objc_opt_class(), 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v66, CFSTR("workAddresses"));
    v67 = objc_claimAutoreleasedReturnValue();
    workAddresses = v5->_workAddresses;
    v5->_workAddresses = (NSMutableArray *)v67;

  }
  return v5;
}

- (CLSPersonIdentity)init
{
  CLSPersonIdentity *v2;
  CLSPersonIdentity *v3;
  NSArray *sourceURLs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSPersonIdentity;
  v2 = -[CLSPersonIdentity init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    sourceURLs = v2->_sourceURLs;
    v2->_sourceURLs = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (void)setFullName:(id)a3
{
  NSString *v4;
  NSString *fullName;

  objc_msgSend(a3, "decomposedStringWithCanonicalMapping");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  fullName = self->_fullName;
  self->_fullName = v4;

}

- (void)setFirstName:(id)a3
{
  NSString *v4;
  NSString *firstName;

  objc_msgSend(a3, "decomposedStringWithCanonicalMapping");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  firstName = self->_firstName;
  self->_firstName = v4;

}

- (void)setLocalizedShortName:(id)a3
{
  NSString *v4;
  NSString *localizedShortName;

  objc_msgSend(a3, "decomposedStringWithCanonicalMapping");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  localizedShortName = self->_localizedShortName;
  self->_localizedShortName = v4;

}

- (void)setMiddleName:(id)a3
{
  NSString *v4;
  NSString *middleName;

  objc_msgSend(a3, "decomposedStringWithCanonicalMapping");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  middleName = self->_middleName;
  self->_middleName = v4;

}

- (void)setLastName:(id)a3
{
  NSString *v4;
  NSString *lastName;

  objc_msgSend(a3, "decomposedStringWithCanonicalMapping");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  lastName = self->_lastName;
  self->_lastName = v4;

}

- (void)setNickname:(id)a3
{
  NSString *v4;
  NSString *nickname;

  objc_msgSend(a3, "decomposedStringWithCanonicalMapping");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  nickname = self->_nickname;
  self->_nickname = v4;

}

- (void)setCompanyName:(id)a3
{
  NSString *v4;
  NSString *companyName;

  objc_msgSend(a3, "decomposedStringWithCanonicalMapping");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  companyName = self->_companyName;
  self->_companyName = v4;

}

- (BOOL)isMe
{
  return self->_relationship == 14;
}

- (BOOL)isSamePersonAs:(id)a3
{
  id v4;
  void *v5;
  NSString *localIdentifier;
  void *v7;
  uint64_t v8;
  NSString *CNIdentifier;
  void *v10;
  uint64_t v11;
  NSString *fullName;
  void *v13;
  uint64_t v14;
  NSString *firstName;
  void *v16;
  NSString *lastName;
  void *v18;
  uint64_t v19;
  NSSet *emailAddresses;
  void *v21;
  char v22;

  v4 = a3;
  v5 = v4;
  localIdentifier = self->_localIdentifier;
  if (localIdentifier)
  {
    objc_msgSend(v4, "localIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSString compare:options:](localIdentifier, "compare:options:", v7, 385);

    if (!v8)
      goto LABEL_13;
  }
  CNIdentifier = self->_CNIdentifier;
  if (CNIdentifier)
  {
    objc_msgSend(v5, "CNIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString compare:options:](CNIdentifier, "compare:options:", v10, 385);

    if (!v11)
      goto LABEL_13;
  }
  fullName = self->_fullName;
  if (fullName)
  {
    objc_msgSend(v5, "fullName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NSString compare:options:](fullName, "compare:options:", v13, 385);

    if (!v14)
      goto LABEL_13;
  }
  firstName = self->_firstName;
  if (!firstName || !self->_lastName)
    goto LABEL_12;
  objc_msgSend(v5, "firstName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString compare:options:](firstName, "compare:options:", v16, 385) == NSOrderedSame)
  {
    lastName = self->_lastName;
    objc_msgSend(v5, "lastName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[NSString compare:options:](lastName, "compare:options:", v18, 385);

    if (v19)
      goto LABEL_12;
LABEL_13:
    v22 = 1;
    goto LABEL_14;
  }

LABEL_12:
  emailAddresses = self->_emailAddresses;
  objc_msgSend(v5, "emailAddresses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[NSSet intersectsSet:](emailAddresses, "intersectsSet:", v21);

LABEL_14:
  return v22;
}

- (void)mergeWithPerson:(id)a3
{
  CLSPersonIdentity *v4;
  uint64_t v5;
  NSString *localIdentifier;
  uint64_t v7;
  NSString *CNIdentifier;
  uint64_t v9;
  NSString *fullName;
  uint64_t v11;
  NSString *firstName;
  uint64_t v13;
  NSString *localizedShortName;
  uint64_t v15;
  NSString *middleName;
  uint64_t v17;
  NSString *lastName;
  uint64_t v19;
  NSString *nickname;
  uint64_t v21;
  NSDate *birthdayDate;
  uint64_t v23;
  NSDate *potentialBirthdayDate;
  uint64_t v25;
  NSDate *anniversaryDate;
  uint64_t v27;
  NSString *companyName;
  uint64_t v29;
  NSSet *emailAddresses;
  uint64_t v31;
  NSSet *phoneNumbers;
  uint64_t v33;
  unint64_t sex;
  void *v35;
  uint64_t v36;
  void *v37;
  NSMutableDictionary *v38;
  NSMutableDictionary *socialProfiles;
  unint64_t relationship;
  NSArray *sourceURLs;
  void *v42;
  uint64_t v43;
  NSArray *v44;
  uint64_t v45;
  NSString *shareParticipantLocalIdentifier;
  id *v47;

  v47 = (id *)a3;
  v4 = self;
  objc_sync_enter(v4);
  if (!v47)
    goto LABEL_43;
  if (!v4->_localIdentifier)
  {
    objc_msgSend(v47, "localIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    localIdentifier = v4->_localIdentifier;
    v4->_localIdentifier = (NSString *)v5;

  }
  if (!v4->_CNIdentifier)
  {
    objc_msgSend(v47, "CNIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    CNIdentifier = v4->_CNIdentifier;
    v4->_CNIdentifier = (NSString *)v7;

  }
  if (!v4->_fullName)
  {
    objc_msgSend(v47, "fullName");
    v9 = objc_claimAutoreleasedReturnValue();
    fullName = v4->_fullName;
    v4->_fullName = (NSString *)v9;

  }
  if (!v4->_firstName)
  {
    objc_msgSend(v47, "firstName");
    v11 = objc_claimAutoreleasedReturnValue();
    firstName = v4->_firstName;
    v4->_firstName = (NSString *)v11;

  }
  if (!v4->_localizedShortName)
  {
    objc_msgSend(v47, "localizedShortName");
    v13 = objc_claimAutoreleasedReturnValue();
    localizedShortName = v4->_localizedShortName;
    v4->_localizedShortName = (NSString *)v13;

  }
  if (!v4->_middleName)
  {
    objc_msgSend(v47, "middleName");
    v15 = objc_claimAutoreleasedReturnValue();
    middleName = v4->_middleName;
    v4->_middleName = (NSString *)v15;

  }
  if (!v4->_lastName)
  {
    objc_msgSend(v47, "lastName");
    v17 = objc_claimAutoreleasedReturnValue();
    lastName = v4->_lastName;
    v4->_lastName = (NSString *)v17;

  }
  if (!v4->_nickname)
  {
    objc_msgSend(v47, "nickname");
    v19 = objc_claimAutoreleasedReturnValue();
    nickname = v4->_nickname;
    v4->_nickname = (NSString *)v19;

  }
  if (!v4->_birthdayDate)
  {
    objc_msgSend(v47, "birthdayDate");
    v21 = objc_claimAutoreleasedReturnValue();
    birthdayDate = v4->_birthdayDate;
    v4->_birthdayDate = (NSDate *)v21;

  }
  if (!v4->_potentialBirthdayDate)
  {
    objc_msgSend(v47, "potentialBirthdayDate");
    v23 = objc_claimAutoreleasedReturnValue();
    potentialBirthdayDate = v4->_potentialBirthdayDate;
    v4->_potentialBirthdayDate = (NSDate *)v23;

  }
  if (!v4->_anniversaryDate)
  {
    objc_msgSend(v47, "anniversaryDate");
    v25 = objc_claimAutoreleasedReturnValue();
    anniversaryDate = v4->_anniversaryDate;
    v4->_anniversaryDate = (NSDate *)v25;

  }
  if (!v4->_companyName)
  {
    objc_msgSend(v47, "companyName");
    v27 = objc_claimAutoreleasedReturnValue();
    companyName = v4->_companyName;
    v4->_companyName = (NSString *)v27;

  }
  -[CLSPersonIdentity addAddresses:ofType:](v4, "addAddresses:ofType:", v47[1], 0);
  -[CLSPersonIdentity addAddresses:ofType:](v4, "addAddresses:ofType:", v47[2], 1);
  if (objc_msgSend(v47[20], "count"))
  {
    objc_msgSend(v47[20], "setByAddingObjectsFromSet:", v4->_emailAddresses);
    v29 = objc_claimAutoreleasedReturnValue();
    emailAddresses = v4->_emailAddresses;
    v4->_emailAddresses = (NSSet *)v29;

  }
  if (objc_msgSend(v47[21], "count"))
  {
    objc_msgSend(v47[21], "setByAddingObjectsFromSet:", v4->_phoneNumbers);
    v31 = objc_claimAutoreleasedReturnValue();
    phoneNumbers = v4->_phoneNumbers;
    v4->_phoneNumbers = (NSSet *)v31;

  }
  v33 = objc_msgSend(v47, "sex");
  sex = v4->_sex;
  if (sex)
  {
    if (!v33 || sex == v33)
      goto LABEL_35;
    v33 = 0;
  }
  v4->_sex = v33;
LABEL_35:
  objc_msgSend(v47, "socialProfiles");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "count");

  if (v36)
  {
    objc_msgSend(v47, "socialProfiles");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (NSMutableDictionary *)objc_msgSend(v37, "mutableCopy");

    -[NSMutableDictionary addEntriesFromDictionary:](v38, "addEntriesFromDictionary:", v4->_socialProfiles);
    socialProfiles = v4->_socialProfiles;
    v4->_socialProfiles = v38;

  }
  relationship = v4->_relationship;
  if (relationship < objc_msgSend(v47, "relationship"))
    v4->_relationship = objc_msgSend(v47, "relationship");
  sourceURLs = v4->_sourceURLs;
  objc_msgSend(v47, "sourceURLs");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray arrayByAddingObjectsFromArray:](sourceURLs, "arrayByAddingObjectsFromArray:", v42);
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = v4->_sourceURLs;
  v4->_sourceURLs = (NSArray *)v43;

  v4->_hasContactProfilePicture |= objc_msgSend(v47, "hasContactProfilePicture");
  if (!v4->_hasPhoneNumber)
    v4->_hasPhoneNumber = objc_msgSend(v47, "hasPhoneNumber");
  if (!v4->_shareParticipantLocalIdentifier)
  {
    objc_msgSend(v47, "shareParticipantLocalIdentifier");
    v45 = objc_claimAutoreleasedReturnValue();
    shareParticipantLocalIdentifier = v4->_shareParticipantLocalIdentifier;
    v4->_shareParticipantLocalIdentifier = (NSString *)v45;

  }
LABEL_43:
  objc_sync_exit(v4);

}

- (id)_addressArrayFromAddressType:(unint64_t)a3
{
  CLSPersonIdentity *v4;
  void *workAddresses;
  void **p_workAddresses;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = self;
  objc_sync_enter(v4);
  if (a3 == 1)
  {
    p_workAddresses = (void **)&v4->_workAddresses;
    workAddresses = v4->_workAddresses;
    if (!workAddresses)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *p_workAddresses;
      *p_workAddresses = (void *)v7;

      workAddresses = *p_workAddresses;
    }
  }
  else
  {
    if (a3)
    {
      v9 = 0;
      goto LABEL_9;
    }
    p_workAddresses = (void **)&v4->_homeAddresses;
    workAddresses = v4->_homeAddresses;
    if (!workAddresses)
      goto LABEL_6;
  }
  v9 = workAddresses;
LABEL_9:
  objc_sync_exit(v4);

  return v9;
}

- (BOOL)hasAddresses
{
  return -[NSMutableArray count](self->_homeAddresses, "count")
      || -[NSMutableArray count](self->_workAddresses, "count") != 0;
}

- (void)addAddresses:(id)a3 ofType:(unint64_t)a4
{
  id v6;
  id v7;

  v7 = a3;
  -[CLSPersonIdentity _addressArrayFromAddressType:](self, "_addressArrayFromAddressType:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  objc_msgSend(v6, "addObjectsFromArray:", v7);
  objc_sync_exit(v6);

}

- (void)_enumerateAddresses:(id)a3 as:(id)a4 withBlock:(id)a5
{
  id v7;
  __CFString *v8;
  void (**v9)(id, void *, _BYTE *);
  id v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  _BOOL4 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (__CFString *)a4;
  v9 = (void (**)(id, void *, _BYTE *))a5;
  v10 = v7;
  objc_sync_enter(v10);
  v29 = 0;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v12)
  {
    v14 = *(_QWORD *)v26;
    *(_QWORD *)&v13 = 138477827;
    v24 = v13;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v15);
        objc_msgSend(MEMORY[0x1E0C99E38], "null", v24, (_QWORD)v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if ((v18 & 1) != 0)
          goto LABEL_18;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "loggingConnection");
          v21 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v24;
            v31 = v16;
            _os_log_error_impl(&dword_1CAB79000, v21, OS_LOG_TYPE_ERROR, "You should call prefetch before accessing the person addresses: %{private}@", buf, 0xCu);
          }

          goto LABEL_18;
        }
        if (v8 == CFSTR("CLLocation"))
        {
          objc_msgSend(v16, "location");
          v22 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v8 != CFSTR("Placemark"))
          {
            v19 = 0;
            goto LABEL_17;
          }
          v22 = v16;
        }
        v19 = v22;
LABEL_17:
        v9[2](v9, v19, &v29);
        v23 = v29 == 0;

        if (!v23)
          goto LABEL_20;
LABEL_18:
        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v12);
  }
LABEL_20:

  objc_sync_exit(v11);
}

- (void)prefetchPersonAddressesIfNeededWithLocationCache:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  NSMutableArray *v7;
  NSMutableArray *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__CLSPersonIdentity_prefetchPersonAddressesIfNeededWithLocationCache___block_invoke;
  v9[3] = &unk_1E84F75B8;
  v5 = v4;
  v10 = v5;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D1796244](v9);
  v7 = self->_homeAddresses;
  objc_sync_enter(v7);
  ((void (**)(_QWORD, NSMutableArray *))v6)[2](v6, self->_homeAddresses);
  objc_sync_exit(v7);

  v8 = self->_workAddresses;
  objc_sync_enter(v8);
  ((void (**)(_QWORD, NSMutableArray *))v6)[2](v6, self->_workAddresses);
  objc_sync_exit(v8);

}

- (unint64_t)countOfAddressesOfType:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[CLSPersonIdentity _addressArrayFromAddressType:](self, "_addressArrayFromAddressType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (void)enumerateAddressesOfType:(unint64_t)a3 asCLLocationsWithBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[CLSPersonIdentity _addressArrayFromAddressType:](self, "_addressArrayFromAddressType:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CLSPersonIdentity _enumerateAddresses:as:withBlock:](self, "_enumerateAddresses:as:withBlock:", v7, CFSTR("CLLocation"), v6);

}

- (void)enumerateAddressesOfType:(unint64_t)a3 asPlacemarkWithBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[CLSPersonIdentity _addressArrayFromAddressType:](self, "_addressArrayFromAddressType:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CLSPersonIdentity _enumerateAddresses:as:withBlock:](self, "_enumerateAddresses:as:withBlock:", v7, CFSTR("Placemark"), v6);

}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("[Person]"));
  if (self->_fullName)
    objc_msgSend(v3, "appendFormat:", CFSTR(" fullname:[%@]"), self->_fullName);
  if (self->_nickname)
    objc_msgSend(v3, "appendFormat:", CFSTR(" nickname:[%@]"), self->_nickname);
  -[CLSPersonIdentity _relationshipAsString](self, "_relationshipAsString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" relationship:[%@]"), v4);

  if (self->_birthdayDate)
    objc_msgSend(v3, "appendFormat:", CFSTR(" birthday:[%@]"), self->_birthdayDate);
  if (self->_potentialBirthdayDate)
    objc_msgSend(v3, "appendFormat:", CFSTR(" potential birthday:[%@]"), self->_potentialBirthdayDate);
  if (self->_anniversaryDate)
    objc_msgSend(v3, "appendFormat:", CFSTR(" anniversary:[%@]"), self->_anniversaryDate);
  if (self->_companyName)
    objc_msgSend(v3, "appendFormat:", CFSTR(" companyName:[%@]"), self->_companyName);
  if (self->_localIdentifier)
    objc_msgSend(v3, "appendFormat:", CFSTR(" localIdentifier:[%@]"), self->_localIdentifier);
  if (self->_CNIdentifier)
    objc_msgSend(v3, "appendFormat:", CFSTR(" CNIdentifier:[%@]"), self->_CNIdentifier);
  if (self->_GDIdentifier)
    objc_msgSend(v3, "appendFormat:", CFSTR(" GDIdentifier:[%@]"), self->_GDIdentifier);
  return v3;
}

- (id)_relationshipAsString
{
  unint64_t v2;

  v2 = self->_relationship - 1;
  if (v2 > 0x10)
    return CFSTR("Unknown");
  else
    return off_1E84F76C0[v2];
}

- (id)presentationString
{
  __CFString *v2;
  NSString *firstName;
  __CFString *v4;
  __CFString *v5;

  v2 = CFSTR("my partner");
  switch(self->_relationship)
  {
    case 1uLL:
      firstName = self->_firstName;
      goto LABEL_7;
    case 2uLL:
    case 3uLL:
    case 4uLL:
      firstName = self->_nickname;
      if (!firstName)
        goto LABEL_3;
      goto LABEL_7;
    case 5uLL:
      v2 = CFSTR("my child");
      goto LABEL_8;
    case 6uLL:
      v2 = CFSTR("my daughter");
      goto LABEL_8;
    case 7uLL:
      v2 = CFSTR("my son");
      goto LABEL_8;
    case 8uLL:
      v2 = CFSTR("my parents");
      goto LABEL_8;
    case 9uLL:
      v2 = CFSTR("mom");
      goto LABEL_8;
    case 0xAuLL:
      v2 = CFSTR("dad");
      goto LABEL_8;
    case 0xBuLL:
      v2 = CFSTR("my brother");
      goto LABEL_8;
    case 0xCuLL:
      v2 = CFSTR("my sister");
      goto LABEL_8;
    case 0xDuLL:
      goto LABEL_8;
    case 0xEuLL:
      v2 = CFSTR("myself");
      goto LABEL_8;
    default:
LABEL_3:
      firstName = self->_firstName;
      if (firstName || (firstName = self->_lastName) != 0)
LABEL_7:
        v2 = firstName;
      else
        v2 = 0;
LABEL_8:
      if (v2)
        v4 = v2;
      else
        v4 = &stru_1E84F9D30;
      v5 = v4;

      return v5;
  }
}

- (id)pluralPresentationString
{
  __CFString *v2;
  NSString *nickname;
  __CFString *v4;
  __CFString *v5;

  v2 = CFSTR("my coworkers");
  switch(self->_relationship)
  {
    case 1uLL:
      break;
    case 2uLL:
    case 3uLL:
      v2 = CFSTR("my friends");
      break;
    case 4uLL:
    case 0xDuLL:
      nickname = self->_nickname;
      if (nickname)
        goto LABEL_5;
      goto LABEL_4;
    case 5uLL:
      v2 = CFSTR("my children");
      break;
    case 6uLL:
      v2 = CFSTR("my daughters");
      break;
    case 7uLL:
      v2 = CFSTR("my sons");
      break;
    case 8uLL:
      v2 = CFSTR("my parents");
      break;
    case 9uLL:
      v2 = CFSTR("mom");
      break;
    case 0xAuLL:
      v2 = CFSTR("dad");
      break;
    case 0xBuLL:
      v2 = CFSTR("my brothers");
      break;
    case 0xCuLL:
      v2 = CFSTR("my sisters");
      break;
    case 0xEuLL:
      v2 = CFSTR("myself");
      break;
    default:
LABEL_4:
      nickname = self->_firstName;
LABEL_5:
      v2 = nickname;
      break;
  }
  if (v2)
    v4 = v2;
  else
    v4 = &stru_1E84F9D30;
  v5 = v4;

  return v5;
}

- (void)setSourceService:(id)a3 andID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSArray *v12;
  NSObject *p_super;
  void *v14;
  int v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[NSArray count](self->_sourceURLs, "count"))
    __assert_rtn("-[CLSPersonIdentity setSourceService:andID:]", "CLSPersonIdentity.m", 691, "_sourceURLs.count == 0");
  objc_storeStrong((id *)&self->_sourceService, a3);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setScheme:", v7);
  objc_msgSend(v9, "setPath:", v8);
  objc_msgSend(v9, "URL");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v17[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    p_super = &self->_sourceURLs->super;
    self->_sourceURLs = v12;
  }
  else
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "loggingConnection");
    p_super = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v7;
      _os_log_error_impl(&dword_1CAB79000, p_super, OS_LOG_TYPE_ERROR, "Trying to set a nil url for source service %@", (uint8_t *)&v15, 0xCu);
    }
  }

}

- (id)sourceService
{
  return self->_sourceService;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CLSPersonIdentity isSamePersonAs:](self, "isSamePersonAs:", v4);

  return v5;
}

- (BOOL)isEqualToPerson:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  NSString *fullName;
  NSString *v8;
  NSString *v9;
  BOOL v10;
  NSString *firstName;
  NSString *v12;
  NSString *v13;
  NSString *lastName;
  NSString *v15;
  NSString *v16;
  uint64_t v17;
  NSString *v18;
  void *v19;
  NSString *middleName;
  NSString *v21;
  NSString *nickname;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  NSDate *birthdayDate;
  NSDate *v27;
  void *v28;
  NSDate *potentialBirthdayDate;
  NSDate *v30;
  NSDate *v31;
  NSDate *anniversaryDate;
  NSDate *v33;
  void *v34;
  NSString *companyName;
  NSString *v36;
  NSString *v37;
  NSMutableDictionary *socialProfiles;
  NSMutableDictionary *v39;
  void *v40;
  NSSet *emailAddresses;
  NSSet *v42;
  void *v43;
  NSSet *phoneNumbers;
  uint64_t v45;
  BOOL v46;
  NSSet *v47;
  NSSet *v48;
  unint64_t relationship;
  unint64_t sex;
  NSArray *sourceURLs;
  NSArray *v52;
  void *v53;
  int hasContactProfilePicture;
  int hasPhoneNumber;
  uint64_t v57;
  NSArray *v58;
  NSArray *v59;
  void *v60;
  NSSet *v61;
  void *v62;
  NSSet *v63;
  void *v64;
  uint64_t v65;
  NSMutableDictionary *v66;
  void *v67;
  uint64_t v68;
  NSString *v69;
  void *v70;
  uint64_t v71;
  NSDate *v72;
  void *v73;
  uint64_t v74;
  NSString *v75;
  NSDate *v76;
  void *v77;
  uint64_t v78;
  NSDate *v79;
  void *v80;
  uint64_t v81;
  NSString *v82;
  void *v83;
  void *v84;
  NSString *v85;
  NSString *v86;
  void *v87;
  NSString *v88;
  NSString *v89;

  v6 = a3;
  fullName = self->_fullName;
  objc_msgSend(v6, "fullName");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (fullName != v8)
  {
    v9 = self->_fullName;
    objc_msgSend(v6, "fullName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](v9, "isEqualToString:", v3))
    {
      v10 = 0;
LABEL_73:

      goto LABEL_74;
    }
  }
  firstName = self->_firstName;
  objc_msgSend(v6, "firstName");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (firstName == v12
    || (v13 = self->_firstName,
        objc_msgSend(v6, "firstName"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSString isEqualToString:](v13, "isEqualToString:", v4)))
  {
    lastName = self->_lastName;
    objc_msgSend(v6, "lastName");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    v88 = lastName;
    if (lastName != v15)
    {
      v16 = self->_lastName;
      objc_msgSend(v6, "lastName");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v16;
      v19 = (void *)v17;
      if (!-[NSString isEqualToString:](v18, "isEqualToString:", v17))
      {
        v10 = 0;
LABEL_69:

LABEL_70:
        if (firstName == v12)
          goto LABEL_72;
        goto LABEL_71;
      }
      v84 = v19;
    }
    middleName = self->_middleName;
    objc_msgSend(v6, "middleName");
    v89 = (NSString *)objc_claimAutoreleasedReturnValue();
    v85 = middleName;
    v86 = firstName;
    v87 = v4;
    if (middleName != v89)
    {
      v21 = self->_middleName;
      objc_msgSend(v6, "middleName");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](v21, "isEqualToString:"))
      {
        v10 = 0;
        firstName = v86;
LABEL_67:

LABEL_68:
        v19 = v84;
        if (v88 == v15)
          goto LABEL_70;
        goto LABEL_69;
      }
    }
    nickname = self->_nickname;
    objc_msgSend(v6, "nickname");
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    v82 = nickname;
    if (nickname != v23)
    {
      v24 = self->_nickname;
      objc_msgSend(v6, "nickname");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](v24, "isEqualToString:"))
      {
        v10 = 0;
        v25 = middleName;
LABEL_65:

LABEL_66:
        v46 = v25 == v89;
        firstName = v86;
        v4 = v87;
        if (v46)
          goto LABEL_68;
        goto LABEL_67;
      }
    }
    birthdayDate = self->_birthdayDate;
    objc_msgSend(v6, "birthdayDate");
    v81 = objc_claimAutoreleasedReturnValue();
    if (birthdayDate != (NSDate *)v81)
    {
      v27 = self->_birthdayDate;
      objc_msgSend(v6, "birthdayDate");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSDate isEqualToDate:](v27, "isEqualToDate:"))
      {
        v10 = 0;
        v25 = v85;
        v28 = (void *)v81;
LABEL_63:

LABEL_64:
        if (v82 == v23)
          goto LABEL_66;
        goto LABEL_65;
      }
    }
    potentialBirthdayDate = self->_potentialBirthdayDate;
    objc_msgSend(v6, "potentialBirthdayDate");
    v78 = objc_claimAutoreleasedReturnValue();
    v79 = birthdayDate;
    v76 = potentialBirthdayDate;
    if (potentialBirthdayDate != (NSDate *)v78)
    {
      v30 = self->_potentialBirthdayDate;
      objc_msgSend(v6, "potentialBirthdayDate");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSDate isEqualToDate:](v30, "isEqualToDate:"))
      {
        v10 = 0;
        v25 = v85;
        v31 = (NSDate *)v78;
LABEL_61:

LABEL_62:
        v28 = (void *)v81;
        if (v79 == (NSDate *)v81)
          goto LABEL_64;
        goto LABEL_63;
      }
    }
    anniversaryDate = self->_anniversaryDate;
    objc_msgSend(v6, "anniversaryDate");
    v74 = objc_claimAutoreleasedReturnValue();
    v75 = v23;
    v72 = anniversaryDate;
    if (anniversaryDate != (NSDate *)v74)
    {
      v33 = self->_anniversaryDate;
      objc_msgSend(v6, "anniversaryDate");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSDate isEqualToDate:](v33, "isEqualToDate:"))
      {
        v10 = 0;
        v25 = v85;
        v31 = (NSDate *)v78;
        v34 = (void *)v74;
LABEL_59:

LABEL_60:
        v23 = v75;
        if (v76 == v31)
          goto LABEL_62;
        goto LABEL_61;
      }
    }
    companyName = self->_companyName;
    objc_msgSend(v6, "companyName");
    v71 = objc_claimAutoreleasedReturnValue();
    v69 = companyName;
    if (companyName != (NSString *)v71)
    {
      v36 = self->_companyName;
      objc_msgSend(v6, "companyName");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](v36, "isEqualToString:"))
      {
        v10 = 0;
        v25 = v85;
        v31 = (NSDate *)v78;
        v37 = (NSString *)v71;
LABEL_57:

LABEL_58:
        v34 = (void *)v74;
        if (v72 == (NSDate *)v74)
          goto LABEL_60;
        goto LABEL_59;
      }
    }
    socialProfiles = self->_socialProfiles;
    objc_msgSend(v6, "socialProfiles");
    v66 = socialProfiles;
    v68 = objc_claimAutoreleasedReturnValue();
    if (socialProfiles != (NSMutableDictionary *)v68)
    {
      v39 = self->_socialProfiles;
      objc_msgSend(v6, "socialProfiles");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSMutableDictionary isEqualToDictionary:](v39, "isEqualToDictionary:"))
      {
        v10 = 0;
        v31 = (NSDate *)v78;
        v37 = (NSString *)v71;
        v40 = (void *)v68;
LABEL_55:

LABEL_56:
        v25 = v85;
        if (v69 == v37)
          goto LABEL_58;
        goto LABEL_57;
      }
    }
    emailAddresses = self->_emailAddresses;
    objc_msgSend(v6, "emailAddresses");
    v65 = objc_claimAutoreleasedReturnValue();
    v63 = emailAddresses;
    if (emailAddresses != (NSSet *)v65)
    {
      v42 = self->_emailAddresses;
      objc_msgSend(v6, "emailAddresses");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSSet isEqualToSet:](v42, "isEqualToSet:"))
      {
        v10 = 0;
        v43 = (void *)v65;
LABEL_53:

LABEL_54:
        v40 = (void *)v68;
        v31 = (NSDate *)v78;
        v37 = (NSString *)v71;
        if (v66 == (NSMutableDictionary *)v68)
          goto LABEL_56;
        goto LABEL_55;
      }
    }
    phoneNumbers = self->_phoneNumbers;
    objc_msgSend(v6, "phoneNumbers");
    v45 = objc_claimAutoreleasedReturnValue();
    v61 = phoneNumbers;
    v46 = phoneNumbers == (NSSet *)v45;
    v47 = (NSSet *)v45;
    if (!v46)
    {
      v48 = self->_phoneNumbers;
      objc_msgSend(v6, "phoneNumbers");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSSet isEqualToSet:](v48, "isEqualToSet:"))
      {
        v10 = 0;
LABEL_51:

LABEL_52:
        v43 = (void *)v65;
        if (v63 == (NSSet *)v65)
          goto LABEL_54;
        goto LABEL_53;
      }
    }
    relationship = self->_relationship;
    if (relationship != objc_msgSend(v6, "relationship") || (sex = self->_sex, sex != objc_msgSend(v6, "sex")))
    {
      v10 = 0;
      goto LABEL_50;
    }
    sourceURLs = self->_sourceURLs;
    objc_msgSend(v6, "sourceURLs");
    v58 = sourceURLs;
    v59 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (sourceURLs == v59
      || (v52 = self->_sourceURLs,
          objc_msgSend(v6, "sourceURLs"),
          v57 = objc_claimAutoreleasedReturnValue(),
          -[NSArray isEqualToArray:](v52, "isEqualToArray:")))
    {
      hasContactProfilePicture = self->_hasContactProfilePicture;
      if (hasContactProfilePicture == objc_msgSend(v6, "hasContactProfilePicture"))
      {
        hasPhoneNumber = self->_hasPhoneNumber;
        v10 = hasPhoneNumber == objc_msgSend(v6, "hasPhoneNumber");
      }
      else
      {
        v10 = 0;
      }
      v53 = (void *)v57;
      if (v58 == v59)
      {

LABEL_50:
        if (v61 == v47)
          goto LABEL_52;
        goto LABEL_51;
      }
    }
    else
    {
      v10 = 0;
      v53 = (void *)v57;
    }

    goto LABEL_50;
  }
  v10 = 0;
LABEL_71:

LABEL_72:
  if (fullName != v8)
    goto LABEL_73;
LABEL_74:

  return v10;
}

- (BOOL)isLocationCoordinate:(CLLocationCoordinate2D)a3 closeToAddressesOfType:(unint64_t)a4
{
  char v4;
  _QWORD v6[5];
  CLLocationCoordinate2D v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__CLSPersonIdentity_isLocationCoordinate_closeToAddressesOfType___block_invoke;
  v6[3] = &unk_1E84F75E0;
  v7 = a3;
  v6[4] = &v8;
  -[CLSPersonIdentity enumerateAddressesOfType:asCLLocationsWithBlock:](self, "enumerateAddressesOfType:asCLLocationsWithBlock:", a4, v6);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (BOOL)isLocationCoordinate:(CLLocationCoordinate2D)a3 farAwayFromAddressesOfType:(unint64_t)a4
{
  char v4;
  _QWORD v6[5];
  CLLocationCoordinate2D v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__CLSPersonIdentity_isLocationCoordinate_farAwayFromAddressesOfType___block_invoke;
  v6[3] = &unk_1E84F75E0;
  v7 = a3;
  v6[4] = &v8;
  -[CLSPersonIdentity enumerateAddressesOfType:asCLLocationsWithBlock:](self, "enumerateAddressesOfType:asCLLocationsWithBlock:", a4, v6);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (BOOL)hasSameFamilyNameAsPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CLSPersonIdentity inferredLastName](self, "inferredLastName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inferredLastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)inferredLastName
{
  NSString *inferredLastName;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  NSString *v10;

  inferredLastName = self->_inferredLastName;
  if (!inferredLastName)
  {
    -[CLSPersonIdentity lastName](self, "lastName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSPersonIdentity fullName](self, "fullName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v6 = v4;
      v7 = self->_inferredLastName;
      self->_inferredLastName = v6;
    }
    else
    {
      if (!objc_msgSend(v5, "length"))
      {
LABEL_7:

        inferredLastName = self->_inferredLastName;
        return inferredLastName;
      }
      v7 = (NSString *)objc_alloc_init(MEMORY[0x1E0CB3858]);
      -[NSString personNameComponentsFromString:](v7, "personNameComponentsFromString:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "familyName");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = self->_inferredLastName;
      self->_inferredLastName = v9;

    }
    goto LABEL_7;
  }
  return inferredLastName;
}

- (unint64_t)relationshipHintFromNameUsingLocales:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSPersonIdentity _motherAndFatherRelationships](self, "_motherAndFatherRelationships");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    v29 = v6;
    v30 = v5;
    v28 = v7;
    v25 = *(_QWORD *)v38;
    do
    {
      v11 = 0;
      v26 = v9;
      do
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v11);
        objc_msgSend(v12, "languageCode", v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 && (objc_msgSend(v5, "containsObject:", v13) & 1) == 0)
        {
          v27 = v11;
          v31 = v13;
          objc_msgSend(v5, "addObject:", v13);
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          obj = v6;
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v34;
            while (2)
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v34 != v16)
                  objc_enumerationMutation(obj);
                v18 = objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "unsignedIntegerValue");
                objc_msgSend((id)objc_opt_class(), "relationshipRegularExpressionForRelationship:locale:", v18, v12);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (v19)
                {
                  -[CLSPersonIdentity fullName](self, "fullName");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  -[CLSPersonIdentity fullName](self, "fullName");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "matchesInString:options:range:", v20, 0, 0, objc_msgSend(v21, "length"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                  v23 = objc_msgSend(v22, "count");
                  if (v23)
                  {

                    v6 = v29;
                    v5 = v30;
                    v7 = v28;
                    goto LABEL_23;
                  }
                }

              }
              v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
              if (v15)
                continue;
              break;
            }
          }

          v6 = v29;
          v5 = v30;
          v11 = v27;
          v7 = v28;
          v10 = v25;
          v9 = v26;
          v13 = v31;
        }

        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      v18 = 0;
    }
    while (v9);
  }
  else
  {
    v18 = 0;
  }
LABEL_23:

  return v18;
}

- (id)_motherAndFatherRelationships
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E8511F18);
}

- (BOOL)isOrganization
{
  return -[NSString length](self->_companyName, "length")
      && !-[NSString length](self->_firstName, "length")
      && !-[NSString length](self->_lastName, "length")
      && !-[NSString length](self->_nickname, "length");
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void)setLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localIdentifier, a3);
}

- (NSString)CNIdentifier
{
  return self->_CNIdentifier;
}

- (void)setCNIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_CNIdentifier, a3);
}

- (NSString)GDIdentifier
{
  return self->_GDIdentifier;
}

- (void)setGDIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_GDIdentifier, a3);
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)nickname
{
  return self->_nickname;
}

- (unint64_t)sex
{
  return self->_sex;
}

- (void)setSex:(unint64_t)a3
{
  self->_sex = a3;
}

- (unint64_t)ageCategory
{
  return self->_ageCategory;
}

- (void)setAgeCategory:(unint64_t)a3
{
  self->_ageCategory = a3;
}

- (NSDate)birthdayDate
{
  return self->_birthdayDate;
}

- (void)setBirthdayDate:(id)a3
{
  objc_storeStrong((id *)&self->_birthdayDate, a3);
}

- (NSDate)potentialBirthdayDate
{
  return self->_potentialBirthdayDate;
}

- (void)setPotentialBirthdayDate:(id)a3
{
  objc_storeStrong((id *)&self->_potentialBirthdayDate, a3);
}

- (NSDate)anniversaryDate
{
  return self->_anniversaryDate;
}

- (void)setAnniversaryDate:(id)a3
{
  objc_storeStrong((id *)&self->_anniversaryDate, a3);
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->_isFavorite = a3;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (BOOL)isUserCreated
{
  return self->_isUserCreated;
}

- (void)setIsUserCreated:(BOOL)a3
{
  self->_isUserCreated = a3;
}

- (BOOL)hasContactProfilePicture
{
  return self->_hasContactProfilePicture;
}

- (void)setHasContactProfilePicture:(BOOL)a3
{
  self->_hasContactProfilePicture = a3;
}

- (BOOL)hasPhoneNumber
{
  return self->_hasPhoneNumber;
}

- (void)setHasPhoneNumber:(BOOL)a3
{
  self->_hasPhoneNumber = a3;
}

- (NSString)companyName
{
  return self->_companyName;
}

- (NSMutableDictionary)socialProfiles
{
  return self->_socialProfiles;
}

- (void)setSocialProfiles:(id)a3
{
  objc_storeStrong((id *)&self->_socialProfiles, a3);
}

- (NSSet)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddresses, a3);
}

- (NSSet)phoneNumbers
{
  return self->_phoneNumbers;
}

- (void)setPhoneNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumbers, a3);
}

- (unint64_t)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(unint64_t)a3
{
  self->_relationship = a3;
}

- (NSArray)sourceURLs
{
  return self->_sourceURLs;
}

- (void)setInferredLastName:(id)a3
{
  objc_storeStrong((id *)&self->_inferredLastName, a3);
}

- (NSString)localizedShortName
{
  return self->_localizedShortName;
}

- (NSString)shareParticipantLocalIdentifier
{
  return self->_shareParticipantLocalIdentifier;
}

- (void)setShareParticipantLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_shareParticipantLocalIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareParticipantLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedShortName, 0);
  objc_storeStrong((id *)&self->_inferredLastName, 0);
  objc_storeStrong((id *)&self->_sourceURLs, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_companyName, 0);
  objc_storeStrong((id *)&self->_anniversaryDate, 0);
  objc_storeStrong((id *)&self->_potentialBirthdayDate, 0);
  objc_storeStrong((id *)&self->_birthdayDate, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_GDIdentifier, 0);
  objc_storeStrong((id *)&self->_CNIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceService, 0);
  objc_storeStrong((id *)&self->_workAddresses, 0);
  objc_storeStrong((id *)&self->_homeAddresses, 0);
}

BOOL __69__CLSPersonIdentity_isLocationCoordinate_farAwayFromAddressesOfType___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  double v5;
  double v6;
  _BOOL8 result;

  objc_msgSend(a2, "coordinate");
  result = +[CLSNewLocationInformant location:isFarFromLocation:](CLSNewLocationInformant, "location:isFarFromLocation:", *(double *)(a1 + 40), *(double *)(a1 + 48), v5, v6);
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

BOOL __65__CLSPersonIdentity_isLocationCoordinate_closeToAddressesOfType___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  double v5;
  double v6;
  _BOOL8 result;

  objc_msgSend(a2, "coordinate");
  result = +[CLSNewLocationInformant location:isCloseToLocation:](CLSNewLocationInformant, "location:isCloseToLocation:", *(double *)(a1 + 40), *(double *)(a1 + 48), v5, v6);
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __70__CLSPersonIdentity_prefetchPersonAddressesIfNeededWithLocationCache___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    *(_QWORD *)&v4 = 138412290;
    v17 = v4;
    v18 = a1;
    while (1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5, v17);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_16;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_16;
      +[CLSCachedGeocoderOperation operationWithLocation:](CLSCachedGeocoderOperation, "operationWithLocation:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v19 = 0;
      objc_msgSend(v9, "performSynchronouslyWithLocationCache:error:", v10, &v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v19;
      v13 = v12;
      if (v11)
        break;
      if (v12)
      {
        +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "loggingConnection");
        v15 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v17;
          v21 = v13;
          _os_log_impl(&dword_1CAB79000, v15, OS_LOG_TYPE_DEFAULT, "Failed to prefetch person address error:%@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        a1 = v18;
        goto LABEL_14;
      }
LABEL_15:

LABEL_16:
      if (++v5 >= (unint64_t)objc_msgSend(v3, "count"))
        goto LABEL_17;
    }
    if (objc_msgSend(v11, "count"))
      objc_msgSend(v11, "lastObject");
    else
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    objc_msgSend(v3, "setObject:atIndexedSubscript:", v16, v5);

    goto LABEL_15;
  }
LABEL_17:

}

+ (id)person
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "cls_generateUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "personWithLocalIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)mePerson
{
  CLSPersonIdentity *v2;
  uint8_t v4[16];

  v2 = objc_alloc_init(CLSPersonIdentity);
  -[CLSPersonIdentity setRelationship:](v2, "setRelationship:", 14);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Creating blank me person", v4, 2u);
  }
  return v2;
}

+ (id)personWithCNIdentifier:(id)a3
{
  id v3;
  CLSPersonIdentity *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(CLSPersonIdentity);
  -[CLSPersonIdentity setCNIdentifier:](v4, "setCNIdentifier:", v3);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Creating person with CNIdentifier: %@", (uint8_t *)&v6, 0xCu);
  }

  return v4;
}

+ (id)personWithLocalIdentifier:(id)a3
{
  id v3;
  CLSPersonIdentity *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(CLSPersonIdentity);
  -[CLSPersonIdentity setLocalIdentifier:](v4, "setLocalIdentifier:", v3);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Creating person with localIdentifier: %@", (uint8_t *)&v6, 0xCu);
  }

  return v4;
}

+ (id)personWithPHPerson:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSPersonIdentity personWithLocalIdentifier:](CLSPersonIdentity, "personWithLocalIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFullName:", v6);

  objc_msgSend(v3, "personUri");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCNIdentifier:", v7);

  objc_msgSend(v5, "setIsUserCreated:", objc_msgSend(v3, "isVerified"));
  objc_msgSend(v5, "setIsFavorite:", objc_msgSend(v3, "type") == 1);
  objc_msgSend(v5, "setIsHidden:", objc_msgSend(v3, "type") == -1);
  objc_msgSend(v3, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSourceService:andID:", CFSTR("photoskit"), v8);
  return v5;
}

+ (id)personWithGDIdentifier:(id)a3
{
  id v3;
  CLSPersonIdentity *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(CLSPersonIdentity);
  -[CLSPersonIdentity setGDIdentifier:](v4, "setGDIdentifier:", v3);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Creating person with GDIdentifier: %@", (uint8_t *)&v6, 0xCu);
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)presentationStringForPeople:(id)a3
{
  return (id)objc_msgSend(a1, "presentationStringForPeople:withScores:", a3, MEMORY[0x1E0C9AA60]);
}

+ (id)presentationStringForPeople:(id)a3 withScores:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v7 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1005;
  v34 = __Block_byref_object_dispose__1006;
  v35 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _sortedPeopleByScores(v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __60__CLSPersonIdentity_presentationStringForPeople_withScores___block_invoke;
  v24[3] = &unk_1E84F7680;
  v14 = v9;
  v25 = v14;
  v28 = &v30;
  v29 = a1;
  v15 = v8;
  v26 = v15;
  v16 = v10;
  v27 = v16;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v24);
  if (v31[5])
    objc_msgSend(v11, "addObject:", CFSTR("my wife"));
  if ((unint64_t)objc_msgSend(v15, "count") > 4
    || objc_msgSend(v15, "count") && (unint64_t)objc_msgSend(v6, "count") >= 9)
  {
    objc_msgSend(v11, "addObject:", CFSTR("my family"));
  }
  else
  {
    _familyPresentationStringsForPersons(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v17);

  }
  if ((unint64_t)objc_msgSend(v14, "count") > 4
    || objc_msgSend(v14, "count") && (unint64_t)objc_msgSend(v6, "count") >= 9)
  {
    objc_msgSend(v11, "addObject:", CFSTR("my friends"));
  }
  else
  {
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __60__CLSPersonIdentity_presentationStringForPeople_withScores___block_invoke_2;
    v22[3] = &unk_1E84F7608;
    v23 = v11;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v22);

  }
  if ((unint64_t)objc_msgSend(v16, "count") > 4
    || objc_msgSend(v16, "count") && (unint64_t)objc_msgSend(v6, "count") >= 9)
  {
    objc_msgSend(v11, "addObject:", CFSTR("my coworkers"));
  }
  else
  {
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __60__CLSPersonIdentity_presentationStringForPeople_withScores___block_invoke_3;
    v20[3] = &unk_1E84F7608;
    v21 = v11;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v20);

  }
  _flattenPresentationStringFromTokens(v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v30, 8);
  return v18;
}

+ (BOOL)isParentRelationship:(unint64_t)a3
{
  return a3 == 10 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 8;
}

+ (BOOL)isChildRelationship:(unint64_t)a3
{
  return a3 - 5 < 3;
}

+ (BOOL)isSiblingRelationship:(unint64_t)a3
{
  return a3 - 11 < 2;
}

+ (BOOL)isFamilyRelationship:(unint64_t)a3
{
  if (a3 == 4
    || (objc_msgSend(a1, "isSiblingRelationship:") & 1) != 0
    || (objc_msgSend(a1, "isChildRelationship:", a3) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "isParentRelationship:", a3);
  }
}

+ (id)_personRelationshipVocabularyByLocaleDictionary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__CLSPersonIdentity__personRelationshipVocabularyByLocaleDictionary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_personRelationshipVocabularyByLocaleDictionary_onceToken != -1)
    dispatch_once(&_personRelationshipVocabularyByLocaleDictionary_onceToken, block);
  return (id)_personRelationshipVocabularyByLocaleDictionary_sPersonRelationshipVocabularyByLocaleDictionary;
}

+ (id)relationshipRegularExpressionForRelationship:(unint64_t)a3 locale:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;

  objc_msgSend(a4, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (relationshipRegularExpressionForRelationship_locale__onceToken != -1)
    dispatch_once(&relationshipRegularExpressionForRelationship_locale__onceToken, &__block_literal_global_1003);
  objc_msgSend((id)relationshipRegularExpressionForRelationship_locale__cachedRegularExpressionByRelationshipByLocale, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_personRelationshipVocabularyByLocaleDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __73__CLSPersonIdentity_relationshipRegularExpressionForRelationship_locale___block_invoke_2;
      v19 = &unk_1E84F9258;
      v11 = v8;
      v20 = v11;
      v12 = v6;
      v21 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", &v16);
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v11, v16, v17, v18, v19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)relationshipRegularExpressionForRelationship_locale__cachedRegularExpressionByRelationshipByLocale, "setObject:forKey:", v7, v12);

    }
    else
    {
      v7 = 0;
    }

  }
  objc_msgSend(a1, "descriptionForPersonRelationship:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)descriptionForPersonRelationship:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("father");
  if (a3 != 10)
    v3 = 0;
  if (a3 == 9)
    return CFSTR("mother");
  else
    return (id)v3;
}

void __73__CLSPersonIdentity_relationshipRegularExpressionForRelationship_locale___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a2;
  objc_msgSend(a3, "componentsJoinedByString:", CFSTR("|"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("^(%@)$"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v8, 1, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  if (v10)
    NSLog(CFSTR("Error creating regular expression from relationship vocabulary for language %@ and relationship %@"), *(_QWORD *)(a1 + 40), v6);
  else
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v6);

}

void __73__CLSPersonIdentity_relationshipRegularExpressionForRelationship_locale___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)relationshipRegularExpressionForRelationship_locale__cachedRegularExpressionByRelationshipByLocale;
  relationshipRegularExpressionForRelationship_locale__cachedRegularExpressionByRelationshipByLocale = v0;

}

void __68__CLSPersonIdentity__personRelationshipVocabularyByLocaleDictionary__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("personRelationshipVocabulary"), CFSTR("plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_personRelationshipVocabularyByLocaleDictionary_sPersonRelationshipVocabularyByLocaleDictionary;
  _personRelationshipVocabularyByLocaleDictionary_sPersonRelationshipVocabularyByLocaleDictionary = v1;

}

void __60__CLSPersonIdentity_presentationStringForPeople_withScores___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "relationship") == 2)
  {
    v4 = *(void **)(a1 + 32);
LABEL_9:
    objc_msgSend(v4, "addObject:", v5);
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "relationship") == 13)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 64), "isFamilyRelationship:", objc_msgSend(v5, "relationship")))
    {
      v4 = *(void **)(a1 + 40);
      goto LABEL_9;
    }
    if (objc_msgSend(v5, "relationship") == 1)
    {
      v4 = *(void **)(a1 + 48);
      goto LABEL_9;
    }
  }
LABEL_10:

}

void __60__CLSPersonIdentity_presentationStringForPeople_withScores___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "presentationString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __60__CLSPersonIdentity_presentationStringForPeople_withScores___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "presentationString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
