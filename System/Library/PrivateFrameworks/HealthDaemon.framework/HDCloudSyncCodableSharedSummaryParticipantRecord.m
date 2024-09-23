@implementation HDCloudSyncCodableSharedSummaryParticipantRecord

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasContactIdentifier
{
  return self->_contactIdentifier != 0;
}

- (BOOL)hasAuthorizationRecordIdentifier
{
  return self->_authorizationRecordIdentifier != 0;
}

- (BOOL)hasCloudKitIdentifier
{
  return self->_cloudKitIdentifier != 0;
}

- (BOOL)hasInvitationUUID
{
  return self->_invitationUUID != 0;
}

- (BOOL)hasFirstName
{
  return self->_firstName != 0;
}

- (BOOL)hasLastName
{
  return self->_lastName != 0;
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

- (void)setType:(int64_t)a3
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

- (void)setDirection:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_direction = a3;
}

- (void)setHasDirection:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDirection
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setStatus:(int64_t)a3
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

- (void)setNotificationStatus:(int64_t)a3
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

- (void)setEntryModificationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_entryModificationDate = a3;
}

- (void)setHasEntryModificationDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEntryModificationDate
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setEntryInvitationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_entryInvitationDate = a3;
}

- (void)setHasEntryInvitationDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEntryInvitationDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEntryAcceptanceDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_entryAcceptanceDate = a3;
}

- (void)setHasEntryAcceptanceDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEntryAcceptanceDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasOwnerParticipant
{
  return self->_ownerParticipant != 0;
}

- (BOOL)hasSetupMetadata
{
  return self->_setupMetadata != 0;
}

- (void)setUserWheelchairMode:(int64_t)a3
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCodableSharedSummaryParticipantRecord;
  -[HDCloudSyncCodableSharedSummaryParticipantRecord description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableSharedSummaryParticipantRecord dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *contactIdentifier;
  NSString *authorizationRecordIdentifier;
  NSString *cloudKitIdentifier;
  NSString *invitationUUID;
  NSString *firstName;
  NSString *lastName;
  NSMutableArray *allContactIdentifiers;
  char has;
  void *v14;
  NSData *ownerParticipant;
  NSData *setupMetadata;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  contactIdentifier = self->_contactIdentifier;
  if (contactIdentifier)
    objc_msgSend(v4, "setObject:forKey:", contactIdentifier, CFSTR("contactIdentifier"));
  authorizationRecordIdentifier = self->_authorizationRecordIdentifier;
  if (authorizationRecordIdentifier)
    objc_msgSend(v4, "setObject:forKey:", authorizationRecordIdentifier, CFSTR("authorizationRecordIdentifier"));
  cloudKitIdentifier = self->_cloudKitIdentifier;
  if (cloudKitIdentifier)
    objc_msgSend(v4, "setObject:forKey:", cloudKitIdentifier, CFSTR("cloudKitIdentifier"));
  invitationUUID = self->_invitationUUID;
  if (invitationUUID)
    objc_msgSend(v4, "setObject:forKey:", invitationUUID, CFSTR("invitationUUID"));
  firstName = self->_firstName;
  if (firstName)
    objc_msgSend(v4, "setObject:forKey:", firstName, CFSTR("firstName"));
  lastName = self->_lastName;
  if (lastName)
    objc_msgSend(v4, "setObject:forKey:", lastName, CFSTR("lastName"));
  allContactIdentifiers = self->_allContactIdentifiers;
  if (allContactIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", allContactIdentifiers, CFSTR("allContactIdentifiers"));
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_type);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("type"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_19:
      if ((has & 0x20) == 0)
        goto LABEL_20;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_direction);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("direction"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_20:
    if ((has & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_status);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("status"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_21:
    if ((has & 8) == 0)
      goto LABEL_22;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_notificationStatus);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("notificationStatus"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_22:
    if ((has & 4) == 0)
      goto LABEL_23;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_entryModificationDate);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("entryModificationDate"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_23:
    if ((has & 2) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_entryInvitationDate);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("entryInvitationDate"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_entryAcceptanceDate);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("entryAcceptanceDate"));

  }
LABEL_25:
  ownerParticipant = self->_ownerParticipant;
  if (ownerParticipant)
    objc_msgSend(v4, "setObject:forKey:", ownerParticipant, CFSTR("ownerParticipant"));
  setupMetadata = self->_setupMetadata;
  if (setupMetadata)
    objc_msgSend(v4, "setObject:forKey:", setupMetadata, CFSTR("setupMetadata"));
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_userWheelchairMode);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("userWheelchairMode"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableSharedSummaryParticipantRecordReadFrom(self, (uint64_t)a3);
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
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_uuid)
    PBDataWriterWriteStringField();
  if (self->_contactIdentifier)
    PBDataWriterWriteStringField();
  if (self->_authorizationRecordIdentifier)
    PBDataWriterWriteStringField();
  if (self->_cloudKitIdentifier)
    PBDataWriterWriteStringField();
  if (self->_invitationUUID)
    PBDataWriterWriteStringField();
  if (self->_firstName)
    PBDataWriterWriteStringField();
  if (self->_lastName)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_allContactIdentifiers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_24:
      if ((has & 0x20) == 0)
        goto LABEL_25;
      goto LABEL_39;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_24;
  }
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_25:
    if ((has & 0x10) == 0)
      goto LABEL_26;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_26:
    if ((has & 8) == 0)
      goto LABEL_27;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_27:
    if ((has & 4) == 0)
      goto LABEL_28;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_28:
    if ((has & 2) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_42:
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_29:
    PBDataWriterWriteDoubleField();
LABEL_30:
  if (self->_ownerParticipant)
    PBDataWriterWriteDataField();
  if (self->_setupMetadata)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    PBDataWriterWriteInt64Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char has;
  _QWORD *v9;
  id v10;

  v10 = a3;
  if (self->_uuid)
    objc_msgSend(v10, "setUuid:");
  if (self->_contactIdentifier)
    objc_msgSend(v10, "setContactIdentifier:");
  if (self->_authorizationRecordIdentifier)
    objc_msgSend(v10, "setAuthorizationRecordIdentifier:");
  if (self->_cloudKitIdentifier)
    objc_msgSend(v10, "setCloudKitIdentifier:");
  if (self->_invitationUUID)
    objc_msgSend(v10, "setInvitationUUID:");
  if (self->_firstName)
    objc_msgSend(v10, "setFirstName:");
  if (self->_lastName)
    objc_msgSend(v10, "setLastName:");
  if (-[HDCloudSyncCodableSharedSummaryParticipantRecord allContactIdentifiersCount](self, "allContactIdentifiersCount"))
  {
    objc_msgSend(v10, "clearAllContactIdentifiers");
    v4 = -[HDCloudSyncCodableSharedSummaryParticipantRecord allContactIdentifiersCount](self, "allContactIdentifiersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HDCloudSyncCodableSharedSummaryParticipantRecord allContactIdentifiersAtIndex:](self, "allContactIdentifiersAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAllContactIdentifiers:", v7);

      }
    }
  }
  has = (char)self->_has;
  v9 = v10;
  if ((has & 0x40) != 0)
  {
    *((_QWORD *)v10 + 7) = self->_type;
    *((_BYTE *)v10 + 152) |= 0x40u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_21:
      if ((has & 0x20) == 0)
        goto LABEL_22;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_21;
  }
  *((_QWORD *)v10 + 1) = self->_direction;
  *((_BYTE *)v10 + 152) |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_22:
    if ((has & 0x10) == 0)
      goto LABEL_23;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)v10 + 6) = self->_status;
  *((_BYTE *)v10 + 152) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_23:
    if ((has & 8) == 0)
      goto LABEL_24;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)v10 + 5) = self->_notificationStatus;
  *((_BYTE *)v10 + 152) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_24:
    if ((has & 4) == 0)
      goto LABEL_25;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)v10 + 4) = *(_QWORD *)&self->_entryModificationDate;
  *((_BYTE *)v10 + 152) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_25:
    if ((has & 2) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_39:
  *((_QWORD *)v10 + 3) = *(_QWORD *)&self->_entryInvitationDate;
  *((_BYTE *)v10 + 152) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_26:
    *((_QWORD *)v10 + 2) = *(_QWORD *)&self->_entryAcceptanceDate;
    *((_BYTE *)v10 + 152) |= 2u;
  }
LABEL_27:
  if (self->_ownerParticipant)
  {
    objc_msgSend(v10, "setOwnerParticipant:");
    v9 = v10;
  }
  if (self->_setupMetadata)
  {
    objc_msgSend(v10, "setSetupMetadata:");
    v9 = v10;
  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    v9[8] = self->_userWheelchairMode;
    *((_BYTE *)v9 + 152) |= 0x80u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  char has;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v6;

  v8 = -[NSString copyWithZone:](self->_contactIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v8;

  v10 = -[NSString copyWithZone:](self->_authorizationRecordIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v10;

  v12 = -[NSString copyWithZone:](self->_cloudKitIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v12;

  v14 = -[NSString copyWithZone:](self->_invitationUUID, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v14;

  v16 = -[NSString copyWithZone:](self->_firstName, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v16;

  v18 = -[NSString copyWithZone:](self->_lastName, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v18;

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = self->_allContactIdentifiers;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v32);
        objc_msgSend((id)v5, "addAllContactIdentifiers:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v22);
  }

  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_type;
    *(_BYTE *)(v5 + 152) |= 0x40u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_10:
      if ((has & 0x20) == 0)
        goto LABEL_11;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_10;
  }
  *(_QWORD *)(v5 + 8) = self->_direction;
  *(_BYTE *)(v5 + 152) |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_22;
  }
LABEL_21:
  *(_QWORD *)(v5 + 48) = self->_status;
  *(_BYTE *)(v5 + 152) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_23;
  }
LABEL_22:
  *(_QWORD *)(v5 + 40) = self->_notificationStatus;
  *(_BYTE *)(v5 + 152) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 4) == 0)
      goto LABEL_14;
    goto LABEL_24;
  }
LABEL_23:
  *(double *)(v5 + 32) = self->_entryModificationDate;
  *(_BYTE *)(v5 + 152) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 2) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_24:
  *(double *)(v5 + 24) = self->_entryInvitationDate;
  *(_BYTE *)(v5 + 152) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_15:
    *(double *)(v5 + 16) = self->_entryAcceptanceDate;
    *(_BYTE *)(v5 + 152) |= 2u;
  }
LABEL_16:
  v27 = -[NSData copyWithZone:](self->_ownerParticipant, "copyWithZone:", a3, (_QWORD)v32);
  v28 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v27;

  v29 = -[NSData copyWithZone:](self->_setupMetadata, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v29;

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *(_QWORD *)(v5 + 64) = self->_userWheelchairMode;
    *(_BYTE *)(v5 + 152) |= 0x80u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSString *uuid;
  NSString *contactIdentifier;
  NSString *authorizationRecordIdentifier;
  NSString *cloudKitIdentifier;
  NSString *invitationUUID;
  NSString *firstName;
  NSString *lastName;
  NSMutableArray *allContactIdentifiers;
  NSData *ownerParticipant;
  NSData *setupMetadata;
  int v15;
  BOOL v16;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_62;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
      goto LABEL_62;
  }
  contactIdentifier = self->_contactIdentifier;
  if ((unint64_t)contactIdentifier | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](contactIdentifier, "isEqual:"))
      goto LABEL_62;
  }
  authorizationRecordIdentifier = self->_authorizationRecordIdentifier;
  if ((unint64_t)authorizationRecordIdentifier | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](authorizationRecordIdentifier, "isEqual:"))
      goto LABEL_62;
  }
  cloudKitIdentifier = self->_cloudKitIdentifier;
  if ((unint64_t)cloudKitIdentifier | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](cloudKitIdentifier, "isEqual:"))
      goto LABEL_62;
  }
  invitationUUID = self->_invitationUUID;
  if ((unint64_t)invitationUUID | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](invitationUUID, "isEqual:"))
      goto LABEL_62;
  }
  firstName = self->_firstName;
  if ((unint64_t)firstName | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](firstName, "isEqual:"))
      goto LABEL_62;
  }
  lastName = self->_lastName;
  if ((unint64_t)lastName | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](lastName, "isEqual:"))
      goto LABEL_62;
  }
  allContactIdentifiers = self->_allContactIdentifiers;
  if ((unint64_t)allContactIdentifiers | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](allContactIdentifiers, "isEqual:"))
      goto LABEL_62;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[152] & 0x40) == 0 || self->_type != *((_QWORD *)v4 + 7))
      goto LABEL_62;
  }
  else if ((v4[152] & 0x40) != 0)
  {
LABEL_62:
    v16 = 0;
    goto LABEL_63;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[152] & 1) == 0 || self->_direction != *((_QWORD *)v4 + 1))
      goto LABEL_62;
  }
  else if ((v4[152] & 1) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v4[152] & 0x20) == 0 || self->_status != *((_QWORD *)v4 + 6))
      goto LABEL_62;
  }
  else if ((v4[152] & 0x20) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[152] & 0x10) == 0 || self->_notificationStatus != *((_QWORD *)v4 + 5))
      goto LABEL_62;
  }
  else if ((v4[152] & 0x10) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[152] & 8) == 0 || self->_entryModificationDate != *((double *)v4 + 4))
      goto LABEL_62;
  }
  else if ((v4[152] & 8) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[152] & 4) == 0 || self->_entryInvitationDate != *((double *)v4 + 3))
      goto LABEL_62;
  }
  else if ((v4[152] & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[152] & 2) == 0 || self->_entryAcceptanceDate != *((double *)v4 + 2))
      goto LABEL_62;
  }
  else if ((v4[152] & 2) != 0)
  {
    goto LABEL_62;
  }
  ownerParticipant = self->_ownerParticipant;
  if ((unint64_t)ownerParticipant | *((_QWORD *)v4 + 16)
    && !-[NSData isEqual:](ownerParticipant, "isEqual:"))
  {
    goto LABEL_62;
  }
  setupMetadata = self->_setupMetadata;
  if ((unint64_t)setupMetadata | *((_QWORD *)v4 + 17))
  {
    if (!-[NSData isEqual:](setupMetadata, "isEqual:"))
      goto LABEL_62;
  }
  v15 = v4[152];
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    if ((v15 & 0x80000000) == 0 || self->_userWheelchairMode != *((_QWORD *)v4 + 8))
      goto LABEL_62;
    v16 = 1;
  }
  else
  {
    v16 = v15 >= 0;
  }
LABEL_63:

  return v16;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double entryModificationDate;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  double entryInvitationDate;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;
  double entryAcceptanceDate;
  double v19;
  long double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v33;
  NSUInteger v34;

  v34 = -[NSString hash](self->_uuid, "hash");
  v33 = -[NSString hash](self->_contactIdentifier, "hash");
  v32 = -[NSString hash](self->_authorizationRecordIdentifier, "hash");
  v31 = -[NSString hash](self->_cloudKitIdentifier, "hash");
  v30 = -[NSString hash](self->_invitationUUID, "hash");
  v29 = -[NSString hash](self->_firstName, "hash");
  v28 = -[NSString hash](self->_lastName, "hash");
  v27 = -[NSMutableArray hash](self->_allContactIdentifiers, "hash");
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v26 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_direction;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v26 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_status;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
LABEL_13:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
LABEL_14:
    v11 = 0;
    goto LABEL_17;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_13;
LABEL_5:
  v6 = 2654435761 * self->_notificationStatus;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_14;
LABEL_6:
  entryModificationDate = self->_entryModificationDate;
  v8 = -entryModificationDate;
  if (entryModificationDate >= 0.0)
    v8 = self->_entryModificationDate;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_17:
  if ((has & 4) != 0)
  {
    entryInvitationDate = self->_entryInvitationDate;
    v14 = -entryInvitationDate;
    if (entryInvitationDate >= 0.0)
      v14 = self->_entryInvitationDate;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  if ((has & 2) != 0)
  {
    entryAcceptanceDate = self->_entryAcceptanceDate;
    v19 = -entryAcceptanceDate;
    if (entryAcceptanceDate >= 0.0)
      v19 = self->_entryAcceptanceDate;
    v20 = floor(v19 + 0.5);
    v21 = (v19 - v20) * 1.84467441e19;
    v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0)
        v17 += (unint64_t)v21;
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    v17 = 0;
  }
  v22 = -[NSData hash](self->_ownerParticipant, "hash");
  v23 = -[NSData hash](self->_setupMetadata, "hash");
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    v24 = 2654435761 * self->_userWheelchairMode;
  else
    v24 = 0;
  return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v4 ^ v5 ^ v6 ^ v11 ^ v12 ^ v17 ^ v22 ^ v23 ^ v24;
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
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (*((_QWORD *)v4 + 18))
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setUuid:](self, "setUuid:");
  if (*((_QWORD *)v4 + 12))
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setContactIdentifier:](self, "setContactIdentifier:");
  if (*((_QWORD *)v4 + 10))
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setAuthorizationRecordIdentifier:](self, "setAuthorizationRecordIdentifier:");
  if (*((_QWORD *)v4 + 11))
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setCloudKitIdentifier:](self, "setCloudKitIdentifier:");
  if (*((_QWORD *)v4 + 14))
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setInvitationUUID:](self, "setInvitationUUID:");
  if (*((_QWORD *)v4 + 13))
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setFirstName:](self, "setFirstName:");
  if (*((_QWORD *)v4 + 15))
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setLastName:](self, "setLastName:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *((id *)v4 + 9);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[HDCloudSyncCodableSharedSummaryParticipantRecord addAllContactIdentifiers:](self, "addAllContactIdentifiers:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = v4[152];
  if ((v10 & 0x40) != 0)
  {
    self->_type = *((_QWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 0x40u;
    v10 = v4[152];
    if ((v10 & 1) == 0)
    {
LABEL_24:
      if ((v10 & 0x20) == 0)
        goto LABEL_25;
      goto LABEL_39;
    }
  }
  else if ((v4[152] & 1) == 0)
  {
    goto LABEL_24;
  }
  self->_direction = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v10 = v4[152];
  if ((v10 & 0x20) == 0)
  {
LABEL_25:
    if ((v10 & 0x10) == 0)
      goto LABEL_26;
    goto LABEL_40;
  }
LABEL_39:
  self->_status = *((_QWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 0x20u;
  v10 = v4[152];
  if ((v10 & 0x10) == 0)
  {
LABEL_26:
    if ((v10 & 8) == 0)
      goto LABEL_27;
    goto LABEL_41;
  }
LABEL_40:
  self->_notificationStatus = *((_QWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 0x10u;
  v10 = v4[152];
  if ((v10 & 8) == 0)
  {
LABEL_27:
    if ((v10 & 4) == 0)
      goto LABEL_28;
    goto LABEL_42;
  }
LABEL_41:
  self->_entryModificationDate = *((double *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v10 = v4[152];
  if ((v10 & 4) == 0)
  {
LABEL_28:
    if ((v10 & 2) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_42:
  self->_entryInvitationDate = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((v4[152] & 2) != 0)
  {
LABEL_29:
    self->_entryAcceptanceDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_30:
  if (*((_QWORD *)v4 + 16))
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setOwnerParticipant:](self, "setOwnerParticipant:");
  if (*((_QWORD *)v4 + 17))
    -[HDCloudSyncCodableSharedSummaryParticipantRecord setSetupMetadata:](self, "setSetupMetadata:");
  if (v4[152] < 0)
  {
    self->_userWheelchairMode = *((_QWORD *)v4 + 8);
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

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contactIdentifier, a3);
}

- (NSString)authorizationRecordIdentifier
{
  return self->_authorizationRecordIdentifier;
}

- (void)setAuthorizationRecordIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationRecordIdentifier, a3);
}

- (NSString)cloudKitIdentifier
{
  return self->_cloudKitIdentifier;
}

- (void)setCloudKitIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitIdentifier, a3);
}

- (NSString)invitationUUID
{
  return self->_invitationUUID;
}

- (void)setInvitationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_invitationUUID, a3);
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

- (NSMutableArray)allContactIdentifiers
{
  return self->_allContactIdentifiers;
}

- (void)setAllContactIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_allContactIdentifiers, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)direction
{
  return self->_direction;
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)notificationStatus
{
  return self->_notificationStatus;
}

- (double)entryModificationDate
{
  return self->_entryModificationDate;
}

- (double)entryInvitationDate
{
  return self->_entryInvitationDate;
}

- (double)entryAcceptanceDate
{
  return self->_entryAcceptanceDate;
}

- (NSData)ownerParticipant
{
  return self->_ownerParticipant;
}

- (void)setOwnerParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_ownerParticipant, a3);
}

- (NSData)setupMetadata
{
  return self->_setupMetadata;
}

- (void)setSetupMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_setupMetadata, a3);
}

- (int64_t)userWheelchairMode
{
  return self->_userWheelchairMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_setupMetadata, 0);
  objc_storeStrong((id *)&self->_ownerParticipant, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_invitationUUID, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudKitIdentifier, 0);
  objc_storeStrong((id *)&self->_authorizationRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_allContactIdentifiers, 0);
}

@end
