@implementation CAFilter

- (NSString)name
{
  return self->_name;
}

+ (void)CAMLParserStartElement:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "attributeForKey:remove:", CFSTR("filter"), 1);
  if (v4)
    objc_msgSend(a3, "setElementValue:", +[CAFilter filterWithType:](CAFilter, "filterWithType:", v4));
  else
}

+ (id)filterWithType:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", a3);
}

- (CAFilter)initWithType:(id)a3
{
  unsigned int type;

  self->_flags = 1;
  if (a3)
  {
    type = CAInternAtom((const __CFString *)a3, 1);
    self->_type = type;
  }
  else
  {
    type = self->_type;
  }
  self->_name = (NSString *)(id)CAAtomGetString(type);
  return -[CAFilter init](self, "init");
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
    if ((_DWORD)v7 == 77)
    {
      -[CAFilter setCachesInputImage:](self, "setCachesInputImage:", *MEMORY[0x1E0C9AE40] != (_QWORD)a3);
    }
    else
    {
      v8 = v7;
      if ((_DWORD)v7 == 208)
      {
        -[CAFilter setEnabled:](self, "setEnabled:", *MEMORY[0x1E0C9AE40] != (_QWORD)a3);
      }
      else if ((_DWORD)v7 == 388)
      {
        -[CAFilter setName:](self, "setName:", a3);
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
          -[CAFilter willChangeValueForKey:](self, "willChangeValueForKey:", a4);
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
          -[CAFilter didChangeValueForKey:](self, "didChangeValueForKey:", a4);
        }
        CA::Transaction::unlock(v9);
      }
    }
  }
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
    *((_DWORD *)v5 + 6) = self->_flags;
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
    *((_QWORD *)v5 + 4) = attr;
    CA::Transaction::unlock(v6);
  }
  return v5;
}

- (void)setName:(id)a3
{
  unsigned int *cache;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  if (self->_name != a3)
  {
    -[CAFilter willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("name"));

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
    -[CAFilter didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("name"));
  }
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
  -[CAFilter setValue:forKey:](self, "setValue:forKey:", a4, a5);
}

- (id)valueForKey:(id)a3
{
  CA::Transaction *v4;
  int v5;
  void *v6;
  _BOOL8 v7;
  CA::Transaction *v9;
  int v10;
  void *attr;
  int v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = (CA::Transaction *)CAInternAtom((const __CFString *)a3, 1);
  v5 = (int)v4;
  if ((int)v4 > 387)
  {
    if ((_DWORD)v4 == 566)
      return -[CAFilter type](self, "type");
    if ((_DWORD)v4 == 388)
      return self->_name;
  }
  else
  {
    if ((_DWORD)v4 == 77)
    {
      v6 = (void *)MEMORY[0x1E0CB37E8];
      v7 = -[CAFilter cachesInputImage](self, "cachesInputImage");
      return (id)objc_msgSend(v6, "numberWithBool:", v7);
    }
    if ((_DWORD)v4 == 208)
    {
      v6 = (void *)MEMORY[0x1E0CB37E8];
      v7 = -[CAFilter isEnabled](self, "isEnabled");
      return (id)objc_msgSend(v6, "numberWithBool:", v7);
    }
  }
  v9 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v9)
    v9 = (CA::Transaction *)CA::Transaction::create(v4);
  v10 = *((_DWORD *)v9 + 25);
  *((_DWORD *)v9 + 25) = v10 + 1;
  if (!v10)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  attr = self->_attr;
  if (!attr)
  {
    CA::Transaction::unlock(v9);
    return 0;
  }
  v13[0] = 0;
  v12 = CA::AttrList::get((uint64_t)attr, v5, (const CGAffineTransform *)1, (CA::Mat4Impl *)v13);
  CA::Transaction::unlock(v9);
  if (v12)
    return (id)v13[0];
  else
    return 0;
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
  v12.super_class = (Class)CAFilter;
  -[CAFilter dealloc](&v12, sel_dealloc);
}

- (Object)CA_copyRenderValue
{
  CAFilter *v2;
  CAFilter *v3;
  int isa_high;
  uint64_t *attr;
  uint64_t v6;
  _QWORD *v7;
  size_t v8;
  Object *result;
  CA::Render::KeyValueArray *v10;
  unsigned int *v11;
  malloc_zone_t *malloc_zone;
  CA::Render::Filter *v13;
  CA::Render::Filter *v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int flags;
  Atomic *p_var1;
  unsigned int v23;
  unsigned int v24;
  CA::Render::Array *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!self->_type)
    return 0;
  v2 = self;
  v3 = *(CAFilter **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v3)
  {
    self = (CAFilter *)CA::Transaction::create((CA::Transaction *)self);
    v3 = self;
  }
  isa_high = HIDWORD(v3[2].super.isa);
  HIDWORD(v3[2].super.isa) = isa_high + 1;
  if (!isa_high)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  if (!v2->_cache)
  {
    attr = (uint64_t *)v2->_attr;
    if (attr)
    {
      v6 = -1;
      v7 = v2->_attr;
      do
      {
        v7 = (_QWORD *)*v7;
        ++v6;
      }
      while (v7);
      if (v6)
      {
        v8 = 8 * v6;
        v25 = 0;
        v26 = 0;
        v27 = 0;
        if ((unint64_t)(8 * v6) <= 0x1000)
        {
          MEMORY[0x1E0C80A78](self);
          bzero((char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
          v26 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
          LODWORD(v27) = v2->_type;
LABEL_16:
          CA::AttrList::for_each(*attr, (uint64_t (*)(_QWORD, _QWORD *, uint64_t, uint64_t))copy_attr, (uint64_t)&v25);
          if (v25)
          {
            v10 = (CA::Render::KeyValueArray *)CA::Render::Array::new_array(v25, v26, 0, 0);
            goto LABEL_40;
          }
LABEL_39:
          v10 = 0;
LABEL_40:
          if (v8 > 0x1000)
            free(v26);
          goto LABEL_19;
        }
        v26 = (char *)malloc_type_malloc(8 * v6, 0x2004093837F09uLL);
        LODWORD(v27) = v2->_type;
        if (v26)
        {
          attr = (uint64_t *)v2->_attr;
          if (!attr)
            goto LABEL_39;
          goto LABEL_16;
        }
      }
    }
    v10 = 0;
LABEL_19:
    v11 = CA::Render::String::new_string((const __CFString *)v2->_name, (const __CFString *)a2);
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v13 = (CA::Render::Filter *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x38uLL, 0x743898A5uLL);
    v14 = v13;
    if (v13)
      CA::Render::Filter::Filter(v13, v2->_type, (CA::Render::String *)v11, v10);
    if (v11)
    {
      v15 = v11 + 2;
      do
      {
        v16 = __ldaxr(v15);
        v17 = v16 - 1;
      }
      while (__stlxr(v17, v15));
      if (!v17)
        (*(void (**)(unsigned int *))(*(_QWORD *)v11 + 16))(v11);
    }
    if (v10)
    {
      v18 = (unsigned int *)((char *)v10 + 8);
      do
      {
        v19 = __ldaxr(v18);
        v20 = v19 - 1;
      }
      while (__stlxr(v20, v18));
      if (!v20)
        (*(void (**)(CA::Render::KeyValueArray *))(*(_QWORD *)v10 + 16))(v10);
    }
    flags = v2->_flags;
    if (flags)
      *((_DWORD *)v14 + 3) |= flags << 8;
    v2->_cache = v14;
  }
  CA::Transaction::unlock((CA::Transaction *)v3);
  result = (Object *)v2->_cache;
  if (result)
  {
    p_var1 = &result->var1;
    do
      v23 = __ldaxr((unsigned int *)p_var1);
    while (__stlxr(v23 + 1, (unsigned int *)p_var1));
    if (!v23)
    {
      result = 0;
      do
        v24 = __ldaxr((unsigned int *)p_var1);
      while (__stlxr(v24 - 1, (unsigned int *)p_var1));
    }
  }
  return result;
}

- (NSString)type
{
  return (NSString *)CAAtomGetString(self->_type);
}

- (id)CAMLTypeForKey:(id)a3
{
  int v4;
  const __CFString *v5;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int i;

  v4 = CAInternAtom((const __CFString *)a3, 0);
  if (v4 == 77 || v4 == 208)
    return CFSTR("BOOL");
  if (v4 == 388)
    return CFSTR("string");
  v7 = 0;
  while (filter_inputs[v7] != self->_type)
  {
    v7 += filter_inputs[v7 + 1] + 2;
    if (v7 >= 0x9E)
      return 0;
  }
  v5 = 0;
  if (v7 != 35 && v7 != 113)
  {
    v8 = filter_inputs[v7 + 1];
    if (v8 <= 1)
      v9 = 1;
    else
      v9 = v8;
    for (i = v7 + 2; filter_inputs[i] != v4; ++i)
    {
      v5 = 0;
      if (!--v9)
        return (id)v5;
    }
    if (v4 > 394)
    {
      if (v4 != 496)
      {
        if (v4 == 457)
          return CFSTR("string");
        if (v4 != 395)
          return 0;
      }
      return CFSTR("real");
    }
    v5 = CFSTR("BOOL");
    switch(v4)
    {
      case 230:
      case 273:
      case 274:
      case 280:
      case 281:
      case 282:
      case 288:
      case 308:
        v5 = CFSTR("CGColor");
        break;
      case 267:
      case 270:
      case 271:
      case 272:
      case 276:
      case 287:
      case 299:
      case 302:
      case 306:
      case 309:
      case 310:
      case 349:
        return CFSTR("real");
      case 268:
      case 275:
      case 285:
      case 286:
      case 289:
      case 292:
      case 293:
      case 295:
      case 297:
      case 300:
      case 305:
      case 311:
      case 327:
        return (id)v5;
      case 269:
      case 278:
      case 291:
      case 304:
      case 312:
        v5 = CFSTR("NSArray");
        break;
      case 277:
      case 290:
      case 303:
        v5 = CFSTR("CGPoint");
        break;
      case 279:
      case 307:
        v5 = CFSTR("CGRect");
        break;
      case 283:
      case 296:
        v5 = CFSTR("CGImage");
        break;
      case 284:
        v5 = CFSTR("CAColorMatrix");
        break;
      case 294:
      case 301:
        return CFSTR("string");
      default:
        return 0;
    }
  }
  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAFilter)initWithCoder:(id)a3
{
  CAFilter *v4;
  const __CFString *v5;
  unsigned int v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  CFTypeID v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)CAFilter;
  v4 = -[CAFilter init](&v11, sel_init);
  if (v4)
  {
    v5 = (const __CFString *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAFilterType"));
    if (v5)
      v4->_type = CAInternAtom(v5, 1);
    v4->_name = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAFilterName"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("CAFilterEnabled"))
      && !objc_msgSend(a3, "decodeBoolForKey:", CFSTR("CAFilterEnabled")))
    {
      v6 = v4->_flags & 0xFFFFFFFE;
    }
    else
    {
      v6 = v4->_flags | 1;
    }
    v4->_flags = v6;
    v7 = (const __CFDictionary *)objc_msgSend(a3, "CA_decodeObjectForKey:", CFSTR("CAFilterInputs"));
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

- (BOOL)isEnabled
{
  return self->_flags & 1;
}

- (void)setEnabled:(BOOL)a3
{
  set_flag(self, 1, CFSTR("enabled"), a3);
}

- (BOOL)cachesInputImage
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (void)setCachesInputImage:(BOOL)a3
{
  set_flag(self, 2, CFSTR("cachesInputImage"), a3);
}

- (BOOL)isAccessibility
{
  return (BYTE1(self->_flags) >> 1) & 1;
}

- (void)setAccessibility:(BOOL)a3
{
  set_flag(self, 512, CFSTR("accessibility"), a3);
}

- (void)setDefaults
{
  CA::Transaction *v3;
  int v4;
  CA::AttrList *attr;
  unsigned int *cache;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;

  if (self->_attr)
  {
    v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v3)
      v3 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
    v4 = *((_DWORD *)v3 + 25);
    *((_DWORD *)v3 + 25) = v4 + 1;
    if (!v4)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    attr = (CA::AttrList *)self->_attr;
    if (attr)
      CA::AttrList::free(attr, a2);
    self->_attr = 0;
    CA::Transaction::unlock(v3);
    cache = (unsigned int *)self->_cache;
    if (cache)
    {
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

  v5 = (CA::Transaction *)objc_msgSend(a3, "encodeObject:forKey:", CAAtomGetString(self->_type), CFSTR("CAFilterType"));
  name = self->_name;
  if (name)
    v5 = (CA::Transaction *)objc_msgSend(a3, "encodeObject:forKey:", name, CFSTR("CAFilterName"));
  if ((self->_flags & 1) == 0)
    v5 = (CA::Transaction *)objc_msgSend(a3, "encodeBool:forKey:", 0, CFSTR("CAFilterEnabled"));
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
    objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", v11, CFSTR("CAFilterInputs"), 0);

  }
}

- (void)encodeWithCAMLWriter:(id)a3
{
  NSString *v5;
  uint64_t v6;
  CA::Transaction *v7;
  int v8;
  uint64_t *attr;

  objc_msgSend(a3, "setElementAttribute:forKey:", -[CAFilter type](self, "type"), CFSTR("filter"));
  v5 = -[CAFilter name](self, "name");
  if (v5)
    objc_msgSend(a3, "setElementAttribute:forKey:", v5, CFSTR("name"));
  if (!-[CAFilter isEnabled](self, "isEnabled"))
    objc_msgSend(a3, "setElementAttribute:forKey:", CFSTR("0"), CFSTR("enabled"));
  v6 = -[CAFilter cachesInputImage](self, "cachesInputImage");
  if ((_DWORD)v6)
    v6 = objc_msgSend(a3, "setElementAttribute:forKey:", CFSTR("1"), CFSTR("cachesInputImage"));
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

+ (id)filterTypes
{
  id result;
  id v3;
  int i;
  unsigned int *v5;

  result = (id)+[CAFilter filterTypes]::names;
  if (!+[CAFilter filterTypes]::names)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (i = 0; i < 158; i += v5[1] + 2)
    {
      v5 = &filter_inputs[i];
      objc_msgSend(v3, "addObject:", CAAtomGetString(*v5));
    }
    +[CAFilter filterTypes]::names = objc_msgSend(v3, "copy");

    return (id)+[CAFilter filterTypes]::names;
  }
  return result;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end
