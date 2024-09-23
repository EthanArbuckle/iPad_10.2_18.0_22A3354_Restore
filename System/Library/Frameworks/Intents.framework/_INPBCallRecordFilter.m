@implementation _INPBCallRecordFilter

- (void)setCallCapability:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_callCapability = a3;
  }
}

- (BOOL)hasCallCapability
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCallCapability:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)callCapabilityAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("AUDIO_CALL");
  if (a3 == 2)
  {
    v3 = CFSTR("VIDEO_CALL");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsCallCapability:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_CALL")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("VIDEO_CALL")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setCallTypes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)callTypes
{
  return self->_callTypes.list;
}

- (void)clearCallTypes
{
  PBRepeatedInt32Clear();
}

- (void)addCallTypes:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)callTypesCount
{
  return self->_callTypes.count;
}

- (int)callTypesAtIndex:(unint64_t)a3
{
  return self->_callTypes.list[a3];
}

- (id)callTypesAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 2;
  if ((a3 - 2) < 9 && ((0x1EFu >> v3) & 1) != 0)
  {
    v4 = off_1E2294F88[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsCallTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OUTGOING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MISSED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECEIVED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATEST")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOICEMAIL")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RINGING")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_PROGRESS")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ON_HOLD")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (void)setParticipants:(id)a3
{
  NSArray *v4;
  NSArray *participants;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  participants = self->_participants;
  self->_participants = v4;

}

- (void)clearParticipants
{
  -[NSArray removeAllObjects](self->_participants, "removeAllObjects");
}

- (void)addParticipants:(id)a3
{
  id v4;
  NSArray *participants;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  participants = self->_participants;
  v8 = v4;
  if (!participants)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_participants;
    self->_participants = v6;

    v4 = v8;
    participants = self->_participants;
  }
  -[NSArray addObject:](participants, "addObject:", v4);

}

- (unint64_t)participantsCount
{
  return -[NSArray count](self->_participants, "count");
}

- (id)participantsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_participants, "objectAtIndexedSubscript:", a3);
}

- (void)setPreferredCallProvider:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_preferredCallProvider = a3;
  }
}

- (BOOL)hasPreferredCallProvider
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasPreferredCallProvider:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)preferredCallProviderAsString:(int)a3
{
  if ((a3 - 2) < 3)
    return off_1E2294FD0[a3 - 2];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPreferredCallProvider:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TELEPHONY_PROVIDER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FACETIME_PROVIDER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("THIRD_PARTY_PROVIDER")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCallRecordFilterReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBCallRecordFilter hasCallCapability](self, "hasCallCapability"))
    PBDataWriterWriteInt32Field();
  if (self->_callTypes.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_callTypes.count);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_participants;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (-[_INPBCallRecordFilter hasPreferredCallProvider](self, "hasPreferredCallProvider", v11))
    PBDataWriterWriteInt32Field();

}

- (void)dealloc
{
  objc_super v3;

  -[_INPBCallRecordFilter clearCallTypes](self, "clearCallTypes");
  v3.receiver = self;
  v3.super_class = (Class)_INPBCallRecordFilter;
  -[_INPBCallRecordFilter dealloc](&v3, sel_dealloc);
}

- (_INPBCallRecordFilter)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCallRecordFilter *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCallRecordFilter *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCallRecordFilter *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCallRecordFilter initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBCallRecordFilter data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCallRecordFilter *v5;
  void *v6;

  v5 = -[_INPBCallRecordFilter init](+[_INPBCallRecordFilter allocWithZone:](_INPBCallRecordFilter, "allocWithZone:"), "init");
  if (-[_INPBCallRecordFilter hasCallCapability](self, "hasCallCapability"))
    -[_INPBCallRecordFilter setCallCapability:](v5, "setCallCapability:", -[_INPBCallRecordFilter callCapability](self, "callCapability"));
  PBRepeatedInt32Copy();
  v6 = (void *)-[NSArray copyWithZone:](self->_participants, "copyWithZone:", a3);
  -[_INPBCallRecordFilter setParticipants:](v5, "setParticipants:", v6);

  if (-[_INPBCallRecordFilter hasPreferredCallProvider](self, "hasPreferredCallProvider"))
    -[_INPBCallRecordFilter setPreferredCallProvider:](v5, "setPreferredCallProvider:", -[_INPBCallRecordFilter preferredCallProvider](self, "preferredCallProvider"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int callCapability;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  BOOL v16;
  int preferredCallProvider;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  v5 = -[_INPBCallRecordFilter hasCallCapability](self, "hasCallCapability");
  if (v5 != objc_msgSend(v4, "hasCallCapability"))
    goto LABEL_14;
  if (-[_INPBCallRecordFilter hasCallCapability](self, "hasCallCapability"))
  {
    if (objc_msgSend(v4, "hasCallCapability"))
    {
      callCapability = self->_callCapability;
      if (callCapability != objc_msgSend(v4, "callCapability"))
        goto LABEL_14;
    }
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_14;
  -[_INPBCallRecordFilter participants](self, "participants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "participants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBCallRecordFilter participants](self, "participants");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[_INPBCallRecordFilter participants](self, "participants");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "participants");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
        goto LABEL_14;
    }
    else
    {

    }
    v15 = -[_INPBCallRecordFilter hasPreferredCallProvider](self, "hasPreferredCallProvider");
    if (v15 == objc_msgSend(v4, "hasPreferredCallProvider"))
    {
      if (!-[_INPBCallRecordFilter hasPreferredCallProvider](self, "hasPreferredCallProvider")
        || !objc_msgSend(v4, "hasPreferredCallProvider")
        || (preferredCallProvider = self->_preferredCallProvider,
            preferredCallProvider == objc_msgSend(v4, "preferredCallProvider")))
      {
        v16 = 1;
        goto LABEL_15;
      }
    }
  }
  else
  {

  }
LABEL_14:
  v16 = 0;
LABEL_15:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (-[_INPBCallRecordFilter hasCallCapability](self, "hasCallCapability"))
    v3 = 2654435761 * self->_callCapability;
  else
    v3 = 0;
  v4 = PBRepeatedInt32Hash();
  v5 = -[NSArray hash](self->_participants, "hash");
  if (-[_INPBCallRecordFilter hasPreferredCallProvider](self, "hasPreferredCallProvider"))
    v6 = 2654435761 * self->_preferredCallProvider;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  unint64_t v7;
  unsigned int v8;
  __CFString *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBCallRecordFilter hasCallCapability](self, "hasCallCapability"))
  {
    v4 = -[_INPBCallRecordFilter callCapability](self, "callCapability");
    if ((_DWORD)v4 == 1)
    {
      v5 = CFSTR("AUDIO_CALL");
    }
    else if ((_DWORD)v4 == 2)
    {
      v5 = CFSTR("VIDEO_CALL");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("callCapability"));

  }
  if (self->_callTypes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBCallRecordFilter callTypesCount](self, "callTypesCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBCallRecordFilter callTypesCount](self, "callTypesCount"))
    {
      v7 = 0;
      do
      {
        v8 = self->_callTypes.list[v7] - 2;
        if (v8 < 9 && ((0x1EFu >> v8) & 1) != 0)
        {
          v9 = off_1E2294F88[v8];
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_callTypes.list[v7]);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v6, "addObject:", v9);

        ++v7;
      }
      while (v7 < -[_INPBCallRecordFilter callTypesCount](self, "callTypesCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("callTypes"));

  }
  if (-[NSArray count](self->_participants, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = self->_participants;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("participants"));
  }
  if (-[_INPBCallRecordFilter hasPreferredCallProvider](self, "hasPreferredCallProvider"))
  {
    v17 = -[_INPBCallRecordFilter preferredCallProvider](self, "preferredCallProvider");
    if ((v17 - 2) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E2294FD0[(v17 - 2)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("preferredCallProvider"));

  }
  return v3;
}

- (int)callCapability
{
  return self->_callCapability;
}

- (NSArray)participants
{
  return self->_participants;
}

- (int)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participants, 0);
}

+ (Class)participantsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
