@implementation CardPresenter

- (void)dealloc
{
  _TtC13PCViewService13CardPresenter *v2;
  id v3;
  NSString v4;
  objc_super v5;

  v2 = self;
  v3 = sub_100053508();
  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "ulog:message:", 40, v4);

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for CardPresenter(0);
  -[CardPresenter dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13PCViewService13CardPresenter_model));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13PCViewService13CardPresenter_state));
  sub_100018008((uint64_t)self + OBJC_IVAR____TtC13PCViewService13CardPresenter_initialActivityDisplayContext, type metadata accessor for ActivityDisplayContext);

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13PCViewService13CardPresenter__isAnimatingIn));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13PCViewService13CardPresenter_animatingInListener));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13PCViewService13CardPresenter_educationViewModel));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13PCViewService13CardPresenter____lazy_storage___homeAccessoryViewHandle));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13PCViewService13CardPresenter____lazy_storage___homeAccessoryViewHandleModel));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13PCViewService13CardPresenter_homeAccessoryViewHandleState));
  sub_100007A90(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13PCViewService13CardPresenter_cardPresentingAnimationBlock), *(_QWORD *)&self->model[OBJC_IVAR____TtC13PCViewService13CardPresenter_cardPresentingAnimationBlock]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13PCViewService13CardPresenter____lazy_storage___proximityCardHeaderViewModel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13PCViewService13CardPresenter_tasks));
}

- (_TtC13PCViewService13CardPresenter)init
{
  _TtC13PCViewService13CardPresenter *result;

  result = (_TtC13PCViewService13CardPresenter *)_swift_stdlib_reportUnimplementedInitializer("PCViewService.CardPresenter", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
