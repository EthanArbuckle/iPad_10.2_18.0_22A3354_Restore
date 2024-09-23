@implementation NTPBIssueExposureData

- (BOOL)hasIssueSessionId
{
  return self->_issueSessionId != 0;
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
  v8.super_class = (Class)NTPBIssueExposureData;
  -[NTPBIssueExposureData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBIssueExposureData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *issueSessionId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  issueSessionId = self->_issueSessionId;
  if (issueSessionId)
    objc_msgSend(v3, "setObject:forKey:", issueSessionId, CFSTR("issue_session_id"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBIssueExposureDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_issueSessionId)
    PBDataWriterWriteDataField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_issueSessionId, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *issueSessionId;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    issueSessionId = self->_issueSessionId;
    if ((unint64_t)issueSessionId | v4[1])
      v6 = -[NSData isEqual:](issueSessionId, "isEqual:");
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
  return -[NSData hash](self->_issueSessionId, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[NTPBIssueExposureData setIssueSessionId:](self, "setIssueSessionId:");
}

- (NSData)issueSessionId
{
  return self->_issueSessionId;
}

- (void)setIssueSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_issueSessionId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issueSessionId, 0);
}

@end
