@implementation _INPBStartVideoCallIntent

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
    return off_1E228B8D0[a3 - 2];
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

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
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

- (BOOL)readFrom:(id)a3
{
  return _INPBStartVideoCallIntentReadFrom(self, (uint64_t)a3);
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
  if (-[_INPBStartVideoCallIntent hasAudioRoute](self, "hasAudioRoute"))
    PBDataWriterWriteInt32Field();
  -[_INPBStartVideoCallIntent callRequestMetadata](self, "callRequestMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBStartVideoCallIntent callRequestMetadata](self, "callRequestMetadata");
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

  -[_INPBStartVideoCallIntent intentMetadata](self, "intentMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBStartVideoCallIntent intentMetadata](self, "intentMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
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

}

- (_INPBStartVideoCallIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBStartVideoCallIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBStartVideoCallIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBStartVideoCallIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBStartVideoCallIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBStartVideoCallIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBStartVideoCallIntent *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = -[_INPBStartVideoCallIntent init](+[_INPBStartVideoCallIntent allocWithZone:](_INPBStartVideoCallIntent, "allocWithZone:"), "init");
  if (-[_INPBStartVideoCallIntent hasAudioRoute](self, "hasAudioRoute"))
    -[_INPBStartVideoCallIntent setAudioRoute:](v5, "setAudioRoute:", -[_INPBStartVideoCallIntent audioRoute](self, "audioRoute"));
  v6 = -[_INPBStartCallRequestMetadata copyWithZone:](self->_callRequestMetadata, "copyWithZone:", a3);
  -[_INPBStartVideoCallIntent setCallRequestMetadata:](v5, "setCallRequestMetadata:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_contacts, "copyWithZone:", a3);
  -[_INPBStartVideoCallIntent setContacts:](v5, "setContacts:", v7);

  v8 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBStartVideoCallIntent setIntentMetadata:](v5, "setIntentMetadata:", v8);

  v9 = (void *)-[NSArray copyWithZone:](self->_targetContacts, "copyWithZone:", a3);
  -[_INPBStartVideoCallIntent setTargetContacts:](v5, "setTargetContacts:", v9);

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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  v5 = -[_INPBStartVideoCallIntent hasAudioRoute](self, "hasAudioRoute");
  if (v5 != objc_msgSend(v4, "hasAudioRoute"))
    goto LABEL_26;
  if (-[_INPBStartVideoCallIntent hasAudioRoute](self, "hasAudioRoute"))
  {
    if (objc_msgSend(v4, "hasAudioRoute"))
    {
      audioRoute = self->_audioRoute;
      if (audioRoute != objc_msgSend(v4, "audioRoute"))
        goto LABEL_26;
    }
  }
  -[_INPBStartVideoCallIntent callRequestMetadata](self, "callRequestMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callRequestMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_25;
  -[_INPBStartVideoCallIntent callRequestMetadata](self, "callRequestMetadata");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBStartVideoCallIntent callRequestMetadata](self, "callRequestMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callRequestMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBStartVideoCallIntent contacts](self, "contacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_25;
  -[_INPBStartVideoCallIntent contacts](self, "contacts");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBStartVideoCallIntent contacts](self, "contacts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contacts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBStartVideoCallIntent intentMetadata](self, "intentMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_25;
  -[_INPBStartVideoCallIntent intentMetadata](self, "intentMetadata");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBStartVideoCallIntent intentMetadata](self, "intentMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBStartVideoCallIntent targetContacts](self, "targetContacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetContacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBStartVideoCallIntent targetContacts](self, "targetContacts");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
    {

LABEL_29:
      v29 = 1;
      goto LABEL_27;
    }
    v25 = (void *)v24;
    -[_INPBStartVideoCallIntent targetContacts](self, "targetContacts");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetContacts");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if ((v28 & 1) != 0)
      goto LABEL_29;
  }
  else
  {
LABEL_25:

  }
LABEL_26:
  v29 = 0;
LABEL_27:

  return v29;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  if (-[_INPBStartVideoCallIntent hasAudioRoute](self, "hasAudioRoute"))
    v3 = 2654435761 * self->_audioRoute;
  else
    v3 = 0;
  v4 = -[_INPBStartCallRequestMetadata hash](self->_callRequestMetadata, "hash") ^ v3;
  v5 = -[NSArray hash](self->_contacts, "hash");
  v6 = v4 ^ v5 ^ -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  return v6 ^ -[NSArray hash](self->_targetContacts, "hash");
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
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBStartVideoCallIntent hasAudioRoute](self, "hasAudioRoute"))
  {
    v4 = -[_INPBStartVideoCallIntent audioRoute](self, "audioRoute");
    if ((v4 - 2) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E228B8D0[(v4 - 2)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioRoute"));

  }
  -[_INPBStartVideoCallIntent callRequestMetadata](self, "callRequestMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("callRequestMetadata"));

  if (-[NSArray count](self->_contacts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = self->_contacts;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("contact"));
  }
  -[_INPBStartVideoCallIntent intentMetadata](self, "intentMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("intentMetadata"));

  if (-[NSArray count](self->_targetContacts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v18 = self->_targetContacts;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v20);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("targetContacts"));
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

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSArray)targetContacts
{
  return self->_targetContacts;
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
