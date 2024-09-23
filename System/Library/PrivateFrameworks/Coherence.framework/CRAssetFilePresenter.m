@implementation CRAssetFilePresenter

- (NSURL)presentedItemURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6F3C70);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BDD86DEC((uint64_t)self + OBJC_IVAR____TtC9Coherence20CRAssetFilePresenter_presentedItemURL, (uint64_t)v5, &qword_1ED6F3C70);
  v6 = sub_1BE1B1DF0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    v8 = (void *)sub_1BE1B1D90();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return (NSURL *)v8;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC9Coherence20CRAssetFilePresenter_presentedItemOperationQueue));
}

- (uint64_t)presentedSubitemDidAppearAtURL:(void *)a1
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v8;

  v2 = sub_1BE1B1DF0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE1B1DD8();
  if (swift_weakLoadStrong())
  {
    v6 = a1;
    sub_1BE10B1C8((uint64_t)v5, 0);
    swift_release();

  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

- (void)accommodatePresentedSubitemDeletionAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _TtC9Coherence20CRAssetFilePresenter *v11;
  uint64_t v12;

  v6 = sub_1BE1B1DF0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_1BE1B1DD8();
  _Block_copy(v10);
  v11 = self;
  sub_1BE112B0C((uint64_t)v9, (uint64_t)v11, (void (**)(_QWORD, _QWORD))v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  void *v4;
  _TtC9Coherence20CRAssetFilePresenter *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1BE112D3C((uint64_t)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (_TtC9Coherence20CRAssetFilePresenter)init
{
  _TtC9Coherence20CRAssetFilePresenter *result;

  result = (_TtC9Coherence20CRAssetFilePresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BDD86E30((uint64_t)self + OBJC_IVAR____TtC9Coherence20CRAssetFilePresenter_presentedItemURL, &qword_1ED6F3C70);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9Coherence20CRAssetFilePresenter_presentedItemOperationQueue));
  swift_weakDestroy();
}

@end
