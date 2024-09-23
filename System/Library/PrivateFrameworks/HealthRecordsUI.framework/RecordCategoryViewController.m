@implementation RecordCategoryViewController

- (NSString)sidebarSelectionIdentifier
{
  _TtC15HealthRecordsUI28RecordCategoryViewController *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1BC4815E8();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1BC62C650();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (_TtC15HealthRecordsUI28RecordCategoryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC4861AC();
}

- (void)viewDidLoad
{
  _TtC15HealthRecordsUI28RecordCategoryViewController *v2;

  v2 = self;
  sub_1BC48171C();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC15HealthRecordsUI28RecordCategoryViewController *v4;

  v4 = self;
  sub_1BC481CC0(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC15HealthRecordsUI28RecordCategoryViewController *v2;

  v2 = self;
  sub_1BC481DF8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RecordCategoryViewController();
  v4 = v7.receiver;
  -[RecordCategoryViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  if (*((_BYTE *)v4 + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_category) == 2)
  {
    v5 = objc_msgSend(v4, sel_traitCollection, v7.receiver, v7.super_class);
    v6 = objc_msgSend(v5, sel_userInterfaceIdiom);

    if (v6 == (id)1)
      sub_1BC482598();
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RecordCategoryViewController();
  v4 = v5.receiver;
  -[RecordCategoryViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  sub_1BC482C34(1, 0, 0);

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  _TtC15HealthRecordsUI28RecordCategoryViewController *v11;

  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_1BC486A8C;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = self;
  sub_1BC482040(v10, a4, (uint64_t)v8, v9);
  sub_1BC36D770((uint64_t)v8);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15HealthRecordsUI28RecordCategoryViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1BC482384(a3);

}

- (void)showPinnedLabsPopoverIfNeeded
{
  _TtC15HealthRecordsUI28RecordCategoryViewController *v2;

  v2 = self;
  sub_1BC4828E4();

}

- (void)modePickerDidChange:(id)a3
{
  _TtC15HealthRecordsUI28RecordCategoryViewController *v4;
  _TtC15HealthRecordsUI28RecordCategoryViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1BC62D088();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1BC482D90();

  sub_1BC348D78((uint64_t)v6, (uint64_t (*)(_QWORD))sub_1BC39BD68);
}

- (void)tapToRadar:(id)a3
{
  _TtC15HealthRecordsUI28RecordCategoryViewController *v4;
  _TtC15HealthRecordsUI28RecordCategoryViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1BC62D088();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  type metadata accessor for TapToRadarManager();
  static TapToRadarManager.presentTapToRadarDialogue(from:)(self);

  sub_1BC348D78((uint64_t)v6, (uint64_t (*)(_QWORD))sub_1BC39BD68);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _TtC15HealthRecordsUI28RecordCategoryViewController *v6;

  v6 = self;
  sub_1BC482F84(a3, a4);

}

- (void)presentPDFViewController
{
  _TtC15HealthRecordsUI28RecordCategoryViewController *v2;

  v2 = self;
  sub_1BC483064();

}

- (_TtC15HealthRecordsUI28RecordCategoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15HealthRecordsUI28RecordCategoryViewController *result;

  v4 = a4;
  result = (_TtC15HealthRecordsUI28RecordCategoryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_profile));
  v3 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_category);
  objc_release(*(id *)((char *)&self->super._navigationItem
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_category));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_currentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_gradientView));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_gradientColorProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_labsTipTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_currentPalette));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController____lazy_storage___modePicker));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController____lazy_storage___resultViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController____lazy_storage___searchController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController____lazy_storage___changeProvider));
  swift_release();
  swift_release();
  sub_1BC407EFC(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController____lazy_storage___udcListViewController));
  sub_1BC407EFC(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController____lazy_storage___latestViewContoller));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController____lazy_storage___lastUpdatedViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController____lazy_storage___alphabeticalViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_labsOnboardingViewController));
  swift_release();
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  _TtC15HealthRecordsUI28RecordCategoryViewController *v5;

  v4 = a3;
  v5 = self;
  _s15HealthRecordsUI28RecordCategoryViewControllerC19updateSearchResults3forySo08UISearchG0C_tF_0();

}

- (void)willPresentSearchController:(id)a3
{
  -[RecordCategoryViewController setEditing:animated:](self, sel_setEditing_animated_, 0, 1);
}

- (void)willDismissSearchController:(id)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI28RecordCategoryViewController_isSearching) = 0;
}

- (void)didDismissSearchController:(id)a3
{
  id v4;
  _TtC15HealthRecordsUI28RecordCategoryViewController *v5;

  v4 = a3;
  v5 = self;
  _s15HealthRecordsUI28RecordCategoryViewControllerC016didDismissSearchG0yySo08UISearchG0CF_0();

}

@end
