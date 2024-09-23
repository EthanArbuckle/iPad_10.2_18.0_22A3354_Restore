@implementation PKUndoCommand

- (PKUndoCommand)initWithDrawingUUID:(id)a3 actionName:(id)a4
{
  return -[PKUndoCommand initWithDrawingUUID:actionName:changesVisibleStrokes:](self, "initWithDrawingUUID:actionName:changesVisibleStrokes:", a3, a4, 1);
}

- (PKUndoCommand)initWithDrawingUUID:(id)a3 actionName:(id)a4 changesVisibleStrokes:(BOOL)a5
{
  id v9;
  id v10;
  PKUndoCommand *v11;
  uint64_t v12;
  NSString *actionName;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKUndoCommand;
  v11 = -[PKUndoCommand init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    actionName = v11->_actionName;
    v11->_actionName = (NSString *)v12;

    objc_storeStrong((id *)&v11->_drawingUUID, a3);
    v11->_changesVisibleStrokes = a5;
  }

  return v11;
}

- (void)registerWithUndoManager:(id)a3 target:(id)a4 selector:(SEL)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a4;
  v10 = a3;
  -[PKUndoCommand actionName](self, "actionName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActionName:", v9);

  objc_msgSend(v10, "registerUndoWithTarget:selector:object:", v8, a5, self);
}

- (id)inverted
{
  return -[PKUndoCommand invertedInDrawing:](self, "invertedInDrawing:", 0);
}

- (id)applyToDrawingReturnInverted:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PKUndoCommand invertedInDrawing:](self, "invertedInDrawing:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand applyToDrawing:](self, "applyToDrawing:", v4);

  return v5;
}

- (id)strokes
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (PKDrawingUUID)drawingUUID
{
  return self->_drawingUUID;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (void)setActionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)changesVisibleStrokes
{
  return self->_changesVisibleStrokes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_drawingUUID, 0);
}

@end
