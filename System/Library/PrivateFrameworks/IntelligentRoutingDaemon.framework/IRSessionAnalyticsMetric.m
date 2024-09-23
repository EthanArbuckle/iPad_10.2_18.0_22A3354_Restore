@implementation IRSessionAnalyticsMetric

- (IRSessionAnalyticsMetric)initWithClientIdentifier:(id)a3 internalAppName:(id)a4 eventType:(id)a5 miloAvailable:(id)a6 bannerCandidateType:(id)a7 bannerCandidateModelType:(id)a8 chosenCandidateType:(id)a9 chosenCandidateModelType:(id)a10 postBannerInteraction:(id)a11 isOutsideApp:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  IRSessionAnalyticsMetric *v26;
  IRSessionAnalyticsMetric *v27;
  id v30;
  objc_super v31;

  v17 = a3;
  v30 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v31.receiver = self;
  v31.super_class = (Class)IRSessionAnalyticsMetric;
  v26 = -[IRSessionAnalyticsMetric init](&v31, sel_init);
  v27 = v26;
  if (v26)
  {
    -[IRSessionAnalyticsMetric setClientIdentifier:](v26, "setClientIdentifier:", v17);
    -[IRSessionAnalyticsMetric setInternalAppName:](v27, "setInternalAppName:", v30);
    -[IRSessionAnalyticsMetric setEventType:](v27, "setEventType:", v18);
    -[IRSessionAnalyticsMetric setMiloAvailable:](v27, "setMiloAvailable:", v19);
    -[IRSessionAnalyticsMetric setBannerCandidateType:](v27, "setBannerCandidateType:", v20);
    -[IRSessionAnalyticsMetric setBannerCandidateModelType:](v27, "setBannerCandidateModelType:", v21);
    -[IRSessionAnalyticsMetric setChosenCandidateType:](v27, "setChosenCandidateType:", v22);
    -[IRSessionAnalyticsMetric setChosenCandidateModelType:](v27, "setChosenCandidateModelType:", v23);
    -[IRSessionAnalyticsMetric setPostBannerInteraction:](v27, "setPostBannerInteraction:", v24);
    -[IRSessionAnalyticsMetric setIsOutsideApp:](v27, "setIsOutsideApp:", v25);
  }

  return v27;
}

- (NSString)name
{
  return (NSString *)CFSTR("com.apple.intelligentroutingd.UiEventSessionTelemetry");
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRSessionAnalyticsMetric clientIdentifier](self, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IRSessionAnalyticsMetric clientIdentifier](self, "clientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ClientIdentifier"));

  }
  -[IRSessionAnalyticsMetric internalAppName](self, "internalAppName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IRSessionAnalyticsMetric internalAppName](self, "internalAppName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("InternalAppName"));

  }
  -[IRSessionAnalyticsMetric eventType](self, "eventType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IRSessionAnalyticsMetric eventType](self, "eventType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("EventType"));

  }
  -[IRSessionAnalyticsMetric miloAvailable](self, "miloAvailable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[IRSessionAnalyticsMetric miloAvailable](self, "miloAvailable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("MiLoAvailable"));

  }
  -[IRSessionAnalyticsMetric bannerCandidateType](self, "bannerCandidateType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[IRSessionAnalyticsMetric bannerCandidateType](self, "bannerCandidateType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("BannerCandidateType"));

  }
  -[IRSessionAnalyticsMetric bannerCandidateModelType](self, "bannerCandidateModelType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[IRSessionAnalyticsMetric bannerCandidateModelType](self, "bannerCandidateModelType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("BannerCandidateModelType"));

  }
  -[IRSessionAnalyticsMetric chosenCandidateType](self, "chosenCandidateType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[IRSessionAnalyticsMetric chosenCandidateType](self, "chosenCandidateType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("ChosenCandidateType"));

  }
  -[IRSessionAnalyticsMetric chosenCandidateModelType](self, "chosenCandidateModelType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[IRSessionAnalyticsMetric chosenCandidateModelType](self, "chosenCandidateModelType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("ChosenCandidateModelType"));

  }
  -[IRSessionAnalyticsMetric postBannerInteraction](self, "postBannerInteraction");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[IRSessionAnalyticsMetric postBannerInteraction](self, "postBannerInteraction");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("PostBannerInteraction"));

  }
  -[IRSessionAnalyticsMetric isOutsideApp](self, "isOutsideApp");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[IRSessionAnalyticsMetric isOutsideApp](self, "isOutsideApp");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("StartingEventIsWidget"));

  }
  return (NSDictionary *)v3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (NSNumber)internalAppName
{
  return self->_internalAppName;
}

- (void)setInternalAppName:(id)a3
{
  objc_storeStrong((id *)&self->_internalAppName, a3);
}

- (NSNumber)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
  objc_storeStrong((id *)&self->_eventType, a3);
}

- (NSNumber)miloAvailable
{
  return self->_miloAvailable;
}

- (void)setMiloAvailable:(id)a3
{
  objc_storeStrong((id *)&self->_miloAvailable, a3);
}

- (NSString)bannerCandidateType
{
  return self->_bannerCandidateType;
}

- (void)setBannerCandidateType:(id)a3
{
  objc_storeStrong((id *)&self->_bannerCandidateType, a3);
}

- (NSString)bannerCandidateModelType
{
  return self->_bannerCandidateModelType;
}

- (void)setBannerCandidateModelType:(id)a3
{
  objc_storeStrong((id *)&self->_bannerCandidateModelType, a3);
}

- (NSString)chosenCandidateType
{
  return self->_chosenCandidateType;
}

- (void)setChosenCandidateType:(id)a3
{
  objc_storeStrong((id *)&self->_chosenCandidateType, a3);
}

- (NSString)chosenCandidateModelType
{
  return self->_chosenCandidateModelType;
}

- (void)setChosenCandidateModelType:(id)a3
{
  objc_storeStrong((id *)&self->_chosenCandidateModelType, a3);
}

- (NSNumber)postBannerInteraction
{
  return self->_postBannerInteraction;
}

- (void)setPostBannerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_postBannerInteraction, a3);
}

- (NSNumber)isOutsideApp
{
  return self->_isOutsideApp;
}

- (void)setIsOutsideApp:(id)a3
{
  objc_storeStrong((id *)&self->_isOutsideApp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isOutsideApp, 0);
  objc_storeStrong((id *)&self->_postBannerInteraction, 0);
  objc_storeStrong((id *)&self->_chosenCandidateModelType, 0);
  objc_storeStrong((id *)&self->_chosenCandidateType, 0);
  objc_storeStrong((id *)&self->_bannerCandidateModelType, 0);
  objc_storeStrong((id *)&self->_bannerCandidateType, 0);
  objc_storeStrong((id *)&self->_miloAvailable, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_internalAppName, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
