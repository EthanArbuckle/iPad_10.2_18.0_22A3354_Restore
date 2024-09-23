@implementation StickerPickerViewController

- (_TtC10StickerKit27StickerPickerViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC10StickerKit27StickerPickerViewController *result;

  v5 = OBJC_IVAR____TtC10StickerKit27StickerPickerViewController_sceneViewController;
  v6 = objc_allocWithZone((Class)STKStickerPickerSceneViewController);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR____TtC10StickerKit27StickerPickerViewController_sceneViewControllerDelegateProxy;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerPickerSceneViewControllerDelegateProxy()), sel_init);

  result = (_TtC10StickerKit27StickerPickerViewController *)sub_2347180B4();
  __break(1u);
  return result;
}

- (_TtC10StickerKit27StickerPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  _TtC10StickerKit27StickerPickerViewController *result;

  v6 = OBJC_IVAR____TtC10StickerKit27StickerPickerViewController_sceneViewController;
  v7 = objc_allocWithZone((Class)STKStickerPickerSceneViewController);
  v8 = a4;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);
  v9 = OBJC_IVAR____TtC10StickerKit27StickerPickerViewController_sceneViewControllerDelegateProxy;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerPickerSceneViewControllerDelegateProxy()), sel_init);

  result = (_TtC10StickerKit27StickerPickerViewController *)sub_2347180B4();
  __break(1u);
  return result;
}

- (_TtC10StickerKit27StickerPickerViewController)init
{
  uint64_t v3;
  id v4;
  _TtC10StickerKit27StickerPickerViewController *v5;
  uint64_t v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC10StickerKit27StickerPickerViewController_sceneViewController;
  v4 = objc_allocWithZone((Class)STKStickerPickerSceneViewController);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  v6 = OBJC_IVAR____TtC10StickerKit27StickerPickerViewController_sceneViewControllerDelegateProxy;
  *(Class *)((char *)&v5->super.super.super.isa + v6) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerPickerSceneViewControllerDelegateProxy()), sel_init);

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for StickerPickerViewController();
  return -[StickerPickerViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
}

- (void)loadView
{
  _TtC10StickerKit27StickerPickerViewController *v2;

  v2 = self;
  sub_2346B2580();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit27StickerPickerViewController_sceneViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit27StickerPickerViewController_sceneViewControllerDelegateProxy));
}

@end
