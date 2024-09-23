@implementation CAStateAddAnimation

- (id)keyPath
{
  NSString *key;

  key = self->_key;
  if (key)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("animations.%@"), key);
  else
    return 0;
}

- (BOOL)matches:(id)a3
{
  id v5;

  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (v5 = (id)objc_msgSend(a3, "target"), v5 == objc_loadWeak((id *)&self->super._target)))
  {
    return objc_msgSend((id)objc_msgSend(a3, "key"), "isEqualToString:", self->_key);
  }
  else
  {
    return 0;
  }
}

- (void)apply:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  CAStateAddAnimation *v7;
  uint64_t v8;
  CAAnimation *animation;
  void *v10;

  if (self->_animation && self->_key)
  {
    if (a3)
    {
      v5 = objc_msgSend(objc_loadWeak((id *)&self->super._target), "animationForKey:", self->_key);
      if (v5)
      {
        v6 = v5;
        v7 = objc_alloc_init(CAStateAddAnimation);
        -[CAStateAddAnimation setKey:](v7, "setKey:", self->_key);
        -[CAStateAddAnimation setAnimation:](v7, "setAnimation:", v6);
      }
      else
      {
        v7 = objc_alloc_init(CAStateRemoveAnimation);
        -[CAStateAddAnimation setKey:](v7, "setKey:", self->_key);
      }
      -[CAStateElement setTarget:](v7, "setTarget:", objc_loadWeak((id *)&self->super._target));
      -[CAStateElement setSource:](v7, "setSource:", self);
      objc_msgSend(a3, "addElement:", v7);

    }
    objc_msgSend(objc_loadWeak((id *)&self->super._target), "addAnimation:forKey:", self->_animation, self->_key);
    v8 = objc_msgSend(objc_loadWeak((id *)&self->super._target), "animationForKey:", self->_key);
    animation = self->_animation;
    if ((CAAnimation *)v8 != animation)
    {
      v10 = (void *)v8;

      self->_animation = (CAAnimation *)v10;
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  CAStateAddAnimation *v4;

  v4 = objc_alloc_init(CAStateAddAnimation);
  v4->_key = self->_key;
  v4->_animation = self->_animation;
  -[CAStateElement setTarget:](v4, "setTarget:", objc_loadWeak((id *)&self->super._target));
  return v4;
}

- (void)encodeWithCAMLWriter:(id)a3
{
  NSString *key;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CAStateAddAnimation;
  -[CAStateElement encodeWithCAMLWriter:](&v6, sel_encodeWithCAMLWriter_);
  key = self->_key;
  if (key)
    objc_msgSend(a3, "setElementAttribute:forKey:", key, CFSTR("key"));
  if (self->_animation)
  {
    objc_msgSend(a3, "beginPropertyElement:", CFSTR("animation"));
    objc_msgSend(a3, "encodeObject:", self->_animation);
    objc_msgSend(a3, "endElement");
  }
}

- (id)CAMLTypeForKey:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("key")) & 1) != 0)
    return CFSTR("string");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("animation")) & 1) != 0)
    return CFSTR("CAAnimation");
  v6.receiver = self;
  v6.super_class = (Class)CAStateAddAnimation;
  return -[CAStateElement CAMLTypeForKey:](&v6, sel_CAMLTypeForKey_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)CAStateAddAnimation;
  -[CAStateElement encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_key, CFSTR("key"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_animation, CFSTR("animation"));
}

- (CAStateAddAnimation)initWithCoder:(id)a3
{
  CAStateAddAnimation *v4;
  void *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CAStateAddAnimation;
  v4 = -[CAStateElement initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v4->_key = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key")), "copy");
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E0CB3510], "CA_supportedClasses"), CFSTR("animation"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_animation = (CAAnimation *)v5;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)CAStateAddAnimation;
  -[CAStateElement dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_loadWeak((id *)&self->super._target);
  v5 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("{%@:%p %@:%p %@ %@}"), v4, self, v5, objc_loadWeak((id *)&self->super._target), self->_key, self->_animation);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CAAnimation)animation
{
  return self->_animation;
}

- (void)setAnimation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
