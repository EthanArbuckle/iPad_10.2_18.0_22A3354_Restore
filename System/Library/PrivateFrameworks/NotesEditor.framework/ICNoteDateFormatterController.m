@implementation ICNoteDateFormatterController

- (void)updateDate
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICNoteDateFormatterController updateDate]", 1, 0, CFSTR("Unexpected call from background thread"));
  v3 = -[ICNoteDateFormatterController shouldShowDateModified](self, "shouldShowDateModified");
  -[ICNoteDateFormatterController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v3)
    objc_msgSend(v4, "modificationDate");
  else
    objc_msgSend(v4, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteDateFormatterController setDate:](self, "setDate:", v5);

}

- (void)updateDateLabelAccessibilityHint
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  id argument;

  v3 = CFSTR("Double tap to show creation date.");
  if (-[ICNoteDateFormatterController didManuallyChangeDateType](self, "didManuallyChangeDateType")
    && !-[ICNoteDateFormatterController shouldShowDateModified](self, "shouldShowDateModified"))
  {
    v3 = CFSTR("Double tap to show last edited date.");
  }
  objc_opt_class();
  -[ICNoteDateFormatterController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  argument = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v3, &stru_1EA7E9860, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(argument, "setAccessibilityHint:", v6);

  if (objc_msgSend(argument, "accessibilityElementIsFocused"))
    UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], argument);

}

- (BOOL)showAlternateDateView
{
  return self->_showAlternateDateView;
}

- (BOOL)shouldShowDateModified
{
  void *v3;
  char v4;
  BOOL v6;

  -[ICNoteDateFormatterController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSharedReadOnly");

  if ((v4 & 1) != 0)
    return 1;
  v6 = -[ICNoteDateFormatterController currentSortType](self, "currentSortType") != 1;
  return -[ICNoteDateFormatterController showAlternateDateView](self, "showAlternateDateView") ^ v6;
}

- (NSDateFormatter)shortDateFormatter
{
  return self->_shortDateFormatter;
}

- (void)setUp
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  -[ICNoteDateFormatterController setDateFormatter:](self, "setDateFormatter:", v3);

  -[ICNoteDateFormatterController dateFormatter](self, "dateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDateStyle:", 3);

  -[ICNoteDateFormatterController dateFormatter](self, "dateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeStyle:", 1);

  v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  -[ICNoteDateFormatterController setShortDateFormatter:](self, "setShortDateFormatter:", v6);

  -[ICNoteDateFormatterController shortDateFormatter](self, "shortDateFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDateStyle:", 1);

  -[ICNoteDateFormatterController shortDateFormatter](self, "shortDateFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeStyle:", 1);

  -[ICNoteDateFormatterController setIconHidden:](self, "setIconHidden:", 1);
  -[ICNoteDateFormatterController setCurrentSortType:](self, "setCurrentSortType:", objc_msgSend(MEMORY[0x1E0D64230], "currentNoteListSortType"));
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_addObserver:forKeyPath:context:", self, *MEMORY[0x1E0D64120], compoundliteral_128);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_timeFormatChanged_, *MEMORY[0x1E0C99720], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_timeFormatChanged_, *MEMORY[0x1E0C99898], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D636E0];
  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_noteDecryptedStatusDidChange_, v13, v14);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0D636E8];
  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", self, sel_noteDecryptedStatusDidChange_, v16, v17);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObserver:selector:name:object:", self, sel_timeFormatChanged_, *MEMORY[0x1E0DC4838], 0);

}

- (void)setShowAlternateDateView:(BOOL)a3
{
  self->_showAlternateDateView = a3;
}

- (void)setShouldShowSharedNoteTitle:(BOOL)a3
{
  self->_shouldShowSharedNoteTitle = a3;
}

- (void)setShortDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_shortDateFormatter, a3);
}

- (void)setNote:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_note);

  v5 = obj;
  if (WeakRetained != obj)
  {
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICNoteDateFormatterController setNote:]", 1, 0, CFSTR("Unexpected call from background thread"));
    v6 = obj;
    if (obj)
    {
      objc_msgSend(obj, "managedObjectContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "concurrencyType");

      v6 = obj;
      if (v8 != 2)
      {
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!note || note.managedObjectContext.concurrencyType == NSMainQueueConcurrencyType", "-[ICNoteDateFormatterController setNote:]", 1, 0, CFSTR("Background note set on date formatter"));
        v6 = obj;
      }
    }
    -[ICNoteDateFormatterController setShouldShowSharedNoteTitle:](self, "setShouldShowSharedNoteTitle:", objc_msgSend(v6, "isSharedAndEmpty"));
    v9 = objc_loadWeakRetained((id *)&self->_note);
    objc_msgSend(v9, "ic_removeObserver:forKeyPath:context:", self, CFSTR("modificationDate"), compoundliteral_11);

    v10 = objc_storeWeak((id *)&self->_note, obj);
    objc_msgSend(obj, "ic_addObserver:forKeyPath:context:", self, CFSTR("modificationDate"), compoundliteral_11);

    -[ICNoteDateFormatterController setDidManuallyChangeDateType:](self, "setDidManuallyChangeDateType:", 0);
    -[ICNoteDateFormatterController setShowAlternateDateView:](self, "setShowAlternateDateView:", 0);
    if (obj)
    {
      v11 = objc_loadWeakRetained((id *)&self->_note);
      -[ICNoteDateFormatterController setIconHidden:](self, "setIconHidden:", objc_msgSend(v11, "isPasswordProtected") ^ 1);

    }
    else
    {
      -[ICNoteDateFormatterController setIconHidden:](self, "setIconHidden:", 1);
    }
    -[ICNoteDateFormatterController updateDate](self, "updateDate");
    v5 = obj;
  }

}

- (void)setIconHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  self->_iconHidden = a3;
  if (!a3)
    -[ICNoteDateFormatterController updateLockIcon](self, "updateLockIcon");
  -[ICNoteDateFormatterController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formatter:iconHiddenDidChange:", self, v3);

}

- (void)setDidManuallyChangeDateType:(BOOL)a3
{
  self->_didManuallyChangeDateType = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (void)setDate:(id)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  id v20;

  v5 = (unint64_t)a3;
  if (v5 | (unint64_t)self->_date)
  {
    v20 = (id)v5;
    objc_storeStrong((id *)&self->_date, a3);
    -[ICNoteDateFormatterController dateFormatter](self, "dateFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteDateFormatterController dateStringForDate:dateFormatter:](self, "dateStringForDate:dateFormatter:", v20, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length"))
    {
      -[ICNoteDateFormatterController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[ICNoteDateFormatterController delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_opt_respondsToSelector();

        if ((v10 & 1) == 0)
          goto LABEL_9;
        -[ICNoteDateFormatterController delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dateViewAttributes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sizeWithAttributes:", v12);
        v14 = v13;

        -[ICNoteDateFormatterController delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dateViewMaximumWidth");
        v17 = v16;

        if (v17 == 0.0 || v14 < v17)
          goto LABEL_9;
        -[ICNoteDateFormatterController shortDateFormatter](self, "shortDateFormatter");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteDateFormatterController dateStringForDate:dateFormatter:](self, "dateStringForDate:dateFormatter:", v20, v8);
        v18 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v18;
      }

    }
LABEL_9:
    -[ICNoteDateFormatterController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "formatter:textDidChange:", self, v7);

    -[ICNoteDateFormatterController updateDateLabelAccessibilityHint](self, "updateDateLabelAccessibilityHint");
    v5 = (unint64_t)v20;
  }

}

- (void)setCurrentSortType:(int64_t)a3
{
  if (self->_currentSortType != a3)
  {
    self->_currentSortType = a3;
    -[ICNoteDateFormatterController setShowAlternateDateView:](self, "setShowAlternateDateView:", 0);
    -[ICNoteDateFormatterController setDidManuallyChangeDateType:](self, "setDidManuallyChangeDateType:", 0);
    -[ICNoteDateFormatterController updateDate](self, "updateDate");
  }
}

- (ICNote)note
{
  return (ICNote *)objc_loadWeakRetained((id *)&self->_note);
}

- (ICNoteDateFormatterController)init
{
  ICNoteDateFormatterController *v2;
  ICNoteDateFormatterController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICNoteDateFormatterController;
  v2 = -[ICNoteDateFormatterController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ICNoteDateFormatterController setUp](v2, "setUp");
  return v3;
}

- (BOOL)didManuallyChangeDateType
{
  return self->_didManuallyChangeDateType;
}

- (ICNoteDateFormatterControllerDelegate)delegate
{
  return (ICNoteDateFormatterControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)dateStringForDate:(id)a3 dateFormatter:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  if (!-[ICNoteDateFormatterController didManuallyChangeDateType](self, "didManuallyChangeDateType"))
  {
    -[ICNoteDateFormatterController note](self, "note");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isSharedReadOnly");

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("%@ — View Only");
    }
    else
    {
      -[ICNoteDateFormatterController note](self, "note");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isSharedViaICloud");

      if (!v22)
      {
        objc_msgSend(v7, "stringFromDate:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      if (-[ICNoteDateFormatterController shouldShowSharedNoteTitle](self, "shouldShowSharedNoteTitle"))
      {
        -[ICNoteDateFormatterController note](self, "note");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "folder");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "shareDescription");
        v25 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v15 = (void *)v25;

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("%@ — Shared");
    }
    objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_1EA7E9860, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "stringFromDate:", v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringWithFormat:", v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v8 = -[ICNoteDateFormatterController shouldShowDateModified](self, "shouldShowDateModified");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    v11 = CFSTR("Edited: %@");
  else
    v11 = CFSTR("Created: %@");
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1EA7E9860, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "stringFromDate:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringWithFormat:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v15;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (int64_t)currentSortType
{
  return self->_currentSortType;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  void *v5;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_note);
  objc_msgSend(WeakRetained, "ic_removeObserver:forKeyPath:context:", self, CFSTR("modificationDate"), compoundliteral_11);

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, *MEMORY[0x1E0D64120], compoundliteral_128);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)ICNoteDateFormatterController;
  -[ICNoteDateFormatterController dealloc](&v6, sel_dealloc);
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
  if ((-[ICNoteDateFormatterController ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/Common/Utilities/ICNoteDateFormatterController.m") & 1) != 0)
  {
    v13 = -[ICNoteDateFormatterController ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v10, v11, v12);

    if ((v13 & 1) != 0)
      return;
    if (a6 != compoundliteral_11)
    {
      if (a6 != compoundliteral_128)
        return;
      -[ICNoteDateFormatterController setCurrentSortType:](self, "setCurrentSortType:", objc_msgSend(MEMORY[0x1E0D64230], "currentNoteListSortType"));
    }
    -[ICNoteDateFormatterController updateDate](self, "updateDate");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICNoteDateFormatterController;
    -[ICNoteDateFormatterController observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v12, v11, v10, a6);

  }
}

- (void)noteDecryptedStatusDidChange:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBlockingDeauthentication");

  if ((v4 & 1) == 0)
    performBlockOnMainThread();
}

uint64_t __62__ICNoteDateFormatterController_noteDecryptedStatusDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateLockIcon");
}

- (void)timeFormatChanged:(id)a3
{
  performBlockOnMainThread();
}

uint64_t __51__ICNoteDateFormatterController_timeFormatChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateDate");
}

- (void)toggleVisibleDateType
{
  -[ICNoteDateFormatterController setDidManuallyChangeDateType:](self, "setDidManuallyChangeDateType:", 1);
  -[ICNoteDateFormatterController setShowAlternateDateView:](self, "setShowAlternateDateView:", -[ICNoteDateFormatterController showAlternateDateView](self, "showAlternateDateView") ^ 1);
  -[ICNoteDateFormatterController updateDate](self, "updateDate");
  -[ICNoteDateFormatterController updateDateLabelAccessibilityHint](self, "updateDateLabelAccessibilityHint");
}

- (void)updateLockIcon
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0D64CF8];
  -[ICNoteDateFormatterController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageForCurrentDecryptedStatusForNote:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[ICNoteDateFormatterController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formatter:iconImageDidChange:", self, v6);

}

- (BOOL)iconHidden
{
  return self->_iconHidden;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)shouldShowSharedNoteTitle
{
  return self->_shouldShowSharedNoteTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_shortDateFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_destroyWeak((id *)&self->_note);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
