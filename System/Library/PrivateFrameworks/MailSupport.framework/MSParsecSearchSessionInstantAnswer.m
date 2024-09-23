@implementation MSParsecSearchSessionInstantAnswer

+ (id)instantAnswerWithIdentifier:(id)a3 date:(id)a4 inlineCard:(id)a5 isInstantAnswerUpdated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:date:inlineCard:isInstantAnswerUpdated:", v10, v11, v12, v6);

  return v13;
}

- (MSParsecSearchSessionInstantAnswer)initWithIdentifier:(id)a3 date:(id)a4 inlineCard:(id)a5 isInstantAnswerUpdated:(BOOL)a6
{
  id v11;
  id *v12;
  MSParsecSearchSessionInstantAnswer *v13;
  objc_super v15;

  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MSParsecSearchSessionInstantAnswer;
  v12 = -[MSParsecSearchSessionMessageResult initResultWithIdentifier:date:](&v15, sel_initResultWithIdentifier_date_, a3, a4);
  v13 = (MSParsecSearchSessionInstantAnswer *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 4, a5);
    v13->_isInstantAnswerUpdated = a6;
  }

  return v13;
}

- (id)feedbackResult
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSParsecSearchSessionInstantAnswer;
  -[MSParsecSearchSessionMessageResult feedbackResult](&v6, sel_feedbackResult);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsInstantAnswer:", 1);
  objc_msgSend(v3, "setResultBundleId:", CFSTR("com.apple.mail.search.instantanswer"));
  objc_msgSend(v3, "setSectionBundleIdentifier:", CFSTR("instantanswer"));
  objc_msgSend(v3, "setInlineCard:", self->_inlineCard);
  NSSelectorFromString(CFSTR("isMailInstantAnswerUpdated"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInstantAnswerUpdated);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("isMailInstantAnswerUpdated"));

  }
  return v3;
}

- (SFCard)inlineCard
{
  return self->_inlineCard;
}

- (BOOL)isInstantAnswerUpdated
{
  return self->_isInstantAnswerUpdated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineCard, 0);
}

@end
