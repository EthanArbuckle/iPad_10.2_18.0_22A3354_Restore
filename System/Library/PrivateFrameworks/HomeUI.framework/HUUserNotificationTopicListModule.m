@implementation HUUserNotificationTopicListModule

+ (NSString)sectionID
{
  return (NSString *)CFSTR("notificationTopics");
}

- (HUUserNotificationTopicListModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUUserNotificationTopicListModule.m"), 37, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUUserNotificationTopicListModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (HUUserNotificationTopicListModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7;
  HUUserNotificationTopicListModule *v8;
  HUUserNotificationTopicListModule *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUUserNotificationTopicListModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v11, sel_initWithItemUpdater_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    -[HUUserNotificationTopicListModule _buildItemProviders](v9, "_buildItemProviders");
  }

  return v9;
}

- (void)_buildItemProviders
{
  HUBridgeListItem *v3;
  void *v4;
  HUBridgeListItem *v5;
  HUNetworkRouterListItem *v6;
  void *v7;
  HUNetworkRouterListItem *v8;
  HUMediaAccessControlItem *v9;
  void *v10;
  HUMediaAccessControlItem *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HFStaticItemProvider *v18;
  HFStaticItemProvider *staticItemProvider;
  id v20;
  HFUserNotificationServiceTopicItemProvider *v21;
  HFUserNotificationServiceTopicItemProvider *notificationTopicItemProvider;
  id v23;

  v3 = [HUBridgeListItem alloc];
  -[HUUserNotificationTopicListModule home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUBridgeListItem initWithHome:](v3, "initWithHome:", v4);
  -[HUUserNotificationTopicListModule setBridgesItem:](self, "setBridgesItem:", v5);

  v6 = [HUNetworkRouterListItem alloc];
  -[HUUserNotificationTopicListModule home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HUNetworkRouterListItem initWithHome:](v6, "initWithHome:", v7);
  -[HUUserNotificationTopicListModule setNetworkRoutersListItem:](self, "setNetworkRoutersListItem:", v8);

  v9 = [HUMediaAccessControlItem alloc];
  -[HUUserNotificationTopicListModule home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HUMediaAccessControlItem initWithHome:](v9, "initWithHome:", v10);
  -[HUUserNotificationTopicListModule setSpeakerSettingsItem:](self, "setSpeakerSettingsItem:", v11);

  v12 = objc_alloc(MEMORY[0x1E0D31848]);
  v13 = (void *)MEMORY[0x1E0C99E60];
  -[HUUserNotificationTopicListModule bridgesItem](self, "bridgesItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUserNotificationTopicListModule networkRoutersListItem](self, "networkRoutersListItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUserNotificationTopicListModule speakerSettingsItem](self, "speakerSettingsItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithObjects:", v14, v15, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (HFStaticItemProvider *)objc_msgSend(v12, "initWithItems:", v17);
  staticItemProvider = self->_staticItemProvider;
  self->_staticItemProvider = v18;

  v20 = objc_alloc(MEMORY[0x1E0D319B8]);
  -[HUUserNotificationTopicListModule home](self, "home");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v21 = (HFUserNotificationServiceTopicItemProvider *)objc_msgSend(v20, "initWithHome:", v23);
  notificationTopicItemProvider = self->_notificationTopicItemProvider;
  self->_notificationTopicItemProvider = v21;

}

- (id)itemProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E20];
  -[HUUserNotificationTopicListModule notificationTopicItemProvider](self, "notificationTopicItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUUserNotificationTopicListModule staticItemProvider](self, "staticItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v6);

  return v5;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUUserNotificationTopicListModule notificationTopicItemProvider](self, "notificationTopicItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUUserNotificationTopicListModule staticItemProvider](self, "staticItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0D31570]);
  objc_msgSend((id)objc_opt_class(), "sectionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithIdentifier:", v13);

  objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingComparator:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setItems:", v16);

  v17 = (void *)MEMORY[0x1E0D314B0];
  v21[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "filterSections:toDisplayedItems:", v18, v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)topicForItem:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_opt_class();
  v5 = v3;
  if (!v5)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v4, objc_opt_class());

LABEL_7:
    v7 = 0;
  }

  objc_msgSend(v7, "topic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (HFItem)bridgesItem
{
  return self->_bridgesItem;
}

- (void)setBridgesItem:(id)a3
{
  objc_storeStrong((id *)&self->_bridgesItem, a3);
}

- (HFItem)networkRoutersListItem
{
  return self->_networkRoutersListItem;
}

- (void)setNetworkRoutersListItem:(id)a3
{
  objc_storeStrong((id *)&self->_networkRoutersListItem, a3);
}

- (HFItem)speakerSettingsItem
{
  return self->_speakerSettingsItem;
}

- (void)setSpeakerSettingsItem:(id)a3
{
  objc_storeStrong((id *)&self->_speakerSettingsItem, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (HFUserNotificationServiceTopicItemProvider)notificationTopicItemProvider
{
  return self->_notificationTopicItemProvider;
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_notificationTopicItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_speakerSettingsItem, 0);
  objc_storeStrong((id *)&self->_networkRoutersListItem, 0);
  objc_storeStrong((id *)&self->_bridgesItem, 0);
}

@end
