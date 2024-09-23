@implementation NTPBDate

- (double)timeIntervalSince1970
{
  return self->_timeIntervalSince1970;
}

- (void)setTimeIntervalSince1970:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timeIntervalSince1970 = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_timeIntervalSince1970;
    *((_BYTE *)result + 16) |= 1u;
  }
  return result;
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
}

- (void)setHasTimeIntervalSince1970:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeIntervalSince1970
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBDate;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBDate description](&v3, sel_description), -[NTPBDate dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timeIntervalSince1970), CFSTR("timeIntervalSince1970"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBDateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    LOBYTE(v5) = (*((_BYTE *)a3 + 16) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      LOBYTE(v5) = (*((_BYTE *)a3 + 16) & 1) != 0 && self->_timeIntervalSince1970 == *((double *)a3 + 1);
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t result;
  double timeIntervalSince1970;
  double v4;
  long double v5;
  double v6;

  if ((*(_BYTE *)&self->_has & 1) == 0)
    return 0;
  timeIntervalSince1970 = self->_timeIntervalSince1970;
  v4 = -timeIntervalSince1970;
  if (timeIntervalSince1970 >= 0.0)
    v4 = self->_timeIntervalSince1970;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  result = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0)
      result += (unint64_t)v6;
  }
  else
  {
    result -= (unint64_t)fabs(v6);
  }
  return result;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 16) & 1) != 0)
  {
    self->_timeIntervalSince1970 = *((double *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

@end
