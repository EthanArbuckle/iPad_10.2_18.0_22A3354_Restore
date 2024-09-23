@implementation _CPSectionEngagementFeedback

- (_CPSectionEngagementFeedback)init
{
  _CPSectionEngagementFeedback *v2;
  _CPSectionEngagementFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPSectionEngagementFeedback;
  v2 = -[_CPSectionEngagementFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPSectionEngagementFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPSectionEngagementFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[_CPSectionEngagementFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPSectionEngagementFeedback section](self, "section");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_CPSectionEngagementFeedback section](self, "section");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v6 = -[_CPSectionEngagementFeedback triggerEvent](self, "triggerEvent");
  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteInt32Field();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  int triggerEvent;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    timestamp = self->_timestamp;
    if (timestamp == objc_msgSend(v4, "timestamp"))
    {
      -[_CPSectionEngagementFeedback section](self, "section");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "section");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[_CPSectionEngagementFeedback section](self, "section");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          triggerEvent = self->_triggerEvent;
          v14 = triggerEvent == objc_msgSend(v4, "triggerEvent");
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[_CPSectionEngagementFeedback section](self, "section");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "section");
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
  unint64_t v2;

  v2 = 2654435761u * self->_timestamp;
  return -[_CPResultSectionForFeedback hash](self->_section, "hash") ^ v2 ^ (2654435761 * self->_triggerEvent);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (_CPResultSectionForFeedback)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
  objc_storeStrong((id *)&self->_section, a3);
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_section, 0);
}

- (_CPSectionEngagementFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPSectionEngagementFeedback *v5;
  void *v6;
  _CPResultSectionForFeedback *v7;
  void *v8;
  _CPResultSectionForFeedback *v9;
  _CPSectionEngagementFeedback *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CPSectionEngagementFeedback;
  v5 = -[_CPSectionEngagementFeedback init](&v12, sel_init);
  if (v5)
  {
    -[_CPSectionEngagementFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "section");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_CPResultSectionForFeedback alloc];
      objc_msgSend(v4, "section");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_CPResultSectionForFeedback initWithFacade:](v7, "initWithFacade:", v8);
      -[_CPSectionEngagementFeedback setSection:](v5, "setSection:", v9);

    }
    -[_CPSectionEngagementFeedback setTriggerEvent:](v5, "setTriggerEvent:", objc_msgSend(v4, "triggerEvent"));
    v10 = v5;
  }

  return v5;
}

@end
