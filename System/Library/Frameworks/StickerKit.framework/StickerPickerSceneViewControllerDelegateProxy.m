@implementation StickerPickerSceneViewControllerDelegateProxy

- (void)stickerPickerSceneDidRequestDismissal:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC10StickerKitP33_FA83C3E8A3D22FA88BB215AEFD764D8A45StickerPickerSceneViewControllerDelegateProxy *v7;
  id v8;

  v5 = MEMORY[0x234944A84]((char *)self+ OBJC_IVAR____TtC10StickerKitP33_FA83C3E8A3D22FA88BB215AEFD764D8A45StickerPickerSceneViewControllerDelegateProxy_stickerPickerViewController, a2);
  if (v5)
  {
    v8 = (id)v5;
    v6 = a3;
    v7 = self;
    objc_msgSend(v8, sel_dismissViewControllerAnimated_completion_, 1, 0);

  }
}

- (_TtC10StickerKitP33_FA83C3E8A3D22FA88BB215AEFD764D8A45StickerPickerSceneViewControllerDelegateProxy)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for StickerPickerSceneViewControllerDelegateProxy();
  return -[StickerPickerSceneViewControllerDelegateProxy init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
