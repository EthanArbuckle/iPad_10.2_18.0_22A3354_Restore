@implementation HDCodableSummarySharingEntry

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasPrimaryContactIdentifier
{
  return self->_primaryContactIdentifier != 0;
}

- (void)clearAllContactIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_allContactIdentifiers, "removeAllObjects");
}

- (void)addAllContactIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *allContactIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  allContactIdentifiers = self->_allContactIdentifiers;
  v8 = v4;
  if (!allContactIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_allContactIdentifiers;
    self->_allContactIdentifiers = v6;

    v4 = v8;
    allContactIdentifiers = self->_allContactIdentifiers;
  }
  -[NSMutableArray addObject:](allContactIdentifiers, "addObject:", v4);

}

- (unint64_t)allContactIdentifiersCount
{
  return -[NSMutableArray count](self->_allContactIdentifiers, "count");
}

- (id)allContactIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_allContactIdentifiers, "objectAtIndex:", a3);
}

+ (Class)allContactIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasFirstName
{
  return self->_firstName != 0;
}

- (BOOL)hasLastName
{
  return self->_lastName != 0;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Invite");
  if (a3 == 1)
  {
    v3 = CFSTR("Request");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Invite")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Request"));

  return v4;
}

- (int)direction
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_direction;
  else
    return 0;
}

- (void)setDirection:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_direction = a3;
}

- (void)setHasDirection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDirection
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)directionAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Outgoing");
  if (a3 == 1)
  {
    v3 = CFSTR("Incoming");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsDirection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Outgoing")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Incoming"));

  return v4;
}

- (int)status
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_status;
  else
    return 0;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 < 5)
    return off_1E6CF5910[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Pending")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Accepted")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Declined")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Rescinded")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Revoked")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasSharingSetupMetadata
{
  return self->_sharingSetupMetadata != 0;
}

- (void)setDateModified:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_dateModified = a3;
}

- (void)setHasDateModified:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDateModified
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearAuthorizationCategories
{
  -[NSMutableArray removeAllObjects](self->_authorizationCategories, "removeAllObjects");
}

- (void)addAuthorizationCategories:(id)a3
{
  id v4;
  NSMutableArray *authorizationCategories;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  authorizationCategories = self->_authorizationCategories;
  v8 = v4;
  if (!authorizationCategories)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_authorizationCategories;
    self->_authorizationCategories = v6;

    v4 = v8;
    authorizationCategories = self->_authorizationCategories;
  }
  -[NSMutableArray addObject:](authorizationCategories, "addObject:", v4);

}

- (unint64_t)authorizationCategoriesCount
{
  return -[NSMutableArray count](self->_authorizationCategories, "count");
}

- (id)authorizationCategoriesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_authorizationCategories, "objectAtIndex:", a3);
}

+ (Class)authorizationCategoriesType
{
  return (Class)objc_opt_class();
}

- (void)setDateAccepted:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dateAccepted = a3;
}

- (void)setHasDateAccepted:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateAccepted
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDateInvited:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dateInvited = a3;
}

- (void)setHasDateInvited:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDateInvited
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasInvitationUUID
{
  return self->_invitationUUID != 0;
}

- (BOOL)hasCloudKitIdentifier
{
  return self->_cloudKitIdentifier != 0;
}

- (BOOL)hasOwnerParticipant
{
  return self->_ownerParticipant != 0;
}

- (int)notificationStatus
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_notificationStatus;
  else
    return 0;
}

- (void)setNotificationStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_notificationStatus = a3;
}

- (void)setHasNotificationStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNotificationStatus
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)notificationStatusAsString:(int)a3
{
  if (a3 < 3)
    return off_1E6CF5938[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNotificationStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Pending")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Accepted")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearSharingAuthorizations
{
  -[NSMutableArray removeAllObjects](self->_sharingAuthorizations, "removeAllObjects");
}

- (void)addSharingAuthorizations:(id)a3
{
  id v4;
  NSMutableArray *sharingAuthorizations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  sharingAuthorizations = self->_sharingAuthorizations;
  v8 = v4;
  if (!sharingAuthorizations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_sharingAuthorizations;
    self->_sharingAuthorizations = v6;

    v4 = v8;
    sharingAuthorizations = self->_sharingAuthorizations;
  }
  -[NSMutableArray addObject:](sharingAuthorizations, "addObject:", v4);

}

- (unint64_t)sharingAuthorizationsCount
{
  return -[NSMutableArray count](self->_sharingAuthorizations, "count");
}

- (id)sharingAuthorizationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_sharingAuthorizations, "objectAtIndex:", a3);
}

+ (Class)sharingAuthorizationsType
{
  return (Class)objc_opt_class();
}

- (int)userWheelchairMode
{
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    return self->_userWheelchairMode;
  else
    return 0;
}

- (void)setUserWheelchairMode:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_userWheelchairMode = a3;
}

- (void)setHasUserWheelchairMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasUserWheelchairMode
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)userWheelchairModeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E6CF5950[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUserWheelchairMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotSet")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("No")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Yes")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSummarySharingEntry;
  -[HDCodableSummarySharingEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSummarySharingEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuid;
  NSString *primaryContactIdentifier;
  NSMutableArray *allContactIdentifiers;
  NSString *firstName;
  NSString *lastName;
  char has;
  int type;
  __CFString *v12;
  int direction;
  __CFString *v14;
  uint64_t status;
  __CFString *v16;
  HDCodableSharingSetupMetadata *sharingSetupMetadata;
  void *v18;
  void *v19;
  NSMutableArray *authorizationCategories;
  char v21;
  void *v22;
  void *v23;
  NSString *invitationUUID;
  NSString *cloudKitIdentifier;
  NSData *ownerParticipant;
  uint64_t notificationStatus;
  __CFString *v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  uint64_t userWheelchairMode;
  __CFString *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  primaryContactIdentifier = self->_primaryContactIdentifier;
  if (primaryContactIdentifier)
    objc_msgSend(v4, "setObject:forKey:", primaryContactIdentifier, CFSTR("primaryContactIdentifier"));
  allContactIdentifiers = self->_allContactIdentifiers;
  if (allContactIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", allContactIdentifiers, CFSTR("allContactIdentifiers"));
  firstName = self->_firstName;
  if (firstName)
    objc_msgSend(v4, "setObject:forKey:", firstName, CFSTR("firstName"));
  lastName = self->_lastName;
  if (lastName)
    objc_msgSend(v4, "setObject:forKey:", lastName, CFSTR("lastName"));
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    type = self->_type;
    if (type)
    {
      if (type == 1)
      {
        v12 = CFSTR("Request");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v12 = CFSTR("Invite");
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("type"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_13:
      if ((has & 0x20) == 0)
        goto LABEL_31;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_13;
  }
  direction = self->_direction;
  if (direction)
  {
    if (direction == 1)
    {
      v14 = CFSTR("Incoming");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_direction);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v14 = CFSTR("Outgoing");
  }
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("direction"));

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_27:
    status = self->_status;
    if (status >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_status);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E6CF5910[status];
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("status"));

  }
LABEL_31:
  sharingSetupMetadata = self->_sharingSetupMetadata;
  if (sharingSetupMetadata)
  {
    -[HDCodableSharingSetupMetadata dictionaryRepresentation](sharingSetupMetadata, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("sharingSetupMetadata"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateModified);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("dateModified"));

  }
  authorizationCategories = self->_authorizationCategories;
  if (authorizationCategories)
    objc_msgSend(v4, "setObject:forKey:", authorizationCategories, CFSTR("authorizationCategories"));
  v21 = (char)self->_has;
  if ((v21 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateAccepted);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("dateAccepted"));

    v21 = (char)self->_has;
  }
  if ((v21 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateInvited);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("dateInvited"));

  }
  invitationUUID = self->_invitationUUID;
  if (invitationUUID)
    objc_msgSend(v4, "setObject:forKey:", invitationUUID, CFSTR("invitationUUID"));
  cloudKitIdentifier = self->_cloudKitIdentifier;
  if (cloudKitIdentifier)
    objc_msgSend(v4, "setObject:forKey:", cloudKitIdentifier, CFSTR("cloudKitIdentifier"));
  ownerParticipant = self->_ownerParticipant;
  if (ownerParticipant)
    objc_msgSend(v4, "setObject:forKey:", ownerParticipant, CFSTR("ownerParticipant"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    notificationStatus = self->_notificationStatus;
    if (notificationStatus >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_notificationStatus);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_1E6CF5938[notificationStatus];
    }
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("notificationStatus"));

  }
  if (-[NSMutableArray count](self->_sharingAuthorizations, "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_sharingAuthorizations, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v30 = self->_sharingAuthorizations;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v40 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "dictionaryRepresentation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v35);

        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v32);
    }

    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("sharingAuthorizations"));
  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    userWheelchairMode = self->_userWheelchairMode;
    if (userWheelchairMode >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_userWheelchairMode);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = off_1E6CF5950[userWheelchairMode];
    }
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("userWheelchairMode"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSummarySharingEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  char v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_uuid)
    PBDataWriterWriteStringField();
  if (self->_primaryContactIdentifier)
    PBDataWriterWriteStringField();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_allContactIdentifiers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v7);
  }

  if (self->_firstName)
    PBDataWriterWriteStringField();
  if (self->_lastName)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_18:
      if ((has & 0x20) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
LABEL_19:
    PBDataWriterWriteInt32Field();
LABEL_20:
  if (self->_sharingSetupMetadata)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteDoubleField();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = self->_authorizationCategories;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v13);
  }

  v16 = (char)self->_has;
  if ((v16 & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v16 = (char)self->_has;
  }
  if ((v16 & 2) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_invitationUUID)
    PBDataWriterWriteStringField();
  if (self->_cloudKitIdentifier)
    PBDataWriterWriteStringField();
  if (self->_ownerParticipant)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = self->_sharingAuthorizations;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteSubmessage();
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v19);
  }

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _DWORD *v8;
  char has;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t k;
  void *v18;
  id v19;

  v19 = a3;
  if (self->_uuid)
    objc_msgSend(v19, "setUuid:");
  if (self->_primaryContactIdentifier)
    objc_msgSend(v19, "setPrimaryContactIdentifier:");
  if (-[HDCodableSummarySharingEntry allContactIdentifiersCount](self, "allContactIdentifiersCount"))
  {
    objc_msgSend(v19, "clearAllContactIdentifiers");
    v4 = -[HDCodableSummarySharingEntry allContactIdentifiersCount](self, "allContactIdentifiersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HDCodableSummarySharingEntry allContactIdentifiersAtIndex:](self, "allContactIdentifiersAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addAllContactIdentifiers:", v7);

      }
    }
  }
  if (self->_firstName)
    objc_msgSend(v19, "setFirstName:");
  v8 = v19;
  if (self->_lastName)
  {
    objc_msgSend(v19, "setLastName:");
    v8 = v19;
  }
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v8[33] = self->_type;
    *((_BYTE *)v8 + 152) |= 0x40u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_15:
      if ((has & 0x20) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_15;
  }
  v8[14] = self->_direction;
  *((_BYTE *)v8 + 152) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_16:
    v8[32] = self->_status;
    *((_BYTE *)v8 + 152) |= 0x20u;
  }
LABEL_17:
  if (self->_sharingSetupMetadata)
    objc_msgSend(v19, "setSharingSetupMetadata:");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)v19 + 3) = *(_QWORD *)&self->_dateModified;
    *((_BYTE *)v19 + 152) |= 4u;
  }
  if (-[HDCodableSummarySharingEntry authorizationCategoriesCount](self, "authorizationCategoriesCount"))
  {
    objc_msgSend(v19, "clearAuthorizationCategories");
    v10 = -[HDCodableSummarySharingEntry authorizationCategoriesCount](self, "authorizationCategoriesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[HDCodableSummarySharingEntry authorizationCategoriesAtIndex:](self, "authorizationCategoriesAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addAuthorizationCategories:", v13);

      }
    }
  }
  v14 = (char)self->_has;
  if ((v14 & 1) != 0)
  {
    *((_QWORD *)v19 + 1) = *(_QWORD *)&self->_dateAccepted;
    *((_BYTE *)v19 + 152) |= 1u;
    v14 = (char)self->_has;
  }
  if ((v14 & 2) != 0)
  {
    *((_QWORD *)v19 + 2) = *(_QWORD *)&self->_dateInvited;
    *((_BYTE *)v19 + 152) |= 2u;
  }
  if (self->_invitationUUID)
    objc_msgSend(v19, "setInvitationUUID:");
  if (self->_cloudKitIdentifier)
    objc_msgSend(v19, "setCloudKitIdentifier:");
  if (self->_ownerParticipant)
    objc_msgSend(v19, "setOwnerParticipant:");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v19 + 22) = self->_notificationStatus;
    *((_BYTE *)v19 + 152) |= 0x10u;
  }
  if (-[HDCodableSummarySharingEntry sharingAuthorizationsCount](self, "sharingAuthorizationsCount"))
  {
    objc_msgSend(v19, "clearSharingAuthorizations");
    v15 = -[HDCodableSummarySharingEntry sharingAuthorizationsCount](self, "sharingAuthorizationsCount");
    if (v15)
    {
      v16 = v15;
      for (k = 0; k != v16; ++k)
      {
        -[HDCodableSummarySharingEntry sharingAuthorizationsAtIndex:](self, "sharingAuthorizationsAtIndex:", k);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addSharingAuthorizations:", v18);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)v19 + 34) = self->_userWheelchairMode;
    *((_BYTE *)v19 + 152) |= 0x80u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char has;
  id v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  char v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v6;

  v8 = -[NSString copyWithZone:](self->_primaryContactIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v8;

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v10 = self->_allContactIdentifiers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v52 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAllContactIdentifiers:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v12);
  }

  v16 = -[NSString copyWithZone:](self->_firstName, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v16;

  v18 = -[NSString copyWithZone:](self->_lastName, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v18;

  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_type;
    *(_BYTE *)(v5 + 152) |= 0x40u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_10:
      if ((has & 0x20) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 56) = self->_direction;
  *(_BYTE *)(v5 + 152) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 128) = self->_status;
    *(_BYTE *)(v5 + 152) |= 0x20u;
  }
LABEL_12:
  v21 = -[HDCodableSharingSetupMetadata copyWithZone:](self->_sharingSetupMetadata, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v21;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_dateModified;
    *(_BYTE *)(v5 + 152) |= 4u;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v23 = self->_authorizationCategories;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v48 != v26)
          objc_enumerationMutation(v23);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAuthorizationCategories:", v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v25);
  }

  v29 = (char)self->_has;
  if ((v29 & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_dateAccepted;
    *(_BYTE *)(v5 + 152) |= 1u;
    v29 = (char)self->_has;
  }
  if ((v29 & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_dateInvited;
    *(_BYTE *)(v5 + 152) |= 2u;
  }
  v30 = -[NSString copyWithZone:](self->_invitationUUID, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v30;

  v32 = -[NSString copyWithZone:](self->_cloudKitIdentifier, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v32;

  v34 = -[NSData copyWithZone:](self->_ownerParticipant, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v34;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_notificationStatus;
    *(_BYTE *)(v5 + 152) |= 0x10u;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v36 = self->_sharingAuthorizations;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v44;
    do
    {
      for (k = 0; k != v38; ++k)
      {
        if (*(_QWORD *)v44 != v39)
          objc_enumerationMutation(v36);
        v41 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v43);
        objc_msgSend((id)v5, "addSharingAuthorizations:", v41);

      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    }
    while (v38);
  }

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_userWheelchairMode;
    *(_BYTE *)(v5 + 152) |= 0x80u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uuid;
  NSString *primaryContactIdentifier;
  NSMutableArray *allContactIdentifiers;
  NSString *firstName;
  NSString *lastName;
  char has;
  char v11;
  HDCodableSharingSetupMetadata *sharingSetupMetadata;
  NSMutableArray *authorizationCategories;
  NSString *invitationUUID;
  NSString *cloudKitIdentifier;
  NSData *ownerParticipant;
  char v17;
  char v18;
  NSMutableArray *sharingAuthorizations;
  BOOL v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_67;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
      goto LABEL_67;
  }
  primaryContactIdentifier = self->_primaryContactIdentifier;
  if ((unint64_t)primaryContactIdentifier | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](primaryContactIdentifier, "isEqual:"))
      goto LABEL_67;
  }
  allContactIdentifiers = self->_allContactIdentifiers;
  if ((unint64_t)allContactIdentifiers | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](allContactIdentifiers, "isEqual:"))
      goto LABEL_67;
  }
  firstName = self->_firstName;
  if ((unint64_t)firstName | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](firstName, "isEqual:"))
      goto LABEL_67;
  }
  lastName = self->_lastName;
  if ((unint64_t)lastName | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](lastName, "isEqual:"))
      goto LABEL_67;
  }
  has = (char)self->_has;
  v11 = *((_BYTE *)v4 + 152);
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 152) & 0x40) == 0 || self->_type != *((_DWORD *)v4 + 33))
      goto LABEL_67;
  }
  else if ((*((_BYTE *)v4 + 152) & 0x40) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 152) & 8) == 0 || self->_direction != *((_DWORD *)v4 + 14))
      goto LABEL_67;
  }
  else if ((*((_BYTE *)v4 + 152) & 8) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 152) & 0x20) == 0 || self->_status != *((_DWORD *)v4 + 32))
      goto LABEL_67;
  }
  else if ((*((_BYTE *)v4 + 152) & 0x20) != 0)
  {
    goto LABEL_67;
  }
  sharingSetupMetadata = self->_sharingSetupMetadata;
  if ((unint64_t)sharingSetupMetadata | *((_QWORD *)v4 + 15))
  {
    if (!-[HDCodableSharingSetupMetadata isEqual:](sharingSetupMetadata, "isEqual:"))
      goto LABEL_67;
    has = (char)self->_has;
    v11 = *((_BYTE *)v4 + 152);
  }
  if ((has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_dateModified != *((double *)v4 + 3))
      goto LABEL_67;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_67;
  }
  authorizationCategories = self->_authorizationCategories;
  if ((unint64_t)authorizationCategories | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](authorizationCategories, "isEqual:"))
      goto LABEL_67;
    has = (char)self->_has;
    v11 = *((_BYTE *)v4 + 152);
  }
  if ((has & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_dateAccepted != *((double *)v4 + 1))
      goto LABEL_67;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_dateInvited != *((double *)v4 + 2))
      goto LABEL_67;
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_67;
  }
  invitationUUID = self->_invitationUUID;
  if ((unint64_t)invitationUUID | *((_QWORD *)v4 + 9)
    && !-[NSString isEqual:](invitationUUID, "isEqual:"))
  {
    goto LABEL_67;
  }
  cloudKitIdentifier = self->_cloudKitIdentifier;
  if ((unint64_t)cloudKitIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](cloudKitIdentifier, "isEqual:"))
      goto LABEL_67;
  }
  ownerParticipant = self->_ownerParticipant;
  if ((unint64_t)ownerParticipant | *((_QWORD *)v4 + 12))
  {
    if (!-[NSData isEqual:](ownerParticipant, "isEqual:"))
      goto LABEL_67;
  }
  v17 = (char)self->_has;
  v18 = *((_BYTE *)v4 + 152);
  if ((v17 & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 152) & 0x10) == 0 || self->_notificationStatus != *((_DWORD *)v4 + 22))
      goto LABEL_67;
  }
  else if ((*((_BYTE *)v4 + 152) & 0x10) != 0)
  {
    goto LABEL_67;
  }
  sharingAuthorizations = self->_sharingAuthorizations;
  if ((unint64_t)sharingAuthorizations | *((_QWORD *)v4 + 14))
  {
    if (-[NSMutableArray isEqual:](sharingAuthorizations, "isEqual:"))
    {
      v17 = (char)self->_has;
      v18 = *((_BYTE *)v4 + 152);
      goto LABEL_62;
    }
LABEL_67:
    v20 = 0;
    goto LABEL_68;
  }
LABEL_62:
  if (v17 < 0)
  {
    if ((v18 & 0x80) == 0 || self->_userWheelchairMode != *((_DWORD *)v4 + 34))
      goto LABEL_67;
    v20 = 1;
  }
  else
  {
    v20 = v18 >= 0;
  }
LABEL_68:

  return v20;
}

- (unint64_t)hash
{
  unint64_t v3;
  double dateModified;
  double v5;
  long double v6;
  double v7;
  char has;
  unint64_t v9;
  double dateAccepted;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double dateInvited;
  double v16;
  long double v17;
  double v18;
  NSUInteger v19;
  NSUInteger v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSUInteger v32;
  NSUInteger v33;
  uint64_t v34;
  NSUInteger v35;
  NSUInteger v36;

  v36 = -[NSString hash](self->_uuid, "hash");
  v35 = -[NSString hash](self->_primaryContactIdentifier, "hash");
  v34 = -[NSMutableArray hash](self->_allContactIdentifiers, "hash");
  v33 = -[NSString hash](self->_firstName, "hash");
  v32 = -[NSString hash](self->_lastName, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    v31 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
LABEL_6:
    v30 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v31 = 2654435761 * self->_type;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_6;
LABEL_3:
  v30 = 2654435761 * self->_direction;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v29 = 2654435761 * self->_status;
    goto LABEL_8;
  }
LABEL_7:
  v29 = 0;
LABEL_8:
  v28 = -[HDCodableSharingSetupMetadata hash](self->_sharingSetupMetadata, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    dateModified = self->_dateModified;
    v5 = -dateModified;
    if (dateModified >= 0.0)
      v5 = self->_dateModified;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v26 = -[NSMutableArray hash](self->_authorizationCategories, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    dateAccepted = self->_dateAccepted;
    v11 = -dateAccepted;
    if (dateAccepted >= 0.0)
      v11 = self->_dateAccepted;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 2) != 0)
  {
    dateInvited = self->_dateInvited;
    v16 = -dateInvited;
    if (dateInvited >= 0.0)
      v16 = self->_dateInvited;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  v19 = -[NSString hash](self->_invitationUUID, "hash", v26);
  v20 = -[NSString hash](self->_cloudKitIdentifier, "hash");
  v21 = -[NSData hash](self->_ownerParticipant, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v22 = 2654435761 * self->_notificationStatus;
  else
    v22 = 0;
  v23 = -[NSMutableArray hash](self->_sharingAuthorizations, "hash");
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    v24 = 2654435761 * self->_userWheelchairMode;
  else
    v24 = 0;
  return v35 ^ v36 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v3 ^ v27 ^ v9 ^ v14 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  HDCodableSharingSetupMetadata *sharingSetupMetadata;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  char v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (*((_QWORD *)v4 + 18))
    -[HDCodableSummarySharingEntry setUuid:](self, "setUuid:");
  if (*((_QWORD *)v4 + 13))
    -[HDCodableSummarySharingEntry setPrimaryContactIdentifier:](self, "setPrimaryContactIdentifier:");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        -[HDCodableSummarySharingEntry addAllContactIdentifiers:](self, "addAllContactIdentifiers:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 8))
    -[HDCodableSummarySharingEntry setFirstName:](self, "setFirstName:");
  if (*((_QWORD *)v4 + 10))
    -[HDCodableSummarySharingEntry setLastName:](self, "setLastName:");
  v10 = v4[152];
  if ((v10 & 0x40) != 0)
  {
    self->_type = *((_DWORD *)v4 + 33);
    *(_BYTE *)&self->_has |= 0x40u;
    v10 = v4[152];
    if ((v10 & 8) == 0)
    {
LABEL_18:
      if ((v10 & 0x20) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((v4[152] & 8) == 0)
  {
    goto LABEL_18;
  }
  self->_direction = *((_DWORD *)v4 + 14);
  *(_BYTE *)&self->_has |= 8u;
  if ((v4[152] & 0x20) != 0)
  {
LABEL_19:
    self->_status = *((_DWORD *)v4 + 32);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_20:
  sharingSetupMetadata = self->_sharingSetupMetadata;
  v12 = *((_QWORD *)v4 + 15);
  if (sharingSetupMetadata)
  {
    if (v12)
      -[HDCodableSharingSetupMetadata mergeFrom:](sharingSetupMetadata, "mergeFrom:");
  }
  else if (v12)
  {
    -[HDCodableSummarySharingEntry setSharingSetupMetadata:](self, "setSharingSetupMetadata:");
  }
  if ((v4[152] & 4) != 0)
  {
    self->_dateModified = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = *((id *)v4 + 5);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        -[HDCodableSummarySharingEntry addAuthorizationCategories:](self, "addAuthorizationCategories:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v15);
  }

  v18 = v4[152];
  if ((v18 & 1) != 0)
  {
    self->_dateAccepted = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v18 = v4[152];
  }
  if ((v18 & 2) != 0)
  {
    self->_dateInvited = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 9))
    -[HDCodableSummarySharingEntry setInvitationUUID:](self, "setInvitationUUID:");
  if (*((_QWORD *)v4 + 6))
    -[HDCodableSummarySharingEntry setCloudKitIdentifier:](self, "setCloudKitIdentifier:");
  if (*((_QWORD *)v4 + 12))
    -[HDCodableSummarySharingEntry setOwnerParticipant:](self, "setOwnerParticipant:");
  if ((v4[152] & 0x10) != 0)
  {
    self->_notificationStatus = *((_DWORD *)v4 + 22);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = *((id *)v4 + 14);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        -[HDCodableSummarySharingEntry addSharingAuthorizations:](self, "addSharingAuthorizations:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * k), (_QWORD)v24);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v21);
  }

  if (v4[152] < 0)
  {
    self->_userWheelchairMode = *((_DWORD *)v4 + 34);
    *(_BYTE *)&self->_has |= 0x80u;
  }

}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)primaryContactIdentifier
{
  return self->_primaryContactIdentifier;
}

- (void)setPrimaryContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_primaryContactIdentifier, a3);
}

- (NSMutableArray)allContactIdentifiers
{
  return self->_allContactIdentifiers;
}

- (void)setAllContactIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_allContactIdentifiers, a3);
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

- (HDCodableSharingSetupMetadata)sharingSetupMetadata
{
  return self->_sharingSetupMetadata;
}

- (void)setSharingSetupMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_sharingSetupMetadata, a3);
}

- (double)dateModified
{
  return self->_dateModified;
}

- (NSMutableArray)authorizationCategories
{
  return self->_authorizationCategories;
}

- (void)setAuthorizationCategories:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationCategories, a3);
}

- (double)dateAccepted
{
  return self->_dateAccepted;
}

- (double)dateInvited
{
  return self->_dateInvited;
}

- (NSString)invitationUUID
{
  return self->_invitationUUID;
}

- (void)setInvitationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_invitationUUID, a3);
}

- (NSString)cloudKitIdentifier
{
  return self->_cloudKitIdentifier;
}

- (void)setCloudKitIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitIdentifier, a3);
}

- (NSData)ownerParticipant
{
  return self->_ownerParticipant;
}

- (void)setOwnerParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_ownerParticipant, a3);
}

- (NSMutableArray)sharingAuthorizations
{
  return self->_sharingAuthorizations;
}

- (void)setSharingAuthorizations:(id)a3
{
  objc_storeStrong((id *)&self->_sharingAuthorizations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sharingSetupMetadata, 0);
  objc_storeStrong((id *)&self->_sharingAuthorizations, 0);
  objc_storeStrong((id *)&self->_primaryContactIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerParticipant, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_invitationUUID, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_cloudKitIdentifier, 0);
  objc_storeStrong((id *)&self->_authorizationCategories, 0);
  objc_storeStrong((id *)&self->_allContactIdentifiers, 0);
}

- (HDCodableSummarySharingEntry)initWithUUID:(id)a3 invitationUUID:(id)a4 cloudKitIdentifier:(id)a5 primaryContactIdentifier:(id)a6 allContactIdentifiers:(id)a7 firstName:(id)a8 lastName:(id)a9 sharingAuthorizations:(id)a10 userWheelchairMode:(int64_t)a11 type:(int64_t)a12 direction:(unint64_t)a13 status:(int64_t)a14 notificationStatus:(int64_t)a15 dateModified:(id)a16 dateInvited:(id)a17 dateAccepted:(id)a18 setupMetadata:(id)a19 ownerParticipant:(id)a20
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  HDCodableSummarySharingEntry *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  id v51;
  id v52;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  objc_super v60;
  uint8_t buf[4];
  HDCodableSummarySharingEntry *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v26 = a4;
  v27 = a5;
  v28 = a6;
  v29 = a7;
  v30 = a8;
  v31 = a9;
  v32 = a10;
  v33 = a16;
  v57 = a17;
  v56 = a18;
  v55 = a19;
  v58 = a20;
  v60.receiver = self;
  v60.super_class = (Class)HDCodableSummarySharingEntry;
  v34 = -[HDCodableSummarySharingEntry init](&v60, sel_init);
  if (v34)
  {
    v54 = v33;
    v52 = v25;
    objc_msgSend(v25, "UUIDString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableSummarySharingEntry setUuid:](v34, "setUuid:", v35);

    objc_msgSend(v26, "UUIDString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableSummarySharingEntry setInvitationUUID:](v34, "setInvitationUUID:", v36);

    v51 = v27;
    v37 = (void *)objc_msgSend(v27, "copy");
    -[HDCodableSummarySharingEntry setCloudKitIdentifier:](v34, "setCloudKitIdentifier:", v37);

    v38 = (void *)objc_msgSend(v28, "copy");
    -[HDCodableSummarySharingEntry setPrimaryContactIdentifier:](v34, "setPrimaryContactIdentifier:", v38);

    v39 = (void *)objc_msgSend(v29, "copy");
    -[HDCodableSummarySharingEntry setAllContactIdentifiers:](v34, "setAllContactIdentifiers:", v39);

    v40 = (void *)objc_msgSend(v30, "copy");
    -[HDCodableSummarySharingEntry setFirstName:](v34, "setFirstName:", v40);

    v41 = (void *)objc_msgSend(v31, "copy");
    -[HDCodableSummarySharingEntry setLastName:](v34, "setLastName:", v41);

    -[HDCodableSummarySharingEntry setUserWheelchairMode:](v34, "setUserWheelchairMode:", a11);
    -[HDCodableSummarySharingEntry setType:](v34, "setType:", a12);
    -[HDCodableSummarySharingEntry setDirection:](v34, "setDirection:", a13);
    -[HDCodableSummarySharingEntry setStatus:](v34, "setStatus:", a14);
    -[HDCodableSummarySharingEntry setNotificationStatus:](v34, "setNotificationStatus:", a15);
    if (v33)
    {
      objc_msgSend(v33, "timeIntervalSinceReferenceDate");
      -[HDCodableSummarySharingEntry setDateModified:](v34, "setDateModified:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "timeIntervalSinceReferenceDate");
      -[HDCodableSummarySharingEntry setDateModified:](v34, "setDateModified:");

    }
    v25 = v52;
    if (v57)
    {
      objc_msgSend(v57, "timeIntervalSinceReferenceDate");
      -[HDCodableSummarySharingEntry setDateInvited:](v34, "setDateInvited:");
    }
    if (v56)
    {
      objc_msgSend(v56, "timeIntervalSinceReferenceDate");
      -[HDCodableSummarySharingEntry setDateAccepted:](v34, "setDateAccepted:");
    }
    -[HDCodableSummarySharingEntry setSharingSetupMetadata:](v34, "setSharingSetupMetadata:", v55);
    if (v58)
    {
      v59 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v58, 1, &v59);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v59;
      -[HDCodableSummarySharingEntry setOwnerParticipant:](v34, "setOwnerParticipant:", v43);

      -[HDCodableSummarySharingEntry ownerParticipant](v34, "ownerParticipant");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v45)
      {
        _HKInitializeLogging();
        HKLogSharing();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v62 = v34;
          v63 = 2114;
          v64 = v58;
          v65 = 2114;
          v66 = v44;
          _os_log_error_impl(&dword_1B7802000, v46, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to archive owner participant %{public}@: %{public}@", buf, 0x20u);
        }

      }
    }
    else
    {
      -[HDCodableSummarySharingEntry setOwnerParticipant:](v34, "setOwnerParticipant:");
    }
    HDCodableSharingAuthorizationsFromSharingAuthorizations(v32);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableSummarySharingEntry setSharingAuthorizations:](v34, "setSharingAuthorizations:", v47);

    -[HDCodableSummarySharingEntry sharingAuthorizations](v34, "sharingAuthorizations");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    HDAuthorizationIdentifiersFromCodableSharingAuthorizations(v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableSummarySharingEntry setAuthorizationCategories:](v34, "setAuthorizationCategories:", v49);

    v27 = v51;
    v33 = v54;
  }

  return v34;
}

- (id)sharingEntry
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;

  v23 = objc_alloc(MEMORY[0x1E0CB6C90]);
  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[HDCodableSummarySharingEntry uuid](self, "uuid");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v3, "initWithUUIDString:", v24);
  -[HDCodableSummarySharingEntry primaryContactIdentifier](self, "primaryContactIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSummarySharingEntry allContactIdentifiers](self, "allContactIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v22, "copy");
  -[HDCodableSummarySharingEntry firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSummarySharingEntry lastName](self, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HDCodableSummarySharingEntry userWheelchairMode](self, "userWheelchairMode");
  v7 = -[HDCodableSummarySharingEntry type](self, "type");
  v8 = -[HDCodableSummarySharingEntry status](self, "status");
  v9 = -[HDCodableSummarySharingEntry notificationStatus](self, "notificationStatus");
  v10 = -[HDCodableSummarySharingEntry direction](self, "direction");
  v11 = (void *)MEMORY[0x1E0C99D68];
  -[HDCodableSummarySharingEntry dateModified](self, "dateModified");
  objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v23, "initWithUUID:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:userWheelchairMode:type:status:notificationStatus:direction:modificationDate:", v21, v20, v4, v5, v6, v19, v7, v8, v9, v10, v12);

  if (-[HDCodableSummarySharingEntry hasDateAccepted](self, "hasDateAccepted"))
  {
    v14 = (void *)MEMORY[0x1E0C99D68];
    -[HDCodableSummarySharingEntry dateAccepted](self, "dateAccepted");
    objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setDateAccepted:", v15);

  }
  if (-[HDCodableSummarySharingEntry hasDateInvited](self, "hasDateInvited"))
  {
    v16 = (void *)MEMORY[0x1E0C99D68];
    -[HDCodableSummarySharingEntry dateInvited](self, "dateInvited");
    objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setDateInvited:", v17);

  }
  return v13;
}

- (BOOL)isEquivalent:(id)a3
{
  char *v4;
  NSString *cloudKitIdentifier;
  NSString *v6;
  NSString *primaryContactIdentifier;
  NSString *v8;
  NSMutableArray *allContactIdentifiers;
  NSMutableArray *v10;
  NSString *firstName;
  NSString *v12;
  NSString *lastName;
  NSString *v14;
  $8065ADDBD76E777BD4A8EE61604E0159 has;
  NSMutableArray *sharingAuthorizations;
  NSMutableArray *v17;
  HDCodableSharingSetupMetadata *sharingSetupMetadata;
  HDCodableSharingSetupMetadata *v19;
  char v20;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  cloudKitIdentifier = self->_cloudKitIdentifier;
  v6 = (NSString *)*((_QWORD *)v4 + 6);
  if (cloudKitIdentifier != v6 && (!v6 || !-[NSString isEqualToString:](cloudKitIdentifier, "isEqualToString:")))
    goto LABEL_44;
  primaryContactIdentifier = self->_primaryContactIdentifier;
  v8 = (NSString *)*((_QWORD *)v4 + 13);
  if (primaryContactIdentifier != v8
    && (!v8 || !-[NSString isEqualToString:](primaryContactIdentifier, "isEqualToString:")))
  {
    goto LABEL_44;
  }
  allContactIdentifiers = self->_allContactIdentifiers;
  v10 = (NSMutableArray *)*((_QWORD *)v4 + 4);
  if (allContactIdentifiers != v10
    && (!v10 || !-[NSMutableArray isEqualToArray:](allContactIdentifiers, "isEqualToArray:")))
  {
    goto LABEL_44;
  }
  firstName = self->_firstName;
  v12 = (NSString *)*((_QWORD *)v4 + 8);
  if (firstName != v12 && (!v12 || !-[NSString isEqualToString:](firstName, "isEqualToString:")))
    goto LABEL_44;
  lastName = self->_lastName;
  v14 = (NSString *)*((_QWORD *)v4 + 10);
  if (lastName != v14 && (!v14 || !-[NSString isEqualToString:](lastName, "isEqualToString:")))
    goto LABEL_44;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v4[152] & 0x80000000) == 0 || self->_userWheelchairMode != *((_DWORD *)v4 + 34))
      goto LABEL_44;
  }
  else if (*((_DWORD *)v4 + 34))
  {
LABEL_44:
    v20 = 0;
    goto LABEL_45;
  }
  sharingAuthorizations = self->_sharingAuthorizations;
  v17 = (NSMutableArray *)*((_QWORD *)v4 + 14);
  if (sharingAuthorizations != v17)
  {
    if (!v17 || !-[NSMutableArray isEqualToArray:](sharingAuthorizations, "isEqualToArray:"))
      goto LABEL_44;
    *(_BYTE *)&has = self->_has;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v4[152] & 0x40) == 0 || self->_type != *((_DWORD *)v4 + 33))
      goto LABEL_44;
  }
  else if ((v4[152] & 0x40) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v4[152] & 8) == 0 || self->_direction != *((_DWORD *)v4 + 14))
      goto LABEL_44;
  }
  else if ((v4[152] & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v4[152] & 0x20) == 0 || self->_status != *((_DWORD *)v4 + 32))
      goto LABEL_44;
  }
  else if ((v4[152] & 0x20) != 0)
  {
    goto LABEL_44;
  }
  sharingSetupMetadata = self->_sharingSetupMetadata;
  v19 = (HDCodableSharingSetupMetadata *)*((_QWORD *)v4 + 15);
  if (sharingSetupMetadata == v19)
  {
    v20 = 1;
    goto LABEL_45;
  }
  if (!v19)
    goto LABEL_44;
  v20 = -[HDCodableSharingSetupMetadata isEqual:](sharingSetupMetadata, "isEqual:");
LABEL_45:

  return v20;
}

- (id)sharingRecipientIdentifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[HDCodableSummarySharingEntry uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6BB8]), "initForInvitationUUID:", v5);
  return v6;
}

- (id)shareOwnerParticipant
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  HDCodableSummarySharingEntry *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HDCodableSummarySharingEntry ownerParticipant](self, "ownerParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (!v4)
    {
      _HKInitializeLogging();
      HKLogSharing();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v10 = self;
        v11 = 2114;
        v12 = v3;
        v13 = 2114;
        v14 = v5;
        _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to unarchive owner participant %{public}@: %{public}@", buf, 0x20u);
      }

      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }

  return v4;
}

- (BOOL)isEqualFirstName:(id)a3 lastName:(id)a4
{
  void *v4;
  void *v5;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  -[HDCodableSummarySharingEntry firstName](self, "firstName");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 != v8)
  {
    -[HDCodableSummarySharingEntry firstName](self, "firstName");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v12 = 0;
      goto LABEL_13;
    }
    v4 = (void *)v11;
    -[HDCodableSummarySharingEntry firstName](self, "firstName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqualToString:", v5))
    {
      v12 = 0;
LABEL_12:

      goto LABEL_13;
    }
  }
  -[HDCodableSummarySharingEntry lastName](self, "lastName");
  v13 = objc_claimAutoreleasedReturnValue();
  if ((id)v13 == v9)
  {

    v12 = 1;
  }
  else
  {
    v14 = (void *)v13;
    -[HDCodableSummarySharingEntry lastName](self, "lastName");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      -[HDCodableSummarySharingEntry lastName](self, "lastName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "isEqualToString:", v17);

    }
    else
    {

      v12 = 0;
    }
  }
  if (v10 != v8)
    goto LABEL_12;
LABEL_13:

  return v12;
}

@end
