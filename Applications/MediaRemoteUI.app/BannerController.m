@implementation BannerController

- (void)dealloc
{
  _TtC13MediaRemoteUI16BannerController *v2;

  v2 = self;
  sub_10002C3C8();
}

- (void).cxx_destruct
{
  sub_1000082F0((uint64_t)self + OBJC_IVAR____TtC13MediaRemoteUI16BannerController_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___groupSessionPresenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___suggestedRoutePresenter));

}

- (_TtC13MediaRemoteUI16BannerController)init
{
  return (_TtC13MediaRemoteUI16BannerController *)sub_10002C7DC();
}

@end
