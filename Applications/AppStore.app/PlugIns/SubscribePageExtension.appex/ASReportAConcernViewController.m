@implementation ASReportAConcernViewController

- (ASReportAConcernViewController)initWithConfiguration:(id)a3
{
  id v5;
  ASReportAConcernReasonViewController *v6;
  ASReportAConcernViewController *v7;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  id location;

  v5 = a3;
  objc_storeStrong((id *)&self->_configuration, a3);
  v6 = -[ASReportAConcernReasonViewController initWithConfiguration:]([ASReportAConcernReasonViewController alloc], "initWithConfiguration:", v5);
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100009074;
  v10[3] = &unk_10071FEF8;
  objc_copyWeak(&v11, &location);
  -[ASReportAConcernReasonViewController setCompletion:](v6, "setCompletion:", v10);
  v9.receiver = self;
  v9.super_class = (Class)ASReportAConcernViewController;
  v7 = -[ASReportAConcernViewController initWithRootViewController:](&v9, "initWithRootViewController:", v6);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (ASReportAConcernConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
