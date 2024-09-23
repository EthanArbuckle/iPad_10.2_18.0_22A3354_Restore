@implementation CDPUICustodianOSSelectionViewController

- (CDPUICustodianOSSelectionViewController)initWithViewModel:(id)a3 cdpContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  CDPUICustodianOSSelectionViewController *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "message");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)CDPUICustodianOSSelectionViewController;
  v11 = -[CDPTableViewController initWithTitle:subTitle:](&v14, sel_initWithTitle_subTitle_, v9, v10);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_viewModel, a3);
    objc_storeStrong((id *)&v11->_cdpContext, a4);
    -[CDPUICustodianOSSelectionViewModel icon](v11->_viewModel, "icon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPTableViewController setIcon:](v11, "setIcon:", v12);

    -[CDPTableViewController setTableViewStyle:](v11, "setTableViewStyle:", -[CDPUICustodianOSSelectionViewModel tableViewStyle](v11->_viewModel, "tableViewStyle"));
  }

  return v11;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDPUICustodianOSSelectionViewController;
  -[CDPUICustodianOSSelectionViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianOSSelectionViewController _makeViewAppearedEvent](self, "_makeViewAppearedEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:", v5);

}

- (id)_makeViewAppearedEvent
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_cdpContext, *MEMORY[0x24BE1A738], *MEMORY[0x24BE1A860]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianOSSelectionViewController _offersJoinedByComma](self, "_offersJoinedByComma");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE1A648]);

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  _BOOL8 v5;
  void *v6;
  int64_t v7;

  v5 = -[CDPUICustodianOSSelectionViewModel tableViewStyle](self->_viewModel, "tableViewStyle", a3, a4) == 2;
  -[CDPUICustodianOSSelectionViewModel options](self->_viewModel, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") - v5;

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a4;
  -[CDPTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("CDPOSCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, CFSTR("CDPOSCell"));
    objc_msgSend(v7, "setAccessoryType:", 1);
  }
  v8 = objc_msgSend(v5, "row");
  if (-[CDPUICustodianOSSelectionViewModel tableViewStyle](self->_viewModel, "tableViewStyle") == 2)
    ++v8;
  -[CDPUICustodianOSSelectionViewModel options](self->_viewModel, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  v13 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v7, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pointSize");
  objc_msgSend(v13, "systemFontOfSize:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v16);

  if (-[CDPUICustodianOSSelectionViewModel tableViewStyle](self->_viewModel, "tableViewStyle") == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray6Color");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v18);

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  if (-[CDPUICustodianOSSelectionViewModel tableViewStyle](self->_viewModel, "tableViewStyle", a3, a4) == 2)
  {
    -[CDPUICustodianOSSelectionViewModel options](self->_viewModel, "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void);
  id v11;

  v5 = objc_msgSend(a4, "row", a3);
  if (-[CDPUICustodianOSSelectionViewModel tableViewStyle](self->_viewModel, "tableViewStyle") == 2)
    ++v5;
  -[CDPUICustodianOSSelectionViewModel options](self->_viewModel, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianOSSelectionViewController _makeEventForEscapeOptionSelected:](self, "_makeEventForEscapeOptionSelected:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendEvent:", v8);

  objc_msgSend(v11, "escapeAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v11, "escapeAction");
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v10[2]();

  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double v5;
  void *v6;
  NSString *v7;

  if (objc_msgSend(a3, "style") == 2)
    v5 = 44.0;
  else
    v5 = 60.0;
  -[CDPUICustodianOSSelectionViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v7))
    v5 = *MEMORY[0x24BEBE770];

  return v5;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 60.0;
}

- (double)heightForFooterInTableView:(id)a3
{
  return 90.0;
}

- (id)viewForFooterInTableView:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BEBD978]);
  objc_msgSend(v4, "setAxis:", 1);
  objc_msgSend(v4, "setAlignment:", 3);
  objc_msgSend(v4, "setDistribution:", 3);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CDPUICustodianOSSelectionViewModel escapeOffers](self->_viewModel, "escapeOffers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "escapeOfferName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTitle:forState:", v11, 0);

        objc_msgSend(v10, "titleLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 17.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setFont:", v13);

        objc_msgSend(v10, "titleLabel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTextAlignment:", 1);

        objc_msgSend(v10, "addTarget:action:forControlEvents:", v9, sel_handleEscapeAction_, 64);
        objc_msgSend(v10, "sizeToFit");
        objc_msgSend(v4, "addArrangedSubview:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)_offersJoinedByComma
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianOSSelectionViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (_QWORD *)MEMORY[0x24BE1A880];
  }
  else
  {
    -[CDPUICustodianOSSelectionViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leftBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_6;
    v6 = (_QWORD *)MEMORY[0x24BE1A888];
  }
  objc_msgSend(v3, "addObject:", *v6);
LABEL_6:
  -[CDPUICustodianOSSelectionViewModel options](self->_viewModel, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __63__CDPUICustodianOSSelectionViewController__offersJoinedByComma__block_invoke;
  v21[3] = &unk_24C855120;
  v11 = v3;
  v22 = v11;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v21);

  -[CDPUICustodianOSSelectionViewModel escapeOffers](self->_viewModel, "escapeOffers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10;
  v17 = 3221225472;
  v18 = __63__CDPUICustodianOSSelectionViewController__offersJoinedByComma__block_invoke_2;
  v19 = &unk_24C8549C0;
  v13 = v11;
  v20 = v13;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v16);

  if (objc_msgSend(v13, "count", v16, v17, v18, v19))
  {
    objc_msgSend(v13, "aaf_arrayAsCommaSeperatedString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __63__CDPUICustodianOSSelectionViewController__offersJoinedByComma__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "titleTelemetryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "titleTelemetryKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __63__CDPUICustodianOSSelectionViewController__offersJoinedByComma__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "titleTelemetryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "titleTelemetryKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (id)_makeEventForEscapeOptionSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_cdpContext, *MEMORY[0x24BE1A660], *MEMORY[0x24BE1A860]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleTelemetryKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "titleTelemetryKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE1A658]);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
