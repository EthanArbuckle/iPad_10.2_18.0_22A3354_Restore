@implementation MPCSonicQueueFeeder_Swift

- (MPCSonicQueueFeeder_Swift)initWithQueueFeeder:(id)a3
{
  return (MPCSonicQueueFeeder_Swift *)sub_210C972F0(a3);
}

- (void)dealloc
{
  MPCSonicQueueFeeder_Swift *v2;

  v2 = self;
  sub_210C974DC();
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR___MPCSonicQueueFeeder_Swift__storage);
}

- (id)identifiersForContentID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  MPCSonicQueueFeeder_Swift *v7;
  void *v8;
  void *v9;

  v4 = sub_210E92BA8();
  v6 = v5;
  v7 = self;
  sub_210C975F0(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease();
  return v9;
}

- (BOOL)supportsAutoPlayForContentID:(id)a3
{
  BOOL result;

  sub_210C9881C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_210C97F20);
  return result;
}

- (BOOL)shouldUsePlaceholderForContentID:(id)a3
{
  sub_210E92BA8();
  swift_bridgeObjectRelease();
  return 0;
}

- (BOOL)shouldShuffleExcludeContentID:(id)a3
{
  BOOL result;

  sub_210C9881C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_210C987A4);
  return result;
}

- (id)genericModelObjectForContentID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MPCSonicQueueFeeder_Swift *v8;
  void *v9;

  v5 = sub_210E92BA8();
  v7 = v6;
  v8 = self;
  v9 = (void *)sub_210C98870(v5, v7);
  swift_bridgeObjectRelease();

  return v9;
}

- (void)loadWithContext:(MPCModelPlaybackContext *)a3 completion:(id)a4
{
  void *v6;
  _QWORD *v7;
  MPCModelPlaybackContext *v8;
  MPCSonicQueueFeeder_Swift *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_210C336D8((uint64_t)&unk_254A7E898, (uint64_t)v7);
}

- (void)reloadSection:(MPMutableIdentifierListSection *)a3 completion:(id)a4
{
  void *v6;
  _QWORD *v7;
  MPCSonicQueueFeeder_Swift *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain();
  v8 = self;
  sub_210C336D8((uint64_t)&unk_254A7E840, (uint64_t)v7);
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  id v6;
  id v7;
  MPCSonicQueueFeeder_Swift *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_210C9AFBC((uint64_t)v8, v7);

  return v9;
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  void *v6;
  id v7;
  MPCSonicQueueFeeder_Swift *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_210C9B664(v7, v8, (void (**)(_QWORD))v6);
  _Block_release(v6);

}

- (MPCSonicQueueFeeder_Swift)init
{
  MPCSonicQueueFeeder_Swift.init()();
}

@end
