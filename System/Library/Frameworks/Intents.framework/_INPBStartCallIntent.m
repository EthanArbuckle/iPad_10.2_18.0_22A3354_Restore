@implementation _INPBStartCallIntent

- (void)setAudioRoute:(int)a3
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
    self->_audioRoute = a3;
  }
}

- (BOOL)hasAudioRoute
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAudioRoute:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)audioRouteAsString:(int)a3
{
  if ((a3 - 2) < 3)
    return off_1E2293930[a3 - 2];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAudioRoute:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPEAKERPHONE_AUDIO_ROUTE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BLUETOOTH_AUDIO_ROUTE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HEY_SIRI_AUDIO_ROUTE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (void)setCallCapability:(int)a3
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
    self->_callCapability = a3;
  }
}

- (BOOL)hasCallCapability
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCallCapability:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
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

- (void)setCallGroups:(id)a3
{
  NSArray *v4;
  NSArray *callGroups;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  callGroups = self->_callGroups;
  self->_callGroups = v4;

}

- (void)clearCallGroups
{
  -[NSArray removeAllObjects](self->_callGroups, "removeAllObjects");
}

- (void)addCallGroups:(id)a3
{
  id v4;
  NSArray *callGroups;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  callGroups = self->_callGroups;
  v8 = v4;
  if (!callGroups)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_callGroups;
    self->_callGroups = v6;

    v4 = v8;
    callGroups = self->_callGroups;
  }
  -[NSArray addObject:](callGroups, "addObject:", v4);

}

- (unint64_t)callGroupsCount
{
  return -[NSArray count](self->_callGroups, "count");
}

- (id)callGroupsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_callGroups, "objectAtIndexedSubscript:", a3);
}

- (void)setCallRecordFilter:(id)a3
{
  objc_storeStrong((id *)&self->_callRecordFilter, a3);
}

- (BOOL)hasCallRecordFilter
{
  return self->_callRecordFilter != 0;
}

- (void)setCallRecordToCallBack:(id)a3
{
  objc_storeStrong((id *)&self->_callRecordToCallBack, a3);
}

- (BOOL)hasCallRecordToCallBack
{
  return self->_callRecordToCallBack != 0;
}

- (void)setCallRequestMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_callRequestMetadata, a3);
}

- (BOOL)hasCallRequestMetadata
{
  return self->_callRequestMetadata != 0;
}

- (void)setContacts:(id)a3
{
  NSArray *v4;
  NSArray *contacts;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  contacts = self->_contacts;
  self->_contacts = v4;

}

- (void)clearContacts
{
  -[NSArray removeAllObjects](self->_contacts, "removeAllObjects");
}

- (void)addContacts:(id)a3
{
  id v4;
  NSArray *contacts;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  contacts = self->_contacts;
  v8 = v4;
  if (!contacts)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_contacts;
    self->_contacts = v6;

    v4 = v8;
    contacts = self->_contacts;
  }
  -[NSArray addObject:](contacts, "addObject:", v4);

}

- (unint64_t)contactsCount
{
  return -[NSArray count](self->_contacts, "count");
}

- (id)contactsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_contacts, "objectAtIndexedSubscript:", a3);
}

- (void)setDestinationType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFB;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 4;
    self->_destinationType = a3;
  }
}

- (BOOL)hasDestinationType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasDestinationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)destinationTypeAsString:(int)a3
{
  if ((a3 - 1) < 5)
    return off_1E2293948[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDestinationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NORMAL_DESTINATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMERGENCY_DESTINATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOICEMAIL_DESTINATION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REDIAL_DESTINATION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CALL_BACK_DESTINATION")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setFaceTimeLink:(id)a3
{
  NSString *v4;
  NSString *faceTimeLink;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  faceTimeLink = self->_faceTimeLink;
  self->_faceTimeLink = v4;

}

- (BOOL)hasFaceTimeLink
{
  return self->_faceTimeLink != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIsGroupCall:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isGroupCall = a3;
}

- (BOOL)hasIsGroupCall
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsGroupCall:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)setNotificationThreadIdentifier:(id)a3
{
  NSString *v4;
  NSString *notificationThreadIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  notificationThreadIdentifier = self->_notificationThreadIdentifier;
  self->_notificationThreadIdentifier = v4;

}

- (BOOL)hasNotificationThreadIdentifier
{
  return self->_notificationThreadIdentifier != 0;
}

- (void)setPreferredCallProvider:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xEF;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 0x10;
    self->_preferredCallProvider = a3;
  }
}

- (BOOL)hasPreferredCallProvider
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasPreferredCallProvider:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (id)preferredCallProviderAsString:(int)a3
{
  if ((a3 - 2) < 3)
    return off_1E2293970[a3 - 2];
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

- (void)setRecordTypeForRedialing:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xDF;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 0x20;
    self->_recordTypeForRedialing = a3;
  }
}

- (BOOL)hasRecordTypeForRedialing
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasRecordTypeForRedialing:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (id)recordTypeForRedialingAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 2;
  if ((a3 - 2) < 9 && ((0x1EFu >> v3) & 1) != 0)
  {
    v4 = off_1E2293988[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsRecordTypeForRedialing:(id)a3
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

- (void)setTtyType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xBF;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 0x40;
    self->_ttyType = a3;
  }
}

- (BOOL)hasTtyType
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasTtyType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (id)ttyTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E22939D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTTYType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Direct")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Relay")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBStartCallIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBStartCallIntent hasAudioRoute](self, "hasAudioRoute"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBStartCallIntent hasCallCapability](self, "hasCallCapability"))
    PBDataWriterWriteInt32Field();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = self->_callGroups;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v7);
  }

  -[_INPBStartCallIntent callRecordFilter](self, "callRecordFilter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBStartCallIntent callRecordFilter](self, "callRecordFilter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBStartCallIntent callRecordToCallBack](self, "callRecordToCallBack");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBStartCallIntent callRecordToCallBack](self, "callRecordToCallBack");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBStartCallIntent callRequestMetadata](self, "callRequestMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBStartCallIntent callRequestMetadata](self, "callRequestMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = self->_contacts;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v18);
  }

  if (-[_INPBStartCallIntent hasDestinationType](self, "hasDestinationType", v25))
    PBDataWriterWriteInt32Field();
  -[_INPBStartCallIntent faceTimeLink](self, "faceTimeLink");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    PBDataWriterWriteStringField();
  -[_INPBStartCallIntent intentMetadata](self, "intentMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[_INPBStartCallIntent intentMetadata](self, "intentMetadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBStartCallIntent hasIsGroupCall](self, "hasIsGroupCall"))
    PBDataWriterWriteBOOLField();
  -[_INPBStartCallIntent notificationThreadIdentifier](self, "notificationThreadIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    PBDataWriterWriteStringField();
  if (-[_INPBStartCallIntent hasPreferredCallProvider](self, "hasPreferredCallProvider"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBStartCallIntent hasRecordTypeForRedialing](self, "hasRecordTypeForRedialing"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBStartCallIntent hasTtyType](self, "hasTtyType"))
    PBDataWriterWriteInt32Field();

}

- (_INPBStartCallIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBStartCallIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBStartCallIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBStartCallIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBStartCallIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBStartCallIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBStartCallIntent *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v5 = -[_INPBStartCallIntent init](+[_INPBStartCallIntent allocWithZone:](_INPBStartCallIntent, "allocWithZone:"), "init");
  if (-[_INPBStartCallIntent hasAudioRoute](self, "hasAudioRoute"))
    -[_INPBStartCallIntent setAudioRoute:](v5, "setAudioRoute:", -[_INPBStartCallIntent audioRoute](self, "audioRoute"));
  if (-[_INPBStartCallIntent hasCallCapability](self, "hasCallCapability"))
    -[_INPBStartCallIntent setCallCapability:](v5, "setCallCapability:", -[_INPBStartCallIntent callCapability](self, "callCapability"));
  v6 = (void *)-[NSArray copyWithZone:](self->_callGroups, "copyWithZone:", a3);
  -[_INPBStartCallIntent setCallGroups:](v5, "setCallGroups:", v6);

  v7 = -[_INPBCallRecordFilter copyWithZone:](self->_callRecordFilter, "copyWithZone:", a3);
  -[_INPBStartCallIntent setCallRecordFilter:](v5, "setCallRecordFilter:", v7);

  v8 = -[_INPBCallRecordValue copyWithZone:](self->_callRecordToCallBack, "copyWithZone:", a3);
  -[_INPBStartCallIntent setCallRecordToCallBack:](v5, "setCallRecordToCallBack:", v8);

  v9 = -[_INPBStartCallRequestMetadata copyWithZone:](self->_callRequestMetadata, "copyWithZone:", a3);
  -[_INPBStartCallIntent setCallRequestMetadata:](v5, "setCallRequestMetadata:", v9);

  v10 = (void *)-[NSArray copyWithZone:](self->_contacts, "copyWithZone:", a3);
  -[_INPBStartCallIntent setContacts:](v5, "setContacts:", v10);

  if (-[_INPBStartCallIntent hasDestinationType](self, "hasDestinationType"))
    -[_INPBStartCallIntent setDestinationType:](v5, "setDestinationType:", -[_INPBStartCallIntent destinationType](self, "destinationType"));
  v11 = (void *)-[NSString copyWithZone:](self->_faceTimeLink, "copyWithZone:", a3);
  -[_INPBStartCallIntent setFaceTimeLink:](v5, "setFaceTimeLink:", v11);

  v12 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBStartCallIntent setIntentMetadata:](v5, "setIntentMetadata:", v12);

  if (-[_INPBStartCallIntent hasIsGroupCall](self, "hasIsGroupCall"))
    -[_INPBStartCallIntent setIsGroupCall:](v5, "setIsGroupCall:", -[_INPBStartCallIntent isGroupCall](self, "isGroupCall"));
  v13 = (void *)-[NSString copyWithZone:](self->_notificationThreadIdentifier, "copyWithZone:", a3);
  -[_INPBStartCallIntent setNotificationThreadIdentifier:](v5, "setNotificationThreadIdentifier:", v13);

  if (-[_INPBStartCallIntent hasPreferredCallProvider](self, "hasPreferredCallProvider"))
    -[_INPBStartCallIntent setPreferredCallProvider:](v5, "setPreferredCallProvider:", -[_INPBStartCallIntent preferredCallProvider](self, "preferredCallProvider"));
  if (-[_INPBStartCallIntent hasRecordTypeForRedialing](self, "hasRecordTypeForRedialing"))
    -[_INPBStartCallIntent setRecordTypeForRedialing:](v5, "setRecordTypeForRedialing:", -[_INPBStartCallIntent recordTypeForRedialing](self, "recordTypeForRedialing"));
  if (-[_INPBStartCallIntent hasTtyType](self, "hasTtyType"))
    -[_INPBStartCallIntent setTtyType:](v5, "setTtyType:", -[_INPBStartCallIntent ttyType](self, "ttyType"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int audioRoute;
  int v7;
  int callCapability;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
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
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  int destinationType;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  int v48;
  int isGroupCall;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  BOOL v55;
  int v57;
  int preferredCallProvider;
  int v59;
  int recordTypeForRedialing;
  int v61;
  int ttyType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_58;
  v5 = -[_INPBStartCallIntent hasAudioRoute](self, "hasAudioRoute");
  if (v5 != objc_msgSend(v4, "hasAudioRoute"))
    goto LABEL_58;
  if (-[_INPBStartCallIntent hasAudioRoute](self, "hasAudioRoute"))
  {
    if (objc_msgSend(v4, "hasAudioRoute"))
    {
      audioRoute = self->_audioRoute;
      if (audioRoute != objc_msgSend(v4, "audioRoute"))
        goto LABEL_58;
    }
  }
  v7 = -[_INPBStartCallIntent hasCallCapability](self, "hasCallCapability");
  if (v7 != objc_msgSend(v4, "hasCallCapability"))
    goto LABEL_58;
  if (-[_INPBStartCallIntent hasCallCapability](self, "hasCallCapability"))
  {
    if (objc_msgSend(v4, "hasCallCapability"))
    {
      callCapability = self->_callCapability;
      if (callCapability != objc_msgSend(v4, "callCapability"))
        goto LABEL_58;
    }
  }
  -[_INPBStartCallIntent callGroups](self, "callGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callGroups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_57;
  -[_INPBStartCallIntent callGroups](self, "callGroups");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[_INPBStartCallIntent callGroups](self, "callGroups");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callGroups");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if (!v15)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBStartCallIntent callRecordFilter](self, "callRecordFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callRecordFilter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_57;
  -[_INPBStartCallIntent callRecordFilter](self, "callRecordFilter");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[_INPBStartCallIntent callRecordFilter](self, "callRecordFilter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callRecordFilter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (!v20)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBStartCallIntent callRecordToCallBack](self, "callRecordToCallBack");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callRecordToCallBack");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_57;
  -[_INPBStartCallIntent callRecordToCallBack](self, "callRecordToCallBack");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[_INPBStartCallIntent callRecordToCallBack](self, "callRecordToCallBack");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callRecordToCallBack");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBStartCallIntent callRequestMetadata](self, "callRequestMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callRequestMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_57;
  -[_INPBStartCallIntent callRequestMetadata](self, "callRequestMetadata");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[_INPBStartCallIntent callRequestMetadata](self, "callRequestMetadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callRequestMetadata");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBStartCallIntent contacts](self, "contacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contacts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_57;
  -[_INPBStartCallIntent contacts](self, "contacts");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_INPBStartCallIntent contacts](self, "contacts");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contacts");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_58;
  }
  else
  {

  }
  v36 = -[_INPBStartCallIntent hasDestinationType](self, "hasDestinationType");
  if (v36 != objc_msgSend(v4, "hasDestinationType"))
    goto LABEL_58;
  if (-[_INPBStartCallIntent hasDestinationType](self, "hasDestinationType"))
  {
    if (objc_msgSend(v4, "hasDestinationType"))
    {
      destinationType = self->_destinationType;
      if (destinationType != objc_msgSend(v4, "destinationType"))
        goto LABEL_58;
    }
  }
  -[_INPBStartCallIntent faceTimeLink](self, "faceTimeLink");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "faceTimeLink");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_57;
  -[_INPBStartCallIntent faceTimeLink](self, "faceTimeLink");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[_INPBStartCallIntent faceTimeLink](self, "faceTimeLink");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "faceTimeLink");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_58;
  }
  else
  {

  }
  -[_INPBStartCallIntent intentMetadata](self, "intentMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_57;
  -[_INPBStartCallIntent intentMetadata](self, "intentMetadata");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[_INPBStartCallIntent intentMetadata](self, "intentMetadata");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_58;
  }
  else
  {

  }
  v48 = -[_INPBStartCallIntent hasIsGroupCall](self, "hasIsGroupCall");
  if (v48 != objc_msgSend(v4, "hasIsGroupCall"))
    goto LABEL_58;
  if (-[_INPBStartCallIntent hasIsGroupCall](self, "hasIsGroupCall"))
  {
    if (objc_msgSend(v4, "hasIsGroupCall"))
    {
      isGroupCall = self->_isGroupCall;
      if (isGroupCall != objc_msgSend(v4, "isGroupCall"))
        goto LABEL_58;
    }
  }
  -[_INPBStartCallIntent notificationThreadIdentifier](self, "notificationThreadIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationThreadIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
  {
LABEL_57:

    goto LABEL_58;
  }
  -[_INPBStartCallIntent notificationThreadIdentifier](self, "notificationThreadIdentifier");
  v50 = objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    v51 = (void *)v50;
    -[_INPBStartCallIntent notificationThreadIdentifier](self, "notificationThreadIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationThreadIdentifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v52, "isEqual:", v53);

    if (!v54)
      goto LABEL_58;
  }
  else
  {

  }
  v57 = -[_INPBStartCallIntent hasPreferredCallProvider](self, "hasPreferredCallProvider");
  if (v57 == objc_msgSend(v4, "hasPreferredCallProvider"))
  {
    if (!-[_INPBStartCallIntent hasPreferredCallProvider](self, "hasPreferredCallProvider")
      || !objc_msgSend(v4, "hasPreferredCallProvider")
      || (preferredCallProvider = self->_preferredCallProvider,
          preferredCallProvider == objc_msgSend(v4, "preferredCallProvider")))
    {
      v59 = -[_INPBStartCallIntent hasRecordTypeForRedialing](self, "hasRecordTypeForRedialing");
      if (v59 == objc_msgSend(v4, "hasRecordTypeForRedialing"))
      {
        if (!-[_INPBStartCallIntent hasRecordTypeForRedialing](self, "hasRecordTypeForRedialing")
          || !objc_msgSend(v4, "hasRecordTypeForRedialing")
          || (recordTypeForRedialing = self->_recordTypeForRedialing,
              recordTypeForRedialing == objc_msgSend(v4, "recordTypeForRedialing")))
        {
          v61 = -[_INPBStartCallIntent hasTtyType](self, "hasTtyType");
          if (v61 == objc_msgSend(v4, "hasTtyType"))
          {
            if (!-[_INPBStartCallIntent hasTtyType](self, "hasTtyType")
              || !objc_msgSend(v4, "hasTtyType")
              || (ttyType = self->_ttyType, ttyType == objc_msgSend(v4, "ttyType")))
            {
              v55 = 1;
              goto LABEL_59;
            }
          }
        }
      }
    }
  }
LABEL_58:
  v55 = 0;
LABEL_59:

  return v55;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (-[_INPBStartCallIntent hasAudioRoute](self, "hasAudioRoute"))
    v18 = 2654435761 * self->_audioRoute;
  else
    v18 = 0;
  if (-[_INPBStartCallIntent hasCallCapability](self, "hasCallCapability"))
    v17 = 2654435761 * self->_callCapability;
  else
    v17 = 0;
  v16 = -[NSArray hash](self->_callGroups, "hash");
  v15 = -[_INPBCallRecordFilter hash](self->_callRecordFilter, "hash");
  v14 = -[_INPBCallRecordValue hash](self->_callRecordToCallBack, "hash");
  v13 = -[_INPBStartCallRequestMetadata hash](self->_callRequestMetadata, "hash");
  v3 = -[NSArray hash](self->_contacts, "hash");
  if (-[_INPBStartCallIntent hasDestinationType](self, "hasDestinationType"))
    v4 = 2654435761 * self->_destinationType;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_faceTimeLink, "hash");
  v6 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBStartCallIntent hasIsGroupCall](self, "hasIsGroupCall"))
    v7 = 2654435761 * self->_isGroupCall;
  else
    v7 = 0;
  v8 = -[NSString hash](self->_notificationThreadIdentifier, "hash");
  if (-[_INPBStartCallIntent hasPreferredCallProvider](self, "hasPreferredCallProvider"))
    v9 = 2654435761 * self->_preferredCallProvider;
  else
    v9 = 0;
  if (-[_INPBStartCallIntent hasRecordTypeForRedialing](self, "hasRecordTypeForRedialing"))
    v10 = 2654435761 * self->_recordTypeForRedialing;
  else
    v10 = 0;
  if (-[_INPBStartCallIntent hasTtyType](self, "hasTtyType"))
    v11 = 2654435761 * self->_ttyType;
  else
    v11 = 0;
  return v17 ^ v18 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  __CFString *v38;
  uint64_t v39;
  int v40;
  __CFString *v41;
  uint64_t v42;
  __CFString *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBStartCallIntent hasAudioRoute](self, "hasAudioRoute"))
  {
    v4 = -[_INPBStartCallIntent audioRoute](self, "audioRoute");
    if ((v4 - 2) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E2293930[(v4 - 2)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioRoute"));

  }
  if (-[_INPBStartCallIntent hasCallCapability](self, "hasCallCapability"))
  {
    v6 = -[_INPBStartCallIntent callCapability](self, "callCapability");
    if ((_DWORD)v6 == 1)
    {
      v7 = CFSTR("AUDIO_CALL");
    }
    else if ((_DWORD)v6 == 2)
    {
      v7 = CFSTR("VIDEO_CALL");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("callCapability"));

  }
  if (-[NSArray count](self->_callGroups, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v9 = self->_callGroups;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v50 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("callGroups"));
  }
  -[_INPBStartCallIntent callRecordFilter](self, "callRecordFilter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("callRecordFilter"));

  -[_INPBStartCallIntent callRecordToCallBack](self, "callRecordToCallBack");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("callRecordToCallBack"));

  -[_INPBStartCallIntent callRequestMetadata](self, "callRequestMetadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dictionaryRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("callRequestMetadata"));

  if (-[NSArray count](self->_contacts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v22 = self->_contacts;
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v46 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

        }
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("contacts"));
  }
  if (-[_INPBStartCallIntent hasDestinationType](self, "hasDestinationType"))
  {
    v28 = -[_INPBStartCallIntent destinationType](self, "destinationType");
    if ((v28 - 1) >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v28);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E2293948[(v28 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("destinationType"));

  }
  if (self->_faceTimeLink)
  {
    -[_INPBStartCallIntent faceTimeLink](self, "faceTimeLink");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("faceTimeLink"));

  }
  -[_INPBStartCallIntent intentMetadata](self, "intentMetadata");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "dictionaryRepresentation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("intentMetadata"));

  if (-[_INPBStartCallIntent hasIsGroupCall](self, "hasIsGroupCall"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBStartCallIntent isGroupCall](self, "isGroupCall"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("isGroupCall"));

  }
  if (self->_notificationThreadIdentifier)
  {
    -[_INPBStartCallIntent notificationThreadIdentifier](self, "notificationThreadIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v35, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("notificationThreadIdentifier"));

  }
  if (-[_INPBStartCallIntent hasPreferredCallProvider](self, "hasPreferredCallProvider"))
  {
    v37 = -[_INPBStartCallIntent preferredCallProvider](self, "preferredCallProvider");
    if ((v37 - 2) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v37);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = off_1E2293970[(v37 - 2)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("preferredCallProvider"));

  }
  if (-[_INPBStartCallIntent hasRecordTypeForRedialing](self, "hasRecordTypeForRedialing"))
  {
    v39 = -[_INPBStartCallIntent recordTypeForRedialing](self, "recordTypeForRedialing");
    v40 = v39 - 2;
    if ((v39 - 2) < 9 && ((0x1EFu >> v40) & 1) != 0)
    {
      v41 = off_1E2293988[v40];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v39);
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("recordTypeForRedialing"));

  }
  if (-[_INPBStartCallIntent hasTtyType](self, "hasTtyType"))
  {
    v42 = -[_INPBStartCallIntent ttyType](self, "ttyType");
    if (v42 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v42);
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = off_1E22939D0[v42];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("ttyType"));

  }
  return v3;
}

- (int)audioRoute
{
  return self->_audioRoute;
}

- (int)callCapability
{
  return self->_callCapability;
}

- (NSArray)callGroups
{
  return self->_callGroups;
}

- (_INPBCallRecordFilter)callRecordFilter
{
  return self->_callRecordFilter;
}

- (_INPBCallRecordValue)callRecordToCallBack
{
  return self->_callRecordToCallBack;
}

- (_INPBStartCallRequestMetadata)callRequestMetadata
{
  return self->_callRequestMetadata;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (int)destinationType
{
  return self->_destinationType;
}

- (NSString)faceTimeLink
{
  return self->_faceTimeLink;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (BOOL)isGroupCall
{
  return self->_isGroupCall;
}

- (NSString)notificationThreadIdentifier
{
  return self->_notificationThreadIdentifier;
}

- (int)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (int)recordTypeForRedialing
{
  return self->_recordTypeForRedialing;
}

- (int)ttyType
{
  return self->_ttyType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationThreadIdentifier, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_faceTimeLink, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_callRequestMetadata, 0);
  objc_storeStrong((id *)&self->_callRecordToCallBack, 0);
  objc_storeStrong((id *)&self->_callRecordFilter, 0);
  objc_storeStrong((id *)&self->_callGroups, 0);
}

+ (Class)callGroupsType
{
  return (Class)objc_opt_class();
}

+ (Class)contactsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
