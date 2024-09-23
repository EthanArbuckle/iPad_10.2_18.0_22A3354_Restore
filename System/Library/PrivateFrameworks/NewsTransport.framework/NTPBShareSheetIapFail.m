@implementation NTPBShareSheetIapFail

- (BOOL)hasFailedIapId
{
  return self->_failedIapId != 0;
}

- (int)failureReason
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_failureReason;
  else
    return 0;
}

- (void)setFailureReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_failureReason = a3;
}

- (void)setHasFailureReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFailureReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
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
  v8.super_class = (Class)NTPBShareSheetIapFail;
  -[NTPBShareSheetIapFail description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBShareSheetIapFail dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *failedIapId;
  void *v6;
  NSString *articleId;
  NSString *sourceChannelId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  failedIapId = self->_failedIapId;
  if (failedIapId)
    objc_msgSend(v3, "setObject:forKey:", failedIapId, CFSTR("failed_iap_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_failureReason);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("failure_reason"));

  }
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v4, "setObject:forKey:", articleId, CFSTR("article_id"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v4, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBShareSheetIapFailReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_failedIapId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_failedIapId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_failureReason;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *failedIapId;
  NSString *articleId;
  NSString *sourceChannelId;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  failedIapId = self->_failedIapId;
  if ((unint64_t)failedIapId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](failedIapId, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_failureReason != *((_DWORD *)v4 + 6))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 1) && !-[NSString isEqual:](articleId, "isEqual:"))
    goto LABEL_13;
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 4))
    v8 = -[NSString isEqual:](sourceChannelId, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_failedIapId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_failureReason;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSString hash](self->_articleId, "hash");
  return v5 ^ v6 ^ -[NSString hash](self->_sourceChannelId, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBShareSheetIapFail setFailedIapId:](self, "setFailedIapId:");
    v4 = v5;
  }
  if ((v4[10] & 1) != 0)
  {
    self->_failureReason = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NTPBShareSheetIapFail setArticleId:](self, "setArticleId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBShareSheetIapFail setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v5;
  }

}

- (NSString)failedIapId
{
  return self->_failedIapId;
}

- (void)setFailedIapId:(id)a3
{
  objc_storeStrong((id *)&self->_failedIapId, a3);
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_articleId, a3);
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_failedIapId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
