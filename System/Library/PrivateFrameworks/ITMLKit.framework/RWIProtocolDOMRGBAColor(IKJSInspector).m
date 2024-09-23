@implementation RWIProtocolDOMRGBAColor(IKJSInspector)

- (uint64_t)ik_color
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = (void *)MEMORY[0x1E0CEA478];
  v3 = (double)(int)objc_msgSend(a1, "r") / 255.0;
  v4 = (double)(int)objc_msgSend(a1, "g") / 255.0;
  v5 = (double)(int)objc_msgSend(a1, "b") / 255.0;
  objc_msgSend(a1, "a");
  return objc_msgSend(v2, "colorWithRed:green:blue:alpha:", v3, v4, v5, v6);
}

@end
