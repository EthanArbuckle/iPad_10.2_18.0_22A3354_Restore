@implementation PKTransformStrokesCommand

+ (id)commandForTransforming:(id)a3 drawing:(id)a4 strokeTransform:(CGAffineTransform *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  PKTransformStrokesCommand *v11;
  void *v12;
  __int128 v13;
  PKTransformStrokesCommand *v14;
  _OWORD v16[3];

  v7 = a3;
  v8 = a4;
  _PencilKitBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Transform Stroke"), CFSTR("Transform Stroke"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [PKTransformStrokesCommand alloc];
  objc_msgSend(v8, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_OWORD *)&a5->c;
  v16[0] = *(_OWORD *)&a5->a;
  v16[1] = v13;
  v16[2] = *(_OWORD *)&a5->tx;
  v14 = -[PKTransformStrokesCommand initWithStrokes:drawingUUID:actionName:strokeTransform:](v11, "initWithStrokes:drawingUUID:actionName:strokeTransform:", v7, v12, v10, v16);

  return v14;
}

+ (id)commandForTransforming:(id)a3 drawing:(id)a4 strokeTransforms:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  PKTransformStrokesCommand *v12;
  void *v13;
  PKTransformStrokesCommand *v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  _PencilKitBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Transform Strokes"), CFSTR("Transform Strokes"), CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [PKTransformStrokesCommand alloc];
  objc_msgSend(v8, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKTransformStrokesCommand initWithStrokes:drawingUUID:actionName:strokeTransforms:](v12, "initWithStrokes:drawingUUID:actionName:strokeTransforms:", v7, v13, v11, v9);

  return v14;
}

- (PKTransformStrokesCommand)initWithStrokes:(id)a3 drawingUUID:(id)a4 actionName:(id)a5 strokeTransform:(CGAffineTransform *)a6
{
  id v10;
  id v11;
  id v12;
  PKTransformStrokesCommand *v13;
  uint64_t v14;
  NSArray *strokes;
  __int128 v16;
  __int128 v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKTransformStrokesCommand;
  v13 = -[PKUndoCommand initWithDrawingUUID:actionName:](&v19, sel_initWithDrawingUUID_actionName_, v11, v12);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    strokes = v13->_strokes;
    v13->_strokes = (NSArray *)v14;

    v17 = *(_OWORD *)&a6->c;
    v16 = *(_OWORD *)&a6->tx;
    *(_OWORD *)&v13->_strokeTransform.a = *(_OWORD *)&a6->a;
    *(_OWORD *)&v13->_strokeTransform.c = v17;
    *(_OWORD *)&v13->_strokeTransform.tx = v16;
  }

  return v13;
}

- (PKTransformStrokesCommand)initWithStrokes:(id)a3 drawingUUID:(id)a4 actionName:(id)a5 strokeTransforms:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKTransformStrokesCommand *v14;
  uint64_t v15;
  NSArray *strokes;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PKTransformStrokesCommand;
  v14 = -[PKUndoCommand initWithDrawingUUID:actionName:](&v18, sel_initWithDrawingUUID_actionName_, v11, v12);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    strokes = v14->_strokes;
    v14->_strokes = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_strokeTransforms, a6);
  }

  return v14;
}

- (id)invertedInDrawing:(id)a3
{
  id v4;
  NSArray *strokeTransforms;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  PKTransformStrokesCommand *v13;
  void *v14;
  void *v15;
  void *v16;
  PKTransformStrokesCommand *v17;
  PKTransformStrokesCommand *v18;
  __int128 v19;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  strokeTransforms = self->_strokeTransforms;
  if (strokeTransforms)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](strokeTransforms, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = self->_strokeTransforms;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          memset(&v23, 0, sizeof(v23));
          if (v11)
            objc_msgSend(v11, "CGAffineTransformValue");
          else
            memset(&v22, 0, sizeof(v22));
          CGAffineTransformInvert(&v23, &v22);
          v21 = v23;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGAffineTransform:", &v21);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v8);
    }

    v13 = [PKTransformStrokesCommand alloc];
    -[PKTransformStrokesCommand strokes](self, "strokes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKUndoCommand drawingUUID](self, "drawingUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKUndoCommand actionName](self, "actionName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PKTransformStrokesCommand initWithStrokes:drawingUUID:actionName:strokeTransforms:](v13, "initWithStrokes:drawingUUID:actionName:strokeTransforms:", v14, v15, v16, v6);

  }
  else
  {
    v18 = [PKTransformStrokesCommand alloc];
    -[PKTransformStrokesCommand strokes](self, "strokes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKUndoCommand drawingUUID](self, "drawingUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKUndoCommand actionName](self, "actionName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_OWORD *)&self->_strokeTransform.c;
    *(_OWORD *)&v28.a = *(_OWORD *)&self->_strokeTransform.a;
    *(_OWORD *)&v28.c = v19;
    *(_OWORD *)&v28.tx = *(_OWORD *)&self->_strokeTransform.tx;
    CGAffineTransformInvert(&v29, &v28);
    v17 = -[PKTransformStrokesCommand initWithStrokes:drawingUUID:actionName:strokeTransform:](v18, "initWithStrokes:drawingUUID:actionName:strokeTransform:", v6, v14, v15, &v29);
  }

  return v17;
}

- (void)applyToDrawing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int128 v9;
  _OWORD v10[3];

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand drawingUUID](self, "drawingUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    if (self->_strokeTransforms)
    {
      -[PKTransformStrokesCommand strokes](self, "strokes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "transformStrokes:withTransforms:concat:", v8, self->_strokeTransforms, 1);
    }
    else
    {
      -[PKTransformStrokesCommand strokes](self, "strokes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_OWORD *)&self->_strokeTransform.c;
      v10[0] = *(_OWORD *)&self->_strokeTransform.a;
      v10[1] = v9;
      v10[2] = *(_OWORD *)&self->_strokeTransform.tx;
      objc_msgSend(v4, "transformStrokes:withTransform:concat:", v8, v10, 1);
    }

  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CGAffineTransform transform;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&self->_strokeTransform.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->_strokeTransform.a;
  *(_OWORD *)&transform.c = v6;
  *(_OWORD *)&transform.tx = *(_OWORD *)&self->_strokeTransform.tx;
  NSStringFromCGAffineTransform(&transform);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand drawingUUID](self, "drawingUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransformStrokesCommand strokes](self, "strokes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p transform=%@ drawing=%@ %@>"), v5, self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)strokes
{
  return self->_strokes;
}

- (CGAffineTransform)strokeTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].tx;
  return self;
}

- (NSArray)strokeTransforms
{
  return self->_strokeTransforms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeTransforms, 0);
  objc_storeStrong((id *)&self->_strokes, 0);
}

@end
