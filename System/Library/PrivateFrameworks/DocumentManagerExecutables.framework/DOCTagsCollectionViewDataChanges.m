@implementation DOCTagsCollectionViewDataChanges

- (NSArray)deletions
{
  void *v2;

  swift_beginAccess();
  sub_21EA579D4(0, (unint64_t *)&unk_25546A770);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21EB02CE4();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setDeletions:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  sub_21EA579D4(0, (unint64_t *)&unk_25546A770);
  v4 = sub_21EB02CF0();
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC26DocumentManagerExecutables32DOCTagsCollectionViewDataChanges_deletions);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)empty
{
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  _TtC26DocumentManagerExecutables32DOCTagsCollectionViewDataChanges *v7;

  v3 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC26DocumentManagerExecutables32DOCTagsCollectionViewDataChanges_deletions);
  swift_beginAccess();
  v4 = *v3;
  if (v4 >> 62)
  {
    v7 = self;
    swift_bridgeObjectRetain();
    v5 = sub_21EB0341C();

    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return v5 == 0;
}

- (_TtC26DocumentManagerExecutables32DOCTagsCollectionViewDataChanges)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC26DocumentManagerExecutables32DOCTagsCollectionViewDataChanges_deletions) = (Class)MEMORY[0x24BEE4AF8];
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCTagsCollectionViewDataChanges();
  return -[DOCTagsCollectionViewDataChanges init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
