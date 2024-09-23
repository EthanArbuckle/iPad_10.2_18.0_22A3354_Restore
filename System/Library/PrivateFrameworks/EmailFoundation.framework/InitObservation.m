@implementation InitObservation

id ___InitObservation_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.message.EFContentProtectionObserver", 0);
  v1 = (void *)_observationQueue;
  _observationQueue = (uint64_t)v0;

  dispatch_async((dispatch_queue_t)_observationQueue, &__block_literal_global_64);
  return EFLogRegisterStateCaptureBlock((void *)_observationQueue, CFSTR("EFContentProtectionObserver"), 4, &__block_literal_global_71);
}

void ___InitObservation_block_invoke_2()
{
  NSObject *v0;
  const __CFString *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (MKBDeviceFormattedForContentProtection())
  {
    v2 = -1431655766;
    notify_register_dispatch((const char *)*MEMORY[0x1E0D4E600], &v2, (dispatch_queue_t)_observationQueue, &__block_literal_global_66);
    _beganObservingTime = CFAbsoluteTimeGetCurrent();
  }
  sContentProtectionState = _KeyBagLockState();
  _Log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(sContentProtectionState + 1) > 4)
      v1 = CFSTR("unknown");
    else
      v1 = off_1E62A5C90[sContentProtectionState + 1];
    v2 = 138543362;
    v3 = v1;
    _os_log_impl(&dword_1B106E000, v0, OS_LOG_TYPE_DEFAULT, "Keybag lock status initialized to %{public}@", (uint8_t *)&v2, 0xCu);
  }

}

void ___InitObservation_block_invoke_3()
{
  NSObject *v0;
  unint64_t v1;
  uint8_t v2[16];

  _Log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1B106E000, v0, OS_LOG_TYPE_DEFAULT, "Keybag lock status has changed", v2, 2u);
  }

  _lastNotificationTime = CFAbsoluteTimeGetCurrent();
  v1 = _KeyBagLockState();
  _NotifyObserversWithContentProtectionState(v1);
}

@end
