@implementation BaseCollectionViewController

- (_TtC12GameCenterUI28BaseCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1AB7DAF90();
  v5 = a4;
  return (_TtC12GameCenterUI28BaseCollectionViewController *)BaseCollectionViewController.init(nibName:bundle:)();
}

- (_TtC12GameCenterUI28BaseCollectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB4CFAB0();
}

- (UICollectionView)collectionView
{
  _TtC12GameCenterUI28BaseCollectionViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1AB4CFBE0();

  return (UICollectionView *)v3;
}

- (void)setCollectionView:(id)a3
{
  id v5;
  _TtC12GameCenterUI28BaseCollectionViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AB4CFC5C(a3);

}

- (void)viewDidLoad
{
  _TtC12GameCenterUI28BaseCollectionViewController *v2;

  v2 = self;
  sub_1AB4D0EB0((SEL *)&selRef_viewDidLoad);

}

- (void)loadView
{
  _TtC12GameCenterUI28BaseCollectionViewController *v2;

  v2 = self;
  sub_1AB4D034C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12GameCenterUI28BaseCollectionViewController *v4;

  v4 = self;
  sub_1AB4D0640(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12GameCenterUI28BaseCollectionViewController *v4;

  v4 = self;
  sub_1AB4D0854(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC12GameCenterUI28BaseCollectionViewController *v2;

  v2 = self;
  sub_1AB4D08E4();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC12GameCenterUI28BaseCollectionViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1AB4D0AB8((uint64_t)a4, width, height);
  swift_unknownObjectRelease();

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC12GameCenterUI28BaseCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB4D0D5C();

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC12GameCenterUI28BaseCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB4CF71C();

}

- (_TtC12GameCenterUI28BaseCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;

  v3 = a3;
  BaseCollectionViewController.init(collectionViewLayout:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI28BaseCollectionViewController_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI28BaseCollectionViewController_scrollObserver));
  swift_release();
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  return BaseCollectionViewController.presentingViewController(for:)();
}

@end
