@implementation CSPosterSwitcherPresentationStatus

- (CSPosterSwitcherPresentationStatus)initWithState:(unint64_t)a3 notReadyReason:(unint64_t)a4
{
  CSPosterSwitcherPresentationStatus *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSPosterSwitcherPresentationStatus;
  result = -[CSPosterSwitcherPresentationStatus init](&v7, sel_init);
  if (result)
  {
    result->_state = a3;
    result->_notReadyReason = a4;
  }
  return result;
}

- (BOOL)shouldProvideNotReadyFeedback
{
  return !self->_state && ((self->_notReadyReason - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)notReadyReason
{
  return self->_notReadyReason;
}

@end
