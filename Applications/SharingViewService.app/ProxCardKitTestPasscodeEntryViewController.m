@implementation ProxCardKitTestPasscodeEntryViewController

- (ProxCardKitTestPasscodeEntryViewController)initWithContentView:(id)a3
{
  ProxCardKitTestPasscodeEntryViewController *v3;
  ProxCardKitTestPasscodeEntryViewController *v4;
  ProxCardKitTestPasscodeEntryViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ProxCardKitTestPasscodeEntryViewController;
  v3 = -[ProxCardKitTestPasscodeEntryViewController initWithContentView:](&v7, "initWithContentView:", a3);
  v4 = v3;
  if (v3)
  {
    -[ProxCardKitTestPasscodeEntryViewController setTitle:](v3, "setTitle:", CFSTR("Enter PIN"));
    -[ProxCardKitTestPasscodeEntryViewController setSubtitle:](v4, "setSubtitle:", CFSTR("Enter your four-digit PIN"));
    -[ProxCardKitTestPasscodeEntryViewController setDismissalType:](v4, "setDismissalType:", 1);
    v5 = v4;
  }

  return v4;
}

- (void)didCompleteTextEntry:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  -[ProxCardKitTestPasscodeEntryViewController showActivityIndicatorWithStatus:](self, "showActivityIndicatorWithStatus:", CFSTR("Waiting"));
  v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001096C4;
  block[3] = &unk_10017E1F0;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

@end
