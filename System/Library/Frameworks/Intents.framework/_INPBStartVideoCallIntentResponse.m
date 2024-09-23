@implementation _INPBStartVideoCallIntentResponse

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
    return off_1E228C348[a3 - 2];
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

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (BOOL)hasMetrics
{
  return self->_metrics != 0;
}

- (void)setStatus:(id)a3
{
  NSString *v4;
  NSString *status;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  status = self->_status;
  self->_status = v4;

}

- (BOOL)hasStatus
{
  return self->_status != 0;
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
  return _INPBStartVideoCallIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBStartVideoCallIntentResponse hasAudioRoute](self, "hasAudioRoute"))
    PBDataWriterWriteInt32Field();
  -[_INPBStartVideoCallIntentResponse metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBStartVideoCallIntentResponse metrics](self, "metrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBStartVideoCallIntentResponse status](self, "status");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_targetContacts;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteStringField();
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (_INPBStartVideoCallIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBStartVideoCallIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBStartVideoCallIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBStartVideoCallIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBStartVideoCallIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBStartVideoCallIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBStartVideoCallIntentResponse *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = -[_INPBStartVideoCallIntentResponse init](+[_INPBStartVideoCallIntentResponse allocWithZone:](_INPBStartVideoCallIntentResponse, "allocWithZone:"), "init");
  if (-[_INPBStartVideoCallIntentResponse hasAudioRoute](self, "hasAudioRoute"))
    -[_INPBStartVideoCallIntentResponse setAudioRoute:](v5, "setAudioRoute:", -[_INPBStartVideoCallIntentResponse audioRoute](self, "audioRoute"));
  v6 = -[_INPBCallMetrics copyWithZone:](self->_metrics, "copyWithZone:", a3);
  -[_INPBStartVideoCallIntentResponse setMetrics:](v5, "setMetrics:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_status, "copyWithZone:", a3);
  -[_INPBStartVideoCallIntentResponse setStatus:](v5, "setStatus:", v7);

  v8 = (void *)-[NSArray copyWithZone:](self->_targetContacts, "copyWithZone:", a3);
  -[_INPBStartVideoCallIntentResponse setTargetContacts:](v5, "setTargetContacts:", v8);

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
  char v23;
  BOOL v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  v5 = -[_INPBStartVideoCallIntentResponse hasAudioRoute](self, "hasAudioRoute");
  if (v5 != objc_msgSend(v4, "hasAudioRoute"))
    goto LABEL_21;
  if (-[_INPBStartVideoCallIntentResponse hasAudioRoute](self, "hasAudioRoute"))
  {
    if (objc_msgSend(v4, "hasAudioRoute"))
    {
      audioRoute = self->_audioRoute;
      if (audioRoute != objc_msgSend(v4, "audioRoute"))
        goto LABEL_21;
    }
  }
  -[_INPBStartVideoCallIntentResponse metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_20;
  -[_INPBStartVideoCallIntentResponse metrics](self, "metrics");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBStartVideoCallIntentResponse metrics](self, "metrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBStartVideoCallIntentResponse status](self, "status");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "status");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_20;
  -[_INPBStartVideoCallIntentResponse status](self, "status");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBStartVideoCallIntentResponse status](self, "status");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "status");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBStartVideoCallIntentResponse targetContacts](self, "targetContacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetContacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBStartVideoCallIntentResponse targetContacts](self, "targetContacts");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {

LABEL_24:
      v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    -[_INPBStartVideoCallIntentResponse targetContacts](self, "targetContacts");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetContacts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if ((v23 & 1) != 0)
      goto LABEL_24;
  }
  else
  {
LABEL_20:

  }
LABEL_21:
  v24 = 0;
LABEL_22:

  return v24;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;

  if (-[_INPBStartVideoCallIntentResponse hasAudioRoute](self, "hasAudioRoute"))
    v3 = 2654435761 * self->_audioRoute;
  else
    v3 = 0;
  v4 = -[_INPBCallMetrics hash](self->_metrics, "hash") ^ v3;
  v5 = -[NSString hash](self->_status, "hash");
  return v4 ^ v5 ^ -[NSArray hash](self->_targetContacts, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBStartVideoCallIntentResponse hasAudioRoute](self, "hasAudioRoute"))
  {
    v4 = -[_INPBStartVideoCallIntentResponse audioRoute](self, "audioRoute");
    if ((v4 - 2) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E228C348[(v4 - 2)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioRoute"));

  }
  -[_INPBStartVideoCallIntentResponse metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("metrics"));

  if (self->_status)
  {
    -[_INPBStartVideoCallIntentResponse status](self, "status");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("status"));

  }
  if (self->_targetContacts)
  {
    -[_INPBStartVideoCallIntentResponse targetContacts](self, "targetContacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("targetContacts"));

  }
  return v3;
}

- (int)audioRoute
{
  return self->_audioRoute;
}

- (_INPBCallMetrics)metrics
{
  return self->_metrics;
}

- (NSString)status
{
  return self->_status;
}

- (NSArray)targetContacts
{
  return self->_targetContacts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContacts, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
