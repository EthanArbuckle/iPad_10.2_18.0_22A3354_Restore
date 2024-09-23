@implementation AudioMessageRecordingAppendButton

- (_TtC7ChatKit33AudioMessageRecordingAppendButton)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit33AudioMessageRecordingAppendButton *)AudioMessageRecordingAppendButton.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7ChatKit33AudioMessageRecordingAppendButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s7ChatKit33AudioMessageRecordingAppendButtonC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  _TtC7ChatKit33AudioMessageRecordingAppendButton *v2;

  v2 = self;
  sub_18E720564();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC7ChatKit33AudioMessageRecordingAppendButton *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_18E7206D0();
  objc_msgSend(*(id *)((char *)&v5->super.super.super.isa+ OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingAppendButton_durationButton), sel_sizeThatFits_, width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingAppendButton_durationButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingAppendButton_textStyle));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingAppendButton_textColor));
}

@end
