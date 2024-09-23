@implementation ASReportAConcernDetailsViewController

- (ASReportAConcernDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ASReportAConcernConfiguration *v5;
  ASReportAConcernDetailsViewController *v6;

  v5 = objc_alloc_init(ASReportAConcernConfiguration);
  v6 = -[ASReportAConcernDetailsViewController initWithConfiguration:](self, "initWithConfiguration:", v5);

  return v6;
}

- (ASReportAConcernDetailsViewController)initWithCoder:(id)a3
{
  ASReportAConcernConfiguration *v4;
  ASReportAConcernDetailsViewController *v5;

  v4 = objc_alloc_init(ASReportAConcernConfiguration);
  v5 = -[ASReportAConcernDetailsViewController initWithConfiguration:](self, "initWithConfiguration:", v4);

  return v5;
}

- (ASReportAConcernDetailsViewController)initWithConfiguration:(id)a3
{
  id v5;
  ASReportAConcernDetailsViewController *v6;
  ASReportAConcernDetailsViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASReportAConcernDetailsViewController;
  v6 = -[ASReportAConcernDetailsViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, "_keyboardWillShow:", UIKeyboardWillShowNotification, 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, "_keyboardWillHide:", UIKeyboardWillHideNotification, 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, UIKeyboardWillHideNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)ASReportAConcernDetailsViewController;
  -[ASReportAConcernDetailsViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  ASReportAConcernDetailsDataSource *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ASReportAConcernDetailsViewController;
  -[ASReportAConcernDetailsViewController viewDidLoad](&v19, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  -[ASReportAConcernDetailsViewController setTitle:](self, "setTitle:", v4);

  v5 = objc_alloc((Class)UIBarButtonItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController configuration](self, "configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "submitTitle"));
  v8 = objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 2, self, "submitPressed:");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

  v10 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v10, "setAllowsSelection:", 0);
  objc_msgSend(v10, "setDelegate:", self);
  v11 = -[ASReportAConcernDetailsDataSource initWithTableView:]([ASReportAConcernDetailsDataSource alloc], "initWithTableView:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController configuration](self, "configuration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reportConcernExplanation"));
  -[ASReportAConcernDetailsDataSource setPlaceholder:](v11, "setPlaceholder:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController selectedReason](self, "selectedReason"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uppercaseName"));
  -[ASReportAConcernDetailsDataSource setSelectedReason:](v11, "setSelectedReason:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController configuration](self, "configuration"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "privacyNote"));
  -[ASReportAConcernDetailsDataSource setPrivacyNote:](v11, "setPrivacyNote:", v17);

  objc_msgSend(v10, "setDataSource:", v11);
  -[ASReportAConcernDetailsViewController setDataSource:](self, "setDataSource:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController view](self, "view"));
  objc_msgSend(v18, "addSubview:", v10);

  -[ASReportAConcernDetailsViewController setTableView:](self, "setTableView:", v10);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ASReportAConcernDetailsViewController;
  -[ASReportAConcernDetailsViewController viewWillLayoutSubviews](&v13, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController tableView](self, "tableView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)submitPressed:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "setEnabled:", 0);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController _detailsCell](self, "_detailsCell"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textView"));
  objc_msgSend(v4, "resignFirstResponder");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController completion](self, "completion"));
  if (v5)
  {
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController completion](self, "completion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController selectedReason](self, "selectedReason"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
    ((void (**)(_QWORD, void *, void *))v6)[2](v6, v7, v8);

  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  -[ASReportAConcernDetailsViewController _detailsCellHeight](self, "_detailsCellHeight", a3, a4);
  return result;
}

- (id)_detailsCell
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController tableView](self, "tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cellForRowAtIndexPath:", v3));

  return v4;
}

- (double)_detailsCellHeight
{
  void *v3;
  double Height;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "safeAreaLayoutGuide"));
  objc_msgSend(v6, "layoutFrame");
  v8 = Height - v7;
  -[ASReportAConcernDetailsViewController keyboardOverlapHeight](self, "keyboardOverlapHeight");
  v10 = v8 - v9;

  return fmax(fmin(v10, 250.0), 0.0);
}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double MaxY;
  void *v25;
  float v26;
  double v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[9];
  CGRect v40;
  CGRect v41;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController view](self, "view"));
  objc_msgSend(v15, "bounds");
  objc_msgSend(v14, "convertRect:toView:", 0);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v40.origin.x = v17;
  v40.origin.y = v19;
  v40.size.width = v21;
  v40.size.height = v23;
  MaxY = CGRectGetMaxY(v40);
  v41.origin.x = v7;
  v41.origin.y = v9;
  v41.size.width = v11;
  v41.size.height = v13;
  -[ASReportAConcernDetailsViewController setKeyboardOverlapHeight:](self, "setKeyboardOverlapHeight:", fmax(MaxY - CGRectGetMinY(v41), 0.0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", UIKeyboardAnimationDurationUserInfoKey));
  objc_msgSend(v25, "floatValue");
  v27 = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", UIKeyboardAnimationCurveUserInfoKey));
  v29 = objc_msgSend(v28, "integerValue");

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController tableView](self, "tableView"));
  objc_msgSend(v30, "contentInset");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10000B958;
  v39[3] = &unk_100720008;
  v39[4] = self;
  v39[5] = v32;
  v39[6] = v34;
  v39[7] = v36;
  v39[8] = v38;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v29, v39, &stru_100720048, v27, 0.0);

}

- (void)_keyboardWillHide:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[9];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", UIKeyboardAnimationDurationUserInfoKey));
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", UIKeyboardAnimationCurveUserInfoKey));
  v9 = objc_msgSend(v8, "integerValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsViewController tableView](self, "tableView"));
  objc_msgSend(v10, "contentInset");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[ASReportAConcernDetailsViewController setKeyboardOverlapHeight:](self, "setKeyboardOverlapHeight:", 0.0);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000BC14;
  v19[3] = &unk_100720008;
  v19[4] = self;
  v19[5] = v12;
  v19[6] = v14;
  v19[7] = v16;
  v19[8] = v18;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v9, v19, 0, v7, 0.0);

}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ASReportAConcernReason)selectedReason
{
  return self->_selectedReason;
}

- (void)setSelectedReason:(id)a3
{
  objc_storeStrong((id *)&self->_selectedReason, a3);
}

- (ASReportAConcernConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (ASReportAConcernDetailsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (double)keyboardOverlapHeight
{
  return self->_keyboardOverlapHeight;
}

- (void)setKeyboardOverlapHeight:(double)a3
{
  self->_keyboardOverlapHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_selectedReason, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
