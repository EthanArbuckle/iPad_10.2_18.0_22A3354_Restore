@implementation HUUserNotificationTopicServiceListModule

- (HUUserNotificationTopicServiceListModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_topic_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUUserNotificationTopicServiceListModule.m"), 29, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUUserNotificationTopicServiceListModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (HUUserNotificationTopicServiceListModule)initWithItemUpdater:(id)a3 home:(id)a4 topic:(id)a5
{
  id v9;
  id v10;
  HUUserNotificationTopicServiceListModule *v11;
  HUUserNotificationTopicServiceListModule *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUUserNotificationTopicServiceListModule;
  v11 = -[HFItemModule initWithItemUpdater:](&v14, sel_initWithItemUpdater_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a4);
    objc_storeStrong((id *)&v12->_topic, a5);
    -[HUUserNotificationTopicServiceListModule _buildItemProviders](v12, "_buildItemProviders");
  }

  return v12;
}

+ (id)_createTransformItemForItem:(id)a3 notificationSettingsProvider:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0D31920]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __101__HUUserNotificationTopicServiceListModule__createTransformItemForItem_notificationSettingsProvider___block_invoke;
  v12[3] = &unk_1E6F554C8;
  v13 = v6;
  v14 = v5;
  v8 = v5;
  v9 = v6;
  v10 = (void *)objc_msgSend(v7, "initWithSourceItem:transformationBlock:", v8, v12);

  return v10;
}

id __101__HUUserNotificationTopicServiceListModule__createTransformItemForItem_notificationSettingsProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "hf_userNotificationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "areNotificationsEnabled");

  if (v5)
    v6 = CFSTR("HUNotificationTopicServiceNotificationsEnabled");
  else
    v6 = CFSTR("HUNotificationTopicServiceNotificationsDisabled");
  _HULocalizedStringWithDefaultValue(v6, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D30BF8];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30BF8]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  objc_opt_class();
  v9 = *(id *)(a1 + 40);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    objc_msgSend(v11, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "category");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "categoryType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", *MEMORY[0x1E0CB7A60]);
    v16 = CFSTR("VideoDoorbell");
    if (v15)
      v16 = CFSTR("IPCamera");
    v17 = v16;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HUUserNotificationTopicSubtitle_%@"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    _HULocalizedStringWithDefaultValue(v18, v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("HUUserNotificationTopicSubtitleResultKey"));
    v20 = (void *)MEMORY[0x1E0D31228];
    objc_msgSend(v11, "profile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "shouldReportNotificationsAsDisabledForProfile:", v21))
      v22 = CFSTR("HUNotificationTopicServiceNotificationsDisabled");
    else
      v22 = CFSTR("HUNotificationTopicServiceNotificationsEnabled");
    _HULocalizedStringWithDefaultValue(v22, v22, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, v8);

  }
  return v3;
}

- (void)_buildItemProviders
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  HFTransformItemProvider *v10;
  HFTransformItemProvider *transformServiceItemProvider;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  HFTransformItemProvider *v18;
  HFTransformItemProvider *transformCameraItemProvider;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;

  objc_initWeak(&location, self);
  -[HUUserNotificationTopicServiceListModule topic](self, "topic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D317D8]);
  -[HUUserNotificationTopicServiceListModule home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  v7 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke;
  v29[3] = &unk_1E6F4DD60;
  objc_copyWeak(&v30, &location);
  objc_msgSend(v6, "setFilter:", v29);
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke_2;
  v27[3] = &unk_1E6F4F118;
  v8 = v3;
  v28 = v8;
  objc_msgSend(v6, "setSourceServiceGenerator:", v27);
  v9 = objc_alloc(MEMORY[0x1E0D31928]);
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke_3;
  v25[3] = &unk_1E6F554F0;
  objc_copyWeak(&v26, &location);
  v10 = (HFTransformItemProvider *)objc_msgSend(v9, "initWithSourceProvider:transformationBlock:", v6, v25);
  transformServiceItemProvider = self->_transformServiceItemProvider;
  self->_transformServiceItemProvider = v10;

  objc_msgSend(v8, "accessoryCategoryTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", *MEMORY[0x1E0CB7A60]);

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0D31230]);
    -[HUUserNotificationTopicServiceListModule home](self, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithHome:", v15);

    v22[0] = v7;
    v22[1] = 3221225472;
    v22[2] = __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke_4;
    v22[3] = &unk_1E6F55518;
    objc_copyWeak(&v24, &location);
    v23 = v8;
    objc_msgSend(v16, "setFilter:", v22);
    v17 = objc_alloc(MEMORY[0x1E0D31928]);
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke_5;
    v20[3] = &unk_1E6F55540;
    objc_copyWeak(&v21, &location);
    v18 = (HFTransformItemProvider *)objc_msgSend(v17, "initWithSourceProvider:transformationBlock:", v16, v20);
    transformCameraItemProvider = self->_transformCameraItemProvider;
    self->_transformCameraItemProvider = v18;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v24);

  }
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

BOOL __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  v5 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
    NSLog(CFSTR("Object class is not an HMService %@"), v5);

  return v7 != 0;
}

id __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0D519C0];
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "hf_servicesAffectedByServiceTopic:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_opt_class();
  objc_msgSend(v3, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_createTransformItemForItem:notificationSettingsProvider:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_opt_class();
  v5 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = *(void **)(a1 + 32);
  objc_msgSend(WeakRetained, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_userNotificationTopicForCameraProfile:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  v12 = v10;
  if (v11 == v12)
  {
    v13 = 1;
  }
  else if (v11)
  {
    v13 = objc_msgSend(v11, "isEqual:", v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_opt_class();
  objc_msgSend(v3, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_createTransformItemForItem:notificationSettingsProvider:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)itemProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E20];
  -[HUUserNotificationTopicServiceListModule transformServiceItemProvider](self, "transformServiceItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUUserNotificationTopicServiceListModule transformCameraItemProvider](self, "transformCameraItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v6);

  return v5;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("NotificationSettings"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUNotificationTopicServiceListSectionHeaderTitle"), CFSTR("HUNotificationTopicServiceListSectionHeaderTitle"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderTitle:", v7);

  -[HFItemModule allItems](self, "allItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v11);

  v12 = (void *)MEMORY[0x1E0D314B0];
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "filterSections:toDisplayedItems:", v13, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)serviceLikeItemForItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "sourceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF2AC470))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (HMHome)home
{
  return self->_home;
}

- (HFUserNotificationServiceTopic)topic
{
  return self->_topic;
}

- (HFTransformItemProvider)transformServiceItemProvider
{
  return self->_transformServiceItemProvider;
}

- (HFTransformItemProvider)transformCameraItemProvider
{
  return self->_transformCameraItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformCameraItemProvider, 0);
  objc_storeStrong((id *)&self->_transformServiceItemProvider, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
