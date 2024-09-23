@implementation CLUpdate

- (CLUpdate)initWithLocation:(id)a3 diagnostics:(unint64_t)a4
{
  CLUpdate *v6;
  CLLocation *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLUpdate;
  v6 = -[CLUpdate init](&v9, sel_init);
  if (v6)
  {
    v7 = (CLLocation *)a3;
    v6->_diagnostics = a4;
    v6->_location = v7;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLUpdate;
  -[CLUpdate dealloc](&v3, sel_dealloc);
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

- (BOOL)stationary
{
  return (LOBYTE(self->_diagnostics) >> 3) & 1;
}

- (BOOL)isStationary
{
  return ((uint64_t (*)(CLUpdate *, char *))MEMORY[0x1E0DE7D20])(self, sel_stationary);
}

- (BOOL)insufficientlyInUse
{
  return (LOBYTE(self->_diagnostics) >> 4) & 1;
}

- (BOOL)locationUnavailable
{
  return (LOBYTE(self->_diagnostics) >> 5) & 1;
}

- (BOOL)accuracyLimited
{
  return (LOBYTE(self->_diagnostics) >> 6) & 1;
}

- (BOOL)serviceSessionRequired
{
  return (BYTE1(self->_diagnostics) >> 4) & 1;
}

- (BOOL)authorizationRequestInProgress
{
  return (BYTE1(self->_diagnostics) >> 5) & 1;
}

- (CLLocation)location
{
  return self->_location;
}

@end
