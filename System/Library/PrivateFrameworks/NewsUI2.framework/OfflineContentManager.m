@implementation OfflineContentManager

- (_TtC7NewsUI221OfflineContentManager)init
{
  _TtC7NewsUI221OfflineContentManager *result;

  result = (_TtC7NewsUI221OfflineContentManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();

  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI221OfflineContentManager____lazy_storage___requestProcessingThrottler));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (NSSet)readableArticleIDs
{
  _TtC7NewsUI221OfflineContentManager *v2;
  void *v3;
  uint64_t v5;

  v2 = self;
  swift_retain();
  sub_1D6E1A1F8();
  swift_release();
  sub_1D6BA4870(v5);

  v3 = (void *)sub_1D6E2702C();
  swift_release();
  return (NSSet *)v3;
}

- (NSSet)listenableArticleIDs
{
  _TtC7NewsUI221OfflineContentManager *v2;
  void *v3;

  v2 = self;
  sub_1D6BA2938();

  v3 = (void *)sub_1D6E2702C();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (void)downloadProgressedForRequest:(id)a3 contentArchive:(id)a4
{
  id v6;
  id v7;
  _TtC7NewsUI221OfflineContentManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D6BA2B48(v6, v7);

}

- (void)downloadProgressedForRequest:(id)a3 progress:(double)a4
{
  uint64_t v7;
  id v8;
  _TtC7NewsUI221OfflineContentManager *v9;
  id v10;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = self;
  *(_QWORD *)(v7 + 24) = a3;
  *(double *)(v7 + 32) = a4;
  v8 = a3;
  v9 = self;
  v10 = v8;
  sub_1D6E1AFF0();

  swift_release();
}

- (void)downloadFinishedForRequest:(id)a3 error:(id)a4
{
  _QWORD *v7;
  id v8;
  _TtC7NewsUI221OfflineContentManager *v9;
  id v10;
  _TtC7NewsUI221OfflineContentManager *v11;
  id v12;
  id v13;

  v7 = (_QWORD *)swift_allocObject();
  v7[2] = self;
  v7[3] = a3;
  v7[4] = a4;
  v8 = a3;
  v9 = self;
  v10 = a4;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  sub_1D6E1AFF0();

  swift_release();
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  void *v6;
  _TtC7NewsUI221OfflineContentManager *v7;
  void *v8;
  void *v9;

  swift_getObjectType();
  v6 = _Block_copy(a4);
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  swift_unknownObjectRetain();
  v7 = self;
  sub_1D6E1AE1C();
  v8 = (void *)sub_1D6E1AB4C();
  sub_1D6E1AC30();
  swift_release();

  v9 = (void *)sub_1D6E1AB4C();
  sub_1D6E1AC9C();
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_release();

}

@end
