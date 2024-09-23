@implementation CAEmitterBehavior

- (CAEmitterBehavior)initWithType:(id)a3
{
  self->_flags = 1;
  if (a3)
    self->_type = CAInternAtom((const __CFString *)a3, 1);
  return -[CAEmitterBehavior init](self, "init");
}

- (NSString)type
{
  return (NSString *)CAAtomGetString(self->_type);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  unsigned int *cache;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  if (self->_name != a3)
  {
    -[CAEmitterBehavior willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("name"));

    self->_name = (NSString *)objc_msgSend(a3, "copy");
    cache = (unsigned int *)self->_cache;
    if (cache)
    {
      v6 = cache + 2;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)cache + 16))(cache);
      self->_cache = 0;
    }
    -[CAEmitterBehavior didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("name"));
  }
}

- (BOOL)isEnabled
{
  return self->_flags & 1;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int *cache;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  if (((((self->_flags & 1) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[CAEmitterBehavior willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("enabled"));
    self->_flags = self->_flags & 0xFFFFFFFE | v3;
    cache = (unsigned int *)self->_cache;
    if (cache)
    {
      v6 = cache + 2;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)cache + 16))(cache);
      self->_cache = 0;
    }
    -[CAEmitterBehavior didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("enabled"));
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  CA::Transaction *v7;
  CA::Transaction *v8;
  CA::Transaction *v9;
  int v10;
  void *attr;
  CA::AttrList *v12;
  malloc_zone_t *malloc_zone;
  unsigned int *cache;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v19[0] = a3;
  if (a4)
  {
    v7 = (CA::Transaction *)CAInternAtom((const __CFString *)a4, 1);
    if ((_DWORD)v7 == 208)
    {
      -[CAEmitterBehavior setEnabled:](self, "setEnabled:", *MEMORY[0x1E0C9AE40] != (_QWORD)a3);
    }
    else
    {
      v8 = v7;
      if ((_DWORD)v7 == 388)
      {
        -[CAEmitterBehavior setName:](self, "setName:", a3);
      }
      else
      {
        v18 = 0;
        v9 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
        if (!v9)
          v9 = (CA::Transaction *)CA::Transaction::create(v7);
        v10 = *((_DWORD *)v9 + 25);
        *((_DWORD *)v9 + 25) = v10 + 1;
        if (!v10)
          os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
        attr = self->_attr;
        if (!attr
          || !CA::AttrList::get((uint64_t)attr, (int)v8, (const CGAffineTransform *)1, (CA::Mat4Impl *)&v18)|| (objc_msgSend(v18, "isEqual:", a3) & 1) == 0)
        {
          -[CAEmitterBehavior willChangeValueForKey:](self, "willChangeValueForKey:", a4);
          v12 = (CA::AttrList *)self->_attr;
          if (!v12)
          {
            malloc_zone = (malloc_zone_t *)get_malloc_zone();
            v12 = (CA::AttrList *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x10uLL, 0x743898A5uLL);
          }
          self->_attr = CA::AttrList::set(v12, v8, 2, (unsigned __int8 *)v19);
          cache = (unsigned int *)self->_cache;
          if (cache)
          {
            v15 = cache + 2;
            do
            {
              v16 = __ldaxr(v15);
              v17 = v16 - 1;
            }
            while (__stlxr(v17, v15));
            if (!v17)
              (*(void (**)(unsigned int *))(*(_QWORD *)cache + 16))(cache);
            self->_cache = 0;
          }
          -[CAEmitterBehavior didChangeValueForKey:](self, "didChangeValueForKey:", a4);
        }
        CA::Transaction::unlock(v9);
      }
    }
  }
}

- (id)valueForKey:(id)a3
{
  CA::Transaction *v4;
  int v5;
  CA::Transaction *v7;
  int v8;
  void *attr;
  int v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = (CA::Transaction *)CAInternAtom((const __CFString *)a3, 1);
  if ((_DWORD)v4 == 208)
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAEmitterBehavior isEnabled](self, "isEnabled"));
  v5 = (int)v4;
  if ((_DWORD)v4 == 388)
    return self->_name;
  v7 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v7)
    v7 = (CA::Transaction *)CA::Transaction::create(v4);
  v8 = *((_DWORD *)v7 + 25);
  *((_DWORD *)v7 + 25) = v8 + 1;
  if (!v8)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  attr = self->_attr;
  if (!attr)
  {
    CA::Transaction::unlock(v7);
    return 0;
  }
  v11[0] = 0;
  v10 = CA::AttrList::get((uint64_t)attr, v5, (const CGAffineTransform *)1, (CA::Mat4Impl *)v11);
  CA::Transaction::unlock(v7);
  if (v10)
    return (id)v11[0];
  else
    return 0;
}

- (id)valueForKeyPath:(id)a3
{
  return CAObject_valueForKeyPath(self, a3);
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  CAObject_setValueForKeyPath(self, a3, a4);
}

- (void)didChangeValueForKey:(id)a3
{
  int v5;
  unsigned int *cache;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_cache)
  {
    v5 = CAInternAtom((const __CFString *)a3, 0);
    if (v5 == 108 || v5 == 576 || v5 == 356)
    {
      cache = (unsigned int *)self->_cache;
      v7 = cache + 2;
      do
      {
        v8 = __ldaxr(v7);
        v9 = v8 - 1;
      }
      while (__stlxr(v9, v7));
      if (!v9)
        (*(void (**)(unsigned int *))(*(_QWORD *)cache + 16))(cache);
      self->_cache = 0;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)CAEmitterBehavior;
  -[CAEmitterBehavior didChangeValueForKey:](&v10, sel_didChangeValueForKey_, a3);
}

- (void)dealloc
{
  CA::Transaction *v3;
  const void *v4;
  CA::Transaction *v5;
  int v6;
  CA::AttrList *attr;
  unsigned int *cache;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];

  if (self->_attr)
  {
    v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v5)
      v5 = (CA::Transaction *)CA::Transaction::create(v3);
    v6 = *((_DWORD *)v5 + 25);
    *((_DWORD *)v5 + 25) = v6 + 1;
    if (!v6)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    attr = (CA::AttrList *)self->_attr;
    if (attr)
      CA::AttrList::free(attr, v4);
    self->_attr = 0;
    CA::Transaction::unlock(v5);
  }
  cache = (unsigned int *)self->_cache;
  if (cache)
  {
    v9 = cache + 2;
    do
    {
      v10 = __ldaxr(v9);
      v11 = v10 - 1;
    }
    while (__stlxr(v11, v9));
    if (!v11)
      (*(void (**)(unsigned int *))(*(_QWORD *)cache + 16))(cache);
  }
  v12.receiver = self;
  v12.super_class = (Class)CAEmitterBehavior;
  -[CAEmitterBehavior dealloc](&v12, sel_dealloc);
}

- (Object)CA_copyRenderValue
{
  CA::Transaction *v3;
  int v4;
  malloc_zone_t *malloc_zone;
  _QWORD *v6;
  const __CFString *v7;
  _QWORD *v8;
  int v9;
  Object *result;
  unsigned int *v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t *attr;
  uint64_t v17;
  _QWORD *v18;
  size_t v19;
  _DWORD *v20;
  unsigned int *v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int v24;
  Atomic *p_var1;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  CA::Render::Array *v29;
  char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!self->_type)
    return 0;
  v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v3)
    v3 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  v4 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v4 + 1;
  if (!v4)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  if (!self->_cache)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v6 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x30uLL, 0x743898A5uLL);
    v8 = v6;
    if (v6)
    {
      *((_DWORD *)v6 + 2) = 1;
      ++dword_1ECDC7C5C;
      *v6 = off_1E1597710;
      *(_QWORD *)((char *)v6 + 12) = 13;
      v6[4] = 0;
      v6[5] = 0;
      v6[3] = 0;
      v9 = 13;
    }
    else
    {
      v9 = MEMORY[0xC];
    }
    *((_DWORD *)v6 + 4) = self->_type;
    *((_DWORD *)v6 + 3) = v9 | (self->_flags << 8);
    v11 = CA::Render::String::new_string((const __CFString *)self->_name, v7);
    v12 = v8[3];
    v8[3] = v11;
    if (v12)
    {
      v13 = (unsigned int *)(v12 + 8);
      do
      {
        v14 = __ldaxr(v13);
        v15 = v14 - 1;
      }
      while (__stlxr(v15, v13));
      if (!v15)
        v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 16))(v12);
    }
    attr = (uint64_t *)self->_attr;
    if (!attr)
      goto LABEL_32;
    v17 = -1;
    v18 = self->_attr;
    do
    {
      v18 = (_QWORD *)*v18;
      ++v17;
    }
    while (v18);
    if (!v17)
      goto LABEL_32;
    v19 = 8 * v17;
    v29 = 0;
    v30 = 0;
    if ((unint64_t)(8 * v17) > 0x1000)
    {
      v30 = (char *)malloc_type_malloc(8 * v17, 0x2004093837F09uLL);
      if (!v30)
      {
LABEL_32:
        self->_cache = v8;
        goto LABEL_33;
      }
      attr = (uint64_t *)self->_attr;
      if (!attr)
      {
LABEL_30:
        if (v19 > 0x1000)
          free(v30);
        goto LABEL_32;
      }
    }
    else
    {
      MEMORY[0x1E0C80A78](v12);
      bzero((char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v19);
      v30 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    }
    CA::AttrList::for_each(*attr, (uint64_t (*)(_QWORD, _QWORD *, uint64_t, uint64_t))copy_attr, (uint64_t)&v29);
    if (v29)
    {
      v20 = CA::Render::Array::new_array(v29, v30, 0, 0);
      v21 = (unsigned int *)v8[4];
      v8[4] = v20;
      if (v21)
      {
        v22 = v21 + 2;
        do
        {
          v23 = __ldaxr(v22);
          v24 = v23 - 1;
        }
        while (__stlxr(v24, v22));
        if (!v24)
          (*(void (**)(unsigned int *))(*(_QWORD *)v21 + 16))(v21);
      }
    }
    goto LABEL_30;
  }
LABEL_33:
  CA::Transaction::unlock(v3);
  result = (Object *)self->_cache;
  if (result)
  {
    p_var1 = &result->var1;
    do
      v26 = __ldaxr((unsigned int *)p_var1);
    while (__stlxr(v26 + 1, (unsigned int *)p_var1));
    if (!v26)
    {
      result = 0;
      do
        v27 = __ldaxr((unsigned int *)p_var1);
      while (__stlxr(v27 - 1, (unsigned int *)p_var1));
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CA::Transaction *v4;
  CA::Transaction *v5;
  CA::Transaction *v6;
  int v7;
  CA::AttrList *attr;
  uint64_t v9;

  v4 = (CA::Transaction *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    v6 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v6)
      v6 = (CA::Transaction *)CA::Transaction::create(v4);
    *((_DWORD *)v5 + 2) = self->_type;
    *((_QWORD *)v5 + 2) = -[NSString copy](self->_name, "copy");
    v7 = *((_DWORD *)v6 + 25);
    *((_DWORD *)v6 + 25) = v7 + 1;
    if (!v7)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    attr = (CA::AttrList *)self->_attr;
    if (attr)
    {
      v9 = *((_QWORD *)attr + 1) & 7;
      if ((_DWORD)v9 == 7)
        attr = (CA::AttrList *)CA::AttrList::copy_(attr);
      else
        *((_QWORD *)attr + 1) = *((_QWORD *)attr + 1) & 0xFFFFFFFFFFFFFFF8 | (v9 + 1);
    }
    *((_QWORD *)v5 + 3) = attr;
    CA::Transaction::unlock(v6);
    *((_DWORD *)v5 + 10) = self->_flags;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CA::Transaction *v5;
  NSString *name;
  CA::Transaction *v7;
  id v8;
  int v9;
  uint64_t *attr;
  id v11;

  v5 = (CA::Transaction *)objc_msgSend(a3, "encodeObject:forKey:", CAAtomGetString(self->_type), CFSTR("type"));
  name = self->_name;
  if (name)
    v5 = (CA::Transaction *)objc_msgSend(a3, "encodeObject:forKey:", name, CFSTR("name"));
  if ((self->_flags & 1) == 0)
    v5 = (CA::Transaction *)objc_msgSend(a3, "encodeBool:forKey:", 0, CFSTR("enabled"));
  if (self->_attr)
  {
    v7 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v7)
      v7 = (CA::Transaction *)CA::Transaction::create(v5);
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = *((_DWORD *)v7 + 25);
    *((_DWORD *)v7 + 25) = v9 + 1;
    v11 = v8;
    if (!v9)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    attr = (uint64_t *)self->_attr;
    if (attr)
      CA::AttrList::for_each(*attr, (uint64_t (*)(_QWORD, _QWORD *, uint64_t, uint64_t))copy_dictionary, (uint64_t)v11);
    CA::Transaction::unlock(v7);
    objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", v11, CFSTR("values"), 0);

  }
}

- (CAEmitterBehavior)initWithCoder:(id)a3
{
  CAEmitterBehavior *v4;
  const __CFString *v5;
  unsigned int v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  CFTypeID v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)CAEmitterBehavior;
  v4 = -[CAEmitterBehavior init](&v11, sel_init);
  if (v4)
  {
    v5 = (const __CFString *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    if (v5)
      v4->_type = CAInternAtom(v5, 1);
    v4->_name = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("enabled"))
      && !objc_msgSend(a3, "decodeBoolForKey:", CFSTR("enabled")))
    {
      v6 = v4->_flags & 0xFFFFFFFE;
    }
    else
    {
      v6 = v4->_flags | 1;
    }
    v4->_flags = v6;
    v7 = (const __CFDictionary *)objc_msgSend(a3, "CA_decodeObjectForKey:", CFSTR("values"));
    if (v7)
    {
      v8 = v7;
      v9 = CFGetTypeID(v7);
      if (v9 == CFDictionaryGetTypeID())
        CFDictionaryApplyFunction(v8, (CFDictionaryApplierFunction)set_attr, v4);
    }
  }
  return v4;
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
  -[CAEmitterBehavior setValue:forKey:](self, "setValue:forKey:", a4, a5);
}

- (void)encodeWithCAMLWriter:(id)a3
{
  NSString *v5;
  uint64_t v6;
  CA::Transaction *v7;
  int v8;
  uint64_t *attr;

  objc_msgSend(a3, "setElementAttribute:forKey:", -[CAEmitterBehavior type](self, "type"), CFSTR("behavior"));
  v5 = -[CAEmitterBehavior name](self, "name");
  if (v5)
    objc_msgSend(a3, "setElementAttribute:forKey:", v5, CFSTR("name"));
  v6 = -[CAEmitterBehavior isEnabled](self, "isEnabled");
  if ((v6 & 1) == 0)
    v6 = objc_msgSend(a3, "setElementAttribute:forKey:", CFSTR("0"), CFSTR("enabled"));
  if (self->_attr)
  {
    v7 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v7)
      v7 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)v6);
    v8 = *((_DWORD *)v7 + 25);
    *((_DWORD *)v7 + 25) = v8 + 1;
    if (!v8)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    attr = (uint64_t *)self->_attr;
    if (attr)
      CA::AttrList::for_each(*attr, (uint64_t (*)(_QWORD, _QWORD *, uint64_t, uint64_t))write_attr, (uint64_t)a3);
    CA::Transaction::unlock(v7);
  }
}

- (id)CAMLTypeForKey:(id)a3
{
  int v4;
  const __CFString *v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  char v12;

  v4 = CAInternAtom((const __CFString *)a3, 0);
  if (v4 == 208)
    return CFSTR("BOOL");
  if (v4 == 388)
    return CFSTR("string");
  v6 = 0;
  while (1)
  {
    v7 = behavior_inputs[v6];
    v8 = behavior_inputs[v6 + 1];
    v9 = v6 + 2;
    if (v7 == self->_type)
      break;
    v6 = v9 + v8;
    if (v6 >= 0x51)
      return 0;
  }
  if (v8 <= 1)
    v10 = 1;
  else
    v10 = v8;
  while (behavior_inputs[v9] != v4)
  {
    ++v9;
    if (!--v10)
      return 0;
  }
  v5 = CFSTR("BOOL");
  if (v4 <= 239)
  {
    if (v4 > 170)
    {
      v12 = v4 + 85;
      if ((v4 - 171) > 0x3E)
        return 0;
      if (((1 << v12) & 0x400060000000100DLL) == 0)
      {
        if (((1 << v12) & 0x400000000000002) != 0)
          return CFSTR("CAPoint3D");
        return 0;
      }
      return CFSTR("real");
    }
    if (v4 <= 89)
    {
      if (v4 <= 32)
      {
        if (v4 == 2)
          return (id)v5;
        if (v4 != 24)
          return 0;
        return CFSTR("real");
      }
      if (v4 == 33)
        return (id)v5;
      if (v4 != 44)
        return 0;
      return CFSTR("NSString");
    }
    if ((v4 - 113) < 2)
      return CFSTR("real");
    if (v4 == 90)
      return CFSTR("CGColor");
    if (v4 != 108)
      return 0;
    return CFSTR("NSArray");
  }
  if (v4 > 442)
  {
    if (v4 <= 526)
    {
      if (v4 != 443 && v4 != 470)
      {
        if (v4 == 520)
          return (id)v5;
        return 0;
      }
      return CFSTR("real");
    }
    if (v4 == 604)
      return CFSTR("real");
    if (v4 != 576)
    {
      if (v4 != 527)
        return 0;
      return CFSTR("real");
    }
    return CFSTR("NSArray");
  }
  if (v4 <= 403)
  {
    if (v4 == 240)
      return CFSTR("CAValueFunction");
    if (v4 == 330)
      return CFSTR("NSString");
    if (v4 != 356)
      return 0;
    return CFSTR("NSArray");
  }
  if ((v4 - 404) < 2)
    return CFSTR("real");
  if (v4 == 429)
    return CFSTR("CGPoint");
  if (v4 != 436)
    return 0;
  return (id)v5;
}

+ (id)behaviorTypes
{
  id result;
  id v3;
  int i;
  unsigned int *v5;

  result = (id)+[CAEmitterBehavior behaviorTypes]::names;
  if (!+[CAEmitterBehavior behaviorTypes]::names)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (i = 0; i < 81; i += v5[1] + 2)
    {
      v5 = &behavior_inputs[i];
      objc_msgSend(v3, "addObject:", CAAtomGetString(*v5));
    }
    +[CAEmitterBehavior behaviorTypes]::names = objc_msgSend(v3, "copy");

    return (id)+[CAEmitterBehavior behaviorTypes]::names;
  }
  return result;
}

+ (id)behaviorWithType:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", a3);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)CAMLParserStartElement:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "attributeForKey:remove:", CFSTR("behavior"), 1);
  if (v4)
    objc_msgSend(a3, "setElementValue:", +[CAEmitterBehavior behaviorWithType:](CAEmitterBehavior, "behaviorWithType:", v4));
  else
}

@end
