@implementation MOSuggestionStateOfMindAssetView

- (_TtC16MomentsUIService32MOSuggestionStateOfMindAssetView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionStateOfMindAssetView.init(coder:)();
}

- (void)handleTraitChange
{
  _TtC16MomentsUIService32MOSuggestionStateOfMindAssetView *v2;

  v2 = self;
  MOSuggestionStateOfMindAssetView.handleTraitChange()();

}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MOSuggestionStateOfMindAssetView();
  v2 = (char *)v5.receiver;
  -[MOSuggestionStateOfMindAssetView layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_gradient];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, "frame", v5.receiver, v5.super_class);
    objc_msgSend(v4, "setFrame:");

    v2 = v4;
  }

}

- (_TtC16MomentsUIService32MOSuggestionStateOfMindAssetView)initWithFrame:(CGRect)a3
{
  _TtC16MomentsUIService32MOSuggestionStateOfMindAssetView *result;

  result = (_TtC16MomentsUIService32MOSuggestionStateOfMindAssetView *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOSuggestionStateOfMindAssetView", 49, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->assignedTileSize[OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_valenceClassificationAndReflectiveInterval]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->assignedTileSize[OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_primaryLabelText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->assignedTileSize[OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_primaryLabelTextShortened]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->assignedTileSize[OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_secondaryLabelText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->assignedTileSize[OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_secondaryLabelTextShortened]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->assignedTileSize[OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_typeLabelText]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_associatedColorsLight));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_associatedColorsDark));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_associatedColors));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_gradient));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_typeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_labelStack));
}

@end
