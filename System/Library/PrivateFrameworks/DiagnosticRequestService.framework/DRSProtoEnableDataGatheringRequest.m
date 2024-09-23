@implementation DRSProtoEnableDataGatheringRequest

- (BOOL)hasRequestDescription
{
  return self->_requestDescription != 0;
}

- (BOOL)hasLogType
{
  return self->_logType != 0;
}

- (void)setIsContinue:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isContinue = a3;
}

- (void)setHasIsContinue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsContinue
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoEnableDataGatheringRequest;
  -[DRSProtoEnableDataGatheringRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoEnableDataGatheringRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  DRSProtoRequestDescription *requestDescription;
  void *v5;
  NSString *logType;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestDescription = self->_requestDescription;
  if (requestDescription)
  {
    -[DRSProtoRequestDescription dictionaryRepresentation](requestDescription, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("request_description"));

  }
  logType = self->_logType;
  if (logType)
    objc_msgSend(v3, "setObject:forKey:", logType, CFSTR("log_type"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isContinue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("is_continue"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoEnableDataGatheringRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestDescription)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_logType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestDescription)
  {
    objc_msgSend(v4, "setRequestDescription:");
    v4 = v5;
  }
  if (self->_logType)
  {
    objc_msgSend(v5, "setLogType:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_isContinue;
    v4[28] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[DRSProtoRequestDescription copyWithZone:](self->_requestDescription, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_logType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_isContinue;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  DRSProtoRequestDescription *requestDescription;
  NSString *logType;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  requestDescription = self->_requestDescription;
  if ((unint64_t)requestDescription | *((_QWORD *)v4 + 2))
  {
    if (!-[DRSProtoRequestDescription isEqual:](requestDescription, "isEqual:"))
      goto LABEL_8;
  }
  logType = self->_logType;
  if ((unint64_t)logType | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](logType, "isEqual:"))
      goto LABEL_8;
  }
  v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      v7 = 0;
      goto LABEL_9;
    }
    if (self->_isContinue)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_8;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_8;
    }
    v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[DRSProtoRequestDescription hash](self->_requestDescription, "hash");
  v4 = -[NSString hash](self->_logType, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_isContinue;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  DRSProtoRequestDescription *requestDescription;
  uint64_t v6;
  id v7;

  v4 = a3;
  requestDescription = self->_requestDescription;
  v6 = *((_QWORD *)v4 + 2);
  v7 = v4;
  if (requestDescription)
  {
    if (!v6)
      goto LABEL_7;
    -[DRSProtoRequestDescription mergeFrom:](requestDescription, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[DRSProtoEnableDataGatheringRequest setRequestDescription:](self, "setRequestDescription:");
  }
  v4 = v7;
LABEL_7:
  if (*((_QWORD *)v4 + 1))
  {
    -[DRSProtoEnableDataGatheringRequest setLogType:](self, "setLogType:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_isContinue = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (DRSProtoRequestDescription)requestDescription
{
  return self->_requestDescription;
}

- (void)setRequestDescription:(id)a3
{
  objc_storeStrong((id *)&self->_requestDescription, a3);
}

- (NSString)logType
{
  return self->_logType;
}

- (void)setLogType:(id)a3
{
  objc_storeStrong((id *)&self->_logType, a3);
}

- (BOOL)isContinue
{
  return self->_isContinue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDescription, 0);
  objc_storeStrong((id *)&self->_logType, 0);
}

@end
