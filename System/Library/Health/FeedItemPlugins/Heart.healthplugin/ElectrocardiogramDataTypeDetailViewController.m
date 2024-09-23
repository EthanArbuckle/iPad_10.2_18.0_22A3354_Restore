@implementation ElectrocardiogramDataTypeDetailViewController

- (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _TtC5Heart45ElectrocardiogramDataTypeDetailViewController *result;

  v5 = (char *)self
     + OBJC_IVAR____TtC5Heart45ElectrocardiogramDataTypeDetailViewController_consumedHealthExperienceStore;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v6 = OBJC_IVAR____TtC5Heart45ElectrocardiogramDataTypeDetailViewController_objectType;
  v7 = (void *)objc_opt_self();
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_electrocardiogramType);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart45ElectrocardiogramDataTypeDetailViewController_cancellables) = (Class)MEMORY[0x24BEE4B08];

  result = (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController *)sub_231414EE4();
  __break(1u);
  return result;
}

- (id)createDataProviderWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5
{
  id v8;
  id v9;
  _TtC5Heart45ElectrocardiogramDataTypeDetailViewController *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = sub_2313090B8(v8, (uint64_t)v9, a5);

  return v11;
}

- (void)viewDidLoad
{
  _TtC5Heart45ElectrocardiogramDataTypeDetailViewController *v2;

  v2 = self;
  sub_231309280();

}

- (BOOL)isPinned
{
  _TtC5Heart45ElectrocardiogramDataTypeDetailViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_23130943C();

  return v3 & 1;
}

- (void)setPinned:(BOOL)a3
{
  _TtC5Heart45ElectrocardiogramDataTypeDetailViewController *v4;

  v4 = self;
  sub_231309684(a3);

}

- (void)showAddDataVC
{
  _TtC5Heart45ElectrocardiogramDataTypeDetailViewController *v2;

  v2 = self;
  sub_231309870();

}

- (void)didSelectRegulatoryRow
{
  _TtC5Heart45ElectrocardiogramDataTypeDetailViewController *v2;

  v2 = self;
  sub_231309D18();

}

- (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController)initWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5
{
  id v6;
  id v7;
  _TtC5Heart45ElectrocardiogramDataTypeDetailViewController *result;

  v6 = a3;
  v7 = a4;
  result = (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController)initWithUsingInsetStyling:(BOOL)a3
{
  _TtC5Heart45ElectrocardiogramDataTypeDetailViewController *result;

  result = (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController)initWithStyle:(int64_t)a3
{
  _TtC5Heart45ElectrocardiogramDataTypeDetailViewController *result;

  result = (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Heart45ElectrocardiogramDataTypeDetailViewController *result;

  v4 = a4;
  result = (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2312F1A20((uint64_t)self + OBJC_IVAR____TtC5Heart45ElectrocardiogramDataTypeDetailViewController_consumedHealthExperienceStore, &qword_255ECC210, (void (*)(uint64_t))sub_23130ABBC);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart45ElectrocardiogramDataTypeDetailViewController_objectType));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart45ElectrocardiogramDataTypeDetailViewController_displayType));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart45ElectrocardiogramDataTypeDetailViewController_viewControllerFactory));
  _s5Heart41FeedItemContextPreviousFeedItemFetcherBoxVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Heart45ElectrocardiogramDataTypeDetailViewController_pinnedContentManager);
  swift_bridgeObjectRelease();
}

@end
