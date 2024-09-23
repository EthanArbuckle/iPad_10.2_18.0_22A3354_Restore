@implementation EKShowInRemindersDetailCell

- (EKShowInRemindersDetailCell)initWithEvent:(id)a3 editable:(BOOL)a4
{
  EKShowInRemindersDetailCell *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UIButton *button;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  id v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id location;
  objc_super v42;
  _QWORD v43[4];
  uint64_t v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)EKShowInRemindersDetailCell;
  v37 = a3;
  v4 = -[EKEventDetailCell initWithEvent:editable:](&v42, sel_initWithEvent_editable_);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    EventKitUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Show in Reminders"), &stru_1E601DFA8, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0CB3498]);
    v44 = *MEMORY[0x1E0DC1138];
    v45[0] = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithString:attributes:", v36, v7);
    objc_msgSend(v38, "setAttributedTitle:", v8);

    objc_msgSend(v38, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
    objc_initWeak(&location, v4);
    v9 = (void *)MEMORY[0x1E0DC3428];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __54__EKShowInRemindersDetailCell_initWithEvent_editable___block_invoke;
    v39[3] = &unk_1E6019DA8;
    objc_copyWeak(&v40, &location);
    objc_msgSend(v9, "actionWithHandler:", v39);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v38);
    v10 = objc_claimAutoreleasedReturnValue();
    button = v4->_button;
    v4->_button = (UIButton *)v10;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKShowInRemindersDetailCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v4->_button);

    v24 = (void *)MEMORY[0x1E0CB3718];
    -[UIButton leadingAnchor](v4->_button, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKShowInRemindersDetailCell contentView](v4, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layoutMarginsGuide");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, 6.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v30;
    -[UIButton trailingAnchor](v4->_button, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKShowInRemindersDetailCell contentView](v4, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layoutMarginsGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:constant:", v26, -6.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v25;
    -[UIButton topAnchor](v4->_button, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKShowInRemindersDetailCell contentView](v4, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, 15.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v16;
    -[UIButton bottomAnchor](v4->_button, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKShowInRemindersDetailCell contentView](v4, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:constant:", v19, -5.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v21);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);

  }
  return v4;
}

void __54__EKShowInRemindersDetailCell_initWithEvent_editable___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 136);
    if (v3)
    {
      v4 = (void *)MEMORY[0x1E0C99E98];
      v8 = v2;
      objc_msgSend(v3, "uniqueID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "URLWithString:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "openURL:configuration:completionHandler:", v6, 0, &__block_literal_global_50);

      v2 = v8;
    }
  }

}

void __54__EKShowInRemindersDetailCell_initWithEvent_editable___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (!v4)
  {
    v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_ERROR, "Failed to open URL when Open in Reminders tapped: %@", (uint8_t *)&v7, 0xCu);
    }
  }

}

- (void)setSeparatorStyle:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKShowInRemindersDetailCell;
  -[EKShowInRemindersDetailCell setSeparatorStyle:](&v3, sel_setSeparatorStyle_, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
