@implementation HMMTRProtocolMappingState

- (BOOL)shouldIgnoreSingleMultiPressComplete
{
  return self->_shouldIgnoreSingleMultiPressComplete;
}

- (void)setShouldIgnoreSingleMultiPressComplete:(BOOL)a3
{
  self->_shouldIgnoreSingleMultiPressComplete = a3;
}

@end
