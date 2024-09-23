@implementation HUEventTypePickerItemManager

- (HUEventTypePickerItemManager)initWithTriggerBuilder:(id)a3 delegate:(id)a4
{
  id v7;
  HUEventTypePickerItemManager *v8;
  HUEventTypePickerItemManager *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUEventTypePickerItemManager;
  v8 = -[HFItemManager initWithDelegate:](&v11, sel_initWithDelegate_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_triggerBuilder, a3);

  return v9;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[5];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("HUEventTypePickerSectionIdentifierInstructions"));
  -[HUEventTypePickerItemManager instructionsItem](self, "instructionsItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEventTypePickerSectionIdentifierTriggerTypes"));
  -[HUEventTypePickerItemManager leavingLocationEventItem](self, "leavingLocationEventItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  -[HUEventTypePickerItemManager arrivingAtLocationEventItem](self, "arrivingAtLocationEventItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v11;
  -[HUEventTypePickerItemManager timerEventItem](self, "timerEventItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v12;
  -[HUEventTypePickerItemManager characteristicEventItem](self, "characteristicEventItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v13;
  -[HUEventTypePickerItemManager alarmEventItem](self, "alarmEventItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setItems:", v15);

  v16 = (void *)MEMORY[0x1E0D314B0];
  v20[0] = v6;
  v20[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filterSections:toDisplayedItems:", v17, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  HUInstructionsItem *v4;
  void *v5;
  HUInstructionsItem *v6;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  _QWORD v26[7];

  v26[6] = *MEMORY[0x1E0C80C00];
  v4 = [HUInstructionsItem alloc];
  _HULocalizedStringWithDefaultValue(CFSTR("HUEventTypePickerInstructionsDescription"), CFSTR("HUEventTypePickerInstructionsDescription"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUInstructionsItem initWithStyle:title:description:](v4, "initWithStyle:title:description:", 0, 0, v5);
  -[HUEventTypePickerItemManager setInstructionsItem:](self, "setInstructionsItem:", v6);

  -[HUEventTypePickerItemManager _createLocationItemForType:](self, "_createLocationItemForType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEventTypePickerItemManager setLeavingLocationEventItem:](self, "setLeavingLocationEventItem:", v7);

  -[HUEventTypePickerItemManager _createLocationItemForType:](self, "_createLocationItemForType:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEventTypePickerItemManager setArrivingAtLocationEventItem:](self, "setArrivingAtLocationEventItem:", v8);

  -[HUEventTypePickerItemManager _createTimeItem](self, "_createTimeItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEventTypePickerItemManager setTimerEventItem:](self, "setTimerEventItem:", v9);

  -[HUEventTypePickerItemManager _createCharacteristicItemForSource:](self, "_createCharacteristicItemForSource:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEventTypePickerItemManager setCharacteristicEventItem:](self, "setCharacteristicEventItem:", v10);

  -[HUEventTypePickerItemManager _createCharacteristicItemForSource:](self, "_createCharacteristicItemForSource:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEventTypePickerItemManager setAlarmEventItem:](self, "setAlarmEventItem:", v11);

  v12 = objc_alloc(MEMORY[0x1E0D31848]);
  v13 = (void *)MEMORY[0x1E0C99E60];
  -[HUEventTypePickerItemManager instructionsItem](self, "instructionsItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  -[HUEventTypePickerItemManager leavingLocationEventItem](self, "leavingLocationEventItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  -[HUEventTypePickerItemManager arrivingAtLocationEventItem](self, "arrivingAtLocationEventItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v16;
  -[HUEventTypePickerItemManager timerEventItem](self, "timerEventItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v17;
  -[HUEventTypePickerItemManager characteristicEventItem](self, "characteristicEventItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v18;
  -[HUEventTypePickerItemManager alarmEventItem](self, "alarmEventItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v12, "initWithItems:", v21);

  v25 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)_createTimeItem
{
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x1E0D31840]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__HUEventTypePickerItemManager__createTimeItem__block_invoke;
  v5[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_msgSend(v2, "initWithResultsBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __47__HUEventTypePickerItemManager__createTimeItem__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUEventTypePickerTimerButtonTitle"), CFSTR("HUEventTypePickerTimerButtonTitle"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v11[1] = *MEMORY[0x1E0D30BF8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUEventTypePickerTimerButtonDescription"), CFSTR("HUEventTypePickerTimerButtonDescription"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v11[2] = *MEMORY[0x1E0D30C60];
  v4 = objc_alloc(MEMORY[0x1E0D31460]);
  v5 = (void *)objc_msgSend(v4, "initWithImageIdentifier:", *MEMORY[0x1E0D30870]);
  v12[2] = v5;
  v11[3] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(WeakRetained, "_hasMinimumRequiredTriggerableServices:", 1) ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  v11[4] = *MEMORY[0x1E0D30B78];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_createLocationItemForType:(unint64_t)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8[2];
  id location;

  objc_initWeak(&location, self);
  v4 = objc_alloc(MEMORY[0x1E0D31840]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__HUEventTypePickerItemManager__createLocationItemForType___block_invoke;
  v7[3] = &unk_1E6F4E678;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  v5 = (void *)objc_msgSend(v4, "initWithResultsBlock:", v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

id __59__HUEventTypePickerItemManager__createLocationItemForType___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  void *v8;
  id *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)objc_opt_new();
  if (*(_QWORD *)(a1 + 40) == 1)
    v4 = CFSTR("HUEventTypePickerLeavingLocationButtonTitle");
  else
    v4 = CFSTR("HUEventTypePickerArrivingAtLocationButtonTitle");
  v5 = 1;
  _HULocalizedStringWithDefaultValue(v4, v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30D18]);

  if (*(_QWORD *)(a1 + 40) == 1)
    v7 = CFSTR("HUEventTypePickerLeavingLocationButtonDescription");
  else
    v7 = CFSTR("HUEventTypePickerArrivingAtLocationButtonDescription");
  _HULocalizedStringWithDefaultValue(v7, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30BF8]);

  v9 = (id *)MEMORY[0x1E0D30800];
  if (*(_QWORD *)(a1 + 40) != 1)
    v9 = (id *)MEMORY[0x1E0D307D8];
  v10 = *v9;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithImageIdentifier:", v10);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D30C60]);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30B78]);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __59__HUEventTypePickerItemManager__createLocationItemForType___block_invoke_2;
  v18[3] = &unk_1E6F57CE0;
  v18[4] = WeakRetained;
  v13 = __59__HUEventTypePickerItemManager__createLocationItemForType___block_invoke_2((uint64_t)v18);
  v14 = (void *)MEMORY[0x1E0CB37E8];
  if (v13)
    v5 = objc_msgSend(WeakRetained, "_hasMinimumRequiredTriggerableServices:", 1) ^ 1;
  objc_msgSend(v14, "numberWithInt:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D30C80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __59__HUEventTypePickerItemManager__createLocationItemForType___block_invoke_2(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;

  if (!objc_msgSend(MEMORY[0x1E0D319D0], "supportsBeingCurrentLocationDevice"))
    return 1;
  objc_msgSend(MEMORY[0x1E0D314E0], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationStatus");

  v3 = HFLocationServicesAvailableForAuthorizationStatus();
  v4 = (void *)MEMORY[0x1E0CBA780];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "hf_presenceDisableReasonsForHome:", v5);

  if ((v4 & 2) != 0)
    return 0;
  else
    return v3;
}

- (id)_createCharacteristicItemForSource:(unint64_t)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8[2];
  id location;

  objc_initWeak(&location, self);
  v4 = objc_alloc(MEMORY[0x1E0D31840]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__HUEventTypePickerItemManager__createCharacteristicItemForSource___block_invoke;
  v7[3] = &unk_1E6F4E678;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  v5 = (void *)objc_msgSend(v4, "initWithResultsBlock:", v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

id __67__HUEventTypePickerItemManager__createCharacteristicItemForSource___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  id *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    v5 = CFSTR("HUEventTypePickerCharacteristicButtonTitle");
  else
    v5 = CFSTR("HUEventTypePickerAlarmButtonTitle");
  if (v4)
    v6 = CFSTR("HUEventTypePickerCharacteristicButtonDescription");
  else
    v6 = CFSTR("HUEventTypePickerAlarmButtonDescription");
  if (v4)
    v7 = (id *)MEMORY[0x1E0D30860];
  else
    v7 = (id *)MEMORY[0x1E0D30868];
  v8 = 1;
  _HULocalizedStringWithDefaultValue(v5, v5, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30D18]);

  _HULocalizedStringWithDefaultValue(v6, v6, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30BF8]);

  v11 = (objc_class *)MEMORY[0x1E0D31460];
  v12 = *v7;
  v13 = (void *)objc_msgSend([v11 alloc], "initWithImageIdentifier:", v12);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30C60]);
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = *(_QWORD *)(a1 + 40);
  objc_msgSend(WeakRetained, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[HUCharacteristicTriggerServicePickerViewController canPickServicesFromSource:home:](HUCharacteristicTriggerServicePickerViewController, "canPickServicesFromSource:home:", v15, v16))
  {
    v8 = 1;
    if (objc_msgSend(WeakRetained, "_hasMinimumRequiredTriggeringServices:", 1))
      v8 = objc_msgSend(WeakRetained, "_hasMinimumRequiredTriggerableServices:", 2) ^ 1;
  }
  objc_msgSend(v14, "numberWithInt:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30C80]);

  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D30B78]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)_hasMinimumRequiredTriggeringServices:(int64_t)a3
{
  void *v4;
  void *v5;

  -[HFItemManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_allVisibleServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "count") >= a3;

  return a3;
}

- (BOOL)_hasMinimumRequiredTriggerableServices:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[HFItemManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hf_enabledResidentsSupportsMediaActions"))
  {
    -[HFItemManager home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_mediaAccessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v5, "hf_allVisibleServices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") + v8;

  return v10 >= a3;
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (HFItem)instructionsItem
{
  return self->_instructionsItem;
}

- (void)setInstructionsItem:(id)a3
{
  objc_storeStrong((id *)&self->_instructionsItem, a3);
}

- (HFStaticItem)leavingLocationEventItem
{
  return self->_leavingLocationEventItem;
}

- (void)setLeavingLocationEventItem:(id)a3
{
  objc_storeStrong((id *)&self->_leavingLocationEventItem, a3);
}

- (HFStaticItem)arrivingAtLocationEventItem
{
  return self->_arrivingAtLocationEventItem;
}

- (void)setArrivingAtLocationEventItem:(id)a3
{
  objc_storeStrong((id *)&self->_arrivingAtLocationEventItem, a3);
}

- (HFStaticItem)timerEventItem
{
  return self->_timerEventItem;
}

- (void)setTimerEventItem:(id)a3
{
  objc_storeStrong((id *)&self->_timerEventItem, a3);
}

- (HFStaticItem)characteristicEventItem
{
  return self->_characteristicEventItem;
}

- (void)setCharacteristicEventItem:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicEventItem, a3);
}

- (HFStaticItem)alarmEventItem
{
  return self->_alarmEventItem;
}

- (void)setAlarmEventItem:(id)a3
{
  objc_storeStrong((id *)&self->_alarmEventItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmEventItem, 0);
  objc_storeStrong((id *)&self->_characteristicEventItem, 0);
  objc_storeStrong((id *)&self->_timerEventItem, 0);
  objc_storeStrong((id *)&self->_arrivingAtLocationEventItem, 0);
  objc_storeStrong((id *)&self->_leavingLocationEventItem, 0);
  objc_storeStrong((id *)&self->_instructionsItem, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
}

@end
