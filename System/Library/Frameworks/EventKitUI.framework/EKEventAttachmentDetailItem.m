@implementation EKEventAttachmentDetailItem

- (void)_cleanUpCellControllers
{
  NSArray *cellControllers;

  cellControllers = self->_cellControllers;
  if (cellControllers)
  {
    self->_cellControllers = 0;

  }
}

- (void)_setUpCellControllers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSArray *v7;
  NSArray *cellControllers;
  NSArray *v9;
  id v10;

  self->_visibilityChanged = 0;
  -[EKEvent calendar](self->super._event, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D0CD00], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sourceIsManaged:", v10);

  -[EKEvent attachments](self->super._event, "attachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKEventAttachmentCellController cellControllersForAttachments:givenExistingControllers:sourceIsManaged:](EKEventAttachmentCellController, "cellControllersForAttachments:givenExistingControllers:sourceIsManaged:", v6, self->_cellControllers, v5);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  -[NSArray makeObjectsPerformSelector:withObject:](self->_cellControllers, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, 0);
  cellControllers = self->_cellControllers;
  self->_cellControllers = v7;
  v9 = v7;

  -[NSArray makeObjectsPerformSelector:withObject:](self->_cellControllers, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, self);
}

- (void)setEvent:(id)a3 reminder:(id)a4 store:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKEventAttachmentDetailItem;
  -[EKEventDetailItem setEvent:reminder:store:](&v6, sel_setEvent_reminder_store_, a3, a4, a5);
  -[EKEventAttachmentDetailItem _setUpCellControllers](self, "_setUpCellControllers");
}

- (void)reset
{
  NSArray *cellControllers;
  void *v4;
  void *v5;

  cellControllers = self->_cellControllers;
  if (cellControllers)
  {
    if (!-[NSArray count](cellControllers, "count")
      && (-[EKEvent attachments](self->super._event, "attachments"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v4,
          v4)
      || -[NSArray count](self->_cellControllers, "count")
      && (-[EKEvent attachments](self->super._event, "attachments"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          !v5))
    {
      self->_visibilityChanged = 1;
    }
  }
  -[EKEventAttachmentDetailItem _cleanUpCellControllers](self, "_cleanUpCellControllers");
}

- (void)dealloc
{
  objc_super v3;

  -[EKEventAttachmentDetailItem _cleanUpCellControllers](self, "_cleanUpCellControllers");
  v3.receiver = self;
  v3.super_class = (Class)EKEventAttachmentDetailItem;
  -[EKEventDetailItem dealloc](&v3, sel_dealloc);
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  NSArray *cellControllers;

  cellControllers = self->_cellControllers;
  if (!cellControllers)
  {
    -[EKEventAttachmentDetailItem _setUpCellControllers](self, "_setUpCellControllers", a3, a4);
    cellControllers = self->_cellControllers;
  }
  return -[NSArray count](cellControllers, "count", a3, a4) != 0;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  NSArray *cellControllers;
  void *v6;
  void *v7;
  NSObject *v9;
  uint8_t v10[16];

  cellControllers = self->_cellControllers;
  if (!cellControllers)
  {
    -[EKEventAttachmentDetailItem _setUpCellControllers](self, "_setUpCellControllers");
    cellControllers = self->_cellControllers;
  }
  if (-[NSArray count](cellControllers, "count") <= a3)
  {
    v9 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_ERROR, "No cellControllers found in the attachment detail item.  We shouldn't be drawn, but tableview thinks we want to display, returning empty cell", v10, 2u);
    }
    return (id)objc_opt_new();
  }
  else
  {
    -[NSArray objectAtIndex:](self->_cellControllers, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
}

- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3
{
  return 1;
}

- (unint64_t)numberOfSubitems
{
  NSArray *cellControllers;

  cellControllers = self->_cellControllers;
  if (!cellControllers)
  {
    -[EKEventAttachmentDetailItem _setUpCellControllers](self, "_setUpCellControllers");
    cellControllers = self->_cellControllers;
  }
  return -[NSArray count](cellControllers, "count");
}

- (void)eventViewController:(id)a3 didSelectSubitem:(unint64_t)a4
{
  id v6;

  if (-[NSArray count](self->_cellControllers, "count", a3) > a4)
  {
    -[NSArray objectAtIndex:](self->_cellControllers, "objectAtIndex:", a4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellSelected");

  }
}

- (BOOL)detailItemVisibilityChanged
{
  return self->_visibilityChanged;
}

- (id)parentViewControllerForAttachmentCellController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[EKEventDetailItem delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[EKEventDetailItem delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewControllerForEventItem:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)owningEventForAttachmentCellController:(id)a3
{
  return self->super._event;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellControllers, 0);
}

@end
