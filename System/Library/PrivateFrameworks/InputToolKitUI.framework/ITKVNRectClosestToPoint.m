@implementation ITKVNRectClosestToPoint

uint64_t __ITKVNRectClosestToPoint_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;

  v4 = a3;
  objc_msgSend(a2, "boundingBox");
  ITKCenterOfRect();
  objc_msgSend(v4, "boundingBox");

  ITKCenterOfRect();
  ITKDistanceSquared();
  v6 = v5;
  ITKDistanceSquared();
  if (v6 >= v7)
    return v7 < v6;
  else
    return -1;
}

@end
