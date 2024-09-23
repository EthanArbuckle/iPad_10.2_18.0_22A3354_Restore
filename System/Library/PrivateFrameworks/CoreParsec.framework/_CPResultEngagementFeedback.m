@implementation _CPResultEngagementFeedback

- (_CPResultEngagementFeedback)init
{
  _CPResultEngagementFeedback *v2;
  _CPResultEngagementFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPResultEngagementFeedback;
  v2 = -[_CPResultEngagementFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPResultEngagementFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPResultEngagementFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_CPResultEngagementFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  if (-[_CPResultEngagementFeedback actionEngaged](self, "actionEngaged"))
    PBDataWriterWriteBOOLField();
  if (-[_CPResultEngagementFeedback triggerEvent](self, "triggerEvent"))
    PBDataWriterWriteInt32Field();
  if (-[_CPResultEngagementFeedback destination](self, "destination"))
    PBDataWriterWriteInt32Field();
  if (-[_CPResultEngagementFeedback actionTarget](self, "actionTarget"))
    PBDataWriterWriteInt32Field();
  -[_CPResultEngagementFeedback result](self, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_CPResultEngagementFeedback result](self, "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPResultEngagementFeedback titleText](self, "titleText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  if (-[_CPResultEngagementFeedback matchesUnengagedSuggestion](self, "matchesUnengagedSuggestion"))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  int actionEngaged;
  int triggerEvent;
  int destination;
  int actionTarget;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  int matchesUnengagedSuggestion;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_17;
  actionEngaged = self->_actionEngaged;
  if (actionEngaged != objc_msgSend(v4, "actionEngaged"))
    goto LABEL_17;
  triggerEvent = self->_triggerEvent;
  if (triggerEvent != objc_msgSend(v4, "triggerEvent"))
    goto LABEL_17;
  destination = self->_destination;
  if (destination != objc_msgSend(v4, "destination"))
    goto LABEL_17;
  actionTarget = self->_actionTarget;
  if (actionTarget != objc_msgSend(v4, "actionTarget"))
    goto LABEL_17;
  -[_CPResultEngagementFeedback result](self, "result");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "result");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_16;
  -[_CPResultEngagementFeedback result](self, "result");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_CPResultEngagementFeedback result](self, "result");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "result");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_CPResultEngagementFeedback titleText](self, "titleText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) != (v11 != 0))
  {
    -[_CPResultEngagementFeedback titleText](self, "titleText");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      matchesUnengagedSuggestion = self->_matchesUnengagedSuggestion;
      v22 = matchesUnengagedSuggestion == objc_msgSend(v4, "matchesUnengagedSuggestion");
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_CPResultEngagementFeedback titleText](self, "titleText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (v21)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = (2654435761 * self->_actionEngaged) ^ (2654435761u * self->_timestamp) ^ (2654435761 * self->_triggerEvent) ^ (2654435761 * self->_destination);
  v4 = 2654435761 * self->_actionTarget;
  v5 = v4 ^ -[_CPSearchResultForFeedback hash](self->_result, "hash");
  return v3 ^ v5 ^ -[NSString hash](self->_titleText, "hash") ^ (2654435761 * self->_matchesUnengagedSuggestion);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (BOOL)actionEngaged
{
  return self->_actionEngaged;
}

- (void)setActionEngaged:(BOOL)a3
{
  self->_actionEngaged = a3;
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
}

- (int)destination
{
  return self->_destination;
}

- (void)setDestination:(int)a3
{
  self->_destination = a3;
}

- (int)actionTarget
{
  return self->_actionTarget;
}

- (void)setActionTarget:(int)a3
{
  self->_actionTarget = a3;
}

- (_CPSearchResultForFeedback)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)matchesUnengagedSuggestion
{
  return self->_matchesUnengagedSuggestion;
}

- (void)setMatchesUnengagedSuggestion:(BOOL)a3
{
  self->_matchesUnengagedSuggestion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

- (_CPResultEngagementFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPResultEngagementFeedback *v5;
  void *v6;
  _CPSearchResultForFeedback *v7;
  void *v8;
  _CPSearchResultForFeedback *v9;
  void *v10;
  void *v11;
  void *v12;
  _CPResultEngagementFeedback *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_CPResultEngagementFeedback;
  v5 = -[_CPResultEngagementFeedback init](&v15, sel_init);
  if (v5)
  {
    -[_CPResultEngagementFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    -[_CPResultEngagementFeedback setActionEngaged:](v5, "setActionEngaged:", objc_msgSend(v4, "actionEngaged"));
    -[_CPResultEngagementFeedback setTriggerEvent:](v5, "setTriggerEvent:", objc_msgSend(v4, "triggerEvent"));
    -[_CPResultEngagementFeedback setDestination:](v5, "setDestination:", objc_msgSend(v4, "destination"));
    -[_CPResultEngagementFeedback setActionTarget:](v5, "setActionTarget:", objc_msgSend(v4, "actionTarget"));
    objc_msgSend(v4, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_CPSearchResultForFeedback alloc];
      objc_msgSend(v4, "result");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_CPSearchResultForFeedback initWithFacade:](v7, "initWithFacade:", v8);
      -[_CPResultEngagementFeedback setResult:](v5, "setResult:", v9);

    }
    objc_msgSend(v4, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPResultEngagementFeedback setTitleText:](v5, "setTitleText:", v12);

    -[_CPResultEngagementFeedback setMatchesUnengagedSuggestion:](v5, "setMatchesUnengagedSuggestion:", objc_msgSend(v4, "matchesUnengagedSuggestion"));
    v13 = v5;
  }

  return v5;
}

@end
