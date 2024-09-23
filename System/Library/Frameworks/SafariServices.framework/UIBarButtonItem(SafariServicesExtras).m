@implementation UIBarButtonItem(SafariServicesExtras)

+ (double)_sf_longPressAllowableMovement
{
  return 32.0;
}

- (void)_sf_setTarget:()SafariServicesExtras touchDownAction:longPressAction:
{
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  +[SFBarButtonItemLongPressGestureRecognizer gestureRecognizerTarget:longPressAction:touchDownAction:attachedToBarButtonItem:](SFBarButtonItemLongPressGestureRecognizer, "gestureRecognizerTarget:longPressAction:touchDownAction:attachedToBarButtonItem:", a3, a5, a4, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setGestureRecognizers:", v7);

}

- (uint64_t)_sf_setTarget:()SafariServicesExtras longPressAction:
{
  return objc_msgSend(a1, "_sf_setTarget:touchDownAction:longPressAction:", a3, 0, a4);
}

+ (uint64_t)_sf_popoverDoneButtonItem
{
  return 0;
}

+ (uint64_t)_sf_popoverCancelButtonItem
{
  return 1;
}

- (uint64_t)_sf_longPressEnabled
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_gestureRecognizers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isEnabled");
  return v3;
}

- (void)_sf_setLongPressEnabled:()SafariServicesExtras
{
  void *v4;
  id v5;

  objc_msgSend(a1, "_gestureRecognizers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setEnabled:", a3);
}

- (void)_sf_test_simulateLongPressInvocation
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "_gestureRecognizers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v2 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_invokeLongPressAction");
    v2 = v3;
  }

}

@end
