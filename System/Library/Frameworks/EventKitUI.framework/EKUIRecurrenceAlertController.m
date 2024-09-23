@implementation EKUIRecurrenceAlertController

- (void)dealloc
{
  objc_super v3;

  -[EKUIRecurrenceAlertController cancelAnimated:](self, "cancelAnimated:", 0);
  v3.receiver = self;
  v3.super_class = (Class)EKUIRecurrenceAlertController;
  -[EKUIRecurrenceAlertController dealloc](&v3, sel_dealloc);
}

+ (id)newAlertControllerWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setCompletionHandler:", v3);

  return v4;
}

- (BOOL)isCurrentlyShowingAlert
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[UIAlertController view](self->_alertController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIAlertController presentingViewController](self->_alertController, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = -[UIAlertController isBeingDismissed](self->_alertController, "isBeingDismissed") ^ 1;
    else
      LOBYTE(v6) = 0;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (id)_defaultStringForDeleteButtonForEvent:(id)a3
{
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = objc_msgSend(a3, "isReminderIntegrationEvent");
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("Delete Reminder");
  else
    v6 = CFSTR("Delete Event");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)presentDeleteAlertWithOptions:(unint64_t)a3 viewController:(id)a4 barButtonItem:(id)a5 forEvent:(id)a6 stringForDeleteButton:(id)a7 withCompletionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void *)objc_msgSend(a1, "newAlertControllerWithCompletionHandler:", a8);
  v19 = v17;
  if (!v17)
  {
    objc_msgSend(a1, "_defaultStringForDeleteButtonForEvent:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v18, "_presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:barButtonItem:forEvent:stringForDeleteButton:", a3, v14, 0, v15, v16, v19, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  if (!v17)

  return v18;
}

+ (id)presentDeleteAlertWithOptions:(unint64_t)a3 viewController:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 forEvent:(id)a7 stringForDeleteButton:(id)a8 withCompletionHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v19 = a4;
  v20 = a5;
  v21 = a7;
  v22 = a8;
  v23 = (void *)objc_msgSend(a1, "newAlertControllerWithCompletionHandler:", a9);
  v24 = v23;
  if (v22)
  {
    objc_msgSend(v23, "_presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:barButtonItem:forEvent:stringForDeleteButton:", a3, v19, v20, 0, v21, v22, x, y, width, height);
  }
  else
  {
    objc_msgSend(a1, "_defaultStringForDeleteButtonForEvent:", v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:barButtonItem:forEvent:stringForDeleteButton:", a3, v19, v20, 0, v21, v25, x, y, width, height);

  }
  return v24;
}

+ (id)presentDeleteAlertWithOptions:(unint64_t)a3 viewController:(id)a4 forEvents:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_msgSend(a1, "newAlertControllerWithCompletionHandler:", a6);
  if (objc_msgSend(v11, "count") == 1)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_defaultStringForDeleteButtonForEvent:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:barButtonItem:forEvent:stringForDeleteButton:", a3, v10, 0, 0, v13, v15, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  }
  else if (objc_msgSend(v12, "_setupDeleteAlertForEvents:", v11))
  {
    objc_msgSend(v12, "alertController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentViewController:animated:completion:", v13, 1, 0);
  }
  else
  {
    v13 = v12;
    v12 = 0;
  }

  return v12;
}

+ (id)deleteAlertWithOptions:(unint64_t)a3 forEvent:(id)a4 stringForDeleteButton:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(a1, "shouldShowDeleteAlertForEvent:options:", v10, a3))
  {
    v13 = (void *)objc_msgSend(a1, "newAlertControllerWithCompletionHandler:", v12);
    v14 = v13;
    if (v11)
    {
      objc_msgSend(v13, "setupDeleteAlertWithOptions:viewController:forEvent:stringForDeleteButton:", a3, 0, v10, v11);
    }
    else
    {
      objc_msgSend(a1, "_defaultStringForDeleteButtonForEvent:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setupDeleteAlertWithOptions:viewController:forEvent:stringForDeleteButton:", a3, 0, v10, v15);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)shouldShowDeleteAlertForEvent:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v5;
  char v6;
  char v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v4 = a4;
  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "isReminderIntegrationEvent");
  if ((v6 & 1) != 0 || (v4 & 0x10) != 0)
  {
    v8 = (v4 & 0x10) == 0;
    v9 = (void *)MEMORY[0x1E0D0CE08];
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "spanDecisionInfoForEvents:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "shouldRequestSpan"))
      v7 = v6 ^ 1;
    else
      v7 = v8;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (id)presentUnsubscribeAlertWithOptions:(unint64_t)a3 viewController:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 withCompletionHandler:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint8_t v22[16];

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  if (v15)
  {
    objc_msgSend(a1, "unsubscribeAlertWithOptions:withCompletionHandler:", a3, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_configureAlertControllerWithSourceView:sourceRect:barButtonItem:", v16, 0, x, y, width, height);
    objc_msgSend(v18, "alertController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentViewController:animated:completion:", v19, 1, 0);

  }
  else
  {
    v20 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1AF84D000, v20, OS_LOG_TYPE_ERROR, "Presenting a delete alert requires a view controller.", v22, 2u);
    }
    v18 = 0;
  }

  return v18;
}

+ (id)unsubscribeAlertWithOptions:(unint64_t)a3 withCompletionHandler:(id)a4
{
  void *v5;

  v5 = (void *)objc_msgSend(a1, "newAlertControllerWithCompletionHandler:", a4);
  objc_msgSend(v5, "setupUnsubscribeAlertWithOptions:viewController:", a3, 0);
  return v5;
}

+ (id)presentDetachAlertWithOptions:(unint64_t)a3 viewController:(id)a4 barButtonItem:(id)a5 forEvent:(id)a6 withCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = (void *)objc_msgSend(a1, "newAlertControllerWithCompletionHandler:", a7);
  objc_msgSend(v15, "_presentDetachAlertWithOptions:viewController:sourceView:sourceRect:barButtonItem:forEvent:", a3, v14, 0, v13, v12, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

  return v15;
}

+ (id)presentDetachAlertWithOptions:(unint64_t)a3 viewController:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 forEvent:(id)a7 withCompletionHandler:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  void *v20;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v17 = a7;
  v18 = a5;
  v19 = a4;
  v20 = (void *)objc_msgSend(a1, "newAlertControllerWithCompletionHandler:", a8);
  objc_msgSend(v20, "_presentDetachAlertWithOptions:viewController:sourceView:sourceRect:barButtonItem:forEvent:", a3, v19, v18, 0, v17, x, y, width, height);

  return v20;
}

+ (BOOL)shouldShowDetachAlertForEvent:(id)a3 options:(unint64_t)a4
{
  return objc_msgSend(a3, "isReminderIntegrationEvent") ^ 1;
}

+ (id)presentAttachmentAlertWithOptions:(unint64_t)a3 viewController:(id)a4 barButtonItem:(id)a5 forEvent:(id)a6 withCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = (void *)objc_msgSend(a1, "newAlertControllerWithCompletionHandler:", a7);
  objc_msgSend(v15, "_presentAttachmentsAlertWithOptions:viewController:barButtonItem:forEvent:", a3, v14, v13, v12);

  return v15;
}

+ (BOOL)_useSheetForViewController:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  char v12;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if ((v4 & 2) != 0)
  {
    v9 = 0;
    goto LABEL_12;
  }
  if ((v4 & 4) != 0)
  {
    if (!v5
      || (objc_msgSend(v5, "popoverPresentationController"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v10))
    {
      v9 = 1;
      goto LABEL_12;
    }
  }
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!EKUICurrentHeightSizeClassIsCompact(v7))
  {
    objc_msgSend(v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v8))
    {
      v9 = 1;
      v12 = objc_msgSend(v6, "_isInContextOfPresentationControllerOfClass:effective:", objc_opt_class(), 1);

      if ((v12 & 1) != 0)
        goto LABEL_12;
      objc_msgSend(v6, "_popoverController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7 != 0;
      goto LABEL_7;
    }

  }
  v9 = 1;
LABEL_7:

LABEL_12:
  return v9;
}

- (void)setupUnsubscribeAlertWithOptions:(unint64_t)a3 viewController:(id)a4
{
  id v6;
  UIAlertController *v7;
  UIAlertController *alertController;
  void *v9;
  void *v10;
  UIAlertController *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  UIAlertController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UIAlertController *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location[2];

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, objc_msgSend((id)objc_opt_class(), "_useSheetForViewController:options:", v6, a3) ^ 1);
  v7 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  alertController = self->_alertController;
  self->_alertController = v7;

  objc_initWeak(location, self);
  EventKitUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Are you sure you want to unsubscribe? Unsubscribing will delete all events from this subscription."), &stru_1E601DFA8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController setTitle:](self->_alertController, "setTitle:", v10);

  v11 = self->_alertController;
  v12 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Unsubscribe"), &stru_1E601DFA8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __81__EKUIRecurrenceAlertController_setupUnsubscribeAlertWithOptions_viewController___block_invoke;
  v30[3] = &unk_1E601A1D0;
  objc_copyWeak(&v31, location);
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 2, v30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](v11, "addAction:", v16);

  v17 = self->_alertController;
  v18 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Unsubscribe and Report Junk"), &stru_1E601DFA8, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v15;
  v28[1] = 3221225472;
  v28[2] = __81__EKUIRecurrenceAlertController_setupUnsubscribeAlertWithOptions_viewController___block_invoke_2;
  v28[3] = &unk_1E601A1D0;
  objc_copyWeak(&v29, location);
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 2, v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](v17, "addAction:", v21);

  v22 = self->_alertController;
  v23 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend((id)objc_opt_class(), "_cancelLocalizedString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  v26[1] = 3221225472;
  v26[2] = __81__EKUIRecurrenceAlertController_setupUnsubscribeAlertWithOptions_viewController___block_invoke_3;
  v26[3] = &unk_1E601A1D0;
  objc_copyWeak(&v27, location);
  objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 1, v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](v22, "addAction:", v25);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(location);

}

void __81__EKUIRecurrenceAlertController_setupUnsubscribeAlertWithOptions_viewController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 4);

}

void __81__EKUIRecurrenceAlertController_setupUnsubscribeAlertWithOptions_viewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 5);

}

void __81__EKUIRecurrenceAlertController_setupUnsubscribeAlertWithOptions_viewController___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 3);

}

- (BOOL)_setupDeleteAlertForEvents:(id)a3
{
  id v4;
  void *v5;
  char v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  UIAlertController *v22;
  UIAlertController *alertController;
  uint64_t v24;
  UIAlertController *v25;
  void *v26;
  id *v27;
  void *v28;
  UIAlertController *v29;
  void *v30;
  UIAlertController *v31;
  void *v32;
  void *v33;
  UIAlertController *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  id location[2];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D0CE08], "spanDecisionInfoForEvents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldRequestSpan");
  if ((v6 & 1) != 0)
  {
    v7 = objc_msgSend(v5, "proposeFuture");
    v8 = objc_msgSend(v5, "recurringEventCount");
    v9 = objc_msgSend(v4, "count");
    EventKitUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("You’re deleting events."), &stru_1E601DFA8, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    EventKitUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Delete Only These Events"), &stru_1E601DFA8, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    EventKitUIBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v40 = (void *)v13;
    if (v7)
    {
      if (v8 == v9)
        v16 = CFSTR("Do you want to delete this and all future occurrences of these events, or only the selected occurrences?");
      else
        v16 = CFSTR("Some of the selected events are repeating events. Do you want to delete this and all future occurrences of these events, or only the selected occurrences?");
      objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1E601DFA8, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      EventKitUIBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Delete All Future Events"), &stru_1E601DFA8, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
    }
    else
    {
      if (v8 == v9)
        v21 = CFSTR("Do you want to delete all occurrences of these events, or only the selected occurrences?");
      else
        v21 = CFSTR("Some of the selected events are repeating events. Do you want to delete all occurrences of these events, or only the selected occurrences?");
      objc_msgSend(v14, "localizedStringForKey:value:table:", v21, &stru_1E601DFA8, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      EventKitUIBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Delete All"), &stru_1E601DFA8, 0);
      v20 = objc_claimAutoreleasedReturnValue();
      v19 = 0;
    }

    v39 = (void *)v11;
    +[EKUIDeleteAlertController alertControllerWithTitle:message:preferredStyle:](EKUIDeleteAlertController, "alertControllerWithTitle:message:preferredStyle:", v11, v17, 1);
    v22 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
    alertController = self->_alertController;
    self->_alertController = v22;

    objc_initWeak(location, self);
    v24 = MEMORY[0x1E0C809B0];
    v41 = (void *)v20;
    if (v19)
    {
      v25 = self->_alertController;
      v26 = (void *)MEMORY[0x1E0DC3448];
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __60__EKUIRecurrenceAlertController__setupDeleteAlertForEvents___block_invoke;
      v48[3] = &unk_1E601A1D0;
      v27 = &v49;
      objc_copyWeak(&v49, location);
      objc_msgSend(v26, "actionWithTitle:style:handler:", v19, 0, v48);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAlertController addAction:](v25, "addAction:", v28);
    }
    else
    {
      if (!v20)
      {
LABEL_17:
        v31 = self->_alertController;
        v32 = (void *)MEMORY[0x1E0DC3448];
        v44[0] = v24;
        v44[1] = 3221225472;
        v44[2] = __60__EKUIRecurrenceAlertController__setupDeleteAlertForEvents___block_invoke_3;
        v44[3] = &unk_1E601A1D0;
        objc_copyWeak(&v45, location);
        objc_msgSend(v32, "actionWithTitle:style:handler:", v40, 0, v44);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIAlertController addAction:](v31, "addAction:", v33);

        v34 = self->_alertController;
        v35 = (void *)MEMORY[0x1E0DC3448];
        objc_msgSend((id)objc_opt_class(), "_cancelLocalizedString");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __60__EKUIRecurrenceAlertController__setupDeleteAlertForEvents___block_invoke_4;
        v42[3] = &unk_1E601A1D0;
        objc_copyWeak(&v43, location);
        objc_msgSend(v35, "actionWithTitle:style:handler:", v36, 1, v42);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIAlertController addAction:](v34, "addAction:", v37);

        objc_destroyWeak(&v43);
        objc_destroyWeak(&v45);
        objc_destroyWeak(location);

        goto LABEL_18;
      }
      v29 = self->_alertController;
      v30 = (void *)MEMORY[0x1E0DC3448];
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __60__EKUIRecurrenceAlertController__setupDeleteAlertForEvents___block_invoke_2;
      v46[3] = &unk_1E601A1D0;
      v27 = &v47;
      objc_copyWeak(&v47, location);
      objc_msgSend(v30, "actionWithTitle:style:handler:", v41, 0, v46);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAlertController addAction:](v29, "addAction:", v28);
    }

    objc_destroyWeak(v27);
    v24 = MEMORY[0x1E0C809B0];
    goto LABEL_17;
  }
  -[EKUIRecurrenceAlertController _completeWithSelection:](self, "_completeWithSelection:", 0);
LABEL_18:

  return v6;
}

void __60__EKUIRecurrenceAlertController__setupDeleteAlertForEvents___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 1);

}

void __60__EKUIRecurrenceAlertController__setupDeleteAlertForEvents___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 2);

}

void __60__EKUIRecurrenceAlertController__setupDeleteAlertForEvents___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 0);

}

void __60__EKUIRecurrenceAlertController__setupDeleteAlertForEvents___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 3);

}

+ (id)_defaultStringForDeleteTitleWhenNotRecurring:(id)a3
{
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = objc_msgSend(a3, "isReminderIntegrationEvent");
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("Are you sure you want to delete this reminder?");
  else
    v6 = CFSTR("Are you sure you want to delete this event?");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setupDeleteAlertWithOptions:(unint64_t)a3 viewController:(id)a4 forEvent:(id)a5 stringForDeleteButton:(id)a6
{
  id v10;
  id v11;
  char v12;
  UIAlertController *v13;
  UIAlertController *alertController;
  void *v15;
  void *v16;
  UIAlertController *v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  void *v22;
  UIAlertController *v23;
  void *v24;
  void *v25;
  void *v26;
  id *v27;
  void *v28;
  void *v29;
  UIAlertController *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  UIAlertController *v34;
  void *v35;
  void *v36;
  id *v37;
  void *v38;
  UIAlertController *v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  id location[2];

  v10 = a4;
  v11 = a5;
  v41 = a6;
  v12 = +[EKUIRecurrenceAlertController _determineChoicesForEvent:options:](EKUIRecurrenceAlertController, "_determineChoicesForEvent:options:", v11, a3);
  +[EKUIDeleteAlertController alertControllerWithTitle:message:preferredStyle:](EKUIDeleteAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, objc_msgSend((id)objc_opt_class(), "_useSheetForViewController:options:", v10, a3) ^ 1);
  v13 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  alertController = self->_alertController;
  self->_alertController = v13;

  objc_initWeak(location, self);
  if ((v12 & 6) != 0)
  {
    EventKitUIBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Are you sure you want to delete this event? This is a repeating event."), &stru_1E601DFA8, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController setTitle:](self->_alertController, "setTitle:", v16);

    v17 = self->_alertController;
    v18 = (void *)MEMORY[0x1E0DC3448];
    EventKitUIBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Delete This Event Only"), &stru_1E601DFA8, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke;
    v52[3] = &unk_1E601A1D0;
    v21 = &v53;
    objc_copyWeak(&v53, location);
    objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 0, v52);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController addAction:](v17, "addAction:", v22);

    v23 = self->_alertController;
    v24 = (void *)MEMORY[0x1E0DC3448];
    EventKitUIBundle();
    if ((v12 & 4) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Delete All Events"), &stru_1E601DFA8, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_2;
      v50[3] = &unk_1E601A1D0;
      v27 = &v51;
      objc_copyWeak(&v51, location);
      objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 0, v50);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAlertController addAction:](v23, "addAction:", v28);
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Delete All Future Events"), &stru_1E601DFA8, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_3;
      v48[3] = &unk_1E601A1D0;
      v27 = &v49;
      objc_copyWeak(&v49, location);
      objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 0, v48);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAlertController addAction:](v23, "addAction:", v28);
    }

    objc_destroyWeak(v27);
    v39 = self->_alertController;
    v40 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend((id)objc_opt_class(), "_cancelLocalizedString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_4;
    v46[3] = &unk_1E601A1D0;
    v37 = &v47;
    objc_copyWeak(&v47, location);
    objc_msgSend(v40, "actionWithTitle:style:handler:", v36, 1, v46);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController addAction:](v39, "addAction:", v38);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_defaultStringForDeleteTitleWhenNotRecurring:", v11);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController setTitle:](self->_alertController, "setTitle:", v29);

    v30 = self->_alertController;
    v31 = (void *)MEMORY[0x1E0DC3448];
    v32 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_5;
    v44[3] = &unk_1E601A1D0;
    v21 = &v45;
    objc_copyWeak(&v45, location);
    objc_msgSend(v31, "actionWithTitle:style:handler:", v41, 2, v44);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController addAction:](v30, "addAction:", v33);

    v34 = self->_alertController;
    v35 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend((id)objc_opt_class(), "_cancelLocalizedString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v32;
    v42[1] = 3221225472;
    v42[2] = __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_6;
    v42[3] = &unk_1E601A1D0;
    v37 = &v43;
    objc_copyWeak(&v43, location);
    objc_msgSend(v35, "actionWithTitle:style:handler:", v36, 1, v42);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController addAction:](v34, "addAction:", v38);
  }

  objc_destroyWeak(v37);
  objc_destroyWeak(v21);
  objc_destroyWeak(location);

}

void __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 0);

}

void __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 2);

}

void __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 1);

}

void __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 3);

}

void __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 0);

}

void __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 3);

}

- (void)_presentDeleteAlertWithOptions:(unint64_t)a3 viewController:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 barButtonItem:(id)a7 forEvent:(id)a8 stringForDeleteButton:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  uint8_t v25[16];

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v19 = a4;
  v20 = a5;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  if (v19)
  {
    if ((objc_msgSend((id)objc_opt_class(), "shouldShowDeleteAlertForEvent:options:", v22, a3) & 1) != 0)
    {
      -[EKUIRecurrenceAlertController setupDeleteAlertWithOptions:viewController:forEvent:stringForDeleteButton:](self, "setupDeleteAlertWithOptions:viewController:forEvent:stringForDeleteButton:", a3, v19, v22, v23);
      -[EKUIRecurrenceAlertController _configureAlertControllerWithSourceView:sourceRect:barButtonItem:](self, "_configureAlertControllerWithSourceView:sourceRect:barButtonItem:", v20, v21, x, y, width, height);
      objc_msgSend(v19, "presentViewController:animated:completion:", self->_alertController, 1, 0);
    }
    else
    {
      -[EKUIRecurrenceAlertController _completeWithSelection:](self, "_completeWithSelection:", 0);
    }
  }
  else
  {
    v24 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1AF84D000, v24, OS_LOG_TYPE_ERROR, "Presenting a delete alert requires a view controller.", v25, 2u);
    }
  }

}

- (void)_presentDetachAlertWithOptions:(unint64_t)a3 viewController:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 barButtonItem:(id)a7 forEvent:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  UIAlertController *v30;
  UIAlertController *alertController;
  UIAlertController *v32;
  void *v33;
  void *v34;
  void *v35;
  id *v36;
  void *v37;
  UIAlertController *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  UIAlertController *v43;
  void *v44;
  void *v45;
  id *v46;
  void *v47;
  void *v48;
  void *v49;
  UIAlertController *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  unsigned int v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  char v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  char v66;
  _QWORD v67[4];
  id v68;
  id buf[2];

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  if (v17)
  {
    if ((objc_msgSend((id)objc_opt_class(), "shouldShowDetachAlertForEvent:options:", v20, a3) & 1) != 0)
    {
      v55 = v19;
      v21 = v18;
      v22 = +[EKUIRecurrenceAlertController _determineChoicesForEvent:options:](EKUIRecurrenceAlertController, "_determineChoicesForEvent:options:", v20, a3);
      v56 = v22 & 4;
      v23 = objc_msgSend((id)objc_opt_class(), "_useSheetForViewController:options:", v17, a3) ^ 1;
      if ((a3 & 8) != 0)
      {
        EventKitUIBundle();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Changes to attachments will apply to all recurrences."), &stru_1E601DFA8, 0);
        v24 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v24 = 0;
      }
      v27 = (void *)MEMORY[0x1E0DC3450];
      EventKitUIBundle();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("This is a repeating event."), &stru_1E601DFA8, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)v24;
      objc_msgSend(v27, "alertControllerWithTitle:message:preferredStyle:", v29, v24, v23);
      v30 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
      alertController = self->_alertController;
      self->_alertController = v30;

      objc_initWeak(buf, self);
      v32 = self->_alertController;
      v33 = (void *)MEMORY[0x1E0DC3448];
      if ((v22 & 1) != 0)
      {
        EventKitUIBundle();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v21;
        objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("Save for This Event Only"), &stru_1E601DFA8, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke;
        v67[3] = &unk_1E601A1D0;
        v36 = &v68;
        objc_copyWeak(&v68, buf);
        objc_msgSend(v33, "actionWithTitle:style:handler:", v35, 0, v67);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIAlertController addAction:](v32, "addAction:", v37);

        v38 = self->_alertController;
        v39 = (void *)MEMORY[0x1E0DC3448];
        if (v56)
          objc_msgSend((id)objc_opt_class(), "_detachAllLocalizedString");
        else
          objc_msgSend((id)objc_opt_class(), "_detachFutureLocalizedString");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke_2;
        v64[3] = &unk_1E601AC50;
        v46 = &v65;
        objc_copyWeak(&v65, buf);
        v66 = v56 >> 2;
        objc_msgSend(v39, "actionWithTitle:style:handler:", v48, 0, v64);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIAlertController addAction:](v38, "addAction:", v49);

        v50 = self->_alertController;
        v51 = (void *)MEMORY[0x1E0DC3448];
        objc_msgSend((id)objc_opt_class(), "_cancelLocalizedString");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke_3;
        v62[3] = &unk_1E601A1D0;
        objc_copyWeak(&v63, buf);
        objc_msgSend(v51, "actionWithTitle:style:handler:", v52, 1, v62);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIAlertController addAction:](v50, "addAction:", v53);

        objc_destroyWeak(&v63);
      }
      else
      {
        v18 = v21;
        if ((v22 & 4) != 0)
          objc_msgSend((id)objc_opt_class(), "_detachAllLocalizedString");
        else
          objc_msgSend((id)objc_opt_class(), "_detachFutureLocalizedString");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = MEMORY[0x1E0C809B0];
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke_4;
        v59[3] = &unk_1E601AC50;
        v36 = &v60;
        objc_copyWeak(&v60, buf);
        v61 = v56 >> 2;
        objc_msgSend(v33, "actionWithTitle:style:handler:", v40, 2, v59);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIAlertController addAction:](v32, "addAction:", v42);

        v43 = self->_alertController;
        v44 = (void *)MEMORY[0x1E0DC3448];
        objc_msgSend((id)objc_opt_class(), "_cancelLocalizedString");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = v41;
        v57[1] = 3221225472;
        v57[2] = __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke_5;
        v57[3] = &unk_1E601A1D0;
        v46 = &v58;
        objc_copyWeak(&v58, buf);
        objc_msgSend(v44, "actionWithTitle:style:handler:", v45, 1, v57);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIAlertController addAction:](v43, "addAction:", v47);

      }
      objc_destroyWeak(v46);
      objc_destroyWeak(v36);
      v19 = v55;
      -[EKUIRecurrenceAlertController _configureAlertControllerWithSourceView:sourceRect:barButtonItem:](self, "_configureAlertControllerWithSourceView:sourceRect:barButtonItem:", v18, v55, x, y, width, height);
      objc_msgSend(v17, "presentViewController:animated:completion:", self->_alertController, 1, 0);
      objc_destroyWeak(buf);

    }
    else
    {
      -[EKUIRecurrenceAlertController _completeWithSelection:](self, "_completeWithSelection:", 0);
    }
  }
  else
  {
    v25 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1AF84D000, v25, OS_LOG_TYPE_ERROR, "Presenting a detach alert requires a view controller.", (uint8_t *)buf, 2u);
    }
  }

}

void __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 0);

}

void __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (*(_BYTE *)(a1 + 40))
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(WeakRetained, "_completeWithSelection:", v3);

}

void __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 3);

}

void __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (*(_BYTE *)(a1 + 40))
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(WeakRetained, "_completeWithSelection:", v3);

}

void __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 3);

}

- (void)_presentAttachmentsAlertWithOptions:(unint64_t)a3 viewController:(id)a4 barButtonItem:(id)a5 forEvent:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIAlertController *v20;
  UIAlertController *alertController;
  UIAlertController *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  UIAlertController *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id location[2];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v10)
  {
    v33 = v12;
    v14 = objc_msgSend((id)objc_opt_class(), "_useSheetForViewController:options:", v10, a3) ^ 1;
    v15 = (void *)MEMORY[0x1E0DC3450];
    EventKitUIBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("This is a repeating event."), &stru_1E601DFA8, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    EventKitUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Attachment changes must be applied to all recurrences."), &stru_1E601DFA8, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "alertControllerWithTitle:message:preferredStyle:", v17, v19, v14);
    v20 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
    alertController = self->_alertController;
    self->_alertController = v20;

    objc_initWeak(location, self);
    v22 = self->_alertController;
    v23 = (void *)MEMORY[0x1E0DC3448];
    EventKitUIBundle();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Save for all recurrences"), &stru_1E601DFA8, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __107__EKUIRecurrenceAlertController__presentAttachmentsAlertWithOptions_viewController_barButtonItem_forEvent___block_invoke;
    v36[3] = &unk_1E601A1D0;
    objc_copyWeak(&v37, location);
    objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 0, v36);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController addAction:](v22, "addAction:", v27);

    v28 = self->_alertController;
    v29 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend((id)objc_opt_class(), "_cancelLocalizedString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v26;
    v34[1] = 3221225472;
    v34[2] = __107__EKUIRecurrenceAlertController__presentAttachmentsAlertWithOptions_viewController_barButtonItem_forEvent___block_invoke_2;
    v34[3] = &unk_1E601A1D0;
    objc_copyWeak(&v35, location);
    objc_msgSend(v29, "actionWithTitle:style:handler:", v30, 1, v34);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController addAction:](v28, "addAction:", v31);

    -[EKUIRecurrenceAlertController _configureAlertControllerWithSourceView:sourceRect:barButtonItem:](self, "_configureAlertControllerWithSourceView:sourceRect:barButtonItem:", 0, v11, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    objc_msgSend(v10, "presentViewController:animated:completion:", self->_alertController, 1, 0);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(location);
    v13 = v33;
  }
  else
  {
    v32 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1AF84D000, v32, OS_LOG_TYPE_ERROR, "Presenting a detach alert requires a view controller.", (uint8_t *)location, 2u);
    }
  }

}

void __107__EKUIRecurrenceAlertController__presentAttachmentsAlertWithOptions_viewController_barButtonItem_forEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 2);

}

void __107__EKUIRecurrenceAlertController__presentAttachmentsAlertWithOptions_viewController_barButtonItem_forEvent___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 3);

}

- (void)_configureAlertControllerWithSourceView:(id)a3 sourceRect:(CGRect)a4 barButtonItem:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  id v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  v11 = a5;
  if (v14)
  {
    -[UIAlertController popoverPresentationController](self->_alertController, "popoverPresentationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSourceView:", v14);

    -[UIAlertController popoverPresentationController](self->_alertController, "popoverPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSourceRect:", x, y, width, height);
LABEL_5:

    goto LABEL_6;
  }
  if (v11)
  {
    -[UIAlertController popoverPresentationController](self->_alertController, "popoverPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBarButtonItem:", v11);
    goto LABEL_5;
  }
LABEL_6:

}

+ (id)_detachAllLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Save for All Events"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_detachFutureLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Save for Future Events"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)cancelAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((-[UIAlertController isBeingDismissed](self->_alertController, "isBeingDismissed") & 1) == 0)
    -[UIAlertController dismissViewControllerAnimated:completion:](self->_alertController, "dismissViewControllerAnimated:completion:", v3, 0);
}

- (void)_completeWithSelection:(unint64_t)a3
{
  void (**completionHandler)(id, unint64_t);

  completionHandler = (void (**)(id, unint64_t))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, a3);
  -[EKUIRecurrenceAlertController _cleanup](self, "_cleanup", a3);
}

- (void)_cleanup
{
  id completionHandler;
  UIAlertController *alertController;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  alertController = self->_alertController;
  self->_alertController = 0;

}

+ (id)_cancelLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Cancel - recurrence alert controller"), CFSTR("Cancel"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int)_determineChoicesForEvent:(id)a3 options:(unint64_t)a4
{
  id v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  char v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
LABEL_16:
    v9 = 1;
    goto LABEL_17;
  }
  v7 = objc_msgSend(v5, "canDetachSingleOccurrence");
  if ((a4 & 1) != 0 || !objc_msgSend(v6, "isOrWasPartOfRecurringSeries"))
  {
LABEL_13:
    if ((v7 & 1) == 0)
    {
      v13 = (void *)kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        v14 = (void *)MEMORY[0x1E0CB37E8];
        v15 = v13;
        objc_msgSend(v14, "numberWithUnsignedInteger:", a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412546;
        v23 = v6;
        v24 = 2112;
        v25 = v16;
        _os_log_impl(&dword_1AF84D000, v15, OS_LOG_TYPE_ERROR, "No choices for event:%@ options:%@", (uint8_t *)&v22, 0x16u);

      }
    }
    goto LABEL_16;
  }
  v8 = objc_msgSend(v6, "hasChanges");
  if ((a4 & 8) != 0 && !v8)
  {
    v9 = 4;
    goto LABEL_17;
  }
  if ((objc_msgSend(v6, "isExternallyOrganizedInvitation") & 1) != 0)
    goto LABEL_9;
  objc_msgSend(v6, "singleRecurrenceRule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "recurrenceEndHasChanges");

  if ((v11 & 1) != 0)
    goto LABEL_9;
  objc_msgSend(v6, "calendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "source");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraints");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "prohibitsSlicingEventsWithAttendees"))
  {
    if ((objc_msgSend(v6, "hasAttendees") & 1) != 0)
    {

LABEL_9:
      v12 = 1;
      goto LABEL_10;
    }
    v21 = objc_msgSend(v6, "_hadAttendees");

    if ((v21 & 1) != 0)
      goto LABEL_9;
  }
  else
  {

  }
  v12 = 0;
LABEL_10:
  if (!objc_msgSend(v6, "canWeInferUpdateToComplexRecurrenceRule"))
    goto LABEL_13;
  if (v12)
    v9 = v7 | 4;
  else
    v9 = v7 | 2;
LABEL_17:

  return v9;
}

- (UIAlertController)alertController
{
  return (UIAlertController *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAlertController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end
