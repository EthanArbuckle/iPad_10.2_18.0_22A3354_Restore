@implementation HFHomeItem

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeItem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_prettyDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  HFMutableItemUpdateOutcome *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  -[HFHomeItem home](self, "home", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    NSLog(CFSTR("home must be set on HFHomeItem before requesting an update"));
  -[HFHomeItem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(HFMutableItemUpdateOutcome);
    -[HFHomeItem home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v8, CFSTR("title"));

    -[HFHomeItem home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_reorderableServicesList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v10, CFSTR("reorderableServiceItemList"));

    -[HFHomeItem home](self, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hf_reorderableActionSetsList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v12, CFSTR("reorderableActionSetItemList"));

    -[HFHomeItem home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hf_reorderableCamerasList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v14, CFSTR("reorderableCameraItemList"));

    -[HFHomeItem home](self, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hf_reorderableRoomsList");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v16, CFSTR("reorderableRoomItemList"));

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v17, CFSTR("dependentHomeKitClasses"));

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "homeManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "incomingHomeInvitations");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v22, CFSTR("incomingHomeInvitationsCount"));

    v23 = (void *)MEMORY[0x1E0CB37E8];
    -[HFHomeItem home](self, "home");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "numberWithBool:", objc_msgSend(v24, "hf_currentUserIsAdministrator"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v25, CFSTR("administrator"));

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v6 = (HFMutableItemUpdateOutcome *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "futureWithError:", v6);
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (HMHome)home
{
  return self->_home;
}

- (HFHomeItem)initWithHome:(id)a3
{
  id v5;
  HFHomeItem *v6;
  HFHomeItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFHomeItem;
  v6 = -[HFHomeItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_home, a3);

  return v7;
}

- (HFHomeItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFHomeItem.m"), 41, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFHomeItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFHomeItem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  return v6;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeItem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_prettyDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItem latestResults](self, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@ %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
}

@end
