@implementation HMPBNaturalLightingAction

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setNaturalLightingEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_naturalLightingEnabled = a3;
}

- (void)setHasNaturalLightingEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNaturalLightingEnabled
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLightProfileUUID
{
  return self->_lightProfileUUID != 0;
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
  v8.super_class = (Class)HMPBNaturalLightingAction;
  -[HMPBNaturalLightingAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPBNaturalLightingAction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *uuid;
  void *v6;
  NSData *lightProfileUUID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_naturalLightingEnabled);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("naturalLightingEnabled"));

  }
  lightProfileUUID = self->_lightProfileUUID;
  if (lightProfileUUID)
    objc_msgSend(v4, "setObject:forKey:", lightProfileUUID, CFSTR("lightProfileUUID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMPBNaturalLightingActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_lightProfileUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_naturalLightingEnabled;
    v4[28] |= 1u;
  }
  if (self->_lightProfileUUID)
  {
    objc_msgSend(v5, "setLightProfileUUID:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_naturalLightingEnabled;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v8 = -[NSData copyWithZone:](self->_lightProfileUUID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *uuid;
  char v6;
  NSData *lightProfileUUID;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
      goto LABEL_8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0)
    {
      if (self->_naturalLightingEnabled)
      {
        if (*((_BYTE *)v4 + 24))
          goto LABEL_14;
      }
      else if (!*((_BYTE *)v4 + 24))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
    goto LABEL_8;
LABEL_14:
  lightProfileUUID = self->_lightProfileUUID;
  if ((unint64_t)lightProfileUUID | *((_QWORD *)v4 + 1))
    v6 = -[NSData isEqual:](lightProfileUUID, "isEqual:");
  else
    v6 = 1;
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_uuid, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_naturalLightingEnabled;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSData hash](self->_lightProfileUUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[HMPBNaturalLightingAction setUuid:](self, "setUuid:");
    v4 = v5;
  }
  if (v4[28])
  {
    self->_naturalLightingEnabled = v4[24];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[HMPBNaturalLightingAction setLightProfileUUID:](self, "setLightProfileUUID:");
    v4 = v5;
  }

}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (BOOL)naturalLightingEnabled
{
  return self->_naturalLightingEnabled;
}

- (NSData)lightProfileUUID
{
  return self->_lightProfileUUID;
}

- (void)setLightProfileUUID:(id)a3
{
  objc_storeStrong((id *)&self->_lightProfileUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_lightProfileUUID, 0);
}

@end
