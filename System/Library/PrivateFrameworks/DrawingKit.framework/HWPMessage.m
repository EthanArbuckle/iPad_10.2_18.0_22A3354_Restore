@implementation HWPMessage

- (unsigned)version
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_version;
  else
    return 1;
}

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCreationDate:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasDrawing
{
  return self->_drawing != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)HWPMessage;
  -[HWPMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HWPMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSString *identifier;
  NSData *drawing;
  PBUnknownFields *unknownFields;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_version);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_creationDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("creationDate"));

  }
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  drawing = self->_drawing;
  if (drawing)
    objc_msgSend(v3, "setObject:forKey:", drawing, CFSTR("drawing"));
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HWPMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteSfixed64Field();
    v4 = v6;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_drawing)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[10] = self->_version;
    *((_BYTE *)v4 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_creationDate;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  v6 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v6;
  }
  if (self->_drawing)
  {
    objc_msgSend(v6, "setDrawing:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_version;
    *(_BYTE *)(v5 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_creationDate;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v8;

  v10 = -[NSData copyWithZone:](self->_drawing, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v10;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSData *drawing;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_version != *((_DWORD *)v4 + 10))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_creationDate != *((_QWORD *)v4 + 2))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_16;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](identifier, "isEqual:"))
    goto LABEL_16;
  drawing = self->_drawing;
  if ((unint64_t)drawing | *((_QWORD *)v4 + 3))
    v7 = -[NSData isEqual:](drawing, "isEqual:");
  else
    v7 = 1;
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_version;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_creationDate;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSString hash](self->_identifier, "hash");
  return v5 ^ -[NSData hash](self->_drawing, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 44);
  }
  if ((v5 & 1) != 0)
  {
    self->_creationDate = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[HWPMessage setIdentifier:](self, "setIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[HWPMessage setDrawing:](self, "setDrawing:");
    v4 = v6;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (int64_t)creationDate
{
  return self->_creationDate;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSData)drawing
{
  return self->_drawing;
}

- (void)setDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_drawing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
