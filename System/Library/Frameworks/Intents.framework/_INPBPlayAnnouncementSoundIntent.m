@implementation _INPBPlayAnnouncementSoundIntent

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
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
    v3 = CFSTR("ANNOUNCEMENT_SENT");
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
  objc_msgSend(a3, "isEqualToString:", CFSTR("ANNOUNCEMENT_SENT"));
  return 1;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPlayAnnouncementSoundIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_INPBPlayAnnouncementSoundIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBPlayAnnouncementSoundIntent intentMetadata](self, "intentMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBPlayAnnouncementSoundIntent hasSoundType](self, "hasSoundType"))
    PBDataWriterWriteInt32Field();

}

- (_INPBPlayAnnouncementSoundIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPlayAnnouncementSoundIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPlayAnnouncementSoundIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPlayAnnouncementSoundIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPlayAnnouncementSoundIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBPlayAnnouncementSoundIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPlayAnnouncementSoundIntent *v5;
  id v6;

  v5 = -[_INPBPlayAnnouncementSoundIntent init](+[_INPBPlayAnnouncementSoundIntent allocWithZone:](_INPBPlayAnnouncementSoundIntent, "allocWithZone:"), "init");
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBPlayAnnouncementSoundIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  if (-[_INPBPlayAnnouncementSoundIntent hasSoundType](self, "hasSoundType"))
    -[_INPBPlayAnnouncementSoundIntent setSoundType:](v5, "setSoundType:", -[_INPBPlayAnnouncementSoundIntent soundType](self, "soundType"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  BOOL v14;
  int soundType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[_INPBPlayAnnouncementSoundIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBPlayAnnouncementSoundIntent intentMetadata](self, "intentMetadata");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[_INPBPlayAnnouncementSoundIntent intentMetadata](self, "intentMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "intentMetadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_9;
    }
    else
    {

    }
    v13 = -[_INPBPlayAnnouncementSoundIntent hasSoundType](self, "hasSoundType");
    if (v13 == objc_msgSend(v4, "hasSoundType"))
    {
      if (!-[_INPBPlayAnnouncementSoundIntent hasSoundType](self, "hasSoundType")
        || !objc_msgSend(v4, "hasSoundType")
        || (soundType = self->_soundType, soundType == objc_msgSend(v4, "soundType")))
      {
        v14 = 1;
        goto LABEL_10;
      }
    }
  }
  else
  {

  }
LABEL_9:
  v14 = 0;
LABEL_10:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBPlayAnnouncementSoundIntent hasSoundType](self, "hasSoundType"))
    v4 = 2654435761 * self->_soundType;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBPlayAnnouncementSoundIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("intentMetadata"));

  if (-[_INPBPlayAnnouncementSoundIntent hasSoundType](self, "hasSoundType"))
  {
    v6 = -[_INPBPlayAnnouncementSoundIntent soundType](self, "soundType");
    if ((_DWORD)v6 == 1)
    {
      v7 = CFSTR("ANNOUNCEMENT_SENT");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("soundType"));

  }
  return v3;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)soundType
{
  return self->_soundType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
