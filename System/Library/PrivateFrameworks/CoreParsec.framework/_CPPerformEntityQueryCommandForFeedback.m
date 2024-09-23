@implementation _CPPerformEntityQueryCommandForFeedback

- (BOOL)readFrom:(id)a3
{
  return _CPPerformEntityQueryCommandForFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_CPPerformEntityQueryCommandForFeedback tokenString](self, "tokenString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if (-[_CPPerformEntityQueryCommandForFeedback entityType](self, "entityType"))
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  int entityType;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_CPPerformEntityQueryCommandForFeedback tokenString](self, "tokenString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tokenString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_CPPerformEntityQueryCommandForFeedback tokenString](self, "tokenString");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        entityType = self->_entityType;
        v13 = entityType == objc_msgSend(v4, "entityType");
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_CPPerformEntityQueryCommandForFeedback tokenString](self, "tokenString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "tokenString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v12)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return (2654435761 * self->_entityType) ^ -[NSString hash](self->_tokenString, "hash");
}

- (NSString)tokenString
{
  return self->_tokenString;
}

- (void)setTokenString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)entityType
{
  return self->_entityType;
}

- (void)setEntityType:(int)a3
{
  self->_entityType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenString, 0);
}

- (_CPPerformEntityQueryCommandForFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPPerformEntityQueryCommandForFeedback *v5;
  void *v6;
  void *v7;
  _CPPerformEntityQueryCommandForFeedback *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CPPerformEntityQueryCommandForFeedback;
  v5 = -[_CPPerformEntityQueryCommandForFeedback init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "tokenString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "tokenString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPPerformEntityQueryCommandForFeedback setTokenString:](v5, "setTokenString:", v7);

    }
    -[_CPPerformEntityQueryCommandForFeedback setEntityType:](v5, "setEntityType:", objc_msgSend(v4, "entityType"));
    v8 = v5;
  }

  return v5;
}

@end
