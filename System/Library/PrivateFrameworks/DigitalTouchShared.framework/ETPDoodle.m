@implementation ETPDoodle

- (void)setDoodleCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_doodleCount = a3;
}

- (void)setHasDoodleCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDoodleCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDoodleData
{
  return self->_doodleData != 0;
}

- (BOOL)hasColorData
{
  return self->_colorData != 0;
}

- (BOOL)hasPointTimeDeltaData
{
  return self->_pointTimeDeltaData != 0;
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
  v8.super_class = (Class)ETPDoodle;
  -[ETPDoodle description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETPDoodle dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *doodleData;
  NSData *colorData;
  NSData *pointTimeDeltaData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_doodleCount);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("doodleCount"));

  }
  doodleData = self->_doodleData;
  if (doodleData)
    objc_msgSend(v3, "setObject:forKey:", doodleData, CFSTR("doodleData"));
  colorData = self->_colorData;
  if (colorData)
    objc_msgSend(v3, "setObject:forKey:", colorData, CFSTR("colorData"));
  pointTimeDeltaData = self->_pointTimeDeltaData;
  if (pointTimeDeltaData)
    objc_msgSend(v3, "setObject:forKey:", pointTimeDeltaData, CFSTR("pointTimeDeltaData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ETPDoodleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_doodleData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_colorData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_pointTimeDeltaData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_doodleCount;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_doodleData, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[NSData copyWithZone:](self->_colorData, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  v11 = -[NSData copyWithZone:](self->_pointTimeDeltaData, "copyWithZone:", a3);
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *doodleData;
  NSData *colorData;
  NSData *pointTimeDeltaData;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_doodleCount != *((_DWORD *)v4 + 4))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  doodleData = self->_doodleData;
  if ((unint64_t)doodleData | *((_QWORD *)v4 + 3) && !-[NSData isEqual:](doodleData, "isEqual:"))
    goto LABEL_13;
  colorData = self->_colorData;
  if ((unint64_t)colorData | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](colorData, "isEqual:"))
      goto LABEL_13;
  }
  pointTimeDeltaData = self->_pointTimeDeltaData;
  if ((unint64_t)pointTimeDeltaData | *((_QWORD *)v4 + 4))
    v8 = -[NSData isEqual:](pointTimeDeltaData, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_doodleCount;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_doodleData, "hash") ^ v3;
  v5 = -[NSData hash](self->_colorData, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_pointTimeDeltaData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[10] & 1) != 0)
  {
    self->_doodleCount = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[ETPDoodle setDoodleData:](self, "setDoodleData:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ETPDoodle setColorData:](self, "setColorData:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ETPDoodle setPointTimeDeltaData:](self, "setPointTimeDeltaData:");
    v4 = v5;
  }

}

- (unsigned)doodleCount
{
  return self->_doodleCount;
}

- (NSData)doodleData
{
  return self->_doodleData;
}

- (void)setDoodleData:(id)a3
{
  objc_storeStrong((id *)&self->_doodleData, a3);
}

- (NSData)colorData
{
  return self->_colorData;
}

- (void)setColorData:(id)a3
{
  objc_storeStrong((id *)&self->_colorData, a3);
}

- (NSData)pointTimeDeltaData
{
  return self->_pointTimeDeltaData;
}

- (void)setPointTimeDeltaData:(id)a3
{
  objc_storeStrong((id *)&self->_pointTimeDeltaData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointTimeDeltaData, 0);
  objc_storeStrong((id *)&self->_doodleData, 0);
  objc_storeStrong((id *)&self->_colorData, 0);
}

@end
