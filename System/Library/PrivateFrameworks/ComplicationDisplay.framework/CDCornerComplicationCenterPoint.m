@implementation CDCornerComplicationCenterPoint

void __CDCornerComplicationCenterPoint_block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "sizeClass");
  if (CLKDeviceCategoryForSizeClass() == 5)
  {
    v2 = MEMORY[0x2199AA040](objc_msgSend(v8, "screenBounds"));
    v4 = v3;
    CDCornerComplicationTopLeftCenterAngle(v8);
    v5 = CDCornerComplicationCenterPointRadius(v8);
    CLKDegreesToRadians();
    *(float *)&v6 = v6;
    *((double *)&CDCornerComplicationCenterPoint__complicationCenterPoint + 1) = v4 - v5 * sinf(*(float *)&v6);
    CLKDegreesToRadians();
    *(float *)&v7 = v7;
    *(double *)&CDCornerComplicationCenterPoint__complicationCenterPoint = v2 - v5 * cosf(*(float *)&v7);
  }
  else
  {
    CDCornerComplicationCenterPoint__complicationCenterPoint = *MEMORY[0x24BDBEFB0];
  }

}

@end
