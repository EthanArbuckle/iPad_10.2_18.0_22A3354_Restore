@implementation HUQuickControlViewControllerCoordinator

- (HUQuickControlViewControllerCoordinator)initWithItem:(id)a3 controlItems:(id)a4 home:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HUQuickControlViewControllerCoordinator *v15;
  HUQuickControlViewControllerCoordinator *v16;
  objc_class *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  HFOverrideCharacteristicValueSource *valueSource;
  uint64_t v23;
  NSCopying *item;
  uint64_t v25;
  uint64_t v26;
  HFItem *reachabilityItem;
  id v28;
  void *v29;
  uint64_t v30;
  HFSimpleItemManager *reachabilityItemManager;
  id v32;
  void *v33;
  uint64_t v34;
  HFSimpleItemManager *itemManager;
  HUQuickControlContentCharacteristicWritingUpdateAdapter *v36;
  void *v37;
  uint64_t v38;
  HUQuickControlContentCharacteristicWritingUpdateAdapter *characteristicWritingAdapter;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  objc_super v46;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v46.receiver = self;
  v46.super_class = (Class)HUQuickControlViewControllerCoordinator;
  v15 = -[HUQuickControlViewControllerCoordinator init](&v46, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_home, a5);
    objc_storeWeak((id *)&v16->_delegate, v14);
    objc_storeStrong((id *)&v16->_controlItems, a4);
    if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EF2AC470))
    {
      v17 = (objc_class *)MEMORY[0x1E0D31618];
      v18 = v11;
      v19 = [v17 alloc];
      objc_msgSend(v18, "valueSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "initWithOriginalValueSource:overrideValueProvider:", v20, v16);
      valueSource = v16->_valueSource;
      v16->_valueSource = (HFOverrideCharacteristicValueSource *)v21;

      v23 = objc_msgSend(v18, "copyWithValueSource:", v16->_valueSource);
      item = v16->_item;
      v16->_item = (NSCopying *)v23;
    }
    else
    {
      v25 = objc_msgSend(v11, "copy");
      item = v16->_item;
      v16->_item = (NSCopying *)v25;
    }

    -[HUQuickControlViewControllerCoordinator _createControlViewControllersForControlItems:](v16, "_createControlViewControllersForControlItems:", v12);
    v26 = objc_msgSend(v11, "copy");
    reachabilityItem = v16->_reachabilityItem;
    v16->_reachabilityItem = (HFItem *)v26;

    v28 = objc_alloc(MEMORY[0x1E0D31810]);
    -[HUQuickControlViewControllerCoordinator reachabilityItem](v16, "reachabilityItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "initWithDelegate:sourceItem:", v16, v29);
    reachabilityItemManager = v16->_reachabilityItemManager;
    v16->_reachabilityItemManager = (HFSimpleItemManager *)v30;

    v32 = objc_alloc(MEMORY[0x1E0D31810]);
    -[HUQuickControlViewControllerCoordinator item](v16, "item");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "initWithDelegate:sourceItem:", v16, v33);
    itemManager = v16->_itemManager;
    v16->_itemManager = (HFSimpleItemManager *)v34;

    v36 = [HUQuickControlContentCharacteristicWritingUpdateAdapter alloc];
    -[HUQuickControlViewControllerCoordinator itemManager](v16, "itemManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[HUQuickControlContentCharacteristicWritingUpdateAdapter initWithItemManager:](v36, "initWithItemManager:", v37);
    characteristicWritingAdapter = v16->_characteristicWritingAdapter;
    v16->_characteristicWritingAdapter = (HUQuickControlContentCharacteristicWritingUpdateAdapter *)v38;

    -[HUQuickControlViewControllerCoordinator characteristicWritingAdapter](v16, "characteristicWritingAdapter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlViewController setCharacteristicWritingDelegate:](v16->_activeController, "setCharacteristicWritingDelegate:", v40);

    -[HUQuickControlViewControllerCoordinator _updateIconDescriptorNotifyingDelegate:](v16, "_updateIconDescriptorNotifyingDelegate:", 0);
    -[HUQuickControlViewControllerCoordinator _updateStatusTextNotifyingDelegate:](v16, "_updateStatusTextNotifyingDelegate:", 0);
    -[HUQuickControlViewControllerCoordinator _updateReachabilityStateNotifiyingDelegate:](v16, "_updateReachabilityStateNotifiyingDelegate:", 0);
    -[HUQuickControlViewControllerCoordinator itemManager](v16, "itemManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (id)objc_msgSend(v41, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

    -[HUQuickControlViewControllerCoordinator reachabilityItemManager](v16, "reachabilityItemManager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (id)objc_msgSend(v43, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

  }
  return v16;
}

- (void)_createControlViewControllersForControlItems:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  HUQuickControlViewControllerConfiguration *v7;
  void *v8;
  HUQuickControlViewControllerConfiguration *v9;
  HUQuickControlViewControllerConfiguration *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  HUQuickControlGridViewController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  HUQuickControlGridViewController *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  HUQuickControlViewControllerCoordinator *v40;
  HUQuickControlViewControllerConfiguration *v41;
  id v42;

  v42 = a3;
  -[HUQuickControlViewControllerCoordinator delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isConfiguredForNonHomeUser:", self);

  if (!v5)
    goto LABEL_3;
  objc_msgSend(v42, "na_firstObjectPassingTest:", &__block_literal_global_234);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [HUQuickControlViewControllerConfiguration alloc];
  objc_msgSend(v6, "mediaRoutingIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HUQuickControlViewControllerConfiguration initWithMediaRoutingIdentifier:](v7, "initWithMediaRoutingIdentifier:", v8);

  if (!v9)
  {
LABEL_3:
    v10 = [HUQuickControlViewControllerConfiguration alloc];
    -[HUQuickControlViewControllerCoordinator home](self, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HUQuickControlViewControllerConfiguration initWithHome:](v10, "initWithHome:", v11);

  }
  -[HUQuickControlViewControllerCoordinator valueSource](self, "valueSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlViewControllerConfiguration setValueSource:](v9, "setValueSource:", v12);

  v41 = v9;
  objc_msgSend(MEMORY[0x1E0D31328], "hu_preferredQuickControlGroupContextForControlItems:configuration:", v42, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "primaryQuickControlContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)objc_msgSend(v14, "quickControlClass"), "isEqual:", objc_opt_class()) & 1) != 0)
    goto LABEL_9;
  objc_msgSend(v13, "alternateQuickControlContexts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
  {

LABEL_9:
    goto LABEL_10;
  }
  objc_msgSend(v13, "primaryQuickControlContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend((id)objc_msgSend(v16, "quickControlClass"), "isEqual:", objc_opt_class());

  if ((v17 & 1) != 0)
  {
LABEL_10:
    objc_msgSend(v13, "primaryQuickControlContext");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_alloc((Class)objc_msgSend(v39, "quickControlClass"));
    objc_msgSend(v13, "primaryQuickControlContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "controlItems");
    v40 = self;
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "primaryQuickControlContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "home");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "primaryQuickControlContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "itemUpdater");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "primaryQuickControlContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "controlOrientation");
    objc_msgSend(v13, "primaryQuickControlContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (HUQuickControlGridViewController *)objc_msgSend(v38, "initWithControlItems:home:itemUpdater:controlOrientation:preferredControl:", v28, v23, v29, v31, objc_msgSend(v32, "preferredControl"));

    v21 = (void *)v28;
    self = v40;

    v20 = v27;
    v19 = v39;
    goto LABEL_11;
  }
  v18 = [HUQuickControlGridViewController alloc];
  objc_msgSend(v13, "allControlItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlViewControllerCoordinator home](self, "home");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "primaryQuickControlContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "itemUpdater");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "primaryQuickControlContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "controlOrientation");
  objc_msgSend(v13, "primaryQuickControlContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[HUQuickControlGridViewController initWithControlItems:home:itemUpdater:controlOrientation:preferredControl:](v18, "initWithControlItems:home:itemUpdater:controlOrientation:preferredControl:", v19, v20, v22, v24, objc_msgSend(v25, "preferredControl"));
LABEL_11:

  -[HUQuickControlViewControllerCoordinator setActiveController:](self, "setActiveController:", v26);
  -[HUQuickControlViewControllerCoordinator activeController](self, "activeController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setDelegate:", self);

  -[HUQuickControlViewControllerCoordinator characteristicWritingAdapter](self, "characteristicWritingAdapter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlViewControllerCoordinator activeController](self, "activeController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setCharacteristicWritingDelegate:", v34);

  -[HUQuickControlViewControllerCoordinator controlHost](self, "controlHost");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlViewControllerCoordinator activeController](self, "activeController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setQuickControlHost:", v36);

}

uint64_t __88__HUQuickControlViewControllerCoordinator__createControlViewControllersForControlItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)setControlHost:(id)a3
{
  HUQuickControlContentHosting **p_controlHost;
  id v5;

  p_controlHost = &self->_controlHost;
  v5 = a3;
  objc_storeWeak((id *)p_controlHost, v5);
  -[HUQuickControlViewController setQuickControlHost:](self->_activeController, "setQuickControlHost:", v5);

}

- (void)setControlsVisible:(BOOL)a3
{
  if (self->_controlsVisible != a3)
  {
    self->_controlsVisible = a3;
    -[HUQuickControlViewController setControlsVisible:](self->_activeController, "setControlsVisible:");
  }
}

- (void)setShouldIncludeRoomNameInHeaderTitle:(BOOL)a3
{
  if (self->_shouldIncludeRoomNameInHeaderTitle != a3)
  {
    self->_shouldIncludeRoomNameInHeaderTitle = a3;
    -[HUQuickControlViewControllerCoordinator _updateStatusTextNotifyingDelegate:](self, "_updateStatusTextNotifyingDelegate:", 1);
  }
}

- (id)_itemToUseForIconAndStatus
{
  if (-[HUQuickControlViewControllerCoordinator isReachable](self, "isReachable"))
    -[HUQuickControlViewControllerCoordinator item](self, "item");
  else
    -[HUQuickControlViewControllerCoordinator reachabilityItem](self, "reachabilityItem");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateIconDescriptorNotifyingDelegate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  HFIconDescriptor *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HFIconDescriptor *iconDescriptor;
  void *v13;
  void *v14;
  id v15;

  v3 = a3;
  -[HUQuickControlViewControllerCoordinator _itemToUseForIconAndStatus](self, "_itemToUseForIconAndStatus");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
  v6 = (HFIconDescriptor *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlViewControllerCoordinator activeController](self, "activeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v15, "latestResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E80]);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;

LABEL_5:
      LOBYTE(v7) = objc_msgSend(v10, "integerValue") != 2;

      goto LABEL_6;
    }
    objc_msgSend(v15, "latestResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_5;
    LOBYTE(v7) = 0;
  }
LABEL_6:
  iconDescriptor = self->_iconDescriptor;
  self->_iconDescriptor = v6;

  self->_showIconOffState = (char)v7;
  if (v3)
  {
    -[HUQuickControlViewControllerCoordinator delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlViewControllerCoordinator iconDescriptor](self, "iconDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "controllerCoordinator:didUpdateIconDescriptor:showOffState:", self, v14, -[HUQuickControlViewControllerCoordinator showIconOffState](self, "showIconOffState"));

  }
}

- (id)_primaryStatusTextForLatestResults:(id)a3 showingSecondaryStatus:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "-[HUQuickControlViewControllerCoordinator _primaryStatusTextForLatestResults:showingSecondaryStatus:]";
    v13 = 2112;
    v14 = v6;
    v15 = 1024;
    v16 = v4;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_INFO, "%s %@ %d", (uint8_t *)&v11, 0x1Cu);
  }

  if (v4
    || (objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C18]),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    && (objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C40]),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[HUQuickControlViewControllerCoordinator activeController](self, "activeController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "overrideStatusText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BC0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v9;
}

- (id)_secondaryStatusTextForLatestResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C40]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[HUQuickControlViewControllerCoordinator activeController](self, "activeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "overrideSecondaryStatusText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C10]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

- (void)_updateStatusTextNotifyingDelegate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  int v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v3 = a3;
  -[HUQuickControlViewControllerCoordinator _itemToUseForIconAndStatus](self, "_itemToUseForIconAndStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BE8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = &unk_1E70417A0;
  v8 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v8 == 1)
  {
    -[HUQuickControlViewControllerCoordinator item](self, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "length"))
      {
        objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BC0]);
        v13 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v13;
      }
    }
    else
    {
      objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CD8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HUQuickControlViewControllerCoordinator shouldIncludeRoomNameInHeaderTitle](self, "shouldIncludeRoomNameInHeaderTitle"))
      {
        objc_msgSend(v14, "composedString");
      }
      else
      {
        objc_msgSend(v14, "serviceName");
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlViewControllerCoordinator _primaryStatusTextForLatestResults:showingSecondaryStatus:](self, "_primaryStatusTextForLatestResults:showingSecondaryStatus:", v26, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else if (v8)
  {
    v10 = 0;
    v9 = 0;
  }
  else
  {
    -[HUQuickControlViewControllerCoordinator _primaryStatusTextForLatestResults:showingSecondaryStatus:](self, "_primaryStatusTextForLatestResults:showingSecondaryStatus:", v26, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlViewControllerCoordinator _secondaryStatusTextForLatestResults:](self, "_secondaryStatusTextForLatestResults:", v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HUQuickControlViewControllerCoordinator primaryStatusText](self, "primaryStatusText");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = &stru_1E6F60E80;
  v17 = -[__CFString isEqualToString:](v15, "isEqualToString:", v9);

  v18 = (void *)objc_msgSend(v9, "copy");
  -[HUQuickControlViewControllerCoordinator setPrimaryStatusText:](self, "setPrimaryStatusText:", v18);

  -[HUQuickControlViewControllerCoordinator secondaryStatusText](self, "secondaryStatusText");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
    v19 = &stru_1E6F60E80;
  v21 = -[__CFString isEqualToString:](v19, "isEqualToString:", v10);

  v22 = (void *)objc_msgSend(v10, "copy");
  -[HUQuickControlViewControllerCoordinator setSecondaryStatusText:](self, "setSecondaryStatusText:", v22);

  if ((v17 & v21 & 1) == 0 && v3)
  {
    -[HUQuickControlViewControllerCoordinator delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlViewControllerCoordinator primaryStatusText](self, "primaryStatusText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlViewControllerCoordinator secondaryStatusText](self, "secondaryStatusText");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "controllerCoordinator:didUpdateStatusWithPrimaryText:secondaryText:", self, v24, v25);

  }
}

- (void)_updateReachabilityStateNotifiyingDelegate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  _BOOL8 v10;
  void *v11;

  v3 = a3;
  -[HUQuickControlViewControllerCoordinator reachabilityItem](self, "reachabilityItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  v9 = v8 != 0;
  if (self->_reachable != v9)
  {
    self->_reachable = v9;
    if (v3)
    {
      v10 = v8 != 0;
      -[HUQuickControlViewControllerCoordinator delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "controllerCoordinator:didUpdateReachability:", self, v10);

    }
    -[HUQuickControlViewControllerCoordinator _updateStatusTextNotifyingDelegate:](self, "_updateStatusTextNotifyingDelegate:", 1);
    -[HUQuickControlViewControllerCoordinator _updateIconDescriptorNotifyingDelegate:](self, "_updateIconDescriptorNotifyingDelegate:", 1);
  }
}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  -[HUQuickControlViewControllerCoordinator reachabilityItem](self, "reachabilityItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v9)
  {
    -[HUQuickControlViewControllerCoordinator _updateReachabilityStateNotifiyingDelegate:](self, "_updateReachabilityStateNotifiyingDelegate:", 1);
  }
  else
  {
    -[HUQuickControlViewControllerCoordinator item](self, "item");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v9)
    {
      -[HUQuickControlViewControllerCoordinator _updateIconDescriptorNotifyingDelegate:](self, "_updateIconDescriptorNotifyingDelegate:", 1);
      -[HUQuickControlViewControllerCoordinator _updateStatusTextNotifyingDelegate:](self, "_updateStatusTextNotifyingDelegate:", 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlViewControllerCoordinator.m"), 291, CFSTR("Unknown source item %@"), v9);

    }
  }

}

- (BOOL)valueSource:(id)a3 shouldOverrideValueForCharacteristic:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[HUQuickControlViewControllerCoordinator _controllerForControllableCharacteristic:](self, "_controllerForControllableCharacteristic:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "overrideValueForCharacteristic:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 != 0;
}

- (id)valueSource:(id)a3 overrideValueForCharacteristic:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[HUQuickControlViewControllerCoordinator _controllerForControllableCharacteristic:](self, "_controllerForControllableCharacteristic:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "overrideValueForCharacteristic:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)quickControlViewControllerDidUpdateStatusOverrides:(id)a3
{
  -[HUQuickControlViewControllerCoordinator _updateStatusTextNotifyingDelegate:](self, "_updateStatusTextNotifyingDelegate:", 1);
}

- (HMHome)home
{
  return self->_home;
}

- (NSCopying)item
{
  return self->_item;
}

- (HUQuickControlViewControllerCoordinatorDelegate)delegate
{
  return (HUQuickControlViewControllerCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HUQuickControlContentHosting)controlHost
{
  return (HUQuickControlContentHosting *)objc_loadWeakRetained((id *)&self->_controlHost);
}

- (HUQuickControlViewController)activeController
{
  return self->_activeController;
}

- (void)setActiveController:(id)a3
{
  objc_storeStrong((id *)&self->_activeController, a3);
}

- (BOOL)areControlsVisible
{
  return self->_controlsVisible;
}

- (BOOL)shouldIncludeRoomNameInHeaderTitle
{
  return self->_shouldIncludeRoomNameInHeaderTitle;
}

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (BOOL)showIconOffState
{
  return self->_showIconOffState;
}

- (NSString)primaryStatusText
{
  return self->_primaryStatusText;
}

- (void)setPrimaryStatusText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)secondaryStatusText
{
  return self->_secondaryStatusText;
}

- (void)setSecondaryStatusText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (HFOverrideCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (HFSimpleItemManager)itemManager
{
  return self->_itemManager;
}

- (NSSet)controlItems
{
  return self->_controlItems;
}

- (HFItem)reachabilityItem
{
  return self->_reachabilityItem;
}

- (HFSimpleItemManager)reachabilityItemManager
{
  return self->_reachabilityItemManager;
}

- (HUQuickControlContentCharacteristicWritingUpdateAdapter)characteristicWritingAdapter
{
  return self->_characteristicWritingAdapter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicWritingAdapter, 0);
  objc_storeStrong((id *)&self->_reachabilityItemManager, 0);
  objc_storeStrong((id *)&self->_reachabilityItem, 0);
  objc_storeStrong((id *)&self->_controlItems, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_secondaryStatusText, 0);
  objc_storeStrong((id *)&self->_primaryStatusText, 0);
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_storeStrong((id *)&self->_activeController, 0);
  objc_destroyWeak((id *)&self->_controlHost);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
