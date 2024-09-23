@implementation AKPopupAdornmentLayer

- (void)updateAdornmentElements
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  AKMiniNoteLayer *v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  id v14;
  void *v15;
  int64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double MidX;
  double MidY;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  objc_super v34;
  CGAffineTransform v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;
  CGRect v42;
  CGRect v43;

  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[AKPopupAdornmentLayer sublayers](self, "sublayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v37;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v9 = v8;

    if (v9)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  v9 = objc_alloc_init(AKMiniNoteLayer);
  -[AKMiniNoteLayer setBorderWidth:](v9, "setBorderWidth:", 1.0);
  -[AKPopupAdornmentLayer addSublayer:](self, "addSublayer:", v9);
LABEL_12:
  -[AKAdornmentLayer annotation](self, "annotation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parentAnnotation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v14 = v11;
    objc_msgSend(v14, "color");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[AKHighlightAppearanceHelper attributeTagForHighlightOfColor:](AKHighlightAppearanceHelper, "attributeTagForHighlightOfColor:", v15);

    if (v16 == 763000)
    {
      objc_msgSend(v14, "color");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = v17;
    }
    else
    {
      +[AKHighlightAppearanceHelper colorForNoteOfHighlightAttributeTag:](AKHighlightAppearanceHelper, "colorForNoteOfHighlightAttributeTag:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[AKHighlightAppearanceHelper borderColorForNoteOfHighlightAttributeTag:](AKHighlightAppearanceHelper, "borderColorForNoteOfHighlightAttributeTag:", v16);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = objc_retainAutorelease(v18);
    -[AKMiniNoteLayer setBackgroundColor:](v9, "setBackgroundColor:", objc_msgSend(v19, "CGColor"));
    v20 = objc_retainAutorelease(v17);
    -[AKMiniNoteLayer setBorderColor:](v9, "setBorderColor:", objc_msgSend(v20, "CGColor"));

  }
  -[AKAdornmentLayer pageController](self, "pageController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rectangle");
  x = v42.origin.x;
  y = v42.origin.y;
  width = v42.size.width;
  height = v42.size.height;
  MidX = CGRectGetMidX(v42);
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  MidY = CGRectGetMidY(v43);
  objc_msgSend(v21, "geometryHelper");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "convertPoint:fromModelToLayer:", self, MidX, MidY);
  v30 = v29;
  v32 = v31;

  -[AKMiniNoteLayer setBounds:](v9, "setBounds:", 0.0, 0.0, width, height);
  -[AKMiniNoteLayer setAnchorPoint:](v9, "setAnchorPoint:", 0.5, 0.5);
  -[AKMiniNoteLayer setPosition:](v9, "setPosition:", v30, v32);
  -[AKAdornmentLayer currentScaleFactor](self, "currentScaleFactor");
  if (v33 != 9.22337204e18)
  {
    CGAffineTransformMakeScale(&v35, 1.0 / v33, 1.0 / v33);
    -[AKMiniNoteLayer setAffineTransform:](v9, "setAffineTransform:", &v35);
  }
  v34.receiver = self;
  v34.super_class = (Class)AKPopupAdornmentLayer;
  -[AKAdornmentLayer updateAdornmentElements](&v34, sel_updateAdornmentElements);
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
  -[AKPopupAdornmentLayer sublayers](self, "sublayers");
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

  objc_msgSend(v6, "setBorderWidth:", 1.0 / a3);
  v10.receiver = self;
  v10.super_class = (Class)AKPopupAdornmentLayer;
  -[AKAdornmentLayer updateSublayersWithScale:](&v10, sel_updateSublayersWithScale_, a3);

}

@end
