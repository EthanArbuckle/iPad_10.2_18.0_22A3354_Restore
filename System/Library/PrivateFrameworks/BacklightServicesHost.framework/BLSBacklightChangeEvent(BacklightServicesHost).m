@implementation BLSBacklightChangeEvent(BacklightServicesHost)

- (uint64_t)isAlwaysOnTransition
{
  uint64_t result;

  result = objc_msgSend(a1, "state");
  if (result != 1)
    return objc_msgSend(a1, "previousState") == 1;
  return result;
}

- (uint64_t)isTransitionForcedUnanimated
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v8;

  v2 = objc_msgSend(a1, "state");
  v3 = objc_msgSend(a1, "previousState");
  objc_msgSend(a1, "changeRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sourceEvent");

  v8 = v2 == 2 && v3 == 3 || v5 == 15;
  if (v5 == 7)
    v8 = 1;
  return v2 == v3 || v8;
}

- (BOOL)isEnvironmentTransitionAnimated
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  if ((objc_msgSend(a1, "isTransitionForcedUnanimated") & 1) != 0)
    return 0;
  v3 = objc_msgSend(a1, "state");
  v4 = objc_msgSend(a1, "previousState");
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  return !v5 && v3 != 3;
}

@end
