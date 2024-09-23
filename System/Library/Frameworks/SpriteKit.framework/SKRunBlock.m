@implementation SKRunBlock

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKRunBlock)init
{
  SKRunBlock *v2;
  SKRunBlock *v3;
  id block;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKRunBlock;
  v2 = -[SKAction init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    block = v2->_block;
    v2->_block = 0;

    queue = v3->_queue;
    v3->_queue = 0;

  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKRunBlock;
  -[SKAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  NSLog(CFSTR("SKAction: Run block actions can not be properly encoded, Objective-C blocks do not support NSSecureCoding."));

}

- (SKRunBlock)initWithCoder:(id)a3
{
  id v4;
  SKRunBlock *v5;
  SKRunBlock *v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKRunBlock;
  v5 = -[SKAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    block = v5->_block;
    v5->_block = 0;

  }
  NSLog(CFSTR("SKAction: Run block actions can not be properly decoded, Objective-C blocks do not support NSSecureCoding."));

  return v6;
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  void (**block)(_QWORD);
  NSObject *queue;
  SKCAction *v8;
  id v9;

  v9 = a3;
  if (!-[SKAction finished](self, "finished"))
  {
    block = (void (**)(_QWORD))self->_block;
    if (block)
    {
      queue = self->_queue;
      if (queue)
        dispatch_async(queue, block);
      else
        ((void (**)(id))block)[2](self->_block);
    }
    v8 = -[SKAction caction](self, "caction");
    v8->var12 = 0;
    SKCAction::didFinishWithTargetAtTime(v8, (SKCNode *)objc_msgSend(v9, "_backingNode"), a4);
  }

}

+ (id)runBlock:(id)a3 queue:(id)a4
{
  id v5;
  OS_dispatch_queue *v6;
  SKRunBlock *v7;
  uint64_t v8;
  id block;
  OS_dispatch_queue *queue;

  v5 = a3;
  v6 = (OS_dispatch_queue *)a4;
  v7 = objc_alloc_init(SKRunBlock);
  v8 = objc_msgSend(v5, "copy");
  block = v7->_block;
  v7->_block = (id)v8;

  queue = v7->_queue;
  v7->_queue = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  +[SKRunBlock runBlock:queue:](SKRunBlock, "runBlock:queue:", self->_block, self->_queue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)reversedAction
{
  return -[SKAction copy](self, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
