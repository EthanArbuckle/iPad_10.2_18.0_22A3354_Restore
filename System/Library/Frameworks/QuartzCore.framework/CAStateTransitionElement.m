@implementation CAStateTransitionElement

- (CAStateTransitionElement)initWithCoder:(id)a3
{
  CAStateTransitionElement *v4;
  void *v5;
  void *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CAStateTransitionElement;
  v4 = -[CAStateTransitionElement init](&v8, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E0CB3510], "CA_supportedClasses"), CFSTR("target"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeWeak((id *)&v4->_target, v5);
    v6 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E0CB3510], "CA_supportedClasses"), CFSTR("animation"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_animation = (CAAnimation *)v6;
    v4->_key = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key")), "copy");
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("enabled")))
      v4->_enabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("enabled"));
    else
      v4->_enabled = 1;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
  const __CFString *v5;

  v5 = (const __CFString *)a5;
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("targetId")))
  {
    a4 = (id)objc_msgSend(a3, "objectById:", a4);
    v5 = CFSTR("target");
  }
  -[CAStateTransitionElement setValue:forKey:](self, "setValue:forKey:", a4, v5);
}

- (CAAnimation)animation
{
  return self->_animation;
}

- (NSString)key
{
  return self->_key;
}

- (CALayer)target
{
  return (CALayer *)objc_loadWeak((id *)&self->_target);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setAnimation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (id)CAMLTypeForKey:(id)a3
{
  void *v4;

  v4 = (void *)-[CAStateTransitionElement CAMLTypeForKey:]::dict;
  if (!-[CAStateTransitionElement CAMLTypeForKey:]::dict)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("CALayer"), CFSTR("target"), CFSTR("string"), CFSTR("targetId"), CFSTR("CAAnimation"), CFSTR("animation"), CFSTR("string"), CFSTR("key"), CFSTR("BOOL"), CFSTR("enabled"), 0);
    -[CAStateTransitionElement CAMLTypeForKey:]::dict = (uint64_t)v4;
  }
  return (id)objc_msgSend(v4, "objectForKey:", a3);
}

+ (void)CAMLParserStartElement:(id)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(a3, "setElementValue:", v4);

}

- (CAStateTransitionElement)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  self->_enabled = 1;
  v3.receiver = self;
  v3.super_class = (Class)CAStateTransitionElement;
  return -[CAStateTransitionElement init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)CAStateTransitionElement;
  -[CAStateTransitionElement dealloc](&v3, sel_dealloc);
}

- (double)beginTime
{
  CAAnimation *animation;
  double result;

  animation = self->_animation;
  if (!animation)
    return 0.0;
  -[CAAnimation beginTime](animation, "beginTime");
  return result;
}

- (void)setBeginTime:(double)a3
{
  -[CAAnimation setBeginTime:](self->_animation, "setBeginTime:", a3);
}

- (double)duration
{
  CAAnimation *animation;
  double result;

  animation = self->_animation;
  if (!animation)
    return 0.0;
  -[CAAnimation duration](animation, "duration");
  return result;
}

- (void)setDuration:(double)a3
{
  -[CAAnimation setDuration:](self->_animation, "setDuration:", a3);
}

- (void)encodeWithCAMLWriter:(id)a3
{
  NSString *key;

  if (!self->_enabled)
    objc_msgSend(a3, "setElementAttribute:forKey:", CFSTR("false"), CFSTR("enabled"));
  key = self->_key;
  if (key)
    objc_msgSend(a3, "setElementAttribute:forKey:", key, CFSTR("key"));
  if (objc_loadWeak((id *)&self->_target))
  {
    objc_msgSend(a3, "beginPropertyElement:", CFSTR("target"));
    objc_msgSend(a3, "encodeObject:", objc_loadWeak((id *)&self->_target));
    objc_msgSend(a3, "endElement");
  }
  if (self->_animation)
  {
    objc_msgSend(a3, "beginPropertyElement:", CFSTR("animation"));
    objc_msgSend(a3, "encodeObject:", self->_animation);
    objc_msgSend(a3, "endElement");
  }
}

- (void)encodeWithCoder:(id)a3
{
  CALayer **p_target;
  CAAnimation *animation;
  NSString *key;

  p_target = &self->_target;
  if (objc_loadWeak((id *)&self->_target))
    objc_msgSend(a3, "encodeConditionalObject:forKey:", objc_loadWeak((id *)p_target), CFSTR("target"));
  animation = self->_animation;
  if (animation)
    objc_msgSend(a3, "encodeObject:forKey:", animation, CFSTR("animation"));
  key = self->_key;
  if (key)
    objc_msgSend(a3, "encodeObject:forKey:", key, CFSTR("key"));
  if (!self->_enabled)
    objc_msgSend(a3, "encodeBool:forKey:", 0, CFSTR("enabled"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  CAStateTransitionElement *v4;

  v4 = objc_alloc_init(CAStateTransitionElement);
  -[CAStateTransitionElement setEnabled:](v4, "setEnabled:", self->_enabled);
  -[CAStateTransitionElement setTarget:](v4, "setTarget:", objc_loadWeak((id *)&self->_target));
  -[CAStateTransitionElement setAnimation:](v4, "setAnimation:", self->_animation);
  -[CAStateTransitionElement setKey:](v4, "setKey:", self->_key);
  return v4;
}

- (id)debugDescription
{
  void *v3;
  CALayer **p_target;
  uint64_t v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  p_target = &self->_target;
  objc_loadWeak((id *)&self->_target);
  v5 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<CAStateTransitionElement target=<%@: %p> key=%@ %@>"), v5, objc_loadWeak((id *)p_target), self->_key, self->_animation);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
}

@end
