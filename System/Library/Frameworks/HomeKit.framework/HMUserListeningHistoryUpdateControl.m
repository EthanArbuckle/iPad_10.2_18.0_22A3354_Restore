@implementation HMUserListeningHistoryUpdateControl

- (HMUserListeningHistoryUpdateControl)initWithAccessories:(id)a3
{
  id v4;
  HMUserListeningHistoryUpdateControl *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableSet *internalAccessories;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMUserListeningHistoryUpdateControl;
  v5 = -[HMUserListeningHistoryUpdateControl init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E20];
    v7 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    internalAccessories = v5->_internalAccessories;
    v5->_internalAccessories = (NSMutableSet *)v8;

  }
  return v5;
}

- (NSArray)accessories
{
  return (NSArray *)-[NSMutableSet allObjects](self->_internalAccessories, "allObjects");
}

- (BOOL)isEqual:(id)a3
{
  HMUserListeningHistoryUpdateControl *v4;
  HMUserListeningHistoryUpdateControl *v5;
  HMUserListeningHistoryUpdateControl *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = (HMUserListeningHistoryUpdateControl *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMUserListeningHistoryUpdateControl accessories](self, "accessories");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __47__HMUserListeningHistoryUpdateControl_isEqual___block_invoke;
      v21[3] = &unk_1E3AB3FF0;
      v22 = v7;
      v10 = v7;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v21);

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMUserListeningHistoryUpdateControl accessories](v6, "accessories");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v9;
      v17 = 3221225472;
      v18 = __47__HMUserListeningHistoryUpdateControl_isEqual___block_invoke_2;
      v19 = &unk_1E3AB3FF0;
      v20 = v11;
      v13 = v11;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v16);

      v14 = objc_msgSend(v10, "isEqualToSet:", v13, v16, v17, v18, v19);
    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableUserListeningHistoryUpdateControl *v4;
  void *v5;
  HMMutableUserListeningHistoryUpdateControl *v6;

  v4 = +[HMMutableUserListeningHistoryUpdateControl allocWithZone:](HMMutableUserListeningHistoryUpdateControl, "allocWithZone:", a3);
  -[HMUserListeningHistoryUpdateControl accessories](self, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMMutableUserListeningHistoryUpdateControl initWithAccessories:](v4, "initWithAccessories:", v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAccessories, 0);
}

void __47__HMUserListeningHistoryUpdateControl_isEqual___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __47__HMUserListeningHistoryUpdateControl_isEqual___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

@end
