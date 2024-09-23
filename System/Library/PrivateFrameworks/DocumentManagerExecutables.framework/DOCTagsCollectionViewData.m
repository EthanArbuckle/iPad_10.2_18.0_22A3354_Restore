@implementation DOCTagsCollectionViewData

- (BOOL)_hasPendingExternalChange
{
  return *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC26DocumentManagerExecutables25DOCTagsCollectionViewData_pendingExternalChange) != 0;
}

- (_TtP26DocumentManagerExecutables33DOCTagsCollectionViewDataDelegate_)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC26DocumentManagerExecutables25DOCTagsCollectionViewData_delegate;
  swift_beginAccess();
  return (_TtP26DocumentManagerExecutables33DOCTagsCollectionViewDataDelegate_ *)(id)MEMORY[0x2207B6ACC](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (void)applyTagsFromNodes:(id)a3
{
  uint64_t v4;
  _TtC26DocumentManagerExecutables25DOCTagsCollectionViewData *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25546A538);
  v4 = sub_21EB02CF0();
  v5 = self;
  DOCTagsCollectionViewData.applyTagsFromNodes(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)applyPendingExternalChange:(id)a3 timeout:(double)a4
{
  id v6;
  _TtC26DocumentManagerExecutables25DOCTagsCollectionViewData *v7;

  v6 = a3;
  v7 = self;
  DOCTagsCollectionViewData.applyPendingExternalChange(_:timeout:)((uint64_t)v6, a4);

}

- (int64_t)countOfTags
{
  _TtC26DocumentManagerExecutables25DOCTagsCollectionViewData *v2;
  int64_t v3;

  v2 = self;
  v3 = DOCTagsCollectionViewData.countOfTags.getter();

  return v3;
}

- (id)tagAtIndex:(int64_t)a3
{
  _TtC26DocumentManagerExecutables25DOCTagsCollectionViewData *v4;
  void *v5;

  v4 = self;
  v5 = (void *)DOCTagsCollectionViewData.tag(atIndex:)(a3);

  return v5;
}

- (int64_t)indexOfTag:(id)a3
{
  id v4;
  _TtC26DocumentManagerExecutables25DOCTagsCollectionViewData *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = DOCTagsCollectionViewData.index(ofTag:)((uint64_t)v4);

  return v6;
}

- (int64_t)presenceOf:(id)a3
{
  id v4;
  _TtC26DocumentManagerExecutables25DOCTagsCollectionViewData *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = DOCTagsCollectionViewData.presence(of:)(v4);

  return v6;
}

- (_TtC26DocumentManagerExecutables25DOCTagsCollectionViewData)init
{
  uint64_t *v2;
  _TtC26DocumentManagerExecutables25DOCTagsCollectionViewData *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v2 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC26DocumentManagerExecutables25DOCTagsCollectionViewData_tagsUnionCollection);
  v3 = self;
  *v2 = sub_21EAE0804(MEMORY[0x24BEE4AF8]);
  v2[1] = v4;
  v2[2] = v5;
  *(Class *)((char *)&v3->super.isa
           + OBJC_IVAR____TtC26DocumentManagerExecutables25DOCTagsCollectionViewData_pendingExternalChange) = 0;
  swift_unknownObjectWeakInit();

  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for DOCTagsCollectionViewData();
  return -[DOCTagsCollectionViewData init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_21EA60CEC((uint64_t)self + OBJC_IVAR____TtC26DocumentManagerExecutables25DOCTagsCollectionViewData_delegate);
}

@end
