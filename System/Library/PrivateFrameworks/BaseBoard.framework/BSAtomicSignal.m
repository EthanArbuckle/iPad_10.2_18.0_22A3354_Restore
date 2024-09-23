@implementation BSAtomicSignal

- (BOOL)signal
{
  BOOL *p_flag;
  BOOL result;

  p_flag = &self->_flag;
  while (!__ldxr((unsigned __int8 *)p_flag))
  {
    result = 1;
    if (!__stxr(1u, (unsigned __int8 *)p_flag))
      return result;
  }
  result = 0;
  __clrex();
  return result;
}

- (BOOL)hasBeenSignalled
{
  BOOL *p_flag;
  int v3;
  BOOL result;

  p_flag = &self->_flag;
  while (1)
  {
    v3 = __ldxr((unsigned __int8 *)p_flag);
    if (v3 != 1)
      break;
    result = 1;
    if (!__stxr(1u, (unsigned __int8 *)p_flag))
      return result;
  }
  result = 0;
  __clrex();
  return result;
}

- (BSAtomicSignal)init
{
  BSAtomicSignal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BSAtomicSignal;
  result = -[BSAtomicSignal init](&v3, sel_init);
  if (result)
    atomic_store(0, (unsigned __int8 *)&result->_flag);
  return result;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BSAtomicSignal hasBeenSignalled](self, "hasBeenSignalled"), CFSTR("signalled"), 1);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
