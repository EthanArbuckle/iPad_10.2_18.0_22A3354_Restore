@implementation _MRPlaybackQueueProtobuf

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackQueueProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSString)requestID
{
  return self->_requestID;
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (int)location
{
  return self->_location;
}

- (NSMutableArray)homeUserIdentifiers
{
  return self->_homeUserIdentifiers;
}

- (BOOL)hasResolvedPlayerPath
{
  return self->_resolvedPlayerPath != 0;
}

- (BOOL)hasLocation
{
  return *(_BYTE *)&self->_has & 1;
}

- (_MRPlaybackQueueContextProtobuf)context
{
  return self->_context;
}

- (NSMutableArray)contentItems
{
  return self->_contentItems;
}

- (void)setResolvedPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedPlayerPath, a3);
}

- (void)setRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestID, a3);
}

- (void)setQueueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_queueIdentifier, a3);
}

- (void)setLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_location = a3;
}

- (void)setHomeUserIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_homeUserIdentifiers, a3);
}

- (void)setHasLocation:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setContentItems:(id)a3
{
  objc_storeStrong((id *)&self->_contentItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedPlayerPath, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_homeUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_auxiliaryNowPlayingInfo, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
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
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_contentItems;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  if (self->_context)
    PBDataWriterWriteSubmessage();
  if (self->_requestID)
    PBDataWriterWriteStringField();
  if (self->_resolvedPlayerPath)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_queueIdentifier)
    PBDataWriterWriteStringField();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_participants;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_homeUserIdentifiers;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

  if (self->_properties)
    PBDataWriterWriteSubmessage();
  if (self->_auxiliaryNowPlayingInfo)
    PBDataWriterWriteSubmessage();

}

- (void)addContentItem:(id)a3
{
  id v4;
  NSMutableArray *contentItems;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  contentItems = self->_contentItems;
  v8 = v4;
  if (!contentItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_contentItems;
    self->_contentItems = v6;

    v4 = v8;
    contentItems = self->_contentItems;
  }
  -[NSMutableArray addObject:](contentItems, "addObject:", v4);

}

- (void)clearContentItems
{
  -[NSMutableArray removeAllObjects](self->_contentItems, "removeAllObjects");
}

- (unint64_t)contentItemsCount
{
  return -[NSMutableArray count](self->_contentItems, "count");
}

- (id)contentItemAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_contentItems, "objectAtIndex:", a3);
}

+ (Class)contentItemType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (void)setSendingPlaybackQueueTransaction:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_sendingPlaybackQueueTransaction = a3;
}

- (void)setHasSendingPlaybackQueueTransaction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSendingPlaybackQueueTransaction
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasQueueIdentifier
{
  return self->_queueIdentifier != 0;
}

- (void)clearParticipants
{
  -[NSMutableArray removeAllObjects](self->_participants, "removeAllObjects");
}

- (void)addParticipants:(id)a3
{
  id v4;
  NSMutableArray *participants;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  participants = self->_participants;
  v8 = v4;
  if (!participants)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_participants;
    self->_participants = v6;

    v4 = v8;
    participants = self->_participants;
  }
  -[NSMutableArray addObject:](participants, "addObject:", v4);

}

- (unint64_t)participantsCount
{
  return -[NSMutableArray count](self->_participants, "count");
}

- (id)participantsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_participants, "objectAtIndex:", a3);
}

+ (Class)participantsType
{
  return (Class)objc_opt_class();
}

- (void)clearHomeUserIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_homeUserIdentifiers, "removeAllObjects");
}

- (void)addHomeUserIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *homeUserIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  homeUserIdentifiers = self->_homeUserIdentifiers;
  v8 = v4;
  if (!homeUserIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_homeUserIdentifiers;
    self->_homeUserIdentifiers = v6;

    v4 = v8;
    homeUserIdentifiers = self->_homeUserIdentifiers;
  }
  -[NSMutableArray addObject:](homeUserIdentifiers, "addObject:", v4);

}

- (unint64_t)homeUserIdentifiersCount
{
  return -[NSMutableArray count](self->_homeUserIdentifiers, "count");
}

- (id)homeUserIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_homeUserIdentifiers, "objectAtIndex:", a3);
}

+ (Class)homeUserIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasProperties
{
  return self->_properties != 0;
}

- (BOOL)hasAuxiliaryNowPlayingInfo
{
  return self->_auxiliaryNowPlayingInfo != 0;
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
  v8.super_class = (Class)_MRPlaybackQueueProtobuf;
  -[_MRPlaybackQueueProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackQueueProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _MRPlaybackQueueContextProtobuf *context;
  void *v13;
  NSString *requestID;
  _MRNowPlayingPlayerPathProtobuf *resolvedPlayerPath;
  void *v16;
  void *v17;
  NSString *queueIdentifier;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  NSMutableArray *homeUserIdentifiers;
  _MRDictionaryProtobuf *properties;
  void *v28;
  _MRDictionaryProtobuf *auxiliaryNowPlayingInfo;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_location);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("location"));

  }
  if (-[NSMutableArray count](self->_contentItems, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_contentItems, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v6 = self->_contentItems;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v37 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("contentItem"));
  }
  context = self->_context;
  if (context)
  {
    -[_MRPlaybackQueueContextProtobuf dictionaryRepresentation](context, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("context"));

  }
  requestID = self->_requestID;
  if (requestID)
    objc_msgSend(v3, "setObject:forKey:", requestID, CFSTR("requestID"));
  resolvedPlayerPath = self->_resolvedPlayerPath;
  if (resolvedPlayerPath)
  {
    -[_MRNowPlayingPlayerPathProtobuf dictionaryRepresentation](resolvedPlayerPath, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("resolvedPlayerPath"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sendingPlaybackQueueTransaction);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("sendingPlaybackQueueTransaction"));

  }
  queueIdentifier = self->_queueIdentifier;
  if (queueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", queueIdentifier, CFSTR("queueIdentifier"));
  if (-[NSMutableArray count](self->_participants, "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_participants, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v20 = self->_participants;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v32);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("participants"));
  }
  homeUserIdentifiers = self->_homeUserIdentifiers;
  if (homeUserIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", homeUserIdentifiers, CFSTR("homeUserIdentifiers"));
  properties = self->_properties;
  if (properties)
  {
    -[_MRDictionaryProtobuf dictionaryRepresentation](properties, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("properties"));

  }
  auxiliaryNowPlayingInfo = self->_auxiliaryNowPlayingInfo;
  if (auxiliaryNowPlayingInfo)
  {
    -[_MRDictionaryProtobuf dictionaryRepresentation](auxiliaryNowPlayingInfo, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("auxiliaryNowPlayingInfo"));

  }
  return v3;
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  void *v17;
  _BYTE *v18;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[10] = self->_location;
    *((_BYTE *)v4 + 92) |= 1u;
  }
  v18 = v4;
  if (-[_MRPlaybackQueueProtobuf contentItemsCount](self, "contentItemsCount"))
  {
    objc_msgSend(v18, "clearContentItems");
    v5 = -[_MRPlaybackQueueProtobuf contentItemsCount](self, "contentItemsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[_MRPlaybackQueueProtobuf contentItemAtIndex:](self, "contentItemAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addContentItem:", v8);

      }
    }
  }
  if (self->_context)
    objc_msgSend(v18, "setContext:");
  if (self->_requestID)
    objc_msgSend(v18, "setRequestID:");
  if (self->_resolvedPlayerPath)
    objc_msgSend(v18, "setResolvedPlayerPath:");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v18[88] = self->_sendingPlaybackQueueTransaction;
    v18[92] |= 2u;
  }
  if (self->_queueIdentifier)
    objc_msgSend(v18, "setQueueIdentifier:");
  if (-[_MRPlaybackQueueProtobuf participantsCount](self, "participantsCount"))
  {
    objc_msgSend(v18, "clearParticipants");
    v9 = -[_MRPlaybackQueueProtobuf participantsCount](self, "participantsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[_MRPlaybackQueueProtobuf participantsAtIndex:](self, "participantsAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addParticipants:", v12);

      }
    }
  }
  if (-[_MRPlaybackQueueProtobuf homeUserIdentifiersCount](self, "homeUserIdentifiersCount"))
  {
    objc_msgSend(v18, "clearHomeUserIdentifiers");
    v13 = -[_MRPlaybackQueueProtobuf homeUserIdentifiersCount](self, "homeUserIdentifiersCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[_MRPlaybackQueueProtobuf homeUserIdentifiersAtIndex:](self, "homeUserIdentifiersAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addHomeUserIdentifiers:", v16);

      }
    }
  }
  if (self->_properties)
    objc_msgSend(v18, "setProperties:");
  v17 = v18;
  if (self->_auxiliaryNowPlayingInfo)
  {
    objc_msgSend(v18, "setAuxiliaryNowPlayingInfo:");
    v17 = v18;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_location;
    *(_BYTE *)(v5 + 92) |= 1u;
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v7 = self->_contentItems;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v47;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v47 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addContentItem:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v9);
  }

  v13 = -[_MRPlaybackQueueContextProtobuf copyWithZone:](self->_context, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v13;

  v15 = -[NSString copyWithZone:](self->_requestID, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v15;

  v17 = -[_MRNowPlayingPlayerPathProtobuf copyWithZone:](self->_resolvedPlayerPath, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v17;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v6 + 88) = self->_sendingPlaybackQueueTransaction;
    *(_BYTE *)(v6 + 92) |= 2u;
  }
  v19 = -[NSString copyWithZone:](self->_queueIdentifier, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v19;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v21 = self->_participants;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v43;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v43 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v25), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addParticipants:", v26);

        ++v25;
      }
      while (v23 != v25);
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v23);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v27 = self->_homeUserIdentifiers;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v39;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v39 != v30)
          objc_enumerationMutation(v27);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v31), "copyWithZone:", a3, (_QWORD)v38);
        objc_msgSend((id)v6, "addHomeUserIdentifiers:", v32);

        ++v31;
      }
      while (v29 != v31);
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v29);
  }

  v33 = -[_MRDictionaryProtobuf copyWithZone:](self->_properties, "copyWithZone:", a3);
  v34 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v33;

  v35 = -[_MRDictionaryProtobuf copyWithZone:](self->_auxiliaryNowPlayingInfo, "copyWithZone:", a3);
  v36 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v35;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *contentItems;
  _MRPlaybackQueueContextProtobuf *context;
  NSString *requestID;
  _MRNowPlayingPlayerPathProtobuf *resolvedPlayerPath;
  NSString *queueIdentifier;
  NSMutableArray *participants;
  NSMutableArray *homeUserIdentifiers;
  _MRDictionaryProtobuf *properties;
  _MRDictionaryProtobuf *auxiliaryNowPlayingInfo;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 1) == 0 || self->_location != *((_DWORD *)v4 + 10))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    goto LABEL_33;
  }
  contentItems = self->_contentItems;
  if ((unint64_t)contentItems | *((_QWORD *)v4 + 2)
    && !-[NSMutableArray isEqual:](contentItems, "isEqual:"))
  {
    goto LABEL_33;
  }
  context = self->_context;
  if ((unint64_t)context | *((_QWORD *)v4 + 3))
  {
    if (!-[_MRPlaybackQueueContextProtobuf isEqual:](context, "isEqual:"))
      goto LABEL_33;
  }
  requestID = self->_requestID;
  if ((unint64_t)requestID | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](requestID, "isEqual:"))
      goto LABEL_33;
  }
  resolvedPlayerPath = self->_resolvedPlayerPath;
  if ((unint64_t)resolvedPlayerPath | *((_QWORD *)v4 + 10))
  {
    if (!-[_MRNowPlayingPlayerPathProtobuf isEqual:](resolvedPlayerPath, "isEqual:"))
      goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 2) != 0)
    {
      if (self->_sendingPlaybackQueueTransaction)
      {
        if (!*((_BYTE *)v4 + 88))
          goto LABEL_33;
        goto LABEL_23;
      }
      if (!*((_BYTE *)v4 + 88))
        goto LABEL_23;
    }
LABEL_33:
    v14 = 0;
    goto LABEL_34;
  }
  if ((*((_BYTE *)v4 + 92) & 2) != 0)
    goto LABEL_33;
LABEL_23:
  queueIdentifier = self->_queueIdentifier;
  if ((unint64_t)queueIdentifier | *((_QWORD *)v4 + 8)
    && !-[NSString isEqual:](queueIdentifier, "isEqual:"))
  {
    goto LABEL_33;
  }
  participants = self->_participants;
  if ((unint64_t)participants | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](participants, "isEqual:"))
      goto LABEL_33;
  }
  homeUserIdentifiers = self->_homeUserIdentifiers;
  if ((unint64_t)homeUserIdentifiers | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](homeUserIdentifiers, "isEqual:"))
      goto LABEL_33;
  }
  properties = self->_properties;
  if ((unint64_t)properties | *((_QWORD *)v4 + 7))
  {
    if (!-[_MRDictionaryProtobuf isEqual:](properties, "isEqual:"))
      goto LABEL_33;
  }
  auxiliaryNowPlayingInfo = self->_auxiliaryNowPlayingInfo;
  if ((unint64_t)auxiliaryNowPlayingInfo | *((_QWORD *)v4 + 1))
    v14 = -[_MRDictionaryProtobuf isEqual:](auxiliaryNowPlayingInfo, "isEqual:");
  else
    v14 = 1;
LABEL_34:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_location;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_contentItems, "hash");
  v5 = -[_MRPlaybackQueueContextProtobuf hash](self->_context, "hash");
  v6 = -[NSString hash](self->_requestID, "hash");
  v7 = -[_MRNowPlayingPlayerPathProtobuf hash](self->_resolvedPlayerPath, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v8 = 2654435761 * self->_sendingPlaybackQueueTransaction;
  else
    v8 = 0;
  v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_queueIdentifier, "hash");
  v10 = -[NSMutableArray hash](self->_participants, "hash");
  v11 = v10 ^ -[NSMutableArray hash](self->_homeUserIdentifiers, "hash");
  v12 = v11 ^ -[_MRDictionaryProtobuf hash](self->_properties, "hash");
  return v9 ^ v12 ^ -[_MRDictionaryProtobuf hash](self->_auxiliaryNowPlayingInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _MRPlaybackQueueContextProtobuf *context;
  uint64_t v12;
  _MRNowPlayingPlayerPathProtobuf *resolvedPlayerPath;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  _MRDictionaryProtobuf *properties;
  uint64_t v26;
  _MRDictionaryProtobuf *auxiliaryNowPlayingInfo;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
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
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    self->_location = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = *((id *)v4 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v6);
        -[_MRPlaybackQueueProtobuf addContentItem:](self, "addContentItem:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v8);
  }

  context = self->_context;
  v12 = *((_QWORD *)v5 + 3);
  if (context)
  {
    if (v12)
      -[_MRPlaybackQueueContextProtobuf mergeFrom:](context, "mergeFrom:");
  }
  else if (v12)
  {
    -[_MRPlaybackQueueProtobuf setContext:](self, "setContext:");
  }
  if (*((_QWORD *)v5 + 9))
    -[_MRPlaybackQueueProtobuf setRequestID:](self, "setRequestID:");
  resolvedPlayerPath = self->_resolvedPlayerPath;
  v14 = *((_QWORD *)v5 + 10);
  if (resolvedPlayerPath)
  {
    if (v14)
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](resolvedPlayerPath, "mergeFrom:");
  }
  else if (v14)
  {
    -[_MRPlaybackQueueProtobuf setResolvedPlayerPath:](self, "setResolvedPlayerPath:");
  }
  if ((*((_BYTE *)v5 + 92) & 2) != 0)
  {
    self->_sendingPlaybackQueueTransaction = *((_BYTE *)v5 + 88);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v5 + 8))
    -[_MRPlaybackQueueProtobuf setQueueIdentifier:](self, "setQueueIdentifier:");
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = *((id *)v5 + 6);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        -[_MRPlaybackQueueProtobuf addParticipants:](self, "addParticipants:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v17);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = *((id *)v5 + 4);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v20);
        -[_MRPlaybackQueueProtobuf addHomeUserIdentifiers:](self, "addHomeUserIdentifiers:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k), (_QWORD)v29);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v22);
  }

  properties = self->_properties;
  v26 = *((_QWORD *)v5 + 7);
  if (properties)
  {
    if (v26)
      -[_MRDictionaryProtobuf mergeFrom:](properties, "mergeFrom:");
  }
  else if (v26)
  {
    -[_MRPlaybackQueueProtobuf setProperties:](self, "setProperties:");
  }
  auxiliaryNowPlayingInfo = self->_auxiliaryNowPlayingInfo;
  v28 = *((_QWORD *)v5 + 1);
  if (auxiliaryNowPlayingInfo)
  {
    if (v28)
      -[_MRDictionaryProtobuf mergeFrom:](auxiliaryNowPlayingInfo, "mergeFrom:");
  }
  else if (v28)
  {
    -[_MRPlaybackQueueProtobuf setAuxiliaryNowPlayingInfo:](self, "setAuxiliaryNowPlayingInfo:");
  }

}

- (_MRNowPlayingPlayerPathProtobuf)resolvedPlayerPath
{
  return self->_resolvedPlayerPath;
}

- (BOOL)sendingPlaybackQueueTransaction
{
  return self->_sendingPlaybackQueueTransaction;
}

- (NSMutableArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (_MRDictionaryProtobuf)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (_MRDictionaryProtobuf)auxiliaryNowPlayingInfo
{
  return self->_auxiliaryNowPlayingInfo;
}

- (void)setAuxiliaryNowPlayingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryNowPlayingInfo, a3);
}

@end
