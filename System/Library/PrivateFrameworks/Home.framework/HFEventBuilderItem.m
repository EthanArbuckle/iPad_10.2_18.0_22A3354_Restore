@implementation HFEventBuilderItem

- (HFEventBuilderItem)initWithEventBuilders:(id)a3
{
  id v5;
  HFEventBuilderItem *v6;
  HFEventBuilderItem *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFEventBuilderItem;
  v6 = -[HFEventBuilderItem init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventBuilders, a3);
    v8 = objc_msgSend(v5, "count");
    if (v8 == 1)
    {
      objc_msgSend(v5, "anyObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_storeStrong((id *)&v7->_representativeEventBuilder, v9);
    if (v8 == 1)

  }
  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HFTriggerNaturalLanguageOptions *v9;
  HFTriggerNaturalLanguageOptions *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFEventBuilderItem representativeEventBuilder](self, "representativeEventBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[HFEventBuilderItem eventBuilders](self, "eventBuilders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anyObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[HFEventBuilderItem naturalLanguageOptions](self, "naturalLanguageOptions");
  v9 = (HFTriggerNaturalLanguageOptions *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = [HFTriggerNaturalLanguageOptions alloc];
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HFTriggerNaturalLanguageOptions initWithHome:nameType:](v10, "initWithHome:nameType:", v12, 1);

  }
  -[HFEventBuilderItem naturalLanguageOptions](self, "naturalLanguageOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "naturalLanguageNameWithOptions:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("title"));

  v15 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "futureWithResult:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)eventBuilderItemForEventBuilders:(id)a3
{
  id v3;
  void *v4;
  __objc2_class **v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "na_map:", &__block_literal_global_206);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") != 1)
    goto LABEL_9;
  if ((objc_msgSend(v4, "containsObject:", CFSTR("HFEventTypeCharacteristic")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "containsObject:", CFSTR("HFEventTypeTime")) & 1) != 0)
    {
      v5 = off_1EA722728;
      goto LABEL_8;
    }
    if (objc_msgSend(v4, "containsObject:", CFSTR("HFEventTypeLocation")))
    {
      v5 = off_1EA722138;
      goto LABEL_8;
    }
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v5 = off_1EA721CC0;
LABEL_8:
  v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithEventBuilders:", v3);
LABEL_10:

  return v6;
}

uint64_t __55__HFEventBuilderItem_eventBuilderItemForEventBuilders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "eventType");
}

- (NSSet)eventBuilders
{
  return self->_eventBuilders;
}

- (void)setEventBuilders:(id)a3
{
  objc_storeStrong((id *)&self->_eventBuilders, a3);
}

- (HFEventBuilder)representativeEventBuilder
{
  return self->_representativeEventBuilder;
}

- (void)setRepresentativeEventBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_representativeEventBuilder, a3);
}

- (HFTriggerNaturalLanguageOptions)naturalLanguageOptions
{
  return self->_naturalLanguageOptions;
}

- (void)setNaturalLanguageOptions:(id)a3
{
  objc_storeStrong((id *)&self->_naturalLanguageOptions, a3);
}

- (NSString)comparisonKey
{
  return self->_comparisonKey;
}

- (void)setComparisonKey:(id)a3
{
  objc_storeStrong((id *)&self->_comparisonKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparisonKey, 0);
  objc_storeStrong((id *)&self->_naturalLanguageOptions, 0);
  objc_storeStrong((id *)&self->_representativeEventBuilder, 0);
  objc_storeStrong((id *)&self->_eventBuilders, 0);
}

@end
