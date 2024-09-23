@implementation VOTUIItemChooserController

- (void)viewDidLoad
{
  id v3;
  double y;
  double width;
  double height;
  id v7;
  void *v8;
  _UIBackdropView *v9;
  _UIBackdropView *backdropView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  UILabel *headingLabel;
  uint64_t v17;
  NSBundle *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UISearchField *v24;
  UISearchField *searchField;
  UITableView *v26;
  UITableView *table;
  void *v28;
  UITableView *v29;
  void *v30;
  uint64_t v31;
  NSMutableArray *v32;
  NSMutableArray *filteredList;
  NSMutableDictionary *v34;
  NSMutableDictionary *items;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  objc_super v54;

  v54.receiver = self;
  v54.super_class = (Class)VOTUIItemChooserController;
  -[VOTUIItemChooserController viewDidLoad](&v54, "viewDidLoad");
  v3 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v7, "setAutoresizingMask:", 18);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIItemChooserController view](self, "view"));
  objc_msgSend(v8, "addSubview:", v7);

  v9 = (_UIBackdropView *)objc_msgSend(objc_alloc((Class)_UIBackdropView), "initWithPrivateStyle:", 2030);
  backdropView = self->_backdropView;
  self->_backdropView = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_UIBackdropView layer](self->_backdropView, "layer"));
  objc_msgSend(v11, "setCornerRadius:", 10.0);

  objc_msgSend(v7, "addSubview:", self->_backdropView);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "_handleSearchFieldTextChange:", UITextFieldTextDidChangeNotification, 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "_keyboardWillShow:", UIKeyboardWillShowNotification, 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v14, "addObserver:selector:name:object:", self, "_keyboardWillHide:", UIKeyboardWillHideNotification, 0);

  v15 = (UILabel *)objc_msgSend(objc_allocWithZone((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  headingLabel = self->_headingLabel;
  self->_headingLabel = v15;

  -[UILabel setTag:](self->_headingLabel, "setTag:", 1010);
  v18 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(VOTUIItemChooserController, v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("VoiceOverItemChooser"), &stru_100024F18, CFSTR("AXUIViewService")));
  -[UILabel setText:](self->_headingLabel, "setText:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UILabel setTextColor:](self->_headingLabel, "setTextColor:", v21);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_headingLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setTextAlignment:](self->_headingLabel, "setTextAlignment:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleTitle2, 0));
  -[UILabel setFont:](self->_headingLabel, "setFont:", v22);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_headingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAccessibilityTraits:](self->_headingLabel, "setAccessibilityTraits:", UIAccessibilityTraitSummaryElement | UIAccessibilityTraitHeader | kAXIgnoreItemChooserTrait);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_headingLabel, "setBackgroundColor:", v23);

  objc_msgSend(v7, "addSubview:", self->_headingLabel);
  v24 = (UISearchField *)objc_msgSend(objc_allocWithZone((Class)UISearchField), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  searchField = self->_searchField;
  self->_searchField = v24;

  -[UISearchField setTag:](self->_searchField, "setTag:", 1011);
  -[UISearchField setDelegate:](self->_searchField, "setDelegate:", self);
  -[UISearchField setAutocorrectionType:](self->_searchField, "setAutocorrectionType:", 1);
  -[UISearchField setSpellCheckingType:](self->_searchField, "setSpellCheckingType:", 1);
  -[UISearchField setReturnKeyType:](self->_searchField, "setReturnKeyType:", 6);
  -[UISearchField setAutocapitalizationType:](self->_searchField, "setAutocapitalizationType:", 0);
  -[UISearchField setTranslatesAutoresizingMaskIntoConstraints:](self->_searchField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UISearchField _setAccessibilityServesAsFirstElement:](self->_searchField, "_setAccessibilityServesAsFirstElement:", 1);
  objc_msgSend(v7, "addSubview:", self->_searchField);
  v26 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, CGRectZero.origin.x, y, width, height);
  table = self->_table;
  self->_table = v26;

  -[UITableView setRowHeight:](self->_table, "setRowHeight:", UITableViewAutomaticDimension);
  -[UITableView setEstimatedRowHeight:](self->_table, "setEstimatedRowHeight:", 100.0);
  -[UITableView setDelegate:](self->_table, "setDelegate:", self);
  -[UITableView setSeparatorStyle:](self->_table, "setSeparatorStyle:", 1);
  -[UITableView setDataSource:](self->_table, "setDataSource:", self);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](self->_table, "setBackgroundColor:", v28);

  -[UITableView setClipsToBounds:](self->_table, "setClipsToBounds:", 1);
  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_table, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v29 = self->_table;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UITableView _setSectionIndexColor:](v29, "_setSectionIndexColor:", v30);

  -[UITableView registerClass:forCellReuseIdentifier:](self->_table, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell, v31), CFSTR("TableViewCell"));
  objc_msgSend(v7, "addSubview:", self->_table);
  v32 = (NSMutableArray *)objc_msgSend(objc_allocWithZone((Class)NSMutableArray), "init");
  filteredList = self->_filteredList;
  self->_filteredList = v32;

  v34 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  items = self->_items;
  self->_items = v34;

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIItemChooserController view](self, "view"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIItemChooserController _constraintsToPositionItem:identicallyToItem:](self, "_constraintsToPositionItem:identicallyToItem:", v7, v37));
  v53 = v36;
  objc_msgSend(v36, "addObjectsFromArray:", v38);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v36);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_headingLabel, "topAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "safeAreaLayoutGuide"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v41, 1.0));
  objc_msgSend(v42, "setActive:", 1);

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_headingLabel, 7, 0, v7, 7, 0.9, 0.0));
  objc_msgSend(v43, "setActive:", 1);

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_headingLabel, 9, 0, v7, 9, 1.0, 0.0));
  objc_msgSend(v44, "setActive:", 1);

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_searchField, 3, 0, self->_headingLabel, 4, 1.0, 5.0));
  objc_msgSend(v45, "setActive:", 1);

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_searchField, 7, 0, v7, 7, 0.8, 0.0));
  objc_msgSend(v46, "setActive:", 1);

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_searchField, 9, 0, v7, 9, 1.0, 0.0));
  objc_msgSend(v47, "setActive:", 1);

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_table, 3, 0, self->_searchField, 4, 1.0, 10.0));
  objc_msgSend(v48, "setActive:", 1);

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_table, 7, 0, v7, 7, 0.9, 0.0));
  objc_msgSend(v49, "setActive:", 1);

  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_table, 9, 0, v7, 9, 1.0, 0.0));
  objc_msgSend(v50, "setActive:", 1);

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_table, 4, 0, v7, 4, 1.0, 0.0));
  objc_msgSend(v51, "setActive:", 1);

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_backdropView, 3, 0, v7, 4, 1.0, 0.0));
  objc_msgSend(v52, "setActive:", 1);

}

- (id)_constraintsToPositionItem:(id)a3 identicallyToItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(&off_100026040, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(&off_100026040);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11), "integerValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, v12, 0, v6, v12, 1.0, 0.0));
        objc_msgSend(v7, "addObject:", v13);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(&off_100026040, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)showItemChooser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = a3;
  -[VOTUIItemChooserController setAccessibilityViewIsModal:](self, "setAccessibilityViewIsModal:", 1);
  self->_category = 0x7FFFFFFFFFFFFFFFLL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("items")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("categories")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("mappings")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("regionDescriptions")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("searchTerm")));

  objc_storeStrong((id *)&self->_itemCategoryMappings, v7);
  objc_storeStrong((id *)&self->_originalList, v5);
  objc_storeStrong((id *)&self->_regionDescriptions, v8);
  objc_storeStrong((id *)&self->_categories, v6);
  objc_storeStrong((id *)&self->_lastSearchTerm, v9);
  -[UISearchField setText:](self->_searchField, "setText:", self->_lastSearchTerm);
  if (GSEventIsHardwareKeyboardAttached(-[VOTUIItemChooserController _handleSearchFieldTextChange:](self, "_handleSearchFieldTextChange:", 0))|| -[NSString length](self->_lastSearchTerm, "length"))
  {
    -[UISearchField becomeFirstResponder](self->_searchField, "becomeFirstResponder");
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000FC4C;
    v10[3] = &unk_100024748;
    v10[4] = self;
    AXPerformBlockOnMainThreadAfterDelay(v10, 0.0);
  }
  -[VOTUIItemChooserController _guidedAccessItemChooserDidShow](self, "_guidedAccessItemChooserDidShow");

}

- (void)_guidedAccessItemChooserDidShow
{
  void *v3;
  id v4;

  -[VOTUIItemChooserController _loadGuidedAccessBundle](self, "_loadGuidedAccessBundle");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIItemChooserController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  -[VOTUIItemChooserController _updateGuidedAccessWindowId:](self, "_updateGuidedAccessWindowId:", objc_msgSend(v3, "_contextId"));

}

- (void)_updateGuidedAccessWindowId:(unsigned int)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  if (_AXSGuidedAccessEnabled(self, a2))
  {
    v4 = objc_msgSend((id)AXSafeClassFromString(CFSTR("GAXClient")), "safeValueForKey:", CFSTR("sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if ((objc_msgSend(v5, "isActive") & 1) != 0)
      objc_msgSend(v5, "voiceOverItemChooserDidShow:", v3);

  }
}

- (void)_loadGuidedAccessBundle
{
  if (_AXSGuidedAccessEnabled(self, a2))
  {
    if (qword_10002E798 != -1)
      dispatch_once(&qword_10002E798, &stru_100024C28);
  }
}

- (int64_t)modalPresentationStyle
{
  return 5;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  int64_t category;
  unint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSUInteger v10;
  NSBundle *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  NSMutableArray *filteredList;
  NSMutableArray *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  UIAccessibilityNotifications v28;
  void *v29;
  void *v30;
  void **v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t);
  void *v35;
  VOTUIItemChooserController *v36;
  id v37;

  category = self->_category;
  if (a3 == 1)
  {
    if (category == 0x7FFFFFFFFFFFFFFFLL)
      v5 = -[NSArray count](self->_categories, "count") - 1;
    else
      v5 = category - 1;
  }
  else
  {
    if (a3 != 2)
    {
LABEL_20:
      LOBYTE(v6) = 0;
      return v6;
    }
    if (category == 0x7FFFFFFFFFFFFFFFLL)
      v5 = 0;
    else
      v5 = category + 1;
  }
  v6 = -[NSArray count](self->_categories, "count");
  if (v6)
  {
    if (qword_10002E7A0)
    {
      if ((v5 & 0x8000000000000000) != 0)
        goto LABEL_19;
    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/CoreServices/VoiceOverTouch.app")));
      v9 = (void *)qword_10002E7A0;
      qword_10002E7A0 = v8;

      if ((v5 & 0x8000000000000000) != 0)
        goto LABEL_19;
    }
    v10 = -[NSArray count](self->_categories, "count");
    if (v5 != 0x7FFFFFFFFFFFFFFFLL && v5 < v10)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_categories, "objectAtIndex:", v5));
      v18 = (int)objc_msgSend(v17, "intValue");

      v19 = v18 - 1;
      if ((unint64_t)(v18 - 1) < 0x18 && ((0xFFF601u >> v19) & 1) != 0)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10002E7A0, "localizedStringForKey:value:table:", *(&off_100024D68 + v19), 0, CFSTR("VOTLocalizedStrings")));
        -[UILabel setText:](self->_headingLabel, "setText:", v20);

      }
      else
      {
        _AXAssert(0, "/Library/Caches/com.apple.xbs/Sources/AccessibilityFrameworks/Source/AXUIViewService/VOT Item Chooser/VOTUIItemChooserController.m", 368, "-[VOTUIItemChooserController accessibilityScroll:]", CFSTR("No key for rotor type"));
        -[UILabel setText:](self->_headingLabel, "setText:", &stru_100024F18);
      }
      self->_category = v5;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_categories, "objectAtIndex:", v5));
      v22 = (NSMutableArray *)-[NSArray mutableCopyWithZone:](self->_originalList, "mutableCopyWithZone:", 0);
      filteredList = self->_filteredList;
      self->_filteredList = v22;

      v24 = self->_filteredList;
      v32 = _NSConcreteStackBlock;
      v33 = 3221225472;
      v34 = sub_100010504;
      v35 = &unk_100024C50;
      v36 = self;
      v37 = v21;
      v16 = v21;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray indexesOfObjectsPassingTest:](v24, "indexesOfObjectsPassingTest:", &v32));
      -[NSMutableArray removeObjectsAtIndexes:](v24, "removeObjectsAtIndexes:", v25, v32, v33, v34, v35, v36);

      v15 = self->_filteredList;
LABEL_27:

      -[VOTUIItemChooserController _displayWithList:fromRotorSwitch:](self, "_displayWithList:fromRotorSwitch:", v15, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_headingLabel, "text"));
      if (self->_category == 0x7FFFFFFFFFFFFFFFLL)
      {
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10002E7A0, "localizedStringForKey:value:table:", CFSTR("search.rotor.allitems"), 0, CFSTR("VOTLocalizedStrings")));

        v26 = (void *)v27;
      }
      UIAccessibilityPostNotification(UIAccessibilityPageScrolledNotification, v26);
      v28 = UIAccessibilityLayoutChangedNotification;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView accessibilityElementAtIndex:](self->_table, "accessibilityElementAtIndex:", 0));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "_accessibilityFindDescendant:", &stru_100024C90));
      UIAccessibilityPostNotification(v28, v30);

      LOBYTE(v6) = 1;
      return v6;
    }
LABEL_19:
    if (self->_category == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_20;
    v12 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(VOTUIItemChooserController, v7));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("VoiceOverItemChooser"), &stru_100024F18, CFSTR("AXUIViewService")));
    -[UILabel setText:](self->_headingLabel, "setText:", v14);

    self->_category = 0x7FFFFFFFFFFFFFFFLL;
    v15 = self->_originalList;
    v16 = self->_filteredList;
    self->_filteredList = 0;
    goto LABEL_27;
  }
  return v6;
}

- (void)hideItemChooser:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIItemChooserController delegate](self, "delegate", a3));

  if (v4)
  {
    v5[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000105F8;
    v6[3] = &unk_100024748;
    v6[4] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001062C;
    v5[3] = &unk_1000247D8;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v5, 0.2);
  }
}

- (BOOL)hostingWindowShouldMoveForReachability
{
  return 1;
}

- (void)_handleSearchFieldTextChange:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  NSString *v7;
  NSString *lastSearchTerm;
  NSString *v9;
  NSString *filter;
  NSMutableArray *v11;
  NSMutableArray *filteredList;
  NSMutableArray *v13;
  void *v14;
  id v15;
  _QWORD v16[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIItemChooserController view](self, "view", a3));
  v5 = objc_msgSend(v4, "isHidden");

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchField text](self->_searchField, "text"));
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lowercaseString"));

    if ((objc_msgSend(v15, "isEqualToString:", self->_filter) & 1) == 0)
    {
      v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[UISearchField text](self->_searchField, "text"));
      lastSearchTerm = self->_lastSearchTerm;
      self->_lastSearchTerm = v7;

      v9 = (NSString *)objc_msgSend(v15, "copyWithZone:", 0);
      filter = self->_filter;
      self->_filter = v9;

      v11 = (NSMutableArray *)-[NSArray mutableCopyWithZone:](self->_originalList, "mutableCopyWithZone:", 0);
      filteredList = self->_filteredList;
      self->_filteredList = v11;

      if (-[NSString length](self->_filter, "length"))
      {
        v13 = self->_filteredList;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100010854;
        v16[3] = &unk_100024CB8;
        v16[4] = self;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray indexesOfObjectsPassingTest:](v13, "indexesOfObjectsPassingTest:", v16));
        -[NSMutableArray removeObjectsAtIndexes:](v13, "removeObjectsAtIndexes:", v14);

      }
      -[VOTUIItemChooserController _displayWithList:fromRotorSwitch:](self, "_displayWithList:fromRotorSwitch:", self->_filteredList, 0, v15);
    }

  }
}

- (void)_displayWithList:(id)a3 fromRotorSwitch:(BOOL)a4
{
  id v6;
  uint64_t v7;
  id totalItemCount;
  NSBundle *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *sectionHeaders;
  uint64_t v19;
  NSBundle *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[5];

  v6 = a3;
  self->_totalItemCount = (int64_t)objc_msgSend(v6, "count");
  if (self->_category == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (-[NSMutableArray count](self->_filteredList, "count"))
      totalItemCount = -[NSMutableArray count](self->_filteredList, "count");
    else
      totalItemCount = (id)self->_totalItemCount;
    v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(VOTUIItemChooserController, v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("VoiceOverItemChooser.count"), &stru_100024F18, CFSTR("AXUIViewService")));
    v12 = AXFormatInteger(totalItemCount);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v13));
    -[UILabel setText:](self->_headingLabel, "setText:", v14);

  }
  else
  {
    totalItemCount = 0;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIItemChooserController view](self, "view"));
  objc_msgSend(v15, "layoutIfNeeded");

  self->_selectedRow = 0x7FFFFFFFFFFFFFFFLL;
  self->_activateItem = 0;
  -[NSMutableDictionary removeAllObjects](self->_items, "removeAllObjects");
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100010C44;
  v37[3] = &unk_100024CE0;
  v37[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v37);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_items, "allKeys"));
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sortedArrayUsingComparator:", &stru_100024D20));
  sectionHeaders = self->_sectionHeaders;
  self->_sectionHeaders = v17;

  -[UITableView setBackgroundView:](self->_table, "setBackgroundView:", 0);
  -[UITableView reloadData](self->_table, "reloadData");
  if (!a4)
  {
    v20 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(VOTUIItemChooserController, v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("item.count"), &stru_100024F18, CFSTR("AXUIViewService")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, totalItemCount));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_filteredList, "firstObject"));
    v26 = objc_opt_class(NSString, v25);
    if ((objc_opt_isKindOfClass(v24, v26) & 1) != 0)
    {
      v33 = v24;
      v34 = CFSTR("__AXStringForVariablesSentinel");
      v28 = __UIAXStringForVariables(v23, v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);

      v23 = (void *)v29;
    }
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v23);

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView safeValueForKey:](self->_table, "safeValueForKey:", CFSTR("_index"), v33, v34));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100010DA0;
  v35[3] = &unk_100024748;
  v36 = v30;
  v31 = v30;
  AXPerformSafeBlock(v35);
  objc_msgSend(v31, "bounds");
  objc_msgSend(v31, "setBounds:", 0.0, 0.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "layer"));
  objc_msgSend(v32, "setCornerRadius:", 5.0);

}

- (double)_positionAccountingForKeyboard:(CGRect)a3
{
  double y;
  BOOL v5;
  double result;
  void *v7;
  double v8;
  double v9;
  CGRect v10;

  y = a3.origin.y;
  v10.origin.x = CGRectZero.origin.x;
  v10.origin.y = CGRectZero.origin.y;
  v10.size.width = CGRectZero.size.width;
  v10.size.height = CGRectZero.size.height;
  v5 = CGRectEqualToRect(a3, v10);
  result = -1.0;
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIItemChooserController view](self, "view", -1.0));
    objc_msgSend(v7, "frame");
    v9 = v8;

    result = (y - v9) * 0.5;
    if (v9 >= y)
      return 30.0;
  }
  return result;
}

- (void)_updatePositionForKeyboard:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[9];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIItemChooserController view](self, "view"));
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  if (v12 > 30.0)
  {
    -[VOTUIItemChooserController _positionAccountingForKeyboard:](self, "_positionAccountingForKeyboard:", x, y, width, height);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100010F4C;
    v18[3] = &unk_100024D48;
    v18[4] = self;
    v18[5] = v10;
    v18[6] = v17;
    v18[7] = v14;
    v18[8] = v16;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v18, 0.2);
  }
}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIItemChooserController view](self, "view"));
  v5 = objc_msgSend(v4, "isHidden");

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", UIKeyboardFrameEndUserInfoKey));
    objc_msgSend(v7, "CGRectValue");
    self->_keyboardFrame.origin.x = v8;
    self->_keyboardFrame.origin.y = v9;
    self->_keyboardFrame.size.width = v10;
    self->_keyboardFrame.size.height = v11;

    if (-[UISearchField isFirstResponder](self->_searchField, "isFirstResponder"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchField window](self->_searchField, "window"));
      objc_msgSend(v12, "becomeKeyWindow");

      -[VOTUIItemChooserController _updatePositionForKeyboard:](self, "_updatePositionForKeyboard:", self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
    }
  }

}

- (void)_keyboardWillHide:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  CGSize size;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIItemChooserController view](self, "view", a3));
  v5 = objc_msgSend(v4, "isHidden");

  if ((v5 & 1) == 0)
  {
    -[UISearchField resignFirstResponder](self->_searchField, "resignFirstResponder");
    size = CGRectZero.size;
    self->_keyboardFrame.origin = CGRectZero.origin;
    self->_keyboardFrame.size = size;
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[UISearchField resignFirstResponder](self->_searchField, "resignFirstResponder", a3);
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  self->_selectedRow = 0x7FFFFFFFFFFFFFFFLL;
  self->_activateItem = 0;
  -[VOTUIItemChooserController hideItemChooser:](self, "hideItemChooser:", 0);
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (-[NSMutableArray count](self->_filteredList, "count", a3))
    return 1;
  else
    return -[NSArray count](self->_sectionHeaders, "count");
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v7;
  void *v8;
  id v9;

  if (-[NSMutableArray count](self->_filteredList, "count", a3))
    return (int64_t)-[NSMutableArray count](self->_filteredList, "count");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_sectionHeaders, "objectAtIndex:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_items, "objectForKey:", v7));
  v9 = objc_msgSend(v8, "count");

  return (int64_t)v9;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  NSArray *v4;

  if (-[NSString length](self->_filter, "length", a3))
    v4 = 0;
  else
    v4 = self->_sectionHeaders;
  return v4;
}

- (void)_updateSelectedRow:(id)a3
{
  NSArray *originalList;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[NSMutableArray count](self->_filteredList, "count"))
  {
    originalList = self->_originalList;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView cellForRowAtIndexPath:](self->_table, "cellForRowAtIndexPath:", v9));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
    self->_selectedRow = -[NSArray indexOfObject:](originalList, "indexOfObject:", v7);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_sectionHeaders, "objectAtIndex:", objc_msgSend(v9, "section")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_items, "objectForKey:", v5));
    -[UITableView deselectRowAtIndexPath:animated:](self->_table, "deselectRowAtIndexPath:animated:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v9, "row")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", 1));
    self->_selectedRow = (int64_t)objc_msgSend(v8, "integerValue");

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[VOTUIItemChooserController _updateSelectedRow:](self, "_updateSelectedRow:", a4);
  -[VOTUIItemChooserController hideItemChooser:](self, "hideItemChooser:", 1);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v5, "setBackgroundColor:", v6);

  if (v5)
  {
    do
    {
      v7 = v5;
      v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      objc_msgSend(v5, "setBackgroundColor:", v8);

    }
    while (v5 != v9 && v5);

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  if (-[NSMutableArray count](self->_filteredList, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_filteredList, "objectAtIndex:", objc_msgSend(v7, "row")));
    v9 = -[NSArray indexOfObject:](self->_originalList, "indexOfObject:", v8);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_sectionHeaders, "objectAtIndex:", objc_msgSend(v7, "section")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_items, "objectForKey:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", 0));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 1));
    v9 = objc_msgSend(v14, "integerValue");

  }
  if (v9 >= (id)-[NSArray count](self->_regionDescriptions, "count"))
    v15 = 0;
  else
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_regionDescriptions, "objectAtIndex:", v9));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("TableViewCell")));
  objc_msgSend(v16, "setAccessibilityTraits:", kAXIgnoreItemChooserTrait);
  objc_msgSend(v16, "setAccessibilityHint:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "textLabel"));
  objc_msgSend(v17, "setText:", v8);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "textLabel"));
  objc_msgSend(v18, "setNumberOfLines:", 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "textLabel"));
  objc_msgSend(v20, "setTextColor:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "textLabel"));
  objc_msgSend(v22, "setBackgroundColor:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v16, "setBackgroundColor:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contentView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "superview"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v25, "setBackgroundColor:", v26);

  return v16;
}

- (VOTUIItemChooserDelegate)delegate
{
  return (VOTUIItemChooserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)lastSearchTerm
{
  return self->_lastSearchTerm;
}

- (void)setLastSearchTerm:(id)a3
{
  objc_storeStrong((id *)&self->_lastSearchTerm, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSearchTerm, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_sectionHeaders, 0);
  objc_storeStrong((id *)&self->_regionDescriptions, 0);
  objc_storeStrong((id *)&self->_itemCategoryMappings, 0);
  objc_storeStrong((id *)&self->_originalList, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_filteredList, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_storeStrong((id *)&self->_headingLabel, 0);
}

@end
