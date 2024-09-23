@implementation DKViewControllerDelegateResponder

- (void)diagnosticManager:(id)a3 presentViewController:(id)a4 completion:(id)a5
{
  sub_10003F5A8(self, (int)a2, a3, a4, a5, (uint64_t)&unk_1001358E8, (uint64_t)sub_10003FF9C, sub_10003F99C);
}

- (void)diagnosticManager:(id)a3 dismissViewController:(id)a4 completion:(id)a5
{
  sub_10003F5A8(self, (int)a2, a3, a4, a5, (uint64_t)&unk_100135870, (uint64_t)sub_10003F994, (void (*)(id, uint64_t, uint64_t))sub_10003FBA8);
}

- (void)showStatusBar
{
  sub_10003F668(self, (uint64_t)a2, (SEL *)&selRef_showSceneStatusBar);
}

- (void)hideStatusBar
{
  sub_10003F668(self, (uint64_t)a2, (SEL *)&selRef_hideSceneStatusBar);
}

- (void)setStatusBarStyle:(int64_t)a3
{
  void *v5;
  id v6;
  unsigned int v7;
  id v8;
  _TtC11Diagnostics33DKViewControllerDelegateResponder *v9;

  v5 = (void *)objc_opt_self(DAPlatform);
  v9 = self;
  v6 = objc_msgSend(v5, "currentPlatform");
  v7 = objc_msgSend(v6, "isCheckerBoardActive");
  swift_unknownObjectRelease(v6);
  if (v7)
  {
    v8 = objc_msgSend(v5, "currentPlatform");
    objc_msgSend(v8, "sceneStatusBarStyle:", a3);

    swift_unknownObjectRelease(v8);
  }
  else
  {

  }
}

- (_TtC11Diagnostics33DKViewControllerDelegateResponder)init
{
  char *v2;
  char *v3;
  objc_super v5;

  v2 = (char *)self + OBJC_IVAR____TtC11Diagnostics33DKViewControllerDelegateResponder__presentationTransitionStyle;
  *(_QWORD *)v2 = 0;
  v2[8] = 1;
  v3 = (char *)self + OBJC_IVAR____TtC11Diagnostics33DKViewControllerDelegateResponder__dismissalTransitionStyle;
  *(_QWORD *)v3 = 0;
  v3[8] = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DKViewControllerDelegateResponder();
  return -[DKViewControllerDelegateResponder init](&v5, "init");
}

@end
