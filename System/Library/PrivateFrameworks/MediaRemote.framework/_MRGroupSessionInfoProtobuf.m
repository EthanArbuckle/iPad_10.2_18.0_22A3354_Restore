@implementation _MRGroupSessionInfoProtobuf

- (id)routeTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0xC && ((0xB27u >> a3) & 1) != 0)
  {
    v3 = off_1E30CEFC0[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsRouteType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GroupSessionRouteTypeUnknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GroupSessionRouteTypeCarKit")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GroupSessionRouteTypeCarPlay")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GroupSessionRouteTypeSpeaker")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GroupSessionRouteTypeHomePod")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GroupSessionRouteTypeHomePodMini")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GroupSessionRouteTypeAppleTV")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasEquivalentMediaIdentifier
{
  return self->_equivalentMediaIdentifier != 0;
}

- (void)setPlaceholder:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_placeholder = a3;
}

- (void)setHasPlaceholder:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlaceholder
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)_MRGroupSessionInfoProtobuf;
  -[_MRGroupSessionInfoProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupSessionInfoProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *hostDisplayName;
  uint64_t routeType;
  __CFString *v8;
  void *v9;
  NSString *equivalentMediaIdentifier;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  hostDisplayName = self->_hostDisplayName;
  if (hostDisplayName)
    objc_msgSend(v4, "setObject:forKey:", hostDisplayName, CFSTR("hostDisplayName"));
  routeType = self->_routeType;
  if (routeType < 0xC && ((0xB27u >> routeType) & 1) != 0)
  {
    v8 = off_1E30CEFC0[routeType];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_routeType);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("routeType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hosted);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("hosted"));

  equivalentMediaIdentifier = self->_equivalentMediaIdentifier;
  if (equivalentMediaIdentifier)
    objc_msgSend(v4, "setObject:forKey:", equivalentMediaIdentifier, CFSTR("equivalentMediaIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_placeholder);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("placeholder"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionInfoProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_identifier)
    -[_MRGroupSessionInfoProtobuf writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_hostDisplayName)
    -[_MRGroupSessionInfoProtobuf writeTo:].cold.2();
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteBOOLField();
  if (self->_equivalentMediaIdentifier)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setIdentifier:", self->_identifier);
  objc_msgSend(v5, "setHostDisplayName:", self->_hostDisplayName);
  v4 = v5;
  *((_DWORD *)v5 + 8) = self->_routeType;
  *((_BYTE *)v5 + 36) = self->_hosted;
  if (self->_equivalentMediaIdentifier)
  {
    objc_msgSend(v5, "setEquivalentMediaIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[37] = self->_placeholder;
    v4[40] |= 1u;
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

  v8 = -[NSString copyWithZone:](self->_hostDisplayName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  *(_DWORD *)(v5 + 32) = self->_routeType;
  *(_BYTE *)(v5 + 36) = self->_hosted;
  v10 = -[NSString copyWithZone:](self->_equivalentMediaIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 37) = self->_placeholder;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *hostDisplayName;
  NSString *equivalentMediaIdentifier;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_15;
  }
  hostDisplayName = self->_hostDisplayName;
  if ((unint64_t)hostDisplayName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](hostDisplayName, "isEqual:"))
      goto LABEL_15;
  }
  if (self->_routeType != *((_DWORD *)v4 + 8))
    goto LABEL_15;
  if (self->_hosted)
  {
    if (!*((_BYTE *)v4 + 36))
      goto LABEL_15;
  }
  else if (*((_BYTE *)v4 + 36))
  {
    goto LABEL_15;
  }
  equivalentMediaIdentifier = self->_equivalentMediaIdentifier;
  if ((unint64_t)equivalentMediaIdentifier | *((_QWORD *)v4 + 1)
    && !-[NSString isEqual:](equivalentMediaIdentifier, "isEqual:"))
  {
    goto LABEL_15;
  }
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) != 0)
    {
      if (self->_placeholder)
      {
        if (!*((_BYTE *)v4 + 37))
          goto LABEL_15;
      }
      else if (*((_BYTE *)v4 + 37))
      {
        goto LABEL_15;
      }
      v8 = 1;
      goto LABEL_16;
    }
LABEL_15:
    v8 = 0;
  }
LABEL_16:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t routeType;
  _BOOL4 hosted;
  NSUInteger v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_hostDisplayName, "hash");
  routeType = self->_routeType;
  hosted = self->_hosted;
  v7 = -[NSString hash](self->_equivalentMediaIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761 * self->_placeholder;
  else
    v8 = 0;
  return v4 ^ v3 ^ (2654435761 * hosted) ^ (2654435761 * routeType) ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[_MRGroupSessionInfoProtobuf setIdentifier:](self, "setIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[_MRGroupSessionInfoProtobuf setHostDisplayName:](self, "setHostDisplayName:");
    v4 = v5;
  }
  self->_routeType = *((_DWORD *)v4 + 8);
  self->_hosted = *((_BYTE *)v4 + 36);
  if (*((_QWORD *)v4 + 1))
  {
    -[_MRGroupSessionInfoProtobuf setEquivalentMediaIdentifier:](self, "setEquivalentMediaIdentifier:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_placeholder = *((_BYTE *)v4 + 37);
    *(_BYTE *)&self->_has |= 1u;
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

- (NSString)hostDisplayName
{
  return self->_hostDisplayName;
}

- (void)setHostDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_hostDisplayName, a3);
}

- (int)routeType
{
  return self->_routeType;
}

- (void)setRouteType:(int)a3
{
  self->_routeType = a3;
}

- (BOOL)hosted
{
  return self->_hosted;
}

- (void)setHosted:(BOOL)a3
{
  self->_hosted = a3;
}

- (NSString)equivalentMediaIdentifier
{
  return self->_equivalentMediaIdentifier;
}

- (void)setEquivalentMediaIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_equivalentMediaIdentifier, a3);
}

- (BOOL)placeholder
{
  return self->_placeholder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_hostDisplayName, 0);
  objc_storeStrong((id *)&self->_equivalentMediaIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_MRGroupSessionInfoProtobuf writeTo:]", "_MRGroupSessionInfoProtobuf.m", 144, "nil != self->_identifier");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[_MRGroupSessionInfoProtobuf writeTo:]", "_MRGroupSessionInfoProtobuf.m", 149, "nil != self->_hostDisplayName");
}

@end
