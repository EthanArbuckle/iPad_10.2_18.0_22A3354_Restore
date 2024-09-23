@implementation WFImage(IsScreenshot)

- (uint64_t)isScreenshot
{
  void *v2;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "CGImageSize");
  return objc_msgSend(v2, "imageSizeIndicatesScreenshot:");
}

+ (BOOL)imageSizeIndicatesScreenshot:()IsScreenshot
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screenScale");
  v6 = v5;

  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screenBounds");
  v9 = v8;
  v11 = v10;

  v12 = v6 * v11;
  if (v6 * v9 == a1 && v12 == a2)
    return 1;
  if (v12 == a1)
    return v6 * v9 == a2;
  return 0;
}

@end
