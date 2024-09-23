@implementation MOSuggestionSheetOverflowView

- (_TtC16MomentsUIService29MOSuggestionSheetOverflowView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService29MOSuggestionSheetOverflowView *)MOSuggestionSheetOverflowView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService29MOSuggestionSheetOverflowView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionSheetOverflowView.init(coder:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionSheetOverflowView_blurEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionSheetOverflowView_overflowCountLabel));
}

@end
