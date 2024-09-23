@implementation ASUIPasskeyEntryViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[ASUIPasskeyEntryViewController viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(v2, "setDismissalType:", 1, v3.receiver, v3.super_class);

}

- (void)textDidChange:(id)a3
{
  id v4;
  _TtC16AccessorySetupUI30ASUIPasskeyEntryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100025774(v4);

}

- (void)didCompleteTextEntry:(id)a3
{
  id v4;
  _TtC16AccessorySetupUI30ASUIPasskeyEntryViewController *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  v5 = self;
  v6 = -[ASUIPasskeyEntryViewController actions](v5, "actions");
  v7 = sub_100025C74();
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);

  if (!((unint64_t)v8 >> 62))
  {
    if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_11:
    swift_bridgeObjectRelease(v8);
    __break(1u);
    goto LABEL_12;
  }
  if (v8 < 0)
    v10 = v8;
  else
    v10 = v8 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v8);
  v11 = _CocoaArrayWrapper.endIndex.getter(v10);
  swift_bridgeObjectRelease(v8);
  if (!v11)
    goto LABEL_11;
LABEL_3:
  if ((v8 & 0xC000000000000001) != 0)
  {
LABEL_12:
    v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v8);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v9 = *(id *)(v8 + 32);
LABEL_6:
    v12 = v9;
    swift_bridgeObjectRelease(v8);
    objc_msgSend(v12, "setEnabled:", 1);

    return;
  }
  __break(1u);
}

- (_TtC16AccessorySetupUI30ASUIPasskeyEntryViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_type] = 4;
  v6 = &self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_routingContext];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  *((_QWORD *)v6 + 2) = 1;
  *(_OWORD *)(v6 + 24) = 0u;
  *(_OWORD *)(v6 + 40) = 0u;
  *(_OWORD *)(v6 + 56) = 0u;
  v7 = &self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_router];
  *((_QWORD *)v7 + 1) = 0;
  swift_unknownObjectWeakInit(v7, 0);
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[ASUIPasskeyEntryViewController initWithContentView:](&v9, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)&self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_routingContext];
  sub_10000A0A4(*(_QWORD *)&self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_routingContext], v3[1], v3[2], v3[3], v3[4], v3[5], v3[6], v3[7]);
  sub_10000A0F8((uint64_t)&self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_router], v4);
}

@end
