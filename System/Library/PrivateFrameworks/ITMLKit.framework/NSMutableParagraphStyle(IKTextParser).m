@implementation NSMutableParagraphStyle(IKTextParser)

- (void)ik_applyViewElementStyle:()IKTextParser
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  id v10;

  objc_msgSend(a3, "lineHeight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v10 = v4;
    v5 = objc_msgSend(v4, "ik_unit");
    objc_msgSend(v10, "doubleValue");
    v7 = v6;
    if (v5 == 1)
    {
      objc_msgSend(a1, "setMaximumLineHeight:", v6);
      objc_msgSend(v10, "doubleValue");
      objc_msgSend(a1, "setMinimumLineHeight:");
    }
    else
    {
      v8 = objc_msgSend(v10, "ik_unit");
      v9 = v7 / 100.0;
      if (v8 != 2)
        v9 = v7;
      objc_msgSend(a1, "setLineHeightMultiple:", v9);
    }
    v4 = v10;
  }

}

@end
