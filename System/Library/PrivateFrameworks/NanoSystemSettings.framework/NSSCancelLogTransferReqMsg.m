@implementation NSSCancelLogTransferReqMsg

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NSSCancelLogTransferReqMsg;
  -[NSSCancelLogTransferReqMsg description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSCancelLogTransferReqMsg dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *logFilePath;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  logFilePath = self->_logFilePath;
  if (logFilePath)
    objc_msgSend(v3, "setObject:forKey:", logFilePath, CFSTR("logFilePath"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSCancelLogTransferReqMsgReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  objc_msgSend(a3, "setLogFilePath:", self->_logFilePath);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_logFilePath, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *logFilePath;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    logFilePath = self->_logFilePath;
    if ((unint64_t)logFilePath | v4[1])
      v6 = -[NSString isEqual:](logFilePath, "isEqual:");
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
  return -[NSString hash](self->_logFilePath, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[NSSCancelLogTransferReqMsg setLogFilePath:](self, "setLogFilePath:");
}

- (NSString)logFilePath
{
  return self->_logFilePath;
}

- (void)setLogFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_logFilePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logFilePath, 0);
}

@end
