@implementation AMSSignInContext

- (AMSSignInContext)init
{
  AMSSignInContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSSignInContext;
  result = -[AMSSignInContext init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_canMakeAccountActive = 257;
  return result;
}

- (NSString)hashedDescription
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (-[AMSSignInContext canMakeAccountActive](self, "canMakeAccountActive"))
    v5 = CFSTR("true");
  else
    v5 = CFSTR("false");
  -[AMSSignInContext debugReason](self, "debugReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AMSSignInContext ignoreAccountConversion](self, "ignoreAccountConversion"))
    v7 = CFSTR("true");
  else
    v7 = CFSTR("false");
  if (-[AMSSignInContext skipAuthentication](self, "skipAuthentication"))
    v8 = CFSTR("true");
  else
    v8 = CFSTR("false");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p canMakeAccountActive = %@ | debugReason = %@ | ignoreAccountConversion = %@ | skipAuthentication = %@>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)canMakeAccountActive
{
  return self->_canMakeAccountActive;
}

- (void)setCanMakeAccountActive:(BOOL)a3
{
  self->_canMakeAccountActive = a3;
}

- (NSString)debugReason
{
  return self->_debugReason;
}

- (void)setDebugReason:(id)a3
{
  objc_storeStrong((id *)&self->_debugReason, a3);
}

- (BOOL)ignoreAccountConversion
{
  return self->_ignoreAccountConversion;
}

- (void)setIgnoreAccountConversion:(BOOL)a3
{
  self->_ignoreAccountConversion = a3;
}

- (BOOL)skipAuthentication
{
  return self->_skipAuthentication;
}

- (void)setSkipAuthentication:(BOOL)a3
{
  self->_skipAuthentication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugReason, 0);
}

@end
