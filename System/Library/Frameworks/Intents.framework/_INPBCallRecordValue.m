@implementation _INPBCallRecordValue

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

- (void)setCallMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_callMetrics, a3);
}

- (BOOL)hasCallMetrics
{
  return self->_callMetrics != 0;
}

- (void)setCallType:(int)a3
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
    self->_callType = a3;
  }
}

- (BOOL)hasCallType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCallType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)callTypeAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 2;
  if ((a3 - 2) < 9 && ((0x1EFu >> v3) & 1) != 0)
  {
    v4 = off_1E22909A0[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsCallType:(id)a3
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

- (void)setCaller:(id)a3
{
  objc_storeStrong((id *)&self->_caller, a3);
}

- (BOOL)hasCaller
{
  return self->_caller != 0;
}

- (void)setDateCreated:(id)a3
{
  objc_storeStrong((id *)&self->_dateCreated, a3);
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setIsCallerIdBlocked:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isCallerIdBlocked = a3;
}

- (BOOL)hasIsCallerIdBlocked
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsCallerIdBlocked:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setNumberOfCalls:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfCalls, a3);
}

- (BOOL)hasNumberOfCalls
{
  return self->_numberOfCalls != 0;
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
    *(_BYTE *)&self->_has = has & 0xF7;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 8;
    self->_preferredCallProvider = a3;
  }
}

- (BOOL)hasPreferredCallProvider
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasPreferredCallProvider:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (id)preferredCallProviderAsString:(int)a3
{
  if ((a3 - 2) < 3)
    return off_1E22909E8[a3 - 2];
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

- (void)setProviderBundleId:(id)a3
{
  NSString *v4;
  NSString *providerBundleId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  providerBundleId = self->_providerBundleId;
  self->_providerBundleId = v4;

}

- (BOOL)hasProviderBundleId
{
  return self->_providerBundleId != 0;
}

- (void)setProviderId:(id)a3
{
  NSString *v4;
  NSString *providerId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  providerId = self->_providerId;
  self->_providerId = v4;

}

- (BOOL)hasProviderId
{
  return self->_providerId != 0;
}

- (void)setUnseen:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_unseen = a3;
}

- (BOOL)hasUnseen
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasUnseen:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCallRecordValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBCallRecordValue hasCallCapability](self, "hasCallCapability"))
    PBDataWriterWriteInt32Field();
  -[_INPBCallRecordValue callMetrics](self, "callMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBCallRecordValue callMetrics](self, "callMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBCallRecordValue hasCallType](self, "hasCallType"))
    PBDataWriterWriteInt32Field();
  -[_INPBCallRecordValue caller](self, "caller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBCallRecordValue caller](self, "caller");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBCallRecordValue dateCreated](self, "dateCreated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBCallRecordValue dateCreated](self, "dateCreated");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBCallRecordValue identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  if (-[_INPBCallRecordValue hasIsCallerIdBlocked](self, "hasIsCallerIdBlocked"))
    PBDataWriterWriteBOOLField();
  -[_INPBCallRecordValue numberOfCalls](self, "numberOfCalls");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBCallRecordValue numberOfCalls](self, "numberOfCalls");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_participants;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  if (-[_INPBCallRecordValue hasPreferredCallProvider](self, "hasPreferredCallProvider", v21))
    PBDataWriterWriteInt32Field();
  -[_INPBCallRecordValue providerBundleId](self, "providerBundleId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    PBDataWriterWriteStringField();
  -[_INPBCallRecordValue providerId](self, "providerId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    PBDataWriterWriteStringField();
  if (-[_INPBCallRecordValue hasUnseen](self, "hasUnseen"))
    PBDataWriterWriteBOOLField();

}

- (_INPBCallRecordValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCallRecordValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCallRecordValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCallRecordValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCallRecordValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBCallRecordValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCallRecordValue *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = -[_INPBCallRecordValue init](+[_INPBCallRecordValue allocWithZone:](_INPBCallRecordValue, "allocWithZone:"), "init");
  if (-[_INPBCallRecordValue hasCallCapability](self, "hasCallCapability"))
    -[_INPBCallRecordValue setCallCapability:](v5, "setCallCapability:", -[_INPBCallRecordValue callCapability](self, "callCapability"));
  v6 = -[_INPBCallMetrics copyWithZone:](self->_callMetrics, "copyWithZone:", a3);
  -[_INPBCallRecordValue setCallMetrics:](v5, "setCallMetrics:", v6);

  if (-[_INPBCallRecordValue hasCallType](self, "hasCallType"))
    -[_INPBCallRecordValue setCallType:](v5, "setCallType:", -[_INPBCallRecordValue callType](self, "callType"));
  v7 = -[_INPBContactValue copyWithZone:](self->_caller, "copyWithZone:", a3);
  -[_INPBCallRecordValue setCaller:](v5, "setCaller:", v7);

  v8 = -[_INPBDateTime copyWithZone:](self->_dateCreated, "copyWithZone:", a3);
  -[_INPBCallRecordValue setDateCreated:](v5, "setDateCreated:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  -[_INPBCallRecordValue setIdentifier:](v5, "setIdentifier:", v9);

  if (-[_INPBCallRecordValue hasIsCallerIdBlocked](self, "hasIsCallerIdBlocked"))
    -[_INPBCallRecordValue setIsCallerIdBlocked:](v5, "setIsCallerIdBlocked:", -[_INPBCallRecordValue isCallerIdBlocked](self, "isCallerIdBlocked"));
  v10 = -[_INPBInteger copyWithZone:](self->_numberOfCalls, "copyWithZone:", a3);
  -[_INPBCallRecordValue setNumberOfCalls:](v5, "setNumberOfCalls:", v10);

  v11 = (void *)-[NSArray copyWithZone:](self->_participants, "copyWithZone:", a3);
  -[_INPBCallRecordValue setParticipants:](v5, "setParticipants:", v11);

  if (-[_INPBCallRecordValue hasPreferredCallProvider](self, "hasPreferredCallProvider"))
    -[_INPBCallRecordValue setPreferredCallProvider:](v5, "setPreferredCallProvider:", -[_INPBCallRecordValue preferredCallProvider](self, "preferredCallProvider"));
  v12 = (void *)-[NSString copyWithZone:](self->_providerBundleId, "copyWithZone:", a3);
  -[_INPBCallRecordValue setProviderBundleId:](v5, "setProviderBundleId:", v12);

  v13 = (void *)-[NSString copyWithZone:](self->_providerId, "copyWithZone:", a3);
  -[_INPBCallRecordValue setProviderId:](v5, "setProviderId:", v13);

  if (-[_INPBCallRecordValue hasUnseen](self, "hasUnseen"))
    -[_INPBCallRecordValue setUnseen:](v5, "setUnseen:", -[_INPBCallRecordValue unseen](self, "unseen"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int callCapability;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int callType;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  int isCallerIdBlocked;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  int preferredCallProvider;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  BOOL v55;
  int v57;
  int unseen;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_58;
  v5 = -[_INPBCallRecordValue hasCallCapability](self, "hasCallCapability");
  if (v5 != objc_msgSend(v4, "hasCallCapability"))
    goto LABEL_58;
  if (-[_INPBCallRecordValue hasCallCapability](self, "hasCallCapability"))
  {
    if (objc_msgSend(v4, "hasCallCapability"))
    {
      callCapability = self->_callCapability;
      if (callCapability != objc_msgSend(v4, "callCapability"))
        goto LABEL_58;
    }
  }
  -[_INPBCallRecordValue callMetrics](self, "callMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_57;
  -[_INPBCallRecordValue callMetrics](self, "callMetrics");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBCallRecordValue callMetrics](self, "callMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callMetrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_58;
  }
  else
  {

  }
  v14 = -[_INPBCallRecordValue hasCallType](self, "hasCallType");
  if (v14 != objc_msgSend(v4, "hasCallType"))
    goto LABEL_58;
  if (-[_INPBCallRecordValue hasCallType](self, "hasCallType"))
  {
    if (objc_msgSend(v4, "hasCallType"))
    {
      callType = self->_callType;
      if (callType != objc_msgSend(v4, "callType"))
        goto LABEL_58;
    }
  }
  -[_INPBCallRecordValue caller](self, "caller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "caller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_57;
  -[_INPBCallRecordValue caller](self, "caller");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[_INPBCallRecordValue caller](self, "caller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "caller");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (!v20)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBCallRecordValue dateCreated](self, "dateCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateCreated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_57;
  -[_INPBCallRecordValue dateCreated](self, "dateCreated");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[_INPBCallRecordValue dateCreated](self, "dateCreated");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateCreated");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBCallRecordValue identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_57;
  -[_INPBCallRecordValue identifier](self, "identifier");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[_INPBCallRecordValue identifier](self, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_58;
  }
  else
  {

  }
  v31 = -[_INPBCallRecordValue hasIsCallerIdBlocked](self, "hasIsCallerIdBlocked");
  if (v31 != objc_msgSend(v4, "hasIsCallerIdBlocked"))
    goto LABEL_58;
  if (-[_INPBCallRecordValue hasIsCallerIdBlocked](self, "hasIsCallerIdBlocked"))
  {
    if (objc_msgSend(v4, "hasIsCallerIdBlocked"))
    {
      isCallerIdBlocked = self->_isCallerIdBlocked;
      if (isCallerIdBlocked != objc_msgSend(v4, "isCallerIdBlocked"))
        goto LABEL_58;
    }
  }
  -[_INPBCallRecordValue numberOfCalls](self, "numberOfCalls");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberOfCalls");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_57;
  -[_INPBCallRecordValue numberOfCalls](self, "numberOfCalls");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[_INPBCallRecordValue numberOfCalls](self, "numberOfCalls");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberOfCalls");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBCallRecordValue participants](self, "participants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "participants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_57;
  -[_INPBCallRecordValue participants](self, "participants");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[_INPBCallRecordValue participants](self, "participants");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "participants");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_58;
  }
  else
  {

  }
  v43 = -[_INPBCallRecordValue hasPreferredCallProvider](self, "hasPreferredCallProvider");
  if (v43 != objc_msgSend(v4, "hasPreferredCallProvider"))
    goto LABEL_58;
  if (-[_INPBCallRecordValue hasPreferredCallProvider](self, "hasPreferredCallProvider"))
  {
    if (objc_msgSend(v4, "hasPreferredCallProvider"))
    {
      preferredCallProvider = self->_preferredCallProvider;
      if (preferredCallProvider != objc_msgSend(v4, "preferredCallProvider"))
        goto LABEL_58;
    }
  }
  -[_INPBCallRecordValue providerBundleId](self, "providerBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "providerBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_57;
  -[_INPBCallRecordValue providerBundleId](self, "providerBundleId");
  v45 = objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v46 = (void *)v45;
    -[_INPBCallRecordValue providerBundleId](self, "providerBundleId");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "providerBundleId");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v47, "isEqual:", v48);

    if (!v49)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBCallRecordValue providerId](self, "providerId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "providerId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
  {
LABEL_57:

    goto LABEL_58;
  }
  -[_INPBCallRecordValue providerId](self, "providerId");
  v50 = objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    v51 = (void *)v50;
    -[_INPBCallRecordValue providerId](self, "providerId");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "providerId");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v52, "isEqual:", v53);

    if (!v54)
      goto LABEL_58;
  }
  else
  {

  }
  v57 = -[_INPBCallRecordValue hasUnseen](self, "hasUnseen");
  if (v57 == objc_msgSend(v4, "hasUnseen"))
  {
    if (!-[_INPBCallRecordValue hasUnseen](self, "hasUnseen")
      || !objc_msgSend(v4, "hasUnseen")
      || (unseen = self->_unseen, unseen == objc_msgSend(v4, "unseen")))
    {
      v55 = 1;
      goto LABEL_59;
    }
  }
LABEL_58:
  v55 = 0;
LABEL_59:

  return v55;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  if (-[_INPBCallRecordValue hasCallCapability](self, "hasCallCapability"))
    v16 = 2654435761 * self->_callCapability;
  else
    v16 = 0;
  v15 = -[_INPBCallMetrics hash](self->_callMetrics, "hash");
  if (-[_INPBCallRecordValue hasCallType](self, "hasCallType"))
    v14 = 2654435761 * self->_callType;
  else
    v14 = 0;
  v13 = -[_INPBContactValue hash](self->_caller, "hash");
  v3 = -[_INPBDateTime hash](self->_dateCreated, "hash");
  v4 = -[NSString hash](self->_identifier, "hash");
  if (-[_INPBCallRecordValue hasIsCallerIdBlocked](self, "hasIsCallerIdBlocked"))
    v5 = 2654435761 * self->_isCallerIdBlocked;
  else
    v5 = 0;
  v6 = -[_INPBInteger hash](self->_numberOfCalls, "hash");
  v7 = -[NSArray hash](self->_participants, "hash");
  if (-[_INPBCallRecordValue hasPreferredCallProvider](self, "hasPreferredCallProvider"))
    v8 = 2654435761 * self->_preferredCallProvider;
  else
    v8 = 0;
  v9 = -[NSString hash](self->_providerBundleId, "hash");
  v10 = -[NSString hash](self->_providerId, "hash");
  if (-[_INPBCallRecordValue hasUnseen](self, "hasUnseen"))
    v11 = 2654435761 * self->_unseen;
  else
    v11 = 0;
  return v15 ^ v16 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBCallRecordValue hasCallCapability](self, "hasCallCapability"))
  {
    v4 = -[_INPBCallRecordValue callCapability](self, "callCapability");
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
  -[_INPBCallRecordValue callMetrics](self, "callMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("callMetrics"));

  if (-[_INPBCallRecordValue hasCallType](self, "hasCallType"))
  {
    v8 = -[_INPBCallRecordValue callType](self, "callType");
    v9 = v8 - 2;
    if ((v8 - 2) < 9 && ((0x1EFu >> v9) & 1) != 0)
    {
      v10 = off_1E22909A0[v9];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("callType"));

  }
  -[_INPBCallRecordValue caller](self, "caller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("caller"));

  -[_INPBCallRecordValue dateCreated](self, "dateCreated");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("dateCreated"));

  if (self->_identifier)
  {
    -[_INPBCallRecordValue identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("identifier"));

  }
  if (-[_INPBCallRecordValue hasIsCallerIdBlocked](self, "hasIsCallerIdBlocked"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBCallRecordValue isCallerIdBlocked](self, "isCallerIdBlocked"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isCallerIdBlocked"));

  }
  -[_INPBCallRecordValue numberOfCalls](self, "numberOfCalls");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("numberOfCalls"));

  if (-[NSArray count](self->_participants, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v21 = self->_participants;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v36 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("participants"));
  }
  if (-[_INPBCallRecordValue hasPreferredCallProvider](self, "hasPreferredCallProvider"))
  {
    v27 = -[_INPBCallRecordValue preferredCallProvider](self, "preferredCallProvider");
    if ((v27 - 2) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v27);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_1E22909E8[(v27 - 2)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("preferredCallProvider"));

  }
  if (self->_providerBundleId)
  {
    -[_INPBCallRecordValue providerBundleId](self, "providerBundleId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("providerBundleId"));

  }
  if (self->_providerId)
  {
    -[_INPBCallRecordValue providerId](self, "providerId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("providerId"));

  }
  if (-[_INPBCallRecordValue hasUnseen](self, "hasUnseen"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBCallRecordValue unseen](self, "unseen"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("unseen"));

  }
  return v3;
}

- (int)callCapability
{
  return self->_callCapability;
}

- (_INPBCallMetrics)callMetrics
{
  return self->_callMetrics;
}

- (int)callType
{
  return self->_callType;
}

- (_INPBContactValue)caller
{
  return self->_caller;
}

- (_INPBDateTime)dateCreated
{
  return self->_dateCreated;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isCallerIdBlocked
{
  return self->_isCallerIdBlocked;
}

- (_INPBInteger)numberOfCalls
{
  return self->_numberOfCalls;
}

- (NSArray)participants
{
  return self->_participants;
}

- (int)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (NSString)providerBundleId
{
  return self->_providerBundleId;
}

- (NSString)providerId
{
  return self->_providerId;
}

- (BOOL)unseen
{
  return self->_unseen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerId, 0);
  objc_storeStrong((id *)&self->_providerBundleId, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_numberOfCalls, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_callMetrics, 0);
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
