@implementation BLTPBAddBulletinSummaryRequest

- (BOOL)hasBulletin
{
  return self->_bulletin != 0;
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
  v8.super_class = (Class)BLTPBAddBulletinSummaryRequest;
  -[BLTPBAddBulletinSummaryRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBAddBulletinSummaryRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  BLTPBBulletinSummary *bulletin;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  bulletin = self->_bulletin;
  if (bulletin)
  {
    -[BLTPBBulletinSummary dictionaryRepresentation](bulletin, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("bulletin"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBAddBulletinSummaryRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_bulletin)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  BLTPBBulletinSummary *bulletin;

  bulletin = self->_bulletin;
  if (bulletin)
    objc_msgSend(a3, "setBulletin:", bulletin);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[BLTPBBulletinSummary copyWithZone:](self->_bulletin, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BLTPBBulletinSummary *bulletin;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    bulletin = self->_bulletin;
    if ((unint64_t)bulletin | v4[1])
      v6 = -[BLTPBBulletinSummary isEqual:](bulletin, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[BLTPBBulletinSummary hash](self->_bulletin, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  BLTPBBulletinSummary *bulletin;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  bulletin = self->_bulletin;
  v6 = v4[1];
  if (bulletin)
  {
    if (v6)
    {
      v7 = v4;
      -[BLTPBBulletinSummary mergeFrom:](bulletin, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[BLTPBAddBulletinSummaryRequest setBulletin:](self, "setBulletin:");
    goto LABEL_6;
  }

}

- (BLTPBBulletinSummary)bulletin
{
  return self->_bulletin;
}

- (void)setBulletin:(id)a3
{
  objc_storeStrong((id *)&self->_bulletin, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletin, 0);
}

@end
