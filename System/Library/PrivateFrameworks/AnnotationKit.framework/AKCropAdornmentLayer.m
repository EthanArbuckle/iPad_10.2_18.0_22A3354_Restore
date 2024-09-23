@implementation AKCropAdornmentLayer

- (BOOL)needsUpdateWhenDraggingStartsOrEnds
{
  return 1;
}

- (void)updateAdornmentElements
{
  unint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  objc_super v14;

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v3 = -[AKAdornmentLayer currentlyDraggedArea](self, "currentlyDraggedArea");
  if (v3 - 1 < 8 || v3 == 20)
  {
    -[AKCropAdornmentLayer handlesLayer](self, "handlesLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      -[AKCropAdornmentLayer _addHandles](self, "_addHandles");
    -[AKCropAdornmentLayer _updateHandles](self, "_updateHandles");
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  v5 = -[AKCropAdornmentLayer _shouldShowHandles](self, "_shouldShowHandles");
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  if (!v5)
  {
    -[AKCropAdornmentLayer _removeHandles](self, "_removeHandles");
    -[AKCropAdornmentLayer handlesLayer](self, "handlesLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    LODWORD(v13) = 0;
LABEL_14:
    objc_msgSend(v11, "setOpacity:", v13);

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    goto LABEL_15;
  }
  -[AKCropAdornmentLayer handlesLayer](self, "handlesLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKCropAdornmentLayer handlesLayer](self, "handlesLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    -[AKCropAdornmentLayer _addHandles](self, "_addHandles");
  -[AKCropAdornmentLayer _updateHandles](self, "_updateHandles");
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 0);
    objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 0.2);
    -[AKCropAdornmentLayer handlesLayer](self, "handlesLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    LODWORD(v13) = 1.0;
    goto LABEL_14;
  }
  -[AKCropAdornmentLayer handlesLayer](self, "handlesLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 1.0;
  objc_msgSend(v9, "setOpacity:", v10);

LABEL_15:
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v14.receiver = self;
  v14.super_class = (Class)AKCropAdornmentLayer;
  -[AKAdornmentLayer updateAdornmentElements](&v14, sel_updateAdornmentElements);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)updateSublayersWithScale:(double)a3
{
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v5.receiver = self;
  v5.super_class = (Class)AKCropAdornmentLayer;
  -[AKAdornmentLayer updateSublayersWithScale:](&v5, sel_updateSublayersWithScale_, a3);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (BOOL)_shouldShowHandles
{
  void *v2;
  char v3;

  -[AKAdornmentLayer annotation](self, "annotation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showHandles");

  return v3;
}

- (void)_addHandles
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  -[AKAdornmentLayer annotation](self, "annotation");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  -[AKCropAdornmentLayer setHandlesLayer:](self, "setHandlesLayer:", v3);

  -[AKCropAdornmentLayer handlesLayer](self, "handlesLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMasksToBounds:", 0);

  -[AKCropAdornmentLayer handlesLayer](self, "handlesLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 0;
  objc_msgSend(v5, "setOpacity:", v6);

  v7 = objc_msgSend(v15, "color");
  -[AKCropAdornmentLayer handlesLayer](self, "handlesLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFillColor:", v7);

  v9 = objc_msgSend(v15, "color");
  -[AKCropAdornmentLayer handlesLayer](self, "handlesLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStrokeColor:", v9);

  -[AKAdornmentLayer currentScaleFactor](self, "currentScaleFactor");
  v12 = 1.0 / v11;
  -[AKCropAdornmentLayer handlesLayer](self, "handlesLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLineWidth:", v12);

  -[AKCropAdornmentLayer handlesLayer](self, "handlesLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCropAdornmentLayer addSublayer:](self, "addSublayer:", v14);

}

- (void)_updateHandles
{
  void *v3;
  CGPath *Mutable;
  CGPath *v5;
  CGPath *v6;
  CGPath *v7;
  CGPath *v8;
  CGPath *v9;
  CGPath *v10;
  CGPath *v11;
  CGPath *v12;
  void *v13;
  id v14;

  -[AKAdornmentLayer annotation](self, "annotation");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAdornmentLayer pageController](self, "pageController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = CGPathCreateMutable();
  v5 = +[AKCropAnnotationRenderer cropHandle:forAnnotation:withPageController:](AKCropAnnotationRenderer, "cropHandle:forAnnotation:withPageController:", 0, v14, v3);
  v6 = +[AKCropAnnotationRenderer cropHandle:forAnnotation:withPageController:](AKCropAnnotationRenderer, "cropHandle:forAnnotation:withPageController:", 1, v14, v3);
  v7 = +[AKCropAnnotationRenderer cropHandle:forAnnotation:withPageController:](AKCropAnnotationRenderer, "cropHandle:forAnnotation:withPageController:", 2, v14, v3);
  v8 = +[AKCropAnnotationRenderer cropHandle:forAnnotation:withPageController:](AKCropAnnotationRenderer, "cropHandle:forAnnotation:withPageController:", 3, v14, v3);
  if (v5)
    CGPathAddPath(Mutable, 0, v5);
  if (v6)
    CGPathAddPath(Mutable, 0, v6);
  if (v7)
    CGPathAddPath(Mutable, 0, v7);
  if (v8)
    CGPathAddPath(Mutable, 0, v8);
  CGPathRelease(v5);
  CGPathRelease(v6);
  CGPathRelease(v7);
  CGPathRelease(v8);
  v9 = +[AKCropAnnotationRenderer cropHandle:forAnnotation:withPageController:](AKCropAnnotationRenderer, "cropHandle:forAnnotation:withPageController:", 4, v14, v3);
  v10 = +[AKCropAnnotationRenderer cropHandle:forAnnotation:withPageController:](AKCropAnnotationRenderer, "cropHandle:forAnnotation:withPageController:", 5, v14, v3);
  v11 = +[AKCropAnnotationRenderer cropHandle:forAnnotation:withPageController:](AKCropAnnotationRenderer, "cropHandle:forAnnotation:withPageController:", 6, v14, v3);
  v12 = +[AKCropAnnotationRenderer cropHandle:forAnnotation:withPageController:](AKCropAnnotationRenderer, "cropHandle:forAnnotation:withPageController:", 7, v14, v3);
  CGPathAddPath(Mutable, 0, v9);
  CGPathAddPath(Mutable, 0, v10);
  CGPathAddPath(Mutable, 0, v11);
  CGPathAddPath(Mutable, 0, v12);
  CGPathRelease(v9);
  CGPathRelease(v10);
  CGPathRelease(v11);
  CGPathRelease(v12);
  -[AKCropAdornmentLayer handlesLayer](self, "handlesLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPath:", Mutable);

  CGPathRelease(Mutable);
}

- (void)_removeHandles
{
  void *v3;
  void *v4;
  double v5;

  -[AKCropAdornmentLayer handlesLayer](self, "handlesLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperlayer");

  -[AKCropAdornmentLayer handlesLayer](self, "handlesLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 0;
  objc_msgSend(v4, "setOpacity:", v5);

  -[AKCropAdornmentLayer setHandlesLayer:](self, "setHandlesLayer:", 0);
}

- (CAShapeLayer)handlesLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setHandlesLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlesLayer, 0);
}

@end
