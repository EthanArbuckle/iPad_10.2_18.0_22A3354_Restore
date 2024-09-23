@implementation _CPCustomFeedback

- (_CPCustomFeedback)init
{
  _CPCustomFeedback *v2;
  _CPCustomFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPCustomFeedback;
  v2 = -[_CPCustomFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPCustomFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPCustomFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_CPCustomFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPCustomFeedback jsonFeedback](self, "jsonFeedback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteDataField();
  v5 = -[_CPCustomFeedback feedbackType](self, "feedbackType");
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
  BOOL v14;
  int feedbackType;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    timestamp = self->_timestamp;
    if (timestamp == objc_msgSend(v4, "timestamp"))
    {
      -[_CPCustomFeedback jsonFeedback](self, "jsonFeedback");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "jsonFeedback");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[_CPCustomFeedback jsonFeedback](self, "jsonFeedback");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          feedbackType = self->_feedbackType;
          v14 = feedbackType == objc_msgSend(v4, "feedbackType");
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[_CPCustomFeedback jsonFeedback](self, "jsonFeedback");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "jsonFeedback");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (v13)
          goto LABEL_11;
      }
      else
      {

      }
    }
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = 2654435761u * self->_timestamp;
  return -[NSData hash](self->_jsonFeedback, "hash") ^ v2 ^ (2654435761 * self->_feedbackType);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (NSData)jsonFeedback
{
  return self->_jsonFeedback;
}

- (void)setJsonFeedback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)feedbackType
{
  return self->_feedbackType;
}

- (void)setFeedbackType:(int)a3
{
  self->_feedbackType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonFeedback, 0);
}

- (_CPCustomFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPCustomFeedback *v5;
  void *v6;
  void *v7;
  _CPCustomFeedback *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CPCustomFeedback;
  v5 = -[_CPCustomFeedback init](&v10, sel_init);
  if (v5)
  {
    -[_CPCustomFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    -[_CPCustomFeedback setJsonFeedback:](v5, "setJsonFeedback:", v7);

    -[_CPCustomFeedback setFeedbackType:](v5, "setFeedbackType:", objc_msgSend(v4, "feedbackType"));
    v8 = v5;
  }

  return v5;
}

@end
