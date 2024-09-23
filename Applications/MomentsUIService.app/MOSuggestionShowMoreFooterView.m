@implementation MOSuggestionShowMoreFooterView

- (_TtC16MomentsUIService30MOSuggestionShowMoreFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService30MOSuggestionShowMoreFooterView *)MOSuggestionShowMoreFooterView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService30MOSuggestionShowMoreFooterView)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  objc_class *v6;
  void (__swiftcall **v7)();
  _TtC16MomentsUIService30MOSuggestionShowMoreFooterView *result;

  v4 = OBJC_IVAR____TtC16MomentsUIService30MOSuggestionShowMoreFooterView_showMoreButton;
  v5 = a3;
  closure #1 in variable initialization expression of MOSuggestionShowMoreFooterView.showMoreButton();
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = v6;
  v7 = (void (__swiftcall **)())((char *)self
                               + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionShowMoreFooterView_showMoreAction);
  *v7 = MOSuggestionInterstitialExpandableListViewCellConstants.init();
  v7[1] = 0;

  result = (_TtC16MomentsUIService30MOSuggestionShowMoreFooterView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionShowMoreFooterView.swift", 53, 2, 37, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionShowMoreFooterView_showMoreButton));
  swift_release(*(_QWORD *)&self->showMoreButton[OBJC_IVAR____TtC16MomentsUIService30MOSuggestionShowMoreFooterView_showMoreAction]);
}

@end
