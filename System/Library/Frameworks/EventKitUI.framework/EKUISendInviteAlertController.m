@implementation EKUISendInviteAlertController

+ (id)newAlertControllerWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setCompletionHandler:", v3);

  objc_msgSend(v4, "setStrongSelf:", v4);
  return v4;
}

+ (id)presentInviteAlertWithOptions:(unint64_t)a3 viewController:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  void *v9;

  v8 = a4;
  v9 = (void *)objc_msgSend(a1, "newAlertControllerWithCompletionHandler:", a5);
  objc_msgSend(v9, "_presentAlertWithOptions:viewController:", a3, v8);

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[EKUISendInviteAlertController cancelAnimated:](self, "cancelAnimated:", 0);
  v3.receiver = self;
  v3.super_class = (Class)EKUISendInviteAlertController;
  -[EKUISendInviteAlertController dealloc](&v3, sel_dealloc);
}

- (BOOL)_useSheetForViewController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  char v8;

  v3 = a3;
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUICurrentHeightSizeClassIsCompact(v4))
    goto LABEL_4;
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v5))
  {

LABEL_4:
    v6 = 1;
    goto LABEL_5;
  }
  v6 = 1;
  v8 = objc_msgSend(v3, "_isInContextOfPresentationControllerOfClass:effective:", objc_opt_class(), 1);

  if ((v8 & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v3, "_popoverController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 != 0;
LABEL_5:

LABEL_6:
  return v6;
}

- (id)alertIconImage
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v2 = objc_alloc(MEMORY[0x1E0D3A820]);
  v3 = (void *)objc_msgSend(v2, "initWithBundleIdentifier:", *MEMORY[0x1E0D0C468]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", 100.0, 100.0, v6);
  objc_msgSend(v3, "imageForDescriptor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "placeholder"))
  {
    objc_msgSend(v3, "prepareImageForDescriptor:", v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", objc_msgSend(v8, "CGImage"));

  return v10;
}

- (void)_presentAlertWithOptions:(unint64_t)a3 viewController:(id)a4
{
  char v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  UIAlertController *v14;
  UIAlertController *alertController;
  void *v16;
  UIAlertController *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  UIAlertController *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UIAlertController *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id buf[2];

  v4 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = -[EKUISendInviteAlertController _useSheetForViewController:](self, "_useSheetForViewController:", v6) ^ 1;
    if ((v4 & 0x10) != 0)
    {
      EventKitUIBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("Send invitations to all attendees?");
    }
    else if ((v4 & 8) != 0)
    {
      EventKitUIBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("Propose new time?");
    }
    else
    {
      if ((v4 & 4) != 0)
      {
        EventKitUIBundle();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Time was changed"), &stru_1E601DFA8, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        EventKitUIBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Notify all invitees?"), &stru_1E601DFA8, 0);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      EventKitUIBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if ((v4 & 2) != 0)
      {
        if ((v4 & 1) != 0)
          v10 = CFSTR("You have removed an invitee");
        else
          v10 = CFSTR("You have removed invitees");
      }
      else if ((v4 & 1) != 0)
      {
        v10 = CFSTR("You have pending invitees");
      }
      else
      {
        v10 = CFSTR("You have a pending invite");
      }
    }
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E601DFA8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
LABEL_13:

    v34 = (void *)v13;
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v12, v13, v7);
    v14 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
    alertController = self->_alertController;
    self->_alertController = v14;

    -[EKUISendInviteAlertController alertIconImage](self, "alertIconImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController setImage:](self->_alertController, "setImage:", v16);

    objc_initWeak(buf, self);
    v17 = self->_alertController;
    v18 = (void *)MEMORY[0x1E0DC3448];
    EventKitUIBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Send"), &stru_1E601DFA8, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __73__EKUISendInviteAlertController__presentAlertWithOptions_viewController___block_invoke;
    v39[3] = &unk_1E601A1D0;
    objc_copyWeak(&v40, buf);
    objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 0, v39);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController addAction:](v17, "addAction:", v22);

    if ((v4 & 0x10) == 0)
    {
      v23 = self->_alertController;
      v24 = (void *)MEMORY[0x1E0DC3448];
      EventKitUIBundle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Discard Changes"), &stru_1E601DFA8, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v21;
      v37[1] = 3221225472;
      v37[2] = __73__EKUISendInviteAlertController__presentAlertWithOptions_viewController___block_invoke_2;
      v37[3] = &unk_1E601A1D0;
      objc_copyWeak(&v38, buf);
      objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 2, v37);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAlertController addAction:](v23, "addAction:", v27);

      objc_destroyWeak(&v38);
    }
    v28 = self->_alertController;
    v29 = (void *)MEMORY[0x1E0DC3448];
    EventKitUIBundle();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Cancel - send invite alert controller"), CFSTR("Cancel"), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v21;
    v35[1] = 3221225472;
    v35[2] = __73__EKUISendInviteAlertController__presentAlertWithOptions_viewController___block_invoke_3;
    v35[3] = &unk_1E601A1D0;
    objc_copyWeak(&v36, buf);
    objc_msgSend(v29, "actionWithTitle:style:handler:", v31, 1, v35);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController addAction:](v28, "addAction:", v32);

    objc_msgSend(v6, "presentViewController:animated:completion:", self->_alertController, 1, 0);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v40);
    objc_destroyWeak(buf);

    goto LABEL_16;
  }
  v11 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_ERROR, "Presenting a alert requires a view controller.", (uint8_t *)buf, 2u);
  }
LABEL_16:

}

void __73__EKUISendInviteAlertController__presentAlertWithOptions_viewController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 0);

}

void __73__EKUISendInviteAlertController__presentAlertWithOptions_viewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 1);

}

void __73__EKUISendInviteAlertController__presentAlertWithOptions_viewController___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithSelection:", 2);

}

- (void)cancelAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((-[UIAlertController isBeingDismissed](self->_alertController, "isBeingDismissed") & 1) == 0)
    -[UIAlertController dismissViewControllerAnimated:completion:](self->_alertController, "dismissViewControllerAnimated:completion:", v3, 0);
}

- (void)_completeWithSelection:(int)a3
{
  void (**completionHandler)(id, _QWORD);

  completionHandler = (void (**)(id, _QWORD))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, *(_QWORD *)&a3);
  -[EKUISendInviteAlertController _cleanup](self, "_cleanup", *(_QWORD *)&a3);
}

- (void)_cleanup
{
  id completionHandler;
  UIAlertController *alertController;

  -[EKUISendInviteAlertController setStrongSelf:](self, "setStrongSelf:", 0);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  alertController = self->_alertController;
  self->_alertController = 0;

}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (UIAlertController)alertController
{
  return (UIAlertController *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAlertController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (EKUISendInviteAlertController)strongSelf
{
  return (EKUISendInviteAlertController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStrongSelf:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
