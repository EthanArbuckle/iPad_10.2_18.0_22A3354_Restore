@implementation CAStateRemoveElement

- (BOOL)matches:(id)a3
{
  id v5;

  v5 = (id)objc_msgSend(a3, "target");
  if (v5 == objc_loadWeak((id *)&self->super._target))
    return objc_msgSend((id)objc_msgSend(a3, "keyPath"), "isEqualToString:", self->_keyPath);
  else
    return 0;
}

- (void)apply:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CAStateAddElement *v10;
  id v11;
  id Weak;
  id v13;
  id v14;

  if (self->_object)
  {
    if (self->_keyPath)
    {
      v5 = (void *)objc_msgSend(objc_loadWeak((id *)&self->super._target), "valueForKeyPath:", self->_keyPath);
      if (v5)
      {
        v6 = v5;
        v7 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", self->_object);
        if (v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v8 = v7;
          if (a3)
          {
            if (v7 >= objc_msgSend(v6, "count") - 1)
              v9 = 0;
            else
              v9 = objc_msgSend(v6, "objectAtIndex:", v8 + 1);
            v10 = objc_alloc_init(CAStateAddElement);
            -[CAStateElement setTarget:](v10, "setTarget:", objc_loadWeak((id *)&self->super._target));
            -[CAStateAddElement setKeyPath:](v10, "setKeyPath:", self->_keyPath);
            -[CAStateAddElement setObject:](v10, "setObject:", objc_msgSend(v6, "objectAtIndex:", v8));
            -[CAStateAddElement setBeforeObject:](v10, "setBeforeObject:", v9);
            -[CAStateElement setSource:](v10, "setSource:", self);
            objc_msgSend(a3, "addElement:", v10);

          }
          v11 = (id)objc_msgSend(v6, "mutableCopy");
          if (!v11)
            v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v14 = v11;
          objc_msgSend(v11, "removeObjectAtIndex:", v8);
          Weak = objc_loadWeak((id *)&self->super._target);
          if (objc_msgSend(v14, "count"))
            v13 = v14;
          else
            v13 = 0;
          objc_msgSend(Weak, "setValue:forKeyPath:", v13, self->_keyPath);

        }
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  CAStateRemoveElement *v4;

  v4 = objc_alloc_init(CAStateRemoveElement);
  -[CAStateRemoveElement setKeyPath:](v4, "setKeyPath:", self->_keyPath);
  -[CAStateRemoveElement setObject:](v4, "setObject:", self->_object);
  -[CAStateElement setTarget:](v4, "setTarget:", -[CAStateElement target](self, "target"));
  return v4;
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
  const __CFString *v5;
  objc_super v9;
  uint64_t v10;

  v5 = (const __CFString *)a5;
  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("objectId")))
  {
    a4 = (id)objc_msgSend(a3, "objectById:", a4);
    v5 = CFSTR("object");
  }
  v9.receiver = self;
  v9.super_class = (Class)CAStateRemoveElement;
  -[CAStateElement CAMLParser:setValue:forKey:](&v9, sel_CAMLParser_setValue_forKey_, a3, a4, v5);
}

- (void)encodeWithCAMLWriter:(id)a3
{
  NSString *keyPath;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CAStateRemoveElement;
  -[CAStateElement encodeWithCAMLWriter:](&v6, sel_encodeWithCAMLWriter_);
  keyPath = self->_keyPath;
  if (keyPath)
    objc_msgSend(a3, "setElementAttribute:forKey:", keyPath, CFSTR("keyPath"));
  if (self->_object)
  {
    objc_msgSend(a3, "beginPropertyElement:", CFSTR("object"));
    objc_msgSend(a3, "encodeObject:", self->_object);
    objc_msgSend(a3, "endElement");
  }
}

- (id)CAMLTypeForKey:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("keyPath")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("objectId")) & 1) != 0)
  {
    return CFSTR("string");
  }
  v6.receiver = self;
  v6.super_class = (Class)CAStateRemoveElement;
  return -[CAStateElement CAMLTypeForKey:](&v6, sel_CAMLTypeForKey_, a3);
}

- (BOOL)CAMLTypeSupportedForKey:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("object")) & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)CAStateRemoveElement;
  return -[CAStateElement CAMLTypeSupportedForKey:](&v6, sel_CAMLTypeSupportedForKey_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)CAStateRemoveElement;
  -[CAStateElement encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_keyPath, CFSTR("keyPath"));
  objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", self->_object, CFSTR("object"), 0);
}

- (CAStateRemoveElement)initWithCoder:(id)a3
{
  CAStateRemoveElement *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CAStateRemoveElement;
  v4 = -[CAStateElement initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_keyPath = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyPath")), "copy");
    v4->_object = (id)objc_msgSend(a3, "CA_decodeObjectForKey:", CFSTR("object"));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)CAStateRemoveElement;
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
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("{%@:%p %@:%p %@ %@}"), v4, self, v5, objc_loadWeak((id *)&self->super._target), self->_keyPath, self->_object);
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
