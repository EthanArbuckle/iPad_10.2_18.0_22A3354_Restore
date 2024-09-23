@implementation PKModifyStrokeInkCommand

+ (id)commandForModifyingStrokes:(id)a3 drawing:(id)a4 inks:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  PKModifyStrokeInkCommand *v19;
  void *v20;
  PKModifyStrokeInkCommand *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v15), "ink", (_QWORD)v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  _PencilKitBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Modify Stroke Ink"), CFSTR("Modify Stroke Ink"), CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = [PKModifyStrokeInkCommand alloc];
  objc_msgSend(v8, "uuid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PKModifyStrokeInkCommand initWithStrokes:drawingUUID:actionName:inks:oldInks:](v19, "initWithStrokes:drawingUUID:actionName:inks:oldInks:", v11, v20, v18, v9, v10);

  return v21;
}

- (PKModifyStrokeInkCommand)initWithStrokes:(id)a3 drawingUUID:(id)a4 actionName:(id)a5 inks:(id)a6 oldInks:(id)a7
{
  id v12;
  id v13;
  id v14;
  PKModifyStrokeInkCommand *v15;
  uint64_t v16;
  NSArray *strokes;
  uint64_t v18;
  NSArray *inks;
  uint64_t v20;
  NSArray *oldInks;
  objc_super v23;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PKModifyStrokeInkCommand;
  v15 = -[PKUndoCommand initWithDrawingUUID:actionName:](&v23, sel_initWithDrawingUUID_actionName_, a4, a5);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    strokes = v15->_strokes;
    v15->_strokes = (NSArray *)v16;

    v18 = objc_msgSend(v13, "copy");
    inks = v15->_inks;
    v15->_inks = (NSArray *)v18;

    v20 = objc_msgSend(v14, "copy");
    oldInks = v15->_oldInks;
    v15->_oldInks = (NSArray *)v20;

  }
  return v15;
}

- (id)invertedInDrawing:(id)a3
{
  PKModifyStrokeInkCommand *v4;
  void *v5;
  void *v6;
  void *v7;
  PKModifyStrokeInkCommand *v8;

  v4 = [PKModifyStrokeInkCommand alloc];
  -[PKModifyStrokeInkCommand strokes](self, "strokes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand drawingUUID](self, "drawingUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand actionName](self, "actionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKModifyStrokeInkCommand initWithStrokes:drawingUUID:actionName:inks:oldInks:](v4, "initWithStrokes:drawingUUID:actionName:inks:oldInks:", v5, v6, v7, self->_oldInks, self->_inks);

  return v8;
}

- (void)applyToDrawing:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSArray *strokes;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand drawingUUID](self, "drawingUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    strokes = self->_strokes;
    -[PKModifyStrokeInkCommand inks](self, "inks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStrokes:inks:", strokes, v8);

  }
}

- (id)applyToDrawingReturnInverted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSArray *strokes;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand drawingUUID](self, "drawingUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    strokes = self->_strokes;
    -[PKModifyStrokeInkCommand inks](self, "inks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "undoableSetStrokes:inks:", strokes, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKModifyStrokeInkCommand inks](self, "inks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand drawingUUID](self, "drawingUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKModifyStrokeInkCommand strokes](self, "strokes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p ink=%@ drawing=%@ %@>"), v5, self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)strokes
{
  return self->_strokes;
}

- (NSArray)inks
{
  return self->_inks;
}

- (NSArray)oldInks
{
  return self->_oldInks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldInks, 0);
  objc_storeStrong((id *)&self->_inks, 0);
  objc_storeStrong((id *)&self->_strokes, 0);
}

@end
