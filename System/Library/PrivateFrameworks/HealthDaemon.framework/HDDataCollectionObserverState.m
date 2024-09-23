@implementation HDDataCollectionObserverState

- (BOOL)isInBackground
{
  return self->_isInBackground;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[HDDataCollectionObserverState init](+[HDDataCollectionObserverState allocWithZone:](HDDataCollectionObserverState, "allocWithZone:", a3), "init");
  *((_BYTE *)result + 8) = self->_isInBackground;
  *((_BYTE *)result + 9) = self->_hasRunningWorkout;
  return result;
}

+ (id)dataCollectionObserverStateInBackground:(BOOL)a3 hasRunningWorkout:(BOOL)a4
{
  HDDataCollectionObserverState *v6;

  v6 = objc_alloc_init(HDDataCollectionObserverState);
  v6->_isInBackground = a3;
  v6->_hasRunningWorkout = a4;
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;

  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_isInBackground == v4[8] && self->_hasRunningWorkout == v4[9];

  return v5;
}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("YES");
  if (self->_isInBackground)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (!self->_hasRunningWorkout)
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(isInBackground=%@, hasRunningWorkout=%@)"), v3, v2);
}

- (BOOL)hasRunningWorkout
{
  return self->_hasRunningWorkout;
}

@end
