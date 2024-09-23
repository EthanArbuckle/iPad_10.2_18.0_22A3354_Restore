@implementation EKEventEditedByDetailItem

- (void)reset
{
  UITableViewCell *cell;

  cell = self->_cell;
  self->_cell = 0;

}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;

  -[EKEvent calendar](self->super._event, "calendar", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "sharingStatus") && -[EKEvent isEditable](self->super._event, "isEditable"))
  {
    -[EKEvent sharedItemModifiedByDisplayName](self->super._event, "sharedItemModifiedByDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      && (-[EKEvent sharedItemModifiedDate](self->super._event, "sharedItemModifiedDate"),
          (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = 1;
    }
    else
    {
      -[EKEvent sharedItemCreatedByDisplayName](self->super._event, "sharedItemCreatedByDisplayName");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        -[EKEvent sharedItemCreatedDate](self->super._event, "sharedItemCreatedDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v11 != 0;

        if (!v6)
          goto LABEL_13;
      }
      else
      {
        v8 = 0;
        if (!v6)
        {
LABEL_13:

          goto LABEL_14;
        }
      }
      v7 = 0;
    }

    goto LABEL_13;
  }
  v8 = 0;
LABEL_14:

  return v8;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  UITableViewCell *cell;
  id v7;
  double v8;

  cell = self->_cell;
  if (!cell)
  {
    v7 = -[EKEventEditedByDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3, a5, a4);
    cell = self->_cell;
  }
  -[UITableViewCell frame](cell, "frame", a3, a5, a4);
  return v8;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  void *v3;
  UITableViewCell *cell;
  void *v6;
  void *v7;
  uint64_t v8;
  EKEvent *event;
  void *v10;
  EKEventDetailTwoValueCell *v11;
  UITableViewCell *v12;
  void *v13;
  EKEventDetailTwoValueCell *v14;
  UITableViewCell *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  cell = self->_cell;
  if (!cell)
  {
    -[EKEvent sharedItemCreatedDate](self->super._event, "sharedItemCreatedDate", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent sharedItemModifiedDate](self->super._event, "sharedItemModifiedDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "compare:", v7);

    event = self->super._event;
    if (v8)
    {
      -[EKEvent sharedItemModifiedDate](event, "sharedItemModifiedDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[EKEventDetailTwoValueCell initWithEvent:editable:platformStyle:]([EKEventDetailTwoValueCell alloc], "initWithEvent:editable:platformStyle:", self->super._event, 1, 0);
      v12 = self->_cell;
      self->_cell = &v11->super.super.super;

      EventKitUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Edited by"), &stru_1E601DFA8, 0);
    }
    else
    {
      -[EKEvent sharedItemCreatedDate](event, "sharedItemCreatedDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[EKEventDetailTwoValueCell initWithEvent:editable:platformStyle:]([EKEventDetailTwoValueCell alloc], "initWithEvent:editable:platformStyle:", self->super._event, 1, 0);
      v15 = self->_cell;
      self->_cell = &v14->super.super.super;

      EventKitUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Created by"), &stru_1E601DFA8, 0);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell titleView](self->_cell, "titleView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v13);

    if (v8)
    {

      -[EKEvent sharedItemModifiedByDisplayName](self->super._event, "sharedItemModifiedByDisplayName");
    }
    else
    {

      -[EKEvent sharedItemCreatedByDisplayName](self->super._event, "sharedItemCreatedByDisplayName");
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell valueView](self->_cell, "valueView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v17);

    CUIKStringForDateAndTime();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell value2View](self->_cell, "value2View");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v19);

    -[UITableViewCell update](self->_cell, "update");
    -[UITableViewCell layoutForWidth:position:](self->_cell, "layoutForWidth:position:", -[EKEventDetailItem cellPosition](self, "cellPosition"), 300.0);

    cell = self->_cell;
  }
  return cell;
}

- (void)shortenCell:(id)a3
{
  EKEvent *event;
  id v4;
  void *v5;
  void *v6;
  id v7;

  event = self->super._event;
  v4 = a3;
  -[EKEvent startDate](event, "startDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  CUIKStringForTimeWithTZIfDivergent();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value2View");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setText:", v5);
}

- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  EKEvent *event;
  void *v8;
  BOOL v9;

  -[EKEvent sharedItemCreatedDate](self->super._event, "sharedItemCreatedDate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent sharedItemModifiedDate](self->super._event, "sharedItemModifiedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  event = self->super._event;
  if (v6)
    -[EKEvent sharedItemModifiedByAddress](event, "sharedItemModifiedByAddress");
  else
    -[EKEvent sharedItemCreatedByAddress](event, "sharedItemCreatedByAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;

  return v9;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  EKEvent *event;
  void *v9;
  void *v10;
  void *v11;
  EKIdentityViewController *v12;

  -[EKEvent sharedItemCreatedDate](self->super._event, "sharedItemCreatedDate", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent sharedItemModifiedDate](self->super._event, "sharedItemModifiedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  event = self->super._event;
  if (v7)
  {
    -[EKEvent sharedItemModifiedByDisplayName](event, "sharedItemModifiedByDisplayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent sharedItemModifiedByAddress](self->super._event, "sharedItemModifiedByAddress");
  }
  else
  {
    -[EKEvent sharedItemCreatedByDisplayName](event, "sharedItemCreatedByDisplayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent sharedItemCreatedByAddress](self->super._event, "sharedItemCreatedByAddress");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CAA138], "shareeWithName:url:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EKIdentityViewController initWithIdentity:]([EKIdentityViewController alloc], "initWithIdentity:", v11);

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
