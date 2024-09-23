@implementation FTCPPETInteraction

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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)FTCPPETInteraction;
  -[FTCPPETInteraction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTCPPETInteraction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSString *mechanism;
  void *v13;
  NSString *duration;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_participants, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_participants, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = self->_participants;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("participants"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp, (_QWORD)v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("timestamp"));

  mechanism = self->_mechanism;
  if (mechanism)
    objc_msgSend(v3, "setObject:forKey:", mechanism, CFSTR("mechanism"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInbound);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("isInbound"));

  duration = self->_duration;
  if (duration)
    objc_msgSend(v3, "setObject:forKey:", duration, CFSTR("duration"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FTCPPETInteractionReadFrom((uint64_t)self, (uint64_t)a3);
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_participants;
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

  PBDataWriterWriteUint64Field();
  if (!self->_mechanism)
    -[FTCPPETInteraction writeTo:].cold.1();
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
  if (!self->_duration)
    -[FTCPPETInteraction writeTo:].cold.2();
  PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (-[FTCPPETInteraction participantsCount](self, "participantsCount"))
  {
    objc_msgSend(v8, "clearParticipants");
    v4 = -[FTCPPETInteraction participantsCount](self, "participantsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[FTCPPETInteraction participantsAtIndex:](self, "participantsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addParticipants:", v7);

      }
    }
  }
  *((_QWORD *)v8 + 1) = self->_timestamp;
  objc_msgSend(v8, "setMechanism:", self->_mechanism);
  *((_BYTE *)v8 + 40) = self->_isInbound;
  objc_msgSend(v8, "setDuration:", self->_duration);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_participants;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addParticipants:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  *(_QWORD *)(v5 + 8) = self->_timestamp;
  v12 = -[NSString copyWithZone:](self->_mechanism, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  *(_BYTE *)(v5 + 40) = self->_isInbound;
  v14 = -[NSString copyWithZone:](self->_duration, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *participants;
  NSString *mechanism;
  NSString *duration;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  participants = self->_participants;
  if ((unint64_t)participants | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](participants, "isEqual:"))
      goto LABEL_12;
  }
  if (self->_timestamp != *((_QWORD *)v4 + 1))
    goto LABEL_12;
  mechanism = self->_mechanism;
  if ((unint64_t)mechanism | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](mechanism, "isEqual:"))
      goto LABEL_12;
  }
  if (self->_isInbound)
  {
    if (*((_BYTE *)v4 + 40))
      goto LABEL_9;
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  if (*((_BYTE *)v4 + 40))
    goto LABEL_12;
LABEL_9:
  duration = self->_duration;
  if ((unint64_t)duration | *((_QWORD *)v4 + 2))
    v8 = -[NSString isEqual:](duration, "isEqual:");
  else
    v8 = 1;
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;

  v3 = -[NSMutableArray hash](self->_participants, "hash");
  v4 = 2654435761u * self->_timestamp;
  v5 = v4 ^ v3 ^ -[NSString hash](self->_mechanism, "hash") ^ (2654435761 * self->_isInbound);
  return v5 ^ -[NSString hash](self->_duration, "hash");
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 4);
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
        -[FTCPPETInteraction addParticipants:](self, "addParticipants:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  self->_timestamp = *((_QWORD *)v4 + 1);
  if (*((_QWORD *)v4 + 3))
    -[FTCPPETInteraction setMechanism:](self, "setMechanism:");
  self->_isInbound = *((_BYTE *)v4 + 40);
  if (*((_QWORD *)v4 + 2))
    -[FTCPPETInteraction setDuration:](self, "setDuration:");

}

- (NSMutableArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (NSString)mechanism
{
  return self->_mechanism;
}

- (void)setMechanism:(id)a3
{
  objc_storeStrong((id *)&self->_mechanism, a3);
}

- (BOOL)isInbound
{
  return self->_isInbound;
}

- (void)setIsInbound:(BOOL)a3
{
  self->_isInbound = a3;
}

- (NSString)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_storeStrong((id *)&self->_duration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_mechanism, 0);
  objc_storeStrong((id *)&self->_duration, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[FTCPPETInteraction writeTo:]", "FTCPPETInteraction.m", 162, "nil != self->_mechanism");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[FTCPPETInteraction writeTo:]", "FTCPPETInteraction.m", 171, "nil != self->_duration");
}

@end
