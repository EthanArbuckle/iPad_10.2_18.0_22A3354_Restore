@implementation HULocationEventSelectedLocationItem

- (HULocationEventSelectedLocationItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithEvent_inHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULocationEventSelectedLocationItem.m"), 16, CFSTR("%s is unavailable; use %@ instead"),
    "-[HULocationEventSelectedLocationItem init]",
    v5);

  return 0;
}

- (HULocationEventSelectedLocationItem)initWithEvent:(id)a3 inHome:(id)a4
{
  id v7;
  id v8;
  HULocationEventSelectedLocationItem *v9;
  HULocationEventSelectedLocationItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HULocationEventSelectedLocationItem;
  v9 = -[HULocationEventSelectedLocationItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventBuilder, a3);
    objc_storeStrong((id *)&v10->_home, a4);
    v10->_locationCanBeEdited = 0;
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_opt_new();
  -[HULocationEventSelectedLocationItem _locationTitle](self, "_locationTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HULocationTriggerSelectedLocationTitle"), CFSTR("HULocationTriggerSelectedLocationTitle"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30D18]);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30BF8]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HULocationEventSelectedLocationItem locationCanBeEdited](self, "locationCanBeEdited") ^ 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30C80]);

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  v8 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "futureWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_locationTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  if (-[HULocationEventSelectedLocationItem _locationIsHome](self, "_locationIsHome"))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HULocationTriggerSelectedLocationHome"), CFSTR("HULocationTriggerSelectedLocationHome"), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HULocationEventSelectedLocationItem eventBuilder](self, "eventBuilder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_opt_class();
      -[HULocationEventSelectedLocationItem eventBuilder](self, "eventBuilder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      if (v7)
      {
        objc_msgSend(v7, "region");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[HULocationEventSelectedLocationItem eventBuilder](self, "eventBuilder");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Expected a region event builder but got %@!"), v9);

        _HULocalizedStringWithDefaultValue(CFSTR("HULocationTriggerSelectedLocationCustom"), CFSTR("HULocationTriggerSelectedLocationCustom"), 1);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (BOOL)_locationIsHome
{
  void *v3;
  char isKindOfClass;
  char v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[HULocationEventSelectedLocationItem eventBuilder](self, "eventBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 1;
  objc_opt_class();
  -[HULocationEventSelectedLocationItem eventBuilder](self, "eventBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[HULocationEventSelectedLocationItem home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "isRegionAtHome:", v9);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (HMHome)home
{
  return self->_home;
}

- (HFLocationEventBuilder)eventBuilder
{
  return self->_eventBuilder;
}

- (void)setEventBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_eventBuilder, a3);
}

- (BOOL)locationCanBeEdited
{
  return self->_locationCanBeEdited;
}

- (void)setLocationCanBeEdited:(BOOL)a3
{
  self->_locationCanBeEdited = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBuilder, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
