@implementation EKEventEditViewControllerOOPWrapperImpl

- (EKEventEditViewControllerOOPWrapperImpl)init
{
  return -[EKEventEditViewControllerOOPWrapperImpl initWithViewID:](self, "initWithViewID:", CFSTR("ROOT_OOP_VIEW"));
}

- (EKEventEditViewControllerOOPWrapperImpl)initWithViewID:(id)a3
{
  id v5;
  EKEventEditViewControllerOOPWrapperImpl *v6;
  EKEventEditViewControllerOOPWrapperImpl *v7;
  _TtC10EventKitUI32EKEventEditViewControllerOOPImpl *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKEventEditViewControllerOOPWrapperImpl;
  v6 = -[EKEventEditViewControllerOOPWrapperImpl init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewID, a3);
    v8 = objc_alloc_init(_TtC10EventKitUI32EKEventEditViewControllerOOPImpl);
    -[EKEventEditViewControllerOOPWrapperImpl setVc:](v7, "setVc:", v8);

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v48;
  _QWORD v49[6];

  v49[4] = *MEMORY[0x1E0C80C00];
  v48.receiver = self;
  v48.super_class = (Class)EKEventEditViewControllerOOPWrapperImpl;
  -[EKEventEditViewControllerOOPWrapperImpl viewDidLoad](&v48, sel_viewDidLoad);
  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditViewControllerOOPWrapperImpl addChildViewController:](self, "addChildViewController:", v3);

  -[EKEventEditViewControllerOOPWrapperImpl view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v6);

  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didMoveToParentViewController:", self);

  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v36 = (void *)MEMORY[0x1E0CB3718];
  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditViewControllerOOPWrapperImpl view](self, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v42;
  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditViewControllerOOPWrapperImpl view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v35;
  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditViewControllerOOPWrapperImpl view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v11;
  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditViewControllerOOPWrapperImpl view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "activateConstraints:", v18);

  v19 = objc_msgSend(MEMORY[0x1E0CAA078], "realAuthorizationStatusForEntityType:", 0);
  -[EKEventEditViewControllerOOPWrapperImpl event](self, "event");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "calendar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {

LABEL_10:
    return;
  }
  -[EKEventEditViewControllerOOPWrapperImpl event](self, "event");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isNew");

  if (v23 && v19 == 3)
  {
    -[EKEventEditViewControllerOOPWrapperImpl editViewDelegate](self, "editViewDelegate");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
      goto LABEL_8;
    v25 = (void *)v24;
    -[EKEventEditViewControllerOOPWrapperImpl editViewDelegate](self, "editViewDelegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_opt_respondsToSelector();

    if ((v27 & 1) == 0)
      goto LABEL_8;
    -[EKEventEditViewControllerOOPWrapperImpl editViewDelegate](self, "editViewDelegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEditViewControllerOOPWrapperImpl _ekEventEditViewController](self, "_ekEventEditViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "eventEditViewControllerDefaultCalendarForNewEvents:", v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
LABEL_8:
      -[EKEventEditViewControllerOOPWrapperImpl eventStore](self, "eventStore");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "defaultCalendarForNewEvents");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[EKEventEditViewControllerOOPWrapperImpl setDefaultCalendar:](self, "setDefaultCalendar:", v20);
    goto LABEL_10;
  }
}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setEditViewDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEditViewDelegate:", v4);

}

- (EKEventEditViewDelegate)editViewDelegate
{
  void *v2;
  void *v3;

  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editViewDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKEventEditViewDelegate *)v3;
}

- (void)setEventStore:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEventStore:", v4);

}

- (EKEventStore)eventStore
{
  void *v2;
  void *v3;

  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKEventStore *)v3;
}

- (void)setEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEvent:", v4);

}

- (EKEvent)event
{
  void *v2;
  void *v3;

  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKEvent *)v3;
}

- (void)cancelEditing
{
  id v2;

  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelEditing");

}

- (void)setDefaultCalendar:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDefaultCalendar:", v4);

}

- (void)setEditorBackgroundColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEditorBackgroundColor:", v4);

}

- (UIColor)editorBackgroundColor
{
  void *v2;
  void *v3;

  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editorBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (BOOL)hasUnsavedChanges
{
  void *v2;
  char v3;

  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasUnsavedChanges");

  return v3;
}

- (void)focusAndSelectTitle
{
  id v2;

  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusAndSelectTitle");

}

- (void)focusAndSelectStartDate
{
  id v2;

  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusAndSelectStartDate");

}

- (void)focusTitle
{
  id v2;

  -[EKEventEditViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusTitle");

}

- (id)precommitSerializedEvent
{
  return 0;
}

- (BOOL)shouldRecordPrecommitEvent
{
  return 0;
}

- (id)_eventEditorForTestingOnly
{
  return 0;
}

- (BOOL)willPresentDialogOnSave
{
  return 0;
}

- (id)confirmDismissAlertController
{
  return 0;
}

- (unint64_t)eventCreationMethod
{
  return self->eventCreationMethod;
}

- (void)setEventCreationMethod:(unint64_t)a3
{
  self->eventCreationMethod = a3;
}

- (BOOL)ignoreUnsavedChanges
{
  return self->ignoreUnsavedChanges;
}

- (void)setIgnoreUnsavedChanges:(BOOL)a3
{
  self->ignoreUnsavedChanges = a3;
}

- (NSString)suggestionKey
{
  return self->suggestionKey;
}

- (void)setSuggestionKey:(id)a3
{
  objc_storeStrong((id *)&self->suggestionKey, a3);
}

- (BOOL)timeImplicitlySet
{
  return self->timeImplicitlySet;
}

- (void)setTimeImplicitlySet:(BOOL)a3
{
  self->timeImplicitlySet = a3;
}

- (_TtC10EventKitUI32EKEventEditViewControllerOOPImpl)vc
{
  return self->_vc;
}

- (void)setVc:(id)a3
{
  objc_storeStrong((id *)&self->_vc, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vc, 0);
  objc_storeStrong(&self->precommitSerializedEvent, 0);
  objc_storeStrong((id *)&self->suggestionKey, 0);
  objc_storeStrong((id *)&self->_viewID, 0);
}

@end
