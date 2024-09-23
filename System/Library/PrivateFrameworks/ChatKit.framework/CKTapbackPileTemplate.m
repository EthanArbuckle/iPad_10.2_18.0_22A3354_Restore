@implementation CKTapbackPileTemplate

+ (double)topOfPileBubbleRadius
{
  double result;

  if (qword_1EE1072B8 != -1)
    swift_once();
  if (*(_QWORD *)(qword_1EE12DED0 + 16))
    return *(double *)(qword_1EE12DED0 + 32);
  __break(1u);
  return result;
}

- (CKTapbackPileTemplate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TapbackPileTemplate();
  return -[CKTapbackPileTemplate init](&v3, sel_init);
}

+ (uint64_t)topTapbackCenterXOffsetFromSourcePoint
{
  uint64_t result;

  if (qword_1EE1072B8 != -1)
    result = swift_once();
  if (*(_QWORD *)(qword_1EE12DED0 + 16))
  {
    if (qword_1EE1072C8 == -1)
      return result;
  }
  else
  {
    __break(1u);
  }
  result = swift_once();
  if (!*(_QWORD *)(qword_1EE12DED0 + 16))
    __break(1u);
  return result;
}

@end
