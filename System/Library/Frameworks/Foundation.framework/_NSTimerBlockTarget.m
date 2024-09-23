@implementation _NSTimerBlockTarget

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  _Block_release(self->_block);
  v3.receiver = self;
  v3.super_class = (Class)_NSTimerBlockTarget;
  -[_NSTimerBlockTarget dealloc](&v3, sel_dealloc);
}

- (void)fire:(id)a3
{
  (*((void (**)(void))self->_block + 2))();
}

@end
