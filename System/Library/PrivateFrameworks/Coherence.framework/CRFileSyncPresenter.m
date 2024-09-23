@implementation CRFileSyncPresenter

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC9Coherence19CRFileSyncPresenter_queue));
}

- (NSURL)presentedItemURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6F3C70);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC9Coherence19CRFileSyncPresenter_fileURL;
  v7 = sub_1BE1B1DF0();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1BE1B1D90();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (void)presentedItemDidChange
{
  _TtC9Coherence19CRFileSyncPresenter *v2;

  v2 = self;
  sub_1BE193CAC();

}

- (void)presentedItemDidGainVersion:(id)a3
{
  id v4;
  _TtC9Coherence19CRFileSyncPresenter *v5;

  v4 = a3;
  v5 = self;
  sub_1BE193EE0(v4);

}

- (_TtC9Coherence19CRFileSyncPresenter)init
{
  _TtC9Coherence19CRFileSyncPresenter *result;

  result = (_TtC9Coherence19CRFileSyncPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC9Coherence19CRFileSyncPresenter_fileURL;
  v4 = sub_1BE1B1DF0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  sub_1BDDF32D0((uint64_t)self + OBJC_IVAR____TtC9Coherence19CRFileSyncPresenter_manager);
}

@end
