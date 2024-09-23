@implementation MSVSonicAssertionObserver

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = os_log_create("com.apple.amp.MediaServices", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 134218242;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1A077D000, v7, OS_LOG_TYPE_ERROR, "[MSVSonicAssertion] RBSAssertion %p was invalidated error=%{public}@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("MSVSonicAssertionsWereInvalidatedNotification"), 0);

}

@end
