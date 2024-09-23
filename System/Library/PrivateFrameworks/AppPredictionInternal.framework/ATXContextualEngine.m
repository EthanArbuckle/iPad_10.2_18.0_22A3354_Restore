@implementation ATXContextualEngine

+ (ATXContextualEngine)sharedInstance
{
  if (qword_1ED84F958 != -1)
    swift_once();
  return (ATXContextualEngine *)(id)qword_1ED84F950;
}

- (ATXContextualEngine)init
{
  return (ATXContextualEngine *)sub_1C9DF0E08();
}

- (void)donateRerankedBlendingSuggestions:(id)a3
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v6)(void);
  ATXContextualEngine *v7;
  _QWORD *v8;
  _QWORD *v9;

  sub_1C9DF1A28();
  v4 = sub_1C9E45D84();
  v5 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v6 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x88);
  v7 = self;
  v8 = (_QWORD *)v6();
  (*(void (**)(uint64_t))((*v5 & *v8) + 0xA8))(v4);

  v9 = (_QWORD *)(*(uint64_t (**)(void))((*v5 & (uint64_t)v7->super.isa) + 0xA0))();
  (*(void (**)(void))((*v5 & *v9) + 0x90))();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_release();

}

@end
