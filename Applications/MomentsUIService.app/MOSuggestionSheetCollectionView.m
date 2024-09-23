@implementation MOSuggestionSheetCollectionView

- (void)layoutSubviews
{
  _QWORD *v2;
  id v3;
  void (*v4)(_QWORD, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MOSuggestionSheetCollectionView();
  v2 = v8.receiver;
  v3 = -[MOSuggestionSheetCollectionView layoutSubviews](&v8, "layoutSubviews");
  v4 = (void (*)(_QWORD, uint64_t))(*(uint64_t (**)(id))((swift_isaMask & *v2) + 0x58))(v3);
  if (v4)
  {
    v6 = (uint64_t)v4;
    v7 = v5;
    v4(v4, v5);
    outlined consume of (@escaping @callee_guaranteed () -> ())?(v6, v7);
  }
  (*(void (**)(_QWORD, _QWORD))((swift_isaMask & *v2) + 0x60))(0, 0);

}

- (_TtC16MomentsUIService31MOSuggestionSheetCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v10;
  objc_class *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetCollectionView_callback);
  v11 = (objc_class *)type metadata accessor for MOSuggestionSheetCollectionView();
  *v10 = 0;
  v10[1] = 0;
  v13.receiver = self;
  v13.super_class = v11;
  return -[MOSuggestionSheetCollectionView initWithFrame:collectionViewLayout:](&v13, "initWithFrame:collectionViewLayout:", a4, x, y, width, height);
}

- (_TtC16MomentsUIService31MOSuggestionSheetCollectionView)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetCollectionView_callback);
  v6 = (objc_class *)type metadata accessor for MOSuggestionSheetCollectionView();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[MOSuggestionSheetCollectionView initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetCollectionView_callback), *(_QWORD *)&self->callback[OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetCollectionView_callback]);
}

@end
