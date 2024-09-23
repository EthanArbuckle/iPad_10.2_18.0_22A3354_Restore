@implementation NTPBPersonalizationInstanceHistory

- (void)dealloc
{
  objc_super v3;

  -[NTPBPersonalizationInstanceHistory setInstanceIdentifier:](self, "setInstanceIdentifier:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationInstanceHistory;
  -[NTPBPersonalizationInstanceHistory dealloc](&v3, sel_dealloc);
}

- (BOOL)hasInstanceIdentifier
{
  return self->_instanceIdentifier != 0;
}

- (void)setLastChangeNumber:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_lastChangeNumber = a3;
}

- (void)setHasLastChangeNumber:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastChangeNumber
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationInstanceHistory;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBPersonalizationInstanceHistory description](&v3, sel_description), -[NTPBPersonalizationInstanceHistory dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *instanceIdentifier;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  instanceIdentifier = self->_instanceIdentifier;
  if (instanceIdentifier)
    objc_msgSend(v3, "setObject:forKey:", instanceIdentifier, CFSTR("instance_identifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lastChangeNumber), CFSTR("last_change_number"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPersonalizationInstanceHistoryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_instanceIdentifier)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 16) = -[NSString copyWithZone:](self->_instanceIdentifier, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_lastChangeNumber;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *instanceIdentifier;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    instanceIdentifier = self->_instanceIdentifier;
    if (!((unint64_t)instanceIdentifier | *((_QWORD *)a3 + 2))
      || (v5 = -[NSString isEqual:](instanceIdentifier, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 1) == 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 1) != 0 && self->_lastChangeNumber == *((_QWORD *)a3 + 1);
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_instanceIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761u * self->_lastChangeNumber;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 2))
    -[NTPBPersonalizationInstanceHistory setInstanceIdentifier:](self, "setInstanceIdentifier:");
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
  {
    self->_lastChangeNumber = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (void)setInstanceIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)lastChangeNumber
{
  return self->_lastChangeNumber;
}

@end
