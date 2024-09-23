@implementation PlayerProfileViewController

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (id)parentController
{
  return PlayerProfileViewController.parentController()();
}

- (void)setRootController:(id)a3
{
  id v5;
  _TtC12GameCenterUI27PlayerProfileViewController *v6;

  v5 = a3;
  v6 = self;
  PlayerProfileViewController.setRoot(_:)(a3);

}

- (id)rootController
{
  return PlayerProfileViewController.rootController()();
}

- (void)setSpecifier:(id)a3
{
  id v5;
  _TtC12GameCenterUI27PlayerProfileViewController *v6;

  v5 = a3;
  v6 = self;
  PlayerProfileViewController.setSpecifier(_:)(a3);

}

- (id)specifier
{
  return PlayerProfileViewController.specifier()();
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  id v6;
  _TtC12GameCenterUI27PlayerProfileViewController *v7;
  id v8;
  _TtC12GameCenterUI27PlayerProfileViewController *v9;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1AB7DB758();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v8 = a4;
    v9 = self;
  }

  sub_1AB46D6B8((uint64_t)v10);
}

- (id)readPreferenceValue:(id)a3
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD v11[3];
  uint64_t v12;

  PlayerProfileViewController.readPreferenceValue(_:)((uint64_t)v11);
  v3 = v12;
  if (!v12)
    return 0;
  v4 = __swift_project_boxed_opaque_existential_1(v11, v12);
  v5 = *(_QWORD *)(v3 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v5 + 16))(v8, v6);
  v9 = (void *)sub_1AB7DBA94();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  return v9;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  void *v6;
  _TtC12GameCenterUI27PlayerProfileViewController *v7;

  v6 = _Block_copy(a4);
  if (a3)
    sub_1AB7DAEB8();
  if (v6)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v6;
    v6 = sub_1AB48638C;
  }
  v7 = self;
  sub_1AB46A9C4((uint64_t)v6);

  swift_bridgeObjectRelease();
}

+ (void)showProfileFor:(id)a3 from:(id)a4 completion:(id)a5
{
  uint64_t (*v7)();
  uint64_t (*v8)();
  uint64_t v9;
  void *v10;
  id v11;

  v7 = (uint64_t (*)())_Block_copy(a5);
  v8 = v7;
  if (!a3)
  {
    v9 = 0;
    if (!v7)
      goto LABEL_5;
    goto LABEL_3;
  }
  v9 = sub_1AB7DAF90();
  a3 = v10;
  if (v8)
  {
LABEL_3:
    *(_QWORD *)(swift_allocObject() + 16) = v8;
    v8 = sub_1AB48638C;
  }
LABEL_5:
  v11 = a4;
  static PlayerProfileViewController.showProfile(for:from:completion:)(v9, (uint64_t)a3);
  sub_1AB46A9C4((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (_TtC12GameCenterUI27PlayerProfileViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  PlayerProfileViewController.init(coder:)();
}

- (_TtC12GameCenterUI27PlayerProfileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a3)
  {
    sub_1AB7DAF90();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC12GameCenterUI27PlayerProfileViewController *)PlayerProfileViewController.init(nibName:bundle:)((uint64_t)a4, v6, a4);
}

- (_TtC12GameCenterUI18BaseSplitPresenter)dataPresenter
{
  return (_TtC12GameCenterUI18BaseSplitPresenter *)sub_1AB5947D0();
}

- (void)setDataPresenter:(id)a3
{
  id v4;
  _TtC12GameCenterUI27PlayerProfileViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB594828(v4);

}

- (BOOL)isDeeplinked
{
  return sub_1AB5948F0() & 1;
}

- (void)setIsDeeplinked:(BOOL)a3
{
  sub_1AB594924(a3);
}

- (void)viewDidLoad
{
  _TtC12GameCenterUI27PlayerProfileViewController *v2;

  v2 = self;
  sub_1AB594984();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12GameCenterUI27PlayerProfileViewController *v4;

  v4 = self;
  sub_1AB594B20(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC12GameCenterUI27PlayerProfileViewController *v4;

  v4 = self;
  sub_1AB594DCC(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC12GameCenterUI27PlayerProfileViewController *v2;

  v2 = self;
  sub_1AB594EC8();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI27PlayerProfileViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AB595218((uint64_t)a3);

}

- (BOOL)shouldDisplayInSplitView
{
  _TtC12GameCenterUI27PlayerProfileViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1AB595358();

  return v3 & 1;
}

- (id)contentScrollView
{
  _TtC12GameCenterUI27PlayerProfileViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1AB595404();
  v4 = v3;

  return v4;
}

- (void)mainSecondaryCollectionViewLayout
{
  _TtC12GameCenterUI27PlayerProfileViewController *v2;

  v2 = self;
  sub_1AB596664((uint64_t)v2);

}

- (void)donePressed:(id)a3
{
  _TtC12GameCenterUI27PlayerProfileViewController *v4;
  _TtC12GameCenterUI27PlayerProfileViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AB7DB758();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1AB596A4C();

  sub_1AB47A074((uint64_t)v6, (uint64_t *)&unk_1EEBFBCA0);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC12GameCenterUI27PlayerProfileViewController *v14;
  uint64_t v15;

  v8 = sub_1AB7D7D68();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1AB596B14((uint64_t)v12, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (PSRootController)_rootController
{
  id v2;

  sub_1AB597AF0();
  return (PSRootController *)v2;
}

- (void)set_rootController:(id)a3
{
  id v5;
  _TtC12GameCenterUI27PlayerProfileViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AB597B60((uint64_t)a3);

}

- (PSSpecifier)_specifier
{
  id v2;

  sub_1AB597B8C();
  return (PSSpecifier *)v2;
}

- (void)set_specifier:(id)a3
{
  id v5;
  _TtC12GameCenterUI27PlayerProfileViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AB597BFC((uint64_t)a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27PlayerProfileViewController_profilePresenter));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI27PlayerProfileViewController_clippingLayer);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI27PlayerProfileViewController_friendSuggestionsSectionFocusGuide);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI27PlayerProfileViewController__rootController);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27PlayerProfileViewController__specifier));
}

- (void)scrollToTopActionTriggered
{
  _TtC12GameCenterUI27PlayerProfileViewController *v2;

  v2 = self;
  sub_1AB597CDC((uint64_t)v2);

}

- (void)loadMoreWithContinuationToken:(id)a3
{
  _TtC12GameCenterUI27PlayerProfileViewController *v4;

  sub_1AB7DAF90();
  v4 = self;
  sub_1AB597DD8();

  swift_bridgeObjectRelease();
}

@end
