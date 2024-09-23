@implementation BaseSplitCollectionViewController

- (_TtC12GameCenterUI33BaseSplitCollectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  BaseSplitCollectionViewController.init(coder:)();
}

+ (double)topInsetWithCustomHeader
{
  return 165.0;
}

+ (double)topAndBottomInsetForCustomHeader
{
  return 40.0;
}

+ (double)leadingAndTrailingInsetForCustomHeader
{
  return 25.0;
}

+ (double)customHeaderHeight
{
  return 125.0;
}

+ (double)mainCollectionViewWidth
{
  return static BaseSplitCollectionViewController.mainCollectionViewWidth.getter();
}

- (UICollectionView)secondaryCollectionView
{
  return (UICollectionView *)sub_1AB5F83E0();
}

- (void)setSecondaryCollectionView:(id)a3
{
  id v5;
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AB5F8424(a3);

}

- (_TtC12GameCenterUI12GradientView)leftPaneBackgroundView
{
  return (_TtC12GameCenterUI12GradientView *)sub_1AB5FB064();
}

- (void)loadView
{
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v2;

  v2 = self;
  sub_1AB5FB074();

}

- (NSDirectionalEdgeInsets)collectionViewFrameInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  sub_1AB5FB320(self, (uint64_t)a2, sub_1AB5F8228);
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (NSDirectionalEdgeInsets)secondaryCollectionViewFrameInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  sub_1AB5FB320(self, (uint64_t)a2, sub_1AB5F84B8);
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)mainSecondaryCollectionViewLayout
{
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v2;

  v2 = self;
  sub_1AB5F8DC8((uint64_t)v2);

}

- (double)mainSecondaryCollectionViewSpacing
{
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v2;
  double v3;

  v2 = self;
  v3 = sub_1AB5FA168();

  return v3;
}

- (BOOL)shouldDisplayInSplitView
{
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1AB5FA1D8((uint64_t)v2);

  return v3 & 1;
}

- (BOOL)shouldDisplayCustomHeader
{
  return sub_1AB5FA4B0() & 1;
}

- (void)setShouldDisplayCustomHeader:(BOOL)a3
{
  sub_1AB5FA4C0(a3);
}

- (UICollectionViewCompositionalLayout)secondaryCompositionalLayout
{
  id v2;

  sub_1AB5FA4D0();
  return (UICollectionViewCompositionalLayout *)v2;
}

- (void)setSecondaryCompositionalLayout:(id)a3
{
  id v5;
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AB5FA4F8((uint64_t)a3);

}

- (_TtC12GameCenterUI18BaseSplitPresenter)dataPresenter
{
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AB5FB4D4();

  return (_TtC12GameCenterUI18BaseSplitPresenter *)v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AB5FB528((uint64_t)a3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v6;

  swift_unknownObjectRetain();
  v6 = self;
  sub_1AB5FB5BC(a4);
  swift_unknownObjectRelease();

}

- (void)viewDidLoad
{
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v2;

  v2 = self;
  sub_1AB5FB898();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v4;

  v4 = self;
  sub_1AB5FB95C(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v3;

  v3 = self;
  sub_1AB5FBA44();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v3;

  v3 = self;
  sub_1AB5FBAD4();

}

- (void)viewWillLayoutSubviews
{
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v2;

  v2 = self;
  sub_1AB5FE3E4(type metadata accessor for BaseSplitCollectionViewController, (SEL *)&selRef_viewWillLayoutSubviews);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1AB5FC5F4(self, (uint64_t)a2, a3, a4, (uint64_t)a5, sub_1AB5FBBB0);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1AB5FC5F4(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))sub_1AB5FC39C);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB5F8078();

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB5FC704(v4);

}

- (id)makeSecondaryLayout
{
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1AB5FA5A8();
  v4 = v3;

  return v4;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v11;
  uint64_t v13;

  v6 = sub_1AB7D7D68();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_1AB5FD0A4();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v11;
  uint64_t v12;

  v6 = sub_1AB7D7D68();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v10 = a3;
  v11 = self;
  sub_1AB5FD384();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v15;
  uint64_t v16;

  v9 = sub_1AB7D7D68();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7DAF90();
  sub_1AB7D7D14();
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1AB5FD630();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = sub_1AB7D7D68();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v11 = a3;
  v12 = self;
  sub_1AB5FDB84();
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC12GameCenterUI33BaseSplitCollectionViewController *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_1AB5FDE90(v6);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI33BaseSplitCollectionViewController_secondaryCollectionView));
  swift_release();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI33BaseSplitCollectionViewController_leftPaneBackgroundView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI33BaseSplitCollectionViewController_secondaryCompositionalLayout);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI33BaseSplitCollectionViewController_secondaryDiffableDataSource);
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI33BaseSplitCollectionViewController____lazy_storage___updateCollectionViewConstraintOnce));
}

@end
