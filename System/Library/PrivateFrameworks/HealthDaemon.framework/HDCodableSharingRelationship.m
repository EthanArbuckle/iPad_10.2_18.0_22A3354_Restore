@implementation HDCodableSharingRelationship

- (BOOL)hasRecipientIdentifier
{
  return self->_recipientIdentifier != 0;
}

- (int)recipientType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_recipientType;
  else
    return 0;
}

- (void)setRecipientType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_recipientType = a3;
}

- (void)setHasRecipientType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecipientType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)recipientTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("SharedSummary");
  if (a3 == 1)
  {
    v3 = CFSTR("ClinicalAccount");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsRecipientType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SharedSummary")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ClinicalAccount"));

  return v4;
}

- (void)setDateModified:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dateModified = a3;
}

- (void)setHasDateModified:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateModified
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearAuthorizationIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_authorizationIdentifiers, "removeAllObjects");
}

- (void)addAuthorizationIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *authorizationIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  authorizationIdentifiers = self->_authorizationIdentifiers;
  v8 = v4;
  if (!authorizationIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_authorizationIdentifiers;
    self->_authorizationIdentifiers = v6;

    v4 = v8;
    authorizationIdentifiers = self->_authorizationIdentifiers;
  }
  -[NSMutableArray addObject:](authorizationIdentifiers, "addObject:", v4);

}

- (unint64_t)authorizationIdentifiersCount
{
  return -[NSMutableArray count](self->_authorizationIdentifiers, "count");
}

- (id)authorizationIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_authorizationIdentifiers, "objectAtIndex:", a3);
}

+ (Class)authorizationIdentifiersType
{
  return (Class)objc_opt_class();
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

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
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
  v8.super_class = (Class)HDCodableSharingRelationship;
  -[HDCodableSharingRelationship description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSharingRelationship dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *recipientIdentifier;
  char has;
  int recipientType;
  __CFString *v8;
  void *v9;
  NSMutableArray *authorizationIdentifiers;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  HDCodableSyncIdentity *syncIdentity;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  recipientIdentifier = self->_recipientIdentifier;
  if (recipientIdentifier)
    objc_msgSend(v3, "setObject:forKey:", recipientIdentifier, CFSTR("recipientIdentifier"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    recipientType = self->_recipientType;
    if (recipientType)
    {
      if (recipientType == 1)
      {
        v8 = CFSTR("ClinicalAccount");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_recipientType);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v8 = CFSTR("SharedSummary");
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("recipientType"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateModified);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("dateModified"));

  }
  authorizationIdentifiers = self->_authorizationIdentifiers;
  if (authorizationIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", authorizationIdentifiers, CFSTR("authorizationIdentifiers"));
  if (-[NSMutableArray count](self->_sharingAuthorizations, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_sharingAuthorizations, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = self->_sharingAuthorizations;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("sharingAuthorizations"));
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("syncIdentity"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSharingRelationshipReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_recipientIdentifier)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteDoubleField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_authorizationIdentifiers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_sharingAuthorizations;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

  if (self->_syncIdentity)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  id v14;

  v4 = a3;
  v14 = v4;
  if (self->_recipientIdentifier)
  {
    objc_msgSend(v4, "setRecipientIdentifier:");
    v4 = v14;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_recipientType;
    *((_BYTE *)v4 + 56) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_dateModified;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  if (-[HDCodableSharingRelationship authorizationIdentifiersCount](self, "authorizationIdentifiersCount"))
  {
    objc_msgSend(v14, "clearAuthorizationIdentifiers");
    v6 = -[HDCodableSharingRelationship authorizationIdentifiersCount](self, "authorizationIdentifiersCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[HDCodableSharingRelationship authorizationIdentifiersAtIndex:](self, "authorizationIdentifiersAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addAuthorizationIdentifiers:", v9);

      }
    }
  }
  if (-[HDCodableSharingRelationship sharingAuthorizationsCount](self, "sharingAuthorizationsCount"))
  {
    objc_msgSend(v14, "clearSharingAuthorizations");
    v10 = -[HDCodableSharingRelationship sharingAuthorizationsCount](self, "sharingAuthorizationsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[HDCodableSharingRelationship sharingAuthorizationsAtIndex:](self, "sharingAuthorizationsAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSharingAuthorizations:", v13);

      }
    }
  }
  if (self->_syncIdentity)
    objc_msgSend(v14, "setSyncIdentity:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_recipientIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_recipientType;
    *(_BYTE *)(v5 + 56) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_dateModified;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = self->_authorizationIdentifiers;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAuthorizationIdentifiers:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v11);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = self->_sharingAuthorizations;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend((id)v5, "addSharingAuthorizations:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v17);
  }

  v21 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v21;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *recipientIdentifier;
  NSMutableArray *authorizationIdentifiers;
  NSMutableArray *sharingAuthorizations;
  HDCodableSyncIdentity *syncIdentity;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  recipientIdentifier = self->_recipientIdentifier;
  if ((unint64_t)recipientIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](recipientIdentifier, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_recipientType != *((_DWORD *)v4 + 8))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
LABEL_20:
    v9 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_dateModified != *((double *)v4 + 1))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_20;
  }
  authorizationIdentifiers = self->_authorizationIdentifiers;
  if ((unint64_t)authorizationIdentifiers | *((_QWORD *)v4 + 2)
    && !-[NSMutableArray isEqual:](authorizationIdentifiers, "isEqual:"))
  {
    goto LABEL_20;
  }
  sharingAuthorizations = self->_sharingAuthorizations;
  if ((unint64_t)sharingAuthorizations | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](sharingAuthorizations, "isEqual:"))
      goto LABEL_20;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 6))
    v9 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  else
    v9 = 1;
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  double dateModified;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_recipientIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_recipientType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  dateModified = self->_dateModified;
  v6 = -dateModified;
  if (dateModified >= 0.0)
    v6 = self->_dateModified;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  v10 = v4 ^ v3 ^ v9 ^ -[NSMutableArray hash](self->_authorizationIdentifiers, "hash");
  v11 = -[NSMutableArray hash](self->_sharingAuthorizations, "hash");
  return v10 ^ v11 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 3))
    -[HDCodableSharingRelationship setRecipientIdentifier:](self, "setRecipientIdentifier:");
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 2) != 0)
  {
    self->_recipientType = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 56);
  }
  if ((v5 & 1) != 0)
  {
    self->_dateModified = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = *((id *)v4 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        -[HDCodableSharingRelationship addAuthorizationIdentifiers:](self, "addAuthorizationIdentifiers:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = *((id *)v4 + 5);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        -[HDCodableSharingRelationship addSharingAuthorizations:](self, "addSharingAuthorizations:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v13);
  }

  syncIdentity = self->_syncIdentity;
  v17 = *((_QWORD *)v4 + 6);
  if (syncIdentity)
  {
    if (v17)
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else if (v17)
  {
    -[HDCodableSharingRelationship setSyncIdentity:](self, "setSyncIdentity:");
  }

}

- (NSString)recipientIdentifier
{
  return self->_recipientIdentifier;
}

- (void)setRecipientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_recipientIdentifier, a3);
}

- (double)dateModified
{
  return self->_dateModified;
}

- (NSMutableArray)authorizationIdentifiers
{
  return self->_authorizationIdentifiers;
}

- (void)setAuthorizationIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationIdentifiers, a3);
}

- (NSMutableArray)sharingAuthorizations
{
  return self->_sharingAuthorizations;
}

- (void)setSharingAuthorizations:(id)a3
{
  objc_storeStrong((id *)&self->_sharingAuthorizations, a3);
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_sharingAuthorizations, 0);
  objc_storeStrong((id *)&self->_recipientIdentifier, 0);
  objc_storeStrong((id *)&self->_authorizationIdentifiers, 0);
}

@end
