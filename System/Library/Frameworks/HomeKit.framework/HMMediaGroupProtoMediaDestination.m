@implementation HMMediaGroupProtoMediaDestination

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasParentIdentifier
{
  return self->_parentIdentifier != 0;
}

- (void)setSupportedOptions:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_supportedOptions = a3;
}

- (void)setHasSupportedOptions:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSupportedOptions
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAudioGroupIdentifier
{
  return self->_audioGroupIdentifier != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMMediaGroupProtoMediaDestination;
  -[HMMediaGroupProtoMediaDestination description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroupProtoMediaDestination dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *parentIdentifier;
  void *v7;
  NSString *audioGroupIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  parentIdentifier = self->_parentIdentifier;
  if (parentIdentifier)
    objc_msgSend(v4, "setObject:forKey:", parentIdentifier, CFSTR("parentIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_supportedOptions);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("supportedOptions"));

  }
  audioGroupIdentifier = self->_audioGroupIdentifier;
  if (audioGroupIdentifier)
    objc_msgSend(v4, "setObject:forKey:", audioGroupIdentifier, CFSTR("audioGroupIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMMediaGroupProtoMediaDestinationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_parentIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_audioGroupIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v5;
  }
  if (self->_parentIdentifier)
  {
    objc_msgSend(v5, "setParentIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_supportedOptions;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_audioGroupIdentifier)
  {
    objc_msgSend(v5, "setAudioGroupIdentifier:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_parentIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_supportedOptions;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_audioGroupIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *parentIdentifier;
  NSString *audioGroupIdentifier;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_13;
  }
  parentIdentifier = self->_parentIdentifier;
  if ((unint64_t)parentIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](parentIdentifier, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_supportedOptions != *((_QWORD *)v4 + 1))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  audioGroupIdentifier = self->_audioGroupIdentifier;
  if ((unint64_t)audioGroupIdentifier | *((_QWORD *)v4 + 2))
    v8 = -[NSString isEqual:](audioGroupIdentifier, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_parentIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761u * self->_supportedOptions;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_audioGroupIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  unint64_t *v5;

  v4 = (unint64_t *)a3;
  v5 = v4;
  if (v4[3])
  {
    -[HMMediaGroupProtoMediaDestination setIdentifier:](self, "setIdentifier:");
    v4 = v5;
  }
  if (v4[4])
  {
    -[HMMediaGroupProtoMediaDestination setParentIdentifier:](self, "setParentIdentifier:");
    v4 = v5;
  }
  if ((v4[5] & 1) != 0)
  {
    self->_supportedOptions = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[2])
  {
    -[HMMediaGroupProtoMediaDestination setAudioGroupIdentifier:](self, "setAudioGroupIdentifier:");
    v4 = v5;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
}

- (void)setParentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentIdentifier, a3);
}

- (unint64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (NSString)audioGroupIdentifier
{
  return self->_audioGroupIdentifier;
}

- (void)setAudioGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_audioGroupIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_audioGroupIdentifier, 0);
}

@end
