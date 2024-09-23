@implementation PageCollectionViewController

- (_TtC7MusicUI28PageCollectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21D28C334();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC7MusicUI28PageCollectionViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_21D28C3B4(a4, width, height);
  swift_unknownObjectRelease();

}

- (_TtC7MusicUI28PageCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;

  v3 = a3;
  sub_21D28F658();
}

- (_TtC7MusicUI28PageCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_21D7C50F4();
  v5 = a4;
  sub_21D28F694();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7MusicUI28PageCollectionViewController_dataSource));
}

@end
