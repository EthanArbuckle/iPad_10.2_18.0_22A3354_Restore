@implementation UIView(NUITestExtras)

- (double)sizeToBestFitAndLayoutIfNeeded
{
  double v2;
  double v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = objc_msgSend(a1, "_wantsConstraintBasedLayout");
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v4)
    objc_msgSend(a1, "systemLayoutSizeFittingSize:", v5, v6);
  else
    objc_msgSend(a1, "effectiveLayoutSizeFittingSize:", v5, v6);
  v9 = v7;
  objc_msgSend(a1, "setFrame:", v2, v3, v7, v8);
  objc_msgSend(a1, "layoutIfNeeded");
  return v9;
}

- (double)testableSizeThatFits:()NUITestExtras
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "sizeThatFits:");
  objc_msgSend(a1, "alignmentRectForFrame:", 0.0, 0.0, v2, v3);
  return v4;
}

- (double)testableEffectiveLayoutSizeFittingSize:()NUITestExtras
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "sizeThatFits:");
  objc_msgSend(a1, "alignmentRectForFrame:", 0.0, 0.0, v2, v3);
  return v4;
}

@end
