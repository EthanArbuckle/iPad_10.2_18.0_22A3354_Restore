@implementation UIBezierPath

uint64_t __73__UIBezierPath_AXAdditions__accessibilityBezierPathWithSCNVector3Points___block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  void *v3;
  id v4;
  float v5;
  double v6;
  float v7;
  float v8;

  if (a3)
  {
    v3 = *(void **)(result + 32);
    v4 = a2;
    objc_msgSend(v4, "SCNVector3Value");
    v6 = v5;
    objc_msgSend(v4, "SCNVector3Value");
    v8 = v7;

    return objc_msgSend(v3, "addLineToPoint:", v6, v8);
  }
  return result;
}

@end
