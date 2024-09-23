@implementation BrowsingAssistant.ReaderCardCell

- (_TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18B8FE8E8();
}

- (_TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell *)sub_18B8FBB20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)updateTheme
{
  _TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell *v2;

  v2 = self;
  sub_18B8FC8A8();

}

- (void)updateTitleLabel
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  _TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell *v6;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_titleLabel);
  v6 = self;
  v3 = -[BrowsingAssistant.ReaderCardCell traitCollection](v6, sel_traitCollection);
  v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);

  LOBYTE(v3) = sub_18BAC1378();
  if ((v3 & 1) != 0)
    v5 = 4;
  else
    v5 = 2;
  objc_msgSend(v2, sel_setNumberOfLines_, v5);

}

- (void)listenToPage:(id)a3
{
  sub_18B8FE36C(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_listenToPageAction);
}

- (void)showReader:(id)a3
{
  sub_18B8FE36C(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_showReaderAction);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_rootStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_titleLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_summaryView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell____lazy_storage___disclaimerLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_buttonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_listenToPageButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_showReaderButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_listenToPageAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_showReaderAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_contextMenuInteraction));
}

@end
