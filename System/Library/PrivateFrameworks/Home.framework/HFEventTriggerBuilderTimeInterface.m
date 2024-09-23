@implementation HFEventTriggerBuilderTimeInterface

- (NSString)name
{
  void *v2;
  void *v3;

  -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (HFTimeEventBuilder)eventBuilder
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  HFTimeEventBuilder *v8;
  HFTimeEventBuilder *eventBuilder;

  if (!self->_eventBuilder
    || (-[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "eventBuilders"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "containsObject:", self->_eventBuilder),
        v4,
        v3,
        (v5 & 1) == 0))
  {
    -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventBuilders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_131_0);
    v8 = (HFTimeEventBuilder *)objc_claimAutoreleasedReturnValue();
    eventBuilder = self->_eventBuilder;
    self->_eventBuilder = v8;

  }
  return self->_eventBuilder;
}

uint64_t __50__HFEventTriggerBuilderTimeInterface_eventBuilder__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1F0416110);
}

- (void)setEventBuilder:(id)a3
{
  id v4;
  HFTimeEventBuilder *v5;
  HFTimeEventBuilder *v6;
  char v7;
  HFTimeEventBuilder *v8;
  HFTimeEventBuilder *eventBuilder;
  void *v10;
  void *v11;
  HFTimeEventBuilder *v12;
  HFTimeEventBuilder *v13;

  v4 = a3;
  v5 = self->_eventBuilder;
  v6 = (HFTimeEventBuilder *)v4;
  v13 = v6;
  if (v5 == v6)
  {

    eventBuilder = v13;
  }
  else
  {
    if (v5)
    {
      v7 = -[HFTimeEventBuilder isEqual:](v5, "isEqual:", v6);

      v8 = v13;
      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeEventBuilder:", self->_eventBuilder);

    -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEventBuilder:", v13);

    v12 = v13;
    eventBuilder = self->_eventBuilder;
    self->_eventBuilder = v12;
  }

  v8 = v13;
LABEL_9:

}

- (NSArray)recurrences
{
  void *v2;
  void *v3;

  -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setRecurrences:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecurrences:", v4);

}

- (void)copyCurrentStateFromTriggerBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", v5);

  objc_msgSend(v4, "eventBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFEventTriggerBuilderTimeInterface setEventBuilder:](self, "setEventBuilder:", v7);

  objc_msgSend(v4, "recurrences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFEventTriggerBuilderTimeInterface setRecurrences:](self, "setRecurrences:", v8);

  objc_msgSend(v4, "timeZone");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HFEventTriggerBuilderTimeInterface setTimeZone:](self, "setTimeZone:", v9);
}

- (void)triggerEnabledStateDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a3;
  objc_opt_class();
  -[HFEventTriggerBuilderTimeInterface eventBuilder](self, "eventBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v10 = v6;

  v7 = v10;
  if (v3)
  {
    if (v10)
    {
      -[HFEventTriggerBuilderTimeInterface recurrences](self, "recurrences");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      v7 = v10;
      if (!v9)
      {
        objc_msgSend(v10, "updateBaseFireDateForTrigger");
        v7 = v10;
      }
    }
  }

}

- (NSTimeZone)timeZone
{
  return self->timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->timeZone, 0);
  objc_storeStrong((id *)&self->_eventBuilder, 0);
  objc_storeStrong((id *)&self->_recurrences, 0);
}

@end
