@implementation FBAActionMenuController

- (_TtC18Feedback_Assistant23FBAActionMenuController)initWithTitle:(id)a3 subtitle:(id)a4 actions:(id)a5
{
  return (_TtC18Feedback_Assistant23FBAActionMenuController *)sub_100071514((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000704CC);
}

- (void)addActionWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5
{
  sub_100071C40(self, (int)a2, (uint64_t)a3, a4, a5, (uint64_t)&unk_1000E9928, (uint64_t)sub_100072DC8, (void (*)(uint64_t, uint64_t, void *, uint64_t, uint64_t))sub_1000705C4);
}

- (void)addAction:(id)a3
{
  _QWORD *v5;
  id v6;
  _TtC18Feedback_Assistant23FBAActionMenuController *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant23FBAActionMenuController_actions);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC18Feedback_Assistant23FBAActionMenuController_actions, v11, 33, 0);
  v6 = a3;
  v7 = self;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v7);
  v9 = *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v8 = *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v9 >= v8 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v8 > 1, v9 + 1, 1);
  v10 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v6);
  specialized Array._endMutation()(v10);
  swift_endAccess(v11);

}

- (id)buildMenu
{
  _TtC18Feedback_Assistant23FBAActionMenuController *v2;
  Class v3;

  v2 = self;
  v3 = sub_1000707F0();

  return v3;
}

- (void)attachToBarButtonItem:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant23FBAActionMenuController *v5;
  Class v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1000707F0();
  objc_msgSend(v4, "setMenu:", v6);

}

- (_TtC18Feedback_Assistant23FBAActionMenuController)init
{
  _TtC18Feedback_Assistant23FBAActionMenuController *result;

  result = (_TtC18Feedback_Assistant23FBAActionMenuController *)_swift_stdlib_reportUnimplementedInitializer("Feedback_Assistant.FBAActionMenuController", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10007261C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18Feedback_Assistant23FBAActionMenuController_actions, &OBJC_IVAR____TtC18Feedback_Assistant23FBAActionMenuController_title, &OBJC_IVAR____TtC18Feedback_Assistant23FBAActionMenuController_subtitle);
}

@end
