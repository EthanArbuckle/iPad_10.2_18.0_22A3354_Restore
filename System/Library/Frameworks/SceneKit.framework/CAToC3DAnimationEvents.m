@implementation CAToC3DAnimationEvents

uint64_t ___CAToC3DAnimationEvents_block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;

  objc_msgSend(a2, "time");
  v6 = v5;
  objc_msgSend(a3, "time");
  if (v6 < v7)
    return -1;
  objc_msgSend(a2, "time");
  v10 = v9;
  objc_msgSend(a3, "time");
  return v10 != v11;
}

@end
