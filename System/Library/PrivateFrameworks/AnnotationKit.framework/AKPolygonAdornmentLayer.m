@implementation AKPolygonAdornmentLayer

- (BOOL)needsUpdateWhenDraggingStartsOrEnds
{
  return 1;
}

- (void)updateAdornmentElements
{
  void *v3;
  AKEllipseLayer *v4;
  uint64_t v5;
  AKEllipseLayer *i;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  double x;
  double y;
  double width;
  double height;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  objc_super v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v47 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[AKPolygonAdornmentLayer sublayers](self, "sublayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (AKEllipseLayer *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v4; i = (AKEllipseLayer *)((char *)i + 1))
      {
        if (*(_QWORD *)v43 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (AKEllipseLayer *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  -[AKAdornmentLayer annotation](self, "annotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AKAdornmentLayer currentlyDraggedArea](self, "currentlyDraggedArea") == 17)
  {
    if (!v4)
    {
      v4 = objc_alloc_init(AKEllipseLayer);
      objc_msgSend(v8, "rectangle");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      +[AKPolygonPointOfInterestHelper pointsControlPointDistanceFactor](AKPolygonPointOfInterestHelper, "pointsControlPointDistanceFactor");
      v18 = v17;
      v48.origin.x = v10;
      v48.origin.y = v12;
      v48.size.width = v14;
      v48.size.height = v16;
      v19 = v18 * CGRectGetWidth(v48);
      +[AKPolygonPointOfInterestHelper pointsControlPointDistanceFactor](AKPolygonPointOfInterestHelper, "pointsControlPointDistanceFactor");
      v21 = v20;
      v49.origin.x = v10;
      v49.origin.y = v12;
      v49.size.width = v14;
      v49.size.height = v16;
      v22 = v21 * CGRectGetHeight(v49);
      v50.origin.x = v10;
      v50.origin.y = v12;
      v50.size.width = v14;
      v50.size.height = v16;
      v23 = (CGRectGetWidth(v50) - v19) * 0.5;
      v51.origin.x = v10;
      v51.origin.y = v12;
      v51.size.width = v14;
      v51.size.height = v16;
      v24 = (CGRectGetHeight(v51) - v22) * 0.5;
      v52.origin.x = v10;
      v52.origin.y = v12;
      v52.size.width = v14;
      v52.size.height = v16;
      v53 = CGRectInset(v52, v23, v24);
      x = v53.origin.x;
      y = v53.origin.y;
      width = v53.size.width;
      height = v53.size.height;
      -[AKAdornmentLayer pageController](self, "pageController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "geometryHelper");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "convertRect:fromModelToLayer:", self, x, y, width, height);
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;

      v39 = *(double *)&qword_255A24AB8;
      -[AKAdornmentLayer currentScaleFactor](self, "currentScaleFactor");
      -[AKEllipseLayer setLineWidth:](v4, "setLineWidth:", v39 / v40);
      -[AKEllipseLayer setFrame:](v4, "setFrame:", v32, v34, v36, v38);
      -[AKPolygonAdornmentLayer addSublayer:](self, "addSublayer:", v4);

    }
  }
  else
  {
    -[AKEllipseLayer removeFromSuperlayer](v4, "removeFromSuperlayer");
  }
  v41.receiver = self;
  v41.super_class = (Class)AKPolygonAdornmentLayer;
  -[AKAdornmentLayer updateAdornmentElements](&v41, sel_updateAdornmentElements);
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
  -[AKPolygonAdornmentLayer sublayers](self, "sublayers");
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

  objc_msgSend(v6, "setLineWidth:", *(double *)&qword_255A24AB8 / a3);
  v10.receiver = self;
  v10.super_class = (Class)AKPolygonAdornmentLayer;
  -[AKAdornmentLayer updateSublayersWithScale:](&v10, sel_updateSublayersWithScale_, a3);

}

@end
