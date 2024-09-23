@implementation CALayer(ClipServicesUIExtras)

- (uint64_t)cps_pauseAnimations
{
  uint64_t result;
  float v3;
  double v4;
  double v5;

  result = objc_msgSend(a1, "speed");
  if (v3 != 0.0)
  {
    objc_msgSend(a1, "convertTime:fromLayer:", 0, CACurrentMediaTime());
    v5 = v4;
    LODWORD(v4) = 0;
    objc_msgSend(a1, "setSpeed:", v4);
    return objc_msgSend(a1, "setTimeOffset:", v5);
  }
  return result;
}

- (uint64_t)cps_resumeAnimations
{
  uint64_t result;
  float v3;
  double v4;
  double v5;
  double v6;
  double v7;

  result = objc_msgSend(a1, "speed");
  if (v3 <= 0.0)
  {
    objc_msgSend(a1, "timeOffset");
    v5 = v4;
    objc_msgSend(a1, "setTimeOffset:", 0.0);
    objc_msgSend(a1, "setBeginTime:", 0.0);
    LODWORD(v6) = 1.0;
    objc_msgSend(a1, "setSpeed:", v6);
    objc_msgSend(a1, "convertTime:fromLayer:", 0, CACurrentMediaTime());
    return objc_msgSend(a1, "setBeginTime:", v7 - v5);
  }
  return result;
}

@end
