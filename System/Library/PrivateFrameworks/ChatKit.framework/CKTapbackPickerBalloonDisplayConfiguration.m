@implementation CKTapbackPickerBalloonDisplayConfiguration

- (double)sourceX
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_sourceX);
  swift_beginAccess();
  return *v2;
}

- (void)setSourceX:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_sourceX);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)wantsRightTail
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_wantsRightTail;
  swift_beginAccess();
  return *v2;
}

- (void)setWantsRightTail:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_wantsRightTail;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)wantsBottomTail
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_wantsBottomTail;
  swift_beginAccess();
  return *v2;
}

- (void)setWantsBottomTail:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_wantsBottomTail;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isWidthConstrained
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_isWidthConstrained;
  swift_beginAccess();
  return *v2;
}

- (void)setIsWidthConstrained:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_isWidthConstrained;
  swift_beginAccess();
  *v4 = a3;
}

- (double)horizontalMarginBetweenBubbleAndEmojiTail
{
  double *v2;

  v2 = (double *)((char *)self
                + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_horizontalMarginBetweenBubbleAndEmojiTail);
  swift_beginAccess();
  return *v2;
}

- (void)setHorizontalMarginBetweenBubbleAndEmojiTail:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self
                + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_horizontalMarginBetweenBubbleAndEmojiTail);
  swift_beginAccess();
  *v4 = a3;
}

- (CGSize)pickerPillPreferredContentSize
{
  double *v2;
  double v3;
  double v4;
  CGSize result;

  v2 = (double *)((char *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_pickerPillPreferredContentSize);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setPickerPillPreferredContentSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat *v5;

  height = a3.height;
  width = a3.width;
  v5 = (CGFloat *)((char *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_pickerPillPreferredContentSize);
  swift_beginAccess();
  *v5 = width;
  v5[1] = height;
}

- (CKTapbackPickerBalloonDisplayConfiguration)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_sourceX) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_wantsRightTail) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_wantsBottomTail) = 1;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_isWidthConstrained) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_horizontalMarginBetweenBubbleAndEmojiTail) = 0;
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_pickerPillPreferredContentSize);
  v4 = (objc_class *)type metadata accessor for TapbackPickerBalloonDisplayConfiguration();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[CKTapbackPickerBalloonDisplayConfiguration init](&v6, sel_init);
}

@end
