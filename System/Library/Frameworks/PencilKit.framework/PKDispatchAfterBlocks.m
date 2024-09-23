@implementation PKDispatchAfterBlocks

- (PKDispatchAfterBlocks)initWithIdentifier:(id)a3
{
  id v4;
  PKDispatchAfterBlocks *v5;
  PKDispatchAfterBlocks *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKDispatchAfterBlocks;
  v5 = -[PKDispatchAfterBlocks init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PKDispatchAfterBlocks setIdentifier:](v5, "setIdentifier:", v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKDispatchAfterBlocks;
  -[PKDispatchAfterBlocks dealloc](&v3, sel_dealloc);
}

- (void)dispatchAfter:(double)a3 withBlock:(id)a4
{
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(a4, "copy");
  v6 = _Block_copy(v7);
  -[PKDispatchAfterBlocks performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_performBlock_, v6, a3);

}

- (void)performBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)cancelAll
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
