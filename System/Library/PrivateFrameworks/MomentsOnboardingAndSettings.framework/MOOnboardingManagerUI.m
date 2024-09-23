@implementation MOOnboardingManagerUI

- (id)createSheetOnboardingViewController
{
  objc_class *v3;
  char *v4;
  char *v5;
  _TtC28MomentsOnboardingAndSettings21MOOnboardingManagerUI *v6;
  id v7;
  _QWORD *v8;
  _TtC28MomentsOnboardingAndSettings21MOOnboardingManagerUI *v9;
  objc_super v11;

  v3 = (objc_class *)type metadata accessor for MOOnboardingNavigationController();
  v4 = (char *)objc_allocWithZone(v3);
  v5 = &v4[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate];
  *(_QWORD *)&v4[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate] = 0;
  swift_beginAccess();
  *(_QWORD *)v5 = 0;
  v6 = self;
  swift_unknownObjectRelease();
  v7 = objc_allocWithZone((Class)type metadata accessor for MOOnboardingViewController());
  v8 = MOOnboardingViewController.init()();
  (*(void (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & *v8) + 0x88))(0);
  v11.receiver = v4;
  v11.super_class = v3;
  v9 = -[MOOnboardingManagerUI initWithRootViewController:](&v11, sel_initWithRootViewController_, v8);

  return v9;
}

- (id)createSheetOnboardingViewControllerWith:(id)a3
{
  _TtC28MomentsOnboardingAndSettings21MOOnboardingManagerUI *v5;
  id v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = specialized MOOnboardingManagerUI.createSheetOnboardingViewController(with:)((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (_TtC28MomentsOnboardingAndSettings21MOOnboardingManagerUI)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MOOnboardingManagerUI();
  return -[MOOnboardingManagerUI init](&v3, sel_init);
}

@end
