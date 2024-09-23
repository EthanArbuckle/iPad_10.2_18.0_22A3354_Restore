@implementation MPCPodcastsPlaybackIntentDataSource

- (void)getRemotePlaybackQueueFromIntent:(id)a3 destination:(int64_t)a4 completion:(id)a5
{
  void *v8;
  id v9;
  MPCPodcastsPlaybackIntentDataSource *v10;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = self;
  sub_210CE2FAC(v9, a4, (uint64_t)v10, (void (**)(_QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);

}

- (MPCPodcastsPlaybackIntentDataSource)init
{
  return (MPCPodcastsPlaybackIntentDataSource *)MPCPodcastsPlaybackIntentDataSource.init()();
}

@end
