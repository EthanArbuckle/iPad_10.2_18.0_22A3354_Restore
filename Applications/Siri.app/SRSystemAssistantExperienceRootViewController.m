@implementation SRSystemAssistantExperienceRootViewController

- (SRSystemAssistantExperienceRootViewController)initWithContainerView:(id)a3
{
  id v5;
  SRSystemAssistantExperienceRootViewController *v6;
  SRSystemAssistantExperienceRootViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRSystemAssistantExperienceRootViewController;
  v6 = -[SRSystemAssistantExperienceRootViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_containerView, a3);

  return v7;
}

- (void)loadView
{
  SiriSharedUISystemAssistantExperienceContainerView *containerView;
  void *v4;
  id v5;

  v5 = objc_msgSend(objc_alloc((Class)AFUITouchPassThroughView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  containerView = self->_containerView;
  objc_msgSend(v5, "bounds");
  -[SiriSharedUISystemAssistantExperienceContainerView setFrame:](containerView, "setFrame:");
  -[SiriSharedUISystemAssistantExperienceContainerView setAutoresizingMask:](self->_containerView, "setAutoresizingMask:", 18);
  objc_msgSend(v5, "addSubview:", self->_containerView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(v5, "setOpaque:", 0);
  -[SRSystemAssistantExperienceRootViewController setView:](self, "setView:", v5);

}

- (BOOL)_canShowWhileLocked
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SRUIFCachedPreferences sharedInstance](SRUIFCachedPreferences, "sharedInstance"));
  v3 = objc_msgSend(v2, "isSiriSafeForLockScreen");

  return v3;
}

- (SiriSharedUISystemAssistantExperienceContainerView)containerView
{
  return self->_containerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
