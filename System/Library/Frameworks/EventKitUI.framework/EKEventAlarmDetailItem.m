@implementation EKEventAlarmDetailItem

- (void)_updateAlarms
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *alarms;
  NSMutableArray *alarmPopupMenus;
  NSArray *v8;

  -[EKEventAlarmDetailItem alarmsViewModel](self, "alarmsViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdate");

  -[EKEventAlarmDetailItem alarmsViewModel](self, "alarmsViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiAlarms");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();

  alarms = self->_alarms;
  self->_alarms = v5;
  v8 = v5;

  alarmPopupMenus = self->_alarmPopupMenus;
  self->_alarmPopupMenus = 0;

}

- (void)setEvent:(id)a3 reminder:(id)a4 store:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  EKAlarmsViewModel *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EKEventAlarmDetailItem;
  -[EKEventDetailItem setEvent:reminder:store:](&v14, sel_setEvent_reminder_store_, v8, a4, a5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventAlarmDetailItem alarmsViewModel](self, "alarmsViewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("EKAlarmsViewModelTTLLocationStatusChangedNotification"), v10);

  if (v8)
  {
    v11 = -[EKAlarmsViewModel initWithCalendarItem:]([EKAlarmsViewModel alloc], "initWithCalendarItem:", v8);
    -[EKEventAlarmDetailItem setAlarmsViewModel:](self, "setAlarmsViewModel:", v11);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventAlarmDetailItem alarmsViewModel](self, "alarmsViewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_ttlLocationStatusChanged_, CFSTR("EKAlarmsViewModelTTLLocationStatusChangedNotification"), v13);

  }
  else
  {
    -[EKEventAlarmDetailItem setAlarmsViewModel:](self, "setAlarmsViewModel:", 0);
  }
  -[EKEventAlarmDetailItem _updateAlarms](self, "_updateAlarms");

}

- (BOOL)_alarmsAreEditable
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;

  if (-[EKEvent status](self->super._event, "status") == EKEventStatusCanceled)
    return 0;
  -[EKEvent calendar](self->super._event, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "maxAlarmsAllowed");

  if (!v6)
    return 0;
  -[EKEvent calendar](self->super._event, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "supportsAlarmTriggerIntervals")
    && !-[EKEventDetailItem isPrivateEvent](self, "isPrivateEvent"))
  {
    v11 = -[EKEventDetailItem isReadOnlyDelegateCalendar](self, "isReadOnlyDelegateCalendar");

    if (!v11)
    {
      if (!-[EKEvent isExternallyOrganizedInvitation](self->super._event, "isExternallyOrganizedInvitation"))return 1;
      -[EKEvent calendar](self->super._event, "calendar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "source");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraints");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "supportsInvitationModifications");
      goto LABEL_6;
    }
    return 0;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (void)ttlLocationStatusChanged:(id)a3
{
  id v4;

  -[EKEventDetailItem delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventDetailItemWantsRefresh:", self);

}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  void *v5;
  BOOL v6;

  if (!-[NSArray count](self->_alarms, "count", a3, a4)
    && !-[EKEventAlarmDetailItem _alarmsAreCreatable](self, "_alarmsAreCreatable"))
  {
    return 0;
  }
  -[EKEvent externalID](self->super._event, "externalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 1;
  else
    v6 = -[EKEvent actionsState](self->super._event, "actionsState") == 0;

  return v6;
}

- (unint64_t)numberOfSubitems
{
  if (-[NSArray count](self->_alarms, "count"))
    return 2;
  else
    return 1;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  double result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEventAlarmDetailItem;
  -[EKEventDetailItem defaultCellHeightForSubitemAtIndex:forWidth:](&v5, sel_defaultCellHeightForSubitemAtIndex_forWidth_, a3, a4);
  return result;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  EKUIPopupTableViewCell *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
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
  void *v24;
  void *v25;
  NSMutableArray *alarmPopupMenus;
  NSMutableArray *v27;
  NSMutableArray *v28;
  NSMutableArray *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  id v41[2];
  _QWORD v42[5];
  id v43;
  id from;
  id location;
  _QWORD v46[4];
  _QWORD v47[6];

  v47[4] = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_alarms, "count") <= a3)
  {
    EventKitUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("None alert - event alarm detail item"), CFSTR("None"), 0);
    v36 = objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v38 = 0;
    goto LABEL_5;
  }
  -[NSArray objectAtIndexedSubscript:](self->_alarms, "objectAtIndexedSubscript:", a3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "localizedDescriptionAllDay:", -[EKEvent isAllDay](self->super._event, "isAllDay"));
  v36 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    -[EKEventAlarmDetailItem alarmsViewModel](self, "alarmsViewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAlarmEffectivelyDisabled:", v38);
LABEL_5:

    goto LABEL_6;
  }
  v6 = 0;
  v38 = 0;
LABEL_6:
  if (!-[EKEventAlarmDetailItem _alarmsAreEditable](self, "_alarmsAreEditable", v36))
  {
    v9 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    if ((_DWORD)v6)
    {
      v11 = *MEMORY[0x1E0DC11A8];
      v47[0] = &unk_1E606F198;
      v12 = *MEMORY[0x1E0DC1138];
      v46[0] = v11;
      v46[1] = v12;
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = v13;
      v46[2] = *MEMORY[0x1E0DC1140];
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v47[2] = v14;
      v46[3] = *MEMORY[0x1E0DC11A0];
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "colorWithAlphaComponent:", 0.75);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v47[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[EKUIPopupTableViewCell detailTextLabel](v9, "detailTextLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v37, v17);
      objc_msgSend(v18, "setAttributedText:", v19);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIPopupTableViewCell detailTextLabel](v9, "detailTextLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFont:", v20);

      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIPopupTableViewCell detailTextLabel](v9, "detailTextLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTextColor:", v22);

      -[EKUIPopupTableViewCell detailTextLabel](v9, "detailTextLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setText:", v37);

    }
    goto LABEL_26;
  }
  if (-[NSMutableArray count](self->_alarmPopupMenus, "count") <= a3)
    goto LABEL_10;
  -[NSMutableArray objectAtIndexedSubscript:](self->_alarmPopupMenus, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {

LABEL_10:
    v7 = 0;
  }
  v9 = -[EKUIPopupTableViewCell initWithStyle:reuseIdentifier:]([EKUIPopupTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
  if (EKUICatalyst())
  {
    -[EKEventAlarmDetailItem _createRealPopupMenuForIndex:popupCell:](self, "_createRealPopupMenuForIndex:popupCell:", a3, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIPopupTableViewCell setPopupMenu:](v9, "setPopupMenu:", v10);

  }
  else
  {
    if (!v7)
    {
      -[EKEventAlarmDetailItem alarmsViewModel](self, "alarmsViewModel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "placeholderMenuForAlarmAtIndex:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[EKUIPopupTableViewCell setPopupMenu:](v9, "setPopupMenu:", v7);
    objc_initWeak(&location, v9);
    objc_initWeak(&from, self);
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = __Block_byref_object_copy__3;
    v42[4] = __Block_byref_object_dispose__3;
    v39[0] = MEMORY[0x1E0C809B0];
    v43 = 0;
    v39[2] = __48__EKEventAlarmDetailItem_cellForSubitemAtIndex___block_invoke;
    v39[3] = &unk_1E60196F8;
    v39[1] = 3221225472;
    objc_copyWeak(&v40, &from);
    objc_copyWeak(v41, &location);
    v39[4] = v42;
    v41[1] = (id)a3;
    -[EKUIPopupTableViewCell setPopupMenuProvider:](v9, "setPopupMenuProvider:", v39);
    objc_destroyWeak(v41);
    objc_destroyWeak(&v40);
    _Block_object_dispose(v42, 8);

    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  if (v7)
  {
    alarmPopupMenus = self->_alarmPopupMenus;
    if (!alarmPopupMenus)
    {
      v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v28 = self->_alarmPopupMenus;
      self->_alarmPopupMenus = v27;

      alarmPopupMenus = self->_alarmPopupMenus;
    }
    if (-[NSMutableArray count](alarmPopupMenus, "count") <= a3)
    {
      do
      {
        v29 = self->_alarmPopupMenus;
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v29, "addObject:", v30);

      }
      while (-[NSMutableArray count](self->_alarmPopupMenus, "count") <= a3);
    }
    -[NSMutableArray setObject:atIndexedSubscript:](self->_alarmPopupMenus, "setObject:atIndexedSubscript:", v7, a3);
  }
  -[EKUIPopupTableViewCell setTitleStrikethrough:](v9, "setTitleStrikethrough:", v6);

LABEL_26:
  +[EKAlarmsViewModel labelTextForIndex:](EKAlarmsViewModel, "labelTextForIndex:", a3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIPopupTableViewCell textLabel](v9, "textLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setText:", v31);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIPopupTableViewCell textLabel](v9, "textLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTextColor:", v33);

  return v9;
}

id __48__EKEventAlarmDetailItem_cellForSubitemAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    v8 = objc_loadWeakRetained((id *)(a1 + 48));
    v15 = 138412546;
    v16 = v3;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_ERROR, "Menu owner = %@. popupCell = %@", (uint8_t *)&v15, 0x16u);

  }
  v9 = 0;
  if (WeakRetained && v5)
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v10)
    {
      objc_msgSend(WeakRetained, "_createRealPopupMenuForIndex:popupCell:", *(_QWORD *)(a1 + 56), v5);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      objc_msgSend(v5, "setPopupMenu:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
      objc_msgSend(v5, "setPopupMenuProvider:", 0);
      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    v9 = v10;
  }

  return v9;
}

- (id)_createRealPopupMenuForIndex:(int64_t)a3 popupCell:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12[2];
  id from;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  -[EKEventAlarmDetailItem alarmsViewModel](self, "alarmsViewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__EKEventAlarmDetailItem__createRealPopupMenuForIndex_popupCell___block_invoke;
  v10[3] = &unk_1E6019798;
  objc_copyWeak(&v11, &location);
  v12[1] = (id)a3;
  objc_copyWeak(v12, &from);
  objc_msgSend(v7, "menuForAlarmAtIndex:actionHandler:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v8;
}

void __65__EKEventAlarmDetailItem__createRealPopupMenuForIndex_popupCell___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  id v9;
  id v10;
  void *v11;
  void (**v12)(_QWORD);
  id *WeakRetained;
  id *v14;
  void *v15;
  int v16;
  int v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  void (**v33)(_QWORD);
  id v34;
  _QWORD aBlock[4];
  id v36;
  id v37;
  id v38[3];

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__EKEventAlarmDetailItem__createRealPopupMenuForIndex_popupCell___block_invoke_2;
  aBlock[3] = &unk_1E6019748;
  v8 = (id *)(a1 + 32);
  objc_copyWeak(v38, (id *)(a1 + 32));
  v9 = v5;
  v36 = v9;
  v10 = v6;
  v11 = *(void **)(a1 + 48);
  v37 = v10;
  v38[1] = v11;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v14 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "editItemEventToDetach");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isOrWasPartOfRecurringSeries");
    if (v15)
      v17 = v16;
    else
      v17 = 0;
    if (v17 == 1)
    {
      v18 = objc_loadWeakRetained((id *)(a1 + 40));
      if (v18)
      {
        objc_msgSend(v14, "viewControllerToPresentFrom");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bounds");
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v32[0] = v7;
        v32[1] = 3221225472;
        v32[2] = __65__EKEventAlarmDetailItem__createRealPopupMenuForIndex_popupCell___block_invoke_27;
        v32[3] = &unk_1E6019770;
        objc_copyWeak(&v34, v8);
        v33 = v12;
        +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v19, v18, v15, v32, v21, v23, v25, v27);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v14[13];
        v14[13] = (id)v28;

        objc_msgSend(v14[13], "alertController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "popoverPresentationController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setPermittedArrowDirections:", 12);

        objc_destroyWeak(&v34);
      }

    }
    else
    {
      v12[2](v12);
      objc_msgSend(v14, "editItemViewController:didCompleteWithAction:", 0, 2);
    }

  }
  objc_destroyWeak(v38);

}

void __65__EKEventAlarmDetailItem__createRealPopupMenuForIndex_popupCell___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "alarmsViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "alarmsViewModel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 56);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __65__EKEventAlarmDetailItem__createRealPopupMenuForIndex_popupCell___block_invoke_3;
      v10[3] = &unk_1E6019720;
      v10[4] = v3;
      objc_msgSend(v5, "updatedUIAlarmFromUIAlarm:toUIAlarm:atIndex:completion:", v6, v7, v8, v10);

    }
    else
    {
      v9 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[EKEventAlarmDetailItem _createRealPopupMenuForIndex:popupCell:]_block_invoke_2";
        _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_ERROR, "Error: %s: 'alarmsViewModel' should not be nil", buf, 0xCu);
      }
    }
  }

}

uint64_t __65__EKEventAlarmDetailItem__createRealPopupMenuForIndex_popupCell___block_invoke_3(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "_updateAlarms");
    return objc_msgSend(*(id *)(v2 + 32), "notifySubitemDidSave:", 0);
  }
  return result;
}

void __65__EKEventAlarmDetailItem__createRealPopupMenuForIndex_popupCell___block_invoke_27(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD *WeakRetained;

  v3 = 3;
  switch(a2)
  {
    case 0:
      goto LABEL_5;
    case 1:
      v3 = 4;
      goto LABEL_5;
    case 2:
      v3 = 5;
LABEL_5:
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      objc_msgSend(WeakRetained, "editItemViewController:didCompleteWithAction:", 0, v3);
      goto LABEL_6;
    case 4:
    case 5:
      return;
    default:
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "reset");
      objc_msgSend(WeakRetained, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "eventDetailItemWantsRefresh:", WeakRetained);

LABEL_6:
      v5 = (void *)WeakRetained[13];
      WeakRetained[13] = 0;

      return;
  }
}

- (EKAlarmsViewModel)alarmsViewModel
{
  return self->_alarmsViewModel;
}

- (void)setAlarmsViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_alarmsViewModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmsViewModel, 0);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_alarmPopupMenus, 0);
  objc_storeStrong((id *)&self->_alarms, 0);
}

@end
