@implementation AVSTriggerController

- (id)displayAlertHandler
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___AVSTriggerController_displayAlertHandler);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235F40CA0;
  aBlock[3] = &block_descriptor_15;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setDisplayAlertHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_235F45290;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___AVSTriggerController_displayAlertHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_235F1ED40(v7);
}

+ (id)sharedInstance
{
  swift_getObjCClassMetadata();
  return (id)static AVSTriggerController.sharedInstance()();
}

- (AVSTriggerController)init
{
  return (AVSTriggerController *)AVSTriggerController.init()();
}

- (void)startListening
{
  AVSTriggerController *v2;

  v2 = self;
  AVSTriggerController.startListening()();

}

- (void)stopListening
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  AVSTriggerController *v6;
  uint64_t v7;
  _QWORD *v8;
  AVSTriggerController *v9;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395158);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_235F3BE0C();
  sub_235F4CB4C();
  v7 = sub_235F4CB64();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5, 0, 1, v7);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v6;
  v9 = v6;
  sub_235F4089C((uint64_t)v5, (uint64_t)&unk_256395F38, (uint64_t)v8);

  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
  sub_235F1ED40(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AVSTriggerController_displayAlertHandler));

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)keywordSpotterDidDetectKeywordWithEvent:(id)a3
{
  id v4;
  AVSTriggerController *v5;

  v4 = a3;
  v5 = self;
  AVSTriggerController.keywordSpotterDidDetectKeyword(event:)(v4);

}

@end
