@implementation SpecifierViewController

- (_TtC18HealthExperienceUI23SpecifierViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI23SpecifierViewController *result;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC18HealthExperienceUI23SpecifierViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUI23SpecifierViewController_shouldReloadSpecifiersAfterSelection) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUI23SpecifierViewController_shouldReloadSpecifiersOnViewWillAppear) = 1;
  v5 = a3;

  result = (_TtC18HealthExperienceUI23SpecifierViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SpecifierViewController();
  v2 = v8.receiver;
  -[SpecifierViewController viewDidLoad](&v8, sel_viewDidLoad);
  sub_1A961ADFC();
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1A9AA1E80;
  v4 = sub_1A9A93E44();
  v5 = MEMORY[0x1E0DC2160];
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  v6 = sub_1A9A94360();
  v7 = MEMORY[0x1E0DC29B0];
  *(_QWORD *)(v3 + 48) = v6;
  *(_QWORD *)(v3 + 56) = v7;
  MEMORY[0x1AF41ACF8](v3, sel_reloadSpecifiers);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SpecifierViewController();
  v4 = v5.receiver;
  -[SpecifierViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  if (*((_BYTE *)v4
       + OBJC_IVAR____TtC18HealthExperienceUI23SpecifierViewController_shouldReloadSpecifiersOnViewWillAppear) == 1)
  {
    sub_1A961A364();
    objc_msgSend(v4, sel_reloadSpecifiers, v5.receiver, v5.super_class);
  }

}

- (int64_t)tableViewStyle
{
  return 2;
}

- (void)dismissNavigationController
{
  _TtC18HealthExperienceUI23SpecifierViewController *v2;
  _TtC18HealthExperienceUI23SpecifierViewController *v3;
  _TtC18HealthExperienceUI23SpecifierViewController *v4;
  _TtC18HealthExperienceUI23SpecifierViewController *v5;

  v5 = self;
  v2 = (_TtC18HealthExperienceUI23SpecifierViewController *)-[SpecifierViewController navigationController](v5, sel_navigationController);
  if (v2)
  {
    v3 = v2;
    -[SpecifierViewController dismissViewControllerAnimated:completion:](v2, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }

}

- (id)specifiers
{
  _TtC18HealthExperienceUI23SpecifierViewController *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1A9619F28();

  if (v3)
  {
    v4 = (void *)sub_1A9A95A58();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC18HealthExperienceUI23SpecifierViewController *v11;
  uint64_t v12;

  v6 = sub_1A9A921DC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A9217C();
  v10 = a3;
  v11 = self;
  sub_1A961A188((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC18HealthExperienceUI23SpecifierViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC18HealthExperienceUI23SpecifierViewController *result;

  v4 = a4;
  result = (_TtC18HealthExperienceUI23SpecifierViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23SpecifierViewController_dataSource));
  sub_1A961AEDC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI23SpecifierViewController_delegate);
}

@end
