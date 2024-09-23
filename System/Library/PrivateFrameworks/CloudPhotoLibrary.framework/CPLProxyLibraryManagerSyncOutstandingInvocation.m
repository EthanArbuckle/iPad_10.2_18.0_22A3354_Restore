@implementation CPLProxyLibraryManagerSyncOutstandingInvocation

- (id)description
{
  const char *v2;

  if (self->_didFinish)
    v2 = " didFinish";
  else
    v2 = "";
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[outsanding%s]"), v2);
}

- (NSDictionary)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
  objc_storeStrong((id *)&self->_errors, a3);
}

- (BOOL)didFinish
{
  return self->_didFinish;
}

- (void)setDidFinish:(BOOL)a3
{
  self->_didFinish = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
}

@end
