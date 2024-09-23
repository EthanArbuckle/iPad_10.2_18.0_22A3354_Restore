@implementation CAStateControllerUndo

- (void)addElement:(id)a3
{
  NSMutableArray *elements;

  elements = self->_elements;
  if (!elements)
  {
    elements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_elements = elements;
  }
  -[NSMutableArray addObject:](elements, "addObject:", a3);
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
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

- (NSMutableArray)elements
{
  return self->_elements;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)CAStateControllerUndo;
  -[CAStateControllerUndo dealloc](&v3, sel_dealloc);
}

- (CAStateControllerUndo)next
{
  return self->_next;
}

- (CAState)state
{
  return self->_state;
}

- (void)setElements:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSMutableArray)transitions
{
  return self->_transitions;
}

- (void)setTransitions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
