@implementation EKCalendarItemTitleInlineEditItem

- (EKCalendarItemTitleInlineEditItem)init
{
  EKCalendarItemTitleInlineEditItem *v2;
  EKCalendarItemTitleInlineEditItem *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKCalendarItemTitleInlineEditItem;
  v2 = -[EKCalendarItemTitleInlineEditItem init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[EKCalendarItemTitleInlineEditItem setDrawsOwnRowSeparators:](v2, "setDrawsOwnRowSeparators:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__contentSizeCategoryChanged_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)EKCalendarItemTitleInlineEditItem;
  -[EKCalendarItemTitleInlineEditItem dealloc](&v4, sel_dealloc);
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend((id)objc_opt_class(), "scaledHeightOfSystemTableViewCell");
  v7 = v6;
  v8 = v6 * 3.0;
  -[EKUITitleTableViewCell idealHeightForWidth:](self->_titleCell, "idealHeightForWidth:", a4);
  return fmax(v7, fmin(v9 + 22.0, v8));
}

- (BOOL)isInline
{
  return 1;
}

- (void)refreshFromCalendarItemAndStore
{
  EKCalendarItem **p_calendarItem;
  id WeakRetained;
  void *v5;
  id v6;

  p_calendarItem = &self->super._calendarItem;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._calendarItem);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_calendarItem);
    objc_msgSend(v6, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUITitleTableViewCell setTitle:](self->_titleCell, "setTitle:", v5);

  }
}

- (void)reset
{
  EKUITitleTableViewCell *titleCell;

  titleCell = self->_titleCell;
  self->_titleCell = 0;

}

- (unint64_t)numberOfSubitems
{
  return 1;
}

- (id)_makeCell
{
  return -[EKUISingleLineTitleTableViewCell initWithDelegate:]([EKUISingleLineTitleTableViewCell alloc], "initWithDelegate:", self);
}

- (void)setTitle:(id)a3
{
  -[EKUITitleTableViewCell setTitle:](self->_titleCell, "setTitle:", a3);
}

- (BOOL)focusTitleAndSelectTitle:(BOOL)a3
{
  _BOOL8 v3;
  EKUITitleTableViewCell *titleCell;
  id v6;

  v3 = a3;
  titleCell = self->_titleCell;
  if (!titleCell)
  {
    v6 = -[EKCalendarItemTitleInlineEditItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", 0);
    titleCell = self->_titleCell;
  }
  -[EKUITitleTableViewCell focusTitleAndSelectTitle:](titleCell, "focusTitleAndSelectTitle:", v3);
  return 1;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKUITitleTableViewCell *titleCell;
  EKUITitleTableViewCell *v5;
  EKUITitleTableViewCell *v6;
  EKUITitleTableViewCell *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  titleCell = self->_titleCell;
  if (!titleCell)
  {
    -[EKCalendarItemTitleInlineEditItem _makeCell](self, "_makeCell", a3);
    v5 = (EKUITitleTableViewCell *)objc_claimAutoreleasedReturnValue();
    v6 = self->_titleCell;
    self->_titleCell = v5;

    titleCell = self->_titleCell;
  }
  v7 = titleCell;
  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _StringWithLineEndingsRemoved(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUITitleTableViewCell setTitle:](v7, "setTitle:", v13);

  }
  -[EKCalendarItemTitleInlineEditItem _setDrawsOwnRowSeparatorsForCell:](self, "_setDrawsOwnRowSeparatorsForCell:", v7);
  return v7;
}

- (BOOL)usesDetailViewControllerForSubitem:(unint64_t)a3
{
  return 0;
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  EKUITitleTableViewCell *titleCell;
  void *v5;
  void *v6;
  void *v7;

  titleCell = self->_titleCell;
  if (titleCell)
  {
    -[EKUITitleTableViewCell title](titleCell, "title", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _StringWithLineEndingsRemoved(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v6);

  }
  -[EKCalendarItemEditItem notifySubitemDidSave:](self, "notifySubitemDidSave:", 0);
  return 1;
}

- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4
{
  void *v4;
  BOOL v5;

  -[EKCalendarItemEditItem selectedResponder](self, "selectedResponder", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (void)titleDidBeginEditing:(id)a3
{
  -[EKCalendarItemEditItem setSelectedResponder:](self, "setSelectedResponder:", a3);
  -[EKCalendarItemEditItem notifyDidStartEditing](self, "notifyDidStartEditing");
}

- (void)titleDidChange
{
  -[EKCalendarItemEditItem notifyTextChanged](self, "notifyTextChanged");
  -[EKCalendarItemEditItem notifyRequiresHeightChange](self, "notifyRequiresHeightChange");
}

- (void)titleDidEndEditing
{
  -[EKCalendarItemEditItem notifyDidEndEditing](self, "notifyDidEndEditing");
  -[EKCalendarItemEditItem setSelectedResponder:](self, "setSelectedResponder:", 0);
}

- (BOOL)titleShouldClear
{
  -[EKCalendarItemEditItem notifyTextChanged](self, "notifyTextChanged");
  return 1;
}

- (BOOL)titleShouldReturn
{
  void *v2;

  -[EKCalendarItemEditItem selectedResponder](self, "selectedResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

  return 0;
}

- (id)searchStringForEventAutocomplete
{
  return (id)-[EKUITitleTableViewCell title](self->_titleCell, "title");
}

- (BOOL)isSaveable
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  -[EKUITitleTableViewCell title](self->_titleCell, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[EKUITitleTableViewCell title](self->_titleCell, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "length") != 0;

  }
  return v6;
}

- (void)setDrawsOwnRowSeparators:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  _QWORD v7[5];

  if (self->_drawsOwnRowSeparators != a3)
  {
    self->_drawsOwnRowSeparators = a3;
    -[EKCalendarItemEditItem delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[EKCalendarItemEditItem delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __62__EKCalendarItemTitleInlineEditItem_setDrawsOwnRowSeparators___block_invoke;
      v7[3] = &unk_1E60185E8;
      v7[4] = self;
      objc_msgSend(v6, "editItem:performActionsOnCellAtSubitem:actions:", self, 0, v7);

    }
  }
}

uint64_t __62__EKCalendarItemTitleInlineEditItem_setDrawsOwnRowSeparators___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDrawsOwnRowSeparatorsForCell:", a2);
}

- (void)_setDrawsOwnRowSeparatorsForCell:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "setDrawsOwnRowSeparators:", -[EKCalendarItemTitleInlineEditItem drawsOwnRowSeparators](self, "drawsOwnRowSeparators"));
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRowSeparatorColor:", v4);

  if (-[EKCalendarItemTitleInlineEditItem drawsOwnRowSeparators](self, "drawsOwnRowSeparators"))
  {
    v5 = *MEMORY[0x1E0DC49E8];
    v6 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    v5 = *MEMORY[0x1E0DC53D8];
    v6 = *MEMORY[0x1E0DC53D8];
    v7 = *MEMORY[0x1E0DC53D8];
    v8 = *MEMORY[0x1E0DC53D8];
  }
  objc_msgSend(v9, "setSeparatorInset:", v5, v6, v7, v8);

}

- (BOOL)drawsOwnRowSeparators
{
  return self->_drawsOwnRowSeparators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleCell, 0);
}

@end
