@implementation FBWorkspaceEventQueueLock

- (FBWorkspaceEventQueueLock)initWithReason:(id)a3
{
  id v4;
  void *v5;
  FBWorkspaceEventQueueLock *v6;

  v4 = a3;
  +[FBWorkspaceEventQueue sharedInstance](FBWorkspaceEventQueue, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BSEventQueueLock initWithEventQueue:reason:](self, "initWithEventQueue:reason:", v5, v4);

  return v6;
}

@end
