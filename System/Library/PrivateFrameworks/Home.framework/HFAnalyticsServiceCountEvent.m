@implementation HFAnalyticsServiceCountEvent

- (HFAnalyticsServiceCountEvent)initWithData:(id)a3
{
  id v4;
  HFAnalyticsServiceCountEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFAnalyticsServiceCountEvent;
  v5 = -[HFAnalyticsEvent initWithEventType:](&v11, sel_initWithEventType_, 31);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numFavoriteServices_v2"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      NSLog(CFSTR("Missing favorite services"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numShowInHomeCameras"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      NSLog(CFSTR("Missing ShowInHome cameras"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSupportedServices"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      NSLog(CFSTR("Missing supported services"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numUnsupportedServices"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      NSLog(CFSTR("Missing unsupported services"));
    -[HFAnalyticsServiceCountEvent setPayloadDictionary:](v5, "setPayloadDictionary:", v4);
  }

  return v5;
}

- (void)setPayloadDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_payloadDictionary, a3);
}

- (NSDictionary)payloadDictionary
{
  return self->_payloadDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDictionary, 0);
}

@end
