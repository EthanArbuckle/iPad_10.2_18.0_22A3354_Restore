@implementation DRSProtoRapidPayloadReply

- (void)setSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSuccess
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasFailureReason
{
  return self->_failureReason != 0;
}

- (BOOL)hasReplyPayload
{
  return self->_replyPayload != 0;
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
  v8.super_class = (Class)DRSProtoRapidPayloadReply;
  -[DRSProtoRapidPayloadReply description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoRapidPayloadReply dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *failureReason;
  NSData *replyPayload;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_success);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("success"));

  }
  failureReason = self->_failureReason;
  if (failureReason)
    objc_msgSend(v3, "setObject:forKey:", failureReason, CFSTR("failure_reason"));
  replyPayload = self->_replyPayload;
  if (replyPayload)
    objc_msgSend(v3, "setObject:forKey:", replyPayload, CFSTR("reply_payload"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoRapidPayloadReplyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_failureReason)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_replyPayload)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_success;
    v4[28] |= 1u;
  }
  v5 = v4;
  if (self->_failureReason)
  {
    objc_msgSend(v4, "setFailureReason:");
    v4 = v5;
  }
  if (self->_replyPayload)
  {
    objc_msgSend(v5, "setReplyPayload:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_success;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_failureReason, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[NSData copyWithZone:](self->_replyPayload, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *failureReason;
  NSData *replyPayload;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0)
    {
      if (self->_success)
      {
        if (!*((_BYTE *)v4 + 24))
          goto LABEL_14;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_10;
    }
LABEL_14:
    v7 = 0;
    goto LABEL_15;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
    goto LABEL_14;
LABEL_10:
  failureReason = self->_failureReason;
  if ((unint64_t)failureReason | *((_QWORD *)v4 + 1)
    && !-[NSString isEqual:](failureReason, "isEqual:"))
  {
    goto LABEL_14;
  }
  replyPayload = self->_replyPayload;
  if ((unint64_t)replyPayload | *((_QWORD *)v4 + 2))
    v7 = -[NSData isEqual:](replyPayload, "isEqual:");
  else
    v7 = 1;
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_success;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_failureReason, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_replyPayload, "hash");
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((v4[28] & 1) != 0)
  {
    self->_success = v4[24];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[DRSProtoRapidPayloadReply setFailureReason:](self, "setFailureReason:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[DRSProtoRapidPayloadReply setReplyPayload:](self, "setReplyPayload:");
    v4 = v5;
  }

}

- (BOOL)success
{
  return self->_success;
}

- (NSString)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(id)a3
{
  objc_storeStrong((id *)&self->_failureReason, a3);
}

- (NSData)replyPayload
{
  return self->_replyPayload;
}

- (void)setReplyPayload:(id)a3
{
  objc_storeStrong((id *)&self->_replyPayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyPayload, 0);
  objc_storeStrong((id *)&self->_failureReason, 0);
}

@end
