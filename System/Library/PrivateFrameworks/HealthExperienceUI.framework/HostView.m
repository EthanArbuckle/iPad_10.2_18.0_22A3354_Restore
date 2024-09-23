@implementation HostView

- (_TtC18HealthExperienceUI8HostView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI8HostView *)HostView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI8HostView)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI8HostView *)HostView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI8HostView_userDataObserver));
  sub_1A983CBB8(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI8HostView_currentUserInterface), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI8HostView_currentUserInterface), *((_BYTE *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC18HealthExperienceUI8HostView_currentUserInterface));
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI8HostView_hostedFeedItem));
  sub_1A980D550((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI8HostView_sectionContext);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI8HostView_hostedViewable));

  swift_bridgeObjectRelease();
}

- (NSString)description
{
  _TtC18HealthExperienceUI8HostView *v2;
  void *v3;

  v2 = self;
  HostView.description.getter();

  v3 = (void *)sub_1A9A9580C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
