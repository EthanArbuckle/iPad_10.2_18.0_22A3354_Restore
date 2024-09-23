@implementation EKReminderUneditableButtonDetailCell

- (EKReminderUneditableButtonDetailCell)initWithEvent:(id)a3 uneditableButtonCellDelegate:(id)a4
{
  EKReminderUneditableButtonDetailCell *v6;
  EKReminderUneditableButtonDetailCell *v7;
  UILabel *v8;
  UILabel *line;
  void *v10;
  void *v11;
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
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  UIButton *button;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  id location;
  objc_super v72;
  void *v73;
  _QWORD v74[4];
  uint64_t v75;
  void *v76;
  _QWORD v77[5];

  v77[3] = *MEMORY[0x1E0C80C00];
  v65 = a3;
  v66 = a4;
  v72.receiver = self;
  v72.super_class = (Class)EKReminderUneditableButtonDetailCell;
  v6 = -[EKEventDetailCell initWithEvent:editable:](&v72, sel_initWithEvent_editable_, v65, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uneditableButtonCellDelegate, a4);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    line = v7->_line;
    v7->_line = v8;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_line, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v7->_line, "setNumberOfLines:", 0);
    v49 = *MEMORY[0x1E0DC4B10];
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:addingSymbolicTraits:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7->_line, "setFont:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7->_line, "setTextColor:", v11);

    EventKitUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("This is a future repeating reminder. You can only edit the current reminder."), &stru_1E601DFA8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v7->_line, "setText:", v13);

    -[EKReminderUneditableButtonDetailCell contentView](v7, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v7->_line);

    v52 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v7->_line, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKReminderUneditableButtonDetailCell contentView](v7, "contentView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "layoutMarginsGuide");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:constant:", v59, 6.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v57;
    -[UILabel trailingAnchor](v7->_line, "trailingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKReminderUneditableButtonDetailCell contentView](v7, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutMarginsGuide");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v17, -6.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v18;
    -[UILabel topAnchor](v7->_line, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKReminderUneditableButtonDetailCell contentView](v7, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, 16.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v77[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "activateConstraints:", v23);

    if (v7->_uneditableButtonCellDelegate)
    {
      objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      EventKitUIBundle();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Show Current Reminder"), &stru_1E601DFA8, 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v49);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc(MEMORY[0x1E0CB3498]);
      v75 = *MEMORY[0x1E0DC1138];
      v76 = v62;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v25, "initWithString:attributes:", v64, v26);
      objc_msgSend(v68, "setAttributedTitle:", v27);

      objc_msgSend(v68, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
      objc_initWeak(&location, v7);
      v28 = (void *)MEMORY[0x1E0DC3428];
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __83__EKReminderUneditableButtonDetailCell_initWithEvent_uneditableButtonCellDelegate___block_invoke;
      v69[3] = &unk_1E6019DA8;
      objc_copyWeak(&v70, &location);
      objc_msgSend(v28, "actionWithHandler:", v69);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v68);
      v29 = objc_claimAutoreleasedReturnValue();
      button = v7->_button;
      v7->_button = (UIButton *)v29;

      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v7->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[EKReminderUneditableButtonDetailCell contentView](v7, "contentView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addSubview:", v7->_button);

      v46 = (void *)MEMORY[0x1E0CB3718];
      -[UILabel bottomAnchor](v7->_line, "bottomAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton topAnchor](v7->_button, "topAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "constraintEqualToAnchor:constant:", v58, -10.0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v56;
      -[UIButton leadingAnchor](v7->_button, "leadingAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKReminderUneditableButtonDetailCell contentView](v7, "contentView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "layoutMarginsGuide");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "leadingAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, 6.0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v74[1] = v48;
      -[UIButton trailingAnchor](v7->_button, "trailingAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKReminderUneditableButtonDetailCell contentView](v7, "contentView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "layoutMarginsGuide");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "trailingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintLessThanOrEqualToAnchor:constant:", v34, -6.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v74[2] = v35;
      -[UIButton bottomAnchor](v7->_button, "bottomAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKReminderUneditableButtonDetailCell contentView](v7, "contentView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "bottomAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:constant:", v38, -16.0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v74[3] = v39;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 4);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "activateConstraints:", v40);

      objc_destroyWeak(&v70);
      objc_destroyWeak(&location);
    }
    else
    {
      v41 = (void *)MEMORY[0x1E0CB3718];
      -[UILabel bottomAnchor](v7->_line, "bottomAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKReminderUneditableButtonDetailCell contentView](v7, "contentView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "bottomAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "constraintEqualToAnchor:constant:", v62, -16.0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v42;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "activateConstraints:", v43);

    }
  }

  return v7;
}

void __83__EKReminderUneditableButtonDetailCell_initWithEvent_uneditableButtonCellDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 142);
    if (v3)
    {
      v4 = v2;
      objc_msgSend(v3, "uneditableButtonCellRequestedShowFirstUncompletedReminder:", v2);
      v2 = v4;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uneditableButtonCellDelegate, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_line, 0);
}

@end
