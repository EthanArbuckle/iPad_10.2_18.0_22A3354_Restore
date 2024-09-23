@implementation _AMUISwitcherTransitionContext

- (uint64_t)hasSameItemsAsFromRecord:(void *)a3 toRecord:
{
  id v5;
  id v6;
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
  uint64_t v19;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!a1)
  {
    v19 = 0;
    goto LABEL_15;
  }
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = *(void **)(a1 + 8);
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[0] = v9;
  v10 = *(void **)(a1 + 16);
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v8)
      goto LABEL_8;
  }
  else
  {

    if (v8)
      goto LABEL_8;
  }

LABEL_8:
  v14 = (void *)MEMORY[0x24BDBCF20];
  v15 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[0] = v15;
  v16 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {

    if (v5)
      goto LABEL_14;
LABEL_19:

    goto LABEL_14;
  }
  if (!v5)
    goto LABEL_19;
LABEL_14:
  v19 = objc_msgSend(v13, "isEqualToSet:", v18);

LABEL_15:
  return v19;
}

+ (id)contextWithFromRecord:(void *)a3 toRecord:(uint64_t)a4 direction:(uint64_t)a5 interactive:
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a2;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithFromRecord:toRecord:direction:interactive:", v9, v8, a4, a5);

  return v10;
}

- (double)progress
{
  uint64_t v1;
  uint64_t v3;
  double v4;

  if (!a1)
    return 0.0;
  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
    return *(double *)(v1 + 24);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3)
    v4 = *(double *)(v3 + 24);
  else
    v4 = 0.0;
  return 1.0 - v4;
}

- (_AMUISwitcherTransitionContext)initWithFromRecord:(id)a3 toRecord:(id)a4 direction:(int64_t)a5 interactive:(BOOL)a6
{
  id v11;
  id v12;
  _AMUISwitcherTransitionContext *v13;
  _AMUISwitcherTransitionContext *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_AMUISwitcherTransitionContext;
  v13 = -[_AMUISwitcherTransitionContext init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fromRecord, a3);
    objc_storeStrong((id *)&v14->_toRecord, a4);
    v14->_direction = a5;
    v14->_interactive = a6;
  }

  return v14;
}

- (AMUISwitcherItem)fromItem
{
  _AMUISwitcherVisibleItemRecord *fromRecord;

  fromRecord = self->_fromRecord;
  if (fromRecord)
    return (AMUISwitcherItem *)objc_loadWeakRetained((id *)&fromRecord->_item);
  else
    return (AMUISwitcherItem *)0;
}

- (AMUISwitcherItem)toItem
{
  _AMUISwitcherVisibleItemRecord *toRecord;

  toRecord = self->_toRecord;
  if (toRecord)
    return (AMUISwitcherItem *)objc_loadWeakRetained((id *)&toRecord->_item);
  else
    return (AMUISwitcherItem *)0;
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *userInfo;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v9 = self->_userInfo;
    self->_userInfo = v8;

    userInfo = self->_userInfo;
  }
  -[NSMutableDictionary setObject:forKey:](userInfo, "setObject:forKey:", v10, v6);

}

- (id)userInfoObjectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_userInfo, "objectForKey:", a3);
}

- (void)removeUserInfoObjectForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_userInfo, "removeObjectForKey:", a3);
}

- (int64_t)direction
{
  return self->_direction;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_toRecord, 0);
  objc_storeStrong((id *)&self->_fromRecord, 0);
}

@end
