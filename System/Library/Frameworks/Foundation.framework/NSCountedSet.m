@implementation NSCountedSet

- (NSCountedSet)init
{
  return -[NSCountedSet initWithCapacity:](self, "initWithCapacity:", 0);
}

- (NSCountedSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  NSCountedSet *i;

  v4 = a4;
  _NSSetCheckSize((objc_class *)self, a2, a4, (uint64_t)"count");
  for (i = -[NSCountedSet initWithCapacity:](self, "initWithCapacity:", v4); v4; ++a3)
  {
    if (!*a3)
      _NSSetRaiseInsertNilException((objc_class *)i, a2);
    --v4;
    -[NSCountedSet addObject:](i, "addObject:");
  }
  return i;
}

- (NSCountedSet)initWithSet:(id)a3 copyItems:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  NSCountedSet *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;

  v4 = a4;
  v7 = objc_msgSend(a3, "count");
  v8 = -[NSCountedSet initWithCapacity:](self, "initWithCapacity:", v7);
  if (v7)
  {
    v9 = (void *)objc_msgSend(a3, "objectEnumerator");
    v10 = objc_msgSend(v9, "nextObject");
    if (v10)
    {
      v11 = (void *)v10;
      do
      {
        v12 = objc_msgSend(a3, "countForObject:", v11);
        if (v4)
          v13 = (id)objc_msgSend(v11, "copyWithZone:", 0);
        else
          v13 = v11;
        v14 = v13;
        while (v12)
        {
          --v12;
          -[NSCountedSet addObject:](v8, "addObject:", v14);
        }

        v11 = (void *)objc_msgSend(v9, "nextObject");
      }
      while (v11);
    }
  }
  return v8;
}

- (void)addObject:(id)object
{
  CFTypeID TypeID;
  uint64_t v6;
  __CFDictionary *table;
  id v8;
  const void *v9[2];

  v9[1] = *(const void **)MEMORY[0x1E0C80C00];
  if (!object)
    _NSSetRaiseInsertNilException((objc_class *)self, a2);
  TypeID = CFBagGetTypeID();
  if (TypeID == CFGetTypeID(self->_table))
  {
    CFBagAddValue((CFMutableBagRef)self->_table, object);
  }
  else
  {
    v9[0] = 0;
    if (CFDictionaryGetValueIfPresent((CFDictionaryRef)self->_table, object, v9))
    {
      v6 = (uint64_t)++v9[0];
      table = (__CFDictionary *)self->_table;
      v8 = object;
    }
    else
    {
      table = (__CFDictionary *)self->_table;
      v8 = object;
      v6 = 1;
    }
    CFDictionarySetValue(table, v8, (const void *)v6);
  }
}

- (NSUInteger)countForObject:(id)object
{
  CFTypeID TypeID;
  const void *v7[2];

  v7[1] = *(const void **)MEMORY[0x1E0C80C00];
  TypeID = CFBagGetTypeID();
  if (TypeID == CFGetTypeID(self->_table))
  {
    if (object)
      JUMPOUT(0x186DA6398);
    return 0;
  }
  v7[0] = 0;
  if (!object)
    return 0;
  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)self->_table, object, v7))
    return (NSUInteger)v7[0];
  else
    return 0;
}

- (unint64_t)count
{
  CFTypeID TypeID;

  TypeID = CFBagGetTypeID();
  if (TypeID == CFGetTypeID(self->_table))
    JUMPOUT(0x186DA7640);
  return CFDictionaryGetCount((CFDictionaryRef)self->_table);
}

- (NSCountedSet)initWithCapacity:(NSUInteger)numItems
{
  _NSSetCheckSize((objc_class *)self, a2, numItems, (uint64_t)"capacity");
  self->_table = CFBagCreateMutable(0, 0, MEMORY[0x1E0C9B388]);
  return self;
}

- (NSEnumerator)objectEnumerator
{
  CFTypeID TypeID;
  CFTypeID v4;
  id v5;
  void *table;

  TypeID = CFBagGetTypeID();
  v4 = CFGetTypeID(self->_table);
  v5 = objc_allocWithZone(MEMORY[0x1E0C99EA8]);
  if (TypeID == v4)
    table = self;
  else
    table = self->_table;
  return (NSEnumerator *)(id)objc_msgSend(v5, "initWithObject:", table);
}

- (void)removeObject:(id)object
{
  CFTypeID TypeID;
  __CFDictionary *table;
  const void *v7;
  void *v8;
  void *value[2];

  value[1] = *(void **)MEMORY[0x1E0C80C00];
  if (!object)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: attempt to remove nil"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v8);
  }
  TypeID = CFBagGetTypeID();
  if (TypeID == CFGetTypeID(self->_table))
  {
    CFBagRemoveValue((CFMutableBagRef)self->_table, object);
  }
  else
  {
    value[0] = 0;
    if (CFDictionaryGetValueIfPresent((CFDictionaryRef)self->_table, object, (const void **)value))
    {
      table = (__CFDictionary *)self->_table;
      v7 = --value[0];
      if (value[0])
        CFDictionarySetValue(table, object, v7);
      else
        CFDictionaryRemoveValue(table, object);
    }
  }
}

- (void)dealloc
{
  id table;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  table = self->_table;
  if (table)
  {

    self->_table = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSCountedSet;
  -[NSCountedSet dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_allocWithZone((Class)objc_opt_class()), "initWithSet:copyItems:", self, 0);
}

- (void)getObjects:(id *)a3 count:(unint64_t)a4
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = -[NSCountedSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v9)
        objc_enumerationMutation(self);
      if (a4 == v10)
        break;
      *a3++ = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v10);
      if (v8 == ++v10)
      {
        v8 = -[NSCountedSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
        a4 -= v10;
        if (v8)
          goto LABEL_3;
        return;
      }
    }
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  CFTypeID TypeID;
  unint64_t v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  TypeID = CFBagGetTypeID();
  if (TypeID == CFGetTypeID(self->_table))
  {
    v10 = _CFBagFastEnumeration();
    if (!_CFExecutableLinkedOnOrAfter())
      a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__mut;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NSCountedSet;
    return -[NSCountedSet countByEnumeratingWithState:objects:count:](&v12, sel_countByEnumeratingWithState_objects_count_, a3, a4, a5);
  }
  return v10;
}

- (id)member:(id)a3
{
  CFTypeID TypeID;

  if (!a3)
    return 0;
  TypeID = CFBagGetTypeID();
  if (TypeID == CFGetTypeID(self->_table))
    return (id)CFBagGetValue((CFBagRef)self->_table, a3);
  if (CFDictionaryGetKeyIfPresent())
    return 0;
  return 0;
}

- (NSCountedSet)initWithArray:(NSArray *)array
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)NSCountedSet;
  return -[NSCountedSet initWithArray:](&v4, sel_initWithArray_, array);
}

- (void)removeAllObjects
{
  CFTypeID TypeID;
  CFTypeID v4;
  __CFBag *table;

  TypeID = CFBagGetTypeID();
  v4 = CFGetTypeID(self->_table);
  table = (__CFBag *)self->_table;
  if (TypeID == v4)
    CFBagRemoveAllValues(table);
  else
    CFDictionaryRemoveAllValues(table);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_allocWithZone((Class)objc_opt_class()), "initWithSet:copyItems:", self, 0);
}

- (void)encodeWithCoder:(id)a3
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  NSEnumerator *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  CFStringRef v17;
  void *v18;
  _QWORD v19[2];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "allowsKeyedCoding");
  v6 = -[NSCountedSet count](self, "count");
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(a3, "encodeInt64:forKey:", v6, CFSTR("NS.count"));
    v8 = -[NSCountedSet objectEnumerator](self, "objectEnumerator");
    v9 = -[NSEnumerator nextObject](v8, "nextObject");
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      do
      {
        objc_msgSend(a3, "encodeObject:forKey:", v10, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NS.object%qd"), v11));
        objc_msgSend(a3, "encodeInt64:forKey:", -[NSCountedSet countForObject:](self, "countForObject:", v10), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NS.count%qd"), v11++));
        v10 = -[NSEnumerator nextObject](v8, "nextObject");
      }
      while (v10);
    }
  }
  else
  {
    v20 = v6;
    v12 = objc_msgSend(a3, "encodeValueOfObjCType:at:", "I", &v20);
    if (v7 >= 1)
    {
      if ((unint64_t)v7 >> 60)
      {
        v17 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v7);
        v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v17, 0);
        CFRelease(v17);
        objc_exception_throw(v18);
      }
      *(_QWORD *)&v13 = MEMORY[0x1E0C80A78](v12).n128_u64[0];
      v15 = (_QWORD *)((char *)v19 - v14);
      v19[1] = 0;
      if ((unint64_t)v7 >= 0x101)
      {
        v15 = (_QWORD *)_CFCreateArrayStorage();
        v16 = v15;
      }
      else
      {
        v16 = 0;
      }
      -[NSCountedSet getObjects:count:](self, "getObjects:count:", v15, v7, v13);
      do
      {
        objc_msgSend(a3, "encodeBycopyObject:", *v15);
        v20 = -[NSCountedSet countForObject:](self, "countForObject:", *v15);
        objc_msgSend(a3, "encodeValueOfObjCType:at:", "I", &v20);
        ++v15;
        --v7;
      }
      while (v7);
      free(v16);
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSCountedSet)initWithCoder:(id)a3
{
  unint64_t v6;
  NSString *v7;
  uint64_t v8;
  void *v9;
  NSString **v10;
  const __CFString **v11;
  NSCountedSet *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  NSString *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  NSString *v24;
  NSString *v25;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  uint64_t v29;
  unsigned int v30;
  const __CFString *v31;
  NSString *v32;
  const __CFString *v33;
  NSString *v34;
  const __CFString *v35;
  NSString *v36;
  const __CFString *v37;
  NSString *v38;
  const __CFString *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v6 = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("NS.count"));
    if (v6 >> 60)
    {
      v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: cannot decode set with %qd elements in this version"), _NSMethodExceptionProem((objc_class *)self, a2), v6);

      v8 = *MEMORY[0x1E0C9AFB8];
      v39 = CFSTR("NSLocalizedDescription");
      v40[0] = v7;
      v9 = (void *)MEMORY[0x1E0C99D80];
      v10 = (NSString **)v40;
      v11 = &v39;
LABEL_4:
      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v8, 4864, objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1)));
      return 0;
    }
    v12 = -[NSCountedSet initWithCapacity:](self, "initWithCapacity:", v6);
    if (v12 && v6)
    {
      v16 = 0;
      while (1)
      {
        v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NS.object%qd"), v16);
        v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NS.count%qd"), v16);
        if (!objc_msgSend(a3, "containsValueForKey:", v17)
          || !objc_msgSend(a3, "containsValueForKey:", v18))
        {
          v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: mismatch in count stored (%llu) vs count present (%llu)"), _NSMethodExceptionProem((objc_class *)v12, a2), v6, v16);

          v8 = *MEMORY[0x1E0C9AFB8];
          v31 = CFSTR("NSLocalizedDescription");
          v32 = v24;
          v9 = (void *)MEMORY[0x1E0C99D80];
          v10 = &v32;
          v11 = &v31;
          goto LABEL_4;
        }
        v19 = objc_msgSend(a3, "decodeObjectForKey:", v17);
        if (!v19)
        {
          v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: decode failure at index %llu - item nil"), _NSMethodExceptionProem((objc_class *)v12, a2), v16);

          v8 = *MEMORY[0x1E0C9AFB8];
          v37 = CFSTR("NSLocalizedDescription");
          v38 = v25;
          v9 = (void *)MEMORY[0x1E0C99D80];
          v10 = &v38;
          v11 = &v37;
          goto LABEL_4;
        }
        v20 = v19;
        v21 = objc_msgSend(a3, "decodeInt64ForKey:", v18);
        if (!v21)
        {
          v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: decode failure at index %llu -- itemCount zero"), _NSMethodExceptionProem((objc_class *)v12, a2), v16);

          v8 = *MEMORY[0x1E0C9AFB8];
          v35 = CFSTR("NSLocalizedDescription");
          v36 = v26;
          v9 = (void *)MEMORY[0x1E0C99D80];
          v10 = &v36;
          v11 = &v35;
          goto LABEL_4;
        }
        v22 = v21;
        if (v21 >> 60)
          break;
        do
        {
          --v22;
          -[NSCountedSet addObject:](v12, "addObject:", v20);
        }
        while (v22);
        if (++v16 == v6)
          return v12;
      }
      v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: cannot store %qd instances of item '%@' in this version"), _NSMethodExceptionProem((objc_class *)v12, a2), v21, v20);

      v8 = *MEMORY[0x1E0C9AFB8];
      v33 = CFSTR("NSLocalizedDescription");
      v34 = v27;
      v9 = (void *)MEMORY[0x1E0C99D80];
      v10 = &v34;
      v11 = &v33;
      goto LABEL_4;
    }
  }
  else
  {
    v13 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSCountedSet"));
    if (v13 > 1)
    {
      v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: NSCountedSet cannot decode class version %lu"), _NSMethodExceptionProem((objc_class *)self, a2), v13);

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v28, 0));
    }
    v30 = 0;
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "I", &v30, 4);
    v14 = v30;
    _NSSetCheckSize((objc_class *)self, a2, v30, (uint64_t)"count");
    v12 = -[NSCountedSet initWithCapacity:](self, "initWithCapacity:", v14);
    if ((_DWORD)v14)
    {
      do
      {
        v29 = 0;
        objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "@", &v29, 8);
        objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "I", &v30, 4);
        v15 = v30;
        if (v30)
        {
          do
          {
            --v15;
            -[NSCountedSet addObject:](v12, "addObject:", v29);
          }
          while (v15);
        }
        --v14;
      }
      while (v14);
    }
  }
  return v12;
}

- (id)descriptionWithLocale:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  id v7;
  objc_class *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  id *v12;
  id *v13;
  objc_class *v14;
  char v16;
  uint64_t v17;
  uint64_t v18;
  CFStringRef v19;
  void *v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v5 = -[NSCountedSet count](self, "count");
  if (v5)
  {
    v6 = v5;
    v7 = (id)objc_msgSend(objc_allocWithZone((Class)NSMutableString), "initWithCapacity:", v5 << 6);
    v8 = (objc_class *)objc_opt_class();
    v9 = objc_msgSend(v7, "appendFormat:", CFSTR("<%@: %p> ("), NSStringFromClass(v8), self);
    if (v6 >> 60)
    {
      v19 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6);
      v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v19, 0);
      CFRelease(v19);
      objc_exception_throw(v20);
    }
    v21[1] = v21;
    *(_QWORD *)&v10 = MEMORY[0x1E0C80A78](v9).n128_u64[0];
    v12 = (id *)((char *)v21 - v11);
    v21[2] = 0;
    if (v6 >= 0x101)
    {
      v12 = (id *)_CFCreateArrayStorage();
      v13 = v12;
    }
    else
    {
      v13 = 0;
    }
    -[NSCountedSet getObjects:count:](self, "getObjects:count:", v12, v6, v10);
    v16 = 1;
    do
    {
      if ((v16 & 1) == 0)
        objc_msgSend(v7, "replaceCharactersInRange:withString:", objc_msgSend(v7, "length"), 0, CFSTR(", "));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v17 = objc_msgSend(v7, "length");
        v18 = objc_msgSend(*v12, "descriptionWithLocale:", a3);
      }
      else
      {
        v17 = objc_msgSend(v7, "length");
        v18 = objc_msgSend(*v12, "description");
      }
      objc_msgSend(v7, "replaceCharactersInRange:withString:", v17, 0, v18);
      objc_msgSend(v7, "appendFormat:", CFSTR(" [%ld]"), -[NSCountedSet countForObject:](self, "countForObject:", *v12));
      v16 = 0;
      ++v12;
      --v6;
    }
    while (v6);
    objc_msgSend(v7, "replaceCharactersInRange:withString:", objc_msgSend(v7, "length"), 0, CFSTR(")"));
    free(v13);
    return v7;
  }
  else
  {
    v14 = (objc_class *)objc_opt_class();
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> ()"), NSStringFromClass(v14), self);
  }
}

- (NSCountedSet)initWithSet:(NSSet *)set
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)NSCountedSet;
  return -[NSCountedSet initWithSet:](&v4, sel_initWithSet_, set);
}

@end
