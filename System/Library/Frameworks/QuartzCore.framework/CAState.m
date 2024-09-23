@implementation CAState

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
  -[CAState setValue:forKey:](self, "setValue:forKey:", a4, a5);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)basedOn
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)elements
{
  return &self->_elements->super;
}

- (double)nextDelay
{
  return self->_nextDelay;
}

- (double)previousDelay
{
  return self->_previousDelay;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)CAMLParserStartElement:(id)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(a3, "setElementValue:", v4);

}

- (id)CAMLTypeForKey:(id)a3
{
  void *v4;

  v4 = (void *)-[CAState CAMLTypeForKey:]::dict;
  if (!-[CAState CAMLTypeForKey:]::dict)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("name"), CFSTR("string"), CFSTR("basedOn"), CFSTR("BOOL"), CFSTR("enabled"), CFSTR("NSArray"), CFSTR("elements"), CFSTR("real"), CFSTR("nextDelay"), CFSTR("real"), CFSTR("previousDelay"), CFSTR("BOOL"), CFSTR("locked"), CFSTR("BOOL"), CFSTR("initial"), 0);
    -[CAState CAMLTypeForKey:]::dict = (uint64_t)v4;
  }
  return (id)objc_msgSend(v4, "objectForKey:", a3);
}

- (CAState)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  self->_enabled = 1;
  *(int64x2_t *)&self->_nextDelay = vdupq_n_s64(0x7FF0000000000000uLL);
  v3.receiver = self;
  v3.super_class = (Class)CAState;
  return -[CAState init](&v3, sel_init);
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setBasedOn:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (CAState)initWithCoder:(id)a3
{
  CAState *v4;
  CAState *v5;
  double v6;
  double v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)CAState;
  v4 = -[CAState init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_enabled = 1;
    *(int64x2_t *)&v4->_nextDelay = vdupq_n_s64(0x7FF0000000000000uLL);
    v4->_name = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v5->_basedOn = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("basedOn"));
    v5->_elements = (NSMutableArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E0CB3510], "CA_supportedClasses"), CFSTR("elements")), "mutableCopy");
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("nextDelay")))
    {
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("nextDelay"));
      v5->_nextDelay = v6;
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("previousDelay")))
    {
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("previousDelay"));
      v5->_previousDelay = v7;
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("enabled")))
      v5->_enabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("enabled"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("locked")))
      v5->_locked = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("locked"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("initial")))
      v5->_initial = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("initial"));
  }
  return v5;
}

- (void)setElements:(id)a3
{
  NSMutableArray *elements;

  elements = self->_elements;
  if (elements != a3)
  {

    self->_elements = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  NSMutableArray *elements;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    *((_QWORD *)v4 + 1) = -[NSString copy](self->_name, "copy");
    *((_QWORD *)v4 + 2) = -[NSString copy](self->_basedOn, "copy");
    *((_BYTE *)v4 + 48) = self->_enabled;
    *((_BYTE *)v4 + 49) = self->_locked;
    *((_BYTE *)v4 + 50) = self->_initial;
    if (self->_elements)
    {
      *((_QWORD *)v4 + 3) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      elements = self->_elements;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v14 != v8)
              objc_enumerationMutation(elements);
            v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "copy");
            objc_msgSend(*((id *)v4 + 3), "addObject:", v10);

          }
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
        }
        while (v7);
      }
    }
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_nextDelay;
    *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_previousDelay;
  }
  return v4;
}

- (void)addElement:(id)a3
{
  NSMutableArray *elements;

  elements = self->_elements;
  if (!elements)
  {
    elements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_elements = elements;
  }
  -[NSMutableArray addObject:](elements, "addObject:", a3);
}

- (void)removeElement:(id)a3
{
  NSMutableArray *elements;

  elements = self->_elements;
  if (elements)
    -[NSMutableArray removeObjectIdenticalTo:](elements, "removeObjectIdenticalTo:", a3);
}

- (void)foreachLayer:(id)a3
{
  NSMutableArray *elements;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  elements = self->_elements;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(elements);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "foreachLayer:", a3);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](elements, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
}

- (void)encodeWithCAMLWriter:(id)a3
{
  NSString *name;
  NSString *basedOn;
  CFStringRef v7;
  CFStringRef v8;
  CFStringRef v9;
  CFStringRef v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  name = self->_name;
  if (name)
    objc_msgSend(a3, "setElementAttribute:forKey:", name, CFSTR("name"));
  basedOn = self->_basedOn;
  if (basedOn)
    objc_msgSend(a3, "setElementAttribute:forKey:", basedOn, CFSTR("basedOn"));
  if (!self->_enabled)
    objc_msgSend(a3, "setElementAttribute:forKey:", CFSTR("false"), CFSTR("enabled"));
  if (self->_locked)
    objc_msgSend(a3, "setElementAttribute:forKey:", CFSTR("true"), CFSTR("locked"));
  if (self->_initial)
    objc_msgSend(a3, "setElementAttribute:forKey:", CFSTR("true"), CFSTR("initial"));
  if ((*(_QWORD *)&self->_nextDelay & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v11[0] = *(_QWORD *)&self->_nextDelay;
    v7 = CACreateStringWithDoubleArray((uint64_t)v11, 1uLL, 0.001);
    if (v7)
    {
      v8 = v7;
      objc_msgSend(a3, "setElementAttribute:forKey:", v7, CFSTR("nextDelay"));
      CFRelease(v8);
    }
  }
  if ((*(_QWORD *)&self->_previousDelay & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v11[0] = *(_QWORD *)&self->_previousDelay;
    v9 = CACreateStringWithDoubleArray((uint64_t)v11, 1uLL, 0.001);
    if (v9)
    {
      v10 = v9;
      objc_msgSend(a3, "setElementAttribute:forKey:", v9, CFSTR("previousDelay"));
      CFRelease(v10);
    }
  }
  if (self->_elements)
  {
    objc_msgSend(a3, "beginPropertyElement:", CFSTR("elements"));
    objc_msgSend(a3, "encodeObject:", self->_elements);
    objc_msgSend(a3, "endElement");
  }
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  NSString *basedOn;
  NSMutableArray *elements;

  name = self->_name;
  if (name)
    objc_msgSend(a3, "encodeObject:forKey:", name, CFSTR("name"));
  basedOn = self->_basedOn;
  if (basedOn)
    objc_msgSend(a3, "encodeObject:forKey:", basedOn, CFSTR("basedOn"));
  elements = self->_elements;
  if (elements)
    objc_msgSend(a3, "encodeObject:forKey:", elements, CFSTR("elements"));
  if ((*(_QWORD *)&self->_nextDelay & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("nextDelay"));
  if ((*(_QWORD *)&self->_previousDelay & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("previousDelay"));
  if (!self->_enabled)
    objc_msgSend(a3, "encodeBool:forKey:", 0, CFSTR("enabled"));
  if (self->_locked)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("locked"));
  if (self->_initial)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("initial"));
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)CAState;
  -[CAState dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  const char *v5;
  const char *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_initial)
    v5 = " initial";
  else
    v5 = "";
  if (self->_locked)
    v6 = " locked";
  else
    v6 = "";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("{%@:%p %@ basedOn %@ %@%s%s}"), v4, self, *(_OWORD *)&self->_name, self->_elements, v5, v6);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setNextDelay:(double)a3
{
  self->_nextDelay = a3;
}

- (void)setPreviousDelay:(double)a3
{
  self->_previousDelay = a3;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (BOOL)isInitial
{
  return self->_initial;
}

- (void)setInitial:(BOOL)a3
{
  self->_initial = a3;
}

@end
