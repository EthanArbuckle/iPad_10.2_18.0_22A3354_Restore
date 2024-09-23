@implementation PagingCollectionView

- (void)layoutSubviews
{
  _TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView *v2;

  v2 = self;
  PagingCollectionView.layoutSubviews()();

}

- (void)scrollToItemAtIndexPath:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView *v13;
  uint64_t v14;

  v8 = type metadata accessor for IndexPath();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = self;
  PagingCollectionView.scrollToItem(at:at:animated:)((uint64_t)v12, a4, a5);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 0;
}

- (BOOL)_accessibilityShouldPreventOpaqueScrolling
{
  return 1;
}

- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t, uint64_t);
  char *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (char *)self
      + OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView_pendingIndexPath;
  v11 = type metadata accessor for IndexPath();
  v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56);
  v12(v10, 1, 1, v11);
  v12((char *)self+ OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView_lastScrolledIndexPath, 1, 1, v11);
  v13 = (char *)self + OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView_lastLayoutSize;
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  v13[16] = 1;
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for PagingCollectionView();
  return -[PagingCollectionView initWithFrame:collectionViewLayout:](&v15, sel_initWithFrame_collectionViewLayout_, a4, x, y, width, height);
}

- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t, uint64_t, uint64_t);
  char *v8;
  objc_super v10;

  v5 = (char *)self
     + OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView_pendingIndexPath;
  v6 = type metadata accessor for IndexPath();
  v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  v7((char *)self+ OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView_lastScrolledIndexPath, 1, 1, v6);
  v8 = (char *)self + OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView_lastLayoutSize;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 1;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PagingCollectionView();
  return -[PagingCollectionView initWithCoder:](&v10, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  uint64_t (*v3)(void);
  uint64_t (*v4)(void);

  v3 = MEMORY[0x1E0CB1658];
  v4 = MEMORY[0x1E0DEB940];
  outlined destroy of TableRowList?((uint64_t)self + OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView_pendingIndexPath, (uint64_t)&lazy cache variable for type metadata for IndexPath?, (uint64_t)MEMORY[0x1E0CB1658], (uint64_t)MEMORY[0x1E0DEB940], (uint64_t (*)(_QWORD))type metadata accessor for TupleView<(ModifiedContent<AnyView, _TraitWritingModifier<LayoutPriorityTraitKey>>, _ConditionalContent<Image, Image>?)>);
  outlined destroy of TableRowList?((uint64_t)self+ OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF020PagingCollectionView_lastScrolledIndexPath, (uint64_t)&lazy cache variable for type metadata for IndexPath?, (uint64_t)v3, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for TupleView<(ModifiedContent<AnyView, _TraitWritingModifier<LayoutPriorityTraitKey>>, _ConditionalContent<Image, Image>?)>);
}

@end
