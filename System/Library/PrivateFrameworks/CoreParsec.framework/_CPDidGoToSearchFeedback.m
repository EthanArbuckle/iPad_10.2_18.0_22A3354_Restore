@implementation _CPDidGoToSearchFeedback

- (_CPDidGoToSearchFeedback)init
{
  _CPDidGoToSearchFeedback *v2;
  _CPDidGoToSearchFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPDidGoToSearchFeedback;
  v2 = -[_CPDidGoToSearchFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPDidGoToSearchFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPDidGoToSearchFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_CPDidGoToSearchFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPDidGoToSearchFeedback input](self, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if (-[_CPDidGoToSearchFeedback endpoint](self, "endpoint"))
    PBDataWriterWriteInt32Field();
  v5 = -[_CPDidGoToSearchFeedback triggerEvent](self, "triggerEvent");
  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int endpoint;
  int triggerEvent;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_11;
  -[_CPDidGoToSearchFeedback input](self, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "input");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

    goto LABEL_11;
  }
  -[_CPDidGoToSearchFeedback input](self, "input");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_CPDidGoToSearchFeedback input](self, "input");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "input");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_11;
  }
  else
  {

  }
  endpoint = self->_endpoint;
  if (endpoint != objc_msgSend(v4, "endpoint"))
  {
LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  triggerEvent = self->_triggerEvent;
  v16 = triggerEvent == objc_msgSend(v4, "triggerEvent");
LABEL_12:

  return v16;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = 2654435761u * self->_timestamp;
  return -[NSString hash](self->_input, "hash") ^ v2 ^ (2654435761 * self->_endpoint) ^ (2654435761
                                                                                         * self->_triggerEvent);
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

- (int)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(int)a3
{
  self->_endpoint = a3;
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input, 0);
}

- (_CPDidGoToSearchFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPDidGoToSearchFeedback *v5;
  void *v6;
  void *v7;
  _CPDidGoToSearchFeedback *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CPDidGoToSearchFeedback;
  v5 = -[_CPDidGoToSearchFeedback init](&v10, sel_init);
  if (v5)
  {
    -[_CPDidGoToSearchFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "input");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPDidGoToSearchFeedback setInput:](v5, "setInput:", v7);

    }
    -[_CPDidGoToSearchFeedback setEndpoint:](v5, "setEndpoint:", objc_msgSend(v4, "endpoint"));
    -[_CPDidGoToSearchFeedback setTriggerEvent:](v5, "setTriggerEvent:", objc_msgSend(v4, "triggerEvent"));
    v8 = v5;
  }

  return v5;
}

@end
