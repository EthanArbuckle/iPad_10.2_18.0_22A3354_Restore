@implementation ARQuickLookOverlayController

- (ASVControlsView)controlsViewStack
{
  _TtC11AssetViewer28ARQuickLookOverlayController *v2;
  id v3;

  v2 = self;
  v3 = sub_1D94795D4();

  return (ASVControlsView *)v3;
}

- (void)setControlsViewStack:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___controlsViewStack);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___controlsViewStack) = (Class)a3;
  v3 = a3;

}

- (ASVRoundedButton)dismissButton
{
  _TtC11AssetViewer28ARQuickLookOverlayController *v2;
  id v3;

  v2 = self;
  v3 = sub_1D9479940();

  return (ASVRoundedButton *)v3;
}

- (void)setDismissButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___dismissButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___dismissButton) = (Class)a3;
  v3 = a3;

}

- (ASVRoundedButton)shareButton
{
  _TtC11AssetViewer28ARQuickLookOverlayController *v2;
  id v3;

  v2 = self;
  v3 = sub_1D9479DAC();

  return (ASVRoundedButton *)v3;
}

- (void)setShareButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___shareButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___shareButton) = (Class)a3;
  v3 = a3;

}

- (UIButton)debugActionsButton
{
  _TtC11AssetViewer28ARQuickLookOverlayController *v2;
  id v3;

  v2 = self;
  v3 = sub_1D947A1C8();

  return (UIButton *)v3;
}

- (void)setDebugActionsButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___debugActionsButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___debugActionsButton) = (Class)a3;
  v3 = a3;

}

- (UIButton)fileARadarButton
{
  _TtC11AssetViewer28ARQuickLookOverlayController *v2;
  id v3;

  v2 = self;
  v3 = sub_1D947A390();

  return (UIButton *)v3;
}

- (void)setFileARadarButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___fileARadarButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___fileARadarButton) = (Class)a3;
  v3 = a3;

}

- (ASVTrackingStateStatusLabel)statusPill
{
  _TtC11AssetViewer28ARQuickLookOverlayController *v2;
  id v3;

  v2 = self;
  v3 = sub_1D947AABC();

  return (ASVTrackingStateStatusLabel *)v3;
}

- (void)setStatusPill:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___statusPill);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___statusPill) = (Class)a3;
  v3 = a3;

}

- (_TtC11AssetViewer28ARQuickLookOverlayController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D94815A4();
}

- (void)loadView
{
  id v3;
  _TtC11AssetViewer28ARQuickLookOverlayController *v4;
  id v5;

  type metadata accessor for ARQuickLookOverlayView();
  v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;
  v5 = objc_msgSend(v3, sel_init);
  -[ARQuickLookOverlayController setView:](v4, sel_setView_, v5);

}

- (void)viewDidLoad
{
  _TtC11AssetViewer28ARQuickLookOverlayController *v2;

  v2 = self;
  sub_1D947AC8C();

}

- (void)viewDidLayoutSubviews
{
  _TtC11AssetViewer28ARQuickLookOverlayController *v2;

  v2 = self;
  sub_1D947C440();

}

- (void)dealloc
{
  _TtC11AssetViewer28ARQuickLookOverlayController *v2;

  v2 = self;
  sub_1D947C938();
}

- (void).cxx_destruct
{
  sub_1D93E4250((uint64_t)self + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_arTrackingState);
  sub_1D93D6F48(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_lastResultType));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_variantsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___longPressGesture));
  sub_1D93D6F14((uint64_t)self + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_delegate);
  sub_1D93E4250((uint64_t)self + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_currentTrackingState);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_touchesOnScreenGestureRecognizer));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_autoHideControlsTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___controlsViewStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___shutterButtonContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___displayModeControlView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___shareButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___debugActionsButtonContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___debugActionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___fileARadarButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___shutterButton));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_coachingOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___statusPill));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController____lazy_storage___assetLoadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_backgroundDimmingView));
  swift_release();
}

- (void)takePicture
{
  _TtC11AssetViewer28ARQuickLookOverlayController *v3;

  if (MEMORY[0x1DF08DD88]((char *)self + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_delegate, a2))
  {
    v3 = self;
    sub_1D9426EE0();

    swift_unknownObjectRelease();
  }
}

- (void)handleLongPressGesture:(id)a3
{
  id v4;
  _TtC11AssetViewer28ARQuickLookOverlayController *v5;

  v4 = a3;
  v5 = self;
  sub_1D947D4E8(v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC11AssetViewer28ARQuickLookOverlayController *v6;

  v5 = a3;
  v6 = self;
  sub_1D947D794((uint64_t)a3);

}

- (void)displayModeChanged
{
  _TtC11AssetViewer28ARQuickLookOverlayController *v2;

  v2 = self;
  sub_1D947F324();

}

- (void)startAutoHideControlsTimer
{
  _TtC11AssetViewer28ARQuickLookOverlayController *v2;

  v2 = self;
  sub_1D947F598();

}

- (void)stopAutoHideControlsTimerWithShouldRestart:(BOOL)a3
{
  _TtC11AssetViewer28ARQuickLookOverlayController *v4;

  v4 = self;
  sub_1D947F6B0(a3);

}

- (void)autoHide2DControls
{
  _TtC11AssetViewer28ARQuickLookOverlayController *v2;

  v2 = self;
  sub_1D947F77C();

}

- (void)enableWorldModeControl:(BOOL)a3
{
  _TtC11AssetViewer28ARQuickLookOverlayController *v4;

  v4 = self;
  sub_1D947FAE8(a3);

}

- (void)updateStatusPill
{
  _TtC11AssetViewer28ARQuickLookOverlayController *v2;

  v2 = self;
  sub_1D94807A4();

}

- (_TtC11AssetViewer28ARQuickLookOverlayController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11AssetViewer28ARQuickLookOverlayController *result;

  v4 = a4;
  result = (_TtC11AssetViewer28ARQuickLookOverlayController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)dynamicShutterControlDidShortPress:(id)a3
{
  id v5;
  _TtC11AssetViewer28ARQuickLookOverlayController *v6;

  if (MEMORY[0x1DF08DD88]((char *)self + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_delegate, a2))
  {
    v5 = a3;
    v6 = self;
    sub_1D9426EE0();

    swift_unknownObjectRelease();
  }
}

- (void)dynamicShutterControlDidStart:(id)a3
{
  id v4;
  _TtC11AssetViewer28ARQuickLookOverlayController *v5;

  v4 = a3;
  v5 = self;
  sub_1D9481A30();

}

- (void)dynamicShutterControlDidStop:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC11AssetViewer28ARQuickLookOverlayController *v7;

  v5 = MEMORY[0x1DF08DD88]((char *)self + OBJC_IVAR____TtC11AssetViewer28ARQuickLookOverlayController_delegate, a2);
  v6 = a3;
  v7 = self;
  if (v5)
  {
    sub_1D94363B4();
    swift_unknownObjectRelease();
  }
  -[ARQuickLookOverlayController startAutoHideControlsTimer](v7, sel_startAutoHideControlsTimer);

}

- (void)trackedRaycastStateDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC11AssetViewer28ARQuickLookOverlayController *v8;
  uint64_t v9;

  v4 = sub_1D94D1018();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D94D1000();
  v8 = self;
  sub_1D949864C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
