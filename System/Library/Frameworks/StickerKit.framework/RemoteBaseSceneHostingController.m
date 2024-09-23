@implementation RemoteBaseSceneHostingController

- (id)activityType
{
  return (id)sub_234717730();
}

- (void)sendAction:(id)a3
{
  id v5;
  _TtC10StickerKit32RemoteBaseSceneHostingController *v6;
  id v7;

  swift_getKeyPath();
  swift_getKeyPath();
  v5 = a3;
  v6 = self;
  sub_234717B5C();
  swift_release();
  swift_release();
  objc_msgSend(v7, sel_sendAction_, v5);

}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RemoteBaseSceneHostingController();
  v2 = v6.receiver;
  -[RemoteBaseSceneHostingController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

    sub_23467AE38();
  }
  else
  {
    __break(1u);
  }
}

- (id)transitionerForConnectingHostingController:(id)a3
{
  void *v3;
  _QWORD v5[6];

  v5[4] = sub_23462E1F4;
  v5[5] = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_2346524EC;
  v5[3] = &block_descriptor_14;
  v3 = _Block_copy(v5);
  swift_release();
  return v3;
}

- (_TtC10StickerKit32RemoteBaseSceneHostingController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  _TtC10StickerKit32RemoteBaseSceneHostingController *v10;
  objc_super v12;

  if (a3)
  {
    sub_234717754();
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  sub_2345B0BE8(0, (unint64_t *)&unk_256176570);
  v8 = a4;
  sub_234717B74();
  if (v7)
  {
    v9 = (void *)sub_234717730();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for RemoteBaseSceneHostingController();
  v10 = -[RemoteBaseSceneHostingController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, v9, v8);

  return v10;
}

- (_TtC10StickerKit32RemoteBaseSceneHostingController)initWithCoder:(id)a3
{
  id v5;
  _TtC10StickerKit32RemoteBaseSceneHostingController *v6;
  objc_super v8;

  sub_2345B0BE8(0, (unint64_t *)&unk_256176570);
  v5 = a3;
  sub_234717B74();
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RemoteBaseSceneHostingController();
  v6 = -[RemoteBaseSceneHostingController initWithCoder:](&v8, sel_initWithCoder_, v5);

  return v6;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC10StickerKit32RemoteBaseSceneHostingController__sceneHostingController;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256176750);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
