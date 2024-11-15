@implementation CalDatabaseIntegrityErrors

- (CalDatabaseIntegrityErrors)init
{
  CalDatabaseIntegrityErrors *v2;
  uint64_t v3;
  NSCountedSet *errors;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CalDatabaseIntegrityErrors;
  v2 = -[CalDatabaseIntegrityErrors init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    errors = v2->_errors;
    v2->_errors = (NSCountedSet *)v3;

  }
  return v2;
}

- (NSCountedSet)errors
{
  return self->_errors;
}

- (CalCalendarDatabaseIntegrityErrorReportingDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_errors, 0);
}

@end
