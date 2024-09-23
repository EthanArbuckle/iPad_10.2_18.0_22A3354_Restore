@implementation EKCalendarItemEditorTableView

- (void)reloadData
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  self->_isReloading = 1;
  -[EKCalendarItemEditorTableView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[EKCalendarItemEditorTableView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tableViewDidStartReload:", self);

  }
  v6.receiver = self;
  v6.super_class = (Class)EKCalendarItemEditorTableView;
  -[EKCalendarItemEditorTableView reloadData](&v6, sel_reloadData);
  self->_isReloading = 0;
}

- (void)scrollToRowAtIndexPath:(id)a3 atScrollPosition:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  objc_super v10;

  v5 = a5;
  v8 = a3;
  -[EKCalendarItemEditorTableView cellForRowAtIndexPath:](self, "cellForRowAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 != 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v9, "_isAncestorOfFirstResponder"))
        a4 = 1;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)EKCalendarItemEditorTableView;
  -[EKCalendarItemEditorTableView scrollToRowAtIndexPath:atScrollPosition:animated:](&v10, sel_scrollToRowAtIndexPath_atScrollPosition_animated_, v8, a4, v5);

}

- (BOOL)isReloading
{
  return self->_isReloading;
}

- (void)setIsReloading:(BOOL)a3
{
  self->_isReloading = a3;
}

@end
