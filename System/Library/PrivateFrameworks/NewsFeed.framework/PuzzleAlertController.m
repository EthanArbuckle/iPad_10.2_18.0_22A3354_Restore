@implementation PuzzleAlertController

- (NSArray)keyCommands
{
  void *v2;

  swift_beginAccess();
  sub_1BA49A224(0, &qword_1EF2BD140);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1BB872D9C();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)didPressKey:(id)a3
{
  id v4;
  _TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController *v5;

  v4 = a3;
  v5 = self;
  sub_1BB1B22E8(v4);

}

- (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  void *v10;
  _TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController *v11;
  objc_super v13;

  if (a3)
  {
    sub_1BB8729A0();
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController_handler);
  *v8 = 0;
  v8[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController_events) = (Class)MEMORY[0x1E0DEE9E0];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController_commands) = (Class)MEMORY[0x1E0DEE9D8];
  v9 = a4;
  if (v7)
  {
    v10 = (void *)sub_1BB872970();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PuzzleAlertController();
  v11 = -[PuzzleAlertController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, v10, a4);

  return v11;
}

- (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController)initWithCoder:(id)a3
{
  _QWORD *v4;
  objc_super v6;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController_handler);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController_events) = (Class)MEMORY[0x1E0DEE9E0];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController_commands) = (Class)MEMORY[0x1E0DEE9D8];
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PuzzleAlertController();
  return -[PuzzleAlertController initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1BA49EBE0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController_handler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
