@implementation NTPBHeadlineBackingElement

- (BOOL)hasArticleRecordData
{
  return self->_articleRecordData != 0;
}

- (BOOL)hasSourceChannelRecordData
{
  return self->_sourceChannelRecordData != 0;
}

- (BOOL)hasParentIssueRecordData
{
  return self->_parentIssueRecordData != 0;
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
  v8.super_class = (Class)NTPBHeadlineBackingElement;
  -[NTPBHeadlineBackingElement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBHeadlineBackingElement dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *articleRecordData;
  NSData *sourceChannelRecordData;
  NSData *parentIssueRecordData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  articleRecordData = self->_articleRecordData;
  if (articleRecordData)
    objc_msgSend(v3, "setObject:forKey:", articleRecordData, CFSTR("article_record_data"));
  sourceChannelRecordData = self->_sourceChannelRecordData;
  if (sourceChannelRecordData)
    objc_msgSend(v4, "setObject:forKey:", sourceChannelRecordData, CFSTR("source_channel_record_data"));
  parentIssueRecordData = self->_parentIssueRecordData;
  if (parentIssueRecordData)
    objc_msgSend(v4, "setObject:forKey:", parentIssueRecordData, CFSTR("parent_issue_record_data"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBHeadlineBackingElementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_articleRecordData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_sourceChannelRecordData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_parentIssueRecordData)
  {
    PBDataWriterWriteDataField();
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
  v6 = -[NSData copyWithZone:](self->_articleRecordData, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_sourceChannelRecordData, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSData copyWithZone:](self->_parentIssueRecordData, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *articleRecordData;
  NSData *sourceChannelRecordData;
  NSData *parentIssueRecordData;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((articleRecordData = self->_articleRecordData, !((unint64_t)articleRecordData | v4[1]))
     || -[NSData isEqual:](articleRecordData, "isEqual:"))
    && ((sourceChannelRecordData = self->_sourceChannelRecordData, !((unint64_t)sourceChannelRecordData | v4[3]))
     || -[NSData isEqual:](sourceChannelRecordData, "isEqual:")))
  {
    parentIssueRecordData = self->_parentIssueRecordData;
    if ((unint64_t)parentIssueRecordData | v4[2])
      v8 = -[NSData isEqual:](parentIssueRecordData, "isEqual:");
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
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_articleRecordData, "hash");
  v4 = -[NSData hash](self->_sourceChannelRecordData, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_parentIssueRecordData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[NTPBHeadlineBackingElement setArticleRecordData:](self, "setArticleRecordData:");
  if (v4[3])
    -[NTPBHeadlineBackingElement setSourceChannelRecordData:](self, "setSourceChannelRecordData:");
  if (v4[2])
    -[NTPBHeadlineBackingElement setParentIssueRecordData:](self, "setParentIssueRecordData:");

}

- (NSData)articleRecordData
{
  return self->_articleRecordData;
}

- (void)setArticleRecordData:(id)a3
{
  objc_storeStrong((id *)&self->_articleRecordData, a3);
}

- (NSData)sourceChannelRecordData
{
  return self->_sourceChannelRecordData;
}

- (void)setSourceChannelRecordData:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelRecordData, a3);
}

- (NSData)parentIssueRecordData
{
  return self->_parentIssueRecordData;
}

- (void)setParentIssueRecordData:(id)a3
{
  objc_storeStrong((id *)&self->_parentIssueRecordData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelRecordData, 0);
  objc_storeStrong((id *)&self->_parentIssueRecordData, 0);
  objc_storeStrong((id *)&self->_articleRecordData, 0);
}

@end
