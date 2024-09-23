@implementation CSSlidingPresentationViewController

- (void)aggregateAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSSlidingPresentationViewController;
  -[CSPresentationViewController aggregateAppearance:](&v13, sel_aggregateAppearance_, v4);
  if (-[CSPresentationViewController isPresentingContent](self, "isPresentingContent"))
  {
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
    CSComponentTransitionInputsMake(0, (uint64_t)&v10, 0.0, 0.0, -202020.0, 0.0, 0.0);
    +[CSComponent slideableContent](CSComponent, "slideableContent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "priority:", 10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transitionModifiers:", 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v10;
    v9[1] = v11;
    v9[2] = v12;
    objc_msgSend(v7, "transitionInputs:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v8);

  }
}

- (void)aggregateBehavior:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSSlidingPresentationViewController;
  v3 = a3;
  -[CSPresentationViewController aggregateBehavior:](&v4, sel_aggregateBehavior_, v3);
  objc_msgSend(v3, "setNotificationBehavior:", 2, v4.receiver, v4.super_class);
  objc_msgSend(v3, "addRestrictedCapabilities:", 24);

}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSSlidingPresentationViewController;
  if (!-[CSPresentationViewController handleEvent:](&v7, sel_handleEvent_, v4)
    || (objc_msgSend(v4, "isConsumable") & 1) == 0)
  {
    if (objc_msgSend(v4, "type") != 27
      || !-[CSPresentationViewController isPresentingContent](self, "isPresentingContent"))
    {
      v5 = 0;
      goto LABEL_8;
    }
    -[CSPresentationViewController dismissPresentationAnimated:](self, "dismissPresentationAnimated:", 1);
  }
  v5 = objc_msgSend(v4, "isConsumable");
LABEL_8:

  return v5;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return objc_msgSend(a3, "type") == 27;
}

@end
