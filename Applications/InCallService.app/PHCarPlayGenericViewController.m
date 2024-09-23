@implementation PHCarPlayGenericViewController

- (PHCarPlayGenericViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PHCarPlayGenericViewController *v4;
  PHCarPlayGenericViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHCarPlayGenericViewController;
  v4 = -[PHCarPlayGenericViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[PHCarPlayGenericViewController setRespondsToEventsWhileInCall:](v4, "setRespondsToEventsWhileInCall:", 1);
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayGenericViewController;
  -[PHCarPlayGenericViewController viewDidLoad](&v4, "viewDidLoad");
  if (+[PHCarPlayUtilities activeInterfaceMechanismIsHardware](PHCarPlayUtilities, "activeInterfaceMechanismIsHardware"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v3, "setHidesBackButton:", 1);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHCarPlayGenericViewController;
  -[PHCarPlayGenericViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "hardwareControlEventNotification:", TUCarPlayHardwareControlEventNotification, 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHCarPlayGenericViewController;
  -[PHCarPlayGenericViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, TUCarPlayHardwareControlEventNotification, 0);

}

- (BOOL)viewIsInAppearedState
{
  return -[PHCarPlayGenericViewController _appearState](self, "_appearState") - 1 < 2;
}

- (BOOL)shouldRespondToHardwareControlEvent
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  if (objc_msgSend(v3, "currentAudioAndVideoCallCount"))
  {
    v4 = -[PHCarPlayGenericViewController respondsToEventsWhileInCall](self, "respondsToEventsWhileInCall");

    if ((v4 & 1) == 0)
      return 0;
  }
  else
  {

  }
  if (!-[PHCarPlayGenericViewController isViewLoaded](self, "isViewLoaded")
    || !-[PHCarPlayGenericViewController viewIsInAppearedState](self, "viewIsInAppearedState"))
  {
    return 0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericViewController presentedViewController](self, "presentedViewController"));
  v6 = v5 == 0;

  return v6;
}

- (BOOL)respondsToEventsWhileInCall
{
  return self->_respondsToEventsWhileInCall;
}

- (void)setRespondsToEventsWhileInCall:(BOOL)a3
{
  self->_respondsToEventsWhileInCall = a3;
}

@end
