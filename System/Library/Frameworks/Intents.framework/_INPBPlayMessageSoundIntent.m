@implementation _INPBPlayMessageSoundIntent

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setMessageIdentifier:(id)a3
{
  NSString *v4;
  NSString *messageIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  messageIdentifier = self->_messageIdentifier;
  self->_messageIdentifier = v4;

}

- (BOOL)hasMessageIdentifier
{
  return self->_messageIdentifier != 0;
}

- (void)setSoundType:(int)a3
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
    self->_soundType = a3;
  }
}

- (BOOL)hasSoundType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSoundType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)soundTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("OUTGOING_MESSAGE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSoundType:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("OUTGOING_MESSAGE"));
  return 1;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPlayMessageSoundIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_INPBPlayMessageSoundIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBPlayMessageSoundIntent intentMetadata](self, "intentMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPlayMessageSoundIntent messageIdentifier](self, "messageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  if (-[_INPBPlayMessageSoundIntent hasSoundType](self, "hasSoundType"))
    PBDataWriterWriteInt32Field();

}

- (_INPBPlayMessageSoundIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPlayMessageSoundIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPlayMessageSoundIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPlayMessageSoundIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPlayMessageSoundIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBPlayMessageSoundIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPlayMessageSoundIntent *v5;
  id v6;
  void *v7;

  v5 = -[_INPBPlayMessageSoundIntent init](+[_INPBPlayMessageSoundIntent allocWithZone:](_INPBPlayMessageSoundIntent, "allocWithZone:"), "init");
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBPlayMessageSoundIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_messageIdentifier, "copyWithZone:", a3);
  -[_INPBPlayMessageSoundIntent setMessageIdentifier:](v5, "setMessageIdentifier:", v7);

  if (-[_INPBPlayMessageSoundIntent hasSoundType](self, "hasSoundType"))
    -[_INPBPlayMessageSoundIntent setSoundType:](v5, "setSoundType:", -[_INPBPlayMessageSoundIntent soundType](self, "soundType"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  int v19;
  int soundType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBPlayMessageSoundIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBPlayMessageSoundIntent intentMetadata](self, "intentMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBPlayMessageSoundIntent intentMetadata](self, "intentMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBPlayMessageSoundIntent messageIdentifier](self, "messageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[_INPBPlayMessageSoundIntent messageIdentifier](self, "messageIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBPlayMessageSoundIntent messageIdentifier](self, "messageIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  v19 = -[_INPBPlayMessageSoundIntent hasSoundType](self, "hasSoundType");
  if (v19 == objc_msgSend(v4, "hasSoundType"))
  {
    if (!-[_INPBPlayMessageSoundIntent hasSoundType](self, "hasSoundType")
      || !objc_msgSend(v4, "hasSoundType")
      || (soundType = self->_soundType, soundType == objc_msgSend(v4, "soundType")))
    {
      v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v4 = -[NSString hash](self->_messageIdentifier, "hash");
  if (-[_INPBPlayMessageSoundIntent hasSoundType](self, "hasSoundType"))
    v5 = 2654435761 * self->_soundType;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBPlayMessageSoundIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("intentMetadata"));

  if (self->_messageIdentifier)
  {
    -[_INPBPlayMessageSoundIntent messageIdentifier](self, "messageIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("messageIdentifier"));

  }
  if (-[_INPBPlayMessageSoundIntent hasSoundType](self, "hasSoundType"))
  {
    v8 = -[_INPBPlayMessageSoundIntent soundType](self, "soundType");
    if ((_DWORD)v8 == 1)
    {
      v9 = CFSTR("OUTGOING_MESSAGE");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("soundType"));

  }
  return v3;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (int)soundType
{
  return self->_soundType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
