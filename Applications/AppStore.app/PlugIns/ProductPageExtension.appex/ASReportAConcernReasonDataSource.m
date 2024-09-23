@implementation ASReportAConcernReasonDataSource

- (ASReportAConcernReasonDataSource)init
{
  id v3;
  ASReportAConcernReasonDataSource *v4;

  v3 = objc_alloc_init((Class)UITableView);
  v4 = -[ASReportAConcernReasonDataSource initWithTableView:](self, "initWithTableView:", v3);

  return v4;
}

- (ASReportAConcernReasonDataSource)initWithTableView:(id)a3
{
  id v5;
  ASReportAConcernReasonDataSource *v6;
  ASReportAConcernReasonDataSource *v7;
  uint64_t v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASReportAConcernReasonDataSource;
  v6 = -[ASReportAConcernReasonDataSource init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tableView, a3);
    objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell, v8), CFSTR("ASConcernReasonCell"));
  }

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernReasonDataSource reasons](self, "reasons", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
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

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernReasonDataSource reasons](self, "reasons"));
  v9 = objc_msgSend(v6, "row");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("ASConcernReasonCell")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
  objc_msgSend(v13, "setText:", v12);

  objc_msgSend(v11, "setAccessoryType:", 1);
  return v11;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)selectReasonTitle
{
  return self->_selectReasonTitle;
}

- (void)setSelectReasonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)selectReasonSubtitle
{
  return self->_selectReasonSubtitle;
}

- (void)setSelectReasonSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectReasonSubtitle, 0);
  objc_storeStrong((id *)&self->_selectReasonTitle, 0);
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
