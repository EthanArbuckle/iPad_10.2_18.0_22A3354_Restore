@implementation ATThreadSafeHeadTrackerGetSharedInstance

uint64_t __ATThreadSafeHeadTrackerGetSharedInstance_block_invoke()
{
  double v0;
  double v1;
  NSObject *v2;
  float v3;
  ATThreadSafeHeadTracker *v4;
  double v5;
  uint64_t result;
  BOOL v7;
  uint8_t buf[4];
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  CACFPreferencesGetAppFloatValue(CFSTR("attsht_rate_limit"), CFSTR("com.apple.coreaudio"), &v7);
  if (v7)
    v1 = v0;
  else
    v1 = 200.0;
  ATThreadSafeHeadTrackerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = v1;
    _os_log_impl(&dword_1A0F4D000, v2, OS_LOG_TYPE_DEFAULT, "Creating shared ATTSHT with rate limit %0.2f", buf, 0xCu);
  }

  v4 = [ATThreadSafeHeadTracker alloc];
  v3 = v1;
  *(float *)&v5 = v3;
  result = -[ATThreadSafeHeadTracker initWithRateLimit:detectPredictionAnchor:userContext:factory:execution:finalizer:](v4, "initWithRateLimit:detectPredictionAnchor:userContext:factory:execution:finalizer:", 1, 0, 0, 0, 0, v5);
  ATThreadSafeHeadTrackerGetSharedInstance::sharedTracker = result;
  return result;
}

@end
