@implementation HFAnalyticsSceneIconEditEvent

- (HFAnalyticsSceneIconEditEvent)initWithData:(id)a3
{
  id v4;
  HFAnalyticsSceneIconEditEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HFAnalyticsSceneIconEditEvent;
  v5 = -[HFAnalyticsEvent initWithEventType:](&v15, sel_initWithEventType_, 38);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sceneIconDidChange"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    objc_storeStrong((id *)&v5->_didChange, v7);

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sceneIconColorDescription"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    objc_storeStrong((id *)&v5->_colorStr, v9);

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sceneIconIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    objc_storeStrong((id *)&v5->_sfSymbolStr, v11);

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNewScene"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    objc_storeStrong((id *)&v5->_isNewScene, v13);

  }
  return v5;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HFAnalyticsSceneIconEditEvent;
  -[HFAnalyticsEvent payload](&v10, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsSceneIconEditEvent didChange](self, "didChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("sceneIconEditDidChange"));

  -[HFAnalyticsSceneIconEditEvent colorStr](self, "colorStr");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("sceneIconEditColorString"));

  -[HFAnalyticsSceneIconEditEvent sfSymbolStr](self, "sfSymbolStr");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, CFSTR("sceneIconEditSFSymbolString"));

  -[HFAnalyticsSceneIconEditEvent isNewScene](self, "isNewScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, CFSTR("isNewScene"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1EA7CD360, CFSTR("homeAppEventCount"));
  return v4;
}

- (NSNumber)didChange
{
  return self->_didChange;
}

- (void)setDidChange:(id)a3
{
  objc_storeStrong((id *)&self->_didChange, a3);
}

- (NSString)colorStr
{
  return self->_colorStr;
}

- (void)setColorStr:(id)a3
{
  objc_storeStrong((id *)&self->_colorStr, a3);
}

- (NSString)sfSymbolStr
{
  return self->_sfSymbolStr;
}

- (void)setSfSymbolStr:(id)a3
{
  objc_storeStrong((id *)&self->_sfSymbolStr, a3);
}

- (NSNumber)isNewScene
{
  return self->_isNewScene;
}

- (void)setIsNewScene:(id)a3
{
  objc_storeStrong((id *)&self->_isNewScene, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isNewScene, 0);
  objc_storeStrong((id *)&self->_sfSymbolStr, 0);
  objc_storeStrong((id *)&self->_colorStr, 0);
  objc_storeStrong((id *)&self->_didChange, 0);
}

@end
