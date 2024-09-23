@implementation _CPCardViewDisappearFeedback

- (_CPCardViewDisappearFeedback)init
{
  _CPCardViewDisappearFeedback *v2;
  _CPCardViewDisappearFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPCardViewDisappearFeedback;
  v2 = -[_CPCardViewDisappearFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPCardViewDisappearFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPCardViewDisappearFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_CPCardViewDisappearFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  if (-[_CPCardViewDisappearFeedback cardDisappearEvent](self, "cardDisappearEvent"))
    PBDataWriterWriteInt32Field();
  -[_CPCardViewDisappearFeedback card](self, "card");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_CPCardViewDisappearFeedback card](self, "card");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  int cardDisappearEvent;
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
      cardDisappearEvent = self->_cardDisappearEvent;
      if (cardDisappearEvent == objc_msgSend(v4, "cardDisappearEvent"))
      {
        -[_CPCardViewDisappearFeedback card](self, "card");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "card");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          -[_CPCardViewDisappearFeedback card](self, "card");
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
          {

LABEL_12:
            v15 = 1;
            goto LABEL_10;
          }
          v11 = (void *)v10;
          -[_CPCardViewDisappearFeedback card](self, "card");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "card");
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

  v2 = (2654435761 * self->_cardDisappearEvent) ^ (2654435761u * self->_timestamp);
  return v2 ^ -[_CPCardForFeedback hash](self->_card, "hash");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (int)cardDisappearEvent
{
  return self->_cardDisappearEvent;
}

- (void)setCardDisappearEvent:(int)a3
{
  self->_cardDisappearEvent = a3;
}

- (_CPCardForFeedback)card
{
  return self->_card;
}

- (void)setCard:(id)a3
{
  objc_storeStrong((id *)&self->_card, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_card, 0);
}

- (_CPCardViewDisappearFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPCardViewDisappearFeedback *v5;
  void *v6;
  _CPCardForFeedback *v7;
  void *v8;
  _CPCardForFeedback *v9;
  _CPCardViewDisappearFeedback *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CPCardViewDisappearFeedback;
  v5 = -[_CPCardViewDisappearFeedback init](&v12, sel_init);
  if (v5)
  {
    -[_CPCardViewDisappearFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    -[_CPCardViewDisappearFeedback setCardDisappearEvent:](v5, "setCardDisappearEvent:", objc_msgSend(v4, "cardDisappearEvent"));
    objc_msgSend(v4, "card");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_CPCardForFeedback alloc];
      objc_msgSend(v4, "card");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_CPCardForFeedback initWithFacade:](v7, "initWithFacade:", v8);
      -[_CPCardViewDisappearFeedback setCard:](v5, "setCard:", v9);

    }
    v10 = v5;
  }

  return v5;
}

@end
