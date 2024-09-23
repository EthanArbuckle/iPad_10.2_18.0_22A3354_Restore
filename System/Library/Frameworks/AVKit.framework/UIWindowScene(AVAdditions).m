@implementation UIWindowScene(AVAdditions)

- (void)avkit_disableTouchCancellation:()AVAdditions forRotationActions:
{
  void (**v6)(_QWORD);
  NSObject *v7;
  const char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
    LOBYTE(a3) = objc_opt_respondsToSelector();
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "NO";
    v9 = 136315650;
    v10 = "-[UIWindowScene(AVAdditions) avkit_disableTouchCancellation:forRotationActions:]";
    v12 = "actuallyDisableTouchCancellation";
    v11 = 2080;
    if ((a3 & 1) != 0)
      v8 = "YES";
    v13 = 2080;
    v14 = v8;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v9, 0x20u);
  }

  if ((a3 & 1) != 0)
  {
    objc_msgSend(a1, "_disableTouchCancellationOnRotation");

  }
  v6[2](v6);

}

+ (uint64_t)avkit_supportsInteractiveCounterRotationDismissals
{
  return objc_msgSend(a1, "instancesRespondToSelector:", sel__disableTouchCancellationOnRotation);
}

@end
