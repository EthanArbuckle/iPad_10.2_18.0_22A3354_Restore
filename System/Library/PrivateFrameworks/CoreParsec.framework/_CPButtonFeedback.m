@implementation _CPButtonFeedback

- (_CPButtonFeedback)init
{
  _CPButtonFeedback *v2;
  _CPButtonFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPButtonFeedback;
  v2 = -[_CPButtonFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPButtonFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPButtonFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_CPButtonFeedback commandType](self, "commandType"))
    PBDataWriterWriteInt32Field();
  -[_CPButtonFeedback commandDetail](self, "commandDetail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if (-[_CPButtonFeedback uniqueId](self, "uniqueId"))
    PBDataWriterWriteUint64Field();
  v5 = -[_CPButtonFeedback timestamp](self, "timestamp");
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
  unint64_t uniqueId;
  unint64_t timestamp;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  commandType = self->_commandType;
  if (commandType != objc_msgSend(v4, "commandType"))
    goto LABEL_11;
  -[_CPButtonFeedback commandDetail](self, "commandDetail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandDetail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

    goto LABEL_11;
  }
  -[_CPButtonFeedback commandDetail](self, "commandDetail");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_CPButtonFeedback commandDetail](self, "commandDetail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commandDetail");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_11;
  }
  else
  {

  }
  uniqueId = self->_uniqueId;
  if (uniqueId != objc_msgSend(v4, "uniqueId"))
  {
LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  timestamp = self->_timestamp;
  v16 = timestamp == objc_msgSend(v4, "timestamp");
LABEL_12:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = 2654435761 * self->_commandType;
  return -[NSString hash](self->_commandDetail, "hash") ^ v2 ^ (2654435761u * self->_uniqueId) ^ (2654435761u
                                                                                                * self->_timestamp);
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

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandDetail, 0);
}

@end
