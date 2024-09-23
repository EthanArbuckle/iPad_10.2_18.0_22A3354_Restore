@implementation BSBlockSentinelSignalContext

- (BOOL)isFailed
{
  return self->_failed;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
}

- (id)context
{
  return self->_context;
}

+ (_WORD)failureContext
{
  _WORD *v0;

  v0 = objc_alloc_init((Class)objc_opt_self());
  if (v0)
    v0[4] = 257;
  return v0;
}

@end
