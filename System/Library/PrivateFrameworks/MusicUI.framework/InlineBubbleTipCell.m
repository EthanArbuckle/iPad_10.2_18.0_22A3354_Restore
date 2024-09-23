@implementation InlineBubbleTipCell

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC7MusicUI19InlineBubbleTipCell *v5;

  v4 = a3;
  v5 = self;
  sub_21CE00E34(v4);

  return v4;
}

- (void)layoutSubviews
{
  _TtC7MusicUI19InlineBubbleTipCell *v2;

  v2 = self;
  sub_21CE00FCC();

}

- (_TtC7MusicUI19InlineBubbleTipCell)initWithFrame:(CGRect)a3
{
  return (_TtC7MusicUI19InlineBubbleTipCell *)InlineBubbleTipCell.init(frame:)();
}

- (_TtC7MusicUI19InlineBubbleTipCell)initWithCoder:(id)a3
{
  return (_TtC7MusicUI19InlineBubbleTipCell *)InlineBubbleTipCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_5_11((uint64_t)self, OBJC_IVAR____TtC7MusicUI19InlineBubbleTipCell_inlineBubbleTipCellView);
}

@end
