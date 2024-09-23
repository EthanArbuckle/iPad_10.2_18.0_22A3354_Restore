@implementation HUTipsManager_Swift

- (HUTipsManager_Swift)init
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  objc_super v6;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___HUTipsManager_Swift_tileQuickToggleTip);
  *v2 = 0xD000000000000017;
  v2[1] = 0x80000001B9448530;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___HUTipsManager_Swift_unanalyzedCameraClipTip);
  *v3 = 0xD000000000000021;
  v3[1] = 0x80000001B9448550;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___HUTipsManager_Swift_homeEnergyTip);
  *v4 = 0xD000000000000018;
  v4[1] = 0x80000001B9448580;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TipsManager();
  return -[HUTipsManager_Swift init](&v6, sel_init);
}

- (uint64_t)warmUp
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;

  v0 = sub_1B93ED040();
  v12 = *(_QWORD *)(v0 - 8);
  v13 = v0;
  MEMORY[0x1E0C80A78](v0);
  v15 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1B93ED01C();
  v2 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1B93ECFF8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (HFForceTipsOnboarding())
    sub_1B93ECF68();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E370);
  sub_1B93ED058();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B9439200;
  sub_1B93ECFEC();
  sub_1B93ED004();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1B93ED010();
  sub_1B93ED028();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v14);
  v9 = v15;
  sub_1B93ED034();
  sub_1B93ED04C();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v13);
  sub_1B93ED118();
  return swift_bridgeObjectRelease();
}

+ (HUTipsManager_Swift)sharedManager
{
  if (qword_1ED57E7E8 != -1)
    swift_once();
  return (HUTipsManager_Swift *)(id)qword_1ED57E758;
}

- (void)donateAppLaunchEvent
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  HUTipsManager_Swift *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_1B93EE234();
  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57EB48);
  v7 = (void *)sub_1B93EE5C4();
  sub_1B93EC830();

  v8 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = 0;
  *(_QWORD *)(v9 + 24) = 0;
  sub_1B8EB73B4((uint64_t)v5, (uint64_t)&unk_1EF20BC20, v9);

  swift_release();
}

- (void)toggleDidInteract
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  HUTipsManager_Swift *v8;
  _QWORD v9[2];

  v3 = sub_1B93ECFE0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)&self->tileQuickToggleTip[OBJC_IVAR___HUTipsManager_Swift_tileQuickToggleTip];
  v9[0] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HUTipsManager_Swift_tileQuickToggleTip);
  v9[1] = v7;
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0CE9610], v3);
  sub_1B8E70F0C();
  v8 = self;
  sub_1B93ECF74();
  sub_1B93ECED8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
