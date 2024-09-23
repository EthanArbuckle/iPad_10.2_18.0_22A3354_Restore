@implementation HUControlPanelController

- (HUControlPanelController)initWithDelegate:(id)a3
{
  id v4;
  HUControlPanelController *v5;
  HUControlPanelController *v6;
  uint64_t v7;
  NSSet *configurations;
  uint64_t v9;
  NSMutableDictionary *interactionStateByControlID;
  uint64_t v11;
  NSMutableSet *allItems;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUControlPanelController;
  v5 = -[HUControlPanelController init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[HUControlPanelController _createConfigurations](v6, "_createConfigurations");
    v7 = objc_claimAutoreleasedReturnValue();
    configurations = v6->_configurations;
    v6->_configurations = (NSSet *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    interactionStateByControlID = v6->_interactionStateByControlID;
    v6->_interactionStateByControlID = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    allItems = v6->_allItems;
    v6->_allItems = (NSMutableSet *)v11;

  }
  return v6;
}

- (void)addItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  HUControlInteractionState *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUControlPanelController allItems](self, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
    NSLog(CFSTR("Already added item %@!"), v4);
  -[NSMutableSet addObject:](self->_allItems, "addObject:", v4);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "controlItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v4, "identifierForControlItem:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUControlPanelController _createWriteThrottleForControlItem:controlPanelItem:](self, "_createWriteThrottleForControlItem:controlPanelItem:", v11, v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_alloc_init(HUControlInteractionState);
        -[HUControlInteractionState setWriteThrottler:](v14, "setWriteThrottler:", v13);
        -[HUControlPanelController interactionStateByControlID](self, "interactionStateByControlID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v12);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

- (void)removeItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUControlPanelController allItems](self, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
    NSLog(CFSTR("Item %@ not found!"), v4);
  -[NSMutableSet removeObject:](self->_allItems, "removeObject:", v4);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "controlItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v4, "identifierForControlItem:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUControlPanelController interactionStateByControlID](self, "interactionStateByControlID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObjectForKey:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (Class)cellClassForItem:(id)a3
{
  void *v3;
  void *v4;

  -[HUControlPanelController _configurationForItem:](self, "_configurationForItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (BOOL)shouldDisplayItem:(id)a3
{
  return -[HUControlPanelController cellClassForItem:](self, "cellClassForItem:", a3) != 0;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HUControlPanelController allItems](self, "allItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if ((v9 & 1) == 0)
    NSLog(CFSTR("Attempting to set up the cell for an item that hasn't yet been added! Item: %@"), v7);
  -[HUControlPanelController _configurationForItem:](self, "_configurationForItem:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setupControlsForCell:item:", v6, v7);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v6, "allControlViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v16, "setDelegate:", self);
        -[HUControlPanelController _updateStateForControlView:controlPanelItem:](self, "_updateStateForControlView:controlPanelItem:", v16, v7);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HUControlPanelController allItems](self, "allItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v8);

  if ((v10 & 1) == 0)
    NSLog(CFSTR("Attempting to update the cell for an item that hasn't yet been added! Item: %@"), v8);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v7, "allControlViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[HUControlPanelController _updateStateForControlView:controlPanelItem:](self, "_updateStateForControlView:controlPanelItem:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), v8);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (BOOL)shouldShowSectionTitleForItem:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HUControlPanelController _configurationForItem:](self, "_configurationForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "shouldShowSectionTitleForItem:", v4);
  else
    v6 = 1;

  return v6;
}

- (BOOL)shouldShowSectionFooterForItem:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HUControlPanelController _configurationForItem:](self, "_configurationForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "shouldShowSectionFooterForItem:", v4);
  else
    v6 = 1;

  return v6;
}

- (id)sectionTitleForItem:(id)a3 forSourceItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (-[HUControlPanelController shouldShowSectionTitleForItem:](self, "shouldShowSectionTitleForItem:", v6))
  {
    -[HUControlPanelController _configurationForItem:](self, "_configurationForItem:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "sectionTitleForItem:forSourceItem:", v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)sectionFooterForItem:(id)a3 forSourceItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (-[HUControlPanelController shouldShowSectionFooterForItem:](self, "shouldShowSectionFooterForItem:", v6))
  {
    -[HUControlPanelController _configurationForItem:](self, "_configurationForItem:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "sectionFooterForItem:forSourceItem:", v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_updateStateForControlView:(id)a3 controlPanelItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "controlItemForIdentifier:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30558]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUControlPanelController _valueTransformerForControlItem:controlPanelItem:](self, "_valueTransformerForControlItem:controlPanelItem:", v13, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "transformedValueForValue:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:", v12);

  objc_msgSend(v7, "setDisabled:", v10 == 0);
}

- (id)_controlPanelItemForControlView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  BOOL (*v11)(uint64_t, void *);
  void *v12;
  id v13;

  v4 = a3;
  -[HUControlPanelController allItems](self, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __60__HUControlPanelController__controlPanelItemForControlView___block_invoke;
  v12 = &unk_1E6F5ED00;
  v6 = v4;
  v13 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    NSLog(CFSTR("No control panel item found for control view %@!"), v6, v9, v10, v11, v12);

  return v7;
}

BOOL __60__HUControlPanelController__controlPanelItemForControlView___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlItemForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

- (id)_controlItemForControlView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HUControlPanelController _controlPanelItemForControlView:](self, "_controlPanelItemForControlView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "controlItemForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_createConfigurations
{
  void *v2;
  HUSimpleSliderControlPanelConfiguration *v3;
  HUIncrementalStateSliderControlPanelConfiguration *v4;
  HUSwitchControlPanelConfiguration *v5;
  HUMultiStateControlPanelConfiguration *v6;
  HUTemperatureControlPanelConfiguration *v7;
  HUWheelControlPanelConfiguration *v8;
  HUDurationWheelControlPanelConfiguration *v9;
  HUTemperatureUnitControlPanelConfiguration *v10;
  void *v11;
  void *v12;
  _QWORD v14[9];

  v14[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_alloc_init(HUSimpleSliderControlPanelConfiguration);
  v14[0] = v3;
  v4 = objc_alloc_init(HUIncrementalStateSliderControlPanelConfiguration);
  v14[1] = v4;
  v5 = objc_alloc_init(HUSwitchControlPanelConfiguration);
  v14[2] = v5;
  v6 = objc_alloc_init(HUMultiStateControlPanelConfiguration);
  v14[3] = v6;
  v7 = objc_alloc_init(HUTemperatureControlPanelConfiguration);
  v14[4] = v7;
  v8 = objc_alloc_init(HUWheelControlPanelConfiguration);
  v14[5] = v8;
  v9 = objc_alloc_init(HUDurationWheelControlPanelConfiguration);
  v14[6] = v9;
  v10 = objc_alloc_init(HUTemperatureUnitControlPanelConfiguration);
  v14[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_configurationForItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HUControlPanelController configurations](self, "configurations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      v24 = v6;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
        objc_msgSend(v10, "rule");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "ruleMatchesItem:", v4);

        if (v12)
        {
          if (v7)
          {
            v13 = v8;
            v14 = v4;
            v15 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v7, "rule");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "priority");
            objc_msgSend(v15, "numberWithDouble:");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v10, "rule");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "priority");
            objc_msgSend(v18, "numberWithDouble:");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v17, "compare:", v20);

            if (v21)
            {
              if (v21 == -1)
              {
                v22 = v10;

                v7 = v22;
              }
              v4 = v14;
            }
            else
            {
              v4 = v14;
              NSLog(CFSTR("Found two configurations with same priority for item %@! First: %@, second: %@"), v14, v7, v10);
            }
            v8 = v13;
            v6 = v24;
          }
          else
          {
            v7 = v10;
          }
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_valueTransformerForControlItem:(id)a3 controlPanelItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[HUControlPanelController _configurationForItem:](self, "_configurationForItem:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v7, "valueTransformerForControlItem:", v6),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0D319D8], "identityTransformer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_createWriteThrottleForControlItem:(id)a3 controlPanelItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "identifierForControlItem:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D519F0]), "initWithThrottleInterval:", 0.25);
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__HUControlPanelController__createWriteThrottleForControlItem_controlPanelItem___block_invoke;
  v15[3] = &unk_1E6F5ED50;
  objc_copyWeak(&v19, &location);
  v10 = v8;
  v16 = v10;
  v11 = v6;
  v17 = v11;
  v12 = v7;
  v18 = v12;
  v13 = (id)objc_msgSend(v9, "observeValueChangesWithBlock:", v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v9;
}

void __80__HUControlPanelController__createWriteThrottleForControlItem_controlPanelItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "interactionStateByControlID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setInFlightWriteCount:", objc_msgSend(v6, "inFlightWriteCount") + 1);
  objc_msgSend(WeakRetained, "_updateWriteStateForControlItem:controlPanelItem:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(WeakRetained, "_valueTransformerForControlItem:controlPanelItem:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForTransformedValue:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "writeValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__HUControlPanelController__createWriteThrottleForControlItem_controlPanelItem___block_invoke_2;
  v12[3] = &unk_1E6F5ED28;
  objc_copyWeak(&v16, (id *)(a1 + 56));
  v10 = v6;
  v13 = v10;
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v11 = (id)objc_msgSend(v9, "addCompletionBlock:", v12);

  objc_destroyWeak(&v16);
}

void __80__HUControlPanelController__createWriteThrottleForControlItem_controlPanelItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setInFlightWriteCount:", objc_msgSend(*(id *)(a1 + 32), "inFlightWriteCount") - 1);
  objc_msgSend(*(id *)(a1 + 32), "inFlightWriteCount");
  objc_msgSend(WeakRetained, "_updateWriteStateForControlItem:controlPanelItem:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_updateWriteStateForControlView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HUControlPanelController _controlPanelItemForControlView:](self, "_controlPanelItemForControlView:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "controlItemForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUControlPanelController _updateWriteStateForControlItem:controlPanelItem:](self, "_updateWriteStateForControlItem:controlPanelItem:", v6, v7);
}

- (void)_updateWriteStateForControlItem:(id)a3 controlPanelItem:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  _BOOL8 v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  id v16;

  v16 = a3;
  objc_msgSend(a4, "identifierForControlItem:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUControlPanelController interactionStateByControlID](self, "interactionStateByControlID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "areWritesInProgressOrPossible");
  v10 = (objc_msgSend(v8, "isUserInteractionActive") & 1) != 0 || objc_msgSend(v8, "inFlightWriteCount") != 0;
  objc_msgSend(v8, "setWritesInProgressOrPossible:", v10);
  if (v9 != objc_msgSend(v8, "areWritesInProgressOrPossible"))
  {
    v11 = objc_msgSend(v8, "areWritesInProgressOrPossible");
    -[HUControlPanelController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        -[HUControlPanelController delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "controlPanelController:willBeginPossibleWritesForControlItem:", self, v16);
LABEL_10:

      }
    }
    else
    {
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        -[HUControlPanelController delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "controlPanelController:didEndPossibleWritesForControlItem:", self, v16);
        goto LABEL_10;
      }
    }
  }

}

- (void)controlViewDidBeginUserInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HUControlPanelController interactionStateByControlID](self, "interactionStateByControlID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setUserInteractionActive:", 1);
  -[HUControlPanelController _updateWriteStateForControlView:](self, "_updateWriteStateForControlView:", v4);

}

- (void)controlViewDidEndUserInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HUControlPanelController interactionStateByControlID](self, "interactionStateByControlID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setUserInteractionActive:", 0);
  objc_msgSend(v8, "writeThrottler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "flushValueChanges");

  -[HUControlPanelController _updateWriteStateForControlView:](self, "_updateWriteStateForControlView:", v4);
}

- (void)controlView:(id)a3 valueDidChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[HUControlPanelController interactionStateByControlID](self, "interactionStateByControlID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "writeThrottler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:notifyObservers:", v6, 1);

}

- (HUControlPanelControllerDelegate)delegate
{
  return (HUControlPanelControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSSet)allItems
{
  return &self->_allItems->super;
}

- (NSSet)configurations
{
  return self->_configurations;
}

- (NSMutableDictionary)interactionStateByControlID
{
  return self->_interactionStateByControlID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionStateByControlID, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allItems, 0);
}

@end
