@implementation HFAnalyticsDiscoverTabContentViewedEvent

- (HFAnalyticsDiscoverTabContentViewedEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  HFAnalyticsDiscoverTabContentViewedEvent *v11;
  HFAnalyticsDiscoverTabContentViewedEvent *v12;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("discoverTabContentViewedIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("discoverTabContentViewedLocaleKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v14.receiver = self;
  v14.super_class = (Class)HFAnalyticsDiscoverTabContentViewedEvent;
  v11 = -[HFAnalyticsEvent initWithEventType:](&v14, sel_initWithEventType_, 11);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contentID, v6);
    objc_storeStrong((id *)&v12->_locale, v9);
  }

  return v12;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsDiscoverTabContentViewedEvent;
  -[HFAnalyticsEvent payload](&v8, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsDiscoverTabContentViewedEvent contentID](self, "contentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("id"));

  -[HFAnalyticsDiscoverTabContentViewedEvent locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("locale"));

  return v4;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setContentID:(id)a3
{
  objc_storeStrong((id *)&self->_contentID, a3);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
}

@end
