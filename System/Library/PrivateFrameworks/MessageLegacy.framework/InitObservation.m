@implementation InitObservation

void ___InitObservation_block_invoke()
{
  _observationQueue = (uint64_t)dispatch_queue_create("com.apple.message.MFContentProtectionObserver", 0);
  dispatch_async((dispatch_queue_t)_observationQueue, &__block_literal_global_42);
}

uint64_t ___InitObservation_block_invoke_2()
{
  uint64_t result;
  int out_token;

  if (MKBDeviceFormattedForContentProtection())
  {
    out_token = 0;
    notify_register_dispatch((const char *)*MEMORY[0x1E0D4E600], &out_token, (dispatch_queue_t)_observationQueue, &__block_literal_global_44);
    _beganObservingTime = CFAbsoluteTimeGetCurrent();
  }
  result = _KeyBagLockState();
  _contentProtectionState = result;
  return result;
}

void ___InitObservation_block_invoke_3()
{
  unsigned int v0;

  _lastNotificationTime = CFAbsoluteTimeGetCurrent();
  v0 = _KeyBagLockState();
  _NotifyObserversWithContentProtectionState(v0);
}

@end
