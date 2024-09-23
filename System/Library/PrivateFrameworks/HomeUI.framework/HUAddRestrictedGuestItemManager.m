@implementation HUAddRestrictedGuestItemManager

- (HUAddRestrictedGuestItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 home:(id)a5 inviteeAddresses:(id)a6
{
  id v11;
  id v12;
  HUAddRestrictedGuestItemManager *v13;
  HUAddRestrictedGuestItemManager *v14;
  void *v15;
  uint64_t v16;
  HFSchedule *defaultAccessSchedule;
  objc_super v19;

  v11 = a5;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HUAddRestrictedGuestItemManager;
  v13 = -[HFItemManager initWithDelegate:sourceItem:](&v19, sel_initWithDelegate_sourceItem_, a3, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_overrideHome, a5);
    objc_storeStrong((id *)&v14->_inviteeAddresses, a6);
    objc_msgSend(MEMORY[0x1E0D31728], "scheduleBuilderFromType:withDefaultRules:", 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "build");
    v16 = objc_claimAutoreleasedReturnValue();
    defaultAccessSchedule = v14->_defaultAccessSchedule;
    v14->_defaultAccessSchedule = (HFSchedule *)v16;

  }
  return v14;
}

- (HUAddRestrictedGuestItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_sourceItem_home_inviteeAddresses_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAddRestrictedGuestItemManager.m"), 54, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAddRestrictedGuestItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUAddRestrictedGuestItemManager)initWithDelegate:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_sourceItem_home_inviteeAddresses_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAddRestrictedGuestItemManager.m"), 59, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAddRestrictedGuestItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  HURestrictedGuestScheduleItem *v6;
  void *v7;
  HURestrictedGuestScheduleItem *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = [HURestrictedGuestScheduleItem alloc];
  -[HUAddRestrictedGuestItemManager defaultAccessSchedule](self, "defaultAccessSchedule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HURestrictedGuestScheduleItem initWithSchedule:](v6, "initWithSchedule:", v7);
  -[HUAddRestrictedGuestItemManager setHomeScheduleItem:](self, "setHomeScheduleItem:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D310B0]), "initWithHome:", v4);
  -[HUAddRestrictedGuestItemManager setSecureAccessoryItemProvider:](self, "setSecureAccessoryItemProvider:", v9);

  -[HUAddRestrictedGuestItemManager secureAccessoryItemProvider](self, "secureAccessoryItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFilter:", &__block_literal_global_94);

  v11 = objc_alloc(MEMORY[0x1E0D31928]);
  -[HUAddRestrictedGuestItemManager secureAccessoryItemProvider](self, "secureAccessoryItemProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __62__HUAddRestrictedGuestItemManager__buildItemProvidersForHome___block_invoke_2;
  v21[3] = &unk_1E6F532E0;
  v21[4] = self;
  v13 = (void *)objc_msgSend(v11, "initWithSourceProvider:transformationBlock:", v12, v21);
  -[HUAddRestrictedGuestItemManager setTransformedSecureAccessoryItemProvider:](self, "setTransformedSecureAccessoryItemProvider:", v13);

  -[HUAddRestrictedGuestItemManager homeScheduleItem](self, "homeScheduleItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v14);

  v15 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithItems:", v16);

  v22[0] = v17;
  -[HUAddRestrictedGuestItemManager transformedSecureAccessoryItemProvider](self, "transformedSecureAccessoryItemProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __62__HUAddRestrictedGuestItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "hf_isRestrictedGuestAllowedAccessory");
  return v6;
}

id __62__HUAddRestrictedGuestItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D31920]);
  v9 = (void *)objc_msgSend(v4, "copy");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__HUAddRestrictedGuestItemManager__buildItemProvidersForHome___block_invoke_3;
  v14[3] = &unk_1E6F4E628;
  v10 = *(_QWORD *)(a1 + 32);
  v15 = v7;
  v16 = v10;
  v11 = v7;
  v12 = (void *)objc_msgSend(v8, "initWithSourceItem:transformationBlock:", v9, v14);

  return v12;
}

id __62__HUAddRestrictedGuestItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30D18]);

  objc_msgSend(*(id *)(a1 + 40), "_accessoryToSymbolIconIdentifier:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30C78]);

  objc_msgSend(MEMORY[0x1E0D31130], "securityAccessoryTypeGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hu_tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30D10]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30E20]);

  return v2;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
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
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v20 = a3;
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HomeAccessScheduleSection"));
  -[HUAddRestrictedGuestItemManager homeScheduleItem](self, "homeScheduleItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v8);

  HFLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderTitle:", v9);

  _HULocalizedStringWithDefaultValue(CFSTR("HURestrictedGuestScheduleItem_NewInviteUser_Footer"), CFSTR("HURestrictedGuestScheduleItem_NewInviteUser_Footer"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFooterTitle:", v10);

  objc_msgSend(v5, "addObject:", v6);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("AccessoriesSection"));
  -[HUAddRestrictedGuestItemManager transformedSecureAccessoryItemProvider](self, "transformedSecureAccessoryItemProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sortedArrayUsingComparator:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  objc_msgSend(v11, "setItems:", v17);
  objc_msgSend(v5, "addObject:", v11);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)updateAccessSchedule:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  HUAddRestrictedGuestItemManager *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HUAddRestrictedGuestItemManager homeScheduleItem](self, "homeScheduleItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "schedule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315650;
    v18 = (HUAddRestrictedGuestItemManager *)"-[HUAddRestrictedGuestItemManager updateAccessSchedule:]";
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "(%s) Requesting to update access schedule from %@ to %@", (uint8_t *)&v17, 0x20u);

  }
  if (v5)
  {
    -[HUAddRestrictedGuestItemManager homeScheduleItem](self, "homeScheduleItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSchedule:", v5);

    v10 = (void *)MEMORY[0x1E0D314C0];
    v11 = (void *)MEMORY[0x1E0C99E60];
    -[HUAddRestrictedGuestItemManager homeScheduleItem](self, "homeScheduleItem");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithObject:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestToUpdateItems:senderSelector:", v13, a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HFItemManager performItemUpdateRequest:](self, "performItemUpdateRequest:", v14);

  }
  else
  {
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = self;
      v19 = 2112;
      v20 = v16;
      _os_log_error_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_ERROR, "%@:%@ No access schedule defined. Cannot update access schedule.", (uint8_t *)&v17, 0x16u);

    }
  }

}

- (void)sendInvitesWithAllowedAccessories:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18[2];
  _QWORD v19[4];
  id v20[2];
  _QWORD v21[4];
  id v22;
  id v23[2];
  id location;
  _QWORD v25[5];

  v5 = a3;
  -[HUAddRestrictedGuestItemManager inviteeAddresses](self, "inviteeAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location) = 0;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "Invalid configuration. Unable to send invitations without invitee addresses", (uint8_t *)&location, 2u);
    }

  }
  -[HUAddRestrictedGuestItemManager inviteeAddresses](self, "inviteeAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke;
  v25[3] = &unk_1E6F53308;
  v25[4] = self;
  objc_msgSend(v9, "na_map:", v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_90;
  v21[3] = &unk_1E6F53380;
  objc_copyWeak(v23, &location);
  v23[1] = (id)a2;
  v13 = v5;
  v22 = v13;
  objc_msgSend(v12, "flatMap:", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_2_97;
  v19[3] = &unk_1E6F533A8;
  objc_copyWeak(v20, &location);
  v20[1] = (id)a2;
  v15 = (id)objc_msgSend(v14, "addFailureBlock:", v19);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_102;
  v17[3] = &unk_1E6F533D0;
  objc_copyWeak(v18, &location);
  v18[1] = (id)a2;
  v16 = (id)objc_msgSend(v14, "addSuccessBlock:", v17);
  objc_destroyWeak(v18);
  objc_destroyWeak(v20);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

}

id __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outgoingInvitations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v3;
    v30 = 2112;
    v31 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_INFO, "Attempting to remove existing invitations that match address %@. Invitations: %@", buf, 0x16u);
  }

  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "invitee");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "userID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v3, "isEqualToString:", v13);

        if ((v14 & 1) != 0)
        {
          v15 = MEMORY[0x1E0C809B0];
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_84;
          v22[3] = &unk_1E6F4C5E8;
          v22[4] = v11;
          objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v22);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = v15;
          v21[1] = 3221225472;
          v21[2] = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_2;
          v21[3] = &unk_1E6F4E2D8;
          v21[4] = v11;
          objc_msgSend(v16, "addFailureBlock:", v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = v15;
          v19[1] = 3221225472;
          v19[2] = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_87;
          v19[3] = &unk_1E6F502A0;
          v20 = v3;
          objc_msgSend(v17, "addSuccessBlock:", v19);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }
      }
      v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

  return v8;
}

uint64_t __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_84(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelInviteWithCompletionHandler:", a2);
}

void __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v5;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "Removing existing invitation failed: %@ invitation: %@", (uint8_t *)&v6, 0x16u);
  }

}

void __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_87(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_INFO, "Successfully removed existing invitation for %@", (uint8_t *)&v4, 0xCu);
  }

}

id __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_90(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9[2];

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_2_91;
  v7[3] = &unk_1E6F53358;
  objc_copyWeak(v9, a1 + 5);
  v9[1] = a1[6];
  v8 = a1[4];
  objc_msgSend(v4, "futureWithCompletionHandlerAdapterBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v9);
  return v5;
}

void __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_2_91(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "inviteeAddresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v18 = WeakRetained;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Sending invitation(s) to address(es): %@", buf, 0x20u);

  }
  objc_msgSend(WeakRetained, "inviteeAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_92;
  v14 = &unk_1E6F53330;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v8, "na_map:", &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "home", v11, v12, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inviteUsersWithInviteInformation:completionHandler:", v9, v3);

  objc_destroyWeak(&v16);
}

id __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_92(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "mutableRestrictedGuestHomeAccessSettingsWithAllowedAccessories:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA948]), "initWithUser:administrator:remoteAccess:announceAccess:camerasAccessLevel:restrictedGuest:restrictedGuestHomeAccessSettings:", v4, 0, 0, 0, 0, 1, v6);

  return v7;
}

void __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_2_97(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "inviteeAddresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v22 = WeakRetained;
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Failed to send out invitation(s) to address(es): %@", buf, 0x20u);

  }
  objc_msgSend(WeakRetained, "inviteeAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = (id *)MEMORY[0x1E0D30990];
  if (v9 != 1)
    v10 = (id *)MEMORY[0x1E0D30998];
  v11 = *v10;

  objc_msgSend(WeakRetained, "restrictedGuestDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "restrictedGuestDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "restrictedGuestItemManager:didFailToSendInvitations:", WeakRetained, v3);

  }
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "inviteeAddresses", *MEMORY[0x1E0D305A8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleError:operationType:options:retryBlock:cancelBlock:", v3, v11, v18, 0, 0);

}

void __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_102(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "inviteeAddresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v20 = WeakRetained;
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Successfully sent invitation(s) to address(es): %@", buf, 0x20u);

  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_104;
    v16 = &unk_1E6F4F418;
    v17 = WeakRetained;
    v9 = v3;
    v18 = v9;
    objc_msgSend(v8, "dispatchHomeObserverMessage:sender:", &v13, 0);

    objc_msgSend(WeakRetained, "restrictedGuestDelegate", v13, v14, v15, v16, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "restrictedGuestDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "restrictedGuestItemManager:didSendInvitations:", WeakRetained, v9);

    }
  }

}

void __69__HUAddRestrictedGuestItemManager_sendInvitesWithAllowedAccessories___block_invoke_104(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home:didUpdateStateForOutgoingInvitations:", v3, *(_QWORD *)(a1 + 40));

  }
}

- (id)mutableRestrictedGuestHomeAccessSettingsWithAllowedAccessories:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  int v25;
  HUAddRestrictedGuestItemManager *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0CBA6F8]);
  -[HUAddRestrictedGuestItemManager homeScheduleItem](self, "homeScheduleItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "schedule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CBA7C8];
    -[HUAddRestrictedGuestItemManager homeScheduleItem](self, "homeScheduleItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "schedule");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_restrictedGuestHomeAccessScheduleFromHFSchedule:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGuestAccessSchedule:", v12);

    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_6;
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "guestAccessSchedule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddRestrictedGuestItemManager homeScheduleItem](self, "homeScheduleItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "schedule");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138413058;
    v26 = self;
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v17;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ Sending user invitation(s) with guest access schedule [%@] from schedule [%@].", (uint8_t *)&v25, 0x2Au);

    goto LABEL_4;
  }
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412546;
    v26 = self;
    v27 = 2112;
    v28 = v14;
    _os_log_error_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_ERROR, "%@:%@ No access schedule defined for user invitation(s). Unexpected.", (uint8_t *)&v25, 0x16u);
LABEL_4:

  }
LABEL_6:

  if (v5)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);
    objc_msgSend(v6, "setAccessAllowedToAccessories:", v18);

    HFLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412802;
      v26 = self;
      v27 = 2112;
      v28 = v20;
      v29 = 2112;
      v30 = v5;
      v21 = "%@:%@ Sending user invitation(s) with allowed accessories [%@].";
      v22 = v19;
      v23 = 32;
LABEL_11:
      _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v25, v23);

    }
  }
  else
  {
    HFLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = self;
      v27 = 2112;
      v28 = v20;
      v21 = "%@:%@ No allowed accessories defined for user invitation(s).";
      v22 = v19;
      v23 = 22;
      goto LABEL_11;
    }
  }

  return v6;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUAddRestrictedGuestItemManager overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessoryToSymbolIconIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id *v5;
  int v6;
  id v7;

  objc_msgSend(a3, "hf_primaryService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB9A00]) & 1) != 0)
  {
    v5 = (id *)MEMORY[0x1E0D30F60];
  }
  else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB9A80]) & 1) != 0)
  {
    v5 = (id *)MEMORY[0x1E0D30F70];
  }
  else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB9A28]) & 1) != 0)
  {
    v5 = (id *)MEMORY[0x1E0D30F68];
  }
  else
  {
    v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB9AA8]);
    v5 = (id *)MEMORY[0x1E0D30F80];
    if (v6)
      v5 = (id *)MEMORY[0x1E0D30F78];
  }
  v7 = *v5;

  return v7;
}

- (HUAddRestrictedGuestItemManagerDelegate)restrictedGuestDelegate
{
  return (HUAddRestrictedGuestItemManagerDelegate *)objc_loadWeakRetained((id *)&self->_restrictedGuestDelegate);
}

- (void)setRestrictedGuestDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_restrictedGuestDelegate, a3);
}

- (NSArray)inviteeAddresses
{
  return self->_inviteeAddresses;
}

- (HFSchedule)defaultAccessSchedule
{
  return self->_defaultAccessSchedule;
}

- (HURestrictedGuestScheduleItem)homeScheduleItem
{
  return self->_homeScheduleItem;
}

- (void)setHomeScheduleItem:(id)a3
{
  objc_storeStrong((id *)&self->_homeScheduleItem, a3);
}

- (HFTransformItemProvider)transformedSecureAccessoryItemProvider
{
  return self->_transformedSecureAccessoryItemProvider;
}

- (void)setTransformedSecureAccessoryItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_transformedSecureAccessoryItemProvider, a3);
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HFAccessoryItemProvider)secureAccessoryItemProvider
{
  return self->_secureAccessoryItemProvider;
}

- (void)setSecureAccessoryItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_secureAccessoryItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureAccessoryItemProvider, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_transformedSecureAccessoryItemProvider, 0);
  objc_storeStrong((id *)&self->_homeScheduleItem, 0);
  objc_storeStrong((id *)&self->_defaultAccessSchedule, 0);
  objc_storeStrong((id *)&self->_inviteeAddresses, 0);
  objc_destroyWeak((id *)&self->_restrictedGuestDelegate);
}

@end
