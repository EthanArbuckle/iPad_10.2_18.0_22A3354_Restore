@implementation HeadphoneHeadGesturesUpsellViewController

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC20HeadphoneProxService41HeadphoneHeadGesturesUpsellViewController *v3;

  v3 = self;
  sub_100055FFC((uint64_t)v3, v2);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  uint64_t Strong;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self, a2);
  v4 = v7.receiver;
  -[HeadphoneHeadGesturesUpsellViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC20HeadphoneProxService41HeadphoneHeadGesturesUpsellViewController_presenter]);
  if (Strong)
  {
    v6 = Strong;
    sub_1000761A4(v4[OBJC_IVAR____TtC20HeadphoneProxService41HeadphoneHeadGesturesUpsellViewController_type]);

    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  CMTimeEpoch epoch;
  double v9;
  _QWORD v10[3];
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType(self, a2);
  v4 = v11.receiver;
  -[HeadphoneHeadGesturesUpsellViewController viewWillAppear:](&v11, "viewWillAppear:", v3);
  v5 = (char *)sub_100055D38(&OBJC_IVAR____TtC20HeadphoneProxService41HeadphoneHeadGesturesUpsellViewController____lazy_storage___movieLoopView, (uint64_t (*)(uint64_t))sub_100055A44);
  v6 = OBJC_IVAR____TtC20HeadphoneProxService19ProxMovieLoopPlayer_videoPlayer;
  v7 = *(void **)&v5[OBJC_IVAR____TtC20HeadphoneProxService19ProxMovieLoopPlayer_videoPlayer];
  epoch = kCMTimeZero.epoch;
  v10[0] = kCMTimeZero.value;
  v10[1] = *(_QWORD *)&kCMTimeZero.timescale;
  v10[2] = epoch;
  objc_msgSend(v7, "seekToTime:", v10);
  LODWORD(v9) = 1.0;
  objc_msgSend(*(id *)&v5[v6], "playImmediatelyAtRate:", v9);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService41HeadphoneHeadGesturesUpsellViewController)initWithContentView:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC20HeadphoneProxService41HeadphoneHeadGesturesUpsellViewController *v6;

  v4 = a3;
  v6 = (_TtC20HeadphoneProxService41HeadphoneHeadGesturesUpsellViewController *)sub_1000569CC((uint64_t)a3, v5);

  return v6;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService41HeadphoneHeadGesturesUpsellViewController_headphoneProxFeatureManager]);

  sub_100009FD0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService41HeadphoneHeadGesturesUpsellViewController_presenter]);
}

@end
