@implementation PKUndoGroupCommand

- (PKUndoGroupCommand)initWithDrawingUUID:(id)a3 actionName:(id)a4 commands:(id)a5
{
  id v8;
  PKUndoGroupCommand *v9;
  uint64_t v10;
  NSArray *commands;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKUndoGroupCommand;
  v9 = -[PKUndoCommand initWithDrawingUUID:actionName:](&v13, sel_initWithDrawingUUID_actionName_, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    commands = v9->_commands;
    v9->_commands = (NSArray *)v10;

  }
  return v9;
}

- (id)invertedInDrawing:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  PKUndoGroupCommand *v13;
  void *v14;
  void *v15;
  PKUndoGroupCommand *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PKUndoGroupCommand commands](self, "commands", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reverseObjectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "invertedInDrawing:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v13 = [PKUndoGroupCommand alloc];
  -[PKUndoCommand drawingUUID](self, "drawingUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKUndoCommand actionName](self, "actionName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PKUndoGroupCommand initWithDrawingUUID:actionName:commands:](v13, "initWithDrawingUUID:actionName:commands:", v14, v15, v5);

  return v16;
}

- (void)applyToDrawing:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PKUndoGroupCommand commands](self, "commands", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "applyToDrawing:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSArray)commands
{
  return self->_commands;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commands, 0);
}

@end
