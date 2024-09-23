@implementation HFAnalyticsEnergyCategoryViewAccessedFromURLEvent

- (HFAnalyticsEnergyCategoryViewAccessedFromURLEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  HFAnalyticsEnergyCategoryViewAccessedFromURLEvent *v8;
  HFAnalyticsEnergyCategoryViewAccessedFromURLEvent *v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("energyCategoryViewAccessedFrom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
    NSLog(CFSTR("HFAnalyticsEnergyCategoryViewAccessedFromURLEvent fromUIViewName is nil"));
  v11.receiver = self;
  v11.super_class = (Class)HFAnalyticsEnergyCategoryViewAccessedFromURLEvent;
  v8 = -[HFAnalyticsEvent initWithEventType:](&v11, sel_initWithEventType_, 54);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_fromUIView, v6);

  return v9;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFAnalyticsEnergyCategoryViewAccessedFromURLEvent;
  -[HFAnalyticsEvent payload](&v7, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsEnergyCategoryViewAccessedFromURLEvent fromUIView](self, "fromUIView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("energyViewAccessedFrom"));

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_1EA7CD0A8, CFSTR("homeAppEventCount"));
  return v4;
}

- (NSString)fromUIView
{
  return self->_fromUIView;
}

- (void)setFromUIView:(id)a3
{
  objc_storeStrong((id *)&self->_fromUIView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromUIView, 0);
}

@end
