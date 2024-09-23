@implementation MSParsecSearchIndexState

+ (id)indexStateForMessagesIndexed:(id)a3 indexableMessages:(id)a4 attachmentsIndexed:(id)a5 indexableAttachments:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "doubleValue");
  v15 = v14;
  if (v14 <= 0.0)
  {
    v18 = -1;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0D1EF48];
    objc_msgSend(v10, "doubleValue");
    v18 = objc_msgSend(v16, "bucketedNumber:leadingDigits:", (int)(v17 / v15 * 100.0), 2);
  }
  objc_msgSend(v13, "doubleValue");
  v20 = v19;
  if (v19 <= 0.0)
  {
    v23 = -1;
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0D1EF48];
    objc_msgSend(v12, "doubleValue");
    v23 = objc_msgSend(v21, "bucketedNumber:leadingDigits:", (int)(v22 / v20 * 100.0), 2);
  }
  v24 = objc_msgSend(MEMORY[0x1E0D1EF48], "roundedInteger:placeValueDigits:", objc_msgSend(v11, "integerValue"), 2);
  v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPercentMessagesIndexed:percentAttachmentsIndexed:totalMessageCount:indexedMessageCount:indexType:", v18, v23, v24, objc_msgSend(MEMORY[0x1E0D1EF48], "roundedInteger:placeValueDigits:", objc_msgSend(v10, "integerValue"), 2), 0);

  return v25;
}

- (MSParsecSearchIndexState)initWithPercentMessagesIndexed:(int64_t)a3 percentAttachmentsIndexed:(int64_t)a4 totalMessageCount:(int64_t)a5 indexedMessageCount:(int64_t)a6 indexType:(int64_t)a7
{
  MSParsecSearchIndexState *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MSParsecSearchIndexState;
  result = -[MSParsecSearchIndexState init](&v13, sel_init);
  if (result)
  {
    result->_percentAttachmentsIndexed = a4;
    result->_totalMessageCount = a5;
    result->_indexedMessageCount = a6;
    result->_indexType = a7;
    result->_percentMessagesIndexed = a3;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("indexType: %ld percentMessagesIndexed: %ld percentAttachmentsIndexed: %ld totalMessageCount: %ld indexedMessageCount: %ld "), -[MSParsecSearchIndexState indexType](self, "indexType"), -[MSParsecSearchIndexState percentMessagesIndexed](self, "percentMessagesIndexed"), -[MSParsecSearchIndexState percentAttachmentsIndexed](self, "percentAttachmentsIndexed"), -[MSParsecSearchIndexState totalMessageCount](self, "totalMessageCount"), -[MSParsecSearchIndexState indexedMessageCount](self, "indexedMessageCount"));
}

- (int64_t)indexType
{
  return self->_indexType;
}

- (int64_t)percentMessagesIndexed
{
  return self->_percentMessagesIndexed;
}

- (int64_t)percentAttachmentsIndexed
{
  return self->_percentAttachmentsIndexed;
}

- (int64_t)totalMessageCount
{
  return self->_totalMessageCount;
}

- (int64_t)indexedMessageCount
{
  return self->_indexedMessageCount;
}

@end
