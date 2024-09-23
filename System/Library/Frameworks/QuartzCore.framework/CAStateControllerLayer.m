@implementation CAStateControllerLayer

- (CAState)currentState
{
  return self->_currentState;
}

- (void)addTransition:(id)a3
{
  NSMutableArray *transitions;

  transitions = self->_transitions;
  if (!transitions)
  {
    transitions = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_transitions = transitions;
  }
  -[NSMutableArray addObject:](transitions, "addObject:", a3);
}

- (void)setCurrentState:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (CAStateControllerLayer)initWithLayer:(id)a3
{
  CAStateControllerLayer *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CAStateControllerLayer;
  v4 = -[CAStateControllerLayer init](&v6, sel_init);
  if (v4)
    v4->_layer = (CALayer *)a3;
  return v4;
}

- (void)removeTransition:(id)a3
{
  -[NSMutableArray removeObjectIdenticalTo:](self->_transitions, "removeObjectIdenticalTo:", a3);
}

- (void)invalidate
{
  NSMutableArray *transitions;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  transitions = self->_transitions;
  self->_transitions = 0;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transitions, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(transitions);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transitions, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v5);
  }

  self->_layer = 0;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[CAStateControllerLayer invalidate](self, "invalidate");

  -[NSTimer invalidate](self->_nextTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CAStateControllerLayer;
  -[CAStateControllerLayer dealloc](&v3, sel_dealloc);
}

- (CALayer)layer
{
  return self->_layer;
}

- (CAStateControllerUndo)undoStack
{
  return self->_undoStack;
}

@end
