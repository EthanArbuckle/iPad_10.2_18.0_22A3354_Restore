@implementation FBKActionMenuController

- (_TtC12FeedbackCore23FBKActionMenuController)initWithTitle:(id)a3 subtitle:(id)a4 actions:(id)a5
{
  return (_TtC12FeedbackCore23FBKActionMenuController *)sub_21DA621EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_21DA60E2C);
}

- (void)addActionWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5
{
  sub_21DA62918(self, (int)a2, (int)a3, a4, a5, (uint64_t)&unk_24E15CA78, (uint64_t)sub_21DA637D4, (void (*)(uint64_t, uint64_t, void *, uint64_t, uint64_t))sub_21DA60F24);
}

- (void)addAction:(id)a3
{
  _QWORD *v5;
  id v6;
  _TtC12FeedbackCore23FBKActionMenuController *v7;

  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12FeedbackCore23FBKActionMenuController_actions);
  swift_beginAccess();
  v6 = a3;
  v7 = self;
  MEMORY[0x2207980DC]();
  if (*(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_21DAC4990();
  sub_21DAC49A8();
  sub_21DAC4984();
  swift_endAccess();

}

- (id)buildMenu
{
  _TtC12FeedbackCore23FBKActionMenuController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21DA61150();

  return v3;
}

- (void)attachToBarButtonItem:(id)a3
{
  id v4;
  _TtC12FeedbackCore23FBKActionMenuController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = (id)sub_21DA61150();
  objc_msgSend(v4, sel_setMenu_, v6);

}

- (_TtC12FeedbackCore23FBKActionMenuController)init
{
  _TtC12FeedbackCore23FBKActionMenuController *result;

  result = (_TtC12FeedbackCore23FBKActionMenuController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21DA63354();
}

@end
