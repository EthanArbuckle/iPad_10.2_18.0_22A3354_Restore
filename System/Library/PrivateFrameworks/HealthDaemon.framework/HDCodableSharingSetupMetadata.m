@implementation HDCodableSharingSetupMetadata

- (BOOL)hasSyncCircleIdentifier
{
  return self->_syncCircleIdentifier != 0;
}

- (BOOL)hasOwnerParticipant
{
  return self->_ownerParticipant != 0;
}

- (BOOL)hasSourceProfileIdentifier
{
  return self->_sourceProfileIdentifier != 0;
}

- (BOOL)hasShareParticipant
{
  return self->_shareParticipant != 0;
}

- (BOOL)hasOwnerCloudKitEmailAddress
{
  return self->_ownerCloudKitEmailAddress != 0;
}

- (void)clearInvitationTokens
{
  -[NSMutableArray removeAllObjects](self->_invitationTokens, "removeAllObjects");
}

- (void)addInvitationToken:(id)a3
{
  id v4;
  NSMutableArray *invitationTokens;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  invitationTokens = self->_invitationTokens;
  v8 = v4;
  if (!invitationTokens)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_invitationTokens;
    self->_invitationTokens = v6;

    v4 = v8;
    invitationTokens = self->_invitationTokens;
  }
  -[NSMutableArray addObject:](invitationTokens, "addObject:", v4);

}

- (unint64_t)invitationTokensCount
{
  return -[NSMutableArray count](self->_invitationTokens, "count");
}

- (id)invitationTokenAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_invitationTokens, "objectAtIndex:", a3);
}

+ (Class)invitationTokenType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)HDCodableSharingSetupMetadata;
  -[HDCodableSharingSetupMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSharingSetupMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *syncCircleIdentifier;
  NSData *ownerParticipant;
  NSData *sourceProfileIdentifier;
  NSData *shareParticipant;
  NSString *ownerCloudKitEmailAddress;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  syncCircleIdentifier = self->_syncCircleIdentifier;
  if (syncCircleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", syncCircleIdentifier, CFSTR("syncCircleIdentifier"));
  ownerParticipant = self->_ownerParticipant;
  if (ownerParticipant)
    objc_msgSend(v4, "setObject:forKey:", ownerParticipant, CFSTR("ownerParticipant"));
  sourceProfileIdentifier = self->_sourceProfileIdentifier;
  if (sourceProfileIdentifier)
    objc_msgSend(v4, "setObject:forKey:", sourceProfileIdentifier, CFSTR("sourceProfileIdentifier"));
  shareParticipant = self->_shareParticipant;
  if (shareParticipant)
    objc_msgSend(v4, "setObject:forKey:", shareParticipant, CFSTR("shareParticipant"));
  ownerCloudKitEmailAddress = self->_ownerCloudKitEmailAddress;
  if (ownerCloudKitEmailAddress)
    objc_msgSend(v4, "setObject:forKey:", ownerCloudKitEmailAddress, CFSTR("ownerCloudKitEmailAddress"));
  if (-[NSMutableArray count](self->_invitationTokens, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_invitationTokens, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = self->_invitationTokens;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("invitationToken"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSharingSetupMetadataReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_syncCircleIdentifier)
    PBDataWriterWriteStringField();
  if (self->_ownerParticipant)
    PBDataWriterWriteDataField();
  if (self->_sourceProfileIdentifier)
    PBDataWriterWriteDataField();
  if (self->_shareParticipant)
    PBDataWriterWriteDataField();
  if (self->_ownerCloudKitEmailAddress)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_invitationTokens;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_syncCircleIdentifier)
    objc_msgSend(v8, "setSyncCircleIdentifier:");
  if (self->_ownerParticipant)
    objc_msgSend(v8, "setOwnerParticipant:");
  if (self->_sourceProfileIdentifier)
    objc_msgSend(v8, "setSourceProfileIdentifier:");
  if (self->_shareParticipant)
    objc_msgSend(v8, "setShareParticipant:");
  if (self->_ownerCloudKitEmailAddress)
    objc_msgSend(v8, "setOwnerCloudKitEmailAddress:");
  if (-[HDCodableSharingSetupMetadata invitationTokensCount](self, "invitationTokensCount"))
  {
    objc_msgSend(v8, "clearInvitationTokens");
    v4 = -[HDCodableSharingSetupMetadata invitationTokensCount](self, "invitationTokensCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HDCodableSharingSetupMetadata invitationTokenAtIndex:](self, "invitationTokenAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addInvitationToken:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
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
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_syncCircleIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[6];
  v5[6] = v6;

  v8 = -[NSData copyWithZone:](self->_ownerParticipant, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSData copyWithZone:](self->_sourceProfileIdentifier, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v12 = -[NSData copyWithZone:](self->_shareParticipant, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSString copyWithZone:](self->_ownerCloudKitEmailAddress, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_invitationTokens;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend(v5, "addInvitationToken:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v18);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *syncCircleIdentifier;
  NSData *ownerParticipant;
  NSData *sourceProfileIdentifier;
  NSData *shareParticipant;
  NSString *ownerCloudKitEmailAddress;
  NSMutableArray *invitationTokens;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((syncCircleIdentifier = self->_syncCircleIdentifier, !((unint64_t)syncCircleIdentifier | v4[6]))
     || -[NSString isEqual:](syncCircleIdentifier, "isEqual:"))
    && ((ownerParticipant = self->_ownerParticipant, !((unint64_t)ownerParticipant | v4[3]))
     || -[NSData isEqual:](ownerParticipant, "isEqual:"))
    && ((sourceProfileIdentifier = self->_sourceProfileIdentifier, !((unint64_t)sourceProfileIdentifier | v4[5]))
     || -[NSData isEqual:](sourceProfileIdentifier, "isEqual:"))
    && ((shareParticipant = self->_shareParticipant, !((unint64_t)shareParticipant | v4[4]))
     || -[NSData isEqual:](shareParticipant, "isEqual:"))
    && ((ownerCloudKitEmailAddress = self->_ownerCloudKitEmailAddress,
         !((unint64_t)ownerCloudKitEmailAddress | v4[2]))
     || -[NSString isEqual:](ownerCloudKitEmailAddress, "isEqual:")))
  {
    invitationTokens = self->_invitationTokens;
    if ((unint64_t)invitationTokens | v4[1])
      v11 = -[NSMutableArray isEqual:](invitationTokens, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_syncCircleIdentifier, "hash");
  v4 = -[NSData hash](self->_ownerParticipant, "hash") ^ v3;
  v5 = -[NSData hash](self->_sourceProfileIdentifier, "hash");
  v6 = v4 ^ v5 ^ -[NSData hash](self->_shareParticipant, "hash");
  v7 = -[NSString hash](self->_ownerCloudKitEmailAddress, "hash");
  return v6 ^ v7 ^ -[NSMutableArray hash](self->_invitationTokens, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 6))
    -[HDCodableSharingSetupMetadata setSyncCircleIdentifier:](self, "setSyncCircleIdentifier:");
  if (*((_QWORD *)v4 + 3))
    -[HDCodableSharingSetupMetadata setOwnerParticipant:](self, "setOwnerParticipant:");
  if (*((_QWORD *)v4 + 5))
    -[HDCodableSharingSetupMetadata setSourceProfileIdentifier:](self, "setSourceProfileIdentifier:");
  if (*((_QWORD *)v4 + 4))
    -[HDCodableSharingSetupMetadata setShareParticipant:](self, "setShareParticipant:");
  if (*((_QWORD *)v4 + 2))
    -[HDCodableSharingSetupMetadata setOwnerCloudKitEmailAddress:](self, "setOwnerCloudKitEmailAddress:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[HDCodableSharingSetupMetadata addInvitationToken:](self, "addInvitationToken:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)syncCircleIdentifier
{
  return self->_syncCircleIdentifier;
}

- (void)setSyncCircleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_syncCircleIdentifier, a3);
}

- (NSData)ownerParticipant
{
  return self->_ownerParticipant;
}

- (void)setOwnerParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_ownerParticipant, a3);
}

- (NSData)sourceProfileIdentifier
{
  return self->_sourceProfileIdentifier;
}

- (void)setSourceProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceProfileIdentifier, a3);
}

- (NSData)shareParticipant
{
  return self->_shareParticipant;
}

- (void)setShareParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_shareParticipant, a3);
}

- (NSString)ownerCloudKitEmailAddress
{
  return self->_ownerCloudKitEmailAddress;
}

- (void)setOwnerCloudKitEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_ownerCloudKitEmailAddress, a3);
}

- (NSMutableArray)invitationTokens
{
  return self->_invitationTokens;
}

- (void)setInvitationTokens:(id)a3
{
  objc_storeStrong((id *)&self->_invitationTokens, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncCircleIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_shareParticipant, 0);
  objc_storeStrong((id *)&self->_ownerParticipant, 0);
  objc_storeStrong((id *)&self->_ownerCloudKitEmailAddress, 0);
  objc_storeStrong((id *)&self->_invitationTokens, 0);
}

@end
