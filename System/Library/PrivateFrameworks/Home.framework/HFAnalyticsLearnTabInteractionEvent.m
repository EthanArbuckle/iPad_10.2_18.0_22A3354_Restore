@implementation HFAnalyticsLearnTabInteractionEvent

- (HFAnalyticsLearnTabInteractionEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  HFAnalyticsLearnTabInteractionEvent *v8;
  HFAnalyticsLearnTabInteractionEvent *v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("learnInteractionLinkType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v11.receiver = self;
  v11.super_class = (Class)HFAnalyticsLearnTabInteractionEvent;
  v8 = -[HFAnalyticsEvent initWithEventType:](&v11, sel_initWithEventType_, 8);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_interactionType, v6);

  return v9;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFAnalyticsLearnTabInteractionEvent;
  -[HFAnalyticsEvent payload](&v7, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsLearnTabInteractionEvent interactionType](self, "interactionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("linkType"));

  return v4;
}

- (NSString)interactionType
{
  return self->_interactionType;
}

- (void)setInteractionType:(id)a3
{
  objc_storeStrong((id *)&self->_interactionType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionType, 0);
}

@end
