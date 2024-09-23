@implementation MSPTransitStorageShield

- (MSPTransitStorageShield)initWithShield:(id)a3
{
  id v4;
  MSPTransitStorageShield *v5;
  void *v6;
  void *v7;
  MSPTransitStorageShield *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSPTransitStorageShield;
  v5 = -[MSPTransitStorageShield init](&v10, sel_init);
  if (v5)
  {
    -[MSPTransitStorageShield setShieldType:](v5, "setShieldType:", objc_msgSend(v4, "shieldType"));
    objc_msgSend(v4, "shieldText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPTransitStorageShield setShieldText:](v5, "setShieldText:", v6);

    objc_msgSend(v4, "shieldColorString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPTransitStorageShield setShieldColorString:](v5, "setShieldColorString:", v7);

    v8 = v5;
  }

  return v5;
}

- (BOOL)hasShieldText
{
  return self->_shieldText != 0;
}

- (void)setShieldType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_shieldType = a3;
}

- (void)setHasShieldType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShieldType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasShieldColorString
{
  return self->_shieldColorString != 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageShield;
  -[MSPTransitStorageShield description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPTransitStorageShield dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *shieldText;
  void *v6;
  NSString *shieldColorString;
  PBUnknownFields *unknownFields;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  shieldText = self->_shieldText;
  if (shieldText)
    objc_msgSend(v3, "setObject:forKey:", shieldText, CFSTR("shield_text"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_shieldType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("shield_type"));

  }
  shieldColorString = self->_shieldColorString;
  if (shieldColorString)
    objc_msgSend(v4, "setObject:forKey:", shieldColorString, CFSTR("shield_color_string"));
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MSPTransitStorageShieldReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_shieldText)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_shieldColorString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_shieldText)
  {
    objc_msgSend(v4, "setShieldText:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_shieldType;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_shieldColorString)
  {
    objc_msgSend(v5, "setShieldColorString:");
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
  v6 = -[NSString copyWithZone:](self->_shieldText, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_shieldType;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_shieldColorString, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *shieldText;
  NSString *shieldColorString;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  shieldText = self->_shieldText;
  if ((unint64_t)shieldText | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](shieldText, "isEqual:"))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_shieldType != *((_QWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  shieldColorString = self->_shieldColorString;
  if ((unint64_t)shieldColorString | *((_QWORD *)v4 + 3))
    v7 = -[NSString isEqual:](shieldColorString, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_shieldText, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_shieldType;
  else
    v4 = 0;
  return v4 ^ -[NSString hash](self->_shieldColorString, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int64_t *v4;
  int64_t *v5;

  v4 = (int64_t *)a3;
  v5 = v4;
  if (v4[4])
  {
    -[MSPTransitStorageShield setShieldText:](self, "setShieldText:");
    v4 = v5;
  }
  if ((v4[5] & 1) != 0)
  {
    self->_shieldType = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[3])
  {
    -[MSPTransitStorageShield setShieldColorString:](self, "setShieldColorString:");
    v4 = v5;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)shieldText
{
  return self->_shieldText;
}

- (void)setShieldText:(id)a3
{
  objc_storeStrong((id *)&self->_shieldText, a3);
}

- (int64_t)shieldType
{
  return self->_shieldType;
}

- (NSString)shieldColorString
{
  return self->_shieldColorString;
}

- (void)setShieldColorString:(id)a3
{
  objc_storeStrong((id *)&self->_shieldColorString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shieldText, 0);
  objc_storeStrong((id *)&self->_shieldColorString, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
