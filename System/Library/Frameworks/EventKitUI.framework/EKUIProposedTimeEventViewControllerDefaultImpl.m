@implementation EKUIProposedTimeEventViewControllerDefaultImpl

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)EKUIProposedTimeEventViewControllerDefaultImpl;
  -[EKEventViewControllerDefaultImpl viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  -[EKUIProposedTimeEventViewControllerDefaultImpl statusButtons](self, "statusButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIProposedTimeEventViewControllerDefaultImpl remoteUIDelegate](self, "remoteUIDelegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[EKUIProposedTimeEventViewControllerDefaultImpl remoteUIDelegate](self, "remoteUIDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[EKUIProposedTimeEventViewControllerDefaultImpl remoteUIDelegate](self, "remoteUIDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIProposedTimeEventViewControllerDefaultImpl _proposedTimeEventViewController](self, "_proposedTimeEventViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "viewController:didChangeBottomStatusButtons:", v10, v4);

    }
  }

}

- (id)proposedTime
{
  void *v2;
  void *v3;

  -[EKUIProposedTimeEventViewControllerDefaultImpl proposedTimeAttendee](self, "proposedTimeAttendee");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proposedStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)viewTitle
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Proposed Time"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldShowEditButtonInline
{
  unsigned __int8 v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKUIProposedTimeEventViewControllerDefaultImpl;
  v2 = -[EKEventViewControllerDefaultImpl shouldShowEditButtonInline](&v4, sel_shouldShowEditButtonInline);
  return v2 & ~+[SwappableViewControllerImplementationFactory shouldUseOutOfProcessUI](SwappableViewControllerImplementationFactory, "shouldUseOutOfProcessUI");
}

- (id)items
{
  NSArray *items;
  EKEventTitleDetailItem *v4;
  void *v5;
  EKEventPreviewDetailItem *v6;
  void *v7;
  EKEventOrganizerDetailItem *v8;
  void *v9;
  NSArray *v10;
  NSArray *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  items = self->super._items;
  if (!items)
  {
    v4 = objc_alloc_init(EKEventTitleDetailItem);
    -[EKEventTitleDetailItem setEditDelegate:](v4, "setEditDelegate:", self);
    -[EKUIProposedTimeEventViewControllerDefaultImpl proposedTime](self, "proposedTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventTitleDetailItem setProposedTime:](v4, "setProposedTime:", v5);

    v6 = objc_alloc_init(EKEventPreviewDetailItem);
    -[EKUIProposedTimeEventViewControllerDefaultImpl proposedTime](self, "proposedTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventPreviewDetailItem setProposedTime:](v6, "setProposedTime:", v7);

    v8 = objc_alloc_init(EKEventOrganizerDetailItem);
    -[EKUIProposedTimeEventViewControllerDefaultImpl proposedTimeAttendee](self, "proposedTimeAttendee");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventOrganizerDetailItem setOrganizerOverride:](v8, "setOrganizerOverride:", v9);

    v13[0] = v4;
    v13[1] = v6;
    v13[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v11 = self->super._items;
    self->super._items = v10;

    items = self->super._items;
  }
  return items;
}

- (id)statusButtons
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[EKEventViewControllerDefaultImpl event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attendees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[EKUIProposedTimeEventViewControllerDefaultImpl proposedTimeAttendee](self, "proposedTimeAttendee");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "URL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "resourceSpecifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "URL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "resourceSpecifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v12, "isEqualToString:", v14))
          {
            objc_msgSend(v23, "addObject:", v9);

            goto LABEL_13;
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

  -[EKEventViewControllerDefaultImpl event](self, "event");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[EKUIEmailCompositionManager canShowViewControllerForEvent:withParticipantRecipients:](EKUIEmailCompositionManager, "canShowViewControllerForEvent:withParticipantRecipients:", v15, v23);

  -[EKEventViewControllerDefaultImpl event](self, "event");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "calendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "allowsContentModifications");

  v20 = &unk_1E606F8F0;
  if (v16)
    v20 = &unk_1E606F8D8;
  if (v19)
    v21 = v20;
  else
    v21 = 0;

  return v21;
}

- (void)bottomStatusButtonTappedWithAction:(int64_t)a3 eventStatusButtonsView:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  EKUIEmailCompositionManager *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void (**v62)(void);
  void *v63;
  id v64;
  id v65;
  void (**v66)(void *, void *, uint64_t);
  void *v67;
  EKUIProposedTimeEventViewControllerDefaultImpl *val;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  id v74;
  id location;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[5];
  id v81;
  void (**v82)(void *, void *, uint64_t);
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD aBlock[4];
  id v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v65 = a4;
  val = self;
  -[EKEventViewControllerDefaultImpl event](self, "event");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIResponder EKUI_editor](self, "EKUI_editor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__EKUIProposedTimeEventViewControllerDefaultImpl_bottomStatusButtonTappedWithAction_eventStatusButtonsView___block_invoke;
  aBlock[3] = &unk_1E60186B0;
  v64 = v6;
  v88 = v64;
  v66 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
  switch(a3)
  {
    case 0x4000:
      v63 = (void *)objc_opt_new();
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      objc_msgSend(v67, "attendees");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v77;
        while (2)
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v77 != v33)
              objc_enumerationMutation(v31);
            v35 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v36 = v35;
              -[EKUIProposedTimeEventViewControllerDefaultImpl proposedTimeAttendee](val, "proposedTimeAttendee");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "emailAddress");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "emailAddress");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v38, "isEqual:", v39);

              if (v40)
              {
                objc_msgSend(v63, "addObject:", v36);

                goto LABEL_42;
              }

            }
          }
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
          if (v32)
            continue;
          break;
        }
      }
LABEL_42:

      EventKitUIBundle();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("RE:"), &stru_1E601DFA8, 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = -[EKUIEmailCompositionManager initWithEvent:participantRecipients:subjectPrefix:bodyPrefix:]([EKUIEmailCompositionManager alloc], "initWithEvent:participantRecipients:subjectPrefix:bodyPrefix:", v67, v63, v53, 0);
      -[EKUIProposedTimeEventViewControllerDefaultImpl setMessageSendingManager:](val, "setMessageSendingManager:", v54);

      objc_initWeak(&location, val);
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __108__EKUIProposedTimeEventViewControllerDefaultImpl_bottomStatusButtonTappedWithAction_eventStatusButtonsView___block_invoke_3;
      v73[3] = &unk_1E6018700;
      objc_copyWeak(&v74, &location);
      -[EKUIProposedTimeEventViewControllerDefaultImpl messageSendingManager](val, "messageSendingManager");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setMessageSendingComplete:", v73);

      -[EKUIProposedTimeEventViewControllerDefaultImpl messageSendingManager](val, "messageSendingManager");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "viewController");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setModalPresentationStyle:", 2);

      -[EKEventViewControllerDefaultImpl presentationNavigationDelegate](val, "presentationNavigationDelegate");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIProposedTimeEventViewControllerDefaultImpl messageSendingManager](val, "messageSendingManager");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "viewController");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "presentViewController:animated:completion:", v60, 1, 0);

      objc_destroyWeak(&v74);
      objc_destroyWeak(&location);

      break;
    case 0x2000:
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      objc_msgSend(v67, "attendees");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v69, v89, 16);
      if (v42)
      {
        v43 = *(_QWORD *)v70;
        do
        {
          for (j = 0; j != v42; ++j)
          {
            if (*(_QWORD *)v70 != v43)
              objc_enumerationMutation(v41);
            v45 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v46 = v45;
              -[EKUIProposedTimeEventViewControllerDefaultImpl proposedTimeAttendee](val, "proposedTimeAttendee");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "emailAddress");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "emailAddress");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = objc_msgSend(v48, "isEqual:", v49);

              if (v50)
              {
                objc_msgSend(v46, "setCommentChanged:", 0);
                objc_msgSend(v46, "setStatusChanged:", 0);
                objc_msgSend(v46, "setProposedStartDateChanged:", 0);
                objc_msgSend(v46, "setProposedStartDateStatus:", 3);
              }

            }
          }
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v69, v89, 16);
        }
        while (v42);
      }

      if (objc_msgSend(v67, "isOrWasPartOfRecurringSeries"))
        v51 = 4;
      else
        v51 = 0;
      v66[2](v66, v67, v51);
      -[EKEventViewControllerDefaultImpl completeWithAction:](val, "completeWithAction:", 0);
      break;
    case 0x1000:
      objc_msgSend(v67, "endDateUnadjustedForLegacyClients");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "startDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v8);
      v10 = v9;

      -[EKUIProposedTimeEventViewControllerDefaultImpl proposedTime](val, "proposedTime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setStartDate:", v11);

      -[EKUIProposedTimeEventViewControllerDefaultImpl proposedTime](val, "proposedTime");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dateByAddingTimeInterval:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setEndDateUnadjustedForLegacyClients:", v13);

      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      objc_msgSend(v67, "attendees");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v84;
        do
        {
          for (k = 0; k != v15; ++k)
          {
            if (*(_QWORD *)v84 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = v18;
              objc_msgSend(v19, "setCommentChanged:", 0);
              objc_msgSend(v19, "setStatusChanged:", 0);
              objc_msgSend(v19, "setProposedStartDateChanged:", 0);

            }
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
        }
        while (v15);
      }

      objc_msgSend(v67, "dismissAcceptedProposeNewTimeNotification");
      objc_msgSend(v65, "buttonForAction:", 4096);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v67, "isOrWasPartOfRecurringSeries"))
      {
        -[EKEventViewControllerDefaultImpl presentationSourceViewController](val, "presentationSourceViewController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "bounds");
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v80[0] = MEMORY[0x1E0C809B0];
        v80[1] = 3221225472;
        v80[2] = __108__EKUIProposedTimeEventViewControllerDefaultImpl_bottomStatusButtonTappedWithAction_eventStatusButtonsView___block_invoke_2;
        v80[3] = &unk_1E60186D8;
        v80[4] = val;
        v82 = v66;
        v81 = v67;
        +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v21, v20, v81, v80, v23, v25, v27, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUIProposedTimeEventViewControllerDefaultImpl setRecurrenceAlertController:](val, "setRecurrenceAlertController:", v30);

      }
      else
      {
        v66[2](v66, v67, 0);
        -[EKEventViewControllerDefaultImpl completeWithAction:](val, "completeWithAction:", 0);
      }

      break;
  }
  -[EKUIProposedTimeEventViewControllerDefaultImpl completionBlock](val, "completionBlock");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    -[EKUIProposedTimeEventViewControllerDefaultImpl completionBlock](val, "completionBlock");
    v62 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v62[2]();

  }
}

uint64_t __108__EKUIProposedTimeEventViewControllerDefaultImpl_bottomStatusButtonTappedWithAction_eventStatusButtonsView___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveEvent:span:error:", a2, a3, 0);
}

void __108__EKUIProposedTimeEventViewControllerDefaultImpl_bottomStatusButtonTappedWithAction_eventStatusButtonsView___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  if ((unint64_t)(a2 - 3) >= 3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setRecurrenceAlertController:", 0);
    objc_msgSend(*(id *)(a1 + 32), "completeWithAction:", 0);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1352);
    *(_QWORD *)(v3 + 1352) = 0;

  }
}

void __108__EKUIProposedTimeEventViewControllerDefaultImpl_bottomStatusButtonTappedWithAction_eventStatusButtonsView___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "messageSendingManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    objc_msgSend(WeakRetained, "presentationNavigationDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)acceptButtonTapped
{
  -[EKUIProposedTimeEventViewControllerDefaultImpl bottomStatusButtonTappedWithAction:eventStatusButtonsView:](self, "bottomStatusButtonTappedWithAction:eventStatusButtonsView:", 4096, 0);
}

- (void)replyButtonTapped
{
  -[EKUIProposedTimeEventViewControllerDefaultImpl bottomStatusButtonTappedWithAction:eventStatusButtonsView:](self, "bottomStatusButtonTappedWithAction:eventStatusButtonsView:", 0x4000, 0);
}

- (void)rejectButtonTapped
{
  -[EKUIProposedTimeEventViewControllerDefaultImpl bottomStatusButtonTappedWithAction:eventStatusButtonsView:](self, "bottomStatusButtonTappedWithAction:eventStatusButtonsView:", 0x2000, 0);
}

- (EKViewControllerRemoteUIDelegate)remoteUIDelegate
{
  return (EKViewControllerRemoteUIDelegate *)objc_loadWeakRetained((id *)&self->_remoteUIDelegate);
}

- (void)setRemoteUIDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_remoteUIDelegate, a3);
}

- (id)completionBlock
{
  return self->completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1336);
}

- (EKCalendarEventInvitationNotificationAttendee)proposedTimeAttendee
{
  return self->proposedTimeAttendee;
}

- (void)setProposedTimeAttendee:(id)a3
{
  objc_storeStrong((id *)&self->proposedTimeAttendee, a3);
}

- (EKUIRecurrenceAlertController)recurrenceAlertController
{
  return (EKUIRecurrenceAlertController *)objc_getProperty(self, a2, 1352, 1);
}

- (void)setRecurrenceAlertController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1352);
}

- (EKUIEmailCompositionManager)messageSendingManager
{
  return (EKUIEmailCompositionManager *)objc_getProperty(self, a2, 1360, 1);
}

- (void)setMessageSendingManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1360);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSendingManager, 0);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->proposedTimeAttendee, 0);
  objc_storeStrong(&self->completionBlock, 0);
  objc_destroyWeak((id *)&self->_remoteUIDelegate);
}

@end
