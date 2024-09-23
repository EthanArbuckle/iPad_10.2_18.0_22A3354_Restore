@implementation SRViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SRViewController;
  -[SRViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (id)preferredFocusEnvironments
{
  void *v2;
  id v3;
  objc_super v5;
  SRSiriViewController *siriVC;

  if (self->_siriVC)
  {
    siriVC = self->_siriVC;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &siriVC, 1));
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SRViewController;
    v3 = -[SRViewController preferredFocusEnvironments](&v5, "preferredFocusEnvironments");
    v2 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }
  return v2;
}

- (void)setUpViews
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000708B8;
  v2[3] = &unk_100122638;
  objc_copyWeak(&v3, &location);
  SiriUIInvokeOnMainQueue(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_cleanupAllViews
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100070BF8;
  v2[3] = &unk_100122638;
  objc_copyWeak(&v3, &location);
  SiriUIInvokeOnMainQueue(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)tearDownViews
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100070ED8;
  v2[3] = &unk_100122638;
  objc_copyWeak(&v3, &location);
  SiriUIInvokeOnMainQueue(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)didBecomeActiveHandler
{
  -[SRSiriViewController hostApplicationDidBecomeActive](self->_siriVC, "hostApplicationDidBecomeActive");
}

- (void)willResignActiveHandler
{
  -[SRSiriViewController hostApplicationWillResignActive](self->_siriVC, "hostApplicationWillResignActive");
}

- (void)willEnterForegroundHandler
{
  -[SRSiriViewController hostApplicationWillEnterForeground](self->_siriVC, "hostApplicationWillEnterForeground");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriVC, 0);
}

@end
