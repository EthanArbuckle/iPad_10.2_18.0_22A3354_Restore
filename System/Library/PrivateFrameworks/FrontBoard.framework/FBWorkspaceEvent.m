@implementation FBWorkspaceEvent

- (void)execute
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  FBWorkspaceEvent *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  FBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_1A359A000, v3, OS_LOG_TYPE_DEFAULT, "[FBWorkspaceEvent] Executing: %{public}@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)FBWorkspaceEvent;
  -[BSEventQueueEvent execute](&v4, sel_execute);
}

@end
