@implementation CBTemperatureWarningViewController

- (void)viewDidLoad
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(10);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Temperature Warning screen loaded", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)CBTemperatureWarningViewController;
  -[CBTemperatureWarningViewController viewDidLoad](&v5, "viewDidLoad");
  -[CBTemperatureWarningViewController setupView](self, "setupView");
}

- (void)setupView
{
  -[CBTemperatureWarningViewController setupTableView](self, "setupTableView");
  -[CBTemperatureWarningViewController setupHeaderView](self, "setupHeaderView");
  -[CBTemperatureWarningViewController setupFooterView](self, "setupFooterView");
}

- (void)setupTableView
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = objc_alloc((Class)UITableView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBTemperatureWarningViewController view](self, "view"));
  objc_msgSend(v4, "frame");
  v5 = objc_msgSend(v3, "initWithFrame:style:", 1);
  -[CBTemperatureWarningViewController setTableView:](self, "setTableView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBTemperatureWarningViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBTemperatureWarningViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setDelegate:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBTemperatureWarningViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setDataSource:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBTemperatureWarningViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setAutoresizingMask:", 18);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBTemperatureWarningViewController tableView](self, "tableView"));
  objc_msgSend(v11, "setScrollEnabled:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBTemperatureWarningViewController tableView](self, "tableView"));
  objc_msgSend(v12, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell, v13), CFSTR("cellIdentifier"));

  v15 = (id)objc_claimAutoreleasedReturnValue(-[CBTemperatureWarningViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBTemperatureWarningViewController tableView](self, "tableView"));
  objc_msgSend(v15, "addSubview:", v14);

}

- (void)setupHeaderView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = objc_msgSend(objc_alloc((Class)BFFPaneHeaderView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v11, "setBackgroundColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
  objc_msgSend(v7, "setTextColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("TEMPERATURE"), &stru_1000769A0, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
  objc_msgSend(v10, "setText:", v9);

  -[CBTemperatureWarningViewController setSetupAssistantHeaderView:](self, "setSetupAssistantHeaderView:", v11);
}

- (void)setupFooterView
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;

  v3 = objc_alloc((Class)UIView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v5 = (unint64_t)objc_msgSend(v4, "userInterfaceIdiom");

  v6 = objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, 0.0, dbl_100055AB0[(v5 & 0xFFFFFFFFFFFFFFFBLL) == 1]);
  -[CBTemperatureWarningViewController setContainerFooterView:](self, "setContainerFooterView:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBThermalManager sharedInstance](CBThermalManager, "sharedInstance"));
  v8 = objc_msgSend(v7, "level");

  if ((uint64_t)v8 < 0)
    v9 = CFSTR("TemperatureCold");
  else
    v9 = CFSTR("TemperatureHot");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v9));
  v11 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBTemperatureWarningViewController view](self, "view"));
  objc_msgSend(v12, "frame");
  v14 = v13 * 0.5;
  objc_msgSend(v11, "frame");
  objc_msgSend(v11, "setCenter:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBTemperatureWarningViewController containerFooterView](self, "containerFooterView"));
  objc_msgSend(v15, "addSubview:", v11);

  v16 = objc_alloc((Class)UILabel);
  objc_msgSend(v11, "frame");
  v18 = v17 * 0.5 + 0.0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CBTemperatureWarningViewController view](self, "view"));
  objc_msgSend(v19, "frame");
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CBTemperatureWarningViewController containerFooterView](self, "containerFooterView"));
  objc_msgSend(v22, "frame");
  v23 = objc_msgSend(v16, "initWithFrame:", 0.0, v18, v21);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("THERMAL_ALERT_STRING")));
  v25 = CheckerBoardLogHandleForCategory(10);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v35 = 138412290;
    v36 = v24;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Localized thermal device string (%@)", (uint8_t *)&v35, 0xCu);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", v24, &stru_1000769A0, 0));
  objc_msgSend(v23, "setText:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v30 = (unint64_t)objc_msgSend(v29, "userInterfaceIdiom");

  v31 = 24.0;
  if ((v30 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v31 = 26.0;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _lightSystemFontOfSize:](UIFont, "_lightSystemFontOfSize:", v31));
  objc_msgSend(v23, "setFont:", v32);

  objc_msgSend(v23, "setAdjustsFontSizeToFitWidth:", 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v23, "setTextColor:", v33);

  objc_msgSend(v23, "setTextAlignment:", 1);
  objc_msgSend(v23, "setNumberOfLines:", 2);
  objc_msgSend(v23, "setLineBreakMode:", 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CBTemperatureWarningViewController containerFooterView](self, "containerFooterView"));
  objc_msgSend(v34, "addSubview:", v23);

}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  if (a4)
    return UITableViewAutomaticDimension;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBTemperatureWarningViewController setupAssistantHeaderView](self, "setupAssistantHeaderView"));
  objc_msgSend(v6, "frame");
  v9 = v8;

  objc_msgSend(v7, "sizeThatFits:", v9, 3.40282347e38);
  v4 = v10 + 50.0;

  return v4;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double v4;
  void *v5;
  double v6;

  if (a4)
    return UITableViewAutomaticDimension;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBTemperatureWarningViewController containerFooterView](self, "containerFooterView", a3));
  objc_msgSend(v5, "frame");
  v4 = v6;

  return v4;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a4)
    v6 = 0;
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBTemperatureWarningViewController setupAssistantHeaderView](self, "setupAssistantHeaderView", a3, v4, v5));
  return v6;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a4)
    v6 = 0;
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBTemperatureWarningViewController containerFooterView](self, "containerFooterView", a3, v4, v5));
  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("cellIdentifier"), a4);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (UIView)setupAssistantHeaderView
{
  return self->_setupAssistantHeaderView;
}

- (void)setSetupAssistantHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_setupAssistantHeaderView, a3);
}

- (UIView)containerFooterView
{
  return self->_containerFooterView;
}

- (void)setContainerFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_containerFooterView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerFooterView, 0);
  objc_storeStrong((id *)&self->_setupAssistantHeaderView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
