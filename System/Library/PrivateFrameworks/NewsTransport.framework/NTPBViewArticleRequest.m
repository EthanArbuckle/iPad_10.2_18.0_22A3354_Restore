@implementation NTPBViewArticleRequest

- (BOOL)hasWebPageUri
{
  return self->_webPageUri != 0;
}

- (BOOL)hasFeedUri
{
  return self->_feedUri != 0;
}

- (BOOL)hasStoreFrontId
{
  return self->_storeFrontId != 0;
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
  v8.super_class = (Class)NTPBViewArticleRequest;
  -[NTPBViewArticleRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBViewArticleRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *webPageUri;
  NSString *feedUri;
  NSString *storeFrontId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  webPageUri = self->_webPageUri;
  if (webPageUri)
    objc_msgSend(v3, "setObject:forKey:", webPageUri, CFSTR("web_page_uri"));
  feedUri = self->_feedUri;
  if (feedUri)
    objc_msgSend(v4, "setObject:forKey:", feedUri, CFSTR("feed_uri"));
  storeFrontId = self->_storeFrontId;
  if (storeFrontId)
    objc_msgSend(v4, "setObject:forKey:", storeFrontId, CFSTR("store_front_id"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBViewArticleRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_webPageUri)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_feedUri)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_storeFrontId)
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
  v6 = -[NSString copyWithZone:](self->_webPageUri, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_feedUri, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_storeFrontId, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *webPageUri;
  NSString *feedUri;
  NSString *storeFrontId;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((webPageUri = self->_webPageUri, !((unint64_t)webPageUri | v4[3]))
     || -[NSString isEqual:](webPageUri, "isEqual:"))
    && ((feedUri = self->_feedUri, !((unint64_t)feedUri | v4[1]))
     || -[NSString isEqual:](feedUri, "isEqual:")))
  {
    storeFrontId = self->_storeFrontId;
    if ((unint64_t)storeFrontId | v4[2])
      v8 = -[NSString isEqual:](storeFrontId, "isEqual:");
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

  v3 = -[NSString hash](self->_webPageUri, "hash");
  v4 = -[NSString hash](self->_feedUri, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_storeFrontId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[NTPBViewArticleRequest setWebPageUri:](self, "setWebPageUri:");
  if (v4[1])
    -[NTPBViewArticleRequest setFeedUri:](self, "setFeedUri:");
  if (v4[2])
    -[NTPBViewArticleRequest setStoreFrontId:](self, "setStoreFrontId:");

}

- (NSString)webPageUri
{
  return self->_webPageUri;
}

- (void)setWebPageUri:(id)a3
{
  objc_storeStrong((id *)&self->_webPageUri, a3);
}

- (NSString)feedUri
{
  return self->_feedUri;
}

- (void)setFeedUri:(id)a3
{
  objc_storeStrong((id *)&self->_feedUri, a3);
}

- (NSString)storeFrontId
{
  return self->_storeFrontId;
}

- (void)setStoreFrontId:(id)a3
{
  objc_storeStrong((id *)&self->_storeFrontId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webPageUri, 0);
  objc_storeStrong((id *)&self->_storeFrontId, 0);
  objc_storeStrong((id *)&self->_feedUri, 0);
}

@end
