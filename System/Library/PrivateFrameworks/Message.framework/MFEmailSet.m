@implementation MFEmailSet

+ (id)set
{
  return objc_alloc_init((Class)a1);
}

- (MFEmailSet)init
{
  MFEmailSet *v2;
  MFEmailSet *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFEmailSet;
  v2 = -[EAEmailAddressSet init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MFEmailSet _setupSetWithCapacity:](v2, "_setupSetWithCapacity:", 0);
  return v3;
}

- (MFEmailSet)initWithCapacity:(unint64_t)a3
{
  MFEmailSet *v4;
  MFEmailSet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFEmailSet;
  v4 = -[EAEmailAddressSet init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[MFEmailSet _setupSetWithCapacity:](v4, "_setupSetWithCapacity:", a3);
  return v5;
}

- (MFEmailSet)initWithSet:(id)a3
{
  MFEmailSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _MFEmailSetEmail *v10;
  _MFEmailSetEmail *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = -[MFEmailSet initWithCapacity:](self, "initWithCapacity:", objc_msgSend(a3, "count"));
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(a3);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = -[_MFEmailSetEmail initWithAddress:]([_MFEmailSetEmail alloc], "initWithAddress:", v9);
            if (v10)
            {
              v11 = v10;
              CFSetAddValue(v4->_set, v10);

            }
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
  }
  return v4;
}

- (void)_setupSetWithCapacity:(unint64_t)a3
{
  self->_set = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &sMFEmailSetCallbacks);
}

- (void)dealloc
{
  __CFSet *set;
  objc_super v4;

  set = self->_set;
  if (set)
    CFRelease(set);
  v4.receiver = self;
  v4.super_class = (Class)MFEmailSet;
  -[MFEmailSet dealloc](&v4, sel_dealloc);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  MFEmailSet *v4;

  v4 = objc_alloc_init(MFEmailSet);
  CFSetApplyFunction(self->_set, (CFSetApplierFunction)_copyFunction, v4->_set);
  return v4;
}

- (id)serializedRepresentation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E458]), "initWithSet:", self);
  v3 = (void *)objc_msgSend(v2, "serializedRepresentation");

  return v3;
}

- (unint64_t)count
{
  return CFSetGetCount(self->_set);
}

- (id)member:(id)a3
{
  _MFEmailSetEmail *v5;
  _MFEmailSetEmail *v6;
  void *Value;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[MFEmailSet member:].cold.1();
  v5 = -[_MFEmailSetEmail initWithAddress:]([_MFEmailSetEmail alloc], "initWithAddress:", a3);
  if (v5)
  {
    v6 = v5;
    Value = (void *)CFSetGetValue(self->_set, v5);

  }
  else
  {
    Value = 0;
  }
  return (id)objc_msgSend(Value, "address");
}

- (BOOL)intersectsSet:(id)a3
{
  uint64_t v5;
  MFEmailSet *v7;
  BOOL v8;
  objc_super v9;
  _QWORD context[2];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a3, "count"))
  {
    v5 = *((_QWORD *)a3 + 2);
    context[0] = 0xAAAAAAAAAAAAAA00;
    context[1] = v5;
    CFSetApplyFunction(self->_set, (CFSetApplierFunction)_intersectsFunction, context);
    return LOBYTE(context[0]) != 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a3, "count"))
    {
      v7 = -[MFEmailSet initWithSet:]([MFEmailSet alloc], "initWithSet:", a3);
      v8 = -[MFEmailSet intersectsSet:](self, "intersectsSet:", v7);

      return v8;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)MFEmailSet;
      return -[EAEmailAddressSet intersectsSet:](&v9, sel_intersectsSet_, a3);
    }
  }
}

- (BOOL)isSubsetOfSet:(id)a3
{
  uint64_t v5;
  MFEmailSet *v7;
  BOOL v8;
  objc_super v9;
  _QWORD context[2];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a3, "count"))
  {
    v5 = *((_QWORD *)a3 + 2);
    context[0] = 0xAAAAAAAAAAAAAA01;
    context[1] = v5;
    CFSetApplyFunction(self->_set, (CFSetApplierFunction)_subsetFunction, context);
    return LOBYTE(context[0]) != 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a3, "count"))
    {
      v7 = -[MFEmailSet initWithSet:]([MFEmailSet alloc], "initWithSet:", a3);
      v8 = -[MFEmailSet isSubsetOfSet:](self, "isSubsetOfSet:", v7);

      return v8;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)MFEmailSet;
      return -[EAEmailAddressSet isSubsetOfSet:](&v9, sel_isSubsetOfSet_, a3);
    }
  }
}

- (BOOL)isEqualToSet:(id)a3
{
  unint64_t v5;
  MFEmailSet *v7;
  BOOL v8;
  objc_super v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[MFEmailSet count](self, "count");
    return v5 == objc_msgSend(a3, "count") && -[MFEmailSet isSubsetOfSet:](self, "isSubsetOfSet:", a3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a3, "count"))
    {
      v7 = -[MFEmailSet initWithSet:]([MFEmailSet alloc], "initWithSet:", a3);
      v8 = -[MFEmailSet isEqualToSet:](self, "isEqualToSet:", v7);

      return v8;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)MFEmailSet;
      return -[EAEmailAddressSet isEqualToSet:](&v9, sel_isEqualToSet_, a3);
    }
  }
}

- (id)_generateAllObjectsFromSelector:(SEL)a3
{
  CFIndex Count;
  const void **v6;
  void *v7;
  void *v8;
  void **v9;
  _QWORD *v10;
  CFIndex v11;
  void *v12;
  void *v13;

  Count = CFSetGetCount(self->_set);
  v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFSetGetValues(self->_set, v6);
  v7 = malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  v8 = v7;
  if (Count >= 1)
  {
    v9 = (void **)v6;
    v10 = v7;
    v11 = Count;
    do
    {
      v12 = *v9++;
      *v10++ = objc_msgSend(v12, a3);
      --v11;
    }
    while (v11);
  }
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, Count);
  free(v6);
  free(v8);
  return v13;
}

- (id)allCommentedAddresses
{
  return -[MFEmailSet _generateAllObjectsFromSelector:](self, "_generateAllObjectsFromSelector:", sel_commentedAddress);
}

- (id)allObjects
{
  return -[MFEmailSet _generateAllObjectsFromSelector:](self, "_generateAllObjectsFromSelector:", sel_address);
}

- (id)objectEnumerator
{
  return -[_MFEmailSetEnumerator initWithSet:]([_MFEmailSetEnumerator alloc], "initWithSet:", self);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v6;
  uint64_t v7;

  v6 = -[__CFSet countByEnumeratingWithState:objects:count:](self->_set, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
  if (v6)
  {
    v7 = 0;
    do
    {
      a3->var1[v7] = (id)objc_msgSend(a3->var1[v7], "address");
      ++v7;
    }
    while (v6 != v7);
  }
  return v6;
}

- (void)addObject:(id)a3
{
  _MFEmailSetEmail *v5;
  NSObject *v6;
  _MFEmailSetEmail *v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[MFEmailSet addObject:].cold.1();
  v5 = -[_MFEmailSetEmail initWithAddress:]([_MFEmailSetEmail alloc], "initWithAddress:", a3);
  if (v5)
  {
    v7 = v5;
    CFSetAddValue(self->_set, v5);

  }
  else
  {
    v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v9 = a3;
      _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_INFO, "attempt to add illegal email address to email set, skipping '%@'", buf, 0xCu);
    }
  }
}

- (void)removeObject:(id)a3
{
  _MFEmailSetEmail *v5;
  _MFEmailSetEmail *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[MFEmailSet removeObject:].cold.1();
  v5 = -[_MFEmailSetEmail initWithAddress:]([_MFEmailSetEmail alloc], "initWithAddress:", a3);
  if (v5)
  {
    v6 = v5;
    CFSetRemoveValue(self->_set, v5);

  }
}

- (void)removeAllObjects
{
  CFSetRemoveAllValues(self->_set);
}

- (void)unionSet:(id)a3
{
  MFEmailSet *v5;
  objc_super v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CFSetApplyFunction(*((CFSetRef *)a3 + 2), (CFSetApplierFunction)_unionFunction, self->_set);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[MFEmailSet initWithSet:]([MFEmailSet alloc], "initWithSet:", a3);
      -[MFEmailSet unionSet:](self, "unionSet:", v5);

    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)MFEmailSet;
      -[EAEmailAddressSet unionSet:](&v6, sel_unionSet_, a3);
    }
  }
}

- (void)minusSet:(id)a3
{
  MFEmailSet *v5;
  objc_super v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CFSetApplyFunction(*((CFSetRef *)a3 + 2), (CFSetApplierFunction)_minusFunction, self->_set);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[MFEmailSet initWithSet:]([MFEmailSet alloc], "initWithSet:", a3);
      -[MFEmailSet minusSet:](self, "minusSet:", v5);

    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)MFEmailSet;
      -[EAEmailAddressSet minusSet:](&v6, sel_minusSet_, a3);
    }
  }
}

- (void)intersectSet:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  MFEmailSet *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD context[2];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *((_QWORD *)a3 + 2);
      context[0] = v5;
      context[1] = v6;
      CFSetApplyFunction(self->_set, (CFSetApplierFunction)_intersectFunction, context);
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v14;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v14 != v9)
              objc_enumerationMutation(v5);
            CFSetRemoveValue(self->_set, *(const void **)(*((_QWORD *)&v13 + 1) + 8 * v10++));
          }
          while (v8 != v10);
          v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        }
        while (v8);
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = -[MFEmailSet initWithSet:]([MFEmailSet alloc], "initWithSet:", a3);
        -[MFEmailSet intersectSet:](self, "intersectSet:");

      }
      else
      {
        v12.receiver = self;
        v12.super_class = (Class)MFEmailSet;
        -[EAEmailAddressSet intersectSet:](&v12, sel_intersectSet_, a3);
      }
    }
  }
}

- (void)setSet:(id)a3
{
  MFEmailSet *v5;
  objc_super v6;

  if (a3 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      CFSetRemoveAllValues(self->_set);
      CFSetApplyFunction(*((CFSetRef *)a3 + 2), (CFSetApplierFunction)_unionFunction, self->_set);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = -[MFEmailSet initWithSet:]([MFEmailSet alloc], "initWithSet:", a3);
        -[MFEmailSet setSet:](self, "setSet:", v5);

      }
      else
      {
        v6.receiver = self;
        v6.super_class = (Class)MFEmailSet;
        -[EAEmailAddressSet setSet:](&v6, sel_setSet_, a3);
      }
    }
  }
}

- (void)member:.cold.1()
{
  __assert_rtn("-[MFEmailSet member:]", "MFEmailSet.m", 201, "[object isKindOfClass:[NSString class]]");
}

- (void)addObject:.cold.1()
{
  __assert_rtn("-[MFEmailSet addObject:]", "MFEmailSet.m", 334, "[object isKindOfClass:[NSString class]]");
}

- (void)removeObject:.cold.1()
{
  __assert_rtn("-[MFEmailSet removeObject:]", "MFEmailSet.m", 346, "[object isKindOfClass:[NSString class]]");
}

@end
