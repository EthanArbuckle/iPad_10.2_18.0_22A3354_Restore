@implementation _CPSuggestionEngagementFeedback

- (_CPSuggestionEngagementFeedback)init
{
  _CPSuggestionEngagementFeedback *v2;
  _CPSuggestionEngagementFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPSuggestionEngagementFeedback;
  v2 = -[_CPSuggestionEngagementFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPSuggestionEngagementFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPSuggestionEngagementFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_CPSuggestionEngagementFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPSuggestionEngagementFeedback suggestion](self, "suggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_CPSuggestionEngagementFeedback suggestion](self, "suggestion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

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
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    timestamp = self->_timestamp;
    if (timestamp == objc_msgSend(v4, "timestamp"))
    {
      -[_CPSuggestionEngagementFeedback suggestion](self, "suggestion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "suggestion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[_CPSuggestionEngagementFeedback suggestion](self, "suggestion");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[_CPSuggestionEngagementFeedback suggestion](self, "suggestion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "suggestion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if ((v13 & 1) != 0)
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
  return -[_CPSearchSuggestionForFeedback hash](self->_suggestion, "hash") ^ v2;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (_CPSearchSuggestionForFeedback)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_suggestion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
}

- (_CPSuggestionEngagementFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPSuggestionEngagementFeedback *v5;
  void *v6;
  _CPSearchSuggestionForFeedback *v7;
  void *v8;
  _CPSearchSuggestionForFeedback *v9;
  _CPSuggestionEngagementFeedback *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CPSuggestionEngagementFeedback;
  v5 = -[_CPSuggestionEngagementFeedback init](&v12, sel_init);
  if (v5)
  {
    -[_CPSuggestionEngagementFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "suggestion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_CPSearchSuggestionForFeedback alloc];
      objc_msgSend(v4, "suggestion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_CPSearchSuggestionForFeedback initWithFacade:](v7, "initWithFacade:", v8);
      -[_CPSuggestionEngagementFeedback setSuggestion:](v5, "setSuggestion:", v9);

    }
    v10 = v5;
  }

  return v5;
}

@end
