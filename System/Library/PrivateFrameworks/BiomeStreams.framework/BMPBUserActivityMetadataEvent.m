@implementation BMPBUserActivityMetadataEvent

- (void)setAbsoluteTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasUserActivityData
{
  return self->_userActivityData != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasActivityType
{
  return self->_activityType != 0;
}

- (BOOL)hasAssociatedBundleId
{
  return self->_associatedBundleId != 0;
}

- (BOOL)hasAssociatedURLString
{
  return self->_associatedURLString != 0;
}

- (BOOL)hasModeIdentifier
{
  return self->_modeIdentifier != 0;
}

- (void)clearTopics
{
  -[NSMutableArray removeAllObjects](self->_topics, "removeAllObjects");
}

- (void)addTopics:(id)a3
{
  id v4;
  NSMutableArray *topics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topics = self->_topics;
  v8 = v4;
  if (!topics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_topics;
    self->_topics = v6;

    v4 = v8;
    topics = self->_topics;
  }
  -[NSMutableArray addObject:](topics, "addObject:", v4);

}

- (unint64_t)topicsCount
{
  return -[NSMutableArray count](self->_topics, "count");
}

- (id)topicsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topics, "objectAtIndex:", a3);
}

+ (Class)topicsType
{
  return (Class)objc_opt_class();
}

- (void)setHasAssociatedImageRepresentation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_hasAssociatedImageRepresentation = a3;
}

- (void)setHasHasAssociatedImageRepresentation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHasAssociatedImageRepresentation
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
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
  v8.super_class = (Class)BMPBUserActivityMetadataEvent;
  -[BMPBUserActivityMetadataEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBUserActivityMetadataEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *userActivityData;
  NSString *title;
  NSString *activityType;
  NSString *associatedBundleId;
  NSString *associatedURLString;
  NSString *modeIdentifier;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSString *uuid;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("absoluteTimestamp"));

  }
  userActivityData = self->_userActivityData;
  if (userActivityData)
    objc_msgSend(v3, "setObject:forKey:", userActivityData, CFSTR("userActivityData"));
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  activityType = self->_activityType;
  if (activityType)
    objc_msgSend(v3, "setObject:forKey:", activityType, CFSTR("activityType"));
  associatedBundleId = self->_associatedBundleId;
  if (associatedBundleId)
    objc_msgSend(v3, "setObject:forKey:", associatedBundleId, CFSTR("associatedBundleId"));
  associatedURLString = self->_associatedURLString;
  if (associatedURLString)
    objc_msgSend(v3, "setObject:forKey:", associatedURLString, CFSTR("associatedURLString"));
  modeIdentifier = self->_modeIdentifier;
  if (modeIdentifier)
    objc_msgSend(v3, "setObject:forKey:", modeIdentifier, CFSTR("modeIdentifier"));
  if (-[NSMutableArray count](self->_topics, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_topics, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = self->_topics;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("topics"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasAssociatedImageRepresentation);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("hasAssociatedImageRepresentation"));

  }
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBUserActivityMetadataEventReadFrom(self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_userActivityData)
    PBDataWriterWriteDataField();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_activityType)
    PBDataWriterWriteStringField();
  if (self->_associatedBundleId)
    PBDataWriterWriteStringField();
  if (self->_associatedURLString)
    PBDataWriterWriteStringField();
  if (self->_modeIdentifier)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_topics;
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

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_uuid)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  _BYTE *v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_absoluteTimestamp;
    *((_BYTE *)v4 + 84) |= 1u;
  }
  v10 = v4;
  if (self->_userActivityData)
    objc_msgSend(v4, "setUserActivityData:");
  if (self->_title)
    objc_msgSend(v10, "setTitle:");
  if (self->_activityType)
    objc_msgSend(v10, "setActivityType:");
  if (self->_associatedBundleId)
    objc_msgSend(v10, "setAssociatedBundleId:");
  if (self->_associatedURLString)
    objc_msgSend(v10, "setAssociatedURLString:");
  if (self->_modeIdentifier)
    objc_msgSend(v10, "setModeIdentifier:");
  if (-[BMPBUserActivityMetadataEvent topicsCount](self, "topicsCount"))
  {
    objc_msgSend(v10, "clearTopics");
    v5 = -[BMPBUserActivityMetadataEvent topicsCount](self, "topicsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[BMPBUserActivityMetadataEvent topicsAtIndex:](self, "topicsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addTopics:", v8);

      }
    }
  }
  v9 = v10;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10[80] = self->_hasAssociatedImageRepresentation;
    v10[84] |= 2u;
  }
  if (self->_uuid)
  {
    objc_msgSend(v10, "setUuid:");
    v9 = v10;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_BYTE *)(v5 + 84) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_userActivityData, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v7;

  v9 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v9;

  v11 = -[NSString copyWithZone:](self->_activityType, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v11;

  v13 = -[NSString copyWithZone:](self->_associatedBundleId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v13;

  v15 = -[NSString copyWithZone:](self->_associatedURLString, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v15;

  v17 = -[NSString copyWithZone:](self->_modeIdentifier, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v17;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = self->_topics;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v23), "copyWithZone:", a3, (_QWORD)v28);
        objc_msgSend((id)v6, "addTopics:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v21);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v6 + 80) = self->_hasAssociatedImageRepresentation;
    *(_BYTE *)(v6 + 84) |= 2u;
  }
  v25 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3, (_QWORD)v28);
  v26 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v25;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *userActivityData;
  NSString *title;
  NSString *activityType;
  NSString *associatedBundleId;
  NSString *associatedURLString;
  NSString *modeIdentifier;
  NSMutableArray *topics;
  char v12;
  NSString *uuid;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    goto LABEL_25;
  }
  userActivityData = self->_userActivityData;
  if ((unint64_t)userActivityData | *((_QWORD *)v4 + 8)
    && !-[NSData isEqual:](userActivityData, "isEqual:"))
  {
    goto LABEL_25;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_25;
  }
  activityType = self->_activityType;
  if ((unint64_t)activityType | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](activityType, "isEqual:"))
      goto LABEL_25;
  }
  associatedBundleId = self->_associatedBundleId;
  if ((unint64_t)associatedBundleId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](associatedBundleId, "isEqual:"))
      goto LABEL_25;
  }
  associatedURLString = self->_associatedURLString;
  if ((unint64_t)associatedURLString | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](associatedURLString, "isEqual:"))
      goto LABEL_25;
  }
  modeIdentifier = self->_modeIdentifier;
  if ((unint64_t)modeIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](modeIdentifier, "isEqual:"))
      goto LABEL_25;
  }
  topics = self->_topics;
  if ((unint64_t)topics | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](topics, "isEqual:"))
      goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 84) & 2) == 0)
      goto LABEL_31;
LABEL_25:
    v12 = 0;
    goto LABEL_26;
  }
  if ((*((_BYTE *)v4 + 84) & 2) == 0)
    goto LABEL_25;
  if (!self->_hasAssociatedImageRepresentation)
  {
    if (!*((_BYTE *)v4 + 80))
      goto LABEL_31;
    goto LABEL_25;
  }
  if (!*((_BYTE *)v4 + 80))
    goto LABEL_25;
LABEL_31:
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 9))
    v12 = -[NSString isEqual:](uuid, "isEqual:");
  else
    v12 = 1;
LABEL_26:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  double absoluteTimestamp;
  double v5;
  long double v6;
  double v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    absoluteTimestamp = self->_absoluteTimestamp;
    v5 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0)
      v5 = self->_absoluteTimestamp;
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
  v8 = -[NSData hash](self->_userActivityData, "hash");
  v9 = -[NSString hash](self->_title, "hash");
  v10 = -[NSString hash](self->_activityType, "hash");
  v11 = -[NSString hash](self->_associatedBundleId, "hash");
  v12 = -[NSString hash](self->_associatedURLString, "hash");
  v13 = -[NSString hash](self->_modeIdentifier, "hash");
  v14 = -[NSMutableArray hash](self->_topics, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v15 = 2654435761 * self->_hasAssociatedImageRepresentation;
  else
    v15 = 0;
  return v8 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ -[NSString hash](self->_uuid, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (double *)a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    self->_absoluteTimestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 8))
    -[BMPBUserActivityMetadataEvent setUserActivityData:](self, "setUserActivityData:");
  if (*((_QWORD *)v5 + 6))
    -[BMPBUserActivityMetadataEvent setTitle:](self, "setTitle:");
  if (*((_QWORD *)v5 + 2))
    -[BMPBUserActivityMetadataEvent setActivityType:](self, "setActivityType:");
  if (*((_QWORD *)v5 + 3))
    -[BMPBUserActivityMetadataEvent setAssociatedBundleId:](self, "setAssociatedBundleId:");
  if (*((_QWORD *)v5 + 4))
    -[BMPBUserActivityMetadataEvent setAssociatedURLString:](self, "setAssociatedURLString:");
  if (*((_QWORD *)v5 + 5))
    -[BMPBUserActivityMetadataEvent setModeIdentifier:](self, "setModeIdentifier:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v5 + 7);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[BMPBUserActivityMetadataEvent addTopics:](self, "addTopics:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((*((_BYTE *)v5 + 84) & 2) != 0)
  {
    self->_hasAssociatedImageRepresentation = *((_BYTE *)v5 + 80);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v5 + 9))
    -[BMPBUserActivityMetadataEvent setUuid:](self, "setUuid:");

}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (void)setUserActivityData:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityData, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_activityType, a3);
}

- (NSString)associatedBundleId
{
  return self->_associatedBundleId;
}

- (void)setAssociatedBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_associatedBundleId, a3);
}

- (NSString)associatedURLString
{
  return self->_associatedURLString;
}

- (void)setAssociatedURLString:(id)a3
{
  objc_storeStrong((id *)&self->_associatedURLString, a3);
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (void)setModeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_modeIdentifier, a3);
}

- (NSMutableArray)topics
{
  return self->_topics;
}

- (void)setTopics:(id)a3
{
  objc_storeStrong((id *)&self->_topics, a3);
}

- (BOOL)hasAssociatedImageRepresentation
{
  return self->_hasAssociatedImageRepresentation;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedURLString, 0);
  objc_storeStrong((id *)&self->_associatedBundleId, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end
