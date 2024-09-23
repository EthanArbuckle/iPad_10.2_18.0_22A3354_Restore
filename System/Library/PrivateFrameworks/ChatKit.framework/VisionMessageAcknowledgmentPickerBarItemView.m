@implementation VisionMessageAcknowledgmentPickerBarItemView

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VisionMessageAcknowledgmentPickerBarItemView();
  return -[CKMessageAcknowledgmentPickerBarItemView isSelected](&v3, sel_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VisionMessageAcknowledgmentPickerBarItemView();
  v4 = v5.receiver;
  -[CKMessageAcknowledgmentPickerBarItemView setSelected:](&v5, sel_setSelected_, v3);
  sub_18E569FB0();

}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VisionMessageAcknowledgmentPickerBarItemView();
  v2 = (char *)v5.receiver;
  -[CKMessageAcknowledgmentPickerBarItemView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC7ChatKit44VisionMessageAcknowledgmentPickerBarItemView_selectedItemHighlight];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
    objc_msgSend(v4, sel_setFrame_);

    v2 = v4;
  }

}

- (_TtC7ChatKit44VisionMessageAcknowledgmentPickerBarItemView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit44VisionMessageAcknowledgmentPickerBarItemView_selectedItemHighlight) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for VisionMessageAcknowledgmentPickerBarItemView();
  return -[CKMessageAcknowledgmentPickerBarItemView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKit44VisionMessageAcknowledgmentPickerBarItemView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit44VisionMessageAcknowledgmentPickerBarItemView_selectedItemHighlight) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VisionMessageAcknowledgmentPickerBarItemView();
  return -[VisionMessageAcknowledgmentPickerBarItemView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit44VisionMessageAcknowledgmentPickerBarItemView_selectedItemHighlight));
}

@end
