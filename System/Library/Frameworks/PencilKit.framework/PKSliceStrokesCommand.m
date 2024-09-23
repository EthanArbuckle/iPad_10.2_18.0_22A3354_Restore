@implementation PKSliceStrokesCommand

- (PKSliceStrokesCommand)initWithDrawingUUID:(id)a3 actionName:(id)a4 substrokes:(id)a5 strokesHidden:(id)a6 hiding:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  PKSliceStrokesCommand *v16;
  uint64_t v17;
  NSDictionary *substrokes;
  objc_super v20;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKSliceStrokesCommand;
  v16 = -[PKModifyStrokesCommand initWithStrokes:drawingUUID:actionName:hiding:](&v20, sel_initWithStrokes_drawingUUID_actionName_hiding_, v15, v12, v13, v7);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    substrokes = v16->_substrokes;
    v16->_substrokes = (NSDictionary *)v17;

  }
  return v16;
}

- (id)invertedInDrawing:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  PKSliceStrokesCommand *v11;
  void *v12;
  void *v13;
  void *v14;
  PKSliceStrokesCommand *v15;
  id v17;
  _QWORD v18[5];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v17, "_rootStrokes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
        v18[0] = v8;
        v18[1] = 3221225472;
        v18[2] = __43__PKSliceStrokesCommand_invertedInDrawing___block_invoke;
        v18[3] = &unk_1E777B020;
        v18[4] = self;
        v19 = v4;
        objc_msgSend(v10, "_visitVisibleSubstrokes:inDrawing:", v18, v17);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  v11 = [PKSliceStrokesCommand alloc];
  -[PKUndoCommand drawingUUID](self, "drawingUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand actionName](self, "actionName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKModifyStrokesCommand strokes](self, "strokes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PKSliceStrokesCommand initWithDrawingUUID:actionName:substrokes:strokesHidden:hiding:](v11, "initWithDrawingUUID:actionName:substrokes:strokesHidden:hiding:", v12, v13, v4, v14, -[PKModifyStrokesCommand hide](self, "hide") ^ 1);

  return v15;
}

uint64_t __43__PKSliceStrokesCommand_invertedInDrawing___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a2;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(v5, "_strokeUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "_substrokes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v5, "_strokeUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

    v12 = objc_msgSend(*(id *)(a1 + 40), "count");
    if (v12 == objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count"))
      *a3 = 1;
  }

  return 1;
}

- (void)applyToDrawing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSliceStrokesCommand;
  -[PKModifyStrokesCommand applyToDrawing:](&v9, sel_applyToDrawing_, v4);
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand drawingUUID](self, "drawingUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    -[PKSliceStrokesCommand substrokes](self, "substrokes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStrokeSubstrokes:", v8);

  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand drawingUUID](self, "drawingUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSliceStrokesCommand substrokes](self, "substrokes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKModifyStrokesCommand hide](self, "hide");
  -[PKModifyStrokesCommand strokes](self, "strokes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p drawing=%@ %@ hide=%d %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSDictionary)substrokes
{
  return self->_substrokes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substrokes, 0);
}

@end
