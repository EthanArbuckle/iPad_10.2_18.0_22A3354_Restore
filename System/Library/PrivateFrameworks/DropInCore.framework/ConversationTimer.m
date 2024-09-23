@implementation ConversationTimer

- (_TtC10DropInCore17ConversationTimer)initWithInterval:(double)a3 queue:(id)a4 identifier:(id)a5 label:(id)a6 handler:(id)a7
{
  uint64_t v9;
  id v10;

  v9 = sub_23A7F1DA0();
  MEMORY[0x24BDAC7A8](v9);
  _Block_copy(a7);
  sub_23A7F1D88();
  sub_23A7F20E8();
  swift_allocObject();
  v10 = a4;
  sub_23A7B9B5C();
}

@end
