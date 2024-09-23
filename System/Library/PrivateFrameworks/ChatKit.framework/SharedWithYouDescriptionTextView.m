@implementation SharedWithYouDescriptionTextView

- (_TtC7ChatKit32SharedWithYouDescriptionTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _TtC7ChatKit32SharedWithYouDescriptionTextView *result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  sub_18E6EC438(a4, x, y, width, height);
  return result;
}

- (_TtC7ChatKit32SharedWithYouDescriptionTextView)initWithCoder:(id)a3
{
  _TtC7ChatKit32SharedWithYouDescriptionTextView *result;

  sub_18E6EC8FC(a3);
  return result;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC7ChatKit32SharedWithYouDescriptionTextView *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_18E6ED2B8((uint64_t)v9, v10);

  return v12;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit32SharedWithYouDescriptionTextView_footerTextColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit32SharedWithYouDescriptionTextView_learnMoreColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit32SharedWithYouDescriptionTextView_footerFont));
}

@end
