@implementation DashboardSidebarPresenter

- (GKDashboardRequest)request
{
  id v2;

  sub_1AB508EBC();
  return (GKDashboardRequest *)v2;
}

- (BOOL)retryAfterAuthentication
{
  return sub_1AB508F08() & 1;
}

- (void)setRetryAfterAuthentication:(BOOL)a3
{
  sub_1AB508F3C(a3);
}

- (NSString)title
{
  _TtC12GameCenterUI25DashboardSidebarPresenter *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1AB508258();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1AB7DAF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)handleViewDidLoad
{
  _TtC12GameCenterUI25DashboardSidebarPresenter *v2;

  v2 = self;
  sub_1AB508280();

}

- (void)fetchGameRecordAfterAuthenticationFor:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC12GameCenterUI25DashboardSidebarPresenter *v7;

  v4 = sub_1AB7DAF90();
  v6 = v5;
  v7 = self;
  sub_1AB50C150(v4, v6);
  swift_bridgeObjectRelease();

}

- (_TtC12GameCenterUI25DashboardSidebarPresenter)initWithPlayerId:(id)a3
{
  if (a3)
    sub_1AB7DAF90();
  sub_1AB50C30C();
}

- (void).cxx_destruct
{
  swift_release();

  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_85_0();

  OUTLINED_FUNCTION_27_13((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI25DashboardSidebarPresenter_selectedItem);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AB47A074((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI25DashboardSidebarPresenter_requiredData, &qword_1EEBFC5B0);
  OUTLINED_FUNCTION_85_0();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI25DashboardSidebarPresenter_dashboardDisplayMode));
}

@end
