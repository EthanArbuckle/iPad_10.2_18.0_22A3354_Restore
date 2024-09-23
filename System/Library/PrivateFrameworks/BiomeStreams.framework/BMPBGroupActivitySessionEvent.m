@implementation BMPBGroupActivitySessionEvent

- (void)setIsActive:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isActive = a3;
}

- (void)setHasIsActive:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsActive
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSourceBundleId
{
  return self->_sourceBundleId != 0;
}

- (BOOL)hasActivitySessionId
{
  return self->_activitySessionId != 0;
}

- (BOOL)hasActivityId
{
  return self->_activityId != 0;
}

- (BOOL)hasMessagesChatGuid
{
  return self->_messagesChatGuid != 0;
}

- (BOOL)hasExperienceType
{
  return self->_experienceType != 0;
}

- (void)clearParticipantHandles
{
  -[NSMutableArray removeAllObjects](self->_participantHandles, "removeAllObjects");
}

- (void)addParticipantHandles:(id)a3
{
  id v4;
  NSMutableArray *participantHandles;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  participantHandles = self->_participantHandles;
  v8 = v4;
  if (!participantHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_participantHandles;
    self->_participantHandles = v6;

    v4 = v8;
    participantHandles = self->_participantHandles;
  }
  -[NSMutableArray addObject:](participantHandles, "addObject:", v4);

}

- (unint64_t)participantHandlesCount
{
  return -[NSMutableArray count](self->_participantHandles, "count");
}

- (id)participantHandlesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_participantHandles, "objectAtIndex:", a3);
}

+ (Class)participantHandlesType
{
  return (Class)objc_opt_class();
}

- (void)clearMemberHandles
{
  -[NSMutableArray removeAllObjects](self->_memberHandles, "removeAllObjects");
}

- (void)addMemberHandles:(id)a3
{
  id v4;
  NSMutableArray *memberHandles;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  memberHandles = self->_memberHandles;
  v8 = v4;
  if (!memberHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_memberHandles;
    self->_memberHandles = v6;

    v4 = v8;
    memberHandles = self->_memberHandles;
  }
  -[NSMutableArray addObject:](memberHandles, "addObject:", v4);

}

- (unint64_t)memberHandlesCount
{
  return -[NSMutableArray count](self->_memberHandles, "count");
}

- (id)memberHandlesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_memberHandles, "objectAtIndex:", a3);
}

+ (Class)memberHandlesType
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
  v8.super_class = (Class)BMPBGroupActivitySessionEvent;
  -[BMPBGroupActivitySessionEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBGroupActivitySessionEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sourceBundleId;
  NSString *activitySessionId;
  NSString *activityId;
  NSString *messagesChatGuid;
  NSString *experienceType;
  NSMutableArray *participantHandles;
  NSMutableArray *memberHandles;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isActive);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("isActive"));

  }
  sourceBundleId = self->_sourceBundleId;
  if (sourceBundleId)
    objc_msgSend(v3, "setObject:forKey:", sourceBundleId, CFSTR("sourceBundleId"));
  activitySessionId = self->_activitySessionId;
  if (activitySessionId)
    objc_msgSend(v3, "setObject:forKey:", activitySessionId, CFSTR("activitySessionId"));
  activityId = self->_activityId;
  if (activityId)
    objc_msgSend(v3, "setObject:forKey:", activityId, CFSTR("activityId"));
  messagesChatGuid = self->_messagesChatGuid;
  if (messagesChatGuid)
    objc_msgSend(v3, "setObject:forKey:", messagesChatGuid, CFSTR("messagesChatGuid"));
  experienceType = self->_experienceType;
  if (experienceType)
    objc_msgSend(v3, "setObject:forKey:", experienceType, CFSTR("experienceType"));
  participantHandles = self->_participantHandles;
  if (participantHandles)
    objc_msgSend(v3, "setObject:forKey:", participantHandles, CFSTR("participantHandles"));
  memberHandles = self->_memberHandles;
  if (memberHandles)
    objc_msgSend(v3, "setObject:forKey:", memberHandles, CFSTR("memberHandles"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBGroupActivitySessionEventReadFrom(self, (uint64_t)a3);
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_sourceBundleId)
    PBDataWriterWriteStringField();
  if (self->_activitySessionId)
    PBDataWriterWriteStringField();
  if (self->_activityId)
    PBDataWriterWriteStringField();
  if (self->_messagesChatGuid)
    PBDataWriterWriteStringField();
  if (self->_experienceType)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_participantHandles;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_memberHandles;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  id v13;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[64] = self->_isActive;
    v4[68] |= 1u;
  }
  v13 = v4;
  if (self->_sourceBundleId)
    objc_msgSend(v4, "setSourceBundleId:");
  if (self->_activitySessionId)
    objc_msgSend(v13, "setActivitySessionId:");
  if (self->_activityId)
    objc_msgSend(v13, "setActivityId:");
  if (self->_messagesChatGuid)
    objc_msgSend(v13, "setMessagesChatGuid:");
  if (self->_experienceType)
    objc_msgSend(v13, "setExperienceType:");
  if (-[BMPBGroupActivitySessionEvent participantHandlesCount](self, "participantHandlesCount"))
  {
    objc_msgSend(v13, "clearParticipantHandles");
    v5 = -[BMPBGroupActivitySessionEvent participantHandlesCount](self, "participantHandlesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[BMPBGroupActivitySessionEvent participantHandlesAtIndex:](self, "participantHandlesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addParticipantHandles:", v8);

      }
    }
  }
  if (-[BMPBGroupActivitySessionEvent memberHandlesCount](self, "memberHandlesCount"))
  {
    objc_msgSend(v13, "clearMemberHandles");
    v9 = -[BMPBGroupActivitySessionEvent memberHandlesCount](self, "memberHandlesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[BMPBGroupActivitySessionEvent memberHandlesAtIndex:](self, "memberHandlesAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addMemberHandles:", v12);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 64) = self->_isActive;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_sourceBundleId, "copyWithZone:", a3);
  v8 = (void *)v6[7];
  v6[7] = v7;

  v9 = -[NSString copyWithZone:](self->_activitySessionId, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[NSString copyWithZone:](self->_activityId, "copyWithZone:", a3);
  v12 = (void *)v6[1];
  v6[1] = v11;

  v13 = -[NSString copyWithZone:](self->_messagesChatGuid, "copyWithZone:", a3);
  v14 = (void *)v6[5];
  v6[5] = v13;

  v15 = -[NSString copyWithZone:](self->_experienceType, "copyWithZone:", a3);
  v16 = (void *)v6[3];
  v6[3] = v15;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v17 = self->_participantHandles;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v35;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v21), "copyWithZone:", a3);
        objc_msgSend(v6, "addParticipantHandles:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v19);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v23 = self->_memberHandles;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v31;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(v23);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v27), "copyWithZone:", a3, (_QWORD)v30);
        objc_msgSend(v6, "addMemberHandles:", v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v25);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sourceBundleId;
  NSString *activitySessionId;
  NSString *activityId;
  NSString *messagesChatGuid;
  NSString *experienceType;
  NSMutableArray *participantHandles;
  NSMutableArray *memberHandles;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) != 0)
    {
      if (self->_isActive)
      {
        if (!*((_BYTE *)v4 + 64))
          goto LABEL_24;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_10;
    }
LABEL_24:
    v12 = 0;
    goto LABEL_25;
  }
  if ((*((_BYTE *)v4 + 68) & 1) != 0)
    goto LABEL_24;
LABEL_10:
  sourceBundleId = self->_sourceBundleId;
  if ((unint64_t)sourceBundleId | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](sourceBundleId, "isEqual:"))
  {
    goto LABEL_24;
  }
  activitySessionId = self->_activitySessionId;
  if ((unint64_t)activitySessionId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](activitySessionId, "isEqual:"))
      goto LABEL_24;
  }
  activityId = self->_activityId;
  if ((unint64_t)activityId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](activityId, "isEqual:"))
      goto LABEL_24;
  }
  messagesChatGuid = self->_messagesChatGuid;
  if ((unint64_t)messagesChatGuid | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](messagesChatGuid, "isEqual:"))
      goto LABEL_24;
  }
  experienceType = self->_experienceType;
  if ((unint64_t)experienceType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](experienceType, "isEqual:"))
      goto LABEL_24;
  }
  participantHandles = self->_participantHandles;
  if ((unint64_t)participantHandles | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](participantHandles, "isEqual:"))
      goto LABEL_24;
  }
  memberHandles = self->_memberHandles;
  if ((unint64_t)memberHandles | *((_QWORD *)v4 + 4))
    v12 = -[NSMutableArray isEqual:](memberHandles, "isEqual:");
  else
    v12 = 1;
LABEL_25:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_isActive;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_sourceBundleId, "hash") ^ v3;
  v5 = -[NSString hash](self->_activitySessionId, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_activityId, "hash");
  v7 = -[NSString hash](self->_messagesChatGuid, "hash");
  v8 = v7 ^ -[NSString hash](self->_experienceType, "hash");
  v9 = v6 ^ v8 ^ -[NSMutableArray hash](self->_participantHandles, "hash");
  return v9 ^ -[NSMutableArray hash](self->_memberHandles, "hash");
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  id v5;
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
  v5 = v4;
  if ((v4[68] & 1) != 0)
  {
    self->_isActive = v4[64];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 7))
    -[BMPBGroupActivitySessionEvent setSourceBundleId:](self, "setSourceBundleId:");
  if (*((_QWORD *)v5 + 2))
    -[BMPBGroupActivitySessionEvent setActivitySessionId:](self, "setActivitySessionId:");
  if (*((_QWORD *)v5 + 1))
    -[BMPBGroupActivitySessionEvent setActivityId:](self, "setActivityId:");
  if (*((_QWORD *)v5 + 5))
    -[BMPBGroupActivitySessionEvent setMessagesChatGuid:](self, "setMessagesChatGuid:");
  if (*((_QWORD *)v5 + 3))
    -[BMPBGroupActivitySessionEvent setExperienceType:](self, "setExperienceType:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = *((id *)v5 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
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
        -[BMPBGroupActivitySessionEvent addParticipantHandles:](self, "addParticipantHandles:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *((id *)v5 + 4);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
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
        -[BMPBGroupActivitySessionEvent addMemberHandles:](self, "addMemberHandles:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (BOOL)isActive
{
  return self->_isActive;
}

- (NSString)sourceBundleId
{
  return self->_sourceBundleId;
}

- (void)setSourceBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceBundleId, a3);
}

- (NSString)activitySessionId
{
  return self->_activitySessionId;
}

- (void)setActivitySessionId:(id)a3
{
  objc_storeStrong((id *)&self->_activitySessionId, a3);
}

- (NSString)activityId
{
  return self->_activityId;
}

- (void)setActivityId:(id)a3
{
  objc_storeStrong((id *)&self->_activityId, a3);
}

- (NSString)messagesChatGuid
{
  return self->_messagesChatGuid;
}

- (void)setMessagesChatGuid:(id)a3
{
  objc_storeStrong((id *)&self->_messagesChatGuid, a3);
}

- (NSString)experienceType
{
  return self->_experienceType;
}

- (void)setExperienceType:(id)a3
{
  objc_storeStrong((id *)&self->_experienceType, a3);
}

- (NSMutableArray)participantHandles
{
  return self->_participantHandles;
}

- (void)setParticipantHandles:(id)a3
{
  objc_storeStrong((id *)&self->_participantHandles, a3);
}

- (NSMutableArray)memberHandles
{
  return self->_memberHandles;
}

- (void)setMemberHandles:(id)a3
{
  objc_storeStrong((id *)&self->_memberHandles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceBundleId, 0);
  objc_storeStrong((id *)&self->_participantHandles, 0);
  objc_storeStrong((id *)&self->_messagesChatGuid, 0);
  objc_storeStrong((id *)&self->_memberHandles, 0);
  objc_storeStrong((id *)&self->_experienceType, 0);
  objc_storeStrong((id *)&self->_activitySessionId, 0);
  objc_storeStrong((id *)&self->_activityId, 0);
}

@end
