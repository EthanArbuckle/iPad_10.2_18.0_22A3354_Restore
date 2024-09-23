@implementation HMPBMetadataCategory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidStr, 0);
  objc_storeStrong((id *)&self->_catDescription, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uuidStr)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_catDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

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
  v8.super_class = (Class)HMPBMetadataCategory;
  -[HMPBMetadataCategory description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPBMetadataCategory dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuidStr;
  NSString *catDescription;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuidStr = self->_uuidStr;
  if (uuidStr)
    objc_msgSend(v3, "setObject:forKey:", uuidStr, CFSTR("uuidStr"));
  catDescription = self->_catDescription;
  if (catDescription)
    objc_msgSend(v4, "setObject:forKey:", catDescription, CFSTR("catDescription"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_identifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("identifier"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMPBMetadataCategoryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuidStr, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_catDescription, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_identifier;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uuidStr;
  NSString *catDescription;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  uuidStr = self->_uuidStr;
  if ((unint64_t)uuidStr | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](uuidStr, "isEqual:"))
      goto LABEL_10;
  }
  catDescription = self->_catDescription;
  if ((unint64_t)catDescription | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](catDescription, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_identifier == *((_DWORD *)v4 + 4))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_uuidStr, "hash");
  v4 = -[NSString hash](self->_catDescription, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_identifier;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

@end
