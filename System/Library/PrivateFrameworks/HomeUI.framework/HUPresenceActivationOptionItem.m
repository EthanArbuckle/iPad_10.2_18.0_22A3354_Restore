@implementation HUPresenceActivationOptionItem

- (HUPresenceActivationOptionItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithEventType_selectedUsers_activationGranularity_style_home_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPresenceActivationOptionItem.m"), 16, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPresenceActivationOptionItem init]",
    v5);

  return 0;
}

- (HUPresenceActivationOptionItem)initWithEventType:(unint64_t)a3 selectedUsers:(id)a4 activationGranularity:(unint64_t)a5 style:(unint64_t)a6 home:(id)a7
{
  id v13;
  id v14;
  HUPresenceActivationOptionItem *v15;
  HUPresenceActivationOptionItem *v16;
  objc_super v18;

  v13 = a4;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)HUPresenceActivationOptionItem;
  v15 = -[HUPresenceActivationOptionItem init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_eventType = a3;
    objc_storeStrong((id *)&v15->_selectedUsers, a4);
    v16->_activationGranularity = a5;
    v16->_style = a6;
    objc_storeStrong((id *)&v16->_home, a7);
  }

  return v16;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_opt_new();
  v5 = -[HUPresenceActivationOptionItem style](self, "style");
  if (v5 == 1)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUPresenceActivationOptionSingleUserTitle"), CFSTR("HUPresenceActivationOptionSingleUserTitle"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (_QWORD *)MEMORY[0x1E0D30BF8];
    v8 = (_QWORD *)MEMORY[0x1E0D30D18];
    goto LABEL_5;
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HUPresenceActivationOptionItem isSelected](self, "isSelected"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (_QWORD *)MEMORY[0x1E0D30D18];
    v8 = (_QWORD *)MEMORY[0x1E0D30DA0];
LABEL_5:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *v8);

    -[HUPresenceActivationOptionItem _summaryTitle](self, "_summaryTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *v7);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_summaryTitle
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0D31690]);
  objc_msgSend(v3, "setActivationGranularity:", -[HUPresenceActivationOptionItem activationGranularity](self, "activationGranularity"));
  objc_msgSend(v3, "setLocationEventType:", -[HUPresenceActivationOptionItem eventType](self, "eventType"));
  -[HUPresenceActivationOptionItem selectedUsers](self, "selectedUsers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUsers:", v4);

  v5 = objc_alloc(MEMORY[0x1E0D31698]);
  -[HUPresenceActivationOptionItem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithHome:", v6);

  objc_msgSend(v7, "setStyle:", 1);
  objc_msgSend(v7, "setNameType:", 1);
  objc_msgSend(v7, "stringForPresenceEventBuilder:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HMHome)home
{
  return self->_home;
}

- (unint64_t)activationGranularity
{
  return self->_activationGranularity;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (HFSelectedUserCollection)selectedUsers
{
  return self->_selectedUsers;
}

- (void)setSelectedUsers:(id)a3
{
  objc_storeStrong((id *)&self->_selectedUsers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedUsers, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
