@implementation EKUIAvailabilityNavigationController

- (EKUIAvailabilityNavigationController)initWithRootViewController:(id)a3
{
  EKUIAvailabilityNavigationController *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKUIAvailabilityNavigationController;
  result = -[EKUIAvailabilityNavigationController initWithRootViewController:](&v4, sel_initWithRootViewController_, a3);
  if (result)
    result->_modalPresentationStyle = -2;
  return result;
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (BOOL)presentModally
{
  return 1;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  self->_modalPresentationStyle = a3;
}

- (int64_t)modalPresentationStyle
{
  void *v3;
  void *v4;
  BOOL IsCompact;

  -[EKUIAvailabilityNavigationController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v3))
  {
    -[EKUIAvailabilityNavigationController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    IsCompact = EKUICurrentHeightSizeClassIsCompact(v4);

    if (IsCompact)
      return 3;
  }
  else
  {

  }
  if (self->_modalPresentationStyle == -2)
    return 2;
  else
    return self->_modalPresentationStyle;
}

@end
