@implementation _MPCMediaRemotePublisher_Swift

- (_MPCMediaRemotePublisher_Swift)initWithPublisher:(id)a3
{
  swift_unknownObjectRetain();
  return (_MPCMediaRemotePublisher_Swift *)_MediaRemotePublisher.init(_:)();
}

- (void)performSetQueueWithEvent:(MPSetPlaybackQueueCommandEvent *)a3 completion:(id)a4
{
  sub_210C71C50(self, (int)a2, a3, a4);
}

- (void)performSetSessionWithEvent:(MPSetPlaybackSessionCommandEvent *)a3 completion:(id)a4
{
  sub_210C71C50(self, (int)a2, a3, a4);
}

- (void)findContentItemIDWithIncomingContentItemID:(NSString *)a3 trackID:(int64_t)a4 completion:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSString *v10;
  _MPCMediaRemotePublisher_Swift *v11;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = self;
  sub_210C336D8((uint64_t)&unk_254A7DBA8, (uint64_t)v9);
}

- (id)getSwiftQOSDialogForError:(id)a3 withItem:(id)a4
{
  id v6;
  id v7;
  _MPCMediaRemotePublisher_Swift *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_210C72970((uint64_t)v6, v7);

  v9 = (void *)sub_210E92B00();
  swift_bridgeObjectRelease();
  return v9;
}

- (_MPCMediaRemotePublisher_Swift)init
{
  _MediaRemotePublisher.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
}

@end
