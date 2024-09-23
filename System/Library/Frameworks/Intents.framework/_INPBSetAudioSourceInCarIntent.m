@implementation _INPBSetAudioSourceInCarIntent

- (void)setAudioSource:(int)a3
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
    self->_audioSource = a3;
  }
}

- (BOOL)hasAudioSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAudioSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)audioSourceAsString:(int)a3
{
  if ((a3 - 1) < 9)
    return off_1E228C8B8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAudioSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IPOD")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RADIO")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BLUETOOTH")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUX")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USB")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEMORY_CARD")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OPTICAL_DRIVE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HARD_DRIVE")))
  {
    v4 = 9;
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

- (void)setRelativeAudioSourceReference:(int)a3
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
    self->_relativeAudioSourceReference = a3;
  }
}

- (BOOL)hasRelativeAudioSourceReference
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRelativeAudioSourceReference:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)relativeAudioSourceReferenceAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("NEXT");
  if (a3 == 2)
  {
    v3 = CFSTR("PREVIOUS");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsRelativeAudioSourceReference:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEXT")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("PREVIOUS")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetAudioSourceInCarIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_INPBSetAudioSourceInCarIntent hasAudioSource](self, "hasAudioSource"))
    PBDataWriterWriteInt32Field();
  -[_INPBSetAudioSourceInCarIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSetAudioSourceInCarIntent intentMetadata](self, "intentMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSetAudioSourceInCarIntent hasRelativeAudioSourceReference](self, "hasRelativeAudioSourceReference"))
    PBDataWriterWriteInt32Field();

}

- (_INPBSetAudioSourceInCarIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSetAudioSourceInCarIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSetAudioSourceInCarIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSetAudioSourceInCarIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSetAudioSourceInCarIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBSetAudioSourceInCarIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSetAudioSourceInCarIntent *v5;
  id v6;

  v5 = -[_INPBSetAudioSourceInCarIntent init](+[_INPBSetAudioSourceInCarIntent allocWithZone:](_INPBSetAudioSourceInCarIntent, "allocWithZone:"), "init");
  if (-[_INPBSetAudioSourceInCarIntent hasAudioSource](self, "hasAudioSource"))
    -[_INPBSetAudioSourceInCarIntent setAudioSource:](v5, "setAudioSource:", -[_INPBSetAudioSourceInCarIntent audioSource](self, "audioSource"));
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSetAudioSourceInCarIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  if (-[_INPBSetAudioSourceInCarIntent hasRelativeAudioSourceReference](self, "hasRelativeAudioSourceReference"))
    -[_INPBSetAudioSourceInCarIntent setRelativeAudioSourceReference:](v5, "setRelativeAudioSourceReference:", -[_INPBSetAudioSourceInCarIntent relativeAudioSourceReference](self, "relativeAudioSourceReference"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int audioSource;
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
  int relativeAudioSourceReference;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  v5 = -[_INPBSetAudioSourceInCarIntent hasAudioSource](self, "hasAudioSource");
  if (v5 != objc_msgSend(v4, "hasAudioSource"))
    goto LABEL_13;
  if (-[_INPBSetAudioSourceInCarIntent hasAudioSource](self, "hasAudioSource"))
  {
    if (objc_msgSend(v4, "hasAudioSource"))
    {
      audioSource = self->_audioSource;
      if (audioSource != objc_msgSend(v4, "audioSource"))
        goto LABEL_13;
    }
  }
  -[_INPBSetAudioSourceInCarIntent intentMetadata](self, "intentMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBSetAudioSourceInCarIntent intentMetadata](self, "intentMetadata");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[_INPBSetAudioSourceInCarIntent intentMetadata](self, "intentMetadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "intentMetadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
        goto LABEL_13;
    }
    else
    {

    }
    v15 = -[_INPBSetAudioSourceInCarIntent hasRelativeAudioSourceReference](self, "hasRelativeAudioSourceReference");
    if (v15 == objc_msgSend(v4, "hasRelativeAudioSourceReference"))
    {
      if (!-[_INPBSetAudioSourceInCarIntent hasRelativeAudioSourceReference](self, "hasRelativeAudioSourceReference")
        || !objc_msgSend(v4, "hasRelativeAudioSourceReference")
        || (relativeAudioSourceReference = self->_relativeAudioSourceReference,
            relativeAudioSourceReference == objc_msgSend(v4, "relativeAudioSourceReference")))
      {
        v16 = 1;
        goto LABEL_14;
      }
    }
  }
  else
  {

  }
LABEL_13:
  v16 = 0;
LABEL_14:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (-[_INPBSetAudioSourceInCarIntent hasAudioSource](self, "hasAudioSource"))
    v3 = 2654435761 * self->_audioSource;
  else
    v3 = 0;
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBSetAudioSourceInCarIntent hasRelativeAudioSourceReference](self, "hasRelativeAudioSourceReference"))
    v5 = 2654435761 * self->_relativeAudioSourceReference;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBSetAudioSourceInCarIntent hasAudioSource](self, "hasAudioSource"))
  {
    v4 = -[_INPBSetAudioSourceInCarIntent audioSource](self, "audioSource");
    if ((v4 - 1) >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E228C8B8[(v4 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioSource"));

  }
  -[_INPBSetAudioSourceInCarIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intentMetadata"));

  if (-[_INPBSetAudioSourceInCarIntent hasRelativeAudioSourceReference](self, "hasRelativeAudioSourceReference"))
  {
    v8 = -[_INPBSetAudioSourceInCarIntent relativeAudioSourceReference](self, "relativeAudioSourceReference");
    if ((_DWORD)v8 == 1)
    {
      v9 = CFSTR("NEXT");
    }
    else if ((_DWORD)v8 == 2)
    {
      v9 = CFSTR("PREVIOUS");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("relativeAudioSourceReference"));

  }
  return v3;
}

- (int)audioSource
{
  return self->_audioSource;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)relativeAudioSourceReference
{
  return self->_relativeAudioSourceReference;
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
