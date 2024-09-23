@implementation HFAnalyticsDiscoverThemeOverlayTapEvent

- (HFAnalyticsDiscoverThemeOverlayTapEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  HFAnalyticsDiscoverThemeOverlayTapEvent *v8;
  HFAnalyticsDiscoverThemeOverlayTapEvent *v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("discoverThemeTapKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v11.receiver = self;
  v11.super_class = (Class)HFAnalyticsDiscoverThemeOverlayTapEvent;
  v8 = -[HFAnalyticsEvent initWithEventType:](&v11, sel_initWithEventType_, 9);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_themeType, v6);

  return v9;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFAnalyticsDiscoverThemeOverlayTapEvent;
  -[HFAnalyticsEvent payload](&v7, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsDiscoverThemeOverlayTapEvent themeType](self, "themeType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("themeOverlayType"));

  return v4;
}

- (NSString)themeType
{
  return self->_themeType;
}

- (void)setThemeType:(id)a3
{
  objc_storeStrong((id *)&self->_themeType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themeType, 0);
}

@end
