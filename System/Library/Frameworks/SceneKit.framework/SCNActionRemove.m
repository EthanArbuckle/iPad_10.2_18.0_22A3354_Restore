@implementation SCNActionRemove

- (SCNActionRemove)init
{
  SCNActionRemove *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNActionRemove;
  result = -[SCNAction init](&v3, sel_init);
  if (result)
    result->_hasFired = 0;
  return result;
}

- (SCNActionRemove)initWithCoder:(id)a3
{
  SCNActionRemove *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNActionRemove;
  v4 = -[SCNAction initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
    v4->_hasFired = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hasFired")), "BOOLValue");
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNActionRemove;
  -[SCNAction encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasFired), CFSTR("_hasFired"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)removeFromParentNode
{
  return objc_alloc_init(SCNActionRemove);
}

- (void)willStartWithTarget:(id)a3 atTime:(double)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNActionRemove;
  -[SCNAction willStartWithTarget:atTime:](&v5, sel_willStartWithTarget_atTime_, a3, a4);
  self->_hasFired = 0;
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  id v5;
  id v6;

  if (!self->_hasFired)
  {
    -[SCNAction setFinished:](self, "setFinished:", 1, a4);
    v5 = a3;
    objc_msgSend(a3, "removeFromParentNode");
    v6 = a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return +[SCNActionRemove removeFromParentNode](SCNActionRemove, "removeFromParentNode", a3);
}

- (id)reversedAction
{
  return -[SCNAction copy](self, "copy");
}

@end
