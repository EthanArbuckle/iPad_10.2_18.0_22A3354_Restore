@implementation PKSelectionModificationKnob

- (id)setKnobColor:(id *)result
{
  id *v3;

  if (result)
  {
    v3 = result;
    result = (id *)CGColorEqualToColor((CGColorRef)result[8], a2);
    if ((result & 1) == 0)
    {
      CGColorRelease((CGColorRef)v3[8]);
      v3[8] = CGColorRetain(a2);
      return -[PKSelectionModificationKnob _updateKnobAppearance](v3);
    }
  }
  return result;
}

- (void)layoutSublayers
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSelectionModificationKnob;
  -[PKSelectionModificationKnob layoutSublayers](&v3, sel_layoutSublayers);
  -[PKSelectionModificationKnob _updateKnobAppearance]((id *)&self->super.super.isa);
}

- (id)_updateKnobAppearance
{
  id *v1;
  double v2;
  double v3;
  double v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect v32;
  CGRect v33;

  if (result)
  {
    v1 = result;
    if (*((_BYTE *)result + 48))
    {
      v2 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v31 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v4 = *MEMORY[0x1E0C9D648];
      v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      objc_msgSend(result, "bounds");
      x = v32.origin.x;
      y = v32.origin.y;
      width = v32.size.width;
      height = v32.size.height;
      MidX = CGRectGetMidX(v32);
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      MidY = CGRectGetMidY(v33);
      objc_msgSend(v1, "bounds");
      v12 = v11;
      objc_msgSend(v1, "bounds");
      v14 = v13;
      v15 = MidX - v12 * 0.5;
      v16 = MidY - v13 * 0.5;
LABEL_8:
      objc_msgSend(v1[4], "setBackgroundColor:", v1[8]);
      objc_msgSend(v1[4], "setCornerRadius:", v12 * 0.5);
      objc_msgSend(v1[4], "setFrame:", v15, v16, v12, v14);
      objc_msgSend(v1[5], "setBackgroundColor:", v1[8]);
      objc_msgSend(v1[5], "setFrame:", v4, v3, v2, v31);
      return (id *)objc_msgSend(v1[5], "setCornerRadius:", -[PKSelectionModificationKnob _knobTailWidth]() * 0.5);
    }
    v15 = -[PKSelectionModificationKnob _rectForKnob]((uint64_t)result);
    v16 = v17;
    v12 = v18;
    v14 = v19;
    v20 = -[PKSelectionModificationKnob _knobTailWidth]();
    objc_msgSend(v1, "bounds");
    v22 = v21 + -1.0;
    v23 = v20 * 0.5;
    v24 = v1[7];
    v25 = v20 * 0.5;
    if (*((_BYTE *)v1 + 49))
    {
      if (v24 == (id)1)
      {
LABEL_7:
        objc_msgSend(v1, "bounds", *(_QWORD *)&v20);
        v27 = v26;
        objc_msgSend(v1, "bounds");
        v3 = v28 * 0.5 - v25;
        v29 = v23 + v22;
        v4 = v27 * 0.5 - v23;
        v31 = v29;
        v2 = v30;
        goto LABEL_8;
      }
    }
    else if (!v24)
    {
      goto LABEL_7;
    }
    v25 = v21 + -1.0;
    goto LABEL_7;
  }
  return result;
}

- (double)_rectForKnob
{
  uint64_t v2;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 56);
    if (*(_BYTE *)(a1 + 49))
    {
      if (v2 == 1)
      {
LABEL_4:
        objc_msgSend((id)a1, "bounds");
        objc_msgSend((id)a1, "bounds");
        return 0.0;
      }
    }
    else if (!v2)
    {
      goto LABEL_4;
    }
    objc_msgSend((id)a1, "bounds");
    objc_msgSend((id)a1, "bounds");
    objc_msgSend((id)a1, "bounds");
  }
  return 0.0;
}

- (double)_knobTailWidth
{
  void *v0;
  uint64_t v1;
  double result;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  result = 3.5;
  if (v1 == 1)
    return 4.0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_knobColor);
  v3.receiver = self;
  v3.super_class = (Class)PKSelectionModificationKnob;
  -[PKSelectionModificationKnob dealloc](&v3, sel_dealloc);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityIdentifier
{
  if (self->_knobLocation)
    return CFSTR("com.apple.pencilkit.rightHalfPop");
  else
    return CFSTR("com.apple.pencilkit.leftHalfPop");
}

- (double)distanceFromKnobCenterToPoint:(double)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v12;
  double v13;
  CGRect v15;
  CGRect v16;

  if (!a1)
    return 0.0;
  v15.origin.x = -[PKSelectionModificationKnob _rectForKnob]((uint64_t)a1);
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  MidX = CGRectGetMidX(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MidY = CGRectGetMidY(v16);
  objc_msgSend(a1, "frame");
  return sqrt((a3 - (MidY + v13)) * (a3 - (MidY + v13)) + (a2 - (MidX + v12)) * (a2 - (MidX + v12)));
}

- (id)didBeginBrushSelection
{
  id *v2;

  if (result)
  {
    v2 = result;
    LODWORD(a2) = 0.5;
    objc_msgSend(result, "setOpacity:", a2);
    objc_msgSend(v2[5], "setHidden:", 1);
    *((_BYTE *)v2 + 48) = 1;
    return -[PKSelectionModificationKnob _updateKnobAppearance](v2);
  }
  return result;
}

- (id)didEndBrushSelection
{
  id *v2;

  if (result)
  {
    v2 = result;
    LODWORD(a2) = 1.0;
    objc_msgSend(result, "setOpacity:", a2);
    objc_msgSend(v2[5], "setHidden:", 0);
    *((_BYTE *)v2 + 48) = 0;
    return -[PKSelectionModificationKnob _updateKnobAppearance](v2);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knobTailLayer, 0);
  objc_storeStrong((id *)&self->_knobLayer, 0);
}

@end
