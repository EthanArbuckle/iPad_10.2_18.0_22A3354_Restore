@implementation CLServiceSessionDiagnostic

- (CLServiceSessionDiagnostic)initWithDiagnostics:(unint64_t)a3
{
  CLServiceSessionDiagnostic *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLServiceSessionDiagnostic;
  result = -[CLServiceSessionDiagnostic init](&v5, sel_init);
  if (result)
    result->_diagnostics = a3;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLServiceSessionDiagnostic;
  -[CLServiceSessionDiagnostic dealloc](&v2, sel_dealloc);
}

- (BOOL)authorizationDenied
{
  uint64_t v2;
  uint64_t v3;

  if ((objc_msgSend_authorizationDeniedGlobally(self, a2, v2, v3) & 1) != 0)
    return 1;
  else
    return self->_diagnostics & 1;
}

- (BOOL)authorizationDeniedGlobally
{
  return (LOBYTE(self->_diagnostics) >> 1) & 1;
}

- (BOOL)authorizationRestricted
{
  return (LOBYTE(self->_diagnostics) >> 2) & 1;
}

- (BOOL)insufficientlyInUse
{
  return (LOBYTE(self->_diagnostics) >> 4) & 1;
}

- (BOOL)serviceSessionRequired
{
  return (BYTE1(self->_diagnostics) >> 4) & 1;
}

- (BOOL)fullAccuracyDenied
{
  return (BYTE1(self->_diagnostics) >> 3) & 1;
}

- (BOOL)alwaysAuthorizationDenied
{
  return (BYTE1(self->_diagnostics) >> 2) & 1;
}

- (BOOL)authorizationRequestInProgress
{
  return (BYTE1(self->_diagnostics) >> 5) & 1;
}

@end
