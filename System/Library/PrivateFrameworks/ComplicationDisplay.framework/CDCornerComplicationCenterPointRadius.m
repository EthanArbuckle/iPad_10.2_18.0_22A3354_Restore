@implementation CDCornerComplicationCenterPointRadius

double __CDCornerComplicationCenterPointRadius_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double result;

  v2 = a2;
  v3 = CDCornerComplicationKeylineInnerRadius(v2);
  v4 = _avoniaCornerComplicationOuterRadius(v2);
  objc_msgSend(v2, "screenCornerRadius");
  v6 = v5;

  result = (v3 + v4 + v6 * -0.414213562) * 0.5;
  *(double *)&CDCornerComplicationCenterPointRadius__complicationCenterRadius = result;
  return result;
}

@end
