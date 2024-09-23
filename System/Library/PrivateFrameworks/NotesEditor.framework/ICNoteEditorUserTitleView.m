@implementation ICNoteEditorUserTitleView

+ (BOOL)shouldShowUserTitleViewForNote:(id)a3
{
  id v3;
  char v4;
  void *v5;
  BOOL v6;
  int v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "isSharedAndEmpty");
  if (v3)
  {
    objc_msgSend(v3, "titleSourceAttachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "attachmentType") == 10)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v3, "titleSourceAttachment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "attachmentType") != 13;

    }
    objc_msgSend(v3, "titleSourceAttachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = 1;
    if (v9 && !v6)
      v7 = objc_msgSend(v3, "isEditable") ^ 1;

  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v4 | v7 ^ 1;
}

+ (id)noteKeyPathsAffectingUserTitleView
{
  return &unk_1EA821F00;
}

- (ICNoteEditorUserTitleView)initWithCoder:(id)a3
{
  ICNoteEditorUserTitleView *v3;
  ICNoteEditorUserTitleView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNoteEditorUserTitleView;
  v3 = -[ICNoteEditorUserTitleView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[ICNoteEditorUserTitleView commonInit](v3, "commonInit");
  return v4;
}

- (ICNoteEditorUserTitleView)initWithFrame:(CGRect)a3
{
  ICNoteEditorUserTitleView *v3;
  ICNoteEditorUserTitleView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNoteEditorUserTitleView;
  v3 = -[ICNoteEditorUserTitleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ICNoteEditorUserTitleView commonInit](v3, "commonInit");
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ICNote ic_removeObserver:forKeyPath:context:](self->_note, "ic_removeObserver:forKeyPath:context:", self, CFSTR("title"), &compoundliteral_3);
  -[ICNote ic_removeObserver:forKeyPath:context:](self->_note, "ic_removeObserver:forKeyPath:context:", self, CFSTR("titleSourceAttachment"), &compoundliteral_3);
  -[ICNote ic_removeObserver:forKeyPath:context:](self->_note, "ic_removeObserver:forKeyPath:context:", self, CFSTR("folder"), &compoundliteral_3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICNoteEditorUserTitleView;
  -[ICNoteEditorUserTitleView dealloc](&v4, sel_dealloc);
}

- (void)awakeFromNib
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ICNoteEditorUserTitleView;
  -[ICNoteEditorUserTitleView awakeFromNib](&v16, sel_awakeFromNib);
  v3 = ICAccessibilityAccessibilityLargerTextSizesEnabled() ^ 1;
  -[ICNoteEditorUserTitleView label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", v3);

  -[ICNoteEditorUserTitleView updateFonts](self, "updateFonts");
  -[ICNoteEditorUserTitleView label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "ic_fontHasSingleLineA");

  if ((v7 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[self.label.font ic_fontHasSingleLineA]", "-[ICNoteEditorUserTitleView awakeFromNib]", 1, 0, CFSTR("font should have a single-line a attribute"));
  objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorSecondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorUserTitleView label](self, "label");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "setTextColor:", v8);

  -[ICNoteEditorUserTitleView label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 1);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_noteWillBeDeleted_, *MEMORY[0x1E0D63808], 0);

  -[ICNoteEditorUserTitleView note](self, "note");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v12, "isSharedAndEmpty");

  if ((v9 & 1) == 0)
  {
    -[ICNoteEditorUserTitleView updateContentToCurrentNote](self, "updateContentToCurrentNote");
    -[ICNoteEditorUserTitleView editButton](self, "editButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Edit"), &stru_1EA7E9860, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:forState:", v15, 0);

  }
}

- (void)updateConstraints
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICNoteEditorUserTitleView;
  -[ICNoteEditorUserTitleView updateConstraints](&v9, sel_updateConstraints);
  v3 = ICAccessibilityAccessibilityLargerTextSizesEnabled();
  v4 = (void *)MEMORY[0x1E0CB3718];
  if (v3)
  {
    -[ICNoteEditorUserTitleView defaultConstraints](self, "defaultConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

    v6 = (void *)MEMORY[0x1E0CB3718];
    -[ICNoteEditorUserTitleView alternateConstraintsForAXLargerTextSizes](self, "alternateConstraintsForAXLargerTextSizes");
  }
  else
  {
    -[ICNoteEditorUserTitleView alternateConstraintsForAXLargerTextSizes](self, "alternateConstraintsForAXLargerTextSizes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v7);

    v6 = (void *)MEMORY[0x1E0CB3718];
    -[ICNoteEditorUserTitleView defaultConstraints](self, "defaultConstraints");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activateConstraints:", v8);

}

- (double)preferredHeight
{
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  v3 = 0.0;
  if ((-[ICNoteEditorUserTitleView isHidden](self, "isHidden") & 1) == 0)
  {
    -[ICNoteEditorUserTitleView label](self, "label");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfLines");
    -[ICNoteEditorUserTitleView label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 == 1)
    {
      objc_msgSend(v6, "font");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lineHeight");
      *(float *)&v9 = v9;
      v10 = ceilf(*(float *)&v9);

    }
    else
    {
      objc_msgSend(v6, "intrinsicContentSize");
      v10 = v11;
    }

    v3 = v10 + 12.0;
    if (ICAccessibilityAccessibilityLargerTextSizesEnabled())
    {
      -[ICNoteEditorUserTitleView editButton](self, "editButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "intrinsicContentSize");
      v3 = v3 + v13;

    }
  }
  return v3;
}

- (void)setNote:(id)a3
{
  ICNote *v5;
  ICNote **p_note;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (ICNote *)a3;
  p_note = &self->_note;
  if (self->_note != v5)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend((id)objc_opt_class(), "noteKeyPathsAffectingUserTitleView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          -[ICNote ic_removeObserver:forKeyPath:context:](*p_note, "ic_removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11++), &compoundliteral_3);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->_note, a3);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend((id)objc_opt_class(), "noteKeyPathsAffectingUserTitleView", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          -[ICNote ic_addObserver:forKeyPath:context:](*p_note, "ic_addObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), &compoundliteral_3);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

    -[ICNoteEditorUserTitleView updateContentToCurrentNote](self, "updateContentToCurrentNote");
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  objc_super v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  if ((-[ICNoteEditorUserTitleView ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/Editor/ICNoteEditorUserTitleView.m") & 1) != 0)
  {
    v13 = -[ICNoteEditorUserTitleView ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v10, v11, v12);

    if (a6 == &compoundliteral_3 && (v13 & 1) == 0)
      -[ICNoteEditorUserTitleView updateContentToCurrentNote](self, "updateContentToCurrentNote");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICNoteEditorUserTitleView;
    -[ICNoteEditorUserTitleView observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v12, v11, v10, a6);

  }
}

- (void)noteWillBeDeleted:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorUserTitleView note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[ICNoteEditorUserTitleView alertController](self, "alertController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[ICNoteEditorUserTitleView isHidden](self, "isHidden") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)ICNoteEditorUserTitleView;
    -[ICNoteEditorUserTitleView setHidden:](&v6, sel_setHidden_, v3);
    -[ICNoteEditorUserTitleView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userTitleHiddenStateDidChange:", self);

  }
}

- (void)updateContentToCurrentNote
{
  void *v3;
  char v4;
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
  id v17;

  -[ICNoteEditorUserTitleView note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSharedAndEmpty");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_opt_class();
    -[ICNoteEditorUserTitleView note](self, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorUserTitleView setHidden:](self, "setHidden:", objc_msgSend(v5, "shouldShowUserTitleViewForNote:", v6) ^ 1);

    if ((-[ICNoteEditorUserTitleView isHidden](self, "isHidden") & 1) == 0)
    {
      -[ICNoteEditorUserTitleView note](self, "note");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "titleSourceAttachment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "userTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v9)
      {
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Note Title: %@"), &stru_1EA7E9860, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringWithFormat:", v13, v9);
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Suggested Title: %@"), &stru_1EA7E9860, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorUserTitleView note](self, "note");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringWithFormat:", v13, v15);
        v17 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[ICNoteEditorUserTitleView label](self, "label");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setText:", v17);

    }
  }
}

- (void)editButtonPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id location[2];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Note Title"), &stru_1EA7E9860, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNoteEditorUserTitleView note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleSourceAttachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_initWeak(location, self);
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, &stru_1EA7E9860, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v6;
    v32 = v4;
    objc_msgSend(v8, "note");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __47__ICNoteEditorUserTitleView_editButtonPressed___block_invoke;
    v37[3] = &unk_1EA7DF618;
    v12 = v8;
    v38 = v12;
    v13 = v11;
    v39 = v13;
    objc_copyWeak(&v40, location);
    objc_msgSend(v9, "addTextFieldWithConfigurationHandler:", v37);
    v14 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1EA7E9860, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 1, &__block_literal_global_13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v17);

    v18 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Done"), &stru_1EA7E9860, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __47__ICNoteEditorUserTitleView_editButtonPressed___block_invoke_3;
    v33[3] = &unk_1EA7DF660;
    v21 = v9;
    v34 = v21;
    v22 = v13;
    v35 = v22;
    v36 = v12;
    objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 0, v33);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAction:", v23);

    -[ICNoteEditorUserTitleView setAlertController:](self, "setAlertController:", v21);
    -[ICNoteEditorUserTitleView window](self, "window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rootViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "presentedViewController");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = (void *)v26;
    else
      v28 = v25;
    v29 = v28;

    objc_msgSend(v29, "presentViewController:animated:completion:", v21, 1, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "postNotificationName:object:", CFSTR("ICNoteEditorTitleEditingViewDidShowNotification"), 0);

    objc_destroyWeak(&v40);
    objc_destroyWeak(location);
    v6 = v31;
    v4 = v32;
  }

}

void __47__ICNoteEditorUserTitleView_editButtonPressed___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "setAutocapitalizationType:", 2);
  objc_msgSend(v7, "setClearButtonMode:", 3);
  objc_msgSend(*(id *)(a1 + 32), "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v7, "setPlaceholder:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlaceholder:", v5);

  }
  objc_msgSend(v7, "setText:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v7, "setDelegate:", WeakRetained);

}

void __47__ICNoteEditorUserTitleView_editButtonPressed___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "textFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEditable");

    if (v6)
    {
      if (objc_msgSend(v4, "length"))
        v7 = v4;
      else
        v7 = 0;
      objc_msgSend(*(id *)(a1 + 48), "setUserTitle:", v7);
      objc_msgSend(*(id *)(a1 + 48), "updateChangeCountWithReason:", CFSTR("Edited user title"));
      objc_msgSend(*(id *)(a1 + 48), "note");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "regenerateTitle:snippet:", 1, 1);

      if (v9)
      {
        objc_msgSend(*(id *)(a1 + 48), "note");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "markShareDirtyIfNeededWithReason:", CFSTR("Edited attachment user title"));

        objc_msgSend(*(id *)(a1 + 48), "note");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updateChangeCountWithReason:", CFSTR("Edited attachment user title"));

      }
      objc_msgSend(*(id *)(a1 + 48), "note");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateModificationDateAndChangeCountAndSaveImmediately");

    }
  }

}

- (void)textFieldDidBeginEditing:(id)a3
{
  objc_msgSend(a3, "selectAll:", 0);
}

+ (id)newUserTitleView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadNibNamed:owner:options:", v4, a1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v11;

    if (v12)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "result != ((void *)0)", "+[ICNoteEditorUserTitleView newUserTitleView]", 1, 0, CFSTR("Unable to load user title view"), (_QWORD)v14);
  v12 = 0;
LABEL_12:
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 1, (_QWORD)v14);

  return v12;
}

- (void)updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForDateText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorUserTitleView label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  -[ICNoteEditorUserTitleView label](self, "label");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorUserTitleView editButton](self, "editButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v5);

}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v8[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__ICNoteEditorUserTitleView_registerForTraitChanges__block_invoke;
  v5[3] = &unk_1EA7DE418;
  objc_copyWeak(&v6, &location);
  v4 = (id)-[ICNoteEditorUserTitleView registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __52__ICNoteEditorUserTitleView_registerForTraitChanges__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = ICAccessibilityAccessibilityLargerTextSizesEnabled() ^ 1;
    objc_msgSend(WeakRetained, "label");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNumberOfLines:", v1);

    objc_msgSend(WeakRetained, "updateFonts");
    objc_msgSend(WeakRetained, "setNeedsUpdateConstraints");
  }

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[ICNoteEditorUserTitleView label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Double tap to edit the title of this note."), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)accessibilityActivate
{
  -[ICNoteEditorUserTitleView editButtonPressed:](self, "editButtonPressed:", 0);
  return 1;
}

- (id)accessibilityContainer
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICNoteEditorUserTitleView;
  -[ICNoteEditorUserTitleView accessibilityContainer](&v7, sel_accessibilityContainer);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    while (!objc_msgSend(v4, "conformsToProtocol:", &unk_1F04A7230))
    {
      objc_msgSend(v4, "accessibilityContainer");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v5;
      if (!v5)
        goto LABEL_8;
    }
    v4 = v4;

    v3 = v4;
  }
  else
  {
    v4 = 0;
  }
LABEL_8:

  return v3;
}

- (void)accessibilityElementDidBecomeFocused
{
  id v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICNoteEditorUserTitleView;
  -[ICNoteEditorUserTitleView accessibilityElementDidBecomeFocused](&v5, sel_accessibilityElementDidBecomeFocused);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[ICNoteEditorUserTitleView nextResponder](self, "nextResponder");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v3, "nextResponder");
        v4 = objc_claimAutoreleasedReturnValue();

        v3 = (id)v4;
        if (!v4)
          goto LABEL_7;
      }
      v3 = v3;
    }
LABEL_7:
    objc_msgSend(v3, "showOverscrollContentAndScrollToTop");

  }
}

- (ICNoteEditorUserTitleViewDelegate)delegate
{
  return (ICNoteEditorUserTitleViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ICNote)note
{
  return self->_note;
}

- (UILabel)label
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_label);
}

- (void)setLabel:(id)a3
{
  objc_storeWeak((id *)&self->_label, a3);
}

- (UIButton)editButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_editButton);
}

- (void)setEditButton:(id)a3
{
  objc_storeWeak((id *)&self->_editButton, a3);
}

- (UIAlertController)alertController
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_alertController);
}

- (void)setAlertController:(id)a3
{
  objc_storeWeak((id *)&self->_alertController, a3);
}

- (NSArray)defaultConstraints
{
  return self->_defaultConstraints;
}

- (void)setDefaultConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_defaultConstraints, a3);
}

- (NSArray)alternateConstraintsForAXLargerTextSizes
{
  return self->_alternateConstraintsForAXLargerTextSizes;
}

- (void)setAlternateConstraintsForAXLargerTextSizes:(id)a3
{
  objc_storeStrong((id *)&self->_alternateConstraintsForAXLargerTextSizes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateConstraintsForAXLargerTextSizes, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);
  objc_destroyWeak((id *)&self->_alertController);
  objc_destroyWeak((id *)&self->_editButton);
  objc_destroyWeak((id *)&self->_label);
  objc_storeStrong((id *)&self->_note, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
