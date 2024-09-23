@implementation WelcomeInteractor

- (_TtC7NewsUI217WelcomeInteractor)init
{
  _TtC7NewsUI217WelcomeInteractor *result;

  result = (_TtC7NewsUI217WelcomeInteractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI217WelcomeInteractor_delegate);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)dataManager:(id)a3 error:(int64_t)a4
{
  _TtC7NewsUI217WelcomeInteractor *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1D62A1FC0();
  swift_unknownObjectRelease();

}

- (void)dataManagerFeedPrepared:(id)a3
{
  _TtC7NewsUI217WelcomeInteractor *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1D62A2060();
  swift_unknownObjectRelease();

}

- (void)dataManager:(id)a3 userType:(int64_t)a4
{
  _TtC7NewsUI217WelcomeInteractor *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1D62A2140();
  swift_unknownObjectRelease();

}

- (void)networkReachabilityDidChange:(id)a3
{
  _TtC7NewsUI217WelcomeInteractor *v4;

  v4 = self;
  swift_unknownObjectRetain();
  sub_1D62A1A8C();
  if (a3)
  {
    if (objc_msgSend(a3, sel_isNetworkReachable))
      objc_msgSend(*(id *)((char *)&v4->super.isa + OBJC_IVAR____TtC7NewsUI217WelcomeInteractor_dataManager), sel_beginFetchingUserType);
    swift_unknownObjectRelease();

  }
  else
  {
    __break(1u);
  }
}

- (void)activityObservingApplicationDidBecomeActive
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI217WelcomeInteractor_dataManager), sel_beginFetchingUserType);
}

@end
