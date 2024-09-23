@implementation B389PairLockedViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService28B389PairLockedViewController *v4;

  v4 = self;
  sub_100050F74(a3);

}

- (void)learnMorePressed
{
  _TtC18SharingViewService28B389PairLockedViewController *v2;

  v2 = self;
  sub_100051E4C();

}

- (void)dismissPressed
{
  _TtC18SharingViewService28B389PairLockedViewController *v2;

  v2 = self;
  sub_100052204();

}

- (_TtC18SharingViewService28B389PairLockedViewController)initWithMainController:(id)a3
{
  id v3;
  _TtC18SharingViewService28B389PairLockedViewController *v4;

  v3 = a3;
  v4 = (_TtC18SharingViewService28B389PairLockedViewController *)sub_10005B3EC((uint64_t)v3);

  return v4;
}

- (_TtC18SharingViewService28B389PairLockedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC18SharingViewService28B389PairLockedViewController *)sub_100054B84((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_100052424);
}

- (_TtC18SharingViewService28B389PairLockedViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService28B389PairLockedViewController *)sub_100052548(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService28B389PairLockedViewController_btn));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService28B389PairLockedViewController_msgLbl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService28B389PairLockedViewController_avatarImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService28B389PairLockedViewController_lockImageView));
}

@end
