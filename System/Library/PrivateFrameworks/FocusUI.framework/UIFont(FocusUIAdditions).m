@implementation UIFont(FocusUIAdditions)

+ (id)fcui_excessiveLineHeightChars
{
  if (fcui_excessiveLineHeightChars_onceToken != -1)
    dispatch_once(&fcui_excessiveLineHeightChars_onceToken, &__block_literal_global_1);
  return (id)fcui_excessiveLineHeightChars___excessiveLineHeightChars;
}

- (uint64_t)fcui_hasExuberatedLineHeightForText:()FocusUIAdditions
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (objc_msgSend(v4, "length") && objc_msgSend(a1, "fcui_hasExuberatedLineHeight"))
    v5 = objc_msgSend(v4, "fcui_containsExcessiveLineHeightCharacters");
  else
    v5 = 0;

  return v5;
}

- (uint64_t)fcui_effectiveScaledValueForValue:()FocusUIAdditions hasExuberatedLineHeight:
{
  void *v6;

  if (!a4)
    return objc_msgSend(a1, "_scaledValueForValue:", a2);
  v6 = (void *)objc_opt_class();
  objc_msgSend(a1, "_scaledValueForValue:", a2);
  return objc_msgSend(v6, "fcui_exuberatedValueForValue:");
}

- (uint64_t)fcui_effectiveLineHeightForText:()FocusUIAdditions
{
  void *v2;

  if (!objc_msgSend(a1, "fcui_hasExuberatedLineHeightForText:"))
    return objc_msgSend(a1, "lineHeight");
  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "lineHeight");
  return objc_msgSend(v2, "fcui_exuberatedValueForValue:");
}

- (unint64_t)fcui_numberOfLinesForText:()FocusUIAdditions inFrame:maximum:drawingContext:
{
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v14 = a7;
  v15 = a9;
  if (objc_msgSend(v14, "length"))
  {
    if (a8 != 1)
    {
      if (!v15)
      {
        v15 = objc_alloc_init(MEMORY[0x24BEBB4A8]);
        objc_msgSend(v15, "setWantsNumberOfLineFragments:", 1);
      }
      v19 = *MEMORY[0x24BEBB360];
      v20[0] = a1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "boundingRectWithSize:options:attributes:context:", 1, v16, v15, a4, a5);

      if (!a8)
        a8 = -1;
      v17 = objc_msgSend(v15, "numberOfLineFragments");
      if (a8 >= v17)
        a8 = v17;
    }
  }
  else
  {
    a8 = 0;
  }

  return a8;
}

- (double)fcui_measuringHeightForText:()FocusUIAdditions withNumberOfLines:
{
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;

  v6 = (double)a4;
  objc_msgSend(a1, "fcui_effectiveLineHeightForText:");
  v8 = v7;
  v9 = a4 - 1;
  if (!a4)
    v9 = 0;
  v10 = (double)v9;
  objc_msgSend(a1, "leading");
  return v11 * v10 + v6 * v8;
}

- (double)fcui_drawingHeightForText:()FocusUIAdditions withNumberOfLines:additionalPadding:
{
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v8 = objc_msgSend(a1, "fcui_hasExuberatedLineHeightForText:");
  if ((_DWORD)v8)
  {
    v9 = (void *)objc_opt_class();
    objc_msgSend(a1, "lineHeight");
    objc_msgSend(v9, "fcui_exuberatedValueForValue:");
  }
  else
  {
    objc_msgSend(a1, "lineHeight");
  }
  v11 = v10;
  objc_msgSend(a1, "fcui_effectiveScaledValueForValue:hasExuberatedLineHeight:", v8, a2);
  v13 = v12;
  objc_msgSend(a1, "leading");
  return (v13 + v11 + v14) * (double)a5;
}

@end
