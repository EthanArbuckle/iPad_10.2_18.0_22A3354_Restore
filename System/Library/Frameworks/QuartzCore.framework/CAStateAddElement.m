@implementation CAStateAddElement

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
  id v5;
  uint64_t v6;
  CAStateRemoveElement *v7;
  uint64_t v8;
  id v9;

  if (self->_object && self->_keyPath)
  {
    v5 = (id)objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)&self->super._target), "valueForKeyPath:", self->_keyPath), "mutableCopy");
    if (!v5)
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = v5;
    if (-[NSString isEqualToString:](self->_keyPath, "isEqualToString:", CFSTR("sublayers")))
    {
      v6 = objc_msgSend(v9, "indexOfObjectIdenticalTo:", self->_object);
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v9, "removeObjectAtIndex:", v6);
    }
    if (a3)
    {
      v7 = objc_alloc_init(CAStateRemoveElement);
      -[CAStateElement setTarget:](v7, "setTarget:", objc_loadWeak((id *)&self->super._target));
      -[CAStateRemoveElement setKeyPath:](v7, "setKeyPath:", self->_keyPath);
      -[CAStateRemoveElement setObject:](v7, "setObject:", self->_object);
      -[CAStateElement setSource:](v7, "setSource:", self);
      objc_msgSend(a3, "addElement:", v7);

      if (-[NSString isEqualToString:](self->_keyPath, "isEqualToString:", CFSTR("sublayers")))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(a3, "willAddLayer:", self->_object);
      }
    }
    if (!self->_beforeObject || (v8 = objc_msgSend(v9, "indexOfObjectIdenticalTo:"), v8 == 0x7FFFFFFFFFFFFFFFLL))
      v8 = objc_msgSend(v9, "count");
    objc_msgSend(v9, "insertObject:atIndex:", self->_object, v8);
    objc_msgSend(objc_loadWeak((id *)&self->super._target), "setValue:forKeyPath:", v9, self->_keyPath);

  }
}

- (void)foreachLayer:(id)a3
{
  if (-[NSString isEqualToString:](self->_keyPath, "isEqualToString:", CFSTR("sublayers")))
    (*((void (**)(id, id))a3 + 2))(a3, self->_object);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CAStateAddElement *v4;

  v4 = objc_alloc_init(CAStateAddElement);
  -[CAStateAddElement setKeyPath:](v4, "setKeyPath:", self->_keyPath);
  -[CAStateAddElement setObject:](v4, "setObject:", self->_object);
  -[CAStateAddElement setBeforeObject:](v4, "setBeforeObject:", self->_beforeObject);
  -[CAStateElement setTarget:](v4, "setTarget:", -[CAStateElement target](self, "target"));
  return v4;
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
  __CFString *v5;
  objc_super v9;
  uint64_t v10;

  v5 = (__CFString *)a5;
  v10 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a5, "isEqualToString:", CFSTR("objectId")) & 1) != 0)
  {
    v5 = CFSTR("object");
LABEL_5:
    a4 = (id)objc_msgSend(a3, "objectById:", a4);
    goto LABEL_6;
  }
  if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("beforeObjectId")))
  {
    v5 = CFSTR("beforeObject");
    goto LABEL_5;
  }
LABEL_6:
  v9.receiver = self;
  v9.super_class = (Class)CAStateAddElement;
  -[CAStateElement CAMLParser:setValue:forKey:](&v9, sel_CAMLParser_setValue_forKey_, a3, a4, v5);
}

- (void)encodeWithCAMLWriter:(id)a3
{
  NSString *keyPath;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CAStateAddElement;
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
  if (self->_beforeObject)
  {
    objc_msgSend(a3, "beginPropertyElement:", CFSTR("beforeObject"));
    objc_msgSend(a3, "encodeObject:", self->_beforeObject);
    objc_msgSend(a3, "endElement");
  }
}

- (id)CAMLTypeForKey:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("keyPath")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("objectId")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("beforeObjectId")) & 1) != 0)
  {
    return CFSTR("string");
  }
  v6.receiver = self;
  v6.super_class = (Class)CAStateAddElement;
  return -[CAStateElement CAMLTypeForKey:](&v6, sel_CAMLTypeForKey_, a3);
}

- (BOOL)CAMLTypeSupportedForKey:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("object")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("beforeObject")) & 1) != 0)
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)CAStateAddElement;
  return -[CAStateElement CAMLTypeSupportedForKey:](&v6, sel_CAMLTypeSupportedForKey_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)CAStateAddElement;
  -[CAStateElement encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_keyPath, CFSTR("keyPath"));
  objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", self->_object, CFSTR("object"), 0);
  objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", self->_beforeObject, CFSTR("beforeObject"), 0);
}

- (CAStateAddElement)initWithCoder:(id)a3
{
  CAStateAddElement *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CAStateAddElement;
  v4 = -[CAStateElement initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_keyPath = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyPath")), "copy");
    v4->_object = (id)objc_msgSend(a3, "CA_decodeObjectForKey:", CFSTR("object"));
    v4->_beforeObject = (id)objc_msgSend(a3, "CA_decodeObjectForKey:", CFSTR("beforeObject"));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)CAStateAddElement;
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
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("{%@:%p %@:%p %@ %@ before %@}"), v4, self, v5, objc_loadWeak((id *)&self->super._target), self->_keyPath, self->_object, self->_beforeObject);
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

- (id)beforeObject
{
  return self->_beforeObject;
}

- (void)setBeforeObject:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
