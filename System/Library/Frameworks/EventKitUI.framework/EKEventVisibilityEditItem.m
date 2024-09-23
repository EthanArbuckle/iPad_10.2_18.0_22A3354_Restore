@implementation EKEventVisibilityEditItem

- (EKEventVisibilityEditItem)init
{
  EKEventVisibilityEditItem *v2;
  EKEventAvailabilityEditItem *v3;
  EKEventAvailabilityEditItem *availabilityEditItem;
  EKEventPrivacyLevelInlineEditItem *v5;
  EKEventPrivacyLevelInlineEditItem *privacyLevelEditItem;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKEventVisibilityEditItem;
  v2 = -[EKEventVisibilityEditItem init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(EKEventAvailabilityEditItem);
    availabilityEditItem = v2->_availabilityEditItem;
    v2->_availabilityEditItem = v3;

    v5 = objc_alloc_init(EKEventPrivacyLevelInlineEditItem);
    privacyLevelEditItem = v2->_privacyLevelEditItem;
    v2->_privacyLevelEditItem = v5;

  }
  return v2;
}

- (void)reset
{
  -[EKCalendarItemEditItem reset](self->_availabilityEditItem, "reset");
  -[EKCalendarItemEditItem reset](self->_privacyLevelEditItem, "reset");
}

- (unint64_t)onSaveEditorReloadBehavior
{
  unint64_t v3;
  unint64_t result;

  v3 = -[EKCalendarItemEditItem onSaveEditorReloadBehavior](self->_availabilityEditItem, "onSaveEditorReloadBehavior");
  result = -[EKEventPrivacyLevelInlineEditItem onSaveEditorReloadBehavior](self->_privacyLevelEditItem, "onSaveEditorReloadBehavior");
  if (v3 > result)
    return v3;
  return result;
}

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[EKEventAvailabilityEditItem canBeConfiguredForCalendarConstraints:](self->_availabilityEditItem, "canBeConfiguredForCalendarConstraints:", v4)|| -[EKEventPrivacyLevelInlineEditItem canBeConfiguredForCalendarConstraints:](self->_privacyLevelEditItem, "canBeConfiguredForCalendarConstraints:", v4);

  return v5;
}

- (BOOL)shouldAppear
{
  return -[EKCalendarItemEditItem shouldAppear](self->_availabilityEditItem, "shouldAppear")
      || -[EKEventPrivacyLevelInlineEditItem shouldAppear](self->_privacyLevelEditItem, "shouldAppear");
}

- (void)setCalendarItem:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKEventVisibilityEditItem;
  v6 = a4;
  v7 = a3;
  -[EKEventEditItem setCalendarItem:store:](&v8, sel_setCalendarItem_store_, v7, v6);
  -[EKEventEditItem setCalendarItem:store:](self->_availabilityEditItem, "setCalendarItem:store:", v7, v6, v8.receiver, v8.super_class);
  -[EKEventEditItem setCalendarItem:store:](self->_privacyLevelEditItem, "setCalendarItem:store:", v7, v6);

}

- (void)setDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEventVisibilityEditItem;
  v4 = a3;
  -[EKCalendarItemEditItem setDelegate:](&v5, sel_setDelegate_, v4);
  -[EKCalendarItemEditItem setDelegate:](self->_availabilityEditItem, "setDelegate:", v4, v5.receiver, v5.super_class);
  -[EKCalendarItemEditItem setDelegate:](self->_privacyLevelEditItem, "setDelegate:", v4);

}

- (unint64_t)numberOfSubitems
{
  unint64_t result;

  if (-[EKEventPrivacyLevelInlineEditItem shouldAppear](self->_privacyLevelEditItem, "shouldAppear"))
    result = 2;
  else
    result = 1;
  self->_lastKnownNumberOfSubitems = result;
  return result;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  void *v5;
  double v6;
  double v7;

  -[EKEventVisibilityEditItem _editItemForIndex:](self, "_editItemForIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultCellHeightForSubitemAtIndex:forWidth:", 0, a4);
  v7 = v6;

  return v7;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[EKEventVisibilityEditItem _editItemForIndex:](self, "_editItemForIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForSubitemAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4
{
  return a4 == 0;
}

- (BOOL)usesDetailViewControllerForSubitem:(unint64_t)a3
{
  return a3 == 0;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  EKEventEditItem *v9;
  EKEventEditItem *subitemOfLastDetailViewControllerRequested;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[EKEventVisibilityEditItem _editItemForIndex:](self, "_editItemForIndex:", a4);
  v9 = (EKEventEditItem *)objc_claimAutoreleasedReturnValue();
  subitemOfLastDetailViewControllerRequested = self->_subitemOfLastDetailViewControllerRequested;
  self->_subitemOfLastDetailViewControllerRequested = v9;

  return -[EKCalendarItemEditItem detailViewControllerWithFrame:forSubitemAtIndex:](self->_subitemOfLastDetailViewControllerRequested, "detailViewControllerWithFrame:forSubitemAtIndex:", 0, x, y, width, height);
}

- (BOOL)editItemViewControllerSave:(id)a3
{
  return -[EKCalendarItemEditItem editItemViewControllerSave:](self->_subitemOfLastDetailViewControllerRequested, "editItemViewControllerSave:", a3);
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;

  v3 = a3;
  v5 = -[EKEventAvailabilityEditItem saveAndDismissWithForce:](self->_availabilityEditItem, "saveAndDismissWithForce:");
  return v5 | -[EKEventPrivacyLevelInlineEditItem saveAndDismissWithForce:](self->_privacyLevelEditItem, "saveAndDismissWithForce:", v3);
}

- (double)footerHeightForWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;

  -[EKEventVisibilityEditItem _lowestEditItem](self, "_lowestEditItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerHeightForWidth:", a3);
  v6 = v5;

  return v6;
}

- (id)footerTitle
{
  void *v2;
  void *v3;

  -[EKEventVisibilityEditItem _lowestEditItem](self, "_lowestEditItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "footerTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)footerView
{
  void *v2;
  void *v3;

  -[EKEventVisibilityEditItem _lowestEditItem](self, "_lowestEditItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "footerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_lowestEditItem
{
  unint64_t lastKnownNumberOfSubitems;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  int v9;
  EKEventVisibilityEditItem *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  lastKnownNumberOfSubitems = self->_lastKnownNumberOfSubitems;
  if (lastKnownNumberOfSubitems == 2)
  {
    v4 = 1;
    goto LABEL_5;
  }
  if (lastKnownNumberOfSubitems == 1)
  {
    v4 = 0;
LABEL_5:
    -[EKEventVisibilityEditItem _editItemForIndex:](self, "_editItemForIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  v6 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    v7 = self->_lastKnownNumberOfSubitems;
    v9 = 138412546;
    v10 = self;
    v11 = 2048;
    v12 = v7;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_ERROR, "Cannot find lowest edit item for [%@] with number of subitems: [%lu]", (uint8_t *)&v9, 0x16u);
  }
  v5 = 0;
  return v5;
}

- (id)_editItemForIndex:(unint64_t)a3
{
  int *v3;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    v3 = &OBJC_IVAR___EKEventVisibilityEditItem__privacyLevelEditItem;
  }
  else
  {
    v3 = &OBJC_IVAR___EKEventVisibilityEditItem__availabilityEditItem;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subitemOfLastDetailViewControllerRequested, 0);
  objc_storeStrong((id *)&self->_privacyLevelEditItem, 0);
  objc_storeStrong((id *)&self->_availabilityEditItem, 0);
}

@end
