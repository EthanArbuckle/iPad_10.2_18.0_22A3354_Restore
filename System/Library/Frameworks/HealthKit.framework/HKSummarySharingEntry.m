@implementation HKSummarySharingEntry

- (HKSummarySharingEntry)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKSummarySharingEntry)initWithUUID:(id)a3 primaryContactIdentifier:(id)a4 allContactIdentifiers:(id)a5 firstName:(id)a6 lastName:(id)a7 userWheelchairMode:(int64_t)a8 type:(int64_t)a9 status:(int64_t)a10 notificationStatus:(int64_t)a11 direction:(unint64_t)a12 modificationDate:(id)a13
{
  uint64_t v14;

  LOBYTE(v14) = 0;
  return -[HKSummarySharingEntry initWithUUID:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:userWheelchairMode:type:status:notificationStatus:direction:modificationDate:dateAccepted:dateInvited:profileIdentifier:CNContactIdentifier:isPaused:](self, "initWithUUID:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:userWheelchairMode:type:status:notificationStatus:direction:modificationDate:dateAccepted:dateInvited:profileIdentifier:CNContactIdentifier:isPaused:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, 0, 0, 0, 0, v14);
}

- (HKSummarySharingEntry)initWithUUID:(id)a3 primaryContactIdentifier:(id)a4 allContactIdentifiers:(id)a5 firstName:(id)a6 lastName:(id)a7 type:(int64_t)a8 status:(int64_t)a9 notificationStatus:(int64_t)a10 direction:(unint64_t)a11 modificationDate:(id)a12
{
  return -[HKSummarySharingEntry initWithUUID:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:userWheelchairMode:type:status:notificationStatus:direction:modificationDate:](self, "initWithUUID:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:userWheelchairMode:type:status:notificationStatus:direction:modificationDate:", a3, a4, a5, a6, a7, 0, a8, a9, a10, a11, a12);
}

- (HKSummarySharingEntry)initWithUUID:(id)a3 primaryContactIdentifier:(id)a4 allContactIdentifiers:(id)a5 firstName:(id)a6 lastName:(id)a7 userWheelchairMode:(int64_t)a8 type:(int64_t)a9 status:(int64_t)a10 notificationStatus:(int64_t)a11 direction:(unint64_t)a12 modificationDate:(id)a13 dateAccepted:(id)a14 dateInvited:(id)a15 profileIdentifier:(id)a16 CNContactIdentifier:(id)a17 isPaused:(BOOL)a18
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  HKSummarySharingEntry *v30;
  HKSummarySharingEntry *v31;
  uint64_t v32;
  NSString *primaryContactIdentifier;
  uint64_t v34;
  NSArray *allContactIdentifiers;
  uint64_t v36;
  NSString *firstName;
  uint64_t v38;
  NSString *lastName;
  NSDate *v40;
  NSDate *modificationDate;
  uint64_t v42;
  HKProfileIdentifier *profileIdentifier;
  uint64_t v44;
  NSString *CNContactIdentifier;
  id v50;
  id v51;
  objc_super v52;

  v51 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = a7;
  v26 = a13;
  v50 = a14;
  v27 = a15;
  v28 = a16;
  v29 = a17;
  v52.receiver = self;
  v52.super_class = (Class)HKSummarySharingEntry;
  v30 = -[HKSummarySharingEntry init](&v52, sel_init);
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_UUID, a3);
    v32 = objc_msgSend(v22, "copy");
    primaryContactIdentifier = v31->_primaryContactIdentifier;
    v31->_primaryContactIdentifier = (NSString *)v32;

    v34 = objc_msgSend(v23, "copy");
    allContactIdentifiers = v31->_allContactIdentifiers;
    v31->_allContactIdentifiers = (NSArray *)v34;

    v36 = objc_msgSend(v24, "copy");
    firstName = v31->_firstName;
    v31->_firstName = (NSString *)v36;

    v38 = objc_msgSend(v25, "copy");
    lastName = v31->_lastName;
    v31->_lastName = (NSString *)v38;

    v31->_userWheelchairMode = a8;
    v31->_type = a9;
    v31->_status = a10;
    v31->_direction = a12;
    v31->_notificationStatus = a11;
    if (v26)
    {
      v40 = (NSDate *)v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v40 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    modificationDate = v31->_modificationDate;
    v31->_modificationDate = v40;

    objc_storeStrong((id *)&v31->_dateAccepted, a14);
    objc_storeStrong((id *)&v31->_dateInvited, a15);
    v42 = objc_msgSend(v28, "copy");
    profileIdentifier = v31->_profileIdentifier;
    v31->_profileIdentifier = (HKProfileIdentifier *)v42;

    v44 = objc_msgSend(v29, "copy");
    CNContactIdentifier = v31->_CNContactIdentifier;
    v31->_CNContactIdentifier = (NSString *)v44;

    v31->_isPaused = a18;
  }

  return v31;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  NSString *firstName;
  NSString *primaryContactIdentifier;
  NSString *lastName;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSUUID *UUID;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UUID = self->_UUID;
  primaryContactIdentifier = self->_primaryContactIdentifier;
  firstName = self->_firstName;
  lastName = self->_lastName;
  HKWheelchairUseDisplayName(self->_userWheelchairMode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKStringForSharingType(self->_type);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HKStringForSharingStatus(self->_status);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKStringForNotificationStatus(self->_notificationStatus);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKStringForMessageDirection(self->_direction);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@:%p UUID=%@, primaryContactIdentifier=%@, firstName=%@, lastName=%@, userWheelchairMode=%@, type=%@, status=%@, notificationStatus=%@, direction=%@, modificationDate=%@, dateAccepted=%@, dateInvited=%@, CNContactIdentifier=%@, isPaused=%d>"), v4, self, UUID, primaryContactIdentifier, firstName, lastName, v8, v9, v10, v11, v12, self->_modificationDate, self->_dateAccepted, self->_dateInvited, self->_CNContactIdentifier, self->_isPaused);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_setProfileIdentifier:(id)a3
{
  HKProfileIdentifier *v4;
  HKProfileIdentifier *profileIdentifier;

  v4 = (HKProfileIdentifier *)objc_msgSend(a3, "copy");
  profileIdentifier = self->_profileIdentifier;
  self->_profileIdentifier = v4;

}

- (void)_setCNContactIdentifier:(id)a3
{
  NSString *v4;
  NSString *CNContactIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  CNContactIdentifier = self->_CNContactIdentifier;
  self->_CNContactIdentifier = v4;

}

- (void)_setDateAccepted:(id)a3
{
  NSDate *v4;
  NSDate *dateAccepted;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  dateAccepted = self->_dateAccepted;
  self->_dateAccepted = v4;

}

- (void)_setDateInvited:(id)a3
{
  NSDate *v4;
  NSDate *dateInvited;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  dateInvited = self->_dateInvited;
  self->_dateInvited = v4;

}

- (void)_setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_UUID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKSummarySharingEntry *v4;
  HKSummarySharingEntry *v5;
  NSUUID *UUID;
  void *v7;
  NSString *primaryContactIdentifier;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSString *v13;
  void *v14;
  BOOL v15;
  NSArray *allContactIdentifiers;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSArray *v20;
  void *v21;
  NSString *firstName;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSString *v26;
  void *v27;
  NSString *lastName;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSString *v32;
  void *v33;
  int64_t userWheelchairMode;
  int64_t type;
  int64_t status;
  int64_t notificationStatus;
  unint64_t direction;
  NSDate *modificationDate;
  NSDate *v40;
  NSDate *dateAccepted;
  NSDate *v42;
  HKProfileIdentifier *profileIdentifier;
  HKProfileIdentifier *v44;
  NSString *CNContactIdentifier;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSString *v49;
  void *v50;
  _BOOL4 isPaused;

  v4 = (HKSummarySharingEntry *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      UUID = self->_UUID;
      -[HKSummarySharingEntry UUID](v5, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(UUID) = -[NSUUID isEqual:](UUID, "isEqual:", v7);

      if (!(_DWORD)UUID)
        goto LABEL_39;
      primaryContactIdentifier = self->_primaryContactIdentifier;
      -[HKSummarySharingEntry primaryContactIdentifier](v5, "primaryContactIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      if (primaryContactIdentifier == (NSString *)v9)
      {

      }
      else
      {
        v10 = (void *)v9;
        -[HKSummarySharingEntry primaryContactIdentifier](v5, "primaryContactIdentifier");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
          goto LABEL_38;
        v12 = (void *)v11;
        v13 = self->_primaryContactIdentifier;
        -[HKSummarySharingEntry primaryContactIdentifier](v5, "primaryContactIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v13) = -[NSString isEqualToString:](v13, "isEqualToString:", v14);

        if (!(_DWORD)v13)
          goto LABEL_39;
      }
      allContactIdentifiers = self->_allContactIdentifiers;
      -[HKSummarySharingEntry allContactIdentifiers](v5, "allContactIdentifiers");
      v17 = objc_claimAutoreleasedReturnValue();
      if (allContactIdentifiers == (NSArray *)v17)
      {

      }
      else
      {
        v10 = (void *)v17;
        -[HKSummarySharingEntry allContactIdentifiers](v5, "allContactIdentifiers");
        v18 = objc_claimAutoreleasedReturnValue();
        if (!v18)
          goto LABEL_38;
        v19 = (void *)v18;
        v20 = self->_allContactIdentifiers;
        -[HKSummarySharingEntry allContactIdentifiers](v5, "allContactIdentifiers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v20) = -[NSArray isEqualToArray:](v20, "isEqualToArray:", v21);

        if (!(_DWORD)v20)
          goto LABEL_39;
      }
      firstName = self->_firstName;
      -[HKSummarySharingEntry firstName](v5, "firstName");
      v23 = objc_claimAutoreleasedReturnValue();
      if (firstName == (NSString *)v23)
      {

      }
      else
      {
        v10 = (void *)v23;
        -[HKSummarySharingEntry firstName](v5, "firstName");
        v24 = objc_claimAutoreleasedReturnValue();
        if (!v24)
          goto LABEL_38;
        v25 = (void *)v24;
        v26 = self->_firstName;
        -[HKSummarySharingEntry firstName](v5, "firstName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v26) = -[NSString isEqualToString:](v26, "isEqualToString:", v27);

        if (!(_DWORD)v26)
          goto LABEL_39;
      }
      lastName = self->_lastName;
      -[HKSummarySharingEntry lastName](v5, "lastName");
      v29 = objc_claimAutoreleasedReturnValue();
      if (lastName == (NSString *)v29)
      {

      }
      else
      {
        v10 = (void *)v29;
        -[HKSummarySharingEntry lastName](v5, "lastName");
        v30 = objc_claimAutoreleasedReturnValue();
        if (!v30)
          goto LABEL_38;
        v31 = (void *)v30;
        v32 = self->_lastName;
        -[HKSummarySharingEntry lastName](v5, "lastName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v32) = -[NSString isEqualToString:](v32, "isEqualToString:", v33);

        if (!(_DWORD)v32)
          goto LABEL_39;
      }
      userWheelchairMode = self->_userWheelchairMode;
      if (userWheelchairMode != -[HKSummarySharingEntry userWheelchairMode](v5, "userWheelchairMode"))
        goto LABEL_39;
      type = self->_type;
      if (type != -[HKSummarySharingEntry type](v5, "type"))
        goto LABEL_39;
      status = self->_status;
      if (status != -[HKSummarySharingEntry status](v5, "status"))
        goto LABEL_39;
      notificationStatus = self->_notificationStatus;
      if (notificationStatus != -[HKSummarySharingEntry notificationStatus](v5, "notificationStatus"))
        goto LABEL_39;
      direction = self->_direction;
      if (direction != -[HKSummarySharingEntry direction](v5, "direction"))
        goto LABEL_39;
      modificationDate = self->_modificationDate;
      -[HKSummarySharingEntry modificationDate](v5, "modificationDate");
      v40 = (NSDate *)objc_claimAutoreleasedReturnValue();

      if (modificationDate != v40)
        goto LABEL_39;
      dateAccepted = self->_dateAccepted;
      -[HKSummarySharingEntry dateAccepted](v5, "dateAccepted");
      v42 = (NSDate *)objc_claimAutoreleasedReturnValue();

      if (dateAccepted != v42)
        goto LABEL_39;
      profileIdentifier = self->_profileIdentifier;
      -[HKSummarySharingEntry profileIdentifier](v5, "profileIdentifier");
      v44 = (HKProfileIdentifier *)objc_claimAutoreleasedReturnValue();

      if (profileIdentifier != v44)
        goto LABEL_39;
      CNContactIdentifier = self->_CNContactIdentifier;
      -[HKSummarySharingEntry CNContactIdentifier](v5, "CNContactIdentifier");
      v46 = objc_claimAutoreleasedReturnValue();
      if (CNContactIdentifier == (NSString *)v46)
      {

LABEL_43:
        isPaused = self->_isPaused;
        v15 = isPaused == -[HKSummarySharingEntry isPaused](v5, "isPaused");
        goto LABEL_40;
      }
      v10 = (void *)v46;
      -[HKSummarySharingEntry CNContactIdentifier](v5, "CNContactIdentifier");
      v47 = objc_claimAutoreleasedReturnValue();
      if (v47)
      {
        v48 = (void *)v47;
        v49 = self->_CNContactIdentifier;
        -[HKSummarySharingEntry CNContactIdentifier](v5, "CNContactIdentifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v49) = -[NSString isEqualToString:](v49, "isEqualToString:", v50);

        if ((_DWORD)v49)
          goto LABEL_43;
LABEL_39:
        v15 = 0;
LABEL_40:

        goto LABEL_41;
      }
LABEL_38:

      goto LABEL_39;
    }
    v15 = 0;
  }
LABEL_41:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HKSummarySharingEntry *v4;
  uint64_t v6;

  v4 = +[HKSummarySharingEntry allocWithZone:](HKSummarySharingEntry, "allocWithZone:", a3);
  LOBYTE(v6) = self->_isPaused;
  return -[HKSummarySharingEntry initWithUUID:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:userWheelchairMode:type:status:notificationStatus:direction:modificationDate:dateAccepted:dateInvited:profileIdentifier:CNContactIdentifier:isPaused:](v4, "initWithUUID:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:userWheelchairMode:type:status:notificationStatus:direction:modificationDate:dateAccepted:dateInvited:profileIdentifier:CNContactIdentifier:isPaused:", self->_UUID, self->_primaryContactIdentifier, self->_allContactIdentifiers, self->_firstName, self->_lastName, self->_userWheelchairMode, self->_type, self->_status, self->_notificationStatus, self->_direction, self->_modificationDate, self->_dateAccepted, self->_dateInvited, self->_profileIdentifier, self->_CNContactIdentifier, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("UUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryContactIdentifier, CFSTR("PrimaryContactIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allContactIdentifiers, CFSTR("AllContactIdentifiersKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstName, CFSTR("FirstName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastName, CFSTR("LastName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_userWheelchairMode, CFSTR("UserWheelchairModeKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("Type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("Status"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_notificationStatus, CFSTR("NotificationStatus"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_direction, CFSTR("Direction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modificationDate, CFSTR("ModificationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateAccepted, CFSTR("DateAccepted"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInvited, CFSTR("DateInvited"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_profileIdentifier, CFSTR("ProfileIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_CNContactIdentifier, CFSTR("CNContactIdentifierKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPaused, CFSTR("IsPaused"));

}

- (HKSummarySharingEntry)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  HKSummarySharingEntry *v23;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrimaryContactIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("AllContactIdentifiersKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FirstName"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastName"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("UserWheelchairModeKey"));
  v17 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("Type"));
  v15 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("Status"));
  v4 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("NotificationStatus"));
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("Direction"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ModificationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DateAccepted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DateInvited"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProfileIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CNContactIdentifierKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("IsPaused"));

  LOBYTE(v13) = v11;
  v23 = -[HKSummarySharingEntry initWithUUID:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:userWheelchairMode:type:status:notificationStatus:direction:modificationDate:dateAccepted:dateInvited:profileIdentifier:CNContactIdentifier:isPaused:](self, "initWithUUID:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:userWheelchairMode:type:status:notificationStatus:direction:modificationDate:dateAccepted:dateInvited:profileIdentifier:CNContactIdentifier:isPaused:", v21, v16, v14, v20, v19, v18, v17, v15, v4, v5, v6, v7, v8, v9, v10, v13);

  return v23;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)CNContactIdentifier
{
  return self->_CNContactIdentifier;
}

- (NSString)primaryContactIdentifier
{
  return self->_primaryContactIdentifier;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (int64_t)userWheelchairMode
{
  return self->_userWheelchairMode;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)status
{
  return self->_status;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (int64_t)notificationStatus
{
  return self->_notificationStatus;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSDate)dateInvited
{
  return self->_dateInvited;
}

- (NSDate)dateAccepted
{
  return self->_dateAccepted;
}

- (HKProfileIdentifier)profileIdentifier
{
  return self->_profileIdentifier;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (NSArray)allContactIdentifiers
{
  return self->_allContactIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_dateAccepted, 0);
  objc_storeStrong((id *)&self->_dateInvited, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_primaryContactIdentifier, 0);
  objc_storeStrong((id *)&self->_CNContactIdentifier, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
