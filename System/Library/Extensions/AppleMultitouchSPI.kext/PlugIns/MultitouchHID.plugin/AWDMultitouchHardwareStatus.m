@implementation AWDMultitouchHardwareStatus

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDMultitouchHardwareStatus;
  -[AWDMultitouchHardwareStatus dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)openRowsCount
{
  return self->_openRows.count;
}

- (unsigned)openRows
{
  return self->_openRows.list;
}

- (void)clearOpenRows
{
  PBRepeatedUInt32Clear();
}

- (void)addOpenRows:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)openRowsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_openRows;
  unint64_t count;

  p_openRows = &self->_openRows;
  count = self->_openRows.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count), 0), "raise");
  return p_openRows->list[a3];
}

- (void)setOpenRows:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDMultitouchHardwareStatus;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDMultitouchHardwareStatus description](&v3, sel_description), -[AWDMultitouchHardwareStatus dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("openRows"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMultitouchHardwareStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_openRows;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  p_openRows = &self->_openRows;
  if (p_openRows->count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < p_openRows->count);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_timestamp;
    *((_BYTE *)a3 + 40) |= 1u;
  }
  if (-[AWDMultitouchHardwareStatus openRowsCount](self, "openRowsCount"))
  {
    objc_msgSend(a3, "clearOpenRows");
    v5 = -[AWDMultitouchHardwareStatus openRowsCount](self, "openRowsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addOpenRows:", -[AWDMultitouchHardwareStatus openRowsAtIndex:](self, "openRowsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v4 + 32) = self->_timestamp;
    *(_BYTE *)(v4 + 40) |= 1u;
  }
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (!objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
    return 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 4))
      return 0;
    return PBRepeatedUInt32IsEqual();
  }
  if ((*((_BYTE *)a3 + 40) & 1) == 0)
    return PBRepeatedUInt32IsEqual();
  return 0;
}

- (unint64_t)hash
{
  unint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761u * self->_timestamp;
  else
    v2 = 0;
  return PBRepeatedUInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;

  if ((*((_BYTE *)a3 + 40) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = objc_msgSend(a3, "openRowsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[AWDMultitouchHardwareStatus addOpenRows:](self, "addOpenRows:", objc_msgSend(a3, "openRowsAtIndex:", i));
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end
