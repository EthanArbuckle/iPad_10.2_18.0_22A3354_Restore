@implementation CNVisualIdentityItemEditorSegmentedControl

- (CNVisualIdentityItemEditorSegmentedControl)initWithItems:(id)a3
{
  CNVisualIdentityItemEditorSegmentedControl *v3;
  CNVisualIdentityItemEditorSegmentedControl *v4;
  CNVisualIdentityItemEditorSegmentedControl *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNVisualIdentityItemEditorSegmentedControl;
  v3 = -[CNVisualIdentityItemEditorSegmentedControl initWithItems:](&v7, sel_initWithItems_, a3);
  v4 = v3;
  if (v3)
  {
    -[CNVisualIdentityItemEditorSegmentedControl setSelectedSegmentIndex:](v3, "setSelectedSegmentIndex:", 0);
    -[CNVisualIdentityItemEditorSegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = v4;
  }

  return v4;
}

- (BOOL)allowsTextInputForCurrentEditorType
{
  return -[CNVisualIdentityItemEditorSegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex") == 0;
}

- (void)setTextAndStyleMode
{
  -[CNVisualIdentityItemEditorSegmentedControl setStyleSegmentEnabled:](self, "setStyleSegmentEnabled:", 1);
  -[CNVisualIdentityItemEditorSegmentedControl setTextSegmentEnabled:](self, "setTextSegmentEnabled:", 1);
  -[CNVisualIdentityItemEditorSegmentedControl selectTextSegment](self, "selectTextSegment");
}

- (void)setStyleOnlyMode
{
  -[CNVisualIdentityItemEditorSegmentedControl setStyleSegmentEnabled:](self, "setStyleSegmentEnabled:", 1);
  -[CNVisualIdentityItemEditorSegmentedControl setTextSegmentEnabled:](self, "setTextSegmentEnabled:", 0);
  -[CNVisualIdentityItemEditorSegmentedControl selectStyleSegment](self, "selectStyleSegment");
}

- (void)setTextSegmentEnabled:(BOOL)a3
{
  -[CNVisualIdentityItemEditorSegmentedControl setEnabled:forSegmentAtIndex:](self, "setEnabled:forSegmentAtIndex:", a3, 0);
}

- (void)setStyleSegmentEnabled:(BOOL)a3
{
  -[CNVisualIdentityItemEditorSegmentedControl setEnabled:forSegmentAtIndex:](self, "setEnabled:forSegmentAtIndex:", a3, 1);
}

- (void)selectTextSegment
{
  -[CNVisualIdentityItemEditorSegmentedControl setSelectedSegmentIndex:](self, "setSelectedSegmentIndex:", 0);
}

- (void)selectStyleSegment
{
  -[CNVisualIdentityItemEditorSegmentedControl setSelectedSegmentIndex:](self, "setSelectedSegmentIndex:", 1);
}

+ (id)segmentedControlForItemType:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  CNVisualIdentityItemEditorSegmentedControl *v8;
  void *v9;
  void *v10;
  void *v11;
  CNVisualIdentityItemEditorSegmentedControl *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == 4)
    v6 = CFSTR("PHOTO_TEXT_STYLE_EDITOR_EMOJI_LABEL");
  else
    v6 = CFSTR("PHOTO_TEXT_STYLE_EDITOR_TEXT_LABEL");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [CNVisualIdentityItemEditorSegmentedControl alloc];
  v14[0] = v7;
  CNContactsUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PHOTO_TEXT_STYLE_EDITOR_STYLE_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CNVisualIdentityItemEditorSegmentedControl initWithItems:](v8, "initWithItems:", v11);

  return v12;
}

@end
