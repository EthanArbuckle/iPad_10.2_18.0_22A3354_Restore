@implementation _CPVisibleSectionHeaderFeedback

- (_CPVisibleSectionHeaderFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPVisibleSectionHeaderFeedback *v5;
  void *v6;
  void *v7;
  _CPVisibleSectionHeaderFeedback *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CPVisibleSectionHeaderFeedback;
  v5 = -[_CPVisibleSectionHeaderFeedback init](&v10, sel_init);
  if (v5)
  {
    -[_CPVisibleSectionHeaderFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "section");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPVisibleSectionHeaderFeedback setSectionId:](v5, "setSectionId:", v7);

    -[_CPVisibleSectionHeaderFeedback setHeaderType:](v5, "setHeaderType:", objc_msgSend(v4, "headerType"));
    v8 = v5;
  }

  return v5;
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_CPVisibleSectionHeaderFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  if (-[_CPVisibleSectionHeaderFeedback headerType](self, "headerType"))
    PBDataWriterWriteInt32Field();
  -[_CPVisibleSectionHeaderFeedback sectionId](self, "sectionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)sectionId
{
  return self->_sectionId;
}

- (int)headerType
{
  return self->_headerType;
}

- (void)setSectionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHeaderType:(int)a3
{
  self->_headerType = a3;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (_CPVisibleSectionHeaderFeedback)init
{
  _CPVisibleSectionHeaderFeedback *v2;
  _CPVisibleSectionHeaderFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPVisibleSectionHeaderFeedback;
  v2 = -[_CPVisibleSectionHeaderFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPVisibleSectionHeaderFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionId, 0);
}

- (BOOL)readFrom:(id)a3
{
  return _CPVisibleSectionHeaderFeedbackReadFrom(self, (uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  int headerType;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    timestamp = self->_timestamp;
    if (timestamp == objc_msgSend(v4, "timestamp"))
    {
      headerType = self->_headerType;
      if (headerType == objc_msgSend(v4, "headerType"))
      {
        -[_CPVisibleSectionHeaderFeedback sectionId](self, "sectionId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "sectionId");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          -[_CPVisibleSectionHeaderFeedback sectionId](self, "sectionId");
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
          {

LABEL_12:
            v15 = 1;
            goto LABEL_10;
          }
          v11 = (void *)v10;
          -[_CPVisibleSectionHeaderFeedback sectionId](self, "sectionId");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "sectionId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) != 0)
            goto LABEL_12;
        }
        else
        {

        }
      }
    }
  }
  v15 = 0;
LABEL_10:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = (2654435761 * self->_headerType) ^ (2654435761u * self->_timestamp);
  return v2 ^ -[NSString hash](self->_sectionId, "hash");
}

@end
