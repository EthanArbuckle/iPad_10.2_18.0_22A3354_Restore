@implementation _CPButtonForFeedback

- (BOOL)readFrom:(id)a3
{
  return _CPButtonForFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_CPButtonForFeedback commandType](self, "commandType"))
    PBDataWriterWriteInt32Field();
  -[_CPButtonForFeedback commandDetail](self, "commandDetail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  v5 = -[_CPButtonForFeedback uniqueId](self, "uniqueId");
  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteUint64Field();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int commandType;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  unint64_t uniqueId;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    commandType = self->_commandType;
    if (commandType == objc_msgSend(v4, "commandType"))
    {
      -[_CPButtonForFeedback commandDetail](self, "commandDetail");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "commandDetail");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[_CPButtonForFeedback commandDetail](self, "commandDetail");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          uniqueId = self->_uniqueId;
          v14 = uniqueId == objc_msgSend(v4, "uniqueId");
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[_CPButtonForFeedback commandDetail](self, "commandDetail");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "commandDetail");
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
  uint64_t v2;

  v2 = 2654435761 * self->_commandType;
  return -[NSString hash](self->_commandDetail, "hash") ^ v2 ^ (2654435761u * self->_uniqueId);
}

- (int)commandType
{
  return self->_commandType;
}

- (void)setCommandType:(int)a3
{
  self->_commandType = a3;
}

- (NSString)commandDetail
{
  return self->_commandDetail;
}

- (void)setCommandDetail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(unint64_t)a3
{
  self->_uniqueId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandDetail, 0);
}

- (_CPButtonForFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPButtonForFeedback *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _CPButtonForFeedback *v10;

  v4 = a3;
  v5 = -[_CPButtonForFeedback init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v4;
      objc_msgSend(v6, "command");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPButtonForFeedback setCommandType:](v5, "setCommandType:", objc_msgSend(v7, "_cpCommandType"));

      objc_msgSend(v6, "command");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "commandDetail");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPButtonForFeedback setCommandDetail:](v5, "setCommandDetail:", v9);

    }
    -[_CPButtonForFeedback setUniqueId:](v5, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
    v10 = v5;
  }

  return v5;
}

@end
