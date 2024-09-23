@implementation BKSMousePointerPerDisplayInfo

- (BSCompoundAssertion)pointerSuppressionAssertion
{
  return self->_pointerSuppressionAssertion;
}

- (void)setPointerSuppressionAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_pointerSuppressionAssertion, a3);
}

- (BSCompoundAssertion)globalEventsAssertion
{
  return self->_globalEventsAssertion;
}

- (void)setGlobalEventsAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_globalEventsAssertion, a3);
}

- (NSSet)previouslyRoutedContextIDs
{
  return self->_previouslyRoutedContextIDs;
}

- (void)setPreviouslyRoutedContextIDs:(id)a3
{
  objc_storeStrong((id *)&self->_previouslyRoutedContextIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslyRoutedContextIDs, 0);
  objc_storeStrong((id *)&self->_globalEventsAssertion, 0);
  objc_storeStrong((id *)&self->_pointerSuppressionAssertion, 0);
}

@end
