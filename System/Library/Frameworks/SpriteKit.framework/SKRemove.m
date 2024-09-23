@implementation SKRemove

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKRemove)init
{
  SKRemove *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKRemove;
  result = -[SKAction init](&v3, sel_init);
  if (result)
    result->_hasFired = 0;
  return result;
}

- (SKRemove)initWithCoder:(id)a3
{
  id v4;
  SKRemove *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKRemove;
  v5 = -[SKAction initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hasFired"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasFired = objc_msgSend(v6, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKRemove;
  -[SKAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasFired);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_hasFired"));

}

+ (id)removeFromParent
{
  return objc_alloc_init(SKRemove);
}

- (void)willStartWithTarget:(id)a3 atTime:(double)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKRemove;
  -[SKAction willStartWithTarget:atTime:](&v5, sel_willStartWithTarget_atTime_, a3, a4);
  self->_hasFired = 0;
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  id v5;

  v5 = a3;
  if (!self->_hasFired)
  {
    -[SKAction setFinished:](self, "setFinished:", 1);
    objc_msgSend(v5, "removeFromParent");
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  +[SKRemove removeFromParent](SKRemove, "removeFromParent", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)reversedAction
{
  return -[SKAction copy](self, "copy");
}

@end
