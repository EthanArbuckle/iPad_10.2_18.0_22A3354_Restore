@implementation PKStrokeSelection

- (PKStrokeSelection)initWithStrokes:(id)a3 lassoStroke:(id)a4 drawing:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKStrokeSelection *v11;
  uint64_t v12;
  NSOrderedSet *strokes;
  NSSet *v14;
  NSOrderedSet *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSSet *strokeIdentifiers;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PKStrokeSelection;
  v11 = -[PKStrokeSelection init](&v27, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    strokes = v11->_strokes;
    v11->_strokes = (NSOrderedSet *)v12;

    objc_storeStrong((id *)&v11->_lassoStroke, a4);
    objc_storeStrong((id *)&v11->_drawing, a5);
    v14 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = v11->_strokes;
    v16 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v19), "_strokeUUID", (_QWORD)v23);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSSet addObject:](v14, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v17);
    }

    strokeIdentifiers = v11->_strokeIdentifiers;
    v11->_strokeIdentifiers = v14;

  }
  return v11;
}

- (PKStrokeSelection)initWithStrokes:(id)a3 externalElements:(id)a4 lassoStroke:(id)a5 drawing:(id)a6
{
  id v10;
  PKStrokeSelection *v11;
  uint64_t v12;
  NSOrderedSet *externalElements;

  v10 = a4;
  v11 = -[PKStrokeSelection initWithStrokes:lassoStroke:drawing:](self, "initWithStrokes:lassoStroke:drawing:", a3, a5, a6);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    externalElements = v11->_externalElements;
    v11->_externalElements = (NSOrderedSet *)v12;

  }
  return v11;
}

- (int64_t)requiredContentVersion
{
  NSOrderedSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_strokes;
  v3 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 1;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(v2);
      v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "requiredContentVersion", (_QWORD)v10);
      if (v6 <= v8)
        v6 = v8;
      if (v6 == 3)
        break;
      if (v4 == ++v7)
      {
        v4 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (CGRect)bounds
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  PKStroke *lassoStroke;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect result;
  CGRect v23;

  -[PKStrokeSelection boundsWithoutLasso](self, "boundsWithoutLasso");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  lassoStroke = self->_lassoStroke;
  if (lassoStroke)
  {
    -[PKStroke _bounds](lassoStroke, "_bounds");
    v23.origin.x = v12;
    v23.origin.y = v13;
    v23.size.width = v14;
    v23.size.height = v15;
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v21 = CGRectUnion(v20, v23);
    x = v21.origin.x;
    y = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
  }
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)boundsWithoutLasso
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  NSOrderedSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v30;
  CGRect v31;

  v25 = *MEMORY[0x1E0C80C00];
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = self->_strokes;
  v8 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "_bounds", (_QWORD)v20);
        v30.origin.x = v12;
        v30.origin.y = v13;
        v30.size.width = v14;
        v30.size.height = v15;
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v27 = CGRectUnion(v26, v30);
        x = v27.origin.x;
        y = v27.origin.y;
        width = v27.size.width;
        height = v27.size.height;
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  -[PKStrokeSelection externalElementsBounds](self, "externalElementsBounds");
  v31.origin.x = v16;
  v31.origin.y = v17;
  v31.size.width = v18;
  v31.size.height = v19;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  return CGRectUnion(v28, v31);
}

- (CGRect)externalElementsBounds
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  NSOrderedSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGRect v25;
  CGRect v26;
  CGRect result;
  CGRect v28;

  v24 = *MEMORY[0x1E0C80C00];
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_externalElements;
  v7 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "boundingBox", (_QWORD)v19);
        v28.origin.x = v11;
        v28.origin.y = v12;
        v28.size.width = v13;
        v28.size.height = v14;
        v25.origin.x = x;
        v25.origin.y = y;
        v25.size.width = width;
        v25.size.height = height;
        v26 = CGRectUnion(v25, v28);
        x = v26.origin.x;
        y = v26.origin.y;
        width = v26.size.width;
        height = v26.size.height;
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.drawing");
  v3[1] = CFSTR("com.apple.pencilkit.strokes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  +[PKStrokeSelection objectWithItemProviderData:typeIdentifier:drawingClass:error:](PKStrokeSelection, "objectWithItemProviderData:typeIdentifier:drawingClass:error:", v8, v7, objc_opt_class(), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 drawingClass:(Class)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v9, "isEqual:", CFSTR("com.apple.pencilkit.strokes")) & 1) != 0
    || objc_msgSend(v9, "isEqual:", CFSTR("com.apple.drawing")))
  {
    +[PKStrokeSelection strokeSelectionFromData:forDrawingClass:](PKStrokeSelection, "strokeSelectionFromData:forDrawingClass:", v8, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.drawing"));
  objc_msgSend(MEMORY[0x1E0DC3870], "writableTypeIdentifiersForItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

  return (NSArray *)v2;
}

- (NSArray)writableTypeIdentifiersForItemProvider
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", CFSTR("com.apple.drawing"));
  if (!-[PKStrokeSelection containsBitmapData](self, "containsBitmapData"))
    objc_msgSend(v3, "addObject:", CFSTR("com.apple.pencilkit.strokes"));
  objc_msgSend(MEMORY[0x1E0DC3870], "writableTypeIdentifiersForItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  return (NSArray *)v3;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  uint64_t v8;
  void *v9;
  int v10;
  PKStrokeSelectionImage *strokeImage;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  void (**v23)(id, uint64_t, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (objc_msgSend(v6, "isEqual:", CFSTR("com.apple.drawing")))
  {
    -[PKStrokeSelection strokeDataForSelection](self, "strokeDataForSelection");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v17 = (void *)v8;
    v7[2](v7, v8, 0);
LABEL_12:

    goto LABEL_13;
  }
  if (objc_msgSend(v6, "isEqual:", CFSTR("com.apple.pencilkit.strokes"))
    && !-[PKStrokeSelection containsBitmapData](self, "containsBitmapData"))
  {
    -[PKStrokeSelection legacyStrokeDataForSelection](self, "legacyStrokeDataForSelection");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "readableTypeIdentifiersForItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v6);

  if (v10)
  {
    strokeImage = self->_strokeImage;
    if (strokeImage)
    {
      -[PKStrokeSelectionImage fullSizeConfig](strokeImage, "fullSizeConfig");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        -[PKStrokeSelectionImage fullSizeConfig](self->_strokeImage, "fullSizeConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKStrokeSelectionImage config](self->_strokeImage, "config");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);

        if ((v16 & 1) == 0)
        {
          -[PKStrokeSelectionImage fullSizeConfig](self->_strokeImage, "fullSizeConfig");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __81__PKStrokeSelection_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
          v21[3] = &unk_1E7779DC8;
          v22 = v6;
          v23 = v7;
          -[PKStrokeSelection generateImageWithConfig:fullSizeConfig:selectionInteraction:withCompletion:](self, "generateImageWithConfig:fullSizeConfig:selectionInteraction:withCompletion:", v20, 0, 0, v21);

          goto LABEL_13;
        }
      }
      -[PKStrokeSelectionImage combinedImage](self->_strokeImage, "combinedImage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v17, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v6, v7);
      goto LABEL_12;
    }
  }
LABEL_13:

  return 0;
}

void __81__PKStrokeSelection_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  objc_msgSend(a2, "combinedImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)imageDataForSelection
{
  UIImage *v2;
  void *v3;

  -[PKStrokeSelectionImage combinedImage](self->_strokeImage, "combinedImage");
  v2 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_newDrawingWithStrokes
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc((Class)objc_opt_class());
  -[NSOrderedSet array](self->_strokes, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithStrokes:fromDrawing:", v4, self->_drawing);

  if (self->_lassoStroke)
  {
    objc_msgSend(v5, "_addStroke:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "setStroke:hidden:", v6, 0);

  }
  return v5;
}

- (id)legacyStrokeDataForSelection
{
  id v2;
  void *v3;

  if (self->_strokes && self->_drawing)
  {
    v2 = -[PKStrokeSelection _newDrawingWithStrokes](self, "_newDrawingWithStrokes");
    objc_msgSend(v2, "serializeWithVersion:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)strokeDataForSelection
{
  id v2;
  void *v3;

  if (self->_strokes && self->_drawing)
  {
    v2 = -[PKStrokeSelection _newDrawingWithStrokes](self, "_newDrawingWithStrokes");
    objc_msgSend(v2, "serializeTransiently");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)strokeSelectionFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "strokeSelectionFromData:forDrawingClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)strokeSelectionFromData:(id)a3 forDrawingClass:(Class)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  PKStrokeSelection *v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (void *)objc_msgSend([a4 alloc], "initWithData:loadNonInkingStrokes:error:", v5, 1, 0);
    v7 = (void *)MEMORY[0x1E0C99E10];
    objc_msgSend(v6, "strokes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orderedSetWithArray:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = v6;
    objc_msgSend(v6, "_rootStrokes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13);
        objc_msgSend(v14, "ink", v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", CFSTR("com.apple.ink.lasso"));

        if ((v17 & 1) != 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v18 = v14;

      if (!v18)
        goto LABEL_14;
      v19 = v23;
      v20 = v24;
      if (objc_msgSend(v23, "containsObject:", v18))
        objc_msgSend(v23, "removeObject:", v18);
    }
    else
    {
LABEL_10:

      v18 = 0;
LABEL_14:
      v19 = v23;
      v20 = v24;
    }
    v21 = -[PKStrokeSelection initWithStrokes:lassoStroke:drawing:]([PKStrokeSelection alloc], "initWithStrokes:lassoStroke:drawing:", v19, v18, 0);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)containsBitmapData
{
  id v2;
  BOOL v3;

  v2 = -[PKStrokeSelection _newDrawingWithStrokes](self, "_newDrawingWithStrokes");
  v3 = objc_msgSend(v2, "_minimumSerializationVersion") > 1;

  return v3;
}

- (void)newExternalElementsCGImageFromCGImage:(CGImage *)a3 withConfig:(id)a4 selectionInteraction:(id)a5 renderImage:(BOOL)a6 withCompletion:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  _QWORD v29[4];
  void (**v30)(id, _QWORD);
  CGImage *v31;
  uint64_t v32;
  BOOL v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD))a7;
  if (!a3)
    goto LABEL_13;
  -[PKStrokeSelection externalElements](self, "externalElements");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
  {

    goto LABEL_13;
  }
  objc_msgSend(v13, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) == 0)
  {
LABEL_13:
    v14[2](v14, 0);
    goto LABEL_14;
  }
  v28 = a6;
  v27 = CGBitmapContextCreateForFlatteningImage();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[PKStrokeSelection externalElements](self, "externalElements");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "reversedOrderedSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v24), "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v22);
  }

  objc_msgSend(v13, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __118__PKStrokeSelection_newExternalElementsCGImageFromCGImage_withConfig_selectionInteraction_renderImage_withCompletion___block_invoke;
  v29[3] = &unk_1E7779DF0;
  v33 = v28;
  v31 = a3;
  v32 = v27;
  v30 = v14;
  objc_msgSend(v26, "selectionInteraction:renderPreviewForElements:inContext:withConfig:inAttachment:withCompletion:", v13, v18, v27, v12, 0, v29);

LABEL_14:
}

uint64_t __118__PKStrokeSelection_newExternalElementsCGImageFromCGImage_withConfig_selectionInteraction_renderImage_withCompletion___block_invoke(uint64_t a1)
{
  double Width;
  double Height;
  CGRect v5;
  CGRect v6;

  Width = (double)CGImageGetWidth(*(CGImageRef *)(a1 + 40));
  Height = (double)CGImageGetHeight(*(CGImageRef *)(a1 + 40));
  if (*(_BYTE *)(a1 + 56))
  {
    v5.origin.x = 0.0;
    v5.origin.y = 0.0;
    v5.size.width = Width;
    v5.size.height = Height;
    CGContextDrawImage(*(CGContextRef *)(a1 + 48), v5, *(CGImageRef *)(a1 + 40));
  }
  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.width = Width;
  v6.size.height = Height;
  CGContextClipToRect(*(CGContextRef *)(a1 + 48), v6);
  CGBitmapContextCreateImage(*(CGContextRef *)(a1 + 48));
  CGContextRelease(*(CGContextRef *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateImageWithConfig:(id)a3 fullSizeConfig:(id)a4 selectionInteraction:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  PKImageRenderer *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  PKStrokeSelection *v53;
  id v54;
  id v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  PKImageRenderer *v62;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(v10, "sixChannel");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");

  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__12;
  v61 = __Block_byref_object_dispose__12;
  v16 = [PKImageRenderer alloc];
  objc_msgSend(v10, "imageSize");
  v62 = -[PKImageRenderer initWithSize:scale:renderQueue:sixChannelBlending:](v16, "initWithSize:scale:renderQueue:sixChannelBlending:", 0, v14);
  v17 = objc_msgSend(v10, "invertedColors");
  objc_msgSend((id)v58[5], "setInvertColors:", v17);
  v18 = (void *)v58[5];
  -[PKStrokeSelection strokes](self, "strokes");
  if ((_DWORD)v14)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "strokeBounds");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(v10, "scale");
    v30 = v29;
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __96__PKStrokeSelection_generateImageWithConfig_fullSizeConfig_selectionInteraction_withCompletion___block_invoke;
    v50[3] = &unk_1E7779E40;
    v51 = v10;
    v52 = v11;
    v53 = self;
    v54 = v12;
    v56 = &v57;
    v55 = v13;
    objc_msgSend(v18, "sixChannelCGRenderStrokes:clippedToStrokeSpaceRect:scale:completion:", v20, v50, v22, v24, v26, v28, v30);

    v31 = v51;
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "strokeBounds");
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;
    objc_msgSend(v10, "scale");
    v43 = v42;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __96__PKStrokeSelection_generateImageWithConfig_fullSizeConfig_selectionInteraction_withCompletion___block_invoke_3;
    v44[3] = &unk_1E7779E90;
    v44[4] = self;
    v45 = v10;
    v46 = v12;
    v49 = &v57;
    v48 = v13;
    v47 = v11;
    objc_msgSend(v18, "renderCGStrokes:clippedToStrokeSpaceRect:scale:completion:", v33, v44, v35, v37, v39, v41, v43);

    v31 = v45;
  }

  _Block_object_dispose(&v57, 8);
}

void __96__PKStrokeSelection_generateImageWithConfig_fullSizeConfig_selectionInteraction_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  PKStrokeSelectionImage *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  PKStrokeSelectionImage *v13;
  __int128 v14;
  _QWORD v15[4];
  PKStrokeSelectionImage *v16;
  __int128 v17;

  v6 = -[PKStrokeSelectionImage initWithImage:config:fullSizeConfig:]([PKStrokeSelectionImage alloc], "initWithImage:config:fullSizeConfig:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStrokeSelectionImage setAddImage:](v6, "setAddImage:", v7);

  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStrokeSelectionImage setMulImage:](v6, "setMulImage:", v8);

  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __96__PKStrokeSelection_generateImageWithConfig_fullSizeConfig_selectionInteraction_withCompletion___block_invoke_2;
  v15[3] = &unk_1E7779E18;
  v16 = v6;
  v14 = *(_OWORD *)(a1 + 64);
  v12 = (id)v14;
  v17 = v14;
  v13 = v6;
  objc_msgSend(v10, "newExternalElementsCGImageFromCGImage:withConfig:selectionInteraction:renderImage:withCompletion:", a2, v9, v11, 0, v15);

}

void __96__PKStrokeSelection_generateImageWithConfig_fullSizeConfig_selectionInteraction_withCompletion___block_invoke_2(uint64_t a1, CGImage *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a2)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "scale");
    objc_msgSend(v4, "imageWithCGImage:scale:orientation:", a2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setImage:", v5);

    CGImageRelease(a2);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  if (v7)
  {
    *(_QWORD *)(v6 + 40) = 0;

  }
}

void __96__PKStrokeSelection_generateImageWithConfig_fullSizeConfig_selectionInteraction_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96__PKStrokeSelection_generateImageWithConfig_fullSizeConfig_selectionInteraction_withCompletion___block_invoke_4;
  v7[3] = &unk_1E7779E68;
  v11 = *(_QWORD *)(a1 + 72);
  v12 = a2;
  v8 = v4;
  v10 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v5, "newExternalElementsCGImageFromCGImage:withConfig:selectionInteraction:renderImage:withCompletion:", a2, v8, v6, 1, v7);

}

void __96__PKStrokeSelection_generateImageWithConfig_fullSizeConfig_selectionInteraction_withCompletion___block_invoke_4(uint64_t a1, CGImage *a2)
{
  CGImage *v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  PKStrokeSelectionImage *v8;
  id v9;

  v3 = *(CGImage **)(a1 + 64);
  if (a2)
  {
    CGImageRelease(*(CGImageRef *)(a1 + 64));
    v3 = a2;
LABEL_4:
    v5 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "scale");
    objc_msgSend(v5, "imageWithCGImage:scale:orientation:", v3, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v3)
    goto LABEL_4;
  v9 = 0;
LABEL_5:
  if (objc_msgSend(*(id *)(a1 + 32), "rotated"))
  {
    objc_msgSend(v9, "pk_imageRotated90DegreesClockwise:", 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v6;
  }
  CGImageRelease(v3);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = -[PKStrokeSelectionImage initWithImage:config:fullSizeConfig:]([PKStrokeSelectionImage alloc], "initWithImage:config:fullSizeConfig:", v9, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  (*(void (**)(uint64_t, PKStrokeSelectionImage *))(v7 + 16))(v7, v8);

}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PKStrokeSelection strokeIdentifiers](self, "strokeIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  -[PKStrokeSelection externalElements](self, "externalElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<PKStrokeSelection: %p %ld strokes, %ld elements>"), self, v5, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSOrderedSet)strokes
{
  return self->_strokes;
}

- (NSSet)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (PKStroke)lassoStroke
{
  return self->_lassoStroke;
}

- (PKStrokeSelectionImage)strokeImage
{
  return self->_strokeImage;
}

- (void)setStrokeImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PKStrokeSelectionImage)strokeImageWithHighlight
{
  return self->_strokeImageWithHighlight;
}

- (void)setStrokeImageWithHighlight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (NSOrderedSet)externalElements
{
  return self->_externalElements;
}

- (void)setExternalElements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSItemProvider)externalElementsItemProvider
{
  return self->_externalElementsItemProvider;
}

- (void)setExternalElementsItemProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalElementsItemProvider, 0);
  objc_storeStrong((id *)&self->_externalElements, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_strokeImageWithHighlight, 0);
  objc_storeStrong((id *)&self->_strokeImage, 0);
  objc_storeStrong((id *)&self->_lassoStroke, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_strokes, 0);
}

@end
