@implementation CKTapbackPickerBalloonLayoutTemplate

+ (double)pickerPillBubbleMargin
{
  return 5.0;
}

+ (double)emojiTailBubbleMargin
{
  return 6.0;
}

+ (double)topOffsetForUnobscuredTranscriptPresentation
{
  return 110.6;
}

+ (double)pickerPillBottomTailBaseline
{
  if (qword_1EE107668 != -1)
    swift_once();
  return (*(double *)&qword_1EE12E178 + 52.8) * 0.64278761 + 15.4 + 37.4;
}

+ (double)widthConstrainedBaselineWithDisplayConfiguration:(id)a3
{
  double *v4;
  double v5;
  uint64_t v6;
  id v7;
  double v8;

  v4 = (double *)((char *)a3 + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_pickerPillPreferredContentSize);
  swift_beginAccess();
  v5 = v4[1];
  v6 = qword_1EE107650;
  v7 = a3;
  if (v6 != -1)
    swift_once();
  v8 = *(double *)&qword_1EE12E160;

  return v5 + 44.0 + v8;
}

+ (double)requiredDisplayHeight
{
  double v2;
  double v3;

  if (qword_1EE107668 != -1)
    swift_once();
  v2 = (*(double *)&qword_1EE12E178 + 52.8) * 0.64278761 + 15.4 + 37.4;
  _s7ChatKit34TapbackPickerBalloonLayoutTemplateC17selectionTailSizeSo6CGSizeVvgZ_0();
  return v3 + v2;
}

- (CKTapbackPickerBalloonLayoutTemplate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TapbackPickerBalloonLayoutTemplate();
  return -[CKTapbackPickerBalloonLayoutTemplate init](&v3, sel_init);
}

@end
