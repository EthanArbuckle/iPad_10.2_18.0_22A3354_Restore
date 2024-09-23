@implementation CKTapbackPickerContainerAccessoryView

- (CKTapbackPickerBalloonParentView)pickerBalloonParentView
{
  return (CKTapbackPickerBalloonParentView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                     + OBJC_IVAR___CKTapbackPickerContainerAccessoryView_pickerBalloonParentView));
}

- (id)init:(id)a3 layoutBounds:(CGRect)a4 delegate:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  swift_unknownObjectRetain();
  return TapbackPickerContainerAccessoryView.init(_:layoutBounds:delegate:)(v10, a5, x, y, width, height);
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  CKTapbackPickerContainerAccessoryView *v5;

  if (*((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackPickerContainerAccessoryView_visible) != a3)
  {
    *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackPickerContainerAccessoryView_visible) = a3;
    v5 = self;
    if (a3)
      sub_18E5A97E4();
    else
      sub_18E5A9D68();

  }
}

- (CGPoint)attachmentOffsetWithReferenceFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CKTapbackPickerContainerAccessoryView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_18E710A94(x, y, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR___CKTapbackPickerContainerAccessoryView_pickerBalloonParentView), sel_hitTest_withEvent_, a4, a3.x, a3.y);
}

- (CKTapbackPickerContainerAccessoryView)initWithFrame:(CGRect)a3 configuration:(id *)a4
{
  CKTapbackPickerContainerAccessoryView *result;

  result = (CKTapbackPickerContainerAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerContainerAccessoryView_pickerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerContainerAccessoryView_pickerBalloonParentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerContainerAccessoryView_chatItem));
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKTapbackPickerContainerAccessoryView_delegate);
}

@end
