@implementation HUTimeEventOffsetEditorViewController

- (HUTimeEventOffsetEditorViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithSignificantEvent_currentOffset_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTimeEventOffsetEditorViewController.m"), 29, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUTimeEventOffsetEditorViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUTimeEventOffsetEditorViewController)initWithSignificantEvent:(id)a3 currentOffset:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HUTimeEventOffsetEditorViewController *v13;
  HUTimeEventOffsetEditorViewController *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31810]), "initWithDelegate:itemProvidersCreator:", self, &__block_literal_global_232);
  v16.receiver = self;
  v16.super_class = (Class)HUTimeEventOffsetEditorViewController;
  v13 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v16, sel_initWithItemManager_tableViewStyle_, v12, 1);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_significantEvent, a3);
    objc_storeStrong((id *)&v14->_currentOffset, a4);
    objc_storeStrong((id *)&v14->_selectedOffset, a4);
    objc_storeWeak((id *)&v14->_delegate, v11);
  }

  return v14;
}

id __89__HUTimeEventOffsetEditorViewController_initWithSignificantEvent_currentOffset_delegate___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0D31840]);
  v1 = (void *)objc_msgSend(v0, "initWithResults:", MEMORY[0x1E0C9AA70]);
  v2 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithItems:", v3);

  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUTimeEventOffsetEditorViewController;
  -[HUItemTableViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[HUTimeEventOffsetEditorViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSeparatorStyle:", 1);

  -[HUTimeEventOffsetEditorViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", 0);

  -[HUTimeEventOffsetEditorViewController significantEvent](self, "significantEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB9B88]);

  if (v6)
  {
    v7 = CFSTR("HUTimeEventOffsetEditorTitleSunrise");
  }
  else
  {
    -[HUTimeEventOffsetEditorViewController significantEvent](self, "significantEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB9B90]);

    if (!v9)
    {
      -[HUTimeEventOffsetEditorViewController significantEvent](self, "significantEvent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Unhandled significant event type: %@"), v10);
      goto LABEL_7;
    }
    v7 = CFSTR("HUTimeEventOffsetEditorTitleSunset");
  }
  _HULocalizedStringWithDefaultValue(v7, v7, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimeEventOffsetEditorViewController setTitle:](self, "setTitle:", v10);
LABEL_7:

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancel_);
  -[HUTimeEventOffsetEditorViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLeftBarButtonItem:", v11);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__done_);
  -[HUTimeEventOffsetEditorViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRightBarButtonItem:", v13);

}

- (void)_cancel:(id)a3
{
  id v4;

  -[HUTimeEventOffsetEditorViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timerTriggerOffsetEditorDidCancel:", self);

}

- (void)_done:(id)a3
{
  void *v4;
  id v5;

  -[HUTimeEventOffsetEditorViewController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTimeEventOffsetEditorViewController selectedOffset](self, "selectedOffset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timerTriggerOffsetEditor:didFinishWithOffset:", self, v4);

}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = objc_opt_class();
  v12 = v8;
  if (!v12)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v12;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v11, objc_opt_class());

LABEL_7:
    v14 = 0;
  }

  objc_msgSend(v14, "setDelegate:", self);
  v17.receiver = self;
  v17.super_class = (Class)HUTimeEventOffsetEditorViewController;
  -[HUItemTableViewController setupCell:forItem:indexPath:](&v17, sel_setupCell_forItem_indexPath_, v12, v10, v9);

}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  v12 = a4;
  v13 = objc_opt_class();
  v14 = v10;
  if (!v14)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v14;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v13, objc_opt_class());

LABEL_7:
    v16 = 0;
  }

  -[HUTimeEventOffsetEditorViewController significantEvent](self, "significantEvent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSignificantEvent:", v19);

  -[HUTimeEventOffsetEditorViewController currentOffset](self, "currentOffset");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCurrentOffset:", v20);

  v21.receiver = self;
  v21.super_class = (Class)HUTimeEventOffsetEditorViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v21, sel_updateCell_forItem_indexPath_animated_, v14, v12, v11, v6);

}

- (void)significantEventOffsetPicker:(id)a3 didSelectOffset:(id)a4
{
  -[HUTimeEventOffsetEditorViewController setSelectedOffset:](self, "setSelectedOffset:", a4);
}

- (NSString)significantEvent
{
  return self->_significantEvent;
}

- (NSDateComponents)currentOffset
{
  return self->_currentOffset;
}

- (HUTimeEventOffsetEditorDelegate)delegate
{
  return (HUTimeEventOffsetEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDateComponents)selectedOffset
{
  return self->_selectedOffset;
}

- (void)setSelectedOffset:(id)a3
{
  objc_storeStrong((id *)&self->_selectedOffset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedOffset, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentOffset, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
}

@end
