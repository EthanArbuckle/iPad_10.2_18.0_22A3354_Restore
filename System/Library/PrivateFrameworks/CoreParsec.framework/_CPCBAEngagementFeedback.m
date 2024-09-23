@implementation _CPCBAEngagementFeedback

- (_CPCBAEngagementFeedback)init
{
  _CPCBAEngagementFeedback *v2;
  _CPCBAEngagementFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPCBAEngagementFeedback;
  v2 = -[_CPCBAEngagementFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPCBAEngagementFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPCBAEngagementFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_CPCBAEngagementFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  if (-[_CPCBAEngagementFeedback queryId](self, "queryId"))
    PBDataWriterWriteUint64Field();
  if (-[_CPCBAEngagementFeedback cbaType](self, "cbaType"))
    PBDataWriterWriteInt32Field();
  -[_CPCBAEngagementFeedback url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  unint64_t queryId;
  int cbaType;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    timestamp = self->_timestamp;
    if (timestamp == objc_msgSend(v4, "timestamp"))
    {
      queryId = self->_queryId;
      if (queryId == objc_msgSend(v4, "queryId"))
      {
        cbaType = self->_cbaType;
        if (cbaType == objc_msgSend(v4, "cbaType"))
        {
          -[_CPCBAEngagementFeedback url](self, "url");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "url");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if ((v8 == 0) != (v9 != 0))
          {
            -[_CPCBAEngagementFeedback url](self, "url");
            v11 = objc_claimAutoreleasedReturnValue();
            if (!v11)
            {

LABEL_13:
              v16 = 1;
              goto LABEL_11;
            }
            v12 = (void *)v11;
            -[_CPCBAEngagementFeedback url](self, "url");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "url");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "isEqual:", v14);

            if ((v15 & 1) != 0)
              goto LABEL_13;
          }
          else
          {

          }
        }
      }
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;

  v2 = (2654435761u * self->_queryId) ^ (2654435761u * self->_timestamp);
  v3 = 2654435761 * self->_cbaType;
  return v2 ^ v3 ^ -[NSString hash](self->_url, "hash");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (int)cbaType
{
  return self->_cbaType;
}

- (void)setCbaType:(int)a3
{
  self->_cbaType = a3;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
