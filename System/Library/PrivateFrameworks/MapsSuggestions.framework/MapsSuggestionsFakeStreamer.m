@implementation MapsSuggestionsFakeStreamer

- (id)callBackBlock
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_callBackBlock);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A4282B78;
  aBlock[3] = &block_descriptor_100;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setCallBackBlock:(id)a3
{
  uint64_t (*v4)();
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1A428A0F4;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_callBackBlock);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A42856E0(v7);
}

- (BOOL)simpleCallBack
{
  return *((_BYTE *)&self->super.super.isa
         + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_simpleCallBack);
}

- (void)setSimpleCallBack:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_simpleCallBack) = a3;
}

- (BOOL)tenSecondEvent
{
  return *((_BYTE *)&self->super.super.isa
         + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_tenSecondEvent);
}

- (void)setTenSecondEvent:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_tenSecondEvent) = a3;
}

- (BOOL)alreadyStartedEvent
{
  return *((_BYTE *)&self->super.super.isa
         + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_alreadyStartedEvent);
}

- (void)setAlreadyStartedEvent:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_alreadyStartedEvent) = a3;
}

- (BOOL)doubleEvent
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_doubleEvent);
}

- (void)setDoubleEvent:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_doubleEvent) = a3;
}

- (_TtC15MapsSuggestions27MapsSuggestionsFakeStreamer)initWithLookAheadPeriod:(double)a3 pingInterval:(double)a4 notificationName:(id)a5 callBackBlock:(id)a6 simpleCallBack:(BOOL)a7 tenSecondEvent:(BOOL)a8 alreadyStartedEvent:(BOOL)a9 doubleEvent:(BOOL)a10
{
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;

  v16 = _Block_copy(a6);
  v17 = sub_1A43AB62C();
  v19 = v18;
  if (v16)
  {
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v16;
    v16 = sub_1A4289DA8;
  }
  else
  {
    v20 = 0;
  }
  v21 = sub_1A4289868(v17, v19, (uint64_t)v16, v20, a7, a8, a9, a10, a3, a4);
  sub_1A42856E0((uint64_t)v16);
  return (_TtC15MapsSuggestions27MapsSuggestionsFakeStreamer *)v21;
}

- (void)scanForStreamableEvents
{
  _TtC15MapsSuggestions27MapsSuggestionsFakeStreamer *v2;

  v2 = self;
  MapsSuggestionsFakeStreamer.scanForStreamableEvents()();

}

- (_TtC15MapsSuggestions27MapsSuggestionsFakeStreamer)initWithLookAheadPeriod:(double)a3 pingInterval:(double)a4 notificationName:(id)a5 identifyingName:(id)a6
{
  sub_1A4289798();
}

- (void).cxx_destruct
{
  sub_1A42856E0(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_callBackBlock));
}

@end
