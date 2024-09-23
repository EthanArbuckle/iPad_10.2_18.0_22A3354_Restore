@implementation UIScreen(Orientation)

- (uint64_t)currentOrientation
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(a1, "coordinateSpace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fixedCoordinateSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v2, "convertPoint:toCoordinateSpace:", v3, *MEMORY[0x1E0C9D538], v5);
  v7 = v6;
  v9 = v8;

  if (v7 == v4 && v9 == v5)
    return 1;
  if (v7 != 0.0 && v9 != 0.0)
    return 2;
  if (v7 == 0.0 && v9 != 0.0)
    return 4;
  if (v9 != 0.0 || v7 == 0.0)
    return 0;
  else
    return 3;
}

@end
