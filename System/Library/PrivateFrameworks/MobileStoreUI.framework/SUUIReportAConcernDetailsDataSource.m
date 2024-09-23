@implementation SUUIReportAConcernDetailsDataSource

- (SUUIReportAConcernDetailsDataSource)init
{
  id v3;
  SUUIReportAConcernDetailsDataSource *v4;

  v3 = objc_alloc_init(MEMORY[0x24BEBD9F0]);
  v4 = -[SUUIReportAConcernDetailsDataSource initWithTableView:](self, "initWithTableView:", v3);

  return v4;
}

- (SUUIReportAConcernDetailsDataSource)initWithTableView:(id)a3
{
  id v5;
  SUUIReportAConcernDetailsDataSource *v6;
  SUUIReportAConcernDetailsDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIReportAConcernDetailsDataSource;
  v6 = -[SUUIReportAConcernDetailsDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tableView, a3);
    objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("SUUIConcernDetailsCell"));
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

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("SUUIConcernDetailsCell"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReportAConcernDetailsDataSource placeholder](self, "placeholder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaceholderText:", v6);

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[SUUIReportAConcernDetailsDataSource selectedReason](self, "selectedReason", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

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
