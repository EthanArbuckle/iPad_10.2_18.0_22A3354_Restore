@implementation RadioNowPlayingViewController

- (void)viewWillAppear:(BOOL)a3
{
  sub_1000666BC(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, 4);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_1000666BC(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillDisappear_, 0);
}

- (void)viewDidLoad
{
  _TtC5Media29RadioNowPlayingViewController *v2;

  v2 = self;
  sub_10006677C();

}

- (void)invalidate
{
  _TtC5Media29RadioNowPlayingViewController *v2;

  v2 = self;
  sub_100066A2C();

}

- (id)titleForNowPlayingController:(id)a3
{
  return sub_10006762C(self, (uint64_t)a2, a3, (void (*)(void))sub_10006C0E8);
}

- (id)artistTextForNowPlayingController:(id)a3
{
  return sub_10006762C(self, (uint64_t)a2, a3, sub_10006C754);
}

- (id)albumTextForNowPlayingController:(id)a3
{
  return sub_10006762C(self, (uint64_t)a2, a3, sub_10006CA48);
}

- (id)backgroundArtForNowPlayingController:(id)a3
{
  id v4;
  _TtC5Media29RadioNowPlayingViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10006CD3C();

  return v6;
}

- (BOOL)nowPlayingViewControllerIsShowingExplicitTrack:(id)a3
{
  return 0;
}

- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshotForNowPlayingViewController:(SEL)a3
{
  retstr->var4 = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)&retstr->var5 = _D0;
  *(_WORD *)&retstr->var7 = 1;
  retstr->var9 = 0;
  return self;
}

- (BOOL)nowPlayingViewControllerIsPlaying:(id)a3
{
  id v4;
  _TtC5Media29RadioNowPlayingViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10006CF64();

  return self & 1;
}

- (int64_t)placeholderTypeForNowPlayingViewController:(id)a3
{
  id v4;
  _TtC5Media29RadioNowPlayingViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10006D22C();

  return v6;
}

- (id)progressBarLocalizedDurationStringForNowPlayingViewController:(id)a3
{
  uint64_t Strong;
  void *v6;
  uint64_t v7;
  id v8;
  _TtC5Media29RadioNowPlayingViewController *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSString v13;

  Strong = swift_unknownObjectWeakLoadStrong(&self->CPUINowPlayingViewController_opaque[OBJC_IVAR____TtC5Media29RadioNowPlayingViewController_carManager]);
  if (!Strong)
    goto LABEL_6;
  v6 = (void *)Strong;
  v7 = *(_QWORD *)(Strong + OBJC_IVAR____TtC5Media15RadioCarManager_nowPlayingManager);
  swift_retain();
  v8 = a3;
  v9 = self;

  if (!v7)
  {

    goto LABEL_6;
  }
  sub_100036A6C();
  v11 = v10;

  swift_release(v7, v12);
  if (!v11)
  {
LABEL_6:
    v13 = 0;
    return v13;
  }
  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  return v13;
}

- (id)badgeAnnotationViewForNowPlayingViewController:(id)a3
{
  id v4;
  _TtC5Media29RadioNowPlayingViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10006D320();

  return v6;
}

- (BOOL)nowPlayingViewControllerShouldOverrideRightBarButtons:(id)a3
{
  return 1;
}

- (BOOL)nowPlayingViewController:(id)a3 buttonShouldBeActive:(int64_t)a4
{
  id v6;
  _TtC5Media29RadioNowPlayingViewController *v7;

  v6 = a3;
  v7 = self;
  LOBYTE(a4) = sub_10006D850(a4);

  return a4 & 1;
}

- (BOOL)nowPlayingViewController:(id)a3 shouldDisplayButton:(int64_t)a4 withImage:(id *)a5 existingIdentifier:(id)a6 tinted:(BOOL *)a7
{
  id v10;
  _TtC5Media29RadioNowPlayingViewController *v11;
  char v12;

  v10 = a3;
  v11 = self;
  sub_10006DAE4(a4, a5);
  LOBYTE(a5) = v12;

  return a5 & 1;
}

- (BOOL)nowPlayingViewControllerCanShowAlbumArt:(id)a3
{
  id v4;
  _TtC5Media29RadioNowPlayingViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10006E230();

  return self & 1;
}

- (BOOL)nowPlayingViewControllerIsRightHandDrive:(id)a3
{
  id v4;
  _TtC5Media29RadioNowPlayingViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10006E2E8();

  return self & 1;
}

- (BOOL)nowPlayingViewControllerCanShuffle:(id)a3
{
  return 0;
}

- (BOOL)nowPlayingViewControllerCanRepeat:(id)a3
{
  return 0;
}

- (BOOL)nowPlayingViewControllerCanShowUpNext:(id)a3
{
  return 0;
}

- (BOOL)nowPlayingViewControllerCanShowAlbumLink:(id)a3
{
  return 0;
}

- (id)nowPlayingViewControllerGetPlaybackRate:(id)a3
{
  return objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithDouble:", 1.0);
}

- (void)nowPlayingViewController:(id)a3 didSelectButton:(id)a4
{
  id v6;
  id v7;
  _TtC5Media29RadioNowPlayingViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10006E394(v7);

}

- (id)customPlaybackControlButtonsForNowPlayingViewController:(id)a3
{
  id v4;
  _TtC5Media29RadioNowPlayingViewController *v5;
  _QWORD *v6;
  Class isa;

  v4 = a3;
  v5 = self;
  v6 = sub_10006ECF8();

  sub_100007490(0, &qword_1000A31C0, UIButton_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (void)nowPlayingViewController:(id)a3 didSendAction:(int64_t)a4 state:(int64_t)a5
{
  id v8;
  _TtC5Media29RadioNowPlayingViewController *v9;

  v8 = a3;
  v9 = self;
  sub_10006F678(a4, a5);

}

- (void)showSourcePickerWithSender:(id)a3
{
  id v4;
  _TtC5Media29RadioNowPlayingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000698DC((uint64_t)v4);

}

- (void)showSoundSettings
{
  uint64_t Strong;
  _TtC5Media29RadioNowPlayingViewController *v4;
  id v5;

  Strong = swift_unknownObjectWeakLoadStrong(&self->CPUINowPlayingViewController_opaque[OBJC_IVAR____TtC5Media29RadioNowPlayingViewController_carManager]);
  if (Strong)
  {
    v5 = (id)Strong;
    v4 = self;
    sub_10000B658(1);

  }
}

- (void)setArtistSongNotification
{
  _TtC5Media29RadioNowPlayingViewController *v2;

  v2 = self;
  sub_100069FD0();

}

- (_TtC5Media29RadioNowPlayingViewController)initWithBundleIdentifier:(id)a3 dataSource:(id)a4 delegate:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  return (_TtC5Media29RadioNowPlayingViewController *)sub_10006A3AC(v7, v9, (uint64_t)a4, (uint64_t)a5);
}

- (_TtC5Media29RadioNowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC5Media29RadioNowPlayingViewController *)sub_10006A5C8(v5, v7, a4);
}

- (_TtC5Media29RadioNowPlayingViewController)initWithCoder:(id)a3
{
  return (_TtC5Media29RadioNowPlayingViewController *)sub_10006A7C4(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->CPUINowPlayingViewController_opaque[OBJC_IVAR____TtC5Media29RadioNowPlayingViewController_subscribers]);

  swift_unknownObjectWeakDestroy(&self->CPUINowPlayingViewController_opaque[OBJC_IVAR____TtC5Media29RadioNowPlayingViewController_carManager]);
}

- (void)nowPlayingService:(id)a3 didUpdateCurrentMediaSourceIdentifier:(id)a4
{
  id v5;
  _TtC5Media29RadioNowPlayingViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100066C00();

}

- (void)nowPlayingService:(id)a3 didUpdateAlbum:(id)a4
{
  -[RadioNowPlayingViewController reloadData](self, "reloadData", a3, a4);
}

- (void)nowPlayingService:(id)a3 didUpdateUserVisibleDescription:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC5Media29RadioNowPlayingViewController *v9;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  -[RadioNowPlayingViewController reloadData](v9, "reloadData");

  swift_bridgeObjectRelease(v7);
}

- (void)nowPlayingService:(id)a3 didUpdateArtwork:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC5Media29RadioNowPlayingViewController *v11;

  v6 = a3;
  v7 = a4;
  v11 = self;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;

  -[RadioNowPlayingViewController reloadData](v11, "reloadData");
  sub_100043E40(v8, v10);

}

- (uint64_t)nowPlayingService:(uint64_t)a3 didUpdateJumpBackwardInterval:(uint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v6 = sub_1000061A8(&qword_1000A3190);
  __chkstk_darwin(v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v9 = sub_100007490(0, (unint64_t *)&unk_1000A31A0, NSUnitDuration_ptr);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
    v10 = sub_1000061A8(&qword_1000A3198);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 0, 1, v10);
  }
  else
  {
    v11 = sub_1000061A8(&qword_1000A3198);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  }
  objc_msgSend(a1, "reloadData");
  return sub_100007454((uint64_t)v8, &qword_1000A3190);
}

- (void)nowPlayingService:(id)a3 didUpdatePlaybackState:(unsigned __int8)a4
{
  id v6;
  _TtC5Media29RadioNowPlayingViewController *v7;

  v6 = a3;
  v7 = self;
  sub_100071058(a4);

}

- (void)nowPlayingServiceDidUpdatePlay:(id)a3
{
  -[RadioNowPlayingViewController reloadData](self, "reloadData", a3);
}

@end
