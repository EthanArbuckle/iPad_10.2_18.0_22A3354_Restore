@implementation AKBoxAdornmentLayer

- (void)updateAdornmentElements
{
  void *v3;
  AKBoxLayer *v4;
  uint64_t v5;
  AKBoxLayer *i;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double Width;
  double MidX;
  void *v26;
  int v27;
  void *v28;
  CGFloat v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  CGAffineTransform v34;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[AKBoxAdornmentLayer sublayers](self, "sublayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (AKBoxLayer *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v4; i = (AKBoxLayer *)((char *)i + 1))
      {
        if (*(_QWORD *)v39 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = v7;
          -[AKBoxLayer removeFromSuperlayer](v4, "removeFromSuperlayer");
          goto LABEL_11;
        }
      }
      v4 = (AKBoxLayer *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  -[AKAdornmentLayer annotation](self, "annotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AKBoxAdornmentLayer _drawsBorderForAnnotation:](self, "_drawsBorderForAnnotation:", v8);

  if (v9)
  {
    if (!v4)
    {
      -[AKAdornmentLayer annotation](self, "annotation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        v13 = 2.3;
      else
        v13 = 0.0;
      if ((isKindOfClass & 1) != 0)
        v14 = 3.0;
      else
        v14 = *(double *)&qword_255A25630;
      v4 = -[AKBoxLayer initWithBorderWidth:cornerRadius:]([AKBoxLayer alloc], "initWithBorderWidth:cornerRadius:", v14, v13);
    }
    -[AKAdornmentLayer annotation](self, "annotation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBoxAdornmentLayer _rectangleForAnnotation:](self, "_rectangleForAnnotation:", v15);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v44.origin.x = v17;
    v44.origin.y = v19;
    v44.size.width = v21;
    v44.size.height = v23;
    Width = CGRectGetWidth(v44);
    v45.origin.x = v17;
    v45.origin.y = v19;
    v45.size.width = v21;
    v45.size.height = v23;
    -[AKBoxLayer setBounds:](v4, "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(v45));
    v46.origin.x = v17;
    v46.origin.y = v19;
    v46.size.width = v21;
    v46.size.height = v23;
    MidX = CGRectGetMidX(v46);
    v47.origin.x = v17;
    v47.origin.y = v19;
    v47.size.width = v21;
    v47.size.height = v23;
    -[AKBoxLayer setPosition:](v4, "setPosition:", MidX, CGRectGetMidY(v47));
    -[AKBoxAdornmentLayer addSublayer:](self, "addSublayer:", v4);
  }
  -[AKAdornmentLayer annotation](self, "annotation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "conformsToAKRotatableAnnotationProtocol");

  if (v27)
  {
    v32 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v37.a = *MEMORY[0x24BDBD8B8];
    v31 = *(_OWORD *)&v37.a;
    *(_OWORD *)&v37.c = v32;
    *(_OWORD *)&v37.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    v30 = *(_OWORD *)&v37.tx;
    -[AKAdornmentLayer annotation](self, "annotation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "rotationAngle");
    CGAffineTransformMakeRotation(&t2, v29);
    *(_OWORD *)&t1.a = v31;
    *(_OWORD *)&t1.c = v32;
    *(_OWORD *)&t1.tx = v30;
    CGAffineTransformConcat(&v37, &t1, &t2);

    v34 = v37;
    -[AKBoxLayer setAffineTransform:](v4, "setAffineTransform:", &v34);
  }
  v33.receiver = self;
  v33.super_class = (Class)AKBoxAdornmentLayer;
  -[AKAdornmentLayer updateAdornmentElements](&v33, sel_updateAdornmentElements);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

- (void)updateSublayersWithScale:(double)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[AKBoxAdornmentLayer sublayers](self, "sublayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(v6, "setBorderWidthScale:", a3);
  v10.receiver = self;
  v10.super_class = (Class)AKBoxAdornmentLayer;
  -[AKAdornmentLayer updateSublayersWithScale:](&v10, sel_updateSublayersWithScale_, a3);

}

- (BOOL)_drawsBorderForAnnotation:(id)a3
{
  id v3;
  char isKindOfClass;
  id v5;
  void *v6;
  void *v7;
  double v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = 0;
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v3;
      objc_msgSend(v5, "fillColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(v5, "strokeColor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_msgSend(v5, "strokeWidth");
          isKindOfClass = v8 <= 0.0;
        }
        else
        {
          isKindOfClass = 1;
        }
        goto LABEL_15;
      }
    }
    else
    {
      if (!objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        goto LABEL_17;
      }
      v5 = v3;
      objc_msgSend(v5, "annotationText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v5, "annotationText");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_msgSend(v7, "length") != 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    isKindOfClass = 0;
LABEL_16:

    goto LABEL_17;
  }
  isKindOfClass = 1;
LABEL_17:

  return isKindOfClass & 1;
}

- (CGRect)_rectangleForAnnotation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CGFloat v22;
  CGFloat v23;
  double x;
  double y;
  double width;
  double height;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  CGRect v64;
  CGRect result;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  x = *MEMORY[0x24BDBF090];
  y = *(double *)(MEMORY[0x24BDBF090] + 8);
  width = *(double *)(MEMORY[0x24BDBF090] + 16);
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    +[AKAnnotationRenderer textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:](AKAnnotationRenderer, "textBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", v4, 0, x, y, width, height);
    v57 = v56;
    v59 = v58;
    v61 = v60;
    v63 = v62;
    if (+[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", objc_msgSend(v4, "originalExifOrientation")))
    {
      v22 = -1.0;
      v23 = -5.0;
    }
    else
    {
      v22 = -5.0;
      v23 = -1.0;
    }
    v18 = v57;
    v19 = v59;
    v20 = v61;
    v21 = v63;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_3:
    objc_msgSend(v4, "rectangle");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[AKAdornmentLayer annotation](self, "annotation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:](AKAnnotationRenderer, "draggingBoundsInsetsForAnnotation:", v13);
    v15 = v14;
    v17 = v16;

    v18 = v6;
    v19 = v8;
    v20 = v10;
    v21 = v12;
    v22 = v15;
    v23 = v17;
LABEL_4:
    v64 = CGRectInset(*(CGRect *)&v18, v22, v23);
    x = v64.origin.x;
    y = v64.origin.y;
    width = v64.size.width;
    height = v64.size.height;
  }
  -[AKAdornmentLayer pageController](self, "pageController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "geometryHelper");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "contentAlignedRectForRect:", x, y, width, height);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;

  if (!+[AKGeometryHelper annotationHasRotation:outAngle:](AKGeometryHelper, "annotationHasRotation:outAngle:", v4, 0))
  {
    objc_msgSend(v28, "geometryHelper");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "screenPixelAlignedRectForRect:", v31, v33, v35, v37);
    v31 = v39;
    v33 = v40;
    v35 = v41;
    v37 = v42;

  }
  objc_msgSend(v28, "geometryHelper");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "convertRect:fromModelToLayer:", self, v31, v33, v35, v37);
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;

  v52 = v45;
  v53 = v47;
  v54 = v49;
  v55 = v51;
  result.size.height = v55;
  result.size.width = v54;
  result.origin.y = v53;
  result.origin.x = v52;
  return result;
}

@end
