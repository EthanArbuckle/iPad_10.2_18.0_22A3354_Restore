@implementation LocalStickerEffectEditorViewController

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC10StickerKit38LocalStickerEffectEditorViewController *v3;

  v3 = self;
  sub_2346977A0();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  _TtC10StickerKit38LocalStickerEffectEditorViewController *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  objc_super v10;

  v3 = a3;
  v4 = qword_256171CE0;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_234716224();
  __swift_project_value_buffer(v6, (uint64_t)qword_256179570);
  v7 = sub_23471620C();
  v8 = sub_234717AE4();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_23459E000, v7, v8, "viewWillDisappear", v9, 2u);
    MEMORY[0x2349449B8](v9, -1, -1);
  }

  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for LocalStickerEffectEditorViewController();
  -[LocalStickerEffectEditorViewController viewWillDisappear:](&v10, sel_viewWillDisappear_, v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  uint64_t v2;
  _TtC10StickerKit38LocalStickerEffectEditorViewController *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  objc_super v8;

  v2 = qword_256171CE0;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = sub_234716224();
  __swift_project_value_buffer(v4, (uint64_t)qword_256179570);
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
  v8.super_class = (Class)type metadata accessor for LocalStickerEffectEditorViewController();
  -[LocalStickerEffectEditorViewController dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38LocalStickerEffectEditorViewController_stickerEditorController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38LocalStickerEffectEditorViewController_sticker));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38LocalStickerEffectEditorViewController_stillRepresentation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38LocalStickerEffectEditorViewController_animatedRepresentation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38LocalStickerEffectEditorViewController_imageGlyph));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38LocalStickerEffectEditorViewController_previewView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38LocalStickerEffectEditorViewController_effect));
}

- (_TtC10StickerKit38LocalStickerEffectEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10StickerKit38LocalStickerEffectEditorViewController *)LocalStickerEffectEditorViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10StickerKit38LocalStickerEffectEditorViewController)initWithCoder:(id)a3
{
  return (_TtC10StickerKit38LocalStickerEffectEditorViewController *)LocalStickerEffectEditorViewController.init(coder:)(a3);
}

@end
