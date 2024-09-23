@implementation _CPCardSectionEngagementFeedback

- (_CPCardSectionEngagementFeedback)init
{
  _CPCardSectionEngagementFeedback *v2;
  _CPCardSectionEngagementFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPCardSectionEngagementFeedback;
  v2 = -[_CPCardSectionEngagementFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPCardSectionEngagementFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPCardSectionEngagementFeedbackReadFrom(self, (uint64_t)a3);
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
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  if (-[_CPCardSectionEngagementFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPCardSectionEngagementFeedback destination](self, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_CPCardSectionEngagementFeedback destination](self, "destination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPCardSectionEngagementFeedback triggerEvent](self, "triggerEvent"))
    PBDataWriterWriteInt32Field();
  if (-[_CPCardSectionEngagementFeedback actionCardType](self, "actionCardType"))
    PBDataWriterWriteInt32Field();
  -[_CPCardSectionEngagementFeedback cardSection](self, "cardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_CPCardSectionEngagementFeedback cardSection](self, "cardSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPCardSectionEngagementFeedback destinationWasPARPunchout](self, "destinationWasPARPunchout"))
    PBDataWriterWriteBOOLField();
  -[_CPCardSectionEngagementFeedback parPunchoutActionTarget](self, "parPunchoutActionTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[_CPCardSectionEngagementFeedback cardSectionId](self, "cardSectionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  -[_CPCardSectionEngagementFeedback resultId](self, "resultId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  v11 = -[_CPCardSectionEngagementFeedback actionTarget](self, "actionTarget");
  v12 = v13;
  if (v11)
  {
    PBDataWriterWriteInt32Field();
    v12 = v13;
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
  int destinationWasPARPunchout;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  BOOL v36;
  int actionTarget;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_31;
  -[_CPCardSectionEngagementFeedback destination](self, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_30;
  -[_CPCardSectionEngagementFeedback destination](self, "destination");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPCardSectionEngagementFeedback destination](self, "destination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "destination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_31;
  }
  else
  {

  }
  triggerEvent = self->_triggerEvent;
  if (triggerEvent != objc_msgSend(v4, "triggerEvent"))
    goto LABEL_31;
  actionCardType = self->_actionCardType;
  if (actionCardType != objc_msgSend(v4, "actionCardType"))
    goto LABEL_31;
  -[_CPCardSectionEngagementFeedback cardSection](self, "cardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_30;
  -[_CPCardSectionEngagementFeedback cardSection](self, "cardSection");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[_CPCardSectionEngagementFeedback cardSection](self, "cardSection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if (!v19)
      goto LABEL_31;
  }
  else
  {

  }
  destinationWasPARPunchout = self->_destinationWasPARPunchout;
  if (destinationWasPARPunchout != objc_msgSend(v4, "destinationWasPARPunchout"))
    goto LABEL_31;
  -[_CPCardSectionEngagementFeedback parPunchoutActionTarget](self, "parPunchoutActionTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parPunchoutActionTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_30;
  -[_CPCardSectionEngagementFeedback parPunchoutActionTarget](self, "parPunchoutActionTarget");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[_CPCardSectionEngagementFeedback parPunchoutActionTarget](self, "parPunchoutActionTarget");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parPunchoutActionTarget");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_31;
  }
  else
  {

  }
  -[_CPCardSectionEngagementFeedback cardSectionId](self, "cardSectionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSectionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_30;
  -[_CPCardSectionEngagementFeedback cardSectionId](self, "cardSectionId");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[_CPCardSectionEngagementFeedback cardSectionId](self, "cardSectionId");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSectionId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_31;
  }
  else
  {

  }
  -[_CPCardSectionEngagementFeedback resultId](self, "resultId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_30:

    goto LABEL_31;
  }
  -[_CPCardSectionEngagementFeedback resultId](self, "resultId");
  v31 = objc_claimAutoreleasedReturnValue();
  if (!v31)
  {

LABEL_34:
    actionTarget = self->_actionTarget;
    v36 = actionTarget == objc_msgSend(v4, "actionTarget");
    goto LABEL_32;
  }
  v32 = (void *)v31;
  -[_CPCardSectionEngagementFeedback resultId](self, "resultId");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultId");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v33, "isEqual:", v34);

  if (v35)
    goto LABEL_34;
LABEL_31:
  v36 = 0;
LABEL_32:

  return v36;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[_CPPunchoutForFeedback hash](self->_destination, "hash") ^ v3 ^ (2654435761 * self->_triggerEvent) ^ (2654435761 * self->_actionCardType);
  v5 = -[_CPCardSectionForFeedback hash](self->_cardSection, "hash") ^ (2654435761 * self->_destinationWasPARPunchout);
  v6 = v5 ^ -[NSString hash](self->_parPunchoutActionTarget, "hash");
  v7 = v4 ^ v6 ^ -[NSString hash](self->_cardSectionId, "hash");
  return v7 ^ -[NSString hash](self->_resultId, "hash") ^ (2654435761 * self->_actionTarget);
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

- (BOOL)destinationWasPARPunchout
{
  return self->_destinationWasPARPunchout;
}

- (void)setDestinationWasPARPunchout:(BOOL)a3
{
  self->_destinationWasPARPunchout = a3;
}

- (NSString)parPunchoutActionTarget
{
  return self->_parPunchoutActionTarget;
}

- (void)setParPunchoutActionTarget:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)cardSectionId
{
  return self->_cardSectionId;
}

- (void)setCardSectionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)resultId
{
  return self->_resultId;
}

- (void)setResultId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int)actionTarget
{
  return self->_actionTarget;
}

- (void)setActionTarget:(int)a3
{
  self->_actionTarget = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultId, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);
  objc_storeStrong((id *)&self->_parPunchoutActionTarget, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

- (_CPCardSectionEngagementFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPCardSectionEngagementFeedback *v5;
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
  _CPCardSectionEngagementFeedback *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_CPCardSectionEngagementFeedback;
  v5 = -[_CPCardSectionEngagementFeedback init](&v20, sel_init);
  if (v5)
  {
    -[_CPCardSectionEngagementFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "destination");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_CPPunchoutForFeedback alloc];
      objc_msgSend(v4, "destination");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_CPPunchoutForFeedback initWithFacade:](v7, "initWithFacade:", v8);
      -[_CPCardSectionEngagementFeedback setDestination:](v5, "setDestination:", v9);

    }
    -[_CPCardSectionEngagementFeedback setTriggerEvent:](v5, "setTriggerEvent:", objc_msgSend(v4, "triggerEvent"));
    -[_CPCardSectionEngagementFeedback setActionCardType:](v5, "setActionCardType:", objc_msgSend(v4, "actionCardType"));
    objc_msgSend(v4, "cardSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_CPCardSectionForFeedback alloc];
      objc_msgSend(v4, "cardSection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_CPCardSectionForFeedback initWithFacade:](v11, "initWithFacade:", v12);
      -[_CPCardSectionEngagementFeedback setCardSection:](v5, "setCardSection:", v13);

    }
    objc_msgSend(v4, "cardSectionId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "cardSectionId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPCardSectionEngagementFeedback setCardSectionId:](v5, "setCardSectionId:", v15);

    }
    objc_msgSend(v4, "resultId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "resultId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPCardSectionEngagementFeedback setResultId:](v5, "setResultId:", v17);

    }
    -[_CPCardSectionEngagementFeedback setActionTarget:](v5, "setActionTarget:", objc_msgSend(v4, "actionTarget"));
    v18 = v5;
  }

  return v5;
}

@end
