@implementation SCNActionRunBlock

- (SCNActionRunBlock)init
{
  SCNActionRunBlock *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNActionRunBlock;
  result = -[SCNAction init](&v3, sel_init);
  if (result)
  {
    result->_block = 0;
    result->_queue = 0;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNActionRunBlock;
  -[SCNAction encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
  NSLog(CFSTR("SCNAction: Run block actions can not be properly encoded, Objective-C blocks do not support NSSecureCoding."));
}

- (BOOL)isCustom
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCNActionRunBlock)initWithCoder:(id)a3
{
  SCNActionRunBlock *v3;
  SCNActionRunBlock *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNActionRunBlock;
  v3 = -[SCNAction initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    v3->_block = 0;
  NSLog(CFSTR("SCNAction: Run block actions can not be properly decoded, Objective-C blocks do not support NSSecureCoding."));
  return v4;
}

- (void)dealloc
{
  id block;
  objc_super v4;

  block = self->_block;
  if (block)
    _Block_release(block);
  v4.receiver = self;
  v4.super_class = (Class)SCNActionRunBlock;
  -[SCNAction dealloc](&v4, sel_dealloc);
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  void (**block)(id, id);
  NSObject *queue;
  SCNCAction *v9;
  _QWORD v10[6];

  if (!-[SCNAction finished](self, "finished"))
  {
    block = (void (**)(id, id))self->_block;
    if (block)
    {
      queue = self->_queue;
      if (queue)
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __46__SCNActionRunBlock_updateWithTarget_forTime___block_invoke;
        v10[3] = &unk_1EA59F420;
        v10[4] = self;
        v10[5] = a3;
        dispatch_async(queue, v10);
      }
      else
      {
        block[2](self->_block, a3);
      }
    }
    v9 = -[SCNAction caction](self, "caction");
    v9->var11 = 0;
    SCNCAction::didFinishWithTargetAtTime(v9, (SCNNode *)a3, a4);
  }
}

uint64_t __46__SCNActionRunBlock_updateWithTarget_forTime___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
}

+ (id)runBlock:(id)a3 queue:(id)a4
{
  SCNActionRunBlock *v6;

  v6 = objc_alloc_init(SCNActionRunBlock);
  v6->_block = (id)objc_msgSend(a3, "copy");
  v6->_queue = (OS_dispatch_queue *)a4;
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNActionRunBlock;
  v4 = -[SCNAction copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[2] = objc_msgSend(self->_block, "copy");
  v4[3] = self->_queue;
  return v4;
}

- (id)reversedAction
{
  return -[SCNAction copy](self, "copy");
}

@end
