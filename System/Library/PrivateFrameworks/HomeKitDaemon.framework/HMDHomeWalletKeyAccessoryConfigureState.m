@implementation HMDHomeWalletKeyAccessoryConfigureState

- (BOOL)readerKeyConfigureInProgress
{
  return self->_readerKeyConfigureInProgress;
}

- (void)setReaderKeyConfigureInProgress:(BOOL)a3
{
  self->_readerKeyConfigureInProgress = a3;
}

- (BOOL)readerKeyConfigured
{
  return self->_readerKeyConfigured;
}

- (void)setReaderKeyConfigured:(BOOL)a3
{
  self->_readerKeyConfigured = a3;
}

- (BOOL)shouldRetryReaderKeyConfigureOnFailure
{
  return self->_shouldRetryReaderKeyConfigureOnFailure;
}

- (void)setShouldRetryReaderKeyConfigureOnFailure:(BOOL)a3
{
  self->_shouldRetryReaderKeyConfigureOnFailure = a3;
}

@end
