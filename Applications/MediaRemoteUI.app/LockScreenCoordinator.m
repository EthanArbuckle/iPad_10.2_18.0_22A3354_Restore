@implementation LockScreenCoordinator

+ (_TtC13MediaRemoteUI21LockScreenCoordinator)shared
{
  if (qword_1000589E0 != -1)
    swift_once(&qword_1000589E0, sub_100026454);
  return (_TtC13MediaRemoteUI21LockScreenCoordinator *)(id)qword_10005B288;
}

- (MRULockscreenViewController)platterContainer
{
  return (MRULockscreenViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer));
}

- (void)setPlatterContainer:(id)a3
{
  sub_100026660((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer, sub_1000264E4);
}

- (_TtC13MediaRemoteUI34CoverSheetBackgroundViewController)backgroundContainer
{
  return (_TtC13MediaRemoteUI34CoverSheetBackgroundViewController *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer);
}

- (void)setBackgroundContainer:(id)a3
{
  sub_100026660((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer, sub_1000266C0);
}

- (MRUArtwork)artwork
{
  return (MRUArtwork *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork));
}

- (void)setArtwork:(id)a3
{
  _TtC13MediaRemoteUI21LockScreenCoordinator *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_100029234(a3);

}

- (BOOL)isCurrentOrientationSupported
{
  void *v3;
  _TtC13MediaRemoteUI21LockScreenCoordinator *v4;
  id v5;
  id v6;
  id v8;
  id v9;

  v3 = (void *)objc_opt_self(UIDevice);
  v4 = self;
  v5 = objc_msgSend(v3, "currentDevice");
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (id)1)
  {

    return 1;
  }
  else
  {
    v8 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    v9 = objc_msgSend(v8, "activeInterfaceOrientation");

    return sub_1000293FC((uint64_t)v9);
  }
}

- (BOOL)canBeExpanded
{
  _TtC13MediaRemoteUI21LockScreenCoordinator *v2;
  char v3;

  v2 = self;
  v3 = sub_100026A0C();

  return v3 & 1;
}

- (_TtC13MediaRemoteUI21LockScreenCoordinator)init
{
  return (_TtC13MediaRemoteUI21LockScreenCoordinator *)sub_100026D14();
}

- (void)dealloc
{
  void *v2;
  _TtC13MediaRemoteUI21LockScreenCoordinator *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_wallpaperService);
  v3 = self;
  objc_msgSend(v2, "invalidate");
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for LockScreenCoordinator();
  -[LockScreenCoordinator dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContentAssertion));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artworkCatalogTimer));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer));

  sub_10000FAD4((uint64_t)self + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_ambientLifecycleCancellable);
}

- (void)updateExpandedArtworkFrameFor:(CGSize)a3
{
  double height;
  double width;
  _TtC13MediaRemoteUI21LockScreenCoordinator *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_100027358(width, height);

}

- (void)handleBackgroundTapAt:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  _TtC13MediaRemoteUI21LockScreenCoordinator *v5;

  y = a3.y;
  x = a3.x;
  v5 = self;
  sub_100027534(x, y);

}

- (BOOL)handlePlatterTap
{
  _TtC13MediaRemoteUI21LockScreenCoordinator *v2;
  char v3;

  v2 = self;
  v3 = sub_100027638();

  return v3 & 1;
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13MediaRemoteUI21LockScreenCoordinator *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1000292E8(v10);

}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
  void *v4;
  id v8;
  _TtC13MediaRemoteUI21LockScreenCoordinator *v9;
  id v10;
  NSString v11;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer);
  if (v4)
  {
    swift_unknownObjectRetain(a3);
    v8 = a4;
    v9 = self;
    v10 = v4;
    v11 = String._bridgeToObjectiveC()();
    objc_msgSend(v10, "invalidateAllTimelinesForReason:", v11);
    swift_unknownObjectRelease(a3);

  }
}

@end
