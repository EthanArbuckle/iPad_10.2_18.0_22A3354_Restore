@implementation AXMeasureLabelAccessibilityElement

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  BOOL v7;

  objc_opt_class();
  -[AXMeasureLabelAccessibilityElement labelRender](self, "labelRender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("labelNode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "alpha");
    v7 = v6 > 0.0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)accessibilityLabel
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;

  -[AXMeasureLabelAccessibilityElement labelRender](self, "labelRender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("state")) - 3;

  if (v4 >= 2)
  {
    if (-[AXMeasureLabelAccessibilityElement isRectangleArea](self, "isRectangleArea"))
    {
      v5 = CFSTR("RECTANGLE_AREA");
    }
    else
    {
      if (!-[AXMeasureLabelAccessibilityElement isRectangleSideLength](self, "isRectangleSideLength"))
      {
        v6 = 0;
        return v6;
      }
      v5 = CFSTR("RECTANGLE_SIDE_LENGTH");
    }
  }
  else
  {
    v5 = CFSTR("CURRENT_MEASUREMENT");
  }
  accessibilityLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[AXMeasureLabelAccessibilityElement labelRender](self, "labelRender");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("speakableString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)accessibilityFrameInContainerSpace
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[AXMeasureLabelAccessibilityElement labelRender](self, "labelRender");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeCGRectForKey:", CFSTR("accessibilityFrameForLabelContainer"));
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  void *v3;
  unint64_t v4;
  _QWORD *v5;

  v2 = *MEMORY[0x24BDF73E0];
  -[AXMeasureLabelAccessibilityElement labelRender](self, "labelRender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("state")) - 3;

  v5 = (_QWORD *)MEMORY[0x24BDF7430];
  if (v4 >= 2)
    v5 = (_QWORD *)MEMORY[0x24BDF73B0];
  return *v5 | v2;
}

- (BOOL)isRectangleArea
{
  return self->_isRectangleArea;
}

- (void)setIsRectangleArea:(BOOL)a3
{
  self->_isRectangleArea = a3;
}

- (BOOL)isRectangleSideLength
{
  return self->_isRectangleSideLength;
}

- (void)setIsRectangleSideLength:(BOOL)a3
{
  self->_isRectangleSideLength = a3;
}

- (id)labelRender
{
  return objc_loadWeakRetained(&self->_labelRender);
}

- (void)setLabelRender:(id)a3
{
  objc_storeWeak(&self->_labelRender, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_labelRender);
}

@end
