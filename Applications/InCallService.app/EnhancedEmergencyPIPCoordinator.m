@implementation EnhancedEmergencyPIPCoordinator

- (_TtC13InCallService31EnhancedEmergencyPIPCoordinator)init
{
  sub_1001232D4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InCallService31EnhancedEmergencyPIPCoordinator_pictureInPictureProxy));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InCallService31EnhancedEmergencyPIPCoordinator_presentationController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InCallService31EnhancedEmergencyPIPCoordinator_sourceView));
  sub_100123A08((uint64_t)self + OBJC_IVAR____TtC13InCallService31EnhancedEmergencyPIPCoordinator_delegate);
}

- (void)pictureInPictureProxy:(id)a3 willStopPictureInPictureWithAnimationType:(int64_t)a4 reason:(int64_t)a5
{
  id v7;
  uint64_t v8;
  _TtC13InCallService31EnhancedEmergencyPIPCoordinator *v9;

  v7 = a3;
  v9 = self;
  sub_1001233B4((uint64_t)v9, v8, a5);

}

- (id)pictureInPictureProxyViewControllerWindowForTransitionAnimation:(id)a3
{
  id v4;
  _TtC13InCallService31EnhancedEmergencyPIPCoordinator *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10012345C();

  return v6;
}

- (CGRect)pictureInPictureProxyViewFrameForTransitionAnimation:(id)a3
{
  id v4;
  _TtC13InCallService31EnhancedEmergencyPIPCoordinator *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v4 = a3;
  v5 = self;
  v6 = sub_1001237D4();
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (int64_t)pictureInPictureProxyContentType:(id)a3
{
  return 4;
}

@end
