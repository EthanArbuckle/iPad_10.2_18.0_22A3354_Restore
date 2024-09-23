@implementation IMParentalControlsService

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)disableService
{
  return self->_disableService;
}

- (void)dealloc
{
  objc_super v3;

  -[IMParentalControlsService setAllowlist:](self, "setAllowlist:", 0);
  -[IMParentalControlsService setName:](self, "setName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMParentalControlsService;
  -[IMParentalControlsService dealloc](&v3, sel_dealloc);
}

- (void)setDisableService:(BOOL)a3
{
  self->_disableService = a3;
}

- (BOOL)forceAllowlist
{
  return self->_forceAllowlist;
}

- (void)setForceAllowlist:(BOOL)a3
{
  self->_forceAllowlist = a3;
}

- (NSSet)allowlist
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAllowlist:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_allowlist, 0);
}

@end
