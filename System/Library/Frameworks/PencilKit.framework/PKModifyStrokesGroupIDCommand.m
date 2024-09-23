@implementation PKModifyStrokesGroupIDCommand

+ (id)commandForModifyingStrokes:(id)a3 drawing:(id)a4 groupID:(id)a5 actionName:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  PKModifyStrokesGroupIDCommand *v15;
  void *v16;
  PKModifyStrokesGroupIDCommand *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_groupID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [PKModifyStrokesGroupIDCommand alloc];
  objc_msgSend(v10, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PKModifyStrokesGroupIDCommand initWithStrokes:drawingUUID:actionName:groupID:oldGroupID:](v15, "initWithStrokes:drawingUUID:actionName:groupID:oldGroupID:", v9, v16, v12, v11, v14);

  return v17;
}

- (PKModifyStrokesGroupIDCommand)initWithStrokes:(id)a3 drawingUUID:(id)a4 actionName:(id)a5 groupID:(id)a6 oldGroupID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PKModifyStrokesGroupIDCommand *v17;
  uint64_t v18;
  NSArray *strokes;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PKModifyStrokesGroupIDCommand;
  v17 = -[PKUndoCommand initWithDrawingUUID:actionName:changesVisibleStrokes:](&v21, sel_initWithDrawingUUID_actionName_changesVisibleStrokes_, v13, v14, 0);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    strokes = v17->_strokes;
    v17->_strokes = (NSArray *)v18;

    objc_storeStrong((id *)&v17->_groupID, a6);
    objc_storeStrong((id *)&v17->_oldGroupID, a7);
  }

  return v17;
}

- (id)invertedInDrawing:(id)a3
{
  PKModifyStrokesGroupIDCommand *v4;
  void *v5;
  void *v6;
  void *v7;
  PKModifyStrokesGroupIDCommand *v8;

  v4 = [PKModifyStrokesGroupIDCommand alloc];
  -[PKModifyStrokesGroupIDCommand strokes](self, "strokes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand drawingUUID](self, "drawingUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand actionName](self, "actionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKModifyStrokesGroupIDCommand initWithStrokes:drawingUUID:actionName:groupID:oldGroupID:](v4, "initWithStrokes:drawingUUID:actionName:groupID:oldGroupID:", v5, v6, v7, self->_oldGroupID, self->_groupID);

  return v8;
}

- (void)applyToDrawing:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand drawingUUID](self, "drawingUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
    objc_msgSend(v7, "setStrokes:groupID:", self->_strokes, self->_groupID);

}

- (id)applyToDrawingReturnInverted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSArray *strokes;
  NSUUID *groupID;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand drawingUUID](self, "drawingUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    strokes = self->_strokes;
    groupID = self->_groupID;
    -[PKUndoCommand actionName](self, "actionName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "undoableSetStrokes:groupID:actionName:", strokes, groupID, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
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
  -[PKModifyStrokesGroupIDCommand groupID](self, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKModifyStrokesGroupIDCommand oldGroupID](self, "oldGroupID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand drawingUUID](self, "drawingUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKModifyStrokesGroupIDCommand strokes](self, "strokes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p groupID=%@ (old groupID=%@) drawing=%@ %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)strokes
{
  return self->_strokes;
}

- (NSUUID)groupID
{
  return self->_groupID;
}

- (NSUUID)oldGroupID
{
  return self->_oldGroupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldGroupID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_strokes, 0);
}

@end
