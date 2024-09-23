@implementation HULocationTriggerSelectedLocationItem

- (HULocationTriggerSelectedLocationItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTriggerBuilder_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULocationTriggerSelectedLocationItem.m"), 16, CFSTR("%s is unavailable; use %@ instead"),
    "-[HULocationTriggerSelectedLocationItem init]",
    v5);

  return 0;
}

- (HULocationTriggerSelectedLocationItem)initWithTriggerBuilder:(id)a3
{
  id v5;
  HULocationTriggerSelectedLocationItem *v6;
  HULocationTriggerSelectedLocationItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HULocationTriggerSelectedLocationItem;
  v6 = -[HULocationTriggerSelectedLocationItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_triggerBuilder, a3);

  return v7;
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
  -[HULocationTriggerSelectedLocationItem _locationTitle](self, "_locationTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HULocationTriggerSelectedLocationTitle"), CFSTR("HULocationTriggerSelectedLocationTitle"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30D18]);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30BF8]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HULocationTriggerSelectedLocationItem locationCanBeEdited](self, "locationCanBeEdited") ^ 1);
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

- (BOOL)locationCanBeEdited
{
  void *v2;
  void *v3;
  char v4;

  -[HULocationTriggerSelectedLocationItem triggerBuilder](self, "triggerBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locationInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "locationCanBeEdited");

  return v4;
}

- (id)_locationTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (-[HULocationTriggerSelectedLocationItem _locationIsHome](self, "_locationIsHome"))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HULocationTriggerSelectedLocationHome"), CFSTR("HULocationTriggerSelectedLocationHome"), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HULocationTriggerSelectedLocationItem triggerBuilder](self, "triggerBuilder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationEventBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_opt_class();
      -[HULocationTriggerSelectedLocationItem triggerBuilder](self, "triggerBuilder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "locationInterface");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "locationEventBuilder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;

      if (v11)
      {
        objc_msgSend(v11, "region");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[HULocationTriggerSelectedLocationItem triggerBuilder](self, "triggerBuilder");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "locationInterface");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "locationEventBuilder");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Expected a region event builder but got %@!"), v15);

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
  void *v4;
  void *v5;
  char isKindOfClass;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  -[HULocationTriggerSelectedLocationItem triggerBuilder](self, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationEventBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 1;
  objc_opt_class();
  -[HULocationTriggerSelectedLocationItem triggerBuilder](self, "triggerBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationEventBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    -[HULocationTriggerSelectedLocationItem triggerBuilder](self, "triggerBuilder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "isRegionAtHome:", v14);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
}

@end
