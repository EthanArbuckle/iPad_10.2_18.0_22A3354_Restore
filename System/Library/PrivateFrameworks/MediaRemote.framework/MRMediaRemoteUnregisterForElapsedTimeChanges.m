@implementation MRMediaRemoteUnregisterForElapsedTimeChanges

void __MRMediaRemoteUnregisterForElapsedTimeChanges_block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  if (__elapsedTimeChangeHandlerTokenIsValid)
  {
    notify_cancel(__elapsedTimeChangeHandlerToken);
    __elapsedTimeChangeHandlerTokenIsValid = 0;
    _MRLogForCategory(0);
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_193827000, v0, OS_LOG_TYPE_DEFAULT, "Unregistered for elapsed time changes.", v1, 2u);
    }

  }
}

@end
