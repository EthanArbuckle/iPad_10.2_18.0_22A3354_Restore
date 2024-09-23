@implementation FMFindingViewController

- (void)closeActionWithSender:(id)a3
{
  uint64_t v5;
  void *v6;
  _TtC11FMFindingUI23FMFindingViewController *v7;
  id v8;
  _QWORD v9[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = self;
  v9[4] = sub_23A9AFC2C;
  v9[5] = v5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23A9C4DBC;
  v9[3] = &unk_250BC1938;
  v6 = _Block_copy(v9);
  v7 = self;
  v8 = a3;
  swift_release();
  -[FMFindingViewController dismissViewControllerAnimated:completion:](v7, sel_dismissViewControllerAnimated_completion_, 1, v6);
  _Block_release(v6);

}

- (void)handlePartPickerWithSender:(id)a3
{
  _TtC11FMFindingUI23FMFindingViewController *v4;
  _TtC11FMFindingUI23FMFindingViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23AA33434();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_23A9AE678((uint64_t)v6);

  sub_23A9683BC((uint64_t)v6, &qword_2569D6680);
}

- (void)playSoundActionWithSender:(id)a3
{
  id v4;
  _TtC11FMFindingUI23FMFindingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_23A9AF52C();

}

- (void)openMessagesActionWithSender:(id)a3
{
  id v4;
  _TtC11FMFindingUI23FMFindingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_23A9AF6E4();

}

- (void)torchActionWithSender:(id)a3
{
  id v4;
  _TtC11FMFindingUI23FMFindingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_23A9AEB40(2, 1);
  sub_23A9AD9D4();

}

- (_TtC11FMFindingUI14FMAVPlayerView)foundPlayerView
{
  return (_TtC11FMFindingUI14FMAVPlayerView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                      + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_foundPlayerView));
}

- (_TtC11FMFindingUI23FMFindingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s11FMFindingUI0A14ViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (NSString)description
{
  _TtC11FMFindingUI23FMFindingViewController *v2;
  void *v3;

  v2 = self;
  sub_23A9A19A0();

  v3 = (void *)sub_23AA32FB4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  _TtC11FMFindingUI23FMFindingViewController *v2;

  v2 = self;
  FMFindingViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[11];
  uint64_t v9;

  v3 = *(_OWORD *)((char *)&self->super._dimmingView + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[8] = *(_OWORD *)((char *)&self->super._previousRootViewController
                    + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[9] = v3;
  v8[10] = *(_OWORD *)((char *)&self->super._currentAction + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v9 = *(uint64_t *)((char *)&self->super._externalObjectsTableForViewLoading
                  + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v4 = *(_OWORD *)((char *)&self->super._title + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[4] = *(_OWORD *)((char *)&self->super._navigationItem + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[5] = v4;
  v5 = *(_OWORD *)((char *)&self->super._childModalViewControllers
                 + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[6] = *(_OWORD *)((char *)&self->super._nibBundle + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[7] = v5;
  v6 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[1] = v6;
  v7 = *(_OWORD *)((char *)&self->super._tab + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[2] = *(_OWORD *)((char *)&self->super._view + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[3] = v7;
  sub_23A9E4A18((uint64_t)v8);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_snapshotContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_findingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_pickerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_pickerViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_instructionsController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_instructionsLabelsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_instructionsTopLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_instructionsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_hapticsController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_torchButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_rightActionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_r1DistanceView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_foundPlayerView));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_btDistanceView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_pulseTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_incorrectOrientationView));
  swift_bridgeObjectRelease();
  sub_23A973324((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_state, (uint64_t (*)(_QWORD))type metadata accessor for FMFindingViewState);
  sub_23A98C874(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_playSoundHandler));
  sub_23A98C874(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_willAppearHandler));
  sub_23A98C874(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_willDisappearHandler));
  sub_23A98C874(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_dismissedHandler));
}

- (void)applicationDidEnterBackground
{
  _TtC11FMFindingUI23FMFindingViewController *v2;

  v2 = self;
  sub_23A9D5A60();

}

- (void)applicationWillEnterForeground
{
  _TtC11FMFindingUI23FMFindingViewController *v2;

  v2 = self;
  sub_23A9D5D78();

}

- (void)viewDidLoad
{
  _TtC11FMFindingUI23FMFindingViewController *v2;

  v2 = self;
  sub_23A9D5E34();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC11FMFindingUI23FMFindingViewController *v4;

  v4 = self;
  sub_23A9D5F6C(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  char *v5;
  void *v6;
  char *v7;
  char *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FMFindingViewController();
  v4 = (char *)v9.receiver;
  -[FMFindingViewController viewDidAppear:](&v9, sel_viewDidAppear_, v3);
  v5 = *(char **)&v4[OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_findingView];
  v6 = *(void **)&v5[OBJC_IVAR____TtC11FMFindingUI8FMPFView_skScene];
  if (v6)
  {
    v7 = v5;
    v8 = v6;
    sub_23A9E8628(0, 1.0);

    v4 = v8;
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC11FMFindingUI23FMFindingViewController *v4;

  v4 = self;
  sub_23A9D666C(a3);

}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  _TtC11FMFindingUI23FMFindingViewController *v4;
  id v5;
  id v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_currentDevice);
  v6 = objc_msgSend(v5, sel_userInterfaceIdiom);

  if (v6)
    return 2;
  else
    return 26;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC11FMFindingUI23FMFindingViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_23A9D6A20(a4, width, height);
  swift_unknownObjectRelease();

}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (_TtC11FMFindingUI23FMFindingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11FMFindingUI23FMFindingViewController *result;

  v4 = a4;
  result = (_TtC11FMFindingUI23FMFindingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_titleLabel));
}

- (UILabel)accessibilityNameLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_nameLabel));
}

- (unsigned)accessibilityModeRawValue
{
  _TtC11FMFindingUI23FMFindingViewController *v2;
  unsigned int v3;

  v2 = self;
  v3 = sub_23A9EA09C();

  return v3;
}

- (UILabel)accessibilityInstructionsLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_instructionsLabel));
}

- (_TtC11FMFindingUI16FMBTDistanceView)accessibilityBTDistanceView
{
  return (_TtC11FMFindingUI16FMBTDistanceView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_btDistanceView));
}

- (_TtC11FMFindingUI16FMR1DistanceView)accessibilityR1DistanceView
{
  return (_TtC11FMFindingUI16FMR1DistanceView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_r1DistanceView));
}

- (BOOL)accessibilityFoundPlayerViewIsVisible
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_foundPlayerView);
  if (v2)
    return *(_BYTE *)(v2 + OBJC_IVAR____TtC11FMFindingUI14FMAVPlayerView_isShown);
  else
    return 0;
}

- (CGRect)accessibilityFoundPlayerViewAXFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_foundPlayerView);
  if (v2)
  {
    objc_msgSend(v2, sel_accessibilityFrame);
  }
  else
  {
    v5 = 0.0;
    v6 = 0.0;
    v3 = 0.0;
    v4 = 0.0;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

@end
