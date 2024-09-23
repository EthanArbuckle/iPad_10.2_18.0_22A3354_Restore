@implementation HFAnalyticsEnergyCategoryStatusItemTapEvent

- (HFAnalyticsEnergyCategoryStatusItemTapEvent)initWithData:(id)a3
{
  void *v4;
  unint64_t v5;
  HFAnalyticsEnergyCategoryStatusItemTapEvent *result;
  objc_super v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("interactionType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (!v5)
    NSLog(CFSTR("HFAnalyticsEnergyCategoryStatusItemTapEvent interactionType is invalid"));
  v7.receiver = self;
  v7.super_class = (Class)HFAnalyticsEnergyCategoryStatusItemTapEvent;
  result = -[HFAnalyticsEvent initWithEventType:](&v7, sel_initWithEventType_, 46);
  if (result)
    result->_interactionType = v5;
  return result;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  if (!self->_interactionType)
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)HFAnalyticsEnergyCategoryStatusItemTapEvent;
  -[HFAnalyticsEvent payload](&v7, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFAnalyticsEnergyCategoryStatusItemTapEvent interactionType](self, "interactionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("interactionType"));

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_1EA7CD750, CFSTR("homeAppEventCount"));
  return v4;
}

- (unint64_t)interactionType
{
  return self->_interactionType;
}

- (void)setInteractionType:(unint64_t)a3
{
  self->_interactionType = a3;
}

@end
