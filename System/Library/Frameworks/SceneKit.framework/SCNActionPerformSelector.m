@implementation SCNActionPerformSelector

- (SCNActionPerformSelector)init
{
  SCNActionPerformSelector *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNActionPerformSelector;
  result = -[SCNAction init](&v3, sel_init);
  if (result)
  {
    result->_target = 0;
    result->_selector = 0;
  }
  return result;
}

- (SCNActionPerformSelector)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNActionPerformSelector;
  return -[SCNAction initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNActionPerformSelector;
  -[SCNAction dealloc](&v3, sel_dealloc);
}

- (BOOL)isCustom
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNActionPerformSelector;
  -[SCNAction encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  id target;
  const char *selector;

  if (!-[SCNAction finished](self, "finished", a3, a4))
  {
    -[SCNAction setFinished:](self, "setFinished:", 1);
    target = self->_target;
    if (target)
    {
      selector = self->_selector;
      if (selector)
        objc_msgSend(target, selector);
    }
  }
}

+ (id)performSelector:(SEL)a3 onTarget:(id)a4
{
  SCNActionPerformSelector *v4;

  v4 = 0;
  if (a3 && a4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = objc_alloc_init(SCNActionPerformSelector);
      v4->_selector = a3;
      v4->_target = a4;
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNActionPerformSelector;
  v4 = -[SCNAction copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[2] = self->_selector;
  v4[3] = self->_target;
  return v4;
}

- (id)reversedAction
{
  return -[SCNAction copy](self, "copy");
}

@end
