@implementation CDCornerComplicationOuterImageCenterPoint

double __CDCornerComplicationOuterImageCenterPoint_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double result;

  v2 = a2;
  v3 = MEMORY[0x2199AA040](objc_msgSend(v2, "screenBounds"));
  v5 = v4;
  CDCornerComplicationTopLeftCenterAngle(v2);
  v6 = CDCornerComplicationOuterImageCenterRadius(v2);

  CLKDegreesToRadians();
  *(float *)&v7 = v7;
  *(double *)&CDCornerComplicationOuterImageCenterPoint__outerImageCenterPoint_1 = v5 - v6 * sinf(*(float *)&v7);
  CLKDegreesToRadians();
  *(float *)&v8 = v8;
  result = v3 - v6 * cosf(*(float *)&v8);
  CDCornerComplicationOuterImageCenterPoint__outerImageCenterPoint_0 = *(_QWORD *)&result;
  return result;
}

@end
