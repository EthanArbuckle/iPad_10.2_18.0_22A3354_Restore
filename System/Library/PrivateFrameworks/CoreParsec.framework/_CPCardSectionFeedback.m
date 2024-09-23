@implementation _CPCardSectionFeedback

- (_CPCardSectionFeedback)init
{
  _CPCardSectionFeedback *v2;
  _CPCardSectionFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPCardSectionFeedback;
  v2 = -[_CPCardSectionFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPCardSectionFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPCardSectionFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[_CPCardSectionFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPCardSectionFeedback cardSection](self, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_CPCardSectionFeedback cardSection](self, "cardSection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPCardSectionFeedback cardSectionId](self, "cardSectionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_CPCardSectionFeedback resultId](self, "resultId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_18;
  -[_CPCardSectionFeedback cardSection](self, "cardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[_CPCardSectionFeedback cardSection](self, "cardSection");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPCardSectionFeedback cardSection](self, "cardSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  -[_CPCardSectionFeedback cardSectionId](self, "cardSectionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSectionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[_CPCardSectionFeedback cardSectionId](self, "cardSectionId");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_CPCardSectionFeedback cardSectionId](self, "cardSectionId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSectionId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[_CPCardSectionFeedback resultId](self, "resultId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[_CPCardSectionFeedback resultId](self, "resultId");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[_CPCardSectionFeedback resultId](self, "resultId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_21;
  }
  else
  {
LABEL_17:

  }
LABEL_18:
  v23 = 0;
LABEL_19:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[_CPCardSectionForFeedback hash](self->_cardSection, "hash");
  v5 = v4 ^ -[NSString hash](self->_cardSectionId, "hash");
  return v5 ^ -[NSString hash](self->_resultId, "hash") ^ v3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (_CPCardSectionForFeedback)cardSection
{
  return self->_cardSection;
}

- (void)setCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_cardSection, a3);
}

- (NSString)cardSectionId
{
  return self->_cardSectionId;
}

- (void)setCardSectionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)resultId
{
  return self->_resultId;
}

- (void)setResultId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultId, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
}

- (_CPCardSectionFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPCardSectionFeedback *v5;
  void *v6;
  _CPCardSectionForFeedback *v7;
  void *v8;
  _CPCardSectionForFeedback *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _CPCardSectionFeedback *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_CPCardSectionFeedback;
  v5 = -[_CPCardSectionFeedback init](&v16, sel_init);
  if (v5)
  {
    -[_CPCardSectionFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "cardSection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_CPCardSectionForFeedback alloc];
      objc_msgSend(v4, "cardSection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_CPCardSectionForFeedback initWithFacade:](v7, "initWithFacade:", v8);
      -[_CPCardSectionFeedback setCardSection:](v5, "setCardSection:", v9);

    }
    objc_msgSend(v4, "cardSectionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "cardSectionId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPCardSectionFeedback setCardSectionId:](v5, "setCardSectionId:", v11);

    }
    objc_msgSend(v4, "resultId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "resultId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPCardSectionFeedback setResultId:](v5, "setResultId:", v13);

    }
    v14 = v5;
  }

  return v5;
}

@end
