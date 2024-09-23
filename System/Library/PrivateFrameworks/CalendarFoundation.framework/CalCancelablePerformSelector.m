@implementation CalCancelablePerformSelector

- (CalCancelablePerformSelector)initWithBlock:(id)a3
{
  id v5;
  CalCancelablePerformSelector *v6;
  CalCancelablePerformSelector *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalCancelablePerformSelector.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

  }
  v10.receiver = self;
  v10.super_class = (Class)CalCancelablePerformSelector;
  v6 = -[CalCancelablePerformSelector init](&v10, sel_init);
  v7 = v6;
  if (v6)
    -[CalCancelablePerformSelector setBlock:](v6, "setBlock:", v5);

  return v7;
}

- (void)performAfterDelay:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalCancelablePerformSelector setRunloop:](self, "setRunloop:", v5);

  -[CalCancelablePerformSelector block](self, "block");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x19400A168]();
  -[CalCancelablePerformSelector performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__performBlock_, v6, a3);

}

- (void)cancel
{
  OUTLINED_FUNCTION_0_5(&dword_18FC12000, a1, a3, "[CalCancelablePerformSelector cancel] called after block was already canceled", a5, a6, a7, a8, 0);
}

- (void)_performBlock:(id)a3
{
  (*((void (**)(id, CalCancelablePerformSelector *))a3 + 2))(a3, self);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSRunLoop)runloop
{
  return self->_runloop;
}

- (void)setRunloop:(id)a3
{
  objc_storeStrong((id *)&self->_runloop, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runloop, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
