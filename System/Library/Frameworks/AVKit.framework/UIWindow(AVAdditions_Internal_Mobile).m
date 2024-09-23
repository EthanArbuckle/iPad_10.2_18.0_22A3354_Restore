@implementation UIWindow(AVAdditions_Internal_Mobile)

- (uint64_t)avkit_isHostedInAnotherProcess
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "_isHostedInAnotherProcess");
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (uint64_t)avkit_preferredInterfaceOrientationFromDeviceOrientation
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;

  v2 = objc_msgSend(a1, "_windowInterfaceOrientation");
  if (objc_msgSend(a1, "avkit_canAttemptRotation"))
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "orientation");
    if ((unint64_t)(v4 - 3) >= 2)
    {
      if (v4 == 2)
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "userInterfaceIdiom");

        if (v7 != 1)
          return v2;
        goto LABEL_6;
      }
      if (v4 != 1)
      {
LABEL_7:

        return v2;
      }
    }

LABEL_6:
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "orientation");
    goto LABEL_7;
  }
  return v2;
}

- (uint64_t)avkit_canAttemptRotation
{
  uint64_t result;

  result = objc_msgSend(a1, "autorotates");
  if ((_DWORD)result)
    return objc_msgSend(a1, "avkit_canAttemptSecondWindowForRotability");
  return result;
}

- (uint64_t)avkit_canAttemptSecondWindowForRotability
{
  void *v1;
  char v3;
  uint64_t v4;
  uint64_t result;

  v3 = objc_msgSend(a1, "_windowOwnsInterfaceOrientation");
  if ((v3 & 1) == 0)
  {
    objc_msgSend(a1, "windowScene");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v1, "_canDynamicallySpecifySupportedInterfaceOrientations"))
    {
      v4 = 0;
      goto LABEL_10;
    }
  }
  if (objc_msgSend(a1, "_windowControlsStatusBarOrientation")
    && objc_msgSend(a1, "_shouldControlAutorotation"))
  {
    v4 = objc_msgSend(a1, "avkit_isHostedInAnotherProcess") ^ 1;
    result = v4;
    if ((v3 & 1) != 0)
      return result;
LABEL_10:

    return v4;
  }
  v4 = 0;
  result = 0;
  if ((v3 & 1) == 0)
    goto LABEL_10;
  return result;
}

- (uint64_t)avkit_supportsAutorotationForInterfaceOrientationMask:()AVAdditions_Internal_Mobile
{
  uint64_t result;
  uint64_t v6;

  result = objc_msgSend(a1, "avkit_canAttemptRotation");
  if ((_DWORD)result)
  {
    v6 = 1;
    while (1)
    {
      if (((1 << v6) & a3) != 0)
      {
        result = objc_msgSend(a1, "_shouldAutorotateToInterfaceOrientation:", v6);
        if (!(_DWORD)result)
          break;
      }
      if (++v6 == 6)
        return 1;
    }
  }
  return result;
}

@end
