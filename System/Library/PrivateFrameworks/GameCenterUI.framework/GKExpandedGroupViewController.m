@implementation GKExpandedGroupViewController

- (UIButton)doneButton
{
  sub_1AB757F7C();
}

- (void)setDoneButton:(id)a3
{
  id v4;
  _TtC12GameCenterUI29GKExpandedGroupViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB757FD0();

}

- (UICollectionView)collectionView
{
  sub_1AB758018();
}

- (void)setCollectionView:(id)a3
{
  id v4;
  _TtC12GameCenterUI29GKExpandedGroupViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB75806C();

}

- (NSLayoutConstraint)contentViewWidthConstraint
{
  sub_1AB7580B4();
}

- (void)setContentViewWidthConstraint:(id)a3
{
  id v4;
  _TtC12GameCenterUI29GKExpandedGroupViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB758108();

}

- (UIVisualEffectView)visualEffectView
{
  sub_1AB758150();
}

- (void)setVisualEffectView:(id)a3
{
  id v4;
  _TtC12GameCenterUI29GKExpandedGroupViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB7581A4();

}

- (UIView)container
{
  sub_1AB7581EC();
}

- (void)setContainer:(id)a3
{
  id v4;
  _TtC12GameCenterUI29GKExpandedGroupViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB758240();

}

- (UILabel)titleLabel
{
  sub_1AB758288();
}

- (void)setTitleLabel:(id)a3
{
  id v4;
  _TtC12GameCenterUI29GKExpandedGroupViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB7582DC();

}

- (NSLayoutConstraint)collectionViewHeightConstraint
{
  sub_1AB758324();
}

- (void)setCollectionViewHeightConstraint:(id)a3
{
  id v4;
  _TtC12GameCenterUI29GKExpandedGroupViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB758378();

}

- (_TtP12GameCenterUI37GKExpandedGroupViewControllerDelegate_)delegate
{
  return (_TtP12GameCenterUI37GKExpandedGroupViewControllerDelegate_ *)(id)sub_1AB7583C0();
}

- (void)setDelegate:(id)a3
{
  _TtC12GameCenterUI29GKExpandedGroupViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AB758454();

}

- (void)viewDidLoad
{
  self;
  sub_1AB7587F0();
}

- (void)viewDidLayoutSubviews
{
  _TtC12GameCenterUI29GKExpandedGroupViewController *v2;

  v2 = self;
  sub_1AB758E2C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;

  v5 = a3;
  self;
  sub_1AB758F90((uint64_t)a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12GameCenterUI29GKExpandedGroupViewController *v4;

  v4 = self;
  sub_1AB7591B8(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  self;
  sub_1AB7593C4(a3);
}

- (void)dismissView
{
  _TtC12GameCenterUI29GKExpandedGroupViewController *v2;

  v2 = self;
  sub_1AB7594A0();

}

- (void)configureWithPlayers:(id)a3 groupName:(id)a4 caption:(id)a5 playerSelectionProxy:(id)a6
{
  uint64_t v10;
  _TtC12GameCenterUI29GKExpandedGroupViewController *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  sub_1AB476E40(0, (unint64_t *)&qword_1EEBFC5B8);
  v10 = sub_1AB7DB0EC();
  if (a4)
    sub_1AB7DAF90();
  if (a5)
    sub_1AB7DAF90();
  v11 = self;
  swift_unknownObjectRetain();
  sub_1AB7594EC(v10, v12, v13, v14, v15, (uint64_t)a6);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC12GameCenterUI29GKExpandedGroupViewController *v8;

  v6 = sub_1AB7D7D68();
  MEMORY[0x1E0C80A78](v6);
  sub_1AB7D7D14();
  v7 = a3;
  v8 = self;
  sub_1AB75964C(v7);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC12GameCenterUI29GKExpandedGroupViewController *v8;

  v6 = sub_1AB7D7D68();
  MEMORY[0x1E0C80A78](v6);
  sub_1AB7D7D14();
  v7 = a3;
  v8 = self;
  sub_1AB759864();
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC12GameCenterUI29GKExpandedGroupViewController *v8;

  v6 = sub_1AB7D7D68();
  MEMORY[0x1E0C80A78](v6);
  sub_1AB7D7D14();
  v7 = a3;
  v8 = self;
  sub_1AB759920();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5;
  _TtC12GameCenterUI29GKExpandedGroupViewController *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1AB7599EC();

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  _TtC12GameCenterUI29GKExpandedGroupViewController *v11;

  v8 = sub_1AB7D7D68();
  MEMORY[0x1E0C80A78](v8);
  sub_1AB7D7D14();
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1AB759A98();
}

- (_TtC12GameCenterUI29GKExpandedGroupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _TtC12GameCenterUI29GKExpandedGroupViewController *result;

  sub_1AB75AB34((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, GKExpandedGroupViewController.init(nibName:bundle:));
  return result;
}

- (_TtC12GameCenterUI29GKExpandedGroupViewController)initWithCoder:(id)a3
{
  id v3;
  _TtC12GameCenterUI29GKExpandedGroupViewController *result;

  v3 = a3;
  GKExpandedGroupViewController.init(coder:)();
  return result;
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_26_30();
  OUTLINED_FUNCTION_26_30();
  OUTLINED_FUNCTION_26_30();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  sub_1AB4CB5BC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI29GKExpandedGroupViewController_playerSelectionProxy);
  sub_1AB4CB5BC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI29GKExpandedGroupViewController_delegate);
  OUTLINED_FUNCTION_7_28();
  swift_bridgeObjectRelease();
}

@end
