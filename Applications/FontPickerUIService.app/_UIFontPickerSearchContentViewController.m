@implementation _UIFontPickerSearchContentViewController

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSBundle *v8;
  void *v9;
  void *v10;
  NSBundle *v11;
  void *v12;
  void *v13;
  void *v14;
  NSAttributedString *v15;
  NSBundle *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSAttributedString *footerText;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)_UIFontPickerSearchContentViewController;
  -[_UIFontPickerSearchContentViewController loadView](&v22, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerSearchContentViewController tableView](self, "tableView"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(_UIFontPickerTableViewCell), CFSTR("UIFontPickerCell"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerSearchContentViewController tableView](self, "tableView"));
  objc_msgSend(v4, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(UITableViewHeaderFooterView), CFSTR("UIFontPickerFooter"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerSearchContentViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setSeparatorInsetReference:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerSearchContentViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setKeyboardDismissMode:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerSearchContentViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setSectionFooterHeight:", UITableViewAutomaticDimension);

  v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(UITableView));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FONT_PICKER_SETTINGS_LINK_FORMAT"), CFSTR("Manage and find more fonts in Settings. %@"), CFSTR("Localizable")));
  v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(UITableView));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FONT_PICKER_SETTINGS_LINK"), CFSTR("Open Fonts…"), CFSTR("Localizable")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v13));

  v15 = (NSAttributedString *)objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v14);
  v16 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(UITableView));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("FONT_PICKER_SETTINGS_LINK"), CFSTR("Open Fonts…"), CFSTR("Localizable")));
  v19 = objc_msgSend(v14, "rangeOfString:", v18);
  -[NSAttributedString addAttribute:value:range:](v15, "addAttribute:value:range:", NSLinkAttributeName, CFSTR("settings-navigation://com.apple.Settings.General/FONT_SETTING"), v19, v20);

  footerText = self->_footerText;
  self->_footerText = v15;

}

- (void)_setResultFonts:(id)a3
{
  void *v4;

  objc_storeStrong((id *)&self->_fonts, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerSearchContentViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

  -[_UIFontPickerSearchContentViewController setNeedsUpdateContentUnavailableConfiguration](self, "setNeedsUpdateContentUnavailableConfiguration");
}

- (void)_filterResultsForSearchTerm:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  NSArray *fonts;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v5 = objc_opt_new(NSMutableArray);
  if (-[NSArray count](self->_fonts, "count"))
  {
    v6 = 0;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_fonts, "objectAtIndexedSubscript:", v6));
      if (objc_msgSend(v7, "matchesSearchString:", v13))
      {
        -[NSMutableArray addObject:](v4, "addObject:", v7);
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, 0));
        -[NSMutableArray addObject:](v5, "addObject:", v8);

      }
      ++v6;
    }
    while (v6 < -[NSArray count](self->_fonts, "count"));
  }
  fonts = self->_fonts;
  self->_fonts = &v4->super;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerSearchContentViewController tableView](self, "tableView"));
  objc_msgSend(v10, "beginUpdates");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerSearchContentViewController tableView](self, "tableView"));
  objc_msgSend(v11, "deleteRowsAtIndexPaths:withRowAnimation:", v5, 5);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerSearchContentViewController tableView](self, "tableView"));
  objc_msgSend(v12, "endUpdates");

  -[_UIFontPickerSearchContentViewController setNeedsUpdateContentUnavailableConfiguration](self, "setNeedsUpdateContentUnavailableConfiguration");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_fonts, "count", a3, a4);
}

- (void)_setConfiguration:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_configuration, a3);
  v5 = a3;
  -[_UIFontPickerSearchContentViewController _setResultFonts:](self, "_setResultFonts:", self->_fonts);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  _UIFontPickerTableViewCell *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _UIFontPickerTableViewCell *v12;
  id v13;
  void *v14;
  uint64_t v15;
  _UIFontPickerTableViewCell *v16;
  _QWORD v18[4];
  _UIFontPickerTableViewCell *v19;
  id v20;
  _UIFontPickerSearchContentViewController *v21;

  v6 = a4;
  v7 = (_UIFontPickerTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("UIFontPickerCell")));
  if (!v7)
    v7 = -[_UIFontPickerTableViewCell initWithStyle:reuseIdentifier:]([_UIFontPickerTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("UIFontPickerCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_fonts, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
  v9 = sub_100068BA8();
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIFontPickerViewControllerConfiguration _clientFontContextEndpoint](self->_configuration, "_clientFontContextEndpoint"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sharedInstanceForEndpoint:", v10));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10006D080;
  v18[3] = &unk_1000910E8;
  v12 = v7;
  v19 = v12;
  v13 = v8;
  v20 = v13;
  v21 = self;
  objc_msgSend(v11, "runBlockInClientFontContext:", v18);
  if (-[UIFontPickerViewControllerConfiguration includeFaces](self->_configuration, "includeFaces")
    && (v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIFontPickerViewControllerConfiguration _filterFamilyName](self->_configuration, "_filterFamilyName")), v14, !v14))
  {
    v15 = objc_msgSend(v13, "hasMultipleFaces");
  }
  else
  {
    v15 = 0;
  }
  -[_UIFontPickerTableViewCell setAccessoryType:](v12, "setAccessoryType:", v15);
  v16 = v12;

  return v16;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_fonts, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3)));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fontDescriptor"));
  objc_msgSend(WeakRetained, "_pickerDidSelectFont:", v6);

}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v5;
  id v6;
  UITextView *v7;
  UITextView *footerTextView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v34;
  void *v35;
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
  _QWORD v49[4];

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("UIFontPickerFooter")));
  if (!v6)
    v6 = objc_msgSend(objc_alloc((Class)UITableViewHeaderFooterView), "initWithReuseIdentifier:", CFSTR("UIFontPickerFooter"));
  if (!self->_footerTextView)
  {
    v7 = (UITextView *)objc_msgSend(objc_alloc((Class)UITextView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    footerTextView = self->_footerTextView;
    self->_footerTextView = v7;

    -[UITextView setDelegate:](self->_footerTextView, "setDelegate:", self);
    -[UITextView setScrollEnabled:](self->_footerTextView, "setScrollEnabled:", 0);
    -[UITextView setEditable:](self->_footerTextView, "setEditable:", 0);
    -[UITextView setSelectable:](self->_footerTextView, "setSelectable:", 1);
    -[UITextView setDataDetectorTypes:](self->_footerTextView, "setDataDetectorTypes:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_footerTextView, "textContainer"));
    objc_msgSend(v9, "setLineFragmentPadding:", 0.0);

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_footerTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentView"));
    objc_msgSend(v10, "addSubview:", self->_footerTextView);

    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentView"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "safeAreaLayoutGuide"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "leadingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView leadingAnchor](self->_footerTextView, "leadingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
    v49[0] = v44;
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentView"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "safeAreaLayoutGuide"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView trailingAnchor](self->_footerTextView, "trailingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
    v49[1] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "safeAreaLayoutGuide"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView topAnchor](self->_footerTextView, "topAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
    v49[2] = v34;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
    v14 = v5;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView bottomAnchor](self->_footerTextView, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
    v49[3] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

    v5 = v14;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITextView setBackgroundColor:](self->_footerTextView, "setBackgroundColor:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "defaultContentConfiguration"));
  v20 = -[NSAttributedString mutableCopy](self->_footerText, "mutableCopy");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "textProperties"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "font"));
  objc_msgSend(v20, "addAttribute:value:range:", NSFontAttributeName, v22, 0, objc_msgSend(v20, "length"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "textProperties"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "color"));
  objc_msgSend(v20, "addAttribute:value:range:", NSForegroundColorAttributeName, v24, 0, objc_msgSend(v20, "length"));

  -[UITextView setAttributedText:](self->_footerTextView, "setAttributedText:", v20);
  objc_msgSend(v19, "directionalLayoutMargins");
  v26 = v25;
  objc_msgSend(v5, "layoutMargins");
  v28 = v27;
  objc_msgSend(v19, "directionalLayoutMargins");
  v30 = v29;
  objc_msgSend(v5, "layoutMargins");
  v32 = v31;

  -[UITextView setTextContainerInset:](self->_footerTextView, "setTextContainerInset:", v26, v28, v30, v32);
  return v6;
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  NSBundle *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  if (-[NSArray count](self->_fonts, "count", a3))
  {
    v4 = 0;
  }
  else
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration searchConfiguration](UIContentUnavailableConfiguration, "searchConfiguration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
    v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(UITableView));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FONT_PICKER_SETTINGS_LINK_SHORT"), CFSTR("Manage Fonts"), CFSTR("Localizable")));
    objc_msgSend(v5, "setTitle:", v8);

    objc_msgSend(v14, "setSecondaryButton:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &stru_100091150));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "secondaryButtonProperties"));
    objc_msgSend(v10, "setPrimaryAction:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerSearchContentViewController tableView](self, "tableView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "backgroundColor"));
    objc_msgSend(v11, "setBackgroundColor:", v13);

    objc_msgSend(v14, "setBackground:", v11);
    v4 = v14;
  }
  v15 = v4;
  -[_UIFontPickerSearchContentViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v4);

}

- (id)contentUnavailableConfigurationState
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFontPickerSearchContentViewController;
  v3 = -[_UIFontPickerSearchContentViewController contentUnavailableConfigurationState](&v7, "contentUnavailableConfigurationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerSearchContentViewController searchTerm](self, "searchTerm"));
  objc_msgSend(v4, "setSearchText:", v5);

  return v4;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  if (!objc_msgSend(a4, "contentType", a3))
    sub_100068A58();
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_UIFontPickerViewControllerHost)delegate
{
  return (_UIFontPickerViewControllerHost *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
  objc_storeStrong((id *)&self->_searchTerm, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_footerTextView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_fonts, 0);
}

@end
