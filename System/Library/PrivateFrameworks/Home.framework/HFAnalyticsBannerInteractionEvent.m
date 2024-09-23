@implementation HFAnalyticsBannerInteractionEvent

- (HFAnalyticsBannerInteractionEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  HFAnalyticsBannerInteractionEvent *v8;
  void *v9;
  void *v10;
  id v11;
  NSString *v12;
  NSString *itemClassName;
  objc_class *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v18.receiver = self;
  v18.super_class = (Class)HFAnalyticsBannerInteractionEvent;
  v8 = -[HFAnalyticsEvent initWithEventType:](&v18, sel_initWithEventType_, 41);
  if (v8)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("overrideItemClassName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (objc_msgSend(v11, "length"))
    {
      v12 = (NSString *)v11;
    }
    else
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    itemClassName = v8->_itemClassName;
    v8->_itemClassName = v12;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hiddenBannerCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    objc_storeStrong((id *)&v8->_hiddenBannerCount, v16);

  }
  return v8;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsBannerInteractionEvent;
  -[HFAnalyticsEvent payload](&v8, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsBannerInteractionEvent itemClassName](self, "itemClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("item"));

  -[HFAnalyticsBannerInteractionEvent hiddenBannerCount](self, "hiddenBannerCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("hiddenBannerCount"));

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_1EA7CC778, CFSTR("homeAppEventCount"));
  return v4;
}

- (NSString)itemClassName
{
  return self->_itemClassName;
}

- (void)setItemClassName:(id)a3
{
  objc_storeStrong((id *)&self->_itemClassName, a3);
}

- (NSNumber)hiddenBannerCount
{
  return self->_hiddenBannerCount;
}

- (void)setHiddenBannerCount:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenBannerCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenBannerCount, 0);
  objc_storeStrong((id *)&self->_itemClassName, 0);
}

@end
