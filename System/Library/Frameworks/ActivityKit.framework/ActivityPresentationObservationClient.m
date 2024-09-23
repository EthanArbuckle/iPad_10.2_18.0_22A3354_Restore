@implementation ActivityPresentationObservationClient

- (id)listenForActivityPresentationWithActivityIdentifier:(id)a3 presenterBundleIdentifier:(id)a4 handler:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC11ActivityKit37ActivityPresentationObservationClient *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];

  v6 = _Block_copy(a5);
  sub_232E6F1EC();
  sub_232E6F1EC();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = qword_255FFC928;
  v9 = self;
  if (v8 != -1)
    swift_once();
  v10 = (void *)qword_255FFD4C8;
  v11 = (void *)sub_232E6F1E0();
  v12 = (void *)sub_232E6F1E0();
  v16[4] = sub_232DFDB54;
  v16[5] = v7;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 1107296256;
  v16[2] = sub_232DFAF90;
  v16[3] = &block_descriptor_44;
  v13 = _Block_copy(v16);
  swift_retain();
  swift_release();
  v14 = objc_msgSend(v10, sel_listenForActivityPresentationWithActivityIdentifier_presenterBundleIdentifier_handler_, v11, v12, v13);
  _Block_release(v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return v14;
}

- (_TtC11ActivityKit37ActivityPresentationObservationClient)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActivityPresentationObservationClient();
  return -[ActivityPresentationObservationClient init](&v3, sel_init);
}

@end
