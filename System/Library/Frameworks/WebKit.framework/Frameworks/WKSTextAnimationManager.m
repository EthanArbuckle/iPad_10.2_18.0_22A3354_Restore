@implementation WKSTextAnimationManager

- (WKSTextAnimationSourceDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___WKSTextAnimationManager_delegate;
  swift_beginAccess();
  return (WKSTextAnimationSourceDelegate *)(id)MEMORY[0x23B7CD374](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (WKSTextAnimationManager)initWithDelegate:(id)a3
{
  swift_unknownObjectRetain();
  return (WKSTextAnimationManager *)TextAnimationManager.init(with:)(a3);
}

- (void)addTextAnimationForAnimationID:(id)a3 withStyleType:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  WKSTextAnimationManager *v10;
  uint64_t v11;

  v6 = sub_2354A37C8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2354A37BC();
  v10 = self;
  TextAnimationManager.beginEffect(for:style:)((uint64_t)v9, a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)removeTextAnimationForAnimationID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  WKSTextAnimationManager *v8;
  uint64_t v9;

  v4 = sub_2354A37C8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2354A37BC();
  v8 = self;
  TextAnimationManager.endEffect(for:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (WKSTextAnimationManager)init
{
  WKSTextAnimationManager *result;

  result = (WKSTextAnimationManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2354A04BC((uint64_t)self + OBJC_IVAR___WKSTextAnimationManager_currentEffect, &qword_2562362E0);

  swift_bridgeObjectRelease();
  sub_23549ED70((uint64_t)self + OBJC_IVAR___WKSTextAnimationManager_delegate);
}

- (void)targetedPreviewFor:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC5UIKit21UITextEffectTextChunk *v15;
  WKSTextAnimationManager *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236168);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_2354A3B10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256236468;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256236470;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23549EAE8((uint64_t)v9, (uint64_t)&unk_256236478, (uint64_t)v14);
  swift_release();
}

- (void)updateTextChunkVisibilityForAnimation:(_TtC5UIKit21UITextEffectTextChunk *)a3 visible:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC5UIKit21UITextEffectTextChunk *v17;
  WKSTextAnimationManager *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256236168);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = sub_2354A3B10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256236428;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256236438;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_23549EAE8((uint64_t)v11, (uint64_t)&unk_256236448, (uint64_t)v16);
  swift_release();
}

@end
