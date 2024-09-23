@implementation SUUIReportAConcernViewController

- (SUUIReportAConcernViewController)initWithConfiguration:(id)a3
{
  id v4;
  SUUIReportAConcernReasonViewController *v5;
  SUUIReportAConcernViewController *v6;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  v5 = -[SUUIReportAConcernReasonViewController initWithConfiguration:]([SUUIReportAConcernReasonViewController alloc], "initWithConfiguration:", v4);
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__SUUIReportAConcernViewController_initWithConfiguration___block_invoke;
  v9[3] = &unk_2511FD900;
  objc_copyWeak(&v10, &location);
  -[SUUIReportAConcernReasonViewController setCompletion:](v5, "setCompletion:", v9);
  v8.receiver = self;
  v8.super_class = (Class)SUUIReportAConcernViewController;
  v6 = -[SUUIReportAConcernViewController initWithRootViewController:](&v8, sel_initWithRootViewController_, v5);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

void __58__SUUIReportAConcernViewController_initWithConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_63);

}

void __58__SUUIReportAConcernViewController_initWithConfiguration___block_invoke_2()
{
  void *v0;
  void *v1;
  SUUIToastViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SUUIToastViewController *v7;
  id v8;

  v0 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("toast-exclamation"), v1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v2 = [SUUIToastViewController alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TOAST_CONCERN_REPORTED_PRIMARY"), &stru_2511FF0C8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TOAST_CONCERN_REPORTED_SECONDARY"), &stru_2511FF0C8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUUIToastViewController initWithTitle:description:image:](v2, "initWithTitle:description:image:", v4, v6, v8);

  -[SUUIToastViewController present](v7, "present");
}

@end
