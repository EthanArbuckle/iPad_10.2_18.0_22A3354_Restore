@implementation EKEventAttendeesEditViewController

- (EKEventAttendeesEditViewController)initWithFrame:(CGRect)a3 event:(id)a4 overriddenEventStartDate:(id)a5 overriddenEventEndDate:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  id v16;
  EKEventAttendeesEditViewController *v17;
  EKEventAttendeesEditViewController *v18;
  EKEventAttendeePicker *v19;
  EKEventAttendeePicker *picker;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v28.receiver = self;
  v28.super_class = (Class)EKEventAttendeesEditViewController;
  v17 = -[EKEditItemViewController initWithFrame:](&v28, sel_initWithFrame_, x, y, width, height);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_event, a4);
    v19 = -[EKEventAttendeePicker initWithFrame:event:calendar:overriddenEventStartDate:overriddenEventEndDate:]([EKEventAttendeePicker alloc], "initWithFrame:event:calendar:overriddenEventStartDate:overriddenEventEndDate:", v14, 0, v15, v16, x, y, width, height);
    picker = v18->_picker;
    v18->_picker = v19;

    if (!-[EKEventAttendeesEditViewController disableShowingButtons](v18, "disableShowingButtons"))
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v18, sel__cancelTapped_);
      -[EKEventAttendeesEditViewController navigationItem](v18, "navigationItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setLeftBarButtonItem:", v21);

      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v18, sel__doneTapped_);
      -[EKEventAttendeesEditViewController navigationItem](v18, "navigationItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setRightBarButtonItem:", v23);

    }
    -[EKEventAttendeesEditViewController addChildViewController:](v18, "addChildViewController:", v18->_picker);
    -[EKEventAttendeePicker didMoveToParentViewController:](v18->_picker, "didMoveToParentViewController:", v18);
    EventKitUIBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Title - Add Invitees"), CFSTR("Add Invitees"), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventAttendeesEditViewController setTitle:](v18, "setTitle:", v26);

  }
  return v18;
}

- (void)setSearchAccountID:(id)a3
{
  -[EKEventAttendeePicker setSearchAccountID:](self->_picker, "setSearchAccountID:", a3);
}

- (BOOL)prefersToBePresentedFromUINavigationController
{
  return 1;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)_cancelTapped:(id)a3
{
  self->_cancelTapped = 1;
  -[EKEditItemViewController cancel](self, "cancel", a3);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  EKEditItemViewControllerDelegate **p_editDelegate;
  id WeakRetained;
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)EKEventAttendeesEditViewController;
  -[EKEditItemViewController viewDidLoad](&v16, sel_viewDidLoad);
  -[EKEventAttendeesEditViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventAttendeePicker view](self->_picker, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[EKEventAttendeePicker view](self->_picker, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[EKEventAttendeePicker view](self->_picker, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("pickerView"), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3718];
  v9 = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[pickerView]|"), 0, MEMORY[0x1E0C9AA70], v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activateConstraints:", v10);

  v11 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[pickerView]|"), 0, v9, v7);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activateConstraints:", v12);

  p_editDelegate = &self->super._editDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_editDelegate);
  LOBYTE(v12) = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v15 = objc_loadWeakRetained((id *)p_editDelegate);
    objc_msgSend(v15, "editItemViewControllerWantsKeyboardPinned:", 1);

  }
}

- (BOOL)isModalInPresentation
{
  return -[EKEventAttendeePicker hasChanges](self->_picker, "hasChanges");
}

- (BOOL)validateEmailWithString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("SELF MATCHES %@"), CFSTR("[A-Z0-9a-z._%+'-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "evaluateWithObject:", v4);

  return v6;
}

- (id)_firstInvalidRecipientAddress
{
  EKEventAttendeesEditViewController *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  EKEventAttendeesEditViewController *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v2 = self;
  v27 = *MEMORY[0x1E0C80C00];
  -[EKEventAttendeePicker recipients](self->_picker, "recipients");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    v7 = 0x1EEE5D000uLL;
    while (2)
    {
      v8 = 0;
      v21 = v5;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        if (objc_msgSend(v9, "kind"))
        {
          v10 = 0;
        }
        else
        {
          objc_msgSend(v9, "uncommentedAddress");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = !-[EKEventAttendeesEditViewController validateEmailWithString:](v2, "validateEmailWithString:", v11);

        }
        if (objc_msgSend(v9, "kind") == 1)
        {
          objc_msgSend(*(id *)((char *)&v2->super.super.super.super.isa + *(int *)(v7 + 2828)), "calendar");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "constraints");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "supportsPhoneNumbers"))
          {
            objc_msgSend(v9, "normalizedAddress");
            v14 = v6;
            v15 = v2;
            v16 = v3;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "cal_isPhoneNumber") ^ 1;

            v3 = v16;
            v2 = v15;
            v6 = v14;
            v7 = 0x1EEE5D000;
          }
          else
          {
            v18 = 1;
          }

          v5 = v21;
        }
        else
        {
          v18 = 0;
        }
        if ((v10 | v18) == 1)
        {
          objc_msgSend(v9, "uncommentedAddress");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_20;
        }
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v5)
        continue;
      break;
    }
  }
  v19 = 0;
LABEL_20:

  return v19;
}

- (void)validateAllowingAlert:(BOOL)a3 callback:(id)a4
{
  _BOOL4 v4;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void (*v41)(_QWORD *, uint64_t, uint64_t);
  _QWORD *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  _QWORD *v48;
  BOOL v49;
  _QWORD v50[4];
  id v51;
  BOOL v52;

  v4 = a3;
  v6 = a4;
  -[EKEventAttendeePicker commitRemainingText](self->_picker, "commitRemainingText");
  -[EKEventAttendeesEditViewController _firstInvalidRecipientAddress](self, "_firstInvalidRecipientAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent calendar](self->_event, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "maxAttendees");

  if (v9 < 1)
  {
    if (!v7)
      goto LABEL_10;
  }
  else
  {
    -[EKEventAttendeePicker recipients](self->_picker, "recipients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v7)
    {
      if (v11 + 1 > (unint64_t)v9)
      {
        if (v4)
        {
          v44 = (void *)MEMORY[0x1E0DC3450];
          EventKitUIBundle();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("Too Many Invitees"), &stru_1E601DFA8, 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)MEMORY[0x1E0CB3940];
          EventKitUIBundle();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("This event has %ld invitees but this account only supports %ld invitees. The server will not accept events with too many invitees. Do you want to continue editing the invitees or attempt to save the event anyway?"), &stru_1E601DFA8, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKEventAttendeePicker recipients](self->_picker, "recipients");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count") + 1;
          -[EKEvent calendar](self->_event, "calendar");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localizedStringWithFormat:", v13, v15, objc_msgSend(v16, "maxAttendees"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "alertControllerWithTitle:message:preferredStyle:", v43, v17, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = (void *)MEMORY[0x1E0DC3448];
          EventKitUIBundle();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Edit"), &stru_1E601DFA8, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v50[0] = MEMORY[0x1E0C809B0];
          v50[1] = 3221225472;
          v50[2] = __69__EKEventAttendeesEditViewController_validateAllowingAlert_callback___block_invoke;
          v50[3] = &unk_1E601A118;
          v22 = v6;
          v51 = v22;
          v52 = v4;
          objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 1, v50);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addAction:", v23);

          v24 = (void *)MEMORY[0x1E0DC3448];
          EventKitUIBundle();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Continue"), &stru_1E601DFA8, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v47[0] = MEMORY[0x1E0C809B0];
          v47[1] = 3221225472;
          v47[2] = __69__EKEventAttendeesEditViewController_validateAllowingAlert_callback___block_invoke_2;
          v47[3] = &unk_1E601A118;
          v48 = v22;
          v49 = v4;
          objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 0, v47);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addAction:", v27);

          -[EKEventAttendeesEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);
          goto LABEL_12;
        }
        v41 = (void (*)(_QWORD *, uint64_t, uint64_t))v6[2];
        v42 = v6;
        v40 = 1;
LABEL_11:
        v41(v42, v40, 1);
        goto LABEL_12;
      }
LABEL_10:
      v40 = !v4;
      v41 = (void (*)(_QWORD *, uint64_t, uint64_t))v6[2];
      v42 = v6;
      goto LABEL_11;
    }
  }
  if (v4)
  {
    v28 = (void *)MEMORY[0x1E0DC3450];
    EventKitUIBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Cannot Send Invitation"), &stru_1E601DFA8, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("“%@” does not appear to be a valid email address."), &stru_1E601DFA8, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringWithFormat:", v33, v7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "alertControllerWithTitle:message:preferredStyle:", v30, v34, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)MEMORY[0x1E0DC3448];
    EventKitUIBundle();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E601DFA8, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "actionWithTitle:style:handler:", v38, 1, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addAction:", v39);

    -[EKEventAttendeesEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v35, 1, 0);
  }
  ((void (*)(_QWORD *, BOOL, _QWORD))v6[2])(v6, !v4, 0);
LABEL_12:

}

uint64_t __69__EKEventAttendeesEditViewController_validateAllowingAlert_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) == 0, 0);
}

uint64_t __69__EKEventAttendeesEditViewController_validateAllowingAlert_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) == 0, 1);
}

- (id)_attendeeFromRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v4 = a3;
  objc_getAssociatedObject(v4, &kEKUI_CNComposeReciepentParticipantKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[EKEventAttendeesEditViewController _createAttendeeFromRecipient:](self, "_createAttendeeFromRecipient:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  -[EKEvent calendar](self->_event, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ownerIdentityAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 || !v7)
  {

    goto LABEL_9;
  }
  objc_msgSend(v5, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "CDVIsEqualToURL:", v7);

  if ((v11 & 1) == 0)
  {
LABEL_9:
    v12 = v5;
    goto LABEL_10;
  }
  v12 = 0;
LABEL_10:

  return v12;
}

- (id)_createAttendeeFromRecipient:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "displayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
    objc_msgSend(v3, "displayString");
  else
    objc_msgSend(v3, "compositeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "kind") == 4)
  {
    v7 = (void *)MEMORY[0x1E0CA9FD0];
    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v3, "normalizedAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attendeeWithName:url:", v6, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "kind"))
    {
      v14 = (void *)MEMORY[0x1E0CA9FD0];
      objc_msgSend(v3, "address");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "attendeeWithName:emailAddress:", v6, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (objc_msgSend(v3, "kind") != 1)
    {
      v13 = 0;
      goto LABEL_12;
    }
    v12 = (void *)MEMORY[0x1E0CA9FD0];
    IdentityNameFromRecipient(v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "normalizedAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attendeeWithName:phoneNumber:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v11;

LABEL_11:
LABEL_12:

  return v13;
}

- (id)_recipientFromAttendee:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    -[EKEventAttendeesEditViewController _createRecipientFromAttendee:](self, "_createRecipientFromAttendee:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v5, &kEKUI_CNComposeReciepentParticipantKey, v4, (void *)0x301);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_createRecipientFromAttendee:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v21;
  int v22;
  id v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;

  v3 = a3;
  objc_msgSend(v3, "contactPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getCNComposeRecipientClass(), "descriptorsForRequiredKeysForContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unifiedContactsMatchingPredicate:keysToFetch:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc((Class)getCNComposeRecipientClass());
    objc_msgSend(v3, "emailAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v13 = v8;
    v14 = v11;
    v15 = 0;
LABEL_5:
    v18 = (void *)objc_msgSend(v12, "initWithContact:address:kind:", v13, v14, v15);
    goto LABEL_6;
  }
  objc_msgSend(v3, "phoneNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc((Class)getCNComposeRecipientClass());
    objc_msgSend(v3, "phoneNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v17;
    v13 = v8;
    v14 = v11;
    v15 = 1;
    goto LABEL_5;
  }
  objc_msgSend(v3, "URL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "cal_hasSchemeMailto");

  if (v22)
  {
    v23 = objc_alloc((Class)getCNComposeRecipientClass());
    objc_msgSend(v3, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resourceSpecifier");
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v28 = (void *)v24;
    v29 = v23;
    v30 = v8;
    v31 = v28;
    v32 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v3, "URL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "cal_hasSchemeTel");

  v23 = objc_alloc((Class)getCNComposeRecipientClass());
  objc_msgSend(v3, "URL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v27;
  if (!v26)
  {
    objc_msgSend(v27, "absoluteString");
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(v27, "resourceSpecifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v23;
  v30 = v8;
  v31 = v28;
  v32 = 1;
LABEL_15:
  v18 = (void *)objc_msgSend(v29, "initWithContact:address:kind:", v30, v31, v32);

LABEL_6:
  if (v8)
  {
    objc_msgSend(v8, "CalDisplayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDisplayString:", v19);

  }
  return v18;
}

- (NSArray)attendees
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[EKEventAttendeePicker recipients](self->_picker, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[EKEventAttendeesEditViewController _attendeeFromRecipient:](self, "_attendeeFromRecipient:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (void)setAttendees:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[EKEventAttendeesEditViewController _recipientFromAttendee:](self, "_recipientFromAttendee:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v5, "addObject:", v13);
          objc_msgSend(v6, "setObject:forKey:", v12, v13);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__EKEventAttendeesEditViewController_setAttendees___block_invoke;
  v15[3] = &unk_1E601A140;
  v16 = v6;
  v14 = v6;
  objc_msgSend(v5, "sortUsingComparator:", v15);
  -[EKEventAttendeePicker setRecipients:](self->_picker, "setRecipients:", v5);

}

uint64_t __51__EKEventAttendeesEditViewController_setAttendees___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "participantRole");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "participantRole");

  if (v8 != 2 || v10 == 2)
  {
    if (v8 != 2 && v10 == 2)
    {
      v15 = -1;
    }
    else
    {
      objc_msgSend(v5, "address");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "address");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "compare:", v14);

    }
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (BOOL)presentModally
{
  return 1;
}

- (BOOL)editItemShouldBeAskedForInjectableViewController
{
  BOOL v2;
  void *v3;

  if (self->_cancelTapped)
    return 0;
  -[EKEventAttendeePicker recipients](self->_picker, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "count") != 0;

  return v2;
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (BOOL)disableShowingButtons
{
  return self->_disableShowingButtons;
}

- (void)setDisableShowingButtons:(BOOL)a3
{
  self->_disableShowingButtons = a3;
}

- (BOOL)appendOnly
{
  return self->_appendOnly;
}

- (void)setAppendOnly:(BOOL)a3
{
  self->_appendOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_picker, 0);
}

@end
