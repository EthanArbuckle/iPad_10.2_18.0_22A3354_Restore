@implementation BSColor(BaseBoardUI)

- (uint64_t)UIColor
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v2 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(a1, "red");
  v4 = v3;
  objc_msgSend(a1, "green");
  v6 = v5;
  objc_msgSend(a1, "blue");
  v8 = v7;
  objc_msgSend(a1, "alpha");
  return objc_msgSend(v2, "colorWithRed:green:blue:alpha:", v4, v6, v8, v9);
}

@end
