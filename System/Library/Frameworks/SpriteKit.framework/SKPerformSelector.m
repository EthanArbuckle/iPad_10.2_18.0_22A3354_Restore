@implementation SKPerformSelector

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKPerformSelector)init
{
  SKPerformSelector *v2;
  SKPerformSelector *v3;
  NSObject *strongTarget;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKPerformSelector;
  v2 = -[SKAction init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeWeak((id *)&v2->_weakTarget, 0);
    strongTarget = v3->_strongTarget;
    v3->_strongTarget = 0;

    v3->_selector = 0;
  }
  return v3;
}

- (void)dealloc
{
  NSObject *strongTarget;
  objc_super v4;

  objc_storeWeak((id *)&self->_weakTarget, 0);
  strongTarget = self->_strongTarget;
  self->_strongTarget = 0;

  self->_selector = 0;
  v4.receiver = self;
  v4.super_class = (Class)SKPerformSelector;
  -[SKAction dealloc](&v4, sel_dealloc);
}

- (SKPerformSelector)initWithCoder:(id)a3
{
  id v4;
  SKPerformSelector *v5;
  NSString *v6;
  uint64_t v7;
  NSObject *strongTarget;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKPerformSelector;
  v5 = -[SKAction initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    if (!SKGetLinkedOnOrAfter())
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_target"));
      v7 = objc_claimAutoreleasedReturnValue();
      strongTarget = v5->_strongTarget;
      v5->_strongTarget = v7;

      objc_storeWeak((id *)&v5->_weakTarget, v5->_strongTarget);
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_selector"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5->_selector = NSSelectorFromString(v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  id WeakRetained;
  objc_super v8;
  objc_super v9;

  v4 = a3;
  {
    -[SKPerformSelector encodeWithCoder:]::sdk_version = dyld_get_program_sdk_version();
  }
  if (-[SKPerformSelector encodeWithCoder:]::sdk_version < 0xC0000)
  {
    v8.receiver = self;
    v8.super_class = (Class)SKPerformSelector;
    -[SKAction encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_weakTarget);
    objc_msgSend(v4, "encodeObject:forKey:", WeakRetained, CFSTR("_target"));

    NSStringFromSelector(self->_selector);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_selector"));
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SKPerformSelector;
    -[SKAction encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
    NSStringFromSelector(self->_selector);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_selector"));
  }

}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  const char *selector;
  NSObject *strongTarget;
  id WeakRetained;

  if (!-[SKAction finished](self, "finished", a3, a4))
  {
    -[SKAction setFinished:](self, "setFinished:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_weakTarget);
    if (WeakRetained)
    {
      selector = self->_selector;
      if (selector)
        objc_msgSend(WeakRetained, selector);
    }
    strongTarget = self->_strongTarget;
    self->_strongTarget = 0;

  }
}

+ (id)perfromSelector:(SEL)a3 onTarget:(id)a4
{
  id v6;
  void *v7;
  SKPerformSelector *v8;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (a3 && v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = objc_alloc_init(SKPerformSelector);
      v8->_selector = a3;
      objc_storeStrong((id *)&v8->_strongTarget, a4);
      objc_storeWeak((id *)&v8->_weakTarget, v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKPerformSelector;
  v4 = -[SKAction copyWithZone:](&v7, sel_copyWithZone_, a3);
  *((_QWORD *)v4 + 2) = self->_selector;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakTarget);
  objc_storeWeak((id *)v4 + 3, WeakRetained);

  return v4;
}

- (id)reversedAction
{
  return -[SKAction copy](self, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongTarget, 0);
  objc_destroyWeak((id *)&self->_weakTarget);
}

@end
