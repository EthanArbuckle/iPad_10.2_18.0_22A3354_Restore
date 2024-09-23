@implementation CNContactSuggestionViewController

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CNContactSuggestionViewController;
  -[CNContactSuggestionViewController viewDidLoad](&v29, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 44.0);
  v5 = v4;
  -[CNContactSuggestionViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEstimatedRowHeight:", v5);

  CNContactsUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_REVIEW_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v8);

  -[CNContactSuggestionViewController contentLabel](self, "contentLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isNaturallyRTL"))
    v12 = 2;
  else
    v12 = 0;
  -[CNContactSuggestionViewController contentLabel](self, "contentLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextAlignment:", v12);

  -[CNContactSuggestionViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_cnui_applyContactStyle");

  -[CNContactSuggestionViewController withLabel](self, "withLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_cnui_applyContactStyle");

  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "textColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionViewController withLabel](self, "withLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v17);

  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "suggestedValueTextColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionViewController dateLabel](self, "dateLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTextColor:", v20);

  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "suggestedValueTextColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionViewController subjectLabel](self, "subjectLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTextColor:", v23);

  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "suggestedValueTextColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionViewController contentLabel](self, "contentLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTextColor:", v26);

  -[CNContactSuggestionViewController navigationItem](self, "navigationItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setLargeTitleDisplayMode:", 2);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNContactSuggestionViewController;
  -[CNContactSuggestionViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[CNContactSuggestionViewController addToContactButton](self, "addToContactButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tintColorOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionViewController addToContactButton](self, "addToContactButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v6);

  -[CNContactSuggestionViewController ignoreButton](self, "ignoreButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionViewController titleForIgnoreContactDetail](self, "titleForIgnoreContactDetail");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

}

- (void)setAction:(id)a3
{
  CNPropertySuggestionAction *v5;
  void *v6;
  CNPropertySuggestionAction *v7;

  v5 = (CNPropertySuggestionAction *)a3;
  if (self->_action != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_action, a3);
    -[CNContactSuggestionViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

    v5 = v7;
  }

}

- (BOOL)shouldShowPreview
{
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  -[CNContactSuggestionViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 5)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v6 = *MEMORY[0x1E0D13848];
    -[CNContactSuggestionViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formattedSnippet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v9))
    {
      -[CNContactSuggestionViewController dataSource](self, "dataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v11))
      {
        -[CNContactSuggestionViewController dataSource](self, "dataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v13))
        {
          -[CNContactSuggestionViewController dataSource](self, "dataSource");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "with");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v14) ^ 1;

        }
        else
        {
          LOBYTE(v5) = 1;
        }

      }
      else
      {
        LOBYTE(v5) = 1;
      }

    }
    else
    {
      LOBYTE(v5) = 1;
    }

  }
  return v5;
}

- (void)updatePreview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[CNContactSuggestionViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formattedSnippet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionViewController contentLabel](self, "contentLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

  -[CNContactSuggestionViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionViewController subjectLabel](self, "subjectLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[CNContactSuggestionViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionViewController dateLabel](self, "dateLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  -[CNContactSuggestionViewController dataSource](self, "dataSource");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "with");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionViewController withLabel](self, "withLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a4 != 1)
    goto LABEL_3;
  v5 = *MEMORY[0x1E0D13848];
  -[CNContactSuggestionViewController dataSource](self, "dataSource", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v7);

  if ((v5 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_RELATED_INFO_FROM_APP"), &stru_1E20507A8, CFSTR("Localized"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionViewController dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v11, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_3:
    v8 = 0;
  }
  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (-[CNContactSuggestionViewController shouldShowPreview](self, "shouldShowPreview", a3))
    return 2;
  else
    return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
    return 1;
  if (-[CNContactSuggestionViewController shouldShowAddRejectActions](self, "shouldShowAddRejectActions", a3, v4, v5))
    return 3;
  return 1;
}

- (BOOL)shouldShowAddRejectActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[CNContactSuggestionViewController action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSuggested"))
  {
    -[CNContactSuggestionViewController action](self, "action");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertyItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isSuggestedMe");

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  CNPropertyCell *v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section") || objc_msgSend(v7, "row"))
  {
    v10.receiver = self;
    v10.super_class = (Class)CNContactSuggestionViewController;
    -[CNContactSuggestionViewController tableView:cellForRowAtIndexPath:](&v10, sel_tableView_cellForRowAtIndexPath_, v6, v7);
    v8 = (CNPropertyCell *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "section") == 1)
      -[CNContactSuggestionViewController updatePreview](self, "updatePreview");
    -[UITableViewCell _cnui_applyContactStyle](v8, "_cnui_applyContactStyle");
  }
  else
  {
    v8 = self->_propertyCell;
  }

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "section") || objc_msgSend(v7, "row")) && objc_msgSend(v7, "section") != 1)
  {
    v11.receiver = self;
    v11.super_class = (Class)CNContactSuggestionViewController;
    -[CNContactSuggestionViewController tableView:heightForRowAtIndexPath:](&v11, sel_tableView_heightForRowAtIndexPath_, v6, v7);
    v8 = v9;
  }
  else
  {
    v8 = *MEMORY[0x1E0DC53D8];
  }

  return v8;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v4;
  BOOL v5;

  v4 = a4;
  v5 = !objc_msgSend(v4, "section") && !objc_msgSend(v4, "row") || objc_msgSend(v4, "section") == 1;

  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  id v27;

  v27 = a4;
  v7 = a5;
  if (!objc_msgSend(v7, "section") && objc_msgSend(v7, "row") == 1)
  {
    -[CNContactSuggestionViewController propertyCell](self, "propertyCell");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutMargins");
    v10 = v9;
    -[CNContactSuggestionViewController addToContactLeadingMargin](self, "addToContactLeadingMargin");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setConstant:", v10);

    -[CNContactSuggestionViewController propertyCell](self, "propertyCell");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutMargins");
    v14 = v13;
    -[CNContactSuggestionViewController addToContactTrailingMargin](self, "addToContactTrailingMargin");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v26 = v15;
    objc_msgSend(v15, "setConstant:", v14);

    goto LABEL_10;
  }
  if (!objc_msgSend(v7, "section") && objc_msgSend(v7, "row") == 2)
  {
    -[CNContactSuggestionViewController propertyCell](self, "propertyCell");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutMargins");
    v18 = v17;
    -[CNContactSuggestionViewController ignoreLeadingMargin](self, "ignoreLeadingMargin");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setConstant:", v18);

    -[CNContactSuggestionViewController propertyCell](self, "propertyCell");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutMargins");
    v14 = v20;
    -[CNContactSuggestionViewController ignoreTrailingMargin](self, "ignoreTrailingMargin");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "section") == 1)
  {
    objc_msgSend(v27, "setPreservesSuperviewLayoutMargins:", 0);
    -[CNContactSuggestionViewController propertyCell](self, "propertyCell");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layoutMargins");
    v23 = v22;
    -[CNContactSuggestionViewController fromLeadingMargin](self, "fromLeadingMargin");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setConstant:", v23);

    -[CNContactSuggestionViewController propertyCell](self, "propertyCell");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutMargins");
    v14 = v25;
    -[CNContactSuggestionViewController dateTrailingMargin](self, "dateTrailingMargin");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(v27, "_cnui_applyContactStyle");

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "section") && !objc_msgSend(v6, "row"))
  {
    objc_msgSend(v9, "cellForRowAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v8, "shouldPerformDefaultAction"))
      objc_msgSend(v8, "performDefaultAction");
    goto LABEL_6;
  }
  if (objc_msgSend(v6, "section") == 1)
  {
    -[CNContactSuggestionViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend((id)*MEMORY[0x1E0DC4730], "openURL:withCompletionHandler:", v8, 0);
LABEL_6:

  }
  objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactSuggestionViewController;
  -[CNContactSuggestionViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if ((-[CNContactSuggestionViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || -[CNContactSuggestionViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    -[CNContactSuggestionViewController setAction:](self, "setAction:", 0);
  }
}

- (void)addToContact:(id)a3
{
  id v3;

  -[CNContactSuggestionViewController action](self, "action", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectedChoice:", 1);

}

- (void)ignore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[CNContactSuggestionViewController titleForIgnoreContactDetail](self, "titleForIgnoreContactDetail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionViewController alertMessageForIgnoreContactDetail](self, "alertMessageForIgnoreContactDetail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMessage:", v7);

  v8 = (void *)MEMORY[0x1E0DC3448];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __44__CNContactSuggestionViewController_ignore___block_invoke;
  v17 = &unk_1E204CC50;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v8, "actionWithTitle:style:handler:", v5, 2, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9, v14, v15, v16, v17);

  v10 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v13);

  -[CNContactSuggestionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)showSource:(id)a3
{
  id v3;

  -[CNContactSuggestionViewController action](self, "action", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectedChoice:", 3);

}

- (id)titleForIgnoreContactDetail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;

  CNContactsUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_IGNORE_CONTACT_DETAIL_BUTTON_DETAIL"), &stru_1E20507A8, CFSTR("Localized"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactSuggestionViewController propertyCell](self, "propertyCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "group");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "property");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C967C0]);

  if (v9)
  {
    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("SUGGESTION_IGNORE_CONTACT_DETAIL_BUTTON_PHONE");
LABEL_9:
    objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1E20507A8, CFSTR("Localized"));
    v28 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v28;
    return v4;
  }
  -[CNContactSuggestionViewController propertyCell](self, "propertyCell");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "propertyItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "group");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "property");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0C966A8]);

  if (v17)
  {
    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("SUGGESTION_IGNORE_CONTACT_DETAIL_BUTTON_EMAIL");
    goto LABEL_9;
  }
  -[CNContactSuggestionViewController propertyCell](self, "propertyCell");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "propertyItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "group");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "property");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0C967F0]);

  if (v22)
  {
    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("SUGGESTION_IGNORE_CONTACT_DETAIL_BUTTON_ADDRESS");
    goto LABEL_9;
  }
  -[CNContactSuggestionViewController propertyCell](self, "propertyCell");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "propertyItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "group");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "property");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("birthdays"));

  if (v27)
  {
    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("SUGGESTION_IGNORE_CONTACT_DETAIL_BUTTON_BIRTHDAY");
    goto LABEL_9;
  }
  return v4;
}

- (id)alertMessageForIgnoreContactDetail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;

  CNContactsUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_IGNORE_ALERT_CONTROLLER_INFO_DETAIL"), &stru_1E20507A8, CFSTR("Localized"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactSuggestionViewController propertyCell](self, "propertyCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "group");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "property");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C967C0]);

  if (v9)
  {
    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("SUGGESTION_IGNORE_ALERT_CONTROLLER_INFO_DETAIL_PHONE");
LABEL_9:
    objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1E20507A8, CFSTR("Localized"));
    v28 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v28;
    return v4;
  }
  -[CNContactSuggestionViewController propertyCell](self, "propertyCell");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "propertyItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "group");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "property");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0C966A8]);

  if (v17)
  {
    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("SUGGESTION_IGNORE_ALERT_CONTROLLER_INFO_DETAIL_EMAIL");
    goto LABEL_9;
  }
  -[CNContactSuggestionViewController propertyCell](self, "propertyCell");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "propertyItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "group");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "property");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0C967F0]);

  if (v22)
  {
    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("SUGGESTION_IGNORE_ALERT_CONTROLLER_INFO_DETAIL_ADDRESS");
    goto LABEL_9;
  }
  -[CNContactSuggestionViewController propertyCell](self, "propertyCell");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "propertyItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "group");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "property");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("birthdays"));

  if (v27)
  {
    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("SUGGESTION_IGNORE_ALERT_CONTROLLER_INFO_DETAIL_BIRTHDAY");
    goto LABEL_9;
  }
  return v4;
}

- (CNPropertySuggestionAction)action
{
  return self->_action;
}

- (CNPropertyCell)propertyCell
{
  return self->_propertyCell;
}

- (void)setPropertyCell:(id)a3
{
  objc_storeStrong((id *)&self->_propertyCell, a3);
}

- (CNContactSuggestionViewControllerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (UILabel)withLabel
{
  return self->_withLabel;
}

- (void)setWithLabel:(id)a3
{
  objc_storeStrong((id *)&self->_withLabel, a3);
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateLabel, a3);
}

- (UILabel)subjectLabel
{
  return self->_subjectLabel;
}

- (void)setSubjectLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subjectLabel, a3);
}

- (UILabel)contentLabel
{
  return self->_contentLabel;
}

- (void)setContentLabel:(id)a3
{
  objc_storeStrong((id *)&self->_contentLabel, a3);
}

- (UIButton)addToContactButton
{
  return self->_addToContactButton;
}

- (void)setAddToContactButton:(id)a3
{
  objc_storeStrong((id *)&self->_addToContactButton, a3);
}

- (UIButton)ignoreButton
{
  return self->_ignoreButton;
}

- (void)setIgnoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_ignoreButton, a3);
}

- (NSLayoutConstraint)addToContactLeadingMargin
{
  return self->_addToContactLeadingMargin;
}

- (void)setAddToContactLeadingMargin:(id)a3
{
  objc_storeStrong((id *)&self->_addToContactLeadingMargin, a3);
}

- (NSLayoutConstraint)addToContactTrailingMargin
{
  return self->_addToContactTrailingMargin;
}

- (void)setAddToContactTrailingMargin:(id)a3
{
  objc_storeStrong((id *)&self->_addToContactTrailingMargin, a3);
}

- (NSLayoutConstraint)ignoreLeadingMargin
{
  return self->_ignoreLeadingMargin;
}

- (void)setIgnoreLeadingMargin:(id)a3
{
  objc_storeStrong((id *)&self->_ignoreLeadingMargin, a3);
}

- (NSLayoutConstraint)ignoreTrailingMargin
{
  return self->_ignoreTrailingMargin;
}

- (void)setIgnoreTrailingMargin:(id)a3
{
  objc_storeStrong((id *)&self->_ignoreTrailingMargin, a3);
}

- (NSLayoutConstraint)fromLeadingMargin
{
  return self->_fromLeadingMargin;
}

- (void)setFromLeadingMargin:(id)a3
{
  objc_storeStrong((id *)&self->_fromLeadingMargin, a3);
}

- (NSLayoutConstraint)dateTrailingMargin
{
  return self->_dateTrailingMargin;
}

- (void)setDateTrailingMargin:(id)a3
{
  objc_storeStrong((id *)&self->_dateTrailingMargin, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateTrailingMargin, 0);
  objc_storeStrong((id *)&self->_fromLeadingMargin, 0);
  objc_storeStrong((id *)&self->_ignoreTrailingMargin, 0);
  objc_storeStrong((id *)&self->_ignoreLeadingMargin, 0);
  objc_storeStrong((id *)&self->_addToContactTrailingMargin, 0);
  objc_storeStrong((id *)&self->_addToContactLeadingMargin, 0);
  objc_storeStrong((id *)&self->_ignoreButton, 0);
  objc_storeStrong((id *)&self->_addToContactButton, 0);
  objc_storeStrong((id *)&self->_contentLabel, 0);
  objc_storeStrong((id *)&self->_subjectLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_withLabel, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_propertyCell, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

void __44__CNContactSuggestionViewController_ignore___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "action");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSelectedChoice:", 2);

}

+ (id)viewControllerWithDataSource:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DC3CF8];
  v4 = a3;
  CNContactsUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storyboardWithName:bundle:", CFSTR("Suggestion"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "instantiateInitialViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setDataSource:", v4);
  return v7;
}

@end
