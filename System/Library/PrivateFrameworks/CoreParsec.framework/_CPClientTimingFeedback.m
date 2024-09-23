@implementation _CPClientTimingFeedback

- (_CPClientTimingFeedback)init
{
  _CPClientTimingFeedback *v2;
  _CPClientTimingFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPClientTimingFeedback;
  v2 = -[_CPClientTimingFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPClientTimingFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPClientTimingFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[_CPClientTimingFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPClientTimingFeedback input](self, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_CPClientTimingFeedback eventName](self, "eventName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if (-[_CPClientTimingFeedback queryId](self, "queryId"))
    PBDataWriterWriteUint64Field();
  v6 = -[_CPClientTimingFeedback nanosecondInterval](self, "nanosecondInterval");
  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteUint64Field();
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
  unint64_t queryId;
  unint64_t nanosecondInterval;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_13;
  -[_CPClientTimingFeedback input](self, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "input");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[_CPClientTimingFeedback input](self, "input");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPClientTimingFeedback input](self, "input");
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
  -[_CPClientTimingFeedback eventName](self, "eventName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_12:

    goto LABEL_13;
  }
  -[_CPClientTimingFeedback eventName](self, "eventName");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_CPClientTimingFeedback eventName](self, "eventName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_13;
  }
  else
  {

  }
  queryId = self->_queryId;
  if (queryId == objc_msgSend(v4, "queryId"))
  {
    nanosecondInterval = self->_nanosecondInterval;
    v18 = nanosecondInterval == objc_msgSend(v4, "nanosecondInterval");
    goto LABEL_14;
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
  return v4 ^ -[NSString hash](self->_eventName, "hash") ^ v3 ^ (2654435761u * self->_queryId) ^ (2654435761u
                                                                                                * self->_nanosecondInterval);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (unint64_t)nanosecondInterval
{
  return self->_nanosecondInterval;
}

- (void)setNanosecondInterval:(unint64_t)a3
{
  self->_nanosecondInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

- (_CPClientTimingFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPClientTimingFeedback *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _CPClientTimingFeedback *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CPClientTimingFeedback;
  v5 = -[_CPClientTimingFeedback init](&v12, sel_init);
  if (v5)
  {
    -[_CPClientTimingFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "input");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPClientTimingFeedback setInput:](v5, "setInput:", v7);

    }
    objc_msgSend(v4, "eventName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "eventName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPClientTimingFeedback setEventName:](v5, "setEventName:", v9);

    }
    -[_CPClientTimingFeedback setQueryId:](v5, "setQueryId:", objc_msgSend(v4, "queryId"));
    -[_CPClientTimingFeedback setNanosecondInterval:](v5, "setNanosecondInterval:", objc_msgSend(v4, "nanosecondInterval"));
    v10 = v5;
  }

  return v5;
}

@end
