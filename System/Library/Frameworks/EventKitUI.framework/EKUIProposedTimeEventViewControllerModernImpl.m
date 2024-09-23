@implementation EKUIProposedTimeEventViewControllerModernImpl

- (id)viewControllerManager
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D0CDE8]);
  -[EKUIProposedTimeEventViewControllerModernImpl proposedTime](self, "proposedTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDelegate:proposedTime:", self, v4);

  return v5;
}

- (id)proposedTime
{
  void *v2;
  void *v3;

  -[EKUIProposedTimeEventViewControllerModernImpl proposedTimeAttendee](self, "proposedTimeAttendee");
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
  -[EKEventViewControllerModernImpl event](self, "event");
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
          -[EKUIProposedTimeEventViewControllerModernImpl proposedTimeAttendee](self, "proposedTimeAttendee");
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

  -[EKEventViewControllerModernImpl event](self, "event");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[EKUIEmailCompositionManager canShowViewControllerForEvent:withParticipantRecipients:](EKUIEmailCompositionManager, "canShowViewControllerForEvent:withParticipantRecipients:", v15, v23);

  -[EKEventViewControllerModernImpl event](self, "event");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "calendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "allowsContentModifications");

  v20 = &unk_1E606F890;
  if (v16)
    v20 = &unk_1E606F878;
  if (v19)
    v21 = v20;
  else
    v21 = 0;

  return v21;
}

- (void)invokeAction:(int64_t)a3 eventStatusButtonsView:(id)a4
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
  void *v62;
  void (**v63)(void);
  void *v64;
  id v65;
  id v66;
  void (**v67)(void *, void *, uint64_t);
  void *v68;
  EKUIProposedTimeEventViewControllerModernImpl *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  id location;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[5];
  id v82;
  void (**v83)(void *, void *, uint64_t);
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD aBlock[4];
  id v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v66 = a4;
  v69 = self;
  -[EKEventViewControllerModernImpl event](self, "event");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIResponder EKUI_editor](self, "EKUI_editor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__EKUIProposedTimeEventViewControllerModernImpl_invokeAction_eventStatusButtonsView___block_invoke;
  aBlock[3] = &unk_1E60186B0;
  v65 = v6;
  v89 = v65;
  v67 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
  switch(a3)
  {
    case 0x4000:
      v64 = (void *)objc_opt_new();
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      objc_msgSend(v68, "attendees");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v78;
        while (2)
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v78 != v33)
              objc_enumerationMutation(v31);
            v35 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v36 = v35;
              -[EKUIProposedTimeEventViewControllerModernImpl proposedTimeAttendee](v69, "proposedTimeAttendee");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "emailAddress");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "emailAddress");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v38, "isEqual:", v39);

              if (v40)
              {
                objc_msgSend(v64, "addObject:", v36);

                goto LABEL_42;
              }

            }
          }
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
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

      v54 = -[EKUIEmailCompositionManager initWithEvent:participantRecipients:subjectPrefix:bodyPrefix:]([EKUIEmailCompositionManager alloc], "initWithEvent:participantRecipients:subjectPrefix:bodyPrefix:", v68, v64, v53, 0);
      -[EKUIProposedTimeEventViewControllerModernImpl setMessageSendingManager:](v69, "setMessageSendingManager:", v54);

      -[EKUIProposedTimeEventViewControllerModernImpl messageSendingManager](v69, "messageSendingManager");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v55);

      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __85__EKUIProposedTimeEventViewControllerModernImpl_invokeAction_eventStatusButtonsView___block_invoke_3;
      v74[3] = &unk_1E6018700;
      objc_copyWeak(&v75, &location);
      -[EKUIProposedTimeEventViewControllerModernImpl messageSendingManager](v69, "messageSendingManager");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setMessageSendingComplete:", v74);

      -[EKUIProposedTimeEventViewControllerModernImpl messageSendingManager](v69, "messageSendingManager");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "viewController");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setModalPresentationStyle:", 2);

      -[EKEventViewControllerModernImpl presentationSourceViewController](v69, "presentationSourceViewController");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIProposedTimeEventViewControllerModernImpl messageSendingManager](v69, "messageSendingManager");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "viewController");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "presentViewController:animated:completion:", v61, 1, 0);

      objc_destroyWeak(&v75);
      objc_destroyWeak(&location);

      break;
    case 0x2000:
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      objc_msgSend(v68, "attendees");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v70, v90, 16);
      if (v42)
      {
        v43 = *(_QWORD *)v71;
        do
        {
          for (j = 0; j != v42; ++j)
          {
            if (*(_QWORD *)v71 != v43)
              objc_enumerationMutation(v41);
            v45 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v46 = v45;
              -[EKUIProposedTimeEventViewControllerModernImpl proposedTimeAttendee](v69, "proposedTimeAttendee");
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
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v70, v90, 16);
        }
        while (v42);
      }

      if (objc_msgSend(v68, "isOrWasPartOfRecurringSeries"))
        v51 = 4;
      else
        v51 = 0;
      v67[2](v67, v68, v51);
      -[EKEventViewControllerModernImpl completeWithAction:](v69, "completeWithAction:", 0);
      break;
    case 0x1000:
      objc_msgSend(v68, "endDateUnadjustedForLegacyClients");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "startDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v8);
      v10 = v9;

      -[EKUIProposedTimeEventViewControllerModernImpl proposedTime](v69, "proposedTime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setStartDate:", v11);

      -[EKUIProposedTimeEventViewControllerModernImpl proposedTime](v69, "proposedTime");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dateByAddingTimeInterval:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setEndDateUnadjustedForLegacyClients:", v13);

      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      objc_msgSend(v68, "attendees");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v85;
        do
        {
          for (k = 0; k != v15; ++k)
          {
            if (*(_QWORD *)v85 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = v18;
              objc_msgSend(v19, "setCommentChanged:", 0);
              objc_msgSend(v19, "setStatusChanged:", 0);
              objc_msgSend(v19, "setProposedStartDateChanged:", 0);

            }
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
        }
        while (v15);
      }

      objc_msgSend(v68, "dismissAcceptedProposeNewTimeNotification");
      objc_msgSend(v66, "buttonForAction:", 4096);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v68, "isOrWasPartOfRecurringSeries"))
      {
        -[EKEventViewControllerModernImpl presentationSourceViewController](v69, "presentationSourceViewController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "bounds");
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v81[0] = MEMORY[0x1E0C809B0];
        v81[1] = 3221225472;
        v81[2] = __85__EKUIProposedTimeEventViewControllerModernImpl_invokeAction_eventStatusButtonsView___block_invoke_2;
        v81[3] = &unk_1E60186D8;
        v81[4] = v69;
        v83 = v67;
        v82 = v68;
        +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v21, v20, v82, v81, v23, v25, v27, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUIProposedTimeEventViewControllerModernImpl setRecurrenceAlertController:](v69, "setRecurrenceAlertController:", v30);

      }
      else
      {
        v67[2](v67, v68, 0);
        -[EKEventViewControllerModernImpl completeWithAction:](v69, "completeWithAction:", 0);
      }

      break;
  }
  -[EKUIProposedTimeEventViewControllerModernImpl completionBlock](v69, "completionBlock");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    -[EKUIProposedTimeEventViewControllerModernImpl completionBlock](v69, "completionBlock");
    v63 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v63[2]();

  }
}

uint64_t __85__EKUIProposedTimeEventViewControllerModernImpl_invokeAction_eventStatusButtonsView___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveEvent:span:error:", a2, a3, 0);
}

void __85__EKUIProposedTimeEventViewControllerModernImpl_invokeAction_eventStatusButtonsView___block_invoke_2(uint64_t a1, uint64_t a2)
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
    v4 = *(void **)(v3 + 1128);
    *(_QWORD *)(v3 + 1128) = 0;

  }
}

void __85__EKUIProposedTimeEventViewControllerModernImpl_invokeAction_eventStatusButtonsView___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "viewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

    WeakRetained = v4;
  }

}

- (void)requestOrganizerDetailPresentation
{
  EKIdentityViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  EKIdentityViewController *v7;

  v3 = [EKIdentityViewController alloc];
  -[EKEventViewControllerModernImpl event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "organizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EKIdentityViewController initWithIdentity:](v3, "initWithIdentity:", v5);

  -[EKUIProposedTimeEventViewControllerModernImpl navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v7, 1);

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 1112);
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
  return (EKUIRecurrenceAlertController *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setRecurrenceAlertController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1128);
}

- (EKUIEmailCompositionManager)messageSendingManager
{
  return (EKUIEmailCompositionManager *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setMessageSendingManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1136);
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
