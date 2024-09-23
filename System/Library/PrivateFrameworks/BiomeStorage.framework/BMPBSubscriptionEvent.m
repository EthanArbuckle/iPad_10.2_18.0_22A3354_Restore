@implementation BMPBSubscriptionEvent

- (uint64_t)setStarting:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 44) |= 1u;
    *(_BYTE *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setHasStarting:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 44) = *(_BYTE *)(result + 44) & 0xFE | a2;
  return result;
}

- (uint64_t)hasStarting
{
  if (result)
    return *(_BYTE *)(result + 44) & 1;
  return result;
}

- (BOOL)hasClient
{
  if (result)
    return *(_QWORD *)(result + 16) != 0;
  return result;
}

- (BOOL)hasIdentifier
{
  if (result)
    return *(_QWORD *)(result + 24) != 0;
  return result;
}

- (BOOL)hasUseCase
{
  if (result)
    return *(_QWORD *)(result + 32) != 0;
  return result;
}

- (BOOL)hasBootUUID
{
  if (result)
    return *(_QWORD *)(result + 8) != 0;
  return result;
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
  v8.super_class = (Class)BMPBSubscriptionEvent;
  -[BMPBSubscriptionEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBSubscriptionEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *client;
  NSString *identifier;
  NSString *useCase;
  NSString *bootUUID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_starting);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("starting"));

  }
  client = self->_client;
  if (client)
    objc_msgSend(v3, "setObject:forKey:", client, CFSTR("client"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  useCase = self->_useCase;
  if (useCase)
    objc_msgSend(v3, "setObject:forKey:", useCase, CFSTR("useCase"));
  bootUUID = self->_bootUUID;
  if (bootUUID)
    objc_msgSend(v3, "setObject:forKey:", bootUUID, CFSTR("bootUUID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSubscriptionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_client)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_useCase)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_bootUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BYTE *v7;

  v7 = a2;
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 44) & 1) != 0)
    {
      v7[40] = *(_BYTE *)(a1 + 40);
      v7[44] |= 1u;
    }
    v3 = *(void **)(a1 + 16);
    if (v3)
      -[BMPBSubscriptionEvent setClient:]((uint64_t)v7, v3);
    v4 = *(void **)(a1 + 24);
    if (v4)
      -[BMPBSubscriptionEvent setIdentifier:]((uint64_t)v7, v4);
    v5 = *(void **)(a1 + 32);
    if (v5)
      -[BMPBSubscriptionEvent setUseCase:]((uint64_t)v7, v5);
    v6 = *(void **)(a1 + 8);
    if (v6)
      -[BMPBSubscriptionEvent setBootUUID:]((uint64_t)v7, v6);
  }

}

- (void)setClient:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)setIdentifier:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setUseCase:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setBootUUID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_starting;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_client, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  v11 = -[NSString copyWithZone:](self->_useCase, "copyWithZone:", a3);
  v12 = (void *)v6[4];
  v6[4] = v11;

  v13 = -[NSString copyWithZone:](self->_bootUUID, "copyWithZone:", a3);
  v14 = (void *)v6[1];
  v6[1] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *client;
  NSString *identifier;
  NSString *useCase;
  NSString *bootUUID;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) != 0)
    {
      if (self->_starting)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_18;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_10;
    }
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
    goto LABEL_18;
LABEL_10:
  client = self->_client;
  if ((unint64_t)client | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](client, "isEqual:"))
    goto LABEL_18;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_18;
  }
  useCase = self->_useCase;
  if ((unint64_t)useCase | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](useCase, "isEqual:"))
      goto LABEL_18;
  }
  bootUUID = self->_bootUUID;
  if ((unint64_t)bootUUID | *((_QWORD *)v4 + 1))
    v9 = -[NSString isEqual:](bootUUID, "isEqual:");
  else
    v9 = 1;
LABEL_19:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_starting;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_client, "hash") ^ v3;
  v5 = -[NSString hash](self->_identifier, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_useCase, "hash");
  return v6 ^ -[NSString hash](self->_bootUUID, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  _BYTE *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BYTE *v8;

  v3 = a2;
  if (a1)
  {
    if ((v3[44] & 1) != 0)
    {
      *(_BYTE *)(a1 + 40) = v3[40];
      *(_BYTE *)(a1 + 44) |= 1u;
    }
    v4 = (void *)*((_QWORD *)v3 + 2);
    v8 = v3;
    if (v4)
    {
      objc_storeStrong((id *)(a1 + 16), v4);
      v3 = v8;
    }
    v5 = (void *)*((_QWORD *)v3 + 3);
    if (v5)
    {
      objc_storeStrong((id *)(a1 + 24), v5);
      v3 = v8;
    }
    v6 = (void *)*((_QWORD *)v3 + 4);
    if (v6)
    {
      objc_storeStrong((id *)(a1 + 32), v6);
      v3 = v8;
    }
    v7 = (void *)*((_QWORD *)v3 + 1);
    if (v7)
    {
      objc_storeStrong((id *)(a1 + 8), v7);
      v3 = v8;
    }
  }

}

- (BOOL)starting
{
  if (result)
    return *(_BYTE *)(result + 40) != 0;
  return result;
}

- (uint64_t)client
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)identifier
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)useCase
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (uint64_t)bootUUID
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_bootUUID, 0);
}

@end
