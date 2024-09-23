@implementation MOSuggestionEvergreenCollectionViewCell

- (_TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell *)specialized MOSuggestionEvergreenCollectionViewCell.init(frame:)();
}

- (_TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell *result;

  v5 = OBJC_IVAR____TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell_assetView;
  v6 = type metadata accessor for MOSuggestionSheetAssetView();
  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6));
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v7, "init");
  swift_weakInit((char *)self + OBJC_IVAR____TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell_assetViewModel);
  swift_weakInit((char *)self + OBJC_IVAR____TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell_cellViewModel);

  result = (_TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionEvergreenCollectionViewCell.swift", 62, 2, 54, 0);
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = MOSuggestionEvergreenCollectionViewCell.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (void)prepareForReuse
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MOSuggestionEvergreenCollectionViewCell();
  v2 = v5.receiver;
  -[MOSuggestionEvergreenCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
  v3 = (*(uint64_t (**)(_QWORD))((swift_isaMask & *v2) + 0xA0))(0);
  v4 = (_QWORD *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v2) + 0x68))(v3);
  (*(void (**)(_QWORD))((swift_isaMask & *v4) + 0xA0))(0);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell_assetView));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell_assetViewModel);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell_cellViewModel);
}

@end
