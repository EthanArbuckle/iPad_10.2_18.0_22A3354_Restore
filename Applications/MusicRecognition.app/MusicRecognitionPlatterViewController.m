@implementation MusicRecognitionPlatterViewController

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_activeLayoutMode) = (Class)a3;
}

- (UIColor)keyColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_keyColor));
}

- (void)setKeyColor:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_keyColor);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_keyColor) = (Class)a3;
  v3 = a3;

}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_contentRole);
}

- (void)setContentRole:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_contentRole) = (Class)a3;
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_preferredLayoutMode);
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_preferredLayoutMode) = (Class)a3;
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_maximumLayoutMode);
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_maximumLayoutMode) = (Class)a3;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_listeningAccessoryView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_waveformAccessoryView));
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_minimalAccessoryView));
}

- (unint64_t)presentationBehaviors
{
  return 24;
}

- (void)dealloc
{
  _TtC16MusicRecognition37MusicRecognitionPlatterViewController *v2;
  uint64_t v3;

  v2 = self;
  sub_10000CEE0((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_listeningAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_waveformAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_minimalAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_matchingFlowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_keyColor));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_musicRecognitionCancellable));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_assertionTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController____lazy_storage___customLayoutHeightConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_activeConstraints));
}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC16MusicRecognition37MusicRecognitionPlatterViewController *v3;

  v3 = self;
  sub_10000D15C((uint64_t)v3, v2);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MusicRecognition37MusicRecognitionPlatterViewController *v4;

  v4 = self;
  sub_10000D60C(a3, (uint64_t)v4);

}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  _TtC16MusicRecognition37MusicRecognitionPlatterViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_10000E630(a3);

  swift_unknownObjectRelease(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MusicRecognition37MusicRecognitionPlatterViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MusicRecognition37MusicRecognitionPlatterViewController *)sub_10000E8CC(v5, v7, a4);
}

- (_TtC16MusicRecognition37MusicRecognitionPlatterViewController)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC16MusicRecognition37MusicRecognitionPlatterViewController *)sub_10000EBBC(v3, v4);
}

- (void)receivedWithSpectralOutput:(id)a3
{
  uint64_t v4;
  _TtC16MusicRecognition37MusicRecognitionPlatterViewController *v5;

  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for Float);
  v5 = self;
  sub_10000EE58(v4);

  swift_bridgeObjectRelease(v4);
}

@end
