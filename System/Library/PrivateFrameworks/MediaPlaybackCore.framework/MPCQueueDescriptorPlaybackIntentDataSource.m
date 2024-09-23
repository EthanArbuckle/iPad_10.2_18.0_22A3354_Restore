@implementation MPCQueueDescriptorPlaybackIntentDataSource

- (void)_getPlaybackContextForIntent:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  void *v7;
  id v8;

  v5 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(a3, "tracklistToken");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playbackContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v7, 0);

}

@end
