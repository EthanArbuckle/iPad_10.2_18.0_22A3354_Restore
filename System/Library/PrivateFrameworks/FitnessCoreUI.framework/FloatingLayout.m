@implementation FloatingLayout

- (void)prepareForCollectionViewUpdates:(id)a3
{
  unint64_t v4;
  _TtC13FitnessCoreUI14FloatingLayout *v5;

  sub_23C03F890();
  v4 = sub_23C05411C();
  v5 = self;
  sub_23C03EC10(v4);

  swift_bridgeObjectRelease();
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC13FitnessCoreUI14FloatingLayout *v8;
  id v9;
  uint64_t v11;

  v4 = sub_23C053D20();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C053CF0();
  v8 = self;
  v9 = sub_23C03F08C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (_TtC13FitnessCoreUI14FloatingLayout)initWithSection:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingLayout_animatableIndexPaths) = (Class)MEMORY[0x24BEE4B08];
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FloatingLayout();
  return -[FloatingLayout initWithSection:](&v5, sel_initWithSection_, a3);
}

- (_TtC13FitnessCoreUI14FloatingLayout)initWithSection:(id)a3 configuration:(id)a4
{
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingLayout_animatableIndexPaths) = (Class)MEMORY[0x24BEE4B08];
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FloatingLayout();
  return -[FloatingLayout initWithSection:configuration:](&v7, sel_initWithSection_configuration_, a3, a4);
}

- (_TtC13FitnessCoreUI14FloatingLayout)initWithSectionProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  _TtC13FitnessCoreUI14FloatingLayout *v7;
  objc_super v9;
  _QWORD aBlock[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingLayout_animatableIndexPaths) = (Class)MEMORY[0x24BEE4B08];
  aBlock[4] = sub_23C041A14;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23C038DCC;
  aBlock[3] = &block_descriptor_7;
  v6 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FloatingLayout();
  v7 = -[FloatingLayout initWithSectionProvider:](&v9, sel_initWithSectionProvider_, v6);
  swift_release();
  _Block_release(v6);
  return v7;
}

- (_TtC13FitnessCoreUI14FloatingLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _TtC13FitnessCoreUI14FloatingLayout *v10;
  objc_super v12;
  _QWORD aBlock[6];

  v6 = _Block_copy(a3);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingLayout_animatableIndexPaths) = (Class)MEMORY[0x24BEE4B08];
  aBlock[4] = sub_23C03F810;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23C038DCC;
  aBlock[3] = &block_descriptor_0;
  v8 = _Block_copy(aBlock);
  v9 = a4;
  swift_retain();
  swift_release();
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for FloatingLayout();
  v10 = -[FloatingLayout initWithSectionProvider:configuration:](&v12, sel_initWithSectionProvider_configuration_, v8, v9);
  swift_release();

  _Block_release(v8);
  return v10;
}

- (_TtC13FitnessCoreUI14FloatingLayout)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingLayout_animatableIndexPaths) = (Class)MEMORY[0x24BEE4B08];
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FloatingLayout();
  return -[FloatingLayout initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
