@implementation HFUserNotificationServiceTopicItemProvider

- (HFUserNotificationServiceTopicItemProvider)initWithHome:(id)a3
{
  id v5;
  HFUserNotificationServiceTopicItemProvider *v6;
  HFUserNotificationServiceTopicItemProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFUserNotificationServiceTopicItemProvider;
  v6 = -[HFItemProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_home, a3);

  return v7;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;

  -[HFUserNotificationServiceTopicItemProvider home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_userNotificationServiceTopics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__HFUserNotificationServiceTopicItemProvider_reloadItems__block_invoke_2;
  v12[3] = &unk_1EA729058;
  v13 = &__block_literal_global_20;
  -[HFUserNotificationServiceTopicItemProvider filter](self, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __57__HFUserNotificationServiceTopicItemProvider_reloadItems__block_invoke_3;
  v11[3] = &unk_1EA729080;
  v11[4] = self;
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v4, &__block_literal_global_20, v12, v6, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __57__HFUserNotificationServiceTopicItemProvider_reloadItems__block_invoke_4;
  v10[3] = &unk_1EA7290A8;
  v10[4] = self;
  objc_msgSend(v7, "addSuccessBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __57__HFUserNotificationServiceTopicItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

id __57__HFUserNotificationServiceTopicItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "topic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

HFUserNotificationServiceTopicItem *__57__HFUserNotificationServiceTopicItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  HFUserNotificationServiceTopicItem *v4;
  void *v5;
  HFUserNotificationServiceTopicItem *v6;

  v3 = a2;
  v4 = [HFUserNotificationServiceTopicItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFUserNotificationServiceTopicItem initWithHome:topic:](v4, "initWithHome:topic:", v5, v3);

  return v6;
}

void __57__HFUserNotificationServiceTopicItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "allItems");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTopicItems:", v3);

}

- (id)items
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[HFUserNotificationServiceTopicItemProvider topicItems](self, "topicItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)invalidationReasons
{
  void *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFUserNotificationServiceTopicItemProvider;
  -[HFItemProvider invalidationReasons](&v6, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_MergedGlobals_2 != -1)
    dispatch_once(&_MergedGlobals_2, &__block_literal_global_10_0);
  v3 = (id)qword_1ED3789D8;
  objc_msgSend(v2, "setByAddingObjectsFromSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __65__HFUserNotificationServiceTopicItemProvider_invalidationReasons__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("service");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED3789D8;
  qword_1ED3789D8 = v2;

}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HMHome)home
{
  return self->_home;
}

- (NSSet)topicItems
{
  return self->_topicItems;
}

- (void)setTopicItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
