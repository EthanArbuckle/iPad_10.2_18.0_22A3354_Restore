@implementation _INPBAnswerCallIntent

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
    return off_1E2293860[a3 - 2];
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

- (void)setCallIdentifier:(id)a3
{
  NSString *v4;
  NSString *callIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  callIdentifier = self->_callIdentifier;
  self->_callIdentifier = v4;

}

- (BOOL)hasCallIdentifier
{
  return self->_callIdentifier != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAnswerCallIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[_INPBAnswerCallIntent hasAudioRoute](self, "hasAudioRoute"))
    PBDataWriterWriteInt32Field();
  -[_INPBAnswerCallIntent callIdentifier](self, "callIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBAnswerCallIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[_INPBAnswerCallIntent intentMetadata](self, "intentMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (_INPBAnswerCallIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBAnswerCallIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBAnswerCallIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBAnswerCallIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBAnswerCallIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBAnswerCallIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBAnswerCallIntent *v5;
  void *v6;
  id v7;

  v5 = -[_INPBAnswerCallIntent init](+[_INPBAnswerCallIntent allocWithZone:](_INPBAnswerCallIntent, "allocWithZone:"), "init");
  if (-[_INPBAnswerCallIntent hasAudioRoute](self, "hasAudioRoute"))
    -[_INPBAnswerCallIntent setAudioRoute:](v5, "setAudioRoute:", -[_INPBAnswerCallIntent audioRoute](self, "audioRoute"));
  v6 = (void *)-[NSString copyWithZone:](self->_callIdentifier, "copyWithZone:", a3);
  -[_INPBAnswerCallIntent setCallIdentifier:](v5, "setCallIdentifier:", v6);

  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBAnswerCallIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

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
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  v5 = -[_INPBAnswerCallIntent hasAudioRoute](self, "hasAudioRoute");
  if (v5 != objc_msgSend(v4, "hasAudioRoute"))
    goto LABEL_16;
  if (-[_INPBAnswerCallIntent hasAudioRoute](self, "hasAudioRoute"))
  {
    if (objc_msgSend(v4, "hasAudioRoute"))
    {
      audioRoute = self->_audioRoute;
      if (audioRoute != objc_msgSend(v4, "audioRoute"))
        goto LABEL_16;
    }
  }
  -[_INPBAnswerCallIntent callIdentifier](self, "callIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_15;
  -[_INPBAnswerCallIntent callIdentifier](self, "callIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBAnswerCallIntent callIdentifier](self, "callIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_16;
  }
  else
  {

  }
  -[_INPBAnswerCallIntent intentMetadata](self, "intentMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBAnswerCallIntent intentMetadata](self, "intentMetadata");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {

LABEL_19:
      v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    -[_INPBAnswerCallIntent intentMetadata](self, "intentMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_19;
  }
  else
  {
LABEL_15:

  }
LABEL_16:
  v19 = 0;
LABEL_17:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  if (-[_INPBAnswerCallIntent hasAudioRoute](self, "hasAudioRoute"))
    v3 = 2654435761 * self->_audioRoute;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_callIdentifier, "hash") ^ v3;
  return v4 ^ -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBAnswerCallIntent hasAudioRoute](self, "hasAudioRoute"))
  {
    v4 = -[_INPBAnswerCallIntent audioRoute](self, "audioRoute");
    if ((v4 - 2) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E2293860[(v4 - 2)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioRoute"));

  }
  if (self->_callIdentifier)
  {
    -[_INPBAnswerCallIntent callIdentifier](self, "callIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("callIdentifier"));

  }
  -[_INPBAnswerCallIntent intentMetadata](self, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("intentMetadata"));

  return v3;
}

- (int)audioRoute
{
  return self->_audioRoute;
}

- (NSString)callIdentifier
{
  return self->_callIdentifier;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_callIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
