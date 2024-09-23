@implementation AKHighlightAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKHighlightAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CEEF8);
  return v4;
}

+ (id)keyPathsForValuesAffectingDrawingBounds
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKHighlightAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CEF10);
  return v4;
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("style")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Style");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("color")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Color");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("quadPoints")))
    {
LABEL_8:
      v10.receiver = a1;
      v10.super_class = (Class)&OBJC_METACLASS___AKHighlightAnnotation;
      objc_msgSendSuper2(&v10, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Range");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24F1A83D0, CFSTR("AnnotationStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_8;
LABEL_9:

  return v8;
}

- (id)keysForValuesToObserveForUndo
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = self;
  v6.super_class = (Class)AKHighlightAnnotation;
  -[AKAnnotation keysForValuesToObserveForUndo](&v6, sel_keysForValuesToObserveForUndo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CEF28);
  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = self;
  v6.super_class = (Class)AKHighlightAnnotation;
  -[AKAnnotation keysForValuesToObserveForRedrawing](&v6, sel_keysForValuesToObserveForRedrawing);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CEF40);
  return v4;
}

- (id)displayName
{
  void *v2;
  void *v3;

  +[AKController akBundle](AKController, "akBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Highlight"), &stru_24F1A83D0, CFSTR("AnnotationStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4
{
  double height;
  double width;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  _OWORD v18[4];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  height = a4.height;
  width = a4.width;
  v31 = *MEMORY[0x24BDAC8D0];
  +[AKGeometryHelper adjustOriginalExifOrientationOnAnnotation:flatteningOriginalModelExif:](AKGeometryHelper, "adjustOriginalExifOrientationOnAnnotation:flatteningOriginalModelExif:", self, a3);
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  +[AKGeometryHelper affineTransformFlatteningOriginalModelExif:withOriginalModelSize:](AKGeometryHelper, "affineTransformFlatteningOriginalModelExif:withOriginalModelSize:", a3, width, height);
  v8 = (void *)MEMORY[0x24BDBCEB8];
  -[AKHighlightAnnotation quadPoints](self, "quadPoints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[AKHighlightAnnotation quadPoints](self, "quadPoints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        if (v16)
          objc_msgSend(v16, "quadrilateralValue");
        v18[0] = v19;
        v18[1] = v20;
        v18[2] = v21;
        v18[3] = v22;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithQuadrilateral:", v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v13);
  }

  -[AKHighlightAnnotation setQuadPoints:](self, "setQuadPoints:", v10);
}

- (void)translateBy:(CGPoint)a3
{
  double y;
  double x;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  _OWORD v26[4];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  y = a3.y;
  x = a3.x;
  v36 = *MEMORY[0x24BDAC8D0];
  if (a3.x != *MEMORY[0x24BDBEFB0] || a3.y != *(double *)(MEMORY[0x24BDBEFB0] + 8))
  {
    v7 = -[AKAnnotation isTranslating](self, "isTranslating");
    -[AKAnnotation setIsTranslating:](self, "setIsTranslating:", 1);
    v8 = (void *)MEMORY[0x24BDBCEB8];
    -[AKHighlightAnnotation quadPoints](self, "quadPoints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[AKHighlightAnnotation quadPoints](self, "quadPoints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          if (v16)
          {
            objc_msgSend(v16, "quadrilateralValue");
            v17 = *((double *)&v28 + 1);
            v18 = *(double *)&v28;
            v19 = *((double *)&v29 + 1);
            v20 = *(double *)&v29;
            v21 = *((double *)&v27 + 1);
            v22 = *(double *)&v27;
            v23 = *((double *)&v30 + 1);
            v24 = *(double *)&v30;
          }
          else
          {
            v23 = 0.0;
            v24 = 0.0;
            v21 = 0.0;
            v22 = 0.0;
            v19 = 0.0;
            v20 = 0.0;
            v17 = 0.0;
            v18 = 0.0;
          }
          *(double *)&v28 = x + v18;
          *((double *)&v28 + 1) = y + v17;
          *(double *)&v29 = x + v20;
          *((double *)&v29 + 1) = y + v19;
          *(double *)&v27 = x + v22;
          *((double *)&v27 + 1) = y + v21;
          *(double *)&v30 = x + v24;
          *((double *)&v30 + 1) = y + v23;
          v26[0] = v27;
          v26[1] = v28;
          v26[2] = v29;
          v26[3] = v30;
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithQuadrilateral:", v26);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v25);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v13);
    }

    -[AKHighlightAnnotation setQuadPoints:](self, "setQuadPoints:", v10);
    -[AKAnnotation setIsTranslating:](self, "setIsTranslating:", v7);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  _OWORD v18[4];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AKHighlightAnnotation;
  -[AKAnnotation encodeWithCoder:](&v27, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[AKHighlightAnnotation style](self, "style"), CFSTR("style"));
  -[AKHighlightAnnotation color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "akEncodeColor:forKey:", v5, CFSTR("color"));

  -[AKHighlightAnnotation quadPoints](self, "quadPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCEB8];
    -[AKHighlightAnnotation quadPoints](self, "quadPoints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[AKHighlightAnnotation quadPoints](self, "quadPoints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          if (v15)
            objc_msgSend(v15, "quadrilateralValue");
          v18[0] = v19;
          v18[1] = v20;
          v18[2] = v21;
          v18[3] = v22;
          AKQuadrilateralCreateDictionaryRepresentation((double *)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("quadPoints"));

  }
}

- (AKHighlightAnnotation)initWithCoder:(id)a3
{
  id v4;
  AKHighlightAnnotation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _OWORD v20[4];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)AKHighlightAnnotation;
  v5 = -[AKAnnotation initWithCoder:](&v29, sel_initWithCoder_, v4);
  if (v5)
  {
    -[AKHighlightAnnotation setStyle:](v5, "setStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style")));
    objc_msgSend(v4, "akDecodeColorForKey:", CFSTR("color"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKHighlightAnnotation setColor:](v5, "setColor:", v6);

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("quadPoints")))
    {
      v7 = (void *)MEMORY[0x24BDBCF20];
      v31[0] = objc_opt_class();
      v31[1] = objc_opt_class();
      v31[2] = objc_opt_class();
      v31[3] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("quadPoints"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v26;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v26 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v16);
            v23 = 0u;
            v24 = 0u;
            v21 = 0u;
            v22 = 0u;
            AKQuadrilateralMakeWithDictionaryRepresentation(v17, (uint64_t)&v21);
            v20[0] = v21;
            v20[1] = v22;
            v20[2] = v23;
            v20[3] = v24;
            objc_msgSend(MEMORY[0x24BDD1968], "valueWithQuadrilateral:", v20);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v18);

            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v14);
      }

      -[AKHighlightAnnotation setQuadPoints:](v5, "setQuadPoints:", v11);
    }
  }

  return v5;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (UIColor)color
{
  return (UIColor *)objc_getProperty(self, a2, 192, 1);
}

- (void)setColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSArray)quadPoints
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setQuadPoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quadPoints, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
