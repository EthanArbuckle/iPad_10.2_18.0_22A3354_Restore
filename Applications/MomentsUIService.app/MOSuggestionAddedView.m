@implementation MOSuggestionAddedView

- (_TtC16MomentsUIService21MOSuggestionAddedView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService21MOSuggestionAddedView *)MOSuggestionAddedView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService21MOSuggestionAddedView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionAddedView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC16MomentsUIService21MOSuggestionAddedView *v2;

  v2 = self;
  MOSuggestionAddedView.layoutSubviews()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService21MOSuggestionAddedView_addedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService21MOSuggestionAddedView_checkmarkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService21MOSuggestionAddedView_backgroundView));
}

@end
