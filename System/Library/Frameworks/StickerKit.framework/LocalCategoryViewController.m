@implementation LocalCategoryViewController

- (void)viewDidLoad
{
  _TtC10StickerKit27LocalCategoryViewController *v2;

  v2 = self;
  sub_234605D1C();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  _TtC10StickerKit27LocalCategoryViewController *v2;

  v2 = self;
  sub_234606A40();

}

- (void)dealloc
{
  uint64_t v2;
  _TtC10StickerKit27LocalCategoryViewController *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  objc_super v8;

  v2 = qword_256171B88;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = sub_234716224();
  __swift_project_value_buffer(v4, (uint64_t)qword_256175020);
  v5 = sub_23471620C();
  v6 = sub_234717AE4();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23459E000, v5, v6, "deinit", v7, 2u);
    MEMORY[0x2349449B8](v7, -1, -1);
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for LocalCategoryViewController();
  -[LocalCategoryViewController dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC10StickerKit27LocalCategoryViewController__hostingController;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256175220);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC10StickerKit27LocalCategoryViewController__configuration;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256175228);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_release();
}

- (_TtC10StickerKit27LocalCategoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_234717754();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC10StickerKit27LocalCategoryViewController *)LocalCategoryViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10StickerKit27LocalCategoryViewController)initWithCoder:(id)a3
{
  return (_TtC10StickerKit27LocalCategoryViewController *)LocalCategoryViewController.init(coder:)(a3);
}

@end
