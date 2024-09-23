@implementation PKDetectionItem

- (PKDetectionItem)initWithSessionManager:(id)a3
{
  id v4;
  PKDetectionItem *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  CGPoint v9;
  CGSize v10;
  UIColor *inkColor;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKDetectionItem;
  v5 = -[PKDetectionItem init](&v13, sel_init);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = objc_claimAutoreleasedReturnValue();
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v7;

  v9 = (CGPoint)*MEMORY[0x1E0C9D628];
  v10 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v5->__frame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  v5->__frame.size = v10;
  v5->_strokeBounds.origin = v9;
  v5->_strokeBounds.size = v10;
  inkColor = v5->_inkColor;
  v5->__strokeWidth = 0.0;
  v5->_inkColor = 0;

  objc_storeWeak((id *)&v5->_sessionManager, v4);
  return v5;
}

- (CGAffineTransform)drawingToItemTransform
{
  double v5;
  CGFloat v6;
  double v7;

  -[PKDetectionItem _frame](self, "_frame");
  v6 = -v5;
  -[PKDetectionItem _frame](self, "_frame");
  return CGAffineTransformMakeTranslation(retstr, v6, -v7);
}

- (BOOL)_hitTest:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  char v7;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint v15;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  -[PKDetectionItem _frame](self, "_frame");
  v15.x = x;
  v15.y = y;
  if (!CGRectContainsPoint(v16, v15))
    return 0;
  -[PKDetectionItem drawingToItemTransform](self, "drawingToItemTransform");
  -[PKDetectionItem itemSpaceBoundsPath](self, "itemSpaceBoundsPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsPoint:", v13 + y * v11 + v9 * x, v14 + y * v12 + v10 * x);

  return v7;
}

- (UIBezierPath)_baselinePath
{
  return 0;
}

- (id)_strokes
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PKDetectionItem queryItem](self, "queryItem", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "strokeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        -[PKDetectionItem drawing](self, "drawing");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "strokeUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_visibleStrokeForIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v3, "addObject:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_generatePaths
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  double strokeWidth;
  double v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  UIColor *v19;
  UIColor *inkColor;
  UIBezierPath *v21;
  UIBezierPath *v22;
  UIBezierPath *v23;
  UIBezierPath *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  UIBezierPath *v37;
  UIBezierPath *v38;
  CGSize v39;
  UIBezierPath *itemSpaceBoundsPath;
  UIBezierPath *itemSpaceBaselinePath;
  _OWORD v42[3];
  _OWORD v43[3];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void *__p;
  void *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  void *v54;
  void *v55;
  uint64_t v56;
  _BYTE v57[128];
  uint64_t v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v58 = *MEMORY[0x1E0C80C00];
  -[PKDetectionItem _strokes](self, "_strokes");
  v54 = 0;
  v55 = 0;
  v56 = 0;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v51 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v7, "_appendPointsOfInterestForSelection:", &v54);
        strokeWidth = self->__strokeWidth;
        objc_msgSend(v7, "_maxWidthForStroke");
        if (strokeWidth >= v9)
          v9 = strokeWidth;
        self->__strokeWidth = v9;
        x = self->_strokeBounds.origin.x;
        y = self->_strokeBounds.origin.y;
        width = self->_strokeBounds.size.width;
        height = self->_strokeBounds.size.height;
        objc_msgSend(v7, "_bounds");
        v62.origin.x = v14;
        v62.origin.y = v15;
        v62.size.width = v16;
        v62.size.height = v17;
        v59.origin.x = x;
        v59.origin.y = y;
        v59.size.width = width;
        v59.size.height = height;
        self->_strokeBounds = CGRectUnion(v59, v62);
        if (!self->_inkColor)
        {
          objc_msgSend(v7, "ink");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "color");
          v19 = (UIColor *)objc_claimAutoreleasedReturnValue();
          inkColor = self->_inkColor;
          self->_inkColor = v19;

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    }
    while (v4);
  }

  if (v54 == v55)
  {
    v39 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->__frame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->__frame.size = v39;
    itemSpaceBoundsPath = self->_itemSpaceBoundsPath;
    self->_itemSpaceBoundsPath = 0;

    itemSpaceBaselinePath = self->_itemSpaceBaselinePath;
    self->_itemSpaceBaselinePath = 0;

  }
  else
  {
    __p = 0;
    v48 = 0;
    v49 = 0;
    +[PKPathUtility convexHull:forPoints:](PKPathUtility, "convexHull:forPoints:", &__p, &v54);
    +[PKPathUtility bezierPathFromPoints:](PKPathUtility, "bezierPathFromPoints:", &__p);
    v21 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
    v22 = self->_itemSpaceBoundsPath;
    self->_itemSpaceBoundsPath = v21;

    -[PKDetectionItem _baselinePath](self, "_baselinePath");
    v23 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
    v24 = self->_itemSpaceBaselinePath;
    self->_itemSpaceBaselinePath = v23;

    -[UIBezierPath bounds](self->_itemSpaceBoundsPath, "bounds");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[UIBezierPath bounds](self->_itemSpaceBaselinePath, "bounds");
    v63.origin.x = v33;
    v63.origin.y = v34;
    v63.size.width = v35;
    v63.size.height = v36;
    v60.origin.x = v26;
    v60.origin.y = v28;
    v60.size.width = v30;
    v60.size.height = v32;
    v61 = CGRectUnion(v60, v63);
    self->__frame = CGRectInset(v61, 0.0, -self->__strokeWidth);
    v45 = 0u;
    v46 = 0u;
    v44 = 0u;
    -[PKDetectionItem drawingToItemTransform](self, "drawingToItemTransform");
    v37 = self->_itemSpaceBoundsPath;
    v43[0] = v44;
    v43[1] = v45;
    v43[2] = v46;
    -[UIBezierPath applyTransform:](v37, "applyTransform:", v43);
    v38 = self->_itemSpaceBaselinePath;
    v42[0] = v44;
    v42[1] = v45;
    v42[2] = v46;
    -[UIBezierPath applyTransform:](v38, "applyTransform:", v42);
    if (__p)
    {
      v48 = __p;
      operator delete(__p);
    }
  }
  if (v54)
  {
    v55 = v54;
    operator delete(v54);
  }

}

- (UIBezierPath)itemSpaceBaselinePath
{
  UIBezierPath *itemSpaceBaselinePath;

  itemSpaceBaselinePath = self->_itemSpaceBaselinePath;
  if (!itemSpaceBaselinePath)
  {
    -[PKDetectionItem _generatePaths](self, "_generatePaths");
    itemSpaceBaselinePath = self->_itemSpaceBaselinePath;
  }
  return itemSpaceBaselinePath;
}

- (UIBezierPath)itemSpaceBoundsPath
{
  UIBezierPath *itemSpaceBoundsPath;

  itemSpaceBoundsPath = self->_itemSpaceBoundsPath;
  if (!itemSpaceBoundsPath)
  {
    -[PKDetectionItem _generatePaths](self, "_generatePaths");
    itemSpaceBoundsPath = self->_itemSpaceBoundsPath;
  }
  return itemSpaceBoundsPath;
}

- (CGRect)_frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (CGRectIsNull(self->__frame))
    -[PKDetectionItem _generatePaths](self, "_generatePaths");
  x = self->__frame.origin.x;
  y = self->__frame.origin.y;
  width = self->__frame.size.width;
  height = self->__frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)_strokeWidth
{
  double result;

  result = self->__strokeWidth;
  if (result == 0.0)
  {
    -[PKDetectionItem _generatePaths](self, "_generatePaths");
    return self->__strokeWidth;
  }
  return result;
}

- (UIColor)strokeColor
{
  return 0;
}

- (id)image
{
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[PKDetectionItem sessionManager](self, "sessionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionSessionManager drawing](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();

  v6 = [v5 alloc];
  -[PKDetectionItem _strokes](self, "_strokes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDetectionItem sessionManager](self, "sessionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionSessionManager drawing](v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithStrokes:fromDrawing:", v7, v9);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");

  -[PKDetectionItem _frame](self, "_frame");
  objc_msgSend(v10, "imageFromRect:scale:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)UUID
{
  void *v3;
  NSUUID *cachedUUID;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSUUID *v16;
  NSUUID *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!self->_validCachedUUID)
  {
    -[PKDetectionItem _strokes](self, "_strokes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      cachedUUID = self->_cachedUUID;
      self->_cachedUUID = 0;

      self->_validCachedUUID = 1;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[PKDetectionItem queryItem](self, "queryItem", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "strokeIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v20 != v8)
              objc_enumerationMutation(v6);
            v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            -[PKDetectionItem drawing](self, "drawing");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "strokeUUID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "_visibleStrokeForIdentifier:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v13, "_groupID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v15 = objc_msgSend(v13, "_shapeType") == 0;

              if (v15)
              {
                objc_msgSend(v13, "_groupID");
                v16 = (NSUUID *)objc_claimAutoreleasedReturnValue();
                v17 = self->_cachedUUID;
                self->_cachedUUID = v16;

                goto LABEL_14;
              }
            }

          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_14:

    }
  }
  return self->_cachedUUID;
}

- (id)setUUID:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  -[PKDetectionItem UUID](self, "UUID");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (self->_validCachedUUID && ((id)v6 == v5 || (objc_msgSend(v5, "isEqual:", v6) & 1) != 0))
  {
    v8 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_cachedUUID, a3);
    self->_validCachedUUID = 1;
    -[PKDetectionItem _actionNameForActivation:](self, "_actionNameForActivation:", v5 != 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDetectionItem _strokes](self, "_strokes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDetectionItem drawing](self, "drawing");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKModifyStrokesGroupIDCommand commandForModifyingStrokes:drawing:groupID:actionName:](PKModifyStrokesGroupIDCommand, "commandForModifyingStrokes:drawing:groupID:actionName:", v10, v11, v5, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKDetectionItem drawing](self, "drawing");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "applyToDrawing:", v13);

    -[PKDetectionItem drawing](self, "drawing");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invertedInDrawing:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_actionNameForActivation:(BOOL)a3
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PKDrawing)drawing
{
  return (PKDrawing *)objc_loadWeakRetained((id *)&self->_drawing);
}

- (void)setDrawing:(id)a3
{
  objc_storeWeak((id *)&self->_drawing, a3);
}

- (void)setItemSpaceBaselinePath:(id)a3
{
  objc_storeStrong((id *)&self->_itemSpaceBaselinePath, a3);
}

- (void)setItemSpaceBoundsPath:(id)a3
{
  objc_storeStrong((id *)&self->_itemSpaceBoundsPath, a3);
}

- (UIBezierPath)drawingSpaceBoundsPath
{
  return self->_drawingSpaceBoundsPath;
}

- (PKDetectionQueryItem)queryItem
{
  return self->_queryItem;
}

- (void)setQueryItem:(id)a3
{
  objc_storeStrong((id *)&self->_queryItem, a3);
}

- (void)set_frame:(CGRect)a3
{
  self->__frame = a3;
}

- (CGRect)strokeBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_strokeBounds.origin.x;
  y = self->_strokeBounds.origin.y;
  width = self->_strokeBounds.size.width;
  height = self->_strokeBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setStrokeBounds:(CGRect)a3
{
  self->_strokeBounds = a3;
}

- (void)set_strokeWidth:(double)a3
{
  self->__strokeWidth = a3;
}

- (UIColor)inkColor
{
  return self->_inkColor;
}

- (void)setInkColor:(id)a3
{
  objc_storeStrong((id *)&self->_inkColor, a3);
}

- (PKRecognitionSessionManager)sessionManager
{
  return (PKRecognitionSessionManager *)objc_loadWeakRetained((id *)&self->_sessionManager);
}

- (void)setSessionManager:(id)a3
{
  objc_storeWeak((id *)&self->_sessionManager, a3);
}

- (NSUUID)cachedUUID
{
  return self->_cachedUUID;
}

- (void)setCachedUUID:(id)a3
{
  objc_storeStrong((id *)&self->_cachedUUID, a3);
}

- (BOOL)validCachedUUID
{
  return self->_validCachedUUID;
}

- (void)setValidCachedUUID:(BOOL)a3
{
  self->_validCachedUUID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedUUID, 0);
  objc_destroyWeak((id *)&self->_sessionManager);
  objc_storeStrong((id *)&self->_inkColor, 0);
  objc_storeStrong((id *)&self->_queryItem, 0);
  objc_storeStrong((id *)&self->_drawingSpaceBoundsPath, 0);
  objc_storeStrong((id *)&self->_itemSpaceBoundsPath, 0);
  objc_storeStrong((id *)&self->_itemSpaceBaselinePath, 0);
  objc_destroyWeak((id *)&self->_drawing);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)handleTapForMenuForInteraction:(id)a3 location:(CGPoint)a4 view:(id)a5 viewTransform:(CGAffineTransform *)a6 drawingTransform:(CGAffineTransform *)a7
{
  double y;
  double x;
  id v10;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  objc_msgSend(a5, "convertPoint:toView:", 0, x, y);
  objc_msgSend(v10, "_presentMenuAtLocation:");

}

@end
