@implementation EKEventAttachmentsEditItem

- (void)_cleanUpCellControllers
{
  NSArray *cellControllers;

  -[NSArray enumerateObjectsUsingBlock:](self->_cellControllers, "enumerateObjectsUsingBlock:", &__block_literal_global_40);
  cellControllers = self->_cellControllers;
  self->_cellControllers = 0;

}

uint64_t __53__EKEventAttachmentsEditItem__cleanUpCellControllers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", 0);
}

- (id)attachmentEvent
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  EKEvent *v7;
  EKEvent *eventToModify;
  EKEvent *v9;

  if (!self->_eventToModify)
  {
    -[EKEventEditItem event](self, "event");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isNew"))
    {

    }
    else
    {
      -[EKEventEditItem event](self, "event");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isOrWasPartOfRecurringSeries");

      if (v5)
      {
        -[EKEventEditItem event](self, "event");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "masterEvent");
        v7 = (EKEvent *)objc_claimAutoreleasedReturnValue();
        eventToModify = self->_eventToModify;
        self->_eventToModify = v7;

LABEL_7:
        return self->_eventToModify;
      }
    }
    -[EKEventEditItem event](self, "event");
    v9 = (EKEvent *)objc_claimAutoreleasedReturnValue();
    v6 = self->_eventToModify;
    self->_eventToModify = v9;
    goto LABEL_7;
  }
  return self->_eventToModify;
}

- (void)refreshFromCalendarItemAndStore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSArray *v9;
  NSArray *cellControllers;
  NSArray *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)EKEventAttachmentsEditItem;
  -[EKCalendarItemEditItem refreshFromCalendarItemAndStore](&v12, sel_refreshFromCalendarItemAndStore);
  if (!-[EKEventAttachmentsEditItem _shouldCondenseIntoSingleItem](self, "_shouldCondenseIntoSingleItem"))
  {
    -[EKEventAttachmentsEditItem attachmentEvent](self, "attachmentEvent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "calendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D0CD00], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "sourceIsManaged:", v5);

    objc_msgSend(v3, "attachments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKEventAttachmentCellController cellControllersForAttachments:givenExistingControllers:sourceIsManaged:](EKEventAttachmentCellController, "cellControllersForAttachments:givenExistingControllers:sourceIsManaged:", v8, self->_cellControllers, v7);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();

    -[NSArray makeObjectsPerformSelector:withObject:](self->_cellControllers, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, 0);
    cellControllers = self->_cellControllers;
    self->_cellControllers = v9;
    v11 = v9;

    -[NSArray makeObjectsPerformSelector:withObject:](self->_cellControllers, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, self);
  }
}

- (unint64_t)onSaveEditorReloadBehavior
{
  return 1;
}

- (unint64_t)onSaveEditItemsToRefresh
{
  return 32;
}

- (void)dealloc
{
  objc_super v3;

  -[EKEventAttachmentsEditItem _cleanUpCellControllers](self, "_cleanUpCellControllers");
  v3.receiver = self;
  v3.super_class = (Class)EKEventAttachmentsEditItem;
  -[EKEventAttachmentsEditItem dealloc](&v3, sel_dealloc);
}

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  return 1;
}

- (BOOL)_shouldCondenseIntoSingleItem
{
  void *v2;
  void *v3;
  BOOL v4;

  -[EKEventAttachmentsEditItem attachmentEvent](self, "attachmentEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") > 3;

  return v4;
}

- (unint64_t)numberOfSubitems
{
  NSUInteger v3;

  if (-[EKEventAttachmentsEditItem _shouldCondenseIntoSingleItem](self, "_shouldCondenseIntoSingleItem"))
    v3 = 1;
  else
    v3 = -[NSArray count](self->_cellControllers, "count");
  return v3 + -[EKEventAttachmentsEditItem _shouldShowAddAttachmentCell](self, "_shouldShowAddAttachmentCell");
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  double result;
  objc_super v8;

  if (!-[EKEventAttachmentsEditItem _shouldCondenseIntoSingleItem](self, "_shouldCondenseIntoSingleItem"))
    return *MEMORY[0x1E0DC53D8];
  v8.receiver = self;
  v8.super_class = (Class)EKEventAttachmentsEditItem;
  -[EKCalendarItemEditItem defaultCellHeightForSubitemAtIndex:forWidth:](&v8, sel_defaultCellHeightForSubitemAtIndex_forWidth_, a3, a4);
  return result;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKUITableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSArray *cellControllers;

  if (!-[EKEventAttachmentsEditItem _shouldCondenseIntoSingleItem](self, "_shouldCondenseIntoSingleItem"))
  {
    v13 = -[NSArray count](self->_cellControllers, "count");
    cellControllers = self->_cellControllers;
    if (v13 > a3)
    {
      -[NSArray objectAtIndex:](cellControllers, "objectAtIndex:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cell");
      v5 = (EKUITableViewCell *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (-[NSArray count](cellControllers, "count") != a3)
    {
      v5 = 0;
      return v5;
    }
LABEL_8:
    -[EKEventAttachmentsEditItem _addAttachmentCell](self, "_addAttachmentCell");
    v5 = (EKUITableViewCell *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  if (a3)
    goto LABEL_8;
  v5 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
  -[EKUITableViewCell setAccessoryType:](v5, "setAccessoryType:", 1);
  EventKitUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Attachments"), &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUITableViewCell textLabel](v5, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[EKEventAttachmentsEditItem attachmentEvent](self, "attachmentEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attachments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "count");
  CUIKLocalizedStringForInteger();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUITableViewCell detailTextLabel](v5, "detailTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

LABEL_6:
  return v5;
}

- (id)_addAttachmentCell
{
  EKUITableViewCell *addAttachmentCell;
  EKUITableViewCell *v4;
  EKUITableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  addAttachmentCell = self->_addAttachmentCell;
  if (!addAttachmentCell)
  {
    v4 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_addAttachmentCell;
    self->_addAttachmentCell = v4;

    EventKitUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Add attachment"), CFSTR("Add attachment…"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUITableViewCell textLabel](self->_addAttachmentCell, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3780]), "initWithDelegate:", self);
    -[EKUITableViewCell addInteraction:](self->_addAttachmentCell, "addInteraction:", v9);

    addAttachmentCell = self->_addAttachmentCell;
  }
  return addAttachmentCell;
}

- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  NSArray *cellControllers;
  void *v9;
  objc_super v10;

  v6 = a3;
  if (!-[EKEventAttachmentsEditItem _shouldCondenseIntoSingleItem](self, "_shouldCondenseIntoSingleItem"))
  {
    v7 = -[NSArray count](self->_cellControllers, "count");
    cellControllers = self->_cellControllers;
    if (v7 > a4)
    {
      -[NSArray objectAtIndex:](cellControllers, "objectAtIndex:", a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cellSelected");

      goto LABEL_8;
    }
    if (-[NSArray count](cellControllers, "count") != a4)
      goto LABEL_8;
LABEL_7:
    -[EKEventAttachmentsEditItem _showAddAttachmentViewControllerAnimated:](self, "_showAddAttachmentViewControllerAnimated:", 1);
    goto LABEL_8;
  }
  if (a4)
    goto LABEL_7;
  v10.receiver = self;
  v10.super_class = (Class)EKEventAttachmentsEditItem;
  -[EKCalendarItemEditItem editor:didSelectSubitem:](&v10, sel_editor_didSelectSubitem_, v6, 0);
LABEL_8:

}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  EKEventAttachmentEditViewController *v14;
  void *v15;
  void *v16;
  EKEventAttachmentEditViewController *v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[EKCalendarItemEditItem calendarItem](self, "calendarItem", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D0CD00], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "sourceIsManaged:", v11);

  v14 = [EKEventAttachmentEditViewController alloc];
  -[EKEventAttachmentsEditItem attachmentEvent](self, "attachmentEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attachments");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[EKEventAttachmentEditViewController initWithFrame:attachments:sourceIsManaged:](v14, "initWithFrame:attachments:sourceIsManaged:", v16, v13, x, y, width, height);

  -[EKEventAttachmentEditViewController setDelegate:](v17, "setDelegate:", self);
  return v17;
}

- (BOOL)usesDetailViewControllerForSubitem:(unint64_t)a3
{
  return 0;
}

- (BOOL)_shouldShowAddAttachmentCell
{
  void *v2;
  char v3;

  -[EKEventAttachmentsEditItem attachmentEvent](self, "attachmentEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsAddingAttachments");

  return v3;
}

- (id)trailingSwipeActionsConfigurationForRowAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *, void *);
  void *v16;
  EKEventAttachmentsEditItem *v17;
  id v18[2];
  id location;

  if (a3 < 0 || -[NSArray count](self->_cellControllers, "count") <= a3)
    return 0;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC36C8];
  EventKitUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Remove attachment"), CFSTR("Remove"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __77__EKEventAttachmentsEditItem_trailingSwipeActionsConfigurationForRowAtIndex___block_invoke;
  v16 = &unk_1E601B0D8;
  objc_copyWeak(v18, &location);
  v18[1] = (id)a3;
  v17 = self;
  objc_msgSend(v5, "contextualActionWithStyle:title:handler:", 1, v7, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3D08];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v8, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configurationWithActions:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPerformsFirstActionWithFullSwipe:", 0);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  return v11;
}

void __77__EKEventAttachmentsEditItem_trailingSwipeActionsConfigurationForRowAtIndex___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t);
  id *WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id *v31;
  void (**v32)(id, uint64_t);
  id v33;
  id v34;
  id *location;
  void *v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[6], "objectAtIndex:", *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  location = WeakRetained + 6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", WeakRetained[6]);
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "removeObjectAtIndex:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v11, "attachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "attachmentEvent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  v15 = v14;
  v36 = v13;
  if ((objc_msgSend(v13, "isNew") & 1) == 0)
  {
    v29 = a1;
    v30 = v11;
    v31 = WeakRetained;
    v32 = v9;
    v33 = v8;
    v34 = v7;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v13, "attachments");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    v15 = v14;
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v39;
      v15 = v14;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v39 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v21, "UUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "UUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "isEqualToString:", v23);

          if (v24)
          {
            v25 = v21;

            v15 = v25;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v18);
    }

    v8 = v33;
    v7 = v34;
    WeakRetained = v31;
    v9 = v32;
    a1 = v29;
    v11 = v30;
    v13 = v36;
  }
  objc_msgSend(v13, "removeAttachment:", v15);
  objc_msgSend(WeakRetained, "setAttachmentsModified:", 1);
  objc_storeStrong(location, obj);
  objc_msgSend(*(id *)(a1 + 32), "notifySubitemDidSave:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_respondsToSelector();

  if ((v27 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "editItem:wantsDoneButtonDisabled:", *(_QWORD *)(a1 + 32), 0);

  }
  v9[2](v9, 1);

}

- (id)parentViewControllerForAttachmentCellController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[EKCalendarItemEditItem delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[EKCalendarItemEditItem delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewControllerForEditItem:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)attachmentEditViewController:(id)a3 attachmentDidChange:(int64_t)a4
{
  -[EKCalendarItemEditItem notifySubitemDidSave:](self, "notifySubitemDidSave:", a4);
}

- (void)_showAddAttachmentViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v3 = a3;
  v18[1] = *MEMORY[0x1E0C80C00];
  -[EKCalendarItemEditItem delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[EKCalendarItemEditItem delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllerForEditItem:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "presentedViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = objc_alloc(MEMORY[0x1E0DC3730]);
        v18[0] = *MEMORY[0x1E0CEC498];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initForOpeningContentTypes:asCopy:", v11, 1);

        self->_documentPickerPresented = 1;
        objc_msgSend(v12, "setDelegate:", self);
        objc_msgSend(v12, "setAllowsMultipleSelection:", 0);
        -[EKEventEditItem event](self, "event");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "calendar");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "source");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D0CD00], "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "sourceIsManaged:", v15);

        objc_msgSend(v12, "_setIsContentManaged:", v17);
        objc_msgSend(v8, "presentViewController:animated:completion:", v12, v3, 0);

      }
    }
  }
  else
  {
    v8 = 0;
  }

}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  self->_documentPickerPresented = 0;
  v6 = a4;
  objc_msgSend(a3, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_msgSend(v6, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA9FC8]), "initWithFilepath:", v9);
    -[EKEventAttachmentsEditItem _addAttachment:](self, "_addAttachment:", v8);

  }
}

- (void)documentPickerWasCancelled:(id)a3
{
  id v3;

  self->_documentPickerPresented = 0;
  objc_msgSend(a3, "presentingViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_addAttachment:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[EKEventAttachmentsEditItem attachmentEvent](self, "attachmentEvent");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "addAttachment:", v4);

  -[EKEventAttachmentsEditItem setAttachmentsModified:](self, "setAttachmentsModified:", 1);
  -[EKEventAttachmentsEditItem refreshFromCalendarItemAndStore](self, "refreshFromCalendarItemAndStore");
  -[EKCalendarItemEditItem notifySubitemDidSave:](self, "notifySubitemDidSave:", -[EKEventAttachmentsEditItem numberOfSubitems](self, "numberOfSubitems") - 1);
  -[EKCalendarItemEditItem delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[EKCalendarItemEditItem delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "editItem:wantsDoneButtonDisabled:", self, 0);

  }
}

- (id)footerTitle
{
  void *WeakRetained;
  _BOOL4 v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
  if (objc_msgSend(WeakRetained, "isOrWasPartOfRecurringSeries"))
  {
    v4 = -[EKEventAttachmentsEditItem _shouldShowAddAttachmentCell](self, "_shouldShowAddAttachmentCell");

    if (!v4)
    {
      v5 = 0;
      return v5;
    }
    EventKitUIBundle();
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "localizedStringForKey:value:table:", CFSTR("Attachments will be applied to all recurrences"), &stru_1E601DFA8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0CEC4A0];
  v5 = a4;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend((id)*MEMORY[0x1E0CEC588], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v5, "hasItemsConformingToTypeIdentifiers:", v8);
  return (char)v6;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v4;

  -[EKEventAttachmentsEditItem _addAttachmentCell](self, "_addAttachmentCell", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlighted:", 1);

}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v4;

  -[EKEventAttachmentsEditItem _addAttachmentCell](self, "_addAttachmentCell", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlighted:", 0);

}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", 2);
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a4, "items", a3);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    v7 = (void *)*MEMORY[0x1E0CEC4A0];
    v15 = (void *)*MEMORY[0x1E0CEC588];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "itemProvider");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "hasItemConformingToTypeIdentifier:", v11))
        {

        }
        else
        {
          objc_msgSend(v9, "itemProvider");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "hasItemConformingToTypeIdentifier:", v13);

          if (!v14)
            continue;
        }
        -[EKEventAttachmentsEditItem _loadAndAddDataAttachmentFromItem:](self, "_loadAndAddDataAttachmentFromItem:", v9);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id v4;

  -[EKEventAttachmentsEditItem _addAttachmentCell](self, "_addAttachmentCell", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlighted:", 0);

}

- (void)_loadAndAddDataAttachmentFromItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  objc_msgSend(a3, "itemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__EKEventAttachmentsEditItem__loadAndAddDataAttachmentFromItem___block_invoke;
  v7[3] = &unk_1E601B100;
  v7[4] = self;
  v6 = (id)objc_msgSend(v4, "loadFileRepresentationForTypeIdentifier:completionHandler:", v5, v7);

}

void __64__EKEventAttachmentsEditItem__loadAndAddDataAttachmentFromItem___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (a2)
  {
    v3 = (objc_class *)MEMORY[0x1E0CA9FC8];
    v4 = a2;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithFilepath:", v4);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__EKEventAttachmentsEditItem__loadAndAddDataAttachmentFromItem___block_invoke_2;
    v7[3] = &unk_1E6018EC0;
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v6 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

uint64_t __64__EKEventAttachmentsEditItem__loadAndAddDataAttachmentFromItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addAttachment:", *(_QWORD *)(a1 + 40));
}

- (BOOL)attachmentsModified
{
  return self->_attachmentsModified;
}

- (void)setAttachmentsModified:(BOOL)a3
{
  self->_attachmentsModified = a3;
}

- (EKEvent)eventToModify
{
  return (EKEvent *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEventToModify:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventToModify, 0);
  objc_storeStrong((id *)&self->_addAttachmentCell, 0);
  objc_storeStrong((id *)&self->_cellControllers, 0);
}

@end
