@implementation MIFileManagerCopyfileContext

- (BOOL)ignoreErrors
{
  return self->_ignoreErrors;
}

- (void)setIgnoreErrors:(BOOL)a3
{
  self->_ignoreErrors = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
