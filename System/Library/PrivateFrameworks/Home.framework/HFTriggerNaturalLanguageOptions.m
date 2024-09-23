@implementation HFTriggerNaturalLanguageOptions

- (HFTriggerNaturalLanguageOptions)initWithHome:(id)a3 nameType:(unint64_t)a4
{
  return -[HFTriggerNaturalLanguageOptions initWithHome:nameType:actions:](self, "initWithHome:nameType:actions:", a3, a4, 0);
}

- (HFTriggerNaturalLanguageOptions)initWithHome:(id)a3 nameType:(unint64_t)a4 actions:(id)a5
{
  id v9;
  id v10;
  HFTriggerNaturalLanguageOptions *v11;
  HFTriggerNaturalLanguageOptions *v12;
  uint64_t v13;
  NSSet *objectsInContext;
  HFActionNaturalLanguageOptions *v15;
  HFActionNaturalLanguageOptions *actionNaturalLanguageOptions;
  objc_super v18;

  v9 = a3;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HFTriggerNaturalLanguageOptions;
  v11 = -[HFNaturalLanguageOptions init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_nameType = a4;
    objc_storeStrong((id *)&v11->_home, a3);
    v12->_formattingStyle = 2;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    objectsInContext = v12->_objectsInContext;
    v12->_objectsInContext = (NSSet *)v13;

    v12->_shouldUseFullDayNames = 0;
    v12->_shouldUseFirstPersonPronounIfPossible = 0;
    if (objc_msgSend(v10, "count"))
    {
      objc_storeStrong((id *)&v12->_actions, a5);
      v15 = -[HFActionNaturalLanguageOptions initWithHome:formattingContext:]([HFActionNaturalLanguageOptions alloc], "initWithHome:formattingContext:", v9, 5);
      actionNaturalLanguageOptions = v12->_actionNaturalLanguageOptions;
      v12->_actionNaturalLanguageOptions = v15;

    }
  }

  return v12;
}

+ (HFTriggerNaturalLanguageOptions)optionsWithHome:(id)a3 nameType:(unint64_t)a4
{
  id v5;
  HFTriggerNaturalLanguageOptions *v6;

  v5 = a3;
  v6 = -[HFTriggerNaturalLanguageOptions initWithHome:nameType:]([HFTriggerNaturalLanguageOptions alloc], "initWithHome:nameType:", v5, a4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFTriggerNaturalLanguageOptions;
  v4 = -[HFNaturalLanguageOptions copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "_copyFromOptions:", self);
  return v4;
}

- (void)_copyFromOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[HFTriggerNaturalLanguageOptions setNameType:](self, "setNameType:", objc_msgSend(v4, "nameType"));
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTriggerNaturalLanguageOptions setHome:](self, "setHome:", v5);

  objc_msgSend(v4, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[HFTriggerNaturalLanguageOptions setActions:](self, "setActions:", v7);

  -[HFTriggerNaturalLanguageOptions setFormattingStyle:](self, "setFormattingStyle:", objc_msgSend(v4, "formattingStyle"));
  objc_msgSend(v4, "objectsInContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[HFTriggerNaturalLanguageOptions setObjectsInContext:](self, "setObjectsInContext:", v9);

  objc_msgSend(v4, "actionNaturalLanguageOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[HFTriggerNaturalLanguageOptions setActionNaturalLanguageOptions:](self, "setActionNaturalLanguageOptions:", v11);

  -[HFTriggerNaturalLanguageOptions setShouldUseFullDayNames:](self, "setShouldUseFullDayNames:", objc_msgSend(v4, "shouldUseFullDayNames"));
  -[HFTriggerNaturalLanguageOptions setShouldUseFirstPersonPronounIfPossible:](self, "setShouldUseFirstPersonPronounIfPossible:", objc_msgSend(v4, "shouldUseFirstPersonPronounIfPossible"));
  objc_msgSend(v4, "locationEventUser");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[HFTriggerNaturalLanguageOptions setLocationEventUser:](self, "setLocationEventUser:", v12);
}

- (void)setObjectsInContext:(id)a3
{
  char v4;
  void *v5;
  NSSet *v6;
  NSSet *objectsInContext;
  id v8;

  v8 = a3;
  v4 = -[NSSet isEqual:](self->_objectsInContext, "isEqual:", v8);
  v5 = v8;
  if ((v4 & 1) == 0)
  {
    if (v8)
    {
      v6 = (NSSet *)v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    objectsInContext = self->_objectsInContext;
    self->_objectsInContext = v6;

    v5 = v8;
  }

}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (unint64_t)nameType
{
  return self->_nameType;
}

- (void)setNameType:(unint64_t)a3
{
  self->_nameType = a3;
}

- (BOOL)shouldUseFullDayNames
{
  return self->_shouldUseFullDayNames;
}

- (void)setShouldUseFullDayNames:(BOOL)a3
{
  self->_shouldUseFullDayNames = a3;
}

- (BOOL)shouldUseFirstPersonPronounIfPossible
{
  return self->_shouldUseFirstPersonPronounIfPossible;
}

- (void)setShouldUseFirstPersonPronounIfPossible:(BOOL)a3
{
  self->_shouldUseFirstPersonPronounIfPossible = a3;
}

- (int64_t)formattingStyle
{
  return self->_formattingStyle;
}

- (void)setFormattingStyle:(int64_t)a3
{
  self->_formattingStyle = a3;
}

- (HMUser)locationEventUser
{
  return (HMUser *)objc_loadWeakRetained((id *)&self->_locationEventUser);
}

- (void)setLocationEventUser:(id)a3
{
  objc_storeWeak((id *)&self->_locationEventUser, a3);
}

- (HFActionNaturalLanguageOptions)actionNaturalLanguageOptions
{
  return self->_actionNaturalLanguageOptions;
}

- (void)setActionNaturalLanguageOptions:(id)a3
{
  objc_storeStrong((id *)&self->_actionNaturalLanguageOptions, a3);
}

- (NSSet)objectsInContext
{
  return self->_objectsInContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectsInContext, 0);
  objc_storeStrong((id *)&self->_actionNaturalLanguageOptions, 0);
  objc_destroyWeak((id *)&self->_locationEventUser);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
