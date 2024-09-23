@implementation BLTPBThreadMuteAssertion

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)BLTPBThreadMuteAssertion;
  -[BLTPBThreadMuteAssertion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBThreadMuteAssertion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *threadID;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_expirationDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("expirationDate"));

  threadID = self->_threadID;
  if (threadID)
    objc_msgSend(v3, "setObject:forKey:", threadID, CFSTR("threadID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBThreadMuteAssertionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteDoubleField();
  if (!self->_threadID)
    -[BLTPBThreadMuteAssertion writeTo:].cold.1();
  PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_expirationDate;
  objc_msgSend(a3, "setThreadID:", self->_threadID);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 8) = self->_expirationDate;
  v6 = -[NSString copyWithZone:](self->_threadID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *threadID;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_expirationDate == *((double *)v4 + 1))
  {
    threadID = self->_threadID;
    if ((unint64_t)threadID | v4[2])
      v6 = -[NSString isEqual:](threadID, "isEqual:");
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
  double expirationDate;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  expirationDate = self->_expirationDate;
  v4 = -expirationDate;
  if (expirationDate >= 0.0)
    v4 = self->_expirationDate;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  return -[NSString hash](self->_threadID, "hash") ^ v11;
}

- (void)mergeFrom:(id)a3
{
  self->_expirationDate = *((double *)a3 + 1);
  if (*((_QWORD *)a3 + 2))
    -[BLTPBThreadMuteAssertion setThreadID:](self, "setThreadID:");
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(double)a3
{
  self->_expirationDate = a3;
}

- (NSString)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(id)a3
{
  objc_storeStrong((id *)&self->_threadID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadID, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[BLTPBThreadMuteAssertion writeTo:]", "BLTPBThreadMuteAssertion.m", 83, "nil != self->_threadID");
}

@end
