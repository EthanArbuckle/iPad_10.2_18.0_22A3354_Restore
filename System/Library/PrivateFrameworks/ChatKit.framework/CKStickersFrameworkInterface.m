@implementation CKStickersFrameworkInterface

+ (BOOL)updateSavedStickerWithIdentifier:(id)a3 stickerEffectEnum:(int64_t)a4 error:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = sub_18E7662C0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E7662A8();
  sub_18E658398();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 1;
}

+ (id)uiStickerWithIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v9;

  v3 = sub_18E7662C0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E7662A8();
  v7 = (void *)sub_18E658550();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

+ (id)uiStickerForSTKSticker:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)sub_18E656AE8();

  return v4;
}

- (CKStickersFrameworkInterface)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StickersFrameworkInterface();
  return -[CKStickersFrameworkInterface init](&v3, sel_init);
}

@end
