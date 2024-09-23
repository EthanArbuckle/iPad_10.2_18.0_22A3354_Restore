@implementation _CPMapsCardSectionEngagementFeedback

- (_CPMapsCardSectionEngagementFeedback)init
{
  _CPMapsCardSectionEngagementFeedback *v2;
  _CPMapsCardSectionEngagementFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPMapsCardSectionEngagementFeedback;
  v2 = -[_CPMapsCardSectionEngagementFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPMapsCardSectionEngagementFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPMapsCardSectionEngagementFeedbackReadFrom(self, (uint64_t)a3);
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
  if (-[_CPMapsCardSectionEngagementFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPMapsCardSectionEngagementFeedback destination](self, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_CPMapsCardSectionEngagementFeedback destination](self, "destination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPMapsCardSectionEngagementFeedback triggerEvent](self, "triggerEvent"))
    PBDataWriterWriteInt32Field();
  if (-[_CPMapsCardSectionEngagementFeedback actionCardType](self, "actionCardType"))
    PBDataWriterWriteInt32Field();
  if (-[_CPMapsCardSectionEngagementFeedback feedbackType](self, "feedbackType"))
    PBDataWriterWriteInt32Field();
  -[_CPMapsCardSectionEngagementFeedback cardSectionId](self, "cardSectionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_CPMapsCardSectionEngagementFeedback resultId](self, "resultId");
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
  int triggerEvent;
  int actionCardType;
  int feedbackType;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  BOOL v26;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_21;
  -[_CPMapsCardSectionEngagementFeedback destination](self, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_20;
  -[_CPMapsCardSectionEngagementFeedback destination](self, "destination");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPMapsCardSectionEngagementFeedback destination](self, "destination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "destination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_21;
  }
  else
  {

  }
  triggerEvent = self->_triggerEvent;
  if (triggerEvent != objc_msgSend(v4, "triggerEvent"))
    goto LABEL_21;
  actionCardType = self->_actionCardType;
  if (actionCardType != objc_msgSend(v4, "actionCardType"))
    goto LABEL_21;
  feedbackType = self->_feedbackType;
  if (feedbackType != objc_msgSend(v4, "feedbackType"))
    goto LABEL_21;
  -[_CPMapsCardSectionEngagementFeedback cardSectionId](self, "cardSectionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSectionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_20;
  -[_CPMapsCardSectionEngagementFeedback cardSectionId](self, "cardSectionId");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[_CPMapsCardSectionEngagementFeedback cardSectionId](self, "cardSectionId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSectionId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (!v20)
      goto LABEL_21;
  }
  else
  {

  }
  -[_CPMapsCardSectionEngagementFeedback resultId](self, "resultId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[_CPMapsCardSectionEngagementFeedback resultId](self, "resultId");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
    {

LABEL_24:
      v26 = 1;
      goto LABEL_22;
    }
    v22 = (void *)v21;
    -[_CPMapsCardSectionEngagementFeedback resultId](self, "resultId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if ((v25 & 1) != 0)
      goto LABEL_24;
  }
  else
  {
LABEL_20:

  }
LABEL_21:
  v26 = 0;
LABEL_22:

  return v26;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[_CPPunchoutForFeedback hash](self->_destination, "hash") ^ v3 ^ (2654435761 * self->_triggerEvent) ^ (2654435761 * self->_actionCardType);
  v5 = 2654435761 * self->_feedbackType;
  v6 = v5 ^ -[NSString hash](self->_cardSectionId, "hash");
  return v4 ^ v6 ^ -[NSString hash](self->_resultId, "hash");
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

- (int)feedbackType
{
  return self->_feedbackType;
}

- (void)setFeedbackType:(int)a3
{
  self->_feedbackType = a3;
}

- (NSString)cardSectionId
{
  return self->_cardSectionId;
}

- (void)setCardSectionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)resultId
{
  return self->_resultId;
}

- (void)setResultId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultId, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

- (_CPMapsCardSectionEngagementFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPMapsCardSectionEngagementFeedback *v5;
  void *v6;
  _CPPunchoutForFeedback *v7;
  void *v8;
  _CPPunchoutForFeedback *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _CPMapsCardSectionEngagementFeedback *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_CPMapsCardSectionEngagementFeedback;
  v5 = -[_CPMapsCardSectionEngagementFeedback init](&v16, sel_init);
  if (v5)
  {
    -[_CPMapsCardSectionEngagementFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "destination");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_CPPunchoutForFeedback alloc];
      objc_msgSend(v4, "destination");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_CPPunchoutForFeedback initWithFacade:](v7, "initWithFacade:", v8);
      -[_CPMapsCardSectionEngagementFeedback setDestination:](v5, "setDestination:", v9);

    }
    -[_CPMapsCardSectionEngagementFeedback setTriggerEvent:](v5, "setTriggerEvent:", objc_msgSend(v4, "triggerEvent"));
    -[_CPMapsCardSectionEngagementFeedback setActionCardType:](v5, "setActionCardType:", objc_msgSend(v4, "actionCardType"));
    -[_CPMapsCardSectionEngagementFeedback setFeedbackType:](v5, "setFeedbackType:", objc_msgSend(v4, "feedbackType"));
    objc_msgSend(v4, "cardSectionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "cardSectionId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPMapsCardSectionEngagementFeedback setCardSectionId:](v5, "setCardSectionId:", v11);

    }
    objc_msgSend(v4, "resultId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "resultId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPMapsCardSectionEngagementFeedback setResultId:](v5, "setResultId:", v13);

    }
    v14 = v5;
  }

  return v5;
}

@end
