@implementation NTPBCohortMembership

- (void)dealloc
{
  objc_super v3;

  -[NTPBCohortMembership setTagID:](self, "setTagID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBCohortMembership;
  -[NTPBCohortMembership dealloc](&v3, sel_dealloc);
}

- (BOOL)hasTagID
{
  return self->_tagID != 0;
}

- (void)setScore:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBCohortMembership;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBCohortMembership description](&v3, sel_description), -[NTPBCohortMembership dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *tagID;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  tagID = self->_tagID;
  if (tagID)
    objc_msgSend(v3, "setObject:forKey:", tagID, CFSTR("tag_ID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_score), CFSTR("score"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBCohortMembershipReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_tagID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 16) = -[NSString copyWithZone:](self->_tagID, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_score;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *tagID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    tagID = self->_tagID;
    if (!((unint64_t)tagID | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](tagID, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 1) == 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 1) != 0 && self->_score == *((double *)a3 + 1);
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  double score;
  double v6;
  long double v7;
  double v8;

  v3 = -[NSString hash](self->_tagID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    score = self->_score;
    v6 = -score;
    if (score >= 0.0)
      v6 = self->_score;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 2))
    -[NTPBCohortMembership setTagID:](self, "setTagID:");
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
  {
    self->_score = *((double *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)tagID
{
  return self->_tagID;
}

- (void)setTagID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (double)score
{
  return self->_score;
}

@end
