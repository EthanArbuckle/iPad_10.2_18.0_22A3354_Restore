@implementation _MRGroupSessionTokenProtobuf

- (id)routeTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0xC && ((0xB27u >> a3) & 1) != 0)
  {
    v3 = off_1E30CB5A0[a3];
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

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasSessionIdentifier
{
  return self->_sessionIdentifier != 0;
}

- (BOOL)hasSharedSecret
{
  return self->_sharedSecret != 0;
}

- (BOOL)hasEquivalentMediaIdentifier
{
  return self->_equivalentMediaIdentifier != 0;
}

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
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
  v8.super_class = (Class)_MRGroupSessionTokenProtobuf;
  -[_MRGroupSessionTokenProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupSessionTokenProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *invitationData;
  uint64_t routeType;
  __CFString *v7;
  NSString *displayName;
  NSString *sessionIdentifier;
  NSString *sharedSecret;
  NSString *equivalentMediaIdentifier;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  invitationData = self->_invitationData;
  if (invitationData)
    objc_msgSend(v3, "setObject:forKey:", invitationData, CFSTR("invitationData"));
  routeType = self->_routeType;
  if (routeType < 0xC && ((0xB27u >> routeType) & 1) != 0)
  {
    v7 = off_1E30CB5A0[routeType];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_routeType);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("routeType"));

  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v4, "setObject:forKey:", displayName, CFSTR("displayName"));
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", sessionIdentifier, CFSTR("sessionIdentifier"));
  sharedSecret = self->_sharedSecret;
  if (sharedSecret)
    objc_msgSend(v4, "setObject:forKey:", sharedSecret, CFSTR("sharedSecret"));
  equivalentMediaIdentifier = self->_equivalentMediaIdentifier;
  if (equivalentMediaIdentifier)
    objc_msgSend(v4, "setObject:forKey:", equivalentMediaIdentifier, CFSTR("equivalentMediaIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("version"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionTokenProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!self->_invitationData)
    -[_MRGroupSessionTokenProtobuf writeTo:].cold.1();
  v6 = v4;
  PBDataWriterWriteDataField();
  PBDataWriterWriteInt32Field();
  if (self->_displayName)
    PBDataWriterWriteStringField();
  if (self->_sessionIdentifier)
    PBDataWriterWriteStringField();
  v5 = v6;
  if (self->_sharedSecret)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_equivalentMediaIdentifier)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v5 = a3;
  objc_msgSend(v5, "setInvitationData:", self->_invitationData);
  v4 = v5;
  v5[8] = self->_routeType;
  if (self->_displayName)
  {
    objc_msgSend(v5, "setDisplayName:");
    v4 = v5;
  }
  if (self->_sessionIdentifier)
  {
    objc_msgSend(v5, "setSessionIdentifier:");
    v4 = v5;
  }
  if (self->_sharedSecret)
  {
    objc_msgSend(v5, "setSharedSecret:");
    v4 = v5;
  }
  if (self->_equivalentMediaIdentifier)
  {
    objc_msgSend(v5, "setEquivalentMediaIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[14] = self->_version;
    *((_BYTE *)v4 + 60) |= 1u;
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_invitationData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  *(_DWORD *)(v5 + 32) = self->_routeType;
  v8 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[NSString copyWithZone:](self->_sessionIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_sharedSecret, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  v14 = -[NSString copyWithZone:](self->_equivalentMediaIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_version;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *invitationData;
  NSString *displayName;
  NSString *sessionIdentifier;
  NSString *sharedSecret;
  NSString *equivalentMediaIdentifier;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  invitationData = self->_invitationData;
  if ((unint64_t)invitationData | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](invitationData, "isEqual:"))
      goto LABEL_17;
  }
  if (self->_routeType != *((_DWORD *)v4 + 8))
    goto LABEL_17;
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_17;
  }
  sessionIdentifier = self->_sessionIdentifier;
  if ((unint64_t)sessionIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](sessionIdentifier, "isEqual:"))
      goto LABEL_17;
  }
  sharedSecret = self->_sharedSecret;
  if ((unint64_t)sharedSecret | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](sharedSecret, "isEqual:"))
      goto LABEL_17;
  }
  equivalentMediaIdentifier = self->_equivalentMediaIdentifier;
  if ((unint64_t)equivalentMediaIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](equivalentMediaIdentifier, "isEqual:"))
      goto LABEL_17;
  }
  v10 = (*((_BYTE *)v4 + 60) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) != 0 && self->_version == *((_DWORD *)v4 + 14))
    {
      v10 = 1;
      goto LABEL_18;
    }
LABEL_17:
    v10 = 0;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t routeType;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;

  v3 = -[NSData hash](self->_invitationData, "hash");
  routeType = self->_routeType;
  v5 = -[NSString hash](self->_displayName, "hash");
  v6 = -[NSString hash](self->_sessionIdentifier, "hash");
  v7 = -[NSString hash](self->_sharedSecret, "hash");
  v8 = -[NSString hash](self->_equivalentMediaIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v9 = 2654435761 * self->_version;
  else
    v9 = 0;
  return (2654435761 * routeType) ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[_MRGroupSessionTokenProtobuf setInvitationData:](self, "setInvitationData:");
    v4 = v5;
  }
  self->_routeType = *((_DWORD *)v4 + 8);
  if (*((_QWORD *)v4 + 1))
  {
    -[_MRGroupSessionTokenProtobuf setDisplayName:](self, "setDisplayName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[_MRGroupSessionTokenProtobuf setSessionIdentifier:](self, "setSessionIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[_MRGroupSessionTokenProtobuf setSharedSecret:](self, "setSharedSecret:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[_MRGroupSessionTokenProtobuf setEquivalentMediaIdentifier:](self, "setEquivalentMediaIdentifier:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    self->_version = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)invitationData
{
  return self->_invitationData;
}

- (void)setInvitationData:(id)a3
{
  objc_storeStrong((id *)&self->_invitationData, a3);
}

- (int)routeType
{
  return self->_routeType;
}

- (void)setRouteType:(int)a3
{
  self->_routeType = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (NSString)sharedSecret
{
  return self->_sharedSecret;
}

- (void)setSharedSecret:(id)a3
{
  objc_storeStrong((id *)&self->_sharedSecret, a3);
}

- (NSString)equivalentMediaIdentifier
{
  return self->_equivalentMediaIdentifier;
}

- (void)setEquivalentMediaIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_equivalentMediaIdentifier, a3);
}

- (unsigned)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_invitationData, 0);
  objc_storeStrong((id *)&self->_equivalentMediaIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_MRGroupSessionTokenProtobuf writeTo:]", "_MRGroupSessionTokenProtobuf.m", 171, "nil != self->_invitationData");
}

@end
