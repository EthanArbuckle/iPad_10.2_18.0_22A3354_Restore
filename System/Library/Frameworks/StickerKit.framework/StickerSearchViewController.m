@implementation StickerSearchViewController

- (void)viewDidLoad
{
  _TtC10StickerKit27StickerSearchViewController *v2;

  v2 = self;
  sub_234612BA0();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC10StickerKit27StickerSearchViewController *v4;

  v4 = self;
  sub_234613924(a3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  _TtC10StickerKit27StickerSearchViewController *v2;

  v2 = self;
  sub_234614CF0();

}

- (void)dealloc
{
  uint64_t v2;
  _TtC10StickerKit27StickerSearchViewController *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  objc_super v8;

  v2 = qword_256171BA0;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = sub_234716224();
  __swift_project_value_buffer(v4, (uint64_t)qword_256175770);
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
  v8.super_class = (Class)type metadata accessor for StickerSearchViewController();
  -[StickerSearchViewController dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit27StickerSearchViewController_hostingController));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit27StickerSearchViewController____lazy_storage___availability));
  sub_2345B0C20((uint64_t)self + OBJC_IVAR____TtC10StickerKit27StickerSearchViewController_delegate);
}

- (_TtC10StickerKit27StickerSearchViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10StickerKit27StickerSearchViewController *)StickerSearchViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10StickerKit27StickerSearchViewController)initWithCoder:(id)a3
{
  return (_TtC10StickerKit27StickerSearchViewController *)StickerSearchViewController.init(coder:)(a3);
}

@end
