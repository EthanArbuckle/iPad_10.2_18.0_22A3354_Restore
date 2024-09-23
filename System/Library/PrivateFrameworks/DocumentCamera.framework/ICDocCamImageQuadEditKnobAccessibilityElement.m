@implementation ICDocCamImageQuadEditKnobAccessibilityElement

- (ICDocCamImageQuadEditKnobAccessibilityElement)initWithKnobLayer:(id)a3 overlayView:(id)a4
{
  id v6;
  id v7;
  ICDocCamImageQuadEditKnobAccessibilityElement *v8;
  ICDocCamImageQuadEditKnobAccessibilityElement *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICDocCamImageQuadEditKnobAccessibilityElement;
  v8 = -[ICDocCamImageQuadEditKnobAccessibilityElement initWithAccessibilityContainer:](&v11, sel_initWithAccessibilityContainer_, v7);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_knobLayer, v6);
    objc_storeWeak((id *)&v9->_overlayView, v7);
  }

  return v9;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  ICDocCamImageQuadEditKnobAccessibilityElement *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  const __CFString *v19;
  void *v20;

  -[ICDocCamImageQuadEditKnobAccessibilityElement overlayView](self, "overlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "count"))
  {
LABEL_11:
    v19 = CFSTR("top-left crop handle");
    goto LABEL_16;
  }
  v5 = 0;
  v6 = 0;
  v7 = 0;
  do
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
    v8 = (ICDocCamImageQuadEditKnobAccessibilityElement *)objc_claimAutoreleasedReturnValue();

    if (v8 != self)
    {
      -[ICDocCamImageQuadEditKnobAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
      v10 = v9;
      objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "accessibilityFrame");
      v13 = v12;

      if (v10 > v13)
        ++v5;
      -[ICDocCamImageQuadEditKnobAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
      v15 = v14;
      objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "accessibilityFrame");
      v18 = v17;

      if (v15 > v18)
        ++v6;
    }
    ++v7;
  }
  while (v7 < objc_msgSend(v4, "count"));
  if (v5 < 2)
  {
    if (v6 > 1)
    {
      v19 = CFSTR("bottom-left crop handle");
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  if (v6 > 1)
    v19 = CFSTR("bottom-right crop handle");
  else
    v19 = CFSTR("top-right crop handle");
LABEL_16:
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", v19, v19, CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)accessibilityHint
{
  return +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap and drag to adjust crop bounds."), CFSTR("Double-tap and drag to adjust crop bounds."), CFSTR("Localizable"));
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  -[ICDocCamImageQuadEditKnobAccessibilityElement knobLayer](self, "knobLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  v11 = -CGRectGetWidth(v13);
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  v12 = -CGRectGetHeight(v14);
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  return CGRectInset(v15, v11, v12);
}

- (CALayer)knobLayer
{
  return (CALayer *)objc_loadWeakRetained((id *)&self->_knobLayer);
}

- (void)setKnobLayer:(id)a3
{
  objc_storeWeak((id *)&self->_knobLayer, a3);
}

- (ICDocCamImageQuadEditOverlay)overlayView
{
  return (ICDocCamImageQuadEditOverlay *)objc_loadWeakRetained((id *)&self->_overlayView);
}

- (void)setOverlayView:(id)a3
{
  objc_storeWeak((id *)&self->_overlayView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overlayView);
  objc_destroyWeak((id *)&self->_knobLayer);
}

@end
