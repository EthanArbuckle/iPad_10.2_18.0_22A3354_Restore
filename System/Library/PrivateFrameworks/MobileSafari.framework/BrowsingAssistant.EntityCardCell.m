@implementation BrowsingAssistant.EntityCardCell

- (_TtCC12MobileSafari17BrowsingAssistant14EntityCardCell)initWithCoder:(id)a3
{
  id v4;
  _TtCC12MobileSafari17BrowsingAssistant14EntityCardCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14EntityCardCell_entityView) = 0;
  v4 = a3;

  result = (_TtCC12MobileSafari17BrowsingAssistant14EntityCardCell *)sub_18BAC18C4();
  __break(1u);
  return result;
}

- (_TtCC12MobileSafari17BrowsingAssistant14EntityCardCell)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari17BrowsingAssistant14EntityCardCell *)sub_18B91EE68(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  char *v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_s14EntityCardCellCMa();
  v4 = a3;
  v5 = (char *)v11.receiver;
  v6 = -[BrowsingAssistant.EntityCardCell preferredLayoutAttributesFittingAttributes:](&v11, sel_preferredLayoutAttributesFittingAttributes_, v4);
  objc_msgSend(v6, sel_size, v11.receiver, v11.super_class);
  v8 = v7;
  v9 = *(void **)&v5[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14EntityCardCell_entityView];
  if (v9)
    objc_msgSend(v9, sel_systemLayoutSizeFittingSize_, v7);
  objc_msgSend(v6, sel_setSize_, v8);

  return v6;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14EntityCardCell_entityView));
}

@end
