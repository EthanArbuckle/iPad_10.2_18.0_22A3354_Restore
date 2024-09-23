@implementation _CPStartSearchFeedback

- (_CPStartSearchFeedback)init
{
  _CPStartSearchFeedback *v2;
  _CPStartSearchFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPStartSearchFeedback;
  v2 = -[_CPStartSearchFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPStartSearchFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPStartSearchFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[_CPStartSearchFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPStartSearchFeedback input](self, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_CPStartSearchFeedback uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if (-[_CPStartSearchFeedback triggerEvent](self, "triggerEvent"))
    PBDataWriterWriteInt32Field();
  if (-[_CPStartSearchFeedback queryId](self, "queryId"))
    PBDataWriterWriteUint64Field();
  v6 = -[_CPStartSearchFeedback searchType](self, "searchType");
  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteInt32Field();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  int triggerEvent;
  unint64_t queryId;
  int searchType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_13;
  -[_CPStartSearchFeedback input](self, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "input");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[_CPStartSearchFeedback input](self, "input");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPStartSearchFeedback input](self, "input");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "input");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[_CPStartSearchFeedback uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_12:

    goto LABEL_13;
  }
  -[_CPStartSearchFeedback uuid](self, "uuid");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_CPStartSearchFeedback uuid](self, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_13;
  }
  else
  {

  }
  triggerEvent = self->_triggerEvent;
  if (triggerEvent == objc_msgSend(v4, "triggerEvent"))
  {
    queryId = self->_queryId;
    if (queryId == objc_msgSend(v4, "queryId"))
    {
      searchType = self->_searchType;
      v18 = searchType == objc_msgSend(v4, "searchType");
      goto LABEL_14;
    }
  }
LABEL_13:
  v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[NSString hash](self->_input, "hash");
  return v4 ^ -[NSString hash](self->_uuid, "hash") ^ v3 ^ (2654435761 * self->_triggerEvent) ^ (2654435761u
                                                                                                 * self->_queryId) ^ (2654435761 * self->_searchType);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (NSString)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (int)searchType
{
  return self->_searchType;
}

- (void)setSearchType:(int)a3
{
  self->_searchType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

- (_CPStartSearchFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPStartSearchFeedback *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _CPStartSearchFeedback *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CPStartSearchFeedback;
  v5 = -[_CPStartSearchFeedback init](&v12, sel_init);
  if (v5)
  {
    -[_CPStartSearchFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "input");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPStartSearchFeedback setInput:](v5, "setInput:", v7);

    }
    objc_msgSend(v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPStartSearchFeedback setUuid:](v5, "setUuid:", v9);

    }
    -[_CPStartSearchFeedback setTriggerEvent:](v5, "setTriggerEvent:", objc_msgSend(v4, "triggerEvent"));
    -[_CPStartSearchFeedback setQueryId:](v5, "setQueryId:", objc_msgSend(v4, "queryId"));
    -[_CPStartSearchFeedback setSearchType:](v5, "setSearchType:", objc_msgSend(v4, "searchType"));
    v10 = v5;
  }

  return v5;
}

@end
