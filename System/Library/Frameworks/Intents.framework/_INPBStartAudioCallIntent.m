@implementation _INPBStartAudioCallIntent

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
    return off_1E228FC60[a3 - 2];
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

- (void)addContact:(id)a3
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

- (id)contactAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_contacts, "objectAtIndexedSubscript:", a3);
}

- (void)setDestinationType:(int)a3
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
    self->_destinationType = a3;
  }
}

- (BOOL)hasDestinationType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDestinationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)destinationTypeAsString:(int)a3
{
  if ((a3 - 1) < 5)
    return off_1E228FC78[a3 - 1];
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

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setPreferredCallProvider:(int)a3
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
    self->_preferredCallProvider = a3;
  }
}

- (BOOL)hasPreferredCallProvider
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasPreferredCallProvider:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)preferredCallProviderAsString:(int)a3
{
  if ((a3 - 2) < 3)
    return off_1E228FCA0[a3 - 2];
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
    *(_BYTE *)&self->_has = has & 0xF7;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 8;
    self->_recordTypeForRedialing = a3;
  }
}

- (BOOL)hasRecordTypeForRedialing
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasRecordTypeForRedialing:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (id)recordTypeForRedialingAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 2;
  if ((a3 - 2) < 9 && ((0x1EFu >> v3) & 1) != 0)
  {
    v4 = off_1E228FCB8[v3];
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

- (void)setTargetContacts:(id)a3
{
  NSArray *v4;
  NSArray *targetContacts;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  targetContacts = self->_targetContacts;
  self->_targetContacts = v4;

}

- (void)clearTargetContacts
{
  -[NSArray removeAllObjects](self->_targetContacts, "removeAllObjects");
}

- (void)addTargetContacts:(id)a3
{
  id v4;
  NSArray *targetContacts;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  targetContacts = self->_targetContacts;
  v8 = v4;
  if (!targetContacts)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_targetContacts;
    self->_targetContacts = v6;

    v4 = v8;
    targetContacts = self->_targetContacts;
  }
  -[NSArray addObject:](targetContacts, "addObject:", v4);

}

- (unint64_t)targetContactsCount
{
  return -[NSArray count](self->_targetContacts, "count");
}

- (id)targetContactsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_targetContacts, "objectAtIndexedSubscript:", a3);
}

- (void)setTtyType:(int)a3
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
    self->_ttyType = a3;
  }
}

- (BOOL)hasTtyType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasTtyType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (id)ttyTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E228FD00[a3];
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
  return _INPBStartAudioCallIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBStartAudioCallIntent hasAudioRoute](self, "hasAudioRoute"))
    PBDataWriterWriteInt32Field();
  -[_INPBStartAudioCallIntent callRequestMetadata](self, "callRequestMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBStartAudioCallIntent callRequestMetadata](self, "callRequestMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_contacts;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  if (-[_INPBStartAudioCallIntent hasDestinationType](self, "hasDestinationType"))
    PBDataWriterWriteInt32Field();
  -[_INPBStartAudioCallIntent intentMetadata](self, "intentMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBStartAudioCallIntent intentMetadata](self, "intentMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBStartAudioCallIntent hasPreferredCallProvider](self, "hasPreferredCallProvider"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBStartAudioCallIntent hasRecordTypeForRedialing](self, "hasRecordTypeForRedialing"))
    PBDataWriterWriteInt32Field();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = self->_targetContacts;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

  if (-[_INPBStartAudioCallIntent hasTtyType](self, "hasTtyType", v19))
    PBDataWriterWriteInt32Field();

}

- (_INPBStartAudioCallIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBStartAudioCallIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBStartAudioCallIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBStartAudioCallIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBStartAudioCallIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBStartAudioCallIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBStartAudioCallIntent *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = -[_INPBStartAudioCallIntent init](+[_INPBStartAudioCallIntent allocWithZone:](_INPBStartAudioCallIntent, "allocWithZone:"), "init");
  if (-[_INPBStartAudioCallIntent hasAudioRoute](self, "hasAudioRoute"))
    -[_INPBStartAudioCallIntent setAudioRoute:](v5, "setAudioRoute:", -[_INPBStartAudioCallIntent audioRoute](self, "audioRoute"));
  v6 = -[_INPBStartCallRequestMetadata copyWithZone:](self->_callRequestMetadata, "copyWithZone:", a3);
  -[_INPBStartAudioCallIntent setCallRequestMetadata:](v5, "setCallRequestMetadata:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_contacts, "copyWithZone:", a3);
  -[_INPBStartAudioCallIntent setContacts:](v5, "setContacts:", v7);

  if (-[_INPBStartAudioCallIntent hasDestinationType](self, "hasDestinationType"))
    -[_INPBStartAudioCallIntent setDestinationType:](v5, "setDestinationType:", -[_INPBStartAudioCallIntent destinationType](self, "destinationType"));
  v8 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBStartAudioCallIntent setIntentMetadata:](v5, "setIntentMetadata:", v8);

  if (-[_INPBStartAudioCallIntent hasPreferredCallProvider](self, "hasPreferredCallProvider"))
    -[_INPBStartAudioCallIntent setPreferredCallProvider:](v5, "setPreferredCallProvider:", -[_INPBStartAudioCallIntent preferredCallProvider](self, "preferredCallProvider"));
  if (-[_INPBStartAudioCallIntent hasRecordTypeForRedialing](self, "hasRecordTypeForRedialing"))
    -[_INPBStartAudioCallIntent setRecordTypeForRedialing:](v5, "setRecordTypeForRedialing:", -[_INPBStartAudioCallIntent recordTypeForRedialing](self, "recordTypeForRedialing"));
  v9 = (void *)-[NSArray copyWithZone:](self->_targetContacts, "copyWithZone:", a3);
  -[_INPBStartAudioCallIntent setTargetContacts:](v5, "setTargetContacts:", v9);

  if (-[_INPBStartAudioCallIntent hasTtyType](self, "hasTtyType"))
    -[_INPBStartAudioCallIntent setTtyType:](v5, "setTtyType:", -[_INPBStartAudioCallIntent ttyType](self, "ttyType"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int audioRoute;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int destinationType;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int preferredCallProvider;
  int v28;
  int recordTypeForRedialing;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  BOOL v35;
  int v37;
  int ttyType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  v5 = -[_INPBStartAudioCallIntent hasAudioRoute](self, "hasAudioRoute");
  if (v5 != objc_msgSend(v4, "hasAudioRoute"))
    goto LABEL_38;
  if (-[_INPBStartAudioCallIntent hasAudioRoute](self, "hasAudioRoute"))
  {
    if (objc_msgSend(v4, "hasAudioRoute"))
    {
      audioRoute = self->_audioRoute;
      if (audioRoute != objc_msgSend(v4, "audioRoute"))
        goto LABEL_38;
    }
  }
  -[_INPBStartAudioCallIntent callRequestMetadata](self, "callRequestMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callRequestMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_37;
  -[_INPBStartAudioCallIntent callRequestMetadata](self, "callRequestMetadata");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBStartAudioCallIntent callRequestMetadata](self, "callRequestMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callRequestMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_38;
  }
  else
  {

  }
  -[_INPBStartAudioCallIntent contacts](self, "contacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_37;
  -[_INPBStartAudioCallIntent contacts](self, "contacts");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBStartAudioCallIntent contacts](self, "contacts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contacts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_38;
  }
  else
  {

  }
  v19 = -[_INPBStartAudioCallIntent hasDestinationType](self, "hasDestinationType");
  if (v19 != objc_msgSend(v4, "hasDestinationType"))
    goto LABEL_38;
  if (-[_INPBStartAudioCallIntent hasDestinationType](self, "hasDestinationType"))
  {
    if (objc_msgSend(v4, "hasDestinationType"))
    {
      destinationType = self->_destinationType;
      if (destinationType != objc_msgSend(v4, "destinationType"))
        goto LABEL_38;
    }
  }
  -[_INPBStartAudioCallIntent intentMetadata](self, "intentMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_37;
  -[_INPBStartAudioCallIntent intentMetadata](self, "intentMetadata");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[_INPBStartAudioCallIntent intentMetadata](self, "intentMetadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_38;
  }
  else
  {

  }
  v26 = -[_INPBStartAudioCallIntent hasPreferredCallProvider](self, "hasPreferredCallProvider");
  if (v26 != objc_msgSend(v4, "hasPreferredCallProvider"))
    goto LABEL_38;
  if (-[_INPBStartAudioCallIntent hasPreferredCallProvider](self, "hasPreferredCallProvider"))
  {
    if (objc_msgSend(v4, "hasPreferredCallProvider"))
    {
      preferredCallProvider = self->_preferredCallProvider;
      if (preferredCallProvider != objc_msgSend(v4, "preferredCallProvider"))
        goto LABEL_38;
    }
  }
  v28 = -[_INPBStartAudioCallIntent hasRecordTypeForRedialing](self, "hasRecordTypeForRedialing");
  if (v28 != objc_msgSend(v4, "hasRecordTypeForRedialing"))
    goto LABEL_38;
  if (-[_INPBStartAudioCallIntent hasRecordTypeForRedialing](self, "hasRecordTypeForRedialing"))
  {
    if (objc_msgSend(v4, "hasRecordTypeForRedialing"))
    {
      recordTypeForRedialing = self->_recordTypeForRedialing;
      if (recordTypeForRedialing != objc_msgSend(v4, "recordTypeForRedialing"))
        goto LABEL_38;
    }
  }
  -[_INPBStartAudioCallIntent targetContacts](self, "targetContacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetContacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
  {
LABEL_37:

    goto LABEL_38;
  }
  -[_INPBStartAudioCallIntent targetContacts](self, "targetContacts");
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)v30;
    -[_INPBStartAudioCallIntent targetContacts](self, "targetContacts");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetContacts");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "isEqual:", v33);

    if (!v34)
      goto LABEL_38;
  }
  else
  {

  }
  v37 = -[_INPBStartAudioCallIntent hasTtyType](self, "hasTtyType");
  if (v37 == objc_msgSend(v4, "hasTtyType"))
  {
    if (!-[_INPBStartAudioCallIntent hasTtyType](self, "hasTtyType")
      || !objc_msgSend(v4, "hasTtyType")
      || (ttyType = self->_ttyType, ttyType == objc_msgSend(v4, "ttyType")))
    {
      v35 = 1;
      goto LABEL_39;
    }
  }
LABEL_38:
  v35 = 0;
LABEL_39:

  return v35;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (-[_INPBStartAudioCallIntent hasAudioRoute](self, "hasAudioRoute"))
    v3 = 2654435761 * self->_audioRoute;
  else
    v3 = 0;
  v4 = -[_INPBStartCallRequestMetadata hash](self->_callRequestMetadata, "hash");
  v5 = -[NSArray hash](self->_contacts, "hash");
  if (-[_INPBStartAudioCallIntent hasDestinationType](self, "hasDestinationType"))
    v6 = 2654435761 * self->_destinationType;
  else
    v6 = 0;
  v7 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBStartAudioCallIntent hasPreferredCallProvider](self, "hasPreferredCallProvider"))
    v8 = 2654435761 * self->_preferredCallProvider;
  else
    v8 = 0;
  if (-[_INPBStartAudioCallIntent hasRecordTypeForRedialing](self, "hasRecordTypeForRedialing"))
    v9 = 2654435761 * self->_recordTypeForRedialing;
  else
    v9 = 0;
  v10 = -[NSArray hash](self->_targetContacts, "hash");
  if (-[_INPBStartAudioCallIntent hasTtyType](self, "hasTtyType"))
    v11 = 2654435761 * self->_ttyType;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  int v22;
  __CFString *v23;
  void *v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  __CFString *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBStartAudioCallIntent hasAudioRoute](self, "hasAudioRoute"))
  {
    v4 = -[_INPBStartAudioCallIntent audioRoute](self, "audioRoute");
    if ((v4 - 2) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E228FC60[(v4 - 2)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioRoute"));

  }
  -[_INPBStartAudioCallIntent callRequestMetadata](self, "callRequestMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("callRequestMetadata"));

  if (-[NSArray count](self->_contacts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v9 = self->_contacts;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("contact"));
  }
  if (-[_INPBStartAudioCallIntent hasDestinationType](self, "hasDestinationType"))
  {
    v15 = -[_INPBStartAudioCallIntent destinationType](self, "destinationType");
    if ((v15 - 1) >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v15);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E228FC78[(v15 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("destinationType"));

  }
  -[_INPBStartAudioCallIntent intentMetadata](self, "intentMetadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("intentMetadata"));

  if (-[_INPBStartAudioCallIntent hasPreferredCallProvider](self, "hasPreferredCallProvider"))
  {
    v19 = -[_INPBStartAudioCallIntent preferredCallProvider](self, "preferredCallProvider");
    if ((v19 - 2) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v19);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E228FCA0[(v19 - 2)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("preferredCallProvider"));

  }
  if (-[_INPBStartAudioCallIntent hasRecordTypeForRedialing](self, "hasRecordTypeForRedialing"))
  {
    v21 = -[_INPBStartAudioCallIntent recordTypeForRedialing](self, "recordTypeForRedialing");
    v22 = v21 - 2;
    if ((v21 - 2) < 9 && ((0x1EFu >> v22) & 1) != 0)
    {
      v23 = off_1E228FCB8[v22];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v21);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("recordTypeForRedialing"));

  }
  if (-[NSArray count](self->_targetContacts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v25 = self->_targetContacts;
    v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v35 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);

        }
        v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v27);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("targetContacts"));
  }
  if (-[_INPBStartAudioCallIntent hasTtyType](self, "hasTtyType"))
  {
    v31 = -[_INPBStartAudioCallIntent ttyType](self, "ttyType");
    if (v31 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v31);
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = off_1E228FD00[v31];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("ttyType"));

  }
  return v3;
}

- (int)audioRoute
{
  return self->_audioRoute;
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

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (int)recordTypeForRedialing
{
  return self->_recordTypeForRedialing;
}

- (NSArray)targetContacts
{
  return self->_targetContacts;
}

- (int)ttyType
{
  return self->_ttyType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContacts, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_callRequestMetadata, 0);
}

+ (Class)contactType
{
  return (Class)objc_opt_class();
}

+ (Class)targetContactsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
