@implementation HFEventBuilderLocationInterface

- (void)setLocationEventBuilder:(id)a3
{
  id v4;
  HFLocationEventBuilder *v5;
  HFLocationEventBuilder *v6;
  char v7;
  HFLocationEventBuilder *v8;
  HFLocationEventBuilder *locationEventBuilder;
  void *v10;
  void *v11;
  HFLocationEventBuilder *v12;
  HFLocationEventBuilder *v13;

  v4 = a3;
  v5 = self->_locationEventBuilder;
  v6 = (HFLocationEventBuilder *)v4;
  v13 = v6;
  if (v5 == v6)
  {

    locationEventBuilder = v13;
  }
  else
  {
    if (v5)
    {
      v7 = -[HFLocationEventBuilder isEqual:](v5, "isEqual:", v6);

      v8 = v13;
      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeEventBuilder:", self->_locationEventBuilder);

    -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEventBuilder:", v13);

    v12 = v13;
    locationEventBuilder = self->_locationEventBuilder;
    self->_locationEventBuilder = v12;
  }

  v8 = v13;
LABEL_9:

}

- (HFLocationEventBuilder)locationEventBuilder
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  HFLocationEventBuilder *v8;
  HFLocationEventBuilder *locationEventBuilder;

  if (!self->_locationEventBuilder
    || (-[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "eventBuilders"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "containsObject:", self->_locationEventBuilder),
        v4,
        v3,
        (v5 & 1) == 0))
  {
    -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventBuilders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_112_1);
    v8 = (HFLocationEventBuilder *)objc_claimAutoreleasedReturnValue();
    locationEventBuilder = self->_locationEventBuilder;
    self->_locationEventBuilder = v8;

  }
  return self->_locationEventBuilder;
}

uint64_t __55__HFEventBuilderLocationInterface_locationEventBuilder__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1F03FF648);
}

- (BOOL)isCustomLocationTrigger
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;

  objc_opt_class();
  -[HFEventBuilderLocationInterface locationEventBuilder](self, "locationEventBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isRegionAtHome:", v7) ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)locationCanBeEdited
{
  void *v2;
  char v3;

  -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isShortcutOwned") ^ 1;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationEventBuilder, 0);
}

@end
