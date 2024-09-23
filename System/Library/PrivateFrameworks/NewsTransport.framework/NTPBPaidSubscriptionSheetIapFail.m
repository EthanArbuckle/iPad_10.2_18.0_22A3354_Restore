@implementation NTPBPaidSubscriptionSheetIapFail

- (BOOL)hasFailedIapId
{
  return self->_failedIapId != 0;
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
  v8.super_class = (Class)NTPBPaidSubscriptionSheetIapFail;
  -[NTPBPaidSubscriptionSheetIapFail description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBPaidSubscriptionSheetIapFail dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *articleId;
  NSString *sourceChannelId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  failedIapId = self->_failedIapId;
  if (failedIapId)
    objc_msgSend(v3, "setObject:forKey:", failedIapId, CFSTR("failed_iap_id"));
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
  return NTPBPaidSubscriptionSheetIapFailReadFrom((uint64_t)self, (uint64_t)a3);
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
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_failedIapId, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *failedIapId;
  NSString *articleId;
  NSString *sourceChannelId;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((failedIapId = self->_failedIapId, !((unint64_t)failedIapId | v4[2]))
     || -[NSString isEqual:](failedIapId, "isEqual:"))
    && ((articleId = self->_articleId, !((unint64_t)articleId | v4[1]))
     || -[NSString isEqual:](articleId, "isEqual:")))
  {
    sourceChannelId = self->_sourceChannelId;
    if ((unint64_t)sourceChannelId | v4[3])
      v8 = -[NSString isEqual:](sourceChannelId, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_failedIapId, "hash");
  v4 = -[NSString hash](self->_articleId, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_sourceChannelId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[NTPBPaidSubscriptionSheetIapFail setFailedIapId:](self, "setFailedIapId:");
  if (v4[1])
    -[NTPBPaidSubscriptionSheetIapFail setArticleId:](self, "setArticleId:");
  if (v4[3])
    -[NTPBPaidSubscriptionSheetIapFail setSourceChannelId:](self, "setSourceChannelId:");

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
