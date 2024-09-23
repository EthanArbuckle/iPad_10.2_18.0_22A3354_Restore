@implementation PKModifyStrokesCommand

+ (id)commandForMakingStrokeVisible:(id)a3 drawing:(id)a4 hiding:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  PKModifyStrokesCommand *v11;
  void *v12;
  void *v13;
  PKModifyStrokesCommand *v14;
  _QWORD v16[2];

  v5 = a5;
  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _PencilKitBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Stroke"), CFSTR("Stroke"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [PKModifyStrokesCommand alloc];
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKModifyStrokesCommand initWithStrokes:drawingUUID:actionName:hiding:](v11, "initWithStrokes:drawingUUID:actionName:hiding:", v12, v13, v10, v5);

  return v14;
}

+ (id)commandForMakingStrokesVisible:(id)a3 drawing:(id)a4 hiding:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  PKModifyStrokesCommand *v11;
  void *v12;
  PKModifyStrokesCommand *v13;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  _PencilKitBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Added strokes"), CFSTR("Added strokes"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [PKModifyStrokesCommand alloc];
  objc_msgSend(v8, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PKModifyStrokesCommand initWithStrokes:drawingUUID:actionName:hiding:](v11, "initWithStrokes:drawingUUID:actionName:hiding:", v7, v12, v10, v5);

  return v13;
}

+ (id)commandForErasingAllStrokesInDrawing:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  PKModifyStrokesCommand *v6;
  void *v7;
  void *v8;
  PKModifyStrokesCommand *v9;

  v3 = a3;
  _PencilKitBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Erase All"), CFSTR("Erase All"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [PKModifyStrokesCommand alloc];
  objc_msgSend(v3, "strokes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKModifyStrokesCommand initWithStrokes:drawingUUID:actionName:hiding:](v6, "initWithStrokes:drawingUUID:actionName:hiding:", v7, v8, v5, 1);

  return v9;
}

+ (id)commandForErasingStrokes:(id)a3 drawing:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  PKModifyStrokesCommand *v9;
  void *v10;
  PKModifyStrokesCommand *v11;

  v5 = a3;
  v6 = a4;
  _PencilKitBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Erase"), CFSTR("Erase"), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [PKModifyStrokesCommand alloc];
  objc_msgSend(v6, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKModifyStrokesCommand initWithStrokes:drawingUUID:actionName:hiding:](v9, "initWithStrokes:drawingUUID:actionName:hiding:", v5, v10, v8, 1);

  return v11;
}

- (PKModifyStrokesCommand)initWithStrokes:(id)a3 drawingUUID:(id)a4 actionName:(id)a5 hiding:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  PKModifyStrokesCommand *v13;
  uint64_t v14;
  NSArray *strokes;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKModifyStrokesCommand;
  v13 = -[PKUndoCommand initWithDrawingUUID:actionName:](&v17, sel_initWithDrawingUUID_actionName_, v11, v12);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    strokes = v13->_strokes;
    v13->_strokes = (NSArray *)v14;

    v13->_hide = a6;
  }

  return v13;
}

- (id)invertedInDrawing:(id)a3
{
  _BOOL4 v4;
  PKModifyStrokesCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  PKModifyStrokesCommand *v9;

  v4 = -[PKModifyStrokesCommand hide](self, "hide", a3);
  v5 = [PKModifyStrokesCommand alloc];
  -[PKModifyStrokesCommand strokes](self, "strokes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand drawingUUID](self, "drawingUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand actionName](self, "actionName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKModifyStrokesCommand initWithStrokes:drawingUUID:actionName:hiding:](v5, "initWithStrokes:drawingUUID:actionName:hiding:", v6, v7, v8, !v4);

  return v9;
}

- (void)applyToDrawing:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand drawingUUID](self, "drawingUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    -[PKModifyStrokesCommand strokes](self, "strokes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStrokes:hidden:", v7, -[PKModifyStrokesCommand hide](self, "hide"));

  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKModifyStrokesCommand hide](self, "hide");
  -[PKUndoCommand drawingUUID](self, "drawingUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKModifyStrokesCommand strokes](self, "strokes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p hide=%d drawing=%@ %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)strokes
{
  return self->_strokes;
}

- (BOOL)hide
{
  return self->_hide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokes, 0);
}

@end
