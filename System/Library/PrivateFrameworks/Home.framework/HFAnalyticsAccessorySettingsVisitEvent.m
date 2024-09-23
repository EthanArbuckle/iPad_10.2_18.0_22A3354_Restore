@implementation HFAnalyticsAccessorySettingsVisitEvent

- (HFAnalyticsAccessorySettingsVisitEvent)initWithData:(id)a3
{
  id v4;
  HFAnalyticsAccessorySettingsVisitEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFAnalyticsAccessorySettingsVisitEvent;
  v5 = -[HFAnalyticsEvent initWithEventType:](&v12, sel_initWithEventType_, 33);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accessorySettingsSourceItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      NSLog(CFSTR("Missing source item!"));
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accessorySettingsSourceItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
    {
      if ((objc_msgSend(v9, "isHomePod") & 1) != 0)
        v10 = 1;
      else
        v10 = objc_msgSend(v9, "isHomePodMediaSystem");
    }
    else
    {
      v10 = 0;
    }
    -[HFAnalyticsAccessorySettingsVisitEvent setIsHomePod:](v5, "setIsHomePod:", v10);
    -[HFAnalyticsAccessorySettingsVisitEvent setIsMediaAccessory:](v5, "setIsMediaAccessory:", v9 != 0);

  }
  return v5;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("accessorySettingsForHomePod");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsAccessorySettingsVisitEvent isHomePod](self, "isHomePod"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = CFSTR("accessorySettingsForMediaAccessory");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsAccessorySettingsVisitEvent isMediaAccessory](self, "isMediaAccessory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HFItem)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
  objc_storeStrong((id *)&self->_sourceItem, a3);
}

- (BOOL)isHomePod
{
  return self->_isHomePod;
}

- (void)setIsHomePod:(BOOL)a3
{
  self->_isHomePod = a3;
}

- (BOOL)isMediaAccessory
{
  return self->_isMediaAccessory;
}

- (void)setIsMediaAccessory:(BOOL)a3
{
  self->_isMediaAccessory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceItem, 0);
}

@end
