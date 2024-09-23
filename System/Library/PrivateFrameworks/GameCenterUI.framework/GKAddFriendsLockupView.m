@implementation GKAddFriendsLockupView

- (_TtC12GameCenterUI22GKAddFriendsLockupView)initWithFrame:(CGRect)a3 friendState:(int64_t)a4 metricsPageId:(id)a5 metricsPageType:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = sub_1AB7DAF90();
  v9 = v8;
  v10 = sub_1AB7DAF90();
  return (_TtC12GameCenterUI22GKAddFriendsLockupView *)GKAddFriendsLockupView.init(frame:friendState:metricsPageId:metricsPageType:)(a4, v7, v9, v10, v11);
}

- (_TtC12GameCenterUI22GKAddFriendsLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB48572C();
}

- (id)addFriendsHandler
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v2 = GKAddFriendsLockupView.addFriendsHandler.getter();
  if (!v2)
    return 0;
  v6[4] = v2;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1AB4E2494;
  v6[3] = &block_descriptor_0;
  v4 = _Block_copy(v6);
  swift_release();
  return v4;
}

- (void)setAddFriendsHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12GameCenterUI22GKAddFriendsLockupView *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1AB48638C;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  GKAddFriendsLockupView.addFriendsHandler.setter((uint64_t)v4, v5);

}

- (void)layoutSubviews
{
  _TtC12GameCenterUI22GKAddFriendsLockupView *v2;

  v2 = self;
  GKAddFriendsLockupView.layoutSubviews()();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC12GameCenterUI22GKAddFriendsLockupView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = GKAddFriendsLockupView.measurements(fitting:in:)(width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  swift_unknownObjectRelease();

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (void)didTapButton:(id)a3
{
  _TtC12GameCenterUI22GKAddFriendsLockupView *v4;
  _TtC12GameCenterUI22GKAddFriendsLockupView *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AB7DB758();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1AB485F44();

  sub_1AB46D6B8((uint64_t)v6);
}

- (_TtC12GameCenterUI22GKAddFriendsLockupView)initWithFrame:(CGRect)a3
{
  GKAddFriendsLockupView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22GKAddFriendsLockupView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22GKAddFriendsLockupView_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22GKAddFriendsLockupView_button));
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_14_5();
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI22GKAddFriendsLockupView_addFriendsHandler));
}

@end
