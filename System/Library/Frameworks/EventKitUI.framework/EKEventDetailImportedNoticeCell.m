@implementation EKEventDetailImportedNoticeCell

- (EKEventDetailImportedNoticeCell)initWithEvent:(id)a3 editable:(BOOL)a4
{
  EKEventDetailImportedNoticeCell *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)EKEventDetailImportedNoticeCell;
  v4 = -[EKEventDetailCell initWithEvent:editable:style:](&v15, sel_initWithEvent_editable_style_, a3, a4, 0);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailImportedNoticeCell textLabel](v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v5);

    v7 = objc_alloc(MEMORY[0x1E0CB3778]);
    EventKitUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("This event was imported (read-only)"), &stru_1E601DFA8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithString:", v9);

    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v5, 0, objc_msgSend(v10, "length"));
    v11 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAttribute:value:range:", v11, v12, 0, objc_msgSend(v10, "length"));

    -[EKEventDetailImportedNoticeCell textLabel](v4, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAttributedText:", v10);

  }
  return v4;
}

- (BOOL)update
{
  void *v2;
  char v3;

  -[EKEventDetailCell event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditable") ^ 1;

  return v3;
}

@end
