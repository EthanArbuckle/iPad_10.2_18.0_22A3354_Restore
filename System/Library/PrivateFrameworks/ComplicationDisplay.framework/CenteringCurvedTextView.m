@implementation CenteringCurvedTextView

- (_TtC19ComplicationDisplay23CenteringCurvedTextView)init
{
  return -[CenteringCurvedTextView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC19ComplicationDisplay23CenteringCurvedTextView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  id v9;
  _TtC19ComplicationDisplay23CenteringCurvedTextView *v10;
  objc_class *v11;
  _TtC19ComplicationDisplay23CenteringCurvedTextView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_circleCenter);
  *v8 = 0;
  v8[1] = 0;
  v9 = objc_allocWithZone(MEMORY[0x24BE16F38]);
  v10 = self;
  v11 = (objc_class *)objc_msgSend(v9, sel_init);
  *(Class *)((char *)&v10->super.super.super.isa
           + OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView) = v11;

  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for CenteringCurvedTextView();
  v12 = -[CenteringCurvedTextView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  -[CenteringCurvedTextView addSubview:](v12, sel_addSubview_, *(Class *)((char *)&v12->super.super.super.isa+ OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView));
  return v12;
}

- (_TtC19ComplicationDisplay23CenteringCurvedTextView)initWithCoder:(id)a3
{
  _QWORD *v3;

  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_circleCenter);
  type metadata accessor for CenteringCurvedTextView();
  *v3 = 0;
  v3[1] = 0;
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)layoutSubviews
{
  _TtC19ComplicationDisplay23CenteringCurvedTextView *v2;

  v2 = self;
  sub_213062374();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView));
}

@end
