@implementation AvatarEditorViewController

- (void)viewDidLoad
{
  _TtC10StickerKit26AvatarEditorViewController *v2;

  v2 = self;
  sub_2345E3CD4();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC10StickerKit26AvatarEditorViewController *v4;

  v4 = self;
  sub_2345E3E50(a3);

}

- (_TtC10StickerKit26AvatarEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10StickerKit26AvatarEditorViewController *)AvatarEditorViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10StickerKit26AvatarEditorViewController)initWithCoder:(id)a3
{
  return (_TtC10StickerKit26AvatarEditorViewController *)AvatarEditorViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_2345B0C20((uint64_t)self + OBJC_IVAR____TtC10StickerKit26AvatarEditorViewController_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit26AvatarEditorViewController_coordinator));
}

@end
