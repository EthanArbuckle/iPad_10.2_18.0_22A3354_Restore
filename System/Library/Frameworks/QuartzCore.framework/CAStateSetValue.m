@implementation CAStateSetValue

- (BOOL)CAMLTypeSupportedForKey:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("value")) & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)CAStateSetValue;
  return -[CAStateElement CAMLTypeSupportedForKey:](&v6, sel_CAMLTypeSupportedForKey_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)apply:(id)a3
{
  CAStateSetValue *v5;
  void *v6;
  id v7;
  id value;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = objc_alloc_init(CAStateSetValue);
    -[CAStateElement setSource:](v5, "setSource:", self);
    -[CAStateElement setTarget:](v5, "setTarget:", objc_loadWeak((id *)&self->super._target));
    -[CAStateSetValue setKeyPath:](v5, "setKeyPath:", self->_keyPath);
    v6 = (void *)objc_msgSend(objc_loadWeak((id *)&self->super._target), "valueForKeyPath:", self->_keyPath);
    v7 = (objc_opt_respondsToSelector() & 1) != 0 ? (id)objc_msgSend(v6, "copy") : v6;
    v5->_value = v7;
    objc_msgSend(a3, "addElement:", v5);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (-[NSString isEqualToString:](self->_keyPath, "isEqualToString:", CFSTR("sublayers")))
      {
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        value = self->_value;
        v9 = objc_msgSend(value, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v17;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v17 != v11)
                objc_enumerationMutation(value);
              v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
              if (!objc_msgSend(v13, "superlayer"))
                objc_msgSend(a3, "willAddLayer:", v13);
            }
            v10 = objc_msgSend(value, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
          }
          while (v10);
        }
      }
      else if (-[NSString isEqualToString:](self->_keyPath, "isEqualToString:", CFSTR("mask")))
      {
        v14 = self->_value;
        if (!objc_msgSend(v14, "superlayer"))
          objc_msgSend(a3, "willAddLayer:", v14);
      }
    }
  }
  objc_msgSend(objc_loadWeak((id *)&self->super._target), "setValue:forKeyPath:", self->_value, self->_keyPath);
}

- (void)setKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CAStateSetValue)initWithCoder:(id)a3
{
  CAStateSetValue *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CAStateSetValue;
  v4 = -[CAStateElement initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_keyPath = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyPath")), "copy");
    v4->_value = (id)objc_msgSend(a3, "CA_decodeObjectForKey:", CFSTR("value"));
  }
  return v4;
}

- (id)CAMLTypeForKey:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("keyPath")) & 1) != 0)
    return CFSTR("string");
  v6.receiver = self;
  v6.super_class = (Class)CAStateSetValue;
  return -[CAStateElement CAMLTypeForKey:](&v6, sel_CAMLTypeForKey_, a3);
}

- (void)setValue:(id)a3
{
  id value;
  id v6;

  value = self->_value;
  if (value != a3)
  {

    if (-[NSString isEqualToString:](self->_keyPath, "isEqualToString:", CFSTR("sublayers")))
    {
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", a3);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = (id)objc_msgSend(a3, "copyWithZone:", 0);
    }
    else
    {
      v6 = a3;
    }
    self->_value = v6;
  }
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)CAStateSetValue;
  -[CAStateElement dealloc](&v3, sel_dealloc);
}

- (id)value
{
  return self->_value;
}

- (BOOL)matches:(id)a3
{
  id v5;

  v5 = (id)objc_msgSend(a3, "target");
  if (v5 == objc_loadWeak((id *)&self->super._target))
    return objc_msgSend((id)objc_msgSend(a3, "keyPath"), "isEqualToString:", self->_keyPath);
  else
    return 0;
}

- (void)foreachLayer:(id)a3
{
  id value;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[NSString isEqualToString:](self->_keyPath, "isEqualToString:", CFSTR("sublayers")))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    value = self->_value;
    v6 = objc_msgSend(value, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(value);
          (*((void (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        }
        v7 = objc_msgSend(value, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      }
      while (v7);
    }
  }
  else if (-[NSString isEqualToString:](self->_keyPath, "isEqualToString:", CFSTR("mask")))
  {
    (*((void (**)(id, id))a3 + 2))(a3, self->_value);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  CAStateSetValue *v4;

  v4 = objc_alloc_init(CAStateSetValue);
  v4->_keyPath = self->_keyPath;
  v4->_value = self->_value;
  -[CAStateElement setTarget:](v4, "setTarget:", -[CAStateElement target](self, "target"));
  return v4;
}

- (void)encodeWithCAMLWriter:(id)a3
{
  NSString *keyPath;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CAStateSetValue;
  -[CAStateElement encodeWithCAMLWriter:](&v6, sel_encodeWithCAMLWriter_);
  keyPath = self->_keyPath;
  if (keyPath)
    objc_msgSend(a3, "setElementAttribute:forKey:", keyPath, CFSTR("keyPath"));
  if (self->_value)
  {
    objc_msgSend(a3, "beginPropertyElement:", CFSTR("value"));
    objc_msgSend(a3, "encodeObject:", self->_value);
    objc_msgSend(a3, "endElement");
  }
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
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("{%@:%p %@:%p %@ %@}"), v4, self, v5, objc_loadWeak((id *)&self->super._target), self->_keyPath, self->_value);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)CAStateSetValue;
  -[CAStateElement encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_keyPath, CFSTR("keyPath"));
  objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", self->_value, CFSTR("value"), 0);
}

- (NSString)keyPath
{
  return self->_keyPath;
}

@end
