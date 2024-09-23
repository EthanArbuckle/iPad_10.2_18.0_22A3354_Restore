@implementation CMAttitude(CAMLevelViewModel)

- (uint64_t)cam_getDistanceFromFlat:()CAMLevelViewModel relativeRoll:
{
  double v7;
  double v8;
  uint64_t result;
  double v10;
  float v11;
  double v12;
  double v13;
  float v14;

  objc_msgSend(a1, "pitch");
  v8 = v7;
  result = objc_msgSend(a1, "roll");
  v11 = v10;
  v12 = v11;
  if (v11 <= 1.57079633)
  {
    if (v12 >= -1.57079633)
      goto LABEL_6;
    v13 = 3.14159265;
  }
  else
  {
    v13 = -3.14159265;
  }
  v11 = v12 + v13;
LABEL_6:
  if (a3)
  {
    v14 = v8;
    *a3 = sqrtf((float)(v11 * v11) + (float)(v14 * v14));
  }
  if (a4)
    *a4 = v11;
  return result;
}

@end
