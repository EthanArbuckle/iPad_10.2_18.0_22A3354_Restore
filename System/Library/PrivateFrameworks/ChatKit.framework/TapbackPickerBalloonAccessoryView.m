@implementation TapbackPickerBalloonAccessoryView

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TapbackPickerBalloonAccessoryView();
  return -[TapbackPickerContainerView tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TapbackPickerBalloonAccessoryView();
  v4 = a3;
  v5 = v6.receiver;
  -[TapbackPickerContainerView setTintColor:](&v6, sel_setTintColor_, v4);
  sub_18E6B79BC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit33TapbackPickerBalloonAccessoryView_cancelButton));
  sub_18E61B2A8(*(id *)((char *)&self->super.super.super.super.super.super.isa
                      + OBJC_IVAR____TtC7ChatKit33TapbackPickerBalloonAccessoryView____lazy_storage___backwardArrow));
  sub_18E61B2A8(*(id *)((char *)&self->super.super.super.super.super.super.isa
                      + OBJC_IVAR____TtC7ChatKit33TapbackPickerBalloonAccessoryView____lazy_storage___forwardArrow));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit33TapbackPickerBalloonAccessoryView_collectionViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit33TapbackPickerBalloonAccessoryView_hoverGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit33TapbackPickerBalloonAccessoryView_tapbackPickerCollectionView));
}

- (void)hoverRecognized:(id)a3
{
  id v4;
  _TtC7ChatKit33TapbackPickerBalloonAccessoryView *v5;

  v4 = a3;
  v5 = self;
  sub_18E6B7A60(1);

}

@end
