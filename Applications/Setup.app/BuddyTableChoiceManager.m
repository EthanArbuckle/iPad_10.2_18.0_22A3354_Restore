@implementation BuddyTableChoiceManager

- (BuddyTableChoiceManager)initWithCellConstructor:(id)a3 allowManualRowHeight:(BOOL)a4
{
  id v5;
  BuddyTableChoiceManager *v6;
  id v7;
  void *v8;
  BuddyTableChoiceManager *v9;
  objc_super v11;
  BOOL v12;
  id location[2];
  id v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = a4;
  v5 = v14;
  v14 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)BuddyTableChoiceManager;
  v6 = -[BuddyTableChoiceManager init](&v11, "init");
  v14 = v6;
  objc_storeStrong(&v14, v6);
  if (v6)
  {
    v7 = objc_retainBlock(location[0]);
    v8 = (void *)*((_QWORD *)v14 + 9);
    *((_QWORD *)v14 + 9) = v7;

    *((_BYTE *)v14 + 33) = v12;
  }
  v9 = (BuddyTableChoiceManager *)v14;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v14, 0);
  return v9;
}

- (void)setSelectedChoiceIndex:(id)a3 tableView:(id)a4
{
  NSArray *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void **v10;
  int v11;
  int v12;
  void (*v13)(uint64_t, char);
  void *v14;
  BuddyTableChoiceManager *v15;
  id v16;
  id from;
  id v18;
  char v19;
  id v20;
  id v21;
  id location[2];
  BuddyTableChoiceManager *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v5 = -[BuddyChoiceManager choices](v23, "choices");
  v6 = -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", objc_msgSend(location[0], "section"));
  v20 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(location[0], "row"));

  v19 = -[BuddyTableChoiceManager wantsNextButton](v23, "wantsNextButton");
  if (v23->_selectedChoice && (v19 & 1) != 0)
  {
    v18 = objc_msgSend(v21, "cellForRowAtIndexPath:", v23->_selectedChoiceIndexPath);
    objc_msgSend(v18, "setAccessoryType:", 0);
    v7 = objc_msgSend(v18, "textLabel");
    v8 = +[UIColor _labelColor](UIColor, "_labelColor");
    objc_msgSend(v7, "setTextColor:", v8);

    objc_storeStrong(&v18, 0);
  }
  objc_storeStrong((id *)&v23->_selectedChoiceIndexPath, location[0]);
  objc_storeStrong((id *)&v23->_selectedChoice, v20);
  if ((v19 & 1) != 0)
    -[BuddyTableChoiceManager _updateSelectedChoiceCheckmarkWithtableView:](v23, "_updateSelectedChoiceCheckmarkWithtableView:", v21);
  objc_initWeak(&from, v23);
  v9 = v20;
  v10 = _NSConcreteStackBlock;
  v11 = -1073741824;
  v12 = 0;
  v13 = sub_10005D56C;
  v14 = &unk_100280F10;
  objc_copyWeak(&v16, &from);
  v15 = v23;
  objc_msgSend(v9, "runConfirmationIfNeededCompletion:", &v10);
  objc_storeStrong((id *)&v15, 0);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

- (void)_updateSelectedChoiceCheckmarkWithtableView:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id location[2];
  BuddyTableChoiceManager *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v8->_selectedChoice)
  {
    v6 = -[BuddyTableChoiceManager selectedChoiceIndexPath](v8, "selectedChoiceIndexPath");
    if (v6)
    {
      v5 = objc_msgSend(location[0], "cellForRowAtIndexPath:", v6);
      objc_msgSend(v5, "setAccessoryType:", 3);
      v3 = objc_msgSend(v5, "textLabel");
      v4 = +[UIColor tableCellBlueTextColor](UIColor, "tableCellBlueTextColor");
      objc_msgSend(v3, "setTextColor:", v4);

      objc_msgSend(v5, "setNeedsLayout");
      objc_storeStrong(&v5, 0);
    }
    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(location, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  NSArray *v3;
  NSUInteger v4;
  id location[2];
  BuddyTableChoiceManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyChoiceManager choices](v7, "choices");
  v4 = -[NSArray count](v3, "count");

  objc_storeStrong(location, 0);
  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  NSArray *v5;
  id v6;
  id v7;
  int64_t v9;
  id location[2];
  BuddyTableChoiceManager *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v5 = -[BuddyChoiceManager choices](v11, "choices");
  v6 = -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v9);
  v7 = objc_msgSend(v6, "count");

  objc_storeStrong(location, 0);
  return (int64_t)v7;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSArray *v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  id v14;
  id v15;
  id v16;
  char v17;
  NSIndexPath *v18;
  id v19;
  id location[2];
  BuddyTableChoiceManager *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v5 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  objc_msgSend(v5, "applyThemeToTableCell:", location[0]);

  v6 = objc_msgSend(location[0], "textLabel");
  objc_msgSend(v6, "setLineBreakMode:", 0);

  v7 = objc_msgSend(location[0], "textLabel");
  objc_msgSend(v7, "setNumberOfLines:", 0);

  v8 = objc_msgSend(location[0], "textLabel");
  v9 = -[BuddyChoiceManager choices](v21, "choices");
  v10 = -[NSArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", objc_msgSend(v19, "section"));
  v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v19, "row"));
  v12 = objc_msgSend(v11, "title");
  objc_msgSend(v8, "setText:", v12);

  v17 = 0;
  v13 = 0;
  if (-[BuddyTableChoiceManager wantsNextButton](v21, "wantsNextButton"))
  {
    v14 = objc_msgSend(v19, "row");
    v18 = -[BuddyTableChoiceManager selectedChoiceIndexPath](v21, "selectedChoiceIndexPath");
    v17 = 1;
    v13 = v14 == (id)-[NSIndexPath row](v18, "row");
  }
  if ((v17 & 1) != 0)

  if (v13)
  {
    objc_msgSend(location[0], "setAccessoryType:", 3);
    v15 = objc_msgSend(location[0], "textLabel");
    v16 = +[UIColor tableCellBlueTextColor](UIColor, "tableCellBlueTextColor");
    objc_msgSend(v15, "setTextColor:", v16);

  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v7 = 0;
  objc_storeStrong(&v7, a5);
  objc_msgSend(v8, "setSeparatorStyle:", 1);
  objc_msgSend(v8, "_setShouldHaveFullLengthTopSeparator:", 0);
  objc_msgSend(v8, "_setShouldHaveFullLengthBottomSeparator:", 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t (**v6)(id, id, id, const __CFString *);
  id v7;
  NSArray *v8;
  id v9;
  id v10;
  id v12;
  int v13;
  id v14;
  id location[2];
  BuddyTableChoiceManager *v16;
  id v17;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v5 = -[BuddyTableChoiceManager cellConstructor](v16, "cellConstructor");

  if (v5)
  {
    v6 = (uint64_t (**)(id, id, id, const __CFString *))-[BuddyTableChoiceManager cellConstructor](v16, "cellConstructor");
    v7 = location[0];
    v8 = -[BuddyChoiceManager choices](v16, "choices");
    v9 = -[NSArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", objc_msgSend(v14, "section"));
    v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v14, "row"));
    v17 = (id)v6[2](v6, v7, v10, CFSTR("com.apple.buddyTableChoice.cell"));

    v13 = 1;
  }
  else
  {
    v12 = objc_msgSend(location[0], "dequeueReusableCellWithIdentifier:", CFSTR("com.apple.buddyTableChoice.cell"));
    if (!v12)
    {
      v12 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("com.apple.buddyTableChoice.cell"));

    }
    -[BuddyTableChoiceManager configureCell:atIndexPath:](v16, "configureCell:atIndexPath:", v12, v14);
    v17 = v12;
    v13 = 1;
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v17;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  double v15;
  double v17;
  id v18;
  id location[2];
  BuddyTableChoiceManager *v20;
  double v21;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v5 = -[BuddyTableChoiceManager tableView:cellForRowAtIndexPath:](v20, "tableView:cellForRowAtIndexPath:", location[0], v18);
  objc_msgSend(v5, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v7 = v6;

  v17 = v7;
  if (-[BuddyTableChoiceManager allowManualRowHeight](v20, "allowManualRowHeight"))
  {
    -[BuddyTableChoiceManager fixedRowHeight](v20, "fixedRowHeight");
    if (v7 <= v8)
      -[BuddyTableChoiceManager fixedRowHeight](v20, "fixedRowHeight");
    else
      v9 = UITableViewAutomaticDimension;
    v21 = v9;
  }
  else
  {
    v10 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    objc_msgSend(v10, "tallRowHeight");
    v12 = v11;

    if (v17 <= v12)
    {
      v13 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
      objc_msgSend(v13, "tallRowHeight");
      objc_msgSend(location[0], "setEstimatedRowHeight:");

      v14 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
      objc_msgSend(v14, "tallRowHeight");
      v21 = v15;

    }
    else
    {
      v21 = UITableViewAutomaticDimension;
    }
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v21;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return UITableViewAutomaticDimension;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  id location[2];
  BuddyTableChoiceManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[BuddyTableChoiceManager setSelectedChoiceIndex:tableView:](v7, "setSelectedChoiceIndex:tableView:", v5, location[0]);
  objc_msgSend(location[0], "deselectRowAtIndexPath:animated:", v5, 1);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)setChoices:(id)a3
{
  NSArray *v3;
  NSArray *v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  unint64_t i;
  NSArray *v9;
  id v10;
  uint64_t v11;
  unint64_t j;
  void *v13;
  BuddyChooseable *v14;
  _QWORD v15[8];
  void *v16;
  _QWORD __b[8];
  id v18;
  id location[2];
  BuddyTableChoiceManager *v20;
  _BYTE v21[128];
  _BYTE v22[128];

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyChoiceManager choices](v20, "choices");
  v4 = (NSArray *)location[0];

  if (v3 != v4)
  {
    memset(__b, 0, sizeof(__b));
    v5 = v20->super._choices;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
    if (v6)
    {
      v7 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v6; ++i)
        {
          if (*(_QWORD *)__b[2] != v7)
            objc_enumerationMutation(v5);
          v18 = *(id *)(__b[1] + 8 * i);
          objc_msgSend(v18, "makeObjectsPerformSelector:withObject:", "setChoiceController:", 0);
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
      }
      while (v6);
    }

    objc_storeStrong((id *)&v20->super._choices, location[0]);
    memset(v15, 0, sizeof(v15));
    v9 = v20->super._choices;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", v15, v21, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v15[2];
      do
      {
        for (j = 0; j < (unint64_t)v10; ++j)
        {
          if (*(_QWORD *)v15[2] != v11)
            objc_enumerationMutation(v9);
          v16 = *(void **)(v15[1] + 8 * j);
          v13 = v16;
          v14 = -[BuddyChoiceManager chooseableDelegate](v20, "chooseableDelegate");
          objc_msgSend(v13, "makeObjectsPerformSelector:withObject:", "setChoiceController:", v14);

        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", v15, v21, 16);
      }
      while (v10);
    }

  }
  objc_storeStrong(location, 0);
}

- (id)viewForFooterInTableView:(id)a3
{
  UIView *v3;
  id location[2];
  BuddyTableChoiceManager *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyTableChoiceManager footerView](v6, "footerView");
  objc_storeStrong(location, 0);
  return v3;
}

- (double)heightForFooterInTableView:(id)a3
{
  UIView *v3;
  double v4;
  double v5;
  id location[2];
  BuddyTableChoiceManager *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyTableChoiceManager footerView](v8, "footerView");
  -[UIView systemLayoutSizeFittingSize:](v3, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v5 = v4;

  objc_storeStrong(location, 0);
  return v5;
}

- (id)tableViewDataSource
{
  return self;
}

- (id)tableViewDelegate
{
  return self;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (double)fixedRowHeight
{
  return self->_fixedRowHeight;
}

- (void)setFixedRowHeight:(double)a3
{
  self->_fixedRowHeight = a3;
}

- (BuddyChoice)selectedChoice
{
  return self->_selectedChoice;
}

- (void)setSelectedChoice:(id)a3
{
  objc_storeStrong((id *)&self->_selectedChoice, a3);
}

- (NSIndexPath)selectedChoiceIndexPath
{
  return self->_selectedChoiceIndexPath;
}

- (void)setSelectedChoiceIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedChoiceIndexPath, a3);
}

- (BOOL)wantsNextButton
{
  return self->_wantsNextButton;
}

- (void)setWantsNextButton:(BOOL)a3
{
  self->_wantsNextButton = a3;
}

- (id)cellConstructor
{
  return self->_cellConstructor;
}

- (void)setCellConstructor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)allowManualRowHeight
{
  return self->_allowManualRowHeight;
}

- (void)setAllowManualRowHeight:(BOOL)a3
{
  self->_allowManualRowHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cellConstructor, 0);
  objc_storeStrong((id *)&self->_selectedChoiceIndexPath, 0);
  objc_storeStrong((id *)&self->_selectedChoice, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
}

@end
