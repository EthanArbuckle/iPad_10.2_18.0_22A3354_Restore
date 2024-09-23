@implementation UIButton(MUActivityObserving)

- (void)beginAnimatingActivityIndicator
{
  id v2;

  objc_msgSend(a1, "configuration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowsActivityIndicator:", 1);
  objc_msgSend(a1, "setConfiguration:", v2);

}

- (void)endAnimatingActivityIndicatorWithError:()MUActivityObserving
{
  id v2;

  objc_msgSend(a1, "configuration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowsActivityIndicator:", 0);
  objc_msgSend(a1, "setConfiguration:", v2);

}

@end
