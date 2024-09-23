@implementation HFAnalyticsHiddenBannerEvent

- (HFAnalyticsHiddenBannerEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  HFAnalyticsHiddenBannerEvent *v11;
  void *v12;
  void *v13;
  id v14;
  NSString *v15;
  NSString *hiddenBannerItemClassName;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  NSString *v21;
  NSString *tappedBannerItemClassName;
  objc_class *v23;
  void *v24;
  void *v25;
  NSNumber *v26;
  NSNumber *hiddenBannerCount;
  objc_super v29;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tappedBannerItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v29.receiver = self;
  v29.super_class = (Class)HFAnalyticsHiddenBannerEvent;
  v11 = -[HFAnalyticsEvent initWithEventType:](&v29, sel_initWithEventType_, 42);
  if (v11)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("overrideItemClassName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (objc_msgSend(v14, "length"))
    {
      v15 = (NSString *)v14;
    }
    else
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    hiddenBannerItemClassName = v11->_hiddenBannerItemClassName;
    v11->_hiddenBannerItemClassName = v15;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tappedBannerOverrideItemClassName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    if (objc_msgSend(v20, "length"))
    {
      v21 = (NSString *)v20;
    }
    else
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    tappedBannerItemClassName = v11->_tappedBannerItemClassName;
    v11->_tappedBannerItemClassName = v21;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hiddenBannerCount"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
    v26 = v25;

    hiddenBannerCount = v11->_hiddenBannerCount;
    v11->_hiddenBannerCount = v26;

  }
  return v11;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HFAnalyticsHiddenBannerEvent;
  -[HFAnalyticsEvent payload](&v9, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsHiddenBannerEvent hiddenBannerItemClassName](self, "hiddenBannerItemClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("item"));

  -[HFAnalyticsHiddenBannerEvent hiddenBannerCount](self, "hiddenBannerCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("hiddenBannerCount"));

  -[HFAnalyticsHiddenBannerEvent tappedBannerItemClassName](self, "tappedBannerItemClassName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, CFSTR("tappedBannerItem"));

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_1EA7CBB78, CFSTR("homeAppEventCount"));
  return v4;
}

- (NSString)hiddenBannerItemClassName
{
  return self->_hiddenBannerItemClassName;
}

- (void)setHiddenBannerItemClassName:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenBannerItemClassName, a3);
}

- (NSString)tappedBannerItemClassName
{
  return self->_tappedBannerItemClassName;
}

- (void)setTappedBannerItemClassName:(id)a3
{
  objc_storeStrong((id *)&self->_tappedBannerItemClassName, a3);
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
  objc_storeStrong((id *)&self->_tappedBannerItemClassName, 0);
  objc_storeStrong((id *)&self->_hiddenBannerItemClassName, 0);
}

@end
