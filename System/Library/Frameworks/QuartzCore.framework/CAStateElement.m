@implementation CAStateElement

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
  const __CFString *v5;

  v5 = (const __CFString *)a5;
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("targetId")))
  {
    a4 = (id)objc_msgSend(a3, "objectById:", a4);
    v5 = CFSTR("target");
  }
  -[CAStateElement setValue:forKey:](self, "setValue:forKey:", a4, v5);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (CAStateElement)initWithCoder:(id)a3
{
  CAStateElement *v4;
  void *v5;
  void *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CAStateElement;
  v4 = -[CAStateElement init](&v8, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E0CB3510], "CA_supportedClasses"), CFSTR("target"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeWeak((id *)&v4->_target, v5);
    v6 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E0CB3510], "CA_supportedClasses"), CFSTR("source"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_source = (CAStateElement *)v6;
  }
  return v4;
}

+ (void)CAMLParserStartElement:(id)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(a3, "setElementValue:", v4);

}

- (BOOL)CAMLTypeSupportedForKey:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("target")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("source")) & 1) != 0)
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)CAStateElement;
  return -[NSObject CAMLTypeSupportedForKey:](&v6, sel_CAMLTypeSupportedForKey_, a3);
}

- (id)CAMLTypeForKey:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("target")) & 1) != 0)
    return CFSTR("CALayer");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("targetId")))
    return CFSTR("string");
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)CAStateElement;
  -[CAStateElement dealloc](&v3, sel_dealloc);
}

- (id)targetName
{
  return (id)objc_msgSend(objc_loadWeak((id *)&self->_target), "name");
}

- (NSString)keyPath
{
  return 0;
}

- (BOOL)matches:(id)a3
{
  return 0;
}

- (id)save
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)encodeWithCAMLWriter:(id)a3
{
  CALayer **p_target;

  p_target = &self->_target;
  if (objc_loadWeak((id *)&self->_target))
  {
    objc_msgSend(a3, "beginPropertyElement:", CFSTR("target"));
    objc_msgSend(a3, "encodeObject:", objc_loadWeak((id *)p_target));
    objc_msgSend(a3, "endElement");
  }
}

- (void)encodeWithCoder:(id)a3
{
  CALayer **p_target;
  CAStateElement *source;

  p_target = &self->_target;
  if (objc_loadWeak((id *)&self->_target))
    objc_msgSend(a3, "encodeConditionalObject:forKey:", objc_loadWeak((id *)p_target), CFSTR("target"));
  source = self->_source;
  if (source)
    objc_msgSend(a3, "encodeObject:forKey:", source, CFSTR("source"));
}

- (CALayer)target
{
  return (CALayer *)objc_loadWeak((id *)&self->_target);
}

- (CAStateElement)source
{
  return self->_source;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
