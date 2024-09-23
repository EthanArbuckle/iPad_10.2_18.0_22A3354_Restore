@implementation CAFUIDevicePickerViewCell

- (_TtC5CAFUI25CAFUIDevicePickerViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC5CAFUI25CAFUIDevicePickerViewCell *)CAFUIDevicePickerViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5CAFUI25CAFUIDevicePickerViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized CAFUIDevicePickerViewCell.init(coder:)();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC5CAFUI25CAFUIDevicePickerViewCell *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFUIDevicePickerViewCell.didUpdateFocus(in:with:)((UIFocusUpdateContext)v6, (UIFocusAnimationCoordinator)v7);

}

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CAFUIDevicePickerViewCell();
  return -[CAFUIDevicePickerViewCell isSelected](&v3, sel_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  unsigned int v6;
  double v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CAFUIDevicePickerViewCell();
  v4 = (char *)v8.receiver;
  -[CAFUIDevicePickerViewCell setSelected:](&v8, sel_setSelected_, v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC5CAFUI25CAFUIDevicePickerViewCell_avatarView];
  v6 = objc_msgSend(v4, sel_isSelected, v8.receiver, v8.super_class);
  v7 = 1.0;
  if (v6)
    v7 = 0.25;
  objc_msgSend(v5, sel_setAlpha_, v7);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIDevicePickerViewCell_avatarView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIDevicePickerViewCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIDevicePickerViewCell_sublabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIDevicePickerViewCell_selectedImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIDevicePickerViewCell_selectedImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIDevicePickerViewCell_spinner));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIDevicePickerViewCell_focusRingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIDevicePickerViewCell_widthConstraint));
  swift_bridgeObjectRelease();
}

@end
