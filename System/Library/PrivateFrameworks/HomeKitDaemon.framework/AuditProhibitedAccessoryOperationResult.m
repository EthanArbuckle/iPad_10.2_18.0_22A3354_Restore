@implementation AuditProhibitedAccessoryOperationResult

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)shouldReschedule
{
  return self->_shouldReschedule;
}

- (void)setShouldReschedule:(BOOL)a3
{
  self->_shouldReschedule = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
