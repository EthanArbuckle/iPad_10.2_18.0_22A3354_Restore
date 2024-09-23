@implementation _CPIndexStateForFeedback

- (BOOL)readFrom:(id)a3
{
  return _CPIndexStateForFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_CPIndexStateForFeedback percentMessagesIndexed](self, "percentMessagesIndexed"))
    PBDataWriterWriteInt32Field();
  if (-[_CPIndexStateForFeedback percentAttachmentsIndexed](self, "percentAttachmentsIndexed"))
    PBDataWriterWriteInt32Field();
  if (-[_CPIndexStateForFeedback searchIndex](self, "searchIndex"))
    PBDataWriterWriteInt32Field();
  if (-[_CPIndexStateForFeedback totalMessageCount](self, "totalMessageCount"))
    PBDataWriterWriteInt32Field();
  v4 = -[_CPIndexStateForFeedback indexedMessageCount](self, "indexedMessageCount");
  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteInt32Field();
    v5 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int percentMessagesIndexed;
  int percentAttachmentsIndexed;
  int searchIndex;
  int totalMessageCount;
  int indexedMessageCount;
  BOOL v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (percentMessagesIndexed = self->_percentMessagesIndexed,
        percentMessagesIndexed == objc_msgSend(v4, "percentMessagesIndexed"))
    && (percentAttachmentsIndexed = self->_percentAttachmentsIndexed,
        percentAttachmentsIndexed == objc_msgSend(v4, "percentAttachmentsIndexed"))
    && (searchIndex = self->_searchIndex, searchIndex == objc_msgSend(v4, "searchIndex"))
    && (totalMessageCount = self->_totalMessageCount,
        totalMessageCount == objc_msgSend(v4, "totalMessageCount")))
  {
    indexedMessageCount = self->_indexedMessageCount;
    v10 = indexedMessageCount == objc_msgSend(v4, "indexedMessageCount");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  return (2654435761 * self->_percentAttachmentsIndexed) ^ (2654435761 * self->_percentMessagesIndexed) ^ (2654435761 * self->_searchIndex) ^ (2654435761 * self->_totalMessageCount) ^ (2654435761 * self->_indexedMessageCount);
}

- (int)percentMessagesIndexed
{
  return self->_percentMessagesIndexed;
}

- (void)setPercentMessagesIndexed:(int)a3
{
  self->_percentMessagesIndexed = a3;
}

- (int)percentAttachmentsIndexed
{
  return self->_percentAttachmentsIndexed;
}

- (void)setPercentAttachmentsIndexed:(int)a3
{
  self->_percentAttachmentsIndexed = a3;
}

- (int)searchIndex
{
  return self->_searchIndex;
}

- (void)setSearchIndex:(int)a3
{
  self->_searchIndex = a3;
}

- (int)totalMessageCount
{
  return self->_totalMessageCount;
}

- (void)setTotalMessageCount:(int)a3
{
  self->_totalMessageCount = a3;
}

- (int)indexedMessageCount
{
  return self->_indexedMessageCount;
}

- (void)setIndexedMessageCount:(int)a3
{
  self->_indexedMessageCount = a3;
}

- (_CPIndexStateForFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPIndexStateForFeedback *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _CPIndexStateForFeedback *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_CPIndexStateForFeedback;
  v5 = -[_CPIndexStateForFeedback init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "percentMessagesIndexed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "percentMessagesIndexed");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPIndexStateForFeedback setPercentMessagesIndexed:](v5, "setPercentMessagesIndexed:", objc_msgSend(v7, "intValue"));

    }
    objc_msgSend(v4, "percentAttachmentsIndexed");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "percentAttachmentsIndexed");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPIndexStateForFeedback setPercentAttachmentsIndexed:](v5, "setPercentAttachmentsIndexed:", objc_msgSend(v9, "intValue"));

    }
    objc_msgSend(v4, "searchIndex");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "searchIndex");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPIndexStateForFeedback setSearchIndex:](v5, "setSearchIndex:", objc_msgSend(v11, "intValue"));

    }
    objc_msgSend(v4, "totalMessageCount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "totalMessageCount");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPIndexStateForFeedback setTotalMessageCount:](v5, "setTotalMessageCount:", objc_msgSend(v13, "intValue"));

    }
    objc_msgSend(v4, "indexedMessageCount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "indexedMessageCount");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPIndexStateForFeedback setIndexedMessageCount:](v5, "setIndexedMessageCount:", objc_msgSend(v15, "intValue"));

    }
    v16 = v5;
  }

  return v5;
}

@end
