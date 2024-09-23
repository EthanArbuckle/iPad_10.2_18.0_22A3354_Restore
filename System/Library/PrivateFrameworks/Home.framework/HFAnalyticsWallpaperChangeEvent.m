@implementation HFAnalyticsWallpaperChangeEvent

- (HFAnalyticsWallpaperChangeEvent)initWithData:(id)a3
{
  id v4;
  HFAnalyticsWallpaperChangeEvent *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFAnalyticsWallpaperChangeEvent;
  v5 = -[HFAnalyticsEvent initWithEventType:](&v9, sel_initWithEventType_, 32);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NamedWallpaperCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      NSLog(CFSTR("Missing named wallpaper count"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CustomWallpaperCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      NSLog(CFSTR("Missing custom wallpaper count"));
    -[HFAnalyticsWallpaperChangeEvent setPayloadDictionary:](v5, "setPayloadDictionary:", v4);
  }

  return v5;
}

- (NSDictionary)payloadDictionary
{
  return self->_payloadDictionary;
}

- (void)setPayloadDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_payloadDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDictionary, 0);
}

@end
