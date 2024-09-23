@implementation TimerClass

- (_TtC15MapsSuggestions10TimerClass)initWithName:(id)a3
{
  void *v4;
  _TtC15MapsSuggestions10TimerClass *v5;
  objc_super v7;

  sub_1A43AB62C();
  v4 = (void *)sub_1A43AB620();
  swift_bridgeObjectRelease();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TimerClass();
  v5 = -[MapsSuggestionsBaseTrigger initWithName:](&v7, sel_initWithName_, v4);

  return v5;
}

- (_TtC15MapsSuggestions10TimerClass)initWithName:(id)a3 queue:(id)a4
{
  id v6;
  void *v7;
  _TtC15MapsSuggestions10TimerClass *v8;
  objc_super v10;

  sub_1A43AB62C();
  v6 = a4;
  v7 = (void *)sub_1A43AB620();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TimerClass();
  v8 = -[MapsSuggestionsBaseTrigger initWithName:queue:](&v10, sel_initWithName_queue_, v7, v6);

  return v8;
}

- (_TtC15MapsSuggestions10TimerClass)initWithName:(id)a3 queue:(id)a4 block:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  _TtC15MapsSuggestions10TimerClass *v12;
  objc_super v14;
  _QWORD aBlock[6];

  v7 = _Block_copy(a5);
  sub_1A43AB62C();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v9 = a4;
  v10 = (void *)sub_1A43AB620();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_1A428A0F4;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A4282B78;
  aBlock[3] = &block_descriptor_113;
  v11 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for TimerClass();
  v12 = -[MapsSuggestionsGCDTimer initWithName:queue:block:](&v14, sel_initWithName_queue_block_, v10, v9, v11);

  swift_release();
  _Block_release(v11);

  return v12;
}

- (_TtC15MapsSuggestions10TimerClass)initWithName:(id)a3 queue:(id)a4 timerReturningBlock:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  _TtC15MapsSuggestions10TimerClass *v12;
  objc_super v14;
  _QWORD aBlock[6];

  v7 = _Block_copy(a5);
  sub_1A43AB62C();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v9 = a4;
  v10 = (void *)sub_1A43AB620();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_1A4289DD4;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A4282DE4;
  aBlock[3] = &block_descriptor_106;
  v11 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for TimerClass();
  v12 = -[MapsSuggestionsGCDTimer initWithName:queue:timerReturningBlock:](&v14, sel_initWithName_queue_timerReturningBlock_, v10, v9, v11);

  swift_release();
  _Block_release(v11);

  return v12;
}

@end
