@implementation ActivityQoSObservationClient

- (id)listenForActivityQoSWithActivityIdentifier:(id)a3 handler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC11ActivityKit28ActivityQoSObservationClient *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];

  v5 = _Block_copy(a4);
  sub_232E6F1EC();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = qword_255FFC948;
  v8 = self;
  if (v7 != -1)
    swift_once();
  v9 = (void *)qword_255FFE7A8;
  v10 = (void *)sub_232E6F1E0();
  v14[4] = sub_232DFDB54;
  v14[5] = v6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_232DFAF90;
  v14[3] = &block_descriptor_44_1;
  v11 = _Block_copy(v14);
  swift_retain();
  swift_release();
  v12 = objc_msgSend(v9, sel_listenForActivityQoSWithActivityIdentifier_handler_, v10, v11);
  _Block_release(v11);

  swift_bridgeObjectRelease();
  swift_release();

  return v12;
}

- (_TtC11ActivityKit28ActivityQoSObservationClient)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActivityQoSObservationClient();
  return -[ActivityQoSObservationClient init](&v3, sel_init);
}

@end
