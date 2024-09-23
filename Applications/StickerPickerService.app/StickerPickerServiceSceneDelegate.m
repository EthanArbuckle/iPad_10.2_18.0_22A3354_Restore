@implementation StickerPickerServiceSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC20StickerPickerService33StickerPickerServiceSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20StickerPickerService33StickerPickerServiceSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20StickerPickerService33StickerPickerServiceSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC20StickerPickerService33StickerPickerServiceSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100005188(v8);

}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v9;
  uint64_t v10;
  id v11;
  _TtC20StickerPickerService33StickerPickerServiceSceneDelegate *v12;

  v9 = a3;
  swift_unknownObjectRetain(a4, v10);
  v11 = a6;
  v12 = self;
  sub_100005390(v9, a4);

  swift_unknownObjectRelease(a4);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC20StickerPickerService33StickerPickerServiceSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000055C8(v4, "sceneDidDisconnect %@");

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC20StickerPickerService33StickerPickerServiceSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000055C8(v4, "sceneDidBecomeActive %@");

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  _TtC20StickerPickerService33StickerPickerServiceSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000055C8(v4, "sceneWillResignActive %@");

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC20StickerPickerService33StickerPickerServiceSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000055C8(v4, "sceneWillEnterForeground %@");

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC20StickerPickerService33StickerPickerServiceSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100005788(v4);

}

- (_TtC20StickerPickerService33StickerPickerServiceSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20StickerPickerService33StickerPickerServiceSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StickerPickerServiceSceneDelegate();
  return -[StickerPickerServiceSceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20StickerPickerService33StickerPickerServiceSceneDelegate_window));
}

@end
