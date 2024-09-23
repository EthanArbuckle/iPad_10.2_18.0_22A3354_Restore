@implementation ACActivityCenter

- (ACActivityCenter)init
{
  ACActivityCenter *v2;
  uint64_t v3;
  _TtC11ActivityKit24ActivityCenterObjcBridge *activityCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACActivityCenter;
  v2 = -[ACActivityCenter init](&v6, sel_init);
  if (v2)
  {
    +[ActivityCenterObjcBridge shared](_TtC11ActivityKit24ActivityCenterObjcBridge, "shared");
    v3 = objc_claimAutoreleasedReturnValue();
    activityCenter = v2->_activityCenter;
    v2->_activityCenter = (_TtC11ActivityKit24ActivityCenterObjcBridge *)v3;

  }
  return v2;
}

- (id)observeDescriptorsWithHandler:(id)a3
{
  id v4;
  _TtC11ActivityKit24ActivityCenterObjcBridge *activityCenter;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  activityCenter = self->_activityCenter;
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __50__ACActivityCenter_observeDescriptorsWithHandler___block_invoke;
  v14[3] = &unk_25042A7E0;
  v7 = v4;
  v15 = v7;
  -[ActivityCenterObjcBridge observeDescriptorsWithHandler:](activityCenter, "observeDescriptorsWithHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BE0BE98]);
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __50__ACActivityCenter_observeDescriptorsWithHandler___block_invoke_2;
    v12[3] = &unk_25042A790;
    v13 = v8;
    v10 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("ACActivityCenter"), CFSTR("allDescriptor listener"), v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __50__ACActivityCenter_observeDescriptorsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (id)objc_msgSend(a2, "copy");
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

uint64_t __50__ACActivityCenter_observeDescriptorsWithHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (id)observeContentUpdatesWithHandler:(id)a3
{
  id v4;
  _TtC11ActivityKit24ActivityCenterObjcBridge *activityCenter;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  activityCenter = self->_activityCenter;
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __53__ACActivityCenter_observeContentUpdatesWithHandler___block_invoke;
  v14[3] = &unk_25042A808;
  v7 = v4;
  v15 = v7;
  -[ActivityCenterObjcBridge observeActivityContentUpdatesWithHandler:](activityCenter, "observeActivityContentUpdatesWithHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BE0BE98]);
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __53__ACActivityCenter_observeContentUpdatesWithHandler___block_invoke_2;
    v12[3] = &unk_25042A790;
    v13 = v8;
    v10 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("ACActivityCenter"), CFSTR("activity content update observer"), v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __53__ACActivityCenter_observeContentUpdatesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __53__ACActivityCenter_observeContentUpdatesWithHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (id)observeActivitiesExceedingReducedPushBudgetWithHandler:(id)a3
{
  id v4;
  _TtC11ActivityKit24ActivityCenterObjcBridge *activityCenter;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  activityCenter = self->_activityCenter;
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __75__ACActivityCenter_observeActivitiesExceedingReducedPushBudgetWithHandler___block_invoke;
  v14[3] = &unk_25042A830;
  v7 = v4;
  v15 = v7;
  -[ActivityCenterObjcBridge observeActivitiesExceedingReducedPushBudgetWithHandler:](activityCenter, "observeActivitiesExceedingReducedPushBudgetWithHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BE0BE98]);
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __75__ACActivityCenter_observeActivitiesExceedingReducedPushBudgetWithHandler___block_invoke_2;
    v12[3] = &unk_25042A790;
    v13 = v8;
    v10 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("ACActivityCenter"), CFSTR("activities exceeding reduced push level listener"), v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __75__ACActivityCenter_observeActivitiesExceedingReducedPushBudgetWithHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __75__ACActivityCenter_observeActivitiesExceedingReducedPushBudgetWithHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (BOOL)isActivityActive:(id)a3
{
  return -[ActivityCenterObjcBridge isActivityActiveWithIdentifier:](self->_activityCenter, "isActivityActiveWithIdentifier:", a3);
}

- (BOOL)areActivitiesEnabled
{
  return -[ActivityCenterObjcBridge areActivitiesEnabled](self->_activityCenter, "areActivitiesEnabled");
}

- (void)endActivity:(id)a3
{
  -[ActivityCenterObjcBridge endActivity:](self->_activityCenter, "endActivity:", a3);
}

- (void)disableActivitiesWithBundleIdentifier:(id)a3
{
  -[ActivityCenterObjcBridge disableActivitiesWithBundleIdentifier:](self->_activityCenter, "disableActivitiesWithBundleIdentifier:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityCenter, 0);
}

@end
