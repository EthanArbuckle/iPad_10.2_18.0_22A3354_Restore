@implementation ASReportAConcernDetailsDataSource

- (ASReportAConcernDetailsDataSource)init
{
  id v3;
  ASReportAConcernDetailsDataSource *v4;

  v3 = objc_alloc_init((Class)UITableView);
  v4 = -[ASReportAConcernDetailsDataSource initWithTableView:](self, "initWithTableView:", v3);

  return v4;
}

- (ASReportAConcernDetailsDataSource)initWithTableView:(id)a3
{
  id v5;
  ASReportAConcernDetailsDataSource *v6;
  ASReportAConcernDetailsDataSource *v7;
  uint64_t v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASReportAConcernDetailsDataSource;
  v6 = -[ASReportAConcernDetailsDataSource init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tableView, a3);
    objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(ASReportAConcernDetailsCell, v8), CFSTR("ASConcernDetailsCell"));
  }

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("ASConcernDetailsCell"), a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsDataSource placeholder](self, "placeholder"));
  objc_msgSend(v5, "setPlaceholderText:", v6);

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsDataSource selectedReason](self, "selectedReason", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uppercaseString"));

  return v5;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)selectedReason
{
  return self->_selectedReason;
}

- (void)setSelectedReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)privacyNote
{
  return self->_privacyNote;
}

- (void)setPrivacyNote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyNote, 0);
  objc_storeStrong((id *)&self->_selectedReason, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
