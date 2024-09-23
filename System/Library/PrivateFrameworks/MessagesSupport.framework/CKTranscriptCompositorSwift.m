@implementation CKTranscriptCompositorSwift

- (UICollectionView)collectionView
{
  return (UICollectionView *)sub_1DB1F24DC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKTranscriptCompositorSwift_collectionView);
}

- (void)setCollectionView:(id)a3
{
  CKTranscriptCompositorSwift *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1DB1F4128(a3);

}

- (CKTranscriptCompositorDatasourceDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___CKTranscriptCompositorSwift_delegate;
  swift_beginAccess();
  return (CKTranscriptCompositorDatasourceDelegate *)(id)MEMORY[0x1DF0AAA84](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (int64_t)layoutContext
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___CKTranscriptCompositorSwift_layoutContext);
  swift_beginAccess();
  return *v2;
}

- (void)setLayoutContext:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___CKTranscriptCompositorSwift_layoutContext);
  swift_beginAccess();
  *v4 = a3;
}

- (id)datasource
{
  swift_beginAccess();
  return (id)swift_unknownObjectRetain();
}

- (void)setDatasource:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___CKTranscriptCompositorSwift_datasource);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (UICollectionViewCompositionalLayout)collectionViewLayout
{
  return (UICollectionViewCompositionalLayout *)sub_1DB1F24DC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
}

- (void)setCollectionViewLayout:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (int64_t)scrollDirection
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection);
  swift_beginAccess();
  return *v2;
}

- (void)setScrollDirection:(int64_t)a3
{
  CKTranscriptCompositorSwift *v4;

  v4 = self;
  TranscriptCompositor.scrollDirection.setter(a3);

}

- (double)interSectionSpacing
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing);
  swift_beginAccess();
  return *v2;
}

- (void)setInterSectionSpacing:(double)a3
{
  CKTranscriptCompositorSwift *v4;

  v4 = self;
  TranscriptCompositor.interSectionSpacing.setter(a3);

}

- (NSArray)boundarySupplementaryItems
{
  void *v2;

  swift_beginAccess();
  sub_1DB1F1DBC(0, &qword_1F02D1480);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DB1F64B4();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setBoundarySupplementaryItems:(id)a3
{
  uint64_t v4;
  CKTranscriptCompositorSwift *v5;

  sub_1DB1F1DBC(0, &qword_1F02D1480);
  v4 = sub_1DB1F64C0();
  v5 = self;
  TranscriptCompositor.boundarySupplementaryItems.setter(v4);

}

- (int64_t)contentsInsetReference
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference);
  swift_beginAccess();
  return *v2;
}

- (void)setContentsInsetReference:(int64_t)a3
{
  CKTranscriptCompositorSwift *v4;

  v4 = self;
  TranscriptCompositor.contentsInsetReference.setter(a3);

}

- (CKTranscriptCompositorSwift)initWithLayoutContext:(int64_t)a3 datasource:(id)a4
{
  swift_unknownObjectRetain();
  return (CKTranscriptCompositorSwift *)TranscriptCompositor.init(layoutContext:datasource:)(a3, (uint64_t)a4);
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  CKTranscriptCompositorSwift *v7;
  id v8;

  swift_unknownObjectRetain();
  v7 = self;
  v8 = TranscriptCompositor.layoutSection(forSection:layoutEnvironment:)(a3, (uint64_t)a4);
  swift_unknownObjectRelease();

  return v8;
}

- (CKTranscriptCompositorSwift)init
{
  CKTranscriptCompositorSwift *result;

  result = (CKTranscriptCompositorSwift *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1DB1F4580((uint64_t)self + OBJC_IVAR___CKTranscriptCompositorSwift_delegate);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end
