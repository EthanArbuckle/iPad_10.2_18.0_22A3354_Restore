@implementation FileCoordinatorInputSignal.Presenter

- (NSURL)presentedItemURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  sub_23DEA8A88(0, &qword_256D0E858, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)&v12 - v5;
  v7 = (char *)self + OBJC_IVAR____TtCC19HealthOrchestration26FileCoordinatorInputSignal9Presenter_observedURL;
  v8 = sub_23DF14BA8();
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_23DF14B90();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  return (NSURL *)v10;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtCC19HealthOrchestration26FileCoordinatorInputSignal9Presenter_presentedItemOperationQueue));
}

- (void)presentedItemDidChange
{
  char *v3;
  _TtCC19HealthOrchestration26FileCoordinatorInputSignal9Presenter *v4;

  if (swift_weakLoadStrong())
  {
    v3 = (char *)self + OBJC_IVAR____TtCC19HealthOrchestration26FileCoordinatorInputSignal9Presenter_observedURL;
    v4 = self;
    sub_23DEA5CE8((uint64_t)v3);

    swift_release();
  }
}

- (_TtCC19HealthOrchestration26FileCoordinatorInputSignal9Presenter)init
{
  _TtCC19HealthOrchestration26FileCoordinatorInputSignal9Presenter *result;

  result = (_TtCC19HealthOrchestration26FileCoordinatorInputSignal9Presenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtCC19HealthOrchestration26FileCoordinatorInputSignal9Presenter_observedURL;
  v4 = sub_23DF14BA8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC19HealthOrchestration26FileCoordinatorInputSignal9Presenter_presentedItemOperationQueue));
  swift_weakDestroy();
}

@end
