@implementation _CPStoreCardSectionEngagementFeedback

- (_CPStoreCardSectionEngagementFeedback)init
{
  _CPStoreCardSectionEngagementFeedback *v2;
  _CPStoreCardSectionEngagementFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPStoreCardSectionEngagementFeedback;
  v2 = -[_CPStoreCardSectionEngagementFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPStoreCardSectionEngagementFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPStoreCardSectionEngagementFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[_CPStoreCardSectionEngagementFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPStoreCardSectionEngagementFeedback destination](self, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_CPStoreCardSectionEngagementFeedback destination](self, "destination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPStoreCardSectionEngagementFeedback triggerEvent](self, "triggerEvent"))
    PBDataWriterWriteInt32Field();
  if (-[_CPStoreCardSectionEngagementFeedback actionCardType](self, "actionCardType"))
    PBDataWriterWriteInt32Field();
  -[_CPStoreCardSectionEngagementFeedback cardSection](self, "cardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_CPStoreCardSectionEngagementFeedback cardSection](self, "cardSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPStoreCardSectionEngagementFeedback productPageResult](self, "productPageResult"))
    PBDataWriterWriteInt32Field();
  -[_CPStoreCardSectionEngagementFeedback cardSectionId](self, "cardSectionId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[_CPStoreCardSectionEngagementFeedback resultId](self, "resultId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  if (v9)
  {
    PBDataWriterWriteStringField();
    v10 = v11;
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
  int triggerEvent;
  int actionCardType;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int productPageResult;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  BOOL v31;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_26;
  -[_CPStoreCardSectionEngagementFeedback destination](self, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_25;
  -[_CPStoreCardSectionEngagementFeedback destination](self, "destination");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPStoreCardSectionEngagementFeedback destination](self, "destination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "destination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_26;
  }
  else
  {

  }
  triggerEvent = self->_triggerEvent;
  if (triggerEvent != objc_msgSend(v4, "triggerEvent"))
    goto LABEL_26;
  actionCardType = self->_actionCardType;
  if (actionCardType != objc_msgSend(v4, "actionCardType"))
    goto LABEL_26;
  -[_CPStoreCardSectionEngagementFeedback cardSection](self, "cardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_25;
  -[_CPStoreCardSectionEngagementFeedback cardSection](self, "cardSection");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[_CPStoreCardSectionEngagementFeedback cardSection](self, "cardSection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if (!v19)
      goto LABEL_26;
  }
  else
  {

  }
  productPageResult = self->_productPageResult;
  if (productPageResult != objc_msgSend(v4, "productPageResult"))
    goto LABEL_26;
  -[_CPStoreCardSectionEngagementFeedback cardSectionId](self, "cardSectionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSectionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_25;
  -[_CPStoreCardSectionEngagementFeedback cardSectionId](self, "cardSectionId");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[_CPStoreCardSectionEngagementFeedback cardSectionId](self, "cardSectionId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSectionId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_26;
  }
  else
  {

  }
  -[_CPStoreCardSectionEngagementFeedback resultId](self, "resultId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_25:

    goto LABEL_26;
  }
  -[_CPStoreCardSectionEngagementFeedback resultId](self, "resultId");
  v26 = objc_claimAutoreleasedReturnValue();
  if (!v26)
  {

LABEL_29:
    v31 = 1;
    goto LABEL_27;
  }
  v27 = (void *)v26;
  -[_CPStoreCardSectionEngagementFeedback resultId](self, "resultId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultId");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v28, "isEqual:", v29);

  if ((v30 & 1) != 0)
    goto LABEL_29;
LABEL_26:
  v31 = 0;
LABEL_27:

  return v31;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[_CPPunchoutForFeedback hash](self->_destination, "hash") ^ v3 ^ (2654435761 * self->_triggerEvent) ^ (2654435761 * self->_actionCardType);
  v5 = -[_CPCardSectionForFeedback hash](self->_cardSection, "hash") ^ (2654435761 * self->_productPageResult);
  v6 = v4 ^ v5 ^ -[NSString hash](self->_cardSectionId, "hash");
  return v6 ^ -[NSString hash](self->_resultId, "hash");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (_CPPunchoutForFeedback)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
}

- (int)actionCardType
{
  return self->_actionCardType;
}

- (void)setActionCardType:(int)a3
{
  self->_actionCardType = a3;
}

- (_CPCardSectionForFeedback)cardSection
{
  return self->_cardSection;
}

- (void)setCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_cardSection, a3);
}

- (int)productPageResult
{
  return self->_productPageResult;
}

- (void)setProductPageResult:(int)a3
{
  self->_productPageResult = a3;
}

- (NSString)cardSectionId
{
  return self->_cardSectionId;
}

- (void)setCardSectionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)resultId
{
  return self->_resultId;
}

- (void)setResultId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultId, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

- (_CPStoreCardSectionEngagementFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPStoreCardSectionEngagementFeedback *v5;
  void *v6;
  _CPPunchoutForFeedback *v7;
  void *v8;
  _CPPunchoutForFeedback *v9;
  void *v10;
  _CPCardSectionForFeedback *v11;
  void *v12;
  _CPCardSectionForFeedback *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _CPStoreCardSectionEngagementFeedback *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_CPStoreCardSectionEngagementFeedback;
  v5 = -[_CPStoreCardSectionEngagementFeedback init](&v20, sel_init);
  if (v5)
  {
    -[_CPStoreCardSectionEngagementFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "destination");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_CPPunchoutForFeedback alloc];
      objc_msgSend(v4, "destination");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_CPPunchoutForFeedback initWithFacade:](v7, "initWithFacade:", v8);
      -[_CPStoreCardSectionEngagementFeedback setDestination:](v5, "setDestination:", v9);

    }
    -[_CPStoreCardSectionEngagementFeedback setTriggerEvent:](v5, "setTriggerEvent:", objc_msgSend(v4, "triggerEvent"));
    -[_CPStoreCardSectionEngagementFeedback setActionCardType:](v5, "setActionCardType:", objc_msgSend(v4, "actionCardType"));
    objc_msgSend(v4, "cardSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_CPCardSectionForFeedback alloc];
      objc_msgSend(v4, "cardSection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_CPCardSectionForFeedback initWithFacade:](v11, "initWithFacade:", v12);
      -[_CPStoreCardSectionEngagementFeedback setCardSection:](v5, "setCardSection:", v13);

    }
    -[_CPStoreCardSectionEngagementFeedback setProductPageResult:](v5, "setProductPageResult:", objc_msgSend(v4, "productPageResult"));
    objc_msgSend(v4, "cardSectionId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "cardSectionId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPStoreCardSectionEngagementFeedback setCardSectionId:](v5, "setCardSectionId:", v15);

    }
    objc_msgSend(v4, "resultId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "resultId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPStoreCardSectionEngagementFeedback setResultId:](v5, "setResultId:", v17);

    }
    v18 = v5;
  }

  return v5;
}

@end
