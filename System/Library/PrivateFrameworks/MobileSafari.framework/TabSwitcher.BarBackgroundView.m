@implementation TabSwitcher.BarBackgroundView

- (BOOL)isHidden
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_s17BarBackgroundViewCMa();
  return -[TabSwitcher.BarBackgroundView isHidden](&v3, sel_isHidden);
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  char *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_s17BarBackgroundViewCMa();
  v4 = (char *)v6.receiver;
  -[TabSwitcher.BarBackgroundView setHidden:](&v6, sel_setHidden_, v3);
  if (v4[OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_coordinatesGroupBackdropCaptureView] == 1)
  {
    v5 = (char *)*(id *)&v4[OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_group + 48];
    objc_msgSend(v5, sel_setHidden_, objc_msgSend(v4, sel_isHidden, v6.receiver, v6.super_class));

    v4 = v5;
  }

}

- (_TtCC12MobileSafari11TabSwitcher17BarBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18B905F68();
}

- (void)configurationDidChange
{
  _TtCC12MobileSafari11TabSwitcher17BarBackgroundView *v2;

  v2 = self;
  sub_18B9040B0();

}

- (void)sceneDidEnterBackground:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtCC12MobileSafari11TabSwitcher17BarBackgroundView *v8;
  int v9;
  uint64_t v10;

  v4 = sub_18BABFE3C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BABFE18();
  v8 = self;
  if ((sub_18B9049AC() & 1) != 0)
  {
    v9 = *((unsigned __int8 *)&v8->super.super.super.isa
         + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_contentFadeOutRenderingMode);
    *((_BYTE *)&v8->super.super.super.isa
    + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_contentFadeOutRenderingMode) = 0;
    if (v9 == 1)
      sub_18B9040B0();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)sceneWillEnterForeground:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtCC12MobileSafari11TabSwitcher17BarBackgroundView *v8;
  char v9;
  uint64_t v10;

  v4 = sub_18BABFE3C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BABFE18();
  v8 = self;
  if ((sub_18B9049AC() & 1) != 0)
  {
    v9 = *((_BYTE *)&v8->super.super.super.isa
         + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_contentFadeOutRenderingMode);
    *((_BYTE *)&v8->super.super.super.isa
    + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_contentFadeOutRenderingMode) = 1;
    if ((v9 & 1) == 0)
      sub_18B9040B0();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)willMoveToWindow:(id)a3
{
  id v5;
  _TtCC12MobileSafari11TabSwitcher17BarBackgroundView *v6;

  v5 = a3;
  v6 = self;
  sub_18B9048B0(a3);

}

- (_TtCC12MobileSafari11TabSwitcher17BarBackgroundView)initWithFrame:(CGRect)a3
{
  _TtCC12MobileSafari11TabSwitcher17BarBackgroundView *result;

  result = (_TtCC12MobileSafari11TabSwitcher17BarBackgroundView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  v3 = *(UIViewController **)((char *)&self->super._viewDelegate
                            + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_configuration);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v4 = *(id *)((char *)&self->super._swiftAnimationInfo
             + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_group);
  objc_release(*(id *)((char *)&self->super._traitChangeRegistry
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_group));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_backgroundMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_backgroundMaterialView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_contentScribbleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_contentMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_contentMaterialView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_separator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_systemMaterialView));
}

@end
