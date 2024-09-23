@implementation ICDrawing

- (ICDrawing)init
{
  -[ICDrawing doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICDrawing)initWithReplicaID:(id)a3
{
  id v5;
  ICDrawing *v6;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *commands;
  ICTTVectorMultiTimestamp *v9;
  ICTTVectorMultiTimestamp *timestamp;
  uint64_t v11;
  NSDate *orientationTimestamp;
  CGPoint v13;
  CGSize v14;
  CGFloat v15;
  CGFloat v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICDrawing;
  v6 = -[ICDrawing init](&v18, sel_init);
  if (v6)
  {
    v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    commands = v6->_commands;
    v6->_commands = v7;

    objc_storeStrong((id *)&v6->_replicaUUID, a3);
    v9 = -[ICTTVectorMultiTimestamp initWithCapacity:]([ICTTVectorMultiTimestamp alloc], "initWithCapacity:", 2);
    timestamp = v6->_timestamp;
    v6->_timestamp = v9;

    v6->_orientation = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v11 = objc_claimAutoreleasedReturnValue();
    orientationTimestamp = v6->_orientationTimestamp;
    v6->_orientationTimestamp = (NSDate *)v11;

    v13 = (CGPoint)*MEMORY[0x1E0C9D628];
    v14 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v6->_unrotatedBoundsInCommandSpace.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v6->_unrotatedBoundsInCommandSpace.size = v14;
    v6->_commandBounds.origin = v13;
    v6->_commandBounds.size = v14;
    +[ICDrawing defaultSize](ICDrawing, "defaultSize");
    v6->_unrotatedSize.width = v15;
    v6->_unrotatedSize.height = v16;
  }

  return v6;
}

- (ICDrawing)initWithDrawing:(id)a3
{
  id v4;
  ICDrawing *v5;
  void *v6;
  uint64_t v7;
  NSMutableOrderedSet *commands;
  uint64_t v9;
  NSUUID *replicaUUID;
  void *v11;
  uint64_t v12;
  ICTTVectorMultiTimestamp *timestamp;
  uint64_t v14;
  NSDate *orientationTimestamp;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ICDrawing;
  v5 = -[ICDrawing init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "commands");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");
    commands = v5->_commands;
    v5->_commands = (NSMutableOrderedSet *)v7;

    objc_msgSend(v4, "replicaUUID");
    v9 = objc_claimAutoreleasedReturnValue();
    replicaUUID = v5->_replicaUUID;
    v5->_replicaUUID = (NSUUID *)v9;

    objc_msgSend(v4, "timestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    timestamp = v5->_timestamp;
    v5->_timestamp = (ICTTVectorMultiTimestamp *)v12;

    v5->_orientation = objc_msgSend(v4, "orientation");
    objc_msgSend(v4, "orientationTimestamp");
    v14 = objc_claimAutoreleasedReturnValue();
    orientationTimestamp = v5->_orientationTimestamp;
    v5->_orientationTimestamp = (NSDate *)v14;

    objc_msgSend(v4, "unrotatedBoundsInCommandSpace");
    v5->_unrotatedBoundsInCommandSpace.origin.x = v16;
    v5->_unrotatedBoundsInCommandSpace.origin.y = v17;
    v5->_unrotatedBoundsInCommandSpace.size.width = v18;
    v5->_unrotatedBoundsInCommandSpace.size.height = v19;
    objc_msgSend(v4, "commandBounds");
    v5->_commandBounds.origin.x = v20;
    v5->_commandBounds.origin.y = v21;
    v5->_commandBounds.size.width = v22;
    v5->_commandBounds.size.height = v23;
    objc_msgSend(v4, "unrotatedSize");
    v5->_unrotatedSize.width = v24;
    v5->_unrotatedSize.height = v25;
  }

  return v5;
}

- (ICDrawing)initWithCommands:(id)a3 fromDrawing:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ICDrawing *v9;
  uint64_t v10;
  NSMutableOrderedSet *commands;
  void *v12;
  uint64_t v13;
  ICTTVectorMultiTimestamp *timestamp;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "replicaUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICDrawing initWithReplicaID:](self, "initWithReplicaID:", v8);

  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    commands = v9->_commands;
    v9->_commands = (NSMutableOrderedSet *)v10;

    objc_msgSend(v7, "timestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    timestamp = v9->_timestamp;
    v9->_timestamp = (ICTTVectorMultiTimestamp *)v13;

    v9->_orientation = objc_msgSend(v7, "orientation");
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ICDrawing initWithDrawing:](+[ICDrawing allocWithZone:](ICDrawing, "allocWithZone:", a3), "initWithDrawing:", self);
}

- (id)mutableCommands
{
  return self->_commands;
}

- (NSOrderedSet)visibleCommands
{
  NSMutableOrderedSet *visibleCommands;
  void *v4;
  void *v5;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *v7;
  void *v8;
  NSMutableOrderedSet *v9;
  NSMutableOrderedSet *v10;

  visibleCommands = self->_visibleCommands;
  if (!visibleCommands)
  {
    -[NSMutableOrderedSet indexesOfObjectsPassingTest:](self->_commands, "indexesOfObjectsPassingTest:", &__block_literal_global_28);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[ICDrawing commands](self, "commands");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (NSMutableOrderedSet *)objc_msgSend(v5, "mutableCopy");
      v7 = self->_visibleCommands;
      self->_visibleCommands = v6;

      -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_visibleCommands, "removeObjectsAtIndexes:", v4);
    }
    else
    {
      -[ICDrawing commands](self, "commands");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (NSMutableOrderedSet *)objc_msgSend(v8, "mutableCopy");
      v10 = self->_visibleCommands;
      self->_visibleCommands = v9;

    }
    visibleCommands = self->_visibleCommands;
  }
  return (NSOrderedSet *)visibleCommands;
}

uint64_t __28__ICDrawing_visibleCommands__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hidden");
}

- (CGRect)calculateCommandBounds
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  _BOOL4 IsNull;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v36;
  CGRect v37;

  v30 = *MEMORY[0x1E0C80C00];
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[ICDrawing visibleCommands](self, "visibleCommands", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v10), "data");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bounds");
        v36.origin.x = v12;
        v36.origin.y = v13;
        v36.size.width = v14;
        v36.size.height = v15;
        v31.origin.x = x;
        v31.origin.y = y;
        v31.size.width = width;
        v31.size.height = height;
        v32 = CGRectUnion(v31, v36);
        x = v32.origin.x;
        y = v32.origin.y;
        width = v32.size.width;
        height = v32.size.height;

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  IsNull = CGRectIsNull(v33);
  -[ICDrawing unrotatedSize](self, "unrotatedSize");
  v19 = v18;
  if (IsNull)
  {
    -[ICDrawing unrotatedSize](self, "unrotatedSize");
    v20 = v19 * 0.5;
    v22 = v21 * 0.5;
    v23 = 0;
    v24 = 0;
  }
  else
  {
    v37.size.height = v17;
    v37.origin.x = 0.0;
    v37.origin.y = 0.0;
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    v37.size.width = v19;
    *(CGRect *)&v20 = CGRectIntersection(v34, v37);
  }
  return CGRectIntegral(*(CGRect *)&v20);
}

- (CGRect)commandBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (CGRectIsNull(self->_commandBounds))
  {
    -[ICDrawing calculateCommandBounds](self, "calculateCommandBounds");
    self->_commandBounds.origin.x = x;
    self->_commandBounds.origin.y = y;
    self->_commandBounds.size.width = width;
    self->_commandBounds.size.height = height;
  }
  else
  {
    x = self->_commandBounds.origin.x;
    y = self->_commandBounds.origin.y;
    width = self->_commandBounds.size.width;
    height = self->_commandBounds.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)bounds
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  CGAffineTransform v11;
  CGRect v12;
  CGRect v13;

  -[ICDrawing unrotatedBoundsInCommandSpace](self, "unrotatedBoundsInCommandSpace");
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  if (CGRectIsNull(v12))
  {
    -[ICDrawing commandBounds](self, "commandBounds");
    x = v7;
    y = v8;
    width = v9;
    height = v10;
  }
  -[ICDrawing orientationTransform](self, "orientationTransform");
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  return CGRectApplyAffineTransform(v13, &v11);
}

- (void)invalidateBounds
{
  CGSize v2;

  v2 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_commandBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_commandBounds.size = v2;
}

- (void)takeOrientationFrom:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *orientationTimestamp;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    self->_orientation = objc_msgSend(v4, "orientation");
    objc_msgSend(v7, "orientationTimestamp");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    orientationTimestamp = self->_orientationTimestamp;
    self->_orientationTimestamp = v5;

    v4 = v7;
  }

}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  id v4;

  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICDrawing setOrientationTimestamp:](self, "setOrientationTimestamp:");

  }
}

- (BOOL)canChangeTransientOrientation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[ICDrawing commands](self, "commands");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[ICDrawing orientationTimestamp](self, "orientationTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToDate:", v6);

  }
  return v4;
}

- (BOOL)setTransientOrientation:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[ICDrawing canChangeTransientOrientation](self, "canChangeTransientOrientation");
  if (v5)
    self->_orientation = a3;
  return v5;
}

+ (void)sortCommands:(id)a3
{
  objc_msgSend(a3, "sortWithOptions:usingComparator:", 1, &__block_literal_global_5);
}

uint64_t __26__ICDrawing_sortCommands___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  uint64_t v21;
  int v22;
  void *v23;
  unsigned int v24;
  unsigned int v25;
  void *v26;
  unsigned int v27;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "commandID");
  }
  else
  {
    v25 = 0;
    v26 = 0;
    v27 = 0;
  }
  objc_msgSend(v5, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "commandID");
    v10 = v21;
    v11 = v25;
    if (v25 < v21)
      goto LABEL_16;
  }
  else
  {
    v10 = 0;
    v21 = 0;
    v23 = 0;
    v24 = 0;
    v11 = v25;
  }
  if (v11 != v10)
    goto LABEL_13;
  v12 = objc_msgSend(v26, "TTCompare:", v23);
  if (v12 == -1)
  {
LABEL_16:

    goto LABEL_17;
  }
  if (v12)
  {
LABEL_13:

  }
  else
  {

    if (v27 < v24)
    {
LABEL_17:
      v15 = -1;
      goto LABEL_27;
    }
  }
  objc_msgSend(v4, "data", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "commandID");
  }
  else
  {
    v25 = 0;
    v26 = 0;
    v27 = 0;
  }
  objc_msgSend(v5, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "commandID");
    v18 = v22;
  }
  else
  {
    v18 = 0;
    v23 = 0;
    v24 = 0;
  }
  if (v25 == v18 && v27 == v24)
    v19 = objc_msgSend(v26, "isEqual:", v23);
  else
    v19 = 0;

  v15 = v19 ^ 1u;
LABEL_27:

  return v15;
}

- (void)sortCommands
{
  +[ICDrawing sortCommands:](ICDrawing, "sortCommands:", self->_commands);
}

- (ICDrawingCommandID)commandIDForNewCommand
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  NSUUID *v15;
  NSUUID *replicaUUID;
  int v17;
  NSUUID *v18;
  NSUUID *v19;
  ICDrawingCommandID *result;
  uint64_t v21;
  id v22;
  uint64_t v23;

  -[ICDrawing timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDrawing replicaUUID](self, "replicaUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clockElementForUUID:atIndex:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  retstr->clock = objc_msgSend(v7, "clock");
  -[ICDrawing replicaUUID](self, "replicaUUID");
  retstr->replicaUUID = (NSUUID *)objc_claimAutoreleasedReturnValue();
  retstr->subclock = objc_msgSend(v7, "subclock") + 1;
  -[ICDrawing commands](self, "commands");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[ICDrawing commands](self, "commands");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "commandID");
    }
    else
    {
      v21 = 0;
      v22 = 0;
      v23 = 0;
    }

    if (ICDrawingCommandID::operator<=((uint64_t)retstr, (uint64_t)&v21))
    {
      v14 = v21;
      -[ICDrawing replicaUUID](self, "replicaUUID");
      v15 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      retstr->clock = v14;
      replicaUUID = retstr->replicaUUID;
      retstr->replicaUUID = v15;

      retstr->subclock = 0;
      if (ICDrawingCommandID::operator<=((uint64_t)retstr, (uint64_t)&v21))
      {
        v17 = v21;
        -[ICDrawing replicaUUID](self, "replicaUUID");
        v18 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        retstr->clock = v17 + 1;
        v19 = retstr->replicaUUID;
        retstr->replicaUUID = v18;

        retstr->subclock = 0;
      }
    }

  }
  return result;
}

- (id)insertNewTestCommand
{
  ICDrawingCommandData *v3;
  void *v4;

  v3 = objc_alloc_init(ICDrawingCommandData);
  -[ICDrawingCommandData setType:](v3, "setType:", 0);
  -[ICDrawing setCommandIDForInsertion:](self, "setCommandIDForInsertion:", v3);
  -[ICDrawing visibleCommandForInsertingCommand:](self, "visibleCommandForInsertingCommand:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDrawing addNewCommand:](self, "addNewCommand:", v4);

  return v4;
}

- (void)setCommandIDForInsertion:(id)a3
{
  id v4;
  id v5;
  int v6;
  id v7;
  int v8;
  int v9;
  id v10;
  int v11;

  v4 = a3;
  -[ICDrawing commandIDForNewCommand](self, "commandIDForNewCommand");
  v6 = v9;
  v5 = v10;
  v7 = v5;
  v8 = v11;
  if (v4)
    objc_msgSend(v4, "setCommandID:", &v6);
  else

}

- (id)visibleCommandForInsertingCommand:(id)a3
{
  id v4;
  ICDrawingCommand *v5;
  void *v6;

  v4 = a3;
  v5 = [ICDrawingCommand alloc];
  -[ICDrawing replicaUUID](self, "replicaUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v5 = -[ICDrawingCommand initWithCommand:hidden:timestamp:](v5, "initWithCommand:hidden:timestamp:", v4, 0, v6, 0);
  else

  return v5;
}

- (void)addNewCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  void *v21;

  v4 = a3;
  -[ICDrawing orientationTimestamp](self, "orientationTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToDate:", v6);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDrawing setOrientationTimestamp:](self, "setOrientationTimestamp:", v8);

  }
  -[NSMutableOrderedSet addObject:](self->_commands, "addObject:", v4);
  if (self->_visibleCommands && (objc_msgSend(v4, "hidden") & 1) == 0)
    -[NSMutableOrderedSet addObject:](self->_visibleCommands, "addObject:", v4);
  -[ICDrawing timestamp](self, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "commandID");
    v12 = v20;
  }
  else
  {
    v12 = 0;
    v21 = 0;
  }
  objc_msgSend(v4, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "commandID");
    v15 = v19;
  }
  else
  {
    v15 = 0;
    v17 = 0;
    v18 = 0;
  }
  -[ICDrawing replicaUUID](self, "replicaUUID", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClock:subclock:forUUID:atIndex:", v12, v15, v16, 0);

  -[ICDrawing invalidateBounds](self, "invalidateBounds");
}

- (id)setCommand:(id)a3 hidden:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  ICDrawingCommand *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  NSMutableOrderedSet *visibleCommands;
  ICDrawingCommand *v26;
  void *v27;
  id v28;
  void *v29;
  ICDrawingCommand *v30;

  v4 = a4;
  v6 = a3;
  -[ICDrawing commands](self, "commands");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICDrawing setCommand:hidden:].cold.1(v9);

    v10 = (ICDrawingCommand *)v6;
    goto LABEL_12;
  }
  -[ICDrawing commands](self, "commands");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "hidden") == v4)
  {
    v10 = v12;
LABEL_12:
    v12 = v10;
    v30 = v10;
    goto LABEL_15;
  }
  -[ICDrawing timestamp](self, "timestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDrawing replicaUUID](self, "replicaUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clockElementForUUID:atIndex:", v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v12, "timestamp");
  v18 = v17;
  -[ICDrawing replicaUUID](self, "replicaUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v15, "clock");
  -[ICDrawing timestamp](self, "timestamp");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDrawing replicaUUID](self, "replicaUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 <= v20)
    v23 = v20;
  else
    v23 = v18;
  v24 = v23 + 1;
  objc_msgSend(v21, "setClock:forUUID:atIndex:", v24, v22, 1);

  visibleCommands = self->_visibleCommands;
  self->_visibleCommands = 0;

  v26 = [ICDrawingCommand alloc];
  objc_msgSend(v12, "data");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v19;
  v29 = v28;
  if (v26)
  {
    v30 = -[ICDrawingCommand initWithCommand:hidden:timestamp:](v26, "initWithCommand:hidden:timestamp:", v27, v4, v28, v24);
  }
  else
  {

    v30 = 0;
  }

  -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self->_commands, "replaceObjectAtIndex:withObject:", v8, v30);
LABEL_15:

  return v30;
}

- (unint64_t)mergeWithDrawing:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSDate *v7;
  NSDate *orientationTimestamp;
  int64_t orientation;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _BOOL4 IsNull;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  uint64_t v36;
  NSMutableOrderedSet *commands;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  unsigned int v42;
  void *v43;
  unsigned int v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  NSMutableOrderedSet *visibleCommands;
  id v51;
  id obj;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v58 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  objc_msgSend(v51, "orientationTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDrawing orientationTimestamp](self, "orientationTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  if (v6 == -1
    || (objc_msgSend(v51, "orientationTimestamp"),
        v7 = (NSDate *)objc_claimAutoreleasedReturnValue(),
        orientationTimestamp = self->_orientationTimestamp,
        self->_orientationTimestamp = v7,
        orientationTimestamp,
        orientation = self->_orientation,
        orientation == objc_msgSend(v51, "orientation")))
  {
    v10 = 1;
  }
  else
  {
    self->_orientation = objc_msgSend(v51, "orientation");
    v10 = 2;
  }
  -[ICDrawing timestamp](self, "timestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "timestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "compareTo:", v12);

  if ((v13 & 1) != 0)
  {
    objc_msgSend(v51, "unrotatedBoundsInCommandSpace");
    if (!CGRectIsNull(v59))
    {
      -[ICDrawing unrotatedBoundsInCommandSpace](self, "unrotatedBoundsInCommandSpace");
      IsNull = CGRectIsNull(v60);
      v15 = v13 == 1 || IsNull;
      if (v15 == 1)
      {
        objc_msgSend(v51, "unrotatedBoundsInCommandSpace");
      }
      else
      {
        -[ICDrawing unrotatedBoundsInCommandSpace](self, "unrotatedBoundsInCommandSpace");
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;
        objc_msgSend(v51, "unrotatedBoundsInCommandSpace");
        v62.origin.x = v28;
        v62.origin.y = v29;
        v62.size.width = v30;
        v62.size.height = v31;
        v61.origin.x = v21;
        v61.origin.y = v23;
        v61.size.width = v25;
        v61.size.height = v27;
        *(CGRect *)&v16 = CGRectUnion(v61, v62);
      }
      -[ICDrawing setUnrotatedBoundsInCommandSpace:](self, "setUnrotatedBoundsInCommandSpace:", v16, v17, v18, v19);
    }
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(v51, "commands");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v54 != v33)
            objc_enumerationMutation(obj);
          v35 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          v36 = -[NSMutableOrderedSet indexOfObject:](self->_commands, "indexOfObject:", v35);
          commands = self->_commands;
          if (v36 == 0x7FFFFFFFFFFFFFFFLL)
          {
            -[NSMutableOrderedSet addObject:](commands, "addObject:", v35);
            continue;
          }
          -[NSMutableOrderedSet objectAtIndex:](commands, "objectAtIndex:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v38)
          {
            v40 = (void *)objc_msgSend(v38, "timestamp");
            v42 = v41;
            v43 = (void *)objc_msgSend(v35, "timestamp");
            v45 = v43;
            if (v42 >= v44)
            {
              if (v42 != v44)
              {

                goto LABEL_28;
              }
              v46 = objc_msgSend(v40, "TTCompare:", v43) == -1;

              if (!v46)
                goto LABEL_28;
            }
            else
            {

            }
            -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self->_commands, "replaceObjectAtIndex:withObject:", v36, v35);
          }
LABEL_28:

        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      }
      while (v32);
    }

    -[ICDrawing sortCommands](self, "sortCommands");
    -[ICDrawing timestamp](self, "timestamp");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "timestamp");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mergeWithTimestamp:", v48);

    -[ICDrawing invalidateBounds](self, "invalidateBounds");
    visibleCommands = self->_visibleCommands;
    self->_visibleCommands = 0;

    v10 = 2;
  }

  return v10;
}

- (CGSize)fullSize
{
  double v3;
  double v4;
  CGSize result;

  -[ICDrawing unrotatedSize](self, "unrotatedSize");
  +[ICDrawing fullSize:forOrientation:](ICDrawing, "fullSize:forOrientation:", self->_orientation);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)fullSize:(CGSize)result forOrientation:(int64_t)a4
{
  double height;
  double v5;

  if ((unint64_t)a4 >= 2)
    height = result.height;
  else
    height = result.width;
  if ((unint64_t)a4 >= 2)
    result.height = result.width;
  v5 = height;
  result.width = v5;
  return result;
}

- (CGRect)fullBounds
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  CGAffineTransform v7;
  CGRect v8;

  -[ICDrawing unrotatedSize](self, "unrotatedSize");
  v4 = v3;
  -[ICDrawing unrotatedSize](self, "unrotatedSize");
  v6 = v5;
  -[ICDrawing orientationTransform](self, "orientationTransform");
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = v4;
  v8.size.height = v6;
  return CGRectApplyAffineTransform(v8, &v7);
}

+ (CGAffineTransform)defaultSizeOrientationTransform:(SEL)a3
{
  +[ICDrawing defaultSize](ICDrawing, "defaultSize");
  +[ICDrawing fullSize:forOrientation:](ICDrawing, "fullSize:forOrientation:", a4);
  return +[ICDrawing orientationTransform:size:](ICDrawing, "orientationTransform:size:", a4);
}

- (CGAffineTransform)orientationTransform
{
  int64_t orientation;

  orientation = self->_orientation;
  -[ICDrawing fullSize](self, "fullSize");
  return +[ICDrawing orientationTransform:size:](ICDrawing, "orientationTransform:size:", orientation);
}

+ (CGAffineTransform)orientationTransform:(SEL)a3 size:(int64_t)a4
{
  uint64_t v5;
  __int128 v6;

  v5 = MEMORY[0x1E0C9BAA8];
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  switch(a4)
  {
    case 3:
      *(_OWORD *)&retstr->a = xmmword_1BDC15C10;
      *(_OWORD *)&retstr->c = xmmword_1BDC15C00;
      retstr->tx = a5.width;
      retstr->ty = 0.0;
      break;
    case 2:
      *(_OWORD *)&retstr->a = xmmword_1BDC15BF0;
      retstr->d = 0.0;
      retstr->tx = 0.0;
      retstr->c = 1.0;
      retstr->ty = a5.height;
      break;
    case 1:
      retstr->a = -1.0;
      retstr->b = 0.0;
      retstr->c = 0.0;
      retstr->d = -1.0;
      *(CGSize *)&retstr->tx = a5;
      break;
  }
  return result;
}

- (int64_t)imageOrientation
{
  int64_t result;

  result = -[ICDrawing orientation](self, "orientation");
  if ((unint64_t)(result - 1) >= 3)
    return 0;
  return result;
}

+ (CGSize)defaultPixelSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0D641E0], "notesDeviceDrawingSize");
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 1024.0;
  v3 = 768.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSUUID)replicaUUID
{
  return self->_replicaUUID;
}

- (ICTTVectorMultiTimestamp)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSOrderedSet)commands
{
  return &self->_commands->super;
}

- (CGSize)unrotatedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_unrotatedSize.width;
  height = self->_unrotatedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setUnrotatedSize:(CGSize)a3
{
  self->_unrotatedSize = a3;
}

- (NSDate)orientationTimestamp
{
  return self->_orientationTimestamp;
}

- (void)setOrientationTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_orientationTimestamp, a3);
}

- (CGRect)unrotatedBoundsInCommandSpace
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_unrotatedBoundsInCommandSpace.origin.x;
  y = self->_unrotatedBoundsInCommandSpace.origin.y;
  width = self->_unrotatedBoundsInCommandSpace.size.width;
  height = self->_unrotatedBoundsInCommandSpace.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setUnrotatedBoundsInCommandSpace:(CGRect)a3
{
  self->_unrotatedBoundsInCommandSpace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientationTimestamp, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_replicaUUID, 0);
  objc_storeStrong((id *)&self->_visibleCommands, 0);
  objc_storeStrong((id *)&self->_commands, 0);
}

- (ICDrawing)initWithData:(id)a3 replicaID:(id)a4
{
  return -[ICDrawing initWithData:version:replicaID:](self, "initWithData:version:replicaID:", a3, 1, a4);
}

- (ICDrawing)initWithData:(id)a3 version:(unsigned int)a4 replicaID:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  char *v11;
  int v12;
  ICDrawing *v13;
  ICDrawing *v14;
  NSObject *v15;
  _BYTE v17[96];

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  if (!v8)
  {
    v13 = -[ICDrawing initWithReplicaID:](self, "initWithReplicaID:", v9);
    goto LABEL_5;
  }
  drawing::Drawing::Drawing((drawing::Drawing *)v17);
  v10 = objc_retainAutorelease(v8);
  v11 = (char *)objc_msgSend(v10, "bytes");
  v12 = ICTTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v10, "length"));
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v17, v11, v12))
  {
    v13 = -[ICDrawing initWithArchive:version:replicaID:](self, "initWithArchive:version:replicaID:", v17, v6, v9);
    drawing::Drawing::~Drawing((drawing::Drawing *)v17);
LABEL_5:
    self = v13;
    v14 = self;
    goto LABEL_9;
  }
  v15 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[ICDrawing(ICDrawingPersistenceAdditions) initWithData:version:replicaID:].cold.1(v15);

  drawing::Drawing::~Drawing((drawing::Drawing *)v17);
  v14 = 0;
LABEL_9:

  return v14;
}

- (ICDrawing)initWithArchive:(const void *)a3 version:(unsigned int)a4 replicaID:(id)a5
{
  uint64_t v5;
  id v8;
  int *v9;
  ICDrawing *v10;
  ICTTVectorMultiTimestamp *v11;
  ICTTVectorMultiTimestamp *v12;
  uint64_t v13;
  ICTTVectorMultiTimestamp *v14;
  void *v15;
  void *v16;
  drawing::Drawing *v17;
  int v18;
  int i;
  ICDrawingCommand *v20;
  void *v21;
  int v22;
  void *v23;
  const drawing::Rectangle *v24;
  NSObject *v25;
  ICDrawing *v26;
  _BYTE v28[40];
  float v29;
  float v30;
  float v31;
  float v32;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = (int *)((char *)a3 + 48);
  if ((*((_BYTE *)a3 + 32) & 1) != 0 && *((_DWORD *)a3 + 12) == 6)
  {
    v10 = -[ICDrawing initWithReplicaID:](self, "initWithReplicaID:", v8);
    if (v10)
    {
      v11 = [ICTTVectorMultiTimestamp alloc];
      v12 = v11;
      v13 = *((_QWORD *)a3 + 5);
      if (!v13)
        v13 = *(_QWORD *)(drawing::Drawing::default_instance((drawing::Drawing *)v11) + 40);
      v14 = -[ICTTVectorMultiTimestamp initWithArchive:andCapacity:](v12, "initWithArchive:andCapacity:", v13, 2);
      -[ICDrawing setTimestamp:](v10, "setTimestamp:", v14);

      -[ICDrawing timestamp](v10, "timestamp");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sortedUUIDs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = *((_DWORD *)a3 + 16);
      if (v18)
      {
        for (i = 0; i != v18; ++i)
        {
          v20 = -[ICDrawingCommand initWithArchive:version:sortedUUIDs:]([ICDrawingCommand alloc], "initWithArchive:version:sortedUUIDs:", google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<drawing::Command>::TypeHandler>((uint64_t)a3 + 56, i), v5, v16);
          if (v20)
          {
            -[ICDrawing mutableCommands](v10, "mutableCommands");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v20);

          }
        }
      }
      v22 = *((_DWORD *)a3 + 8);
      if ((~v22 & 0x18) == 0)
      {
        -[ICDrawing setOrientation:](v10, "setOrientation:", *((unsigned int *)a3 + 13));
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *((double *)a3 + 10));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDrawing setOrientationTimestamp:](v10, "setOrientationTimestamp:", v23);

        v22 = *((_DWORD *)a3 + 8);
      }
      if ((v22 & 0x20) != 0)
      {
        v24 = (const drawing::Rectangle *)*((_QWORD *)a3 + 11);
        if (!v24)
          v24 = *(const drawing::Rectangle **)(drawing::Drawing::default_instance(v17) + 88);
        drawing::Rectangle::Rectangle((drawing::Rectangle *)v28, v24);
        -[ICDrawing setUnrotatedBoundsInCommandSpace:](v10, "setUnrotatedBoundsInCommandSpace:", v29, v30, v31, v32);
        drawing::Rectangle::~Rectangle((drawing::Rectangle *)v28);
      }

    }
  }
  else
  {
    v25 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[ICDrawing(ICDrawingPersistenceAdditions) initWithArchive:version:replicaID:].cold.1(v9, v25);

    v10 = -[ICDrawing initWithReplicaID:](self, "initWithReplicaID:", v8);
  }
  v26 = v10;

  return v26;
}

- (unsigned)saveToArchive:(void *)a3 withPathData:(BOOL)a4
{
  _BOOL8 v4;
  _DWORD *v7;
  void *v8;
  topotext::VectorTimestamp *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t i;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  drawing::Command *v22;
  uint64_t v23;
  int32x2_t v24;
  unsigned int v25;
  void *v26;
  BOOL v27;
  int v28;
  void *v29;
  uint64_t v30;
  double x;
  double y;
  double width;
  double height;
  uint64_t v35;
  float v36;
  int v37;
  float v38;
  float v39;
  float v40;
  ICDrawing *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;
  CGRect v49;

  v4 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v7 = (char *)a3 + 32;
  *((_DWORD *)a3 + 8) |= 1u;
  *((_DWORD *)a3 + 12) = 6;
  -[ICDrawing timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *v7 |= 2u;
  v9 = (topotext::VectorTimestamp *)*((_QWORD *)a3 + 5);
  if (!v9)
  {
    v9 = (topotext::VectorTimestamp *)operator new();
    topotext::VectorTimestamp::VectorTimestamp(v9);
    *((_QWORD *)a3 + 5) = v9;
  }
  objc_msgSend(v8, "saveToArchive:", v9);

  -[ICDrawing timestamp](self, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedUUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDrawing commands](self, "commands");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a3 + 14, objc_msgSend(v12, "count"));

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[ICDrawing commands](self, "commands");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  v42 = self;
  if (v14)
  {
    v15 = *(_QWORD *)v44;
    v16 = 1;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v44 != v15)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v19 = *((_DWORD *)a3 + 17);
        v20 = *((int *)a3 + 16);
        if ((int)v20 >= v19)
        {
          if (v19 == *((_DWORD *)a3 + 18))
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a3 + 14, v19 + 1);
          v22 = google::protobuf::internal::GenericTypeHandler<drawing::Command>::New();
          v23 = *((_QWORD *)a3 + 7);
          v24 = *(int32x2_t *)((char *)a3 + 64);
          *((int32x2_t *)a3 + 8) = vadd_s32(v24, (int32x2_t)0x100000001);
          *(_QWORD *)(v23 + 8 * v24.i32[0]) = v22;
        }
        else
        {
          v21 = *((_QWORD *)a3 + 7);
          *((_DWORD *)a3 + 16) = v20 + 1;
          v22 = *(drawing::Command **)(v21 + 8 * v20);
        }
        v25 = objc_msgSend(v18, "saveToArchive:sortedUUIDs:withPathData:", v22, v11, v4);
        if (v16 <= v25)
          v16 = v25;
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v14);
  }
  else
  {
    v16 = 1;
  }

  -[ICDrawing orientationTimestamp](v42, "orientationTimestamp");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26 == 0;

  if (!v27)
  {
    v28 = -[ICDrawing orientation](v42, "orientation");
    *((_DWORD *)a3 + 8) |= 8u;
    *((_DWORD *)a3 + 13) = v28;
    -[ICDrawing orientationTimestamp](v42, "orientationTimestamp");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "timeIntervalSinceReferenceDate");
    *((_DWORD *)a3 + 8) |= 0x10u;
    *((_QWORD *)a3 + 10) = v30;

  }
  -[ICDrawing unrotatedBoundsInCommandSpace](v42, "unrotatedBoundsInCommandSpace");
  x = v49.origin.x;
  y = v49.origin.y;
  width = v49.size.width;
  height = v49.size.height;
  if (!CGRectIsNull(v49))
  {
    *((_DWORD *)a3 + 8) |= 0x20u;
    v35 = *((_QWORD *)a3 + 11);
    if (!v35)
    {
      v35 = operator new();
      drawing::Rectangle::Rectangle((drawing::Rectangle *)v35);
      *((_QWORD *)a3 + 11) = v35;
    }
    v36 = x;
    v37 = *(_DWORD *)(v35 + 32);
    v38 = y;
    *(float *)(v35 + 40) = v36;
    *(float *)(v35 + 44) = v38;
    v39 = width;
    v40 = height;
    *(_DWORD *)(v35 + 32) = v37 | 0xF;
    *(float *)(v35 + 48) = v39;
    *(float *)(v35 + 52) = v40;
  }

  return v16;
}

- (id)serializeWithPathData:(BOOL)a3
{
  int v4;

  v4 = 0;
  -[ICDrawing serializeWithPathData:toVersion:](self, "serializeWithPathData:toVersion:", a3, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)serializeWithPathData:(BOOL)a3 toVersion:(unsigned int *)a4
{
  id v4;
  void *v5;
  int v6;
  _BYTE v8[96];

  *a4 = -[ICDrawing saveToArchive:withPathData:](self, "saveToArchive:withPathData:", v8, a3, drawing::Drawing::Drawing((drawing::Drawing *)v8));
  v4 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (int)drawing::Drawing::ByteSize((drawing::Drawing *)v8)));
  v5 = (void *)objc_msgSend(v4, "mutableBytes");
  v6 = ICTTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v4, "length"));
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v8, v5, v6);
  drawing::Drawing::~Drawing((drawing::Drawing *)v8);
  return v4;
}

- (void)setCommand:(os_log_t)log hidden:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Attempting to toggle visibility of a command not in drawing.", v1, 2u);
}

@end
