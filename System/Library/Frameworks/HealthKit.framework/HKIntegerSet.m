@implementation HKIntegerSet

- (HKIntegerSet)initWithCapacity:(unint64_t)a3
{
  HKIntegerSet *v4;
  CFMutableSetRef v5;
  HKIntegerSet *v6;
  CFSetCallBacks v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKIntegerSet;
  v4 = -[HKIntegerSet init](&v9, sel_init);
  if (v4
    && (memset(&v8, 0, sizeof(v8)),
        v5 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, &v8),
        (v4->_set = v5) == 0))
  {
    v6 = 0;
  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (void)dealloc
{
  __CFSet *set;
  objc_super v4;

  set = self->_set;
  if (set)
    CFRelease(set);
  v4.receiver = self;
  v4.super_class = (Class)HKIntegerSet;
  -[HKIntegerSet dealloc](&v4, sel_dealloc);
}

- (HKIntegerSet)init
{
  return -[HKIntegerSet initWithCapacity:](self, "initWithCapacity:", 0);
}

- (HKIntegerSet)initWithIndex:(int64_t)a3
{
  HKIntegerSet *v4;
  HKIntegerSet *v5;

  v4 = -[HKIntegerSet initWithCapacity:](self, "initWithCapacity:", 1);
  v5 = v4;
  if (v4)
    CFSetAddValue(v4->_set, (const void *)a3);
  return v5;
}

- (HKIntegerSet)initWithSet:(id)a3
{
  id v4;
  HKIntegerSet *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HKIntegerSet initWithCapacity:](self, "initWithCapacity:", objc_msgSend(v4, "count"));
  if (v5)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          CFSetAddValue(v5->_set, (const void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "integerValue", (_QWORD)v12));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (HKIntegerSet)initWithArray:(id)a3
{
  id v4;
  HKIntegerSet *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HKIntegerSet initWithCapacity:](self, "initWithCapacity:", objc_msgSend(v4, "count"));
  if (v5)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          CFSetAddValue(v5->_set, (const void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "integerValue", (_QWORD)v12));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v11;
  void *v12;
  objc_super v13;
  _QWORD v14[4];
  id v15;

  if (!self->_set)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKIntegerSet.m"), 94, CFSTR("_set is nil"), v12);

  }
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[HKIntegerSet count](self, "count"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __27__HKIntegerSet_description__block_invoke;
  v14[3] = &unk_1E37F11F0;
  v15 = v3;
  v4 = v3;
  -[HKIntegerSet enumerateIntegersUsingBlock:](self, "enumerateIntegersUsingBlock:", v14);
  v13.receiver = self;
  v13.super_class = (Class)HKIntegerSet;
  -[HKIntegerSet description](&v13, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKIntegerSet count](self, "count");
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" count %d: [%@]"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __27__HKIntegerSet_description__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)enumerateIntegersUsingBlock:(id)a3
{
  id v5;
  __CFSet *set;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  set = self->_set;
  v9 = v5;
  if (!set)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKIntegerSet.m"), 105, CFSTR("_set is nil"), v8);

    v5 = v9;
    set = self->_set;
  }
  CFSetApplyFunction(set, (CFSetApplierFunction)HKIntegerSetEnumerateEntry, v5);

}

- (BOOL)containsInteger:(int64_t)a3
{
  __CFSet *set;
  void *v8;
  void *v9;

  set = self->_set;
  if (!set)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKIntegerSet.m"), 111, CFSTR("_set is nil"), v9);

    set = self->_set;
  }
  return CFSetContainsValue(set, (const void *)a3) != 0;
}

- (unint64_t)count
{
  __CFSet *set;
  void *v6;
  void *v7;

  set = self->_set;
  if (!set)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKIntegerSet.m"), 117, CFSTR("_set is nil"), v7);

    set = self->_set;
  }
  return CFSetGetCount(set);
}

- (unint64_t)hash
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __20__HKIntegerSet_hash__block_invoke;
  v4[3] = &unk_1E37EA1B0;
  v4[4] = &v5;
  -[HKIntegerSet enumerateIntegersUsingBlock:](self, "enumerateIntegersUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __20__HKIntegerSet_hash__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) ^= a2;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "count");
    if (v6 == -[HKIntegerSet count](self, "count"))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 1;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __24__HKIntegerSet_isEqual___block_invoke;
      v9[3] = &unk_1E37F5690;
      v10 = v5;
      v11 = &v12;
      -[HKIntegerSet enumerateIntegersUsingBlock:](self, "enumerateIntegersUsingBlock:", v9);
      v7 = *((_BYTE *)v13 + 24) != 0;

      _Block_object_dispose(&v12, 8);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __24__HKIntegerSet_isEqual___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsInteger:", a2);
  if ((result & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  __CFSet *set;
  HKIntegerSet *v5;
  void *v8;
  void *v9;

  set = self->_set;
  if (!set)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKIntegerSet.m"), 155, CFSTR("_set is nil"), v9);

    set = self->_set;
  }
  v5 = -[HKIntegerSet initWithCapacity:]([HKIntegerSet alloc], "initWithCapacity:", CFSetGetCount(set));
  if (v5)
    CopySet(self, v5);
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  __CFSet *set;
  HKMutableIntegerSet *v5;
  void *v8;
  void *v9;

  set = self->_set;
  if (!set)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKIntegerSet.m"), 169, CFSTR("_set is nil"), v9);

    set = self->_set;
  }
  v5 = -[HKMutableIntegerSet initWithCapacity:]([HKMutableIntegerSet alloc], "initWithCapacity:", CFSetGetCount(set));
  if (v5)
    CopySet(self, v5);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  size_t v5;
  const void **v6;
  const void **v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (!self->_set)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKIntegerSet.m"), 190, CFSTR("_set is nil"), v12);

  }
  v5 = -[HKIntegerSet count](self, "count");
  v6 = (const void **)malloc_type_calloc(v5, 8uLL, 0x100004000313F17uLL);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKIntegerSet.m"), 195, CFSTR("%@ falled to allocate space to encode %d items"), v10, v5);

    v5 = 0;
    goto LABEL_7;
  }
  v7 = v6;
  v8 = v13;
  if (v5)
  {
    CFSetGetValues(self->_set, v7);
    objc_msgSend(v13, "encodeArrayOfObjCType:count:at:", "q", v5, v7);
    free(v7);
LABEL_7:
    objc_msgSend(v13, "encodeInteger:forKey:", v5, CFSTR("count"));
    v8 = v13;
  }

}

- (HKIntegerSet)initWithCoder:(id)a3
{
  id v5;
  size_t v6;
  HKIntegerSet *v7;
  const void **v8;
  const void **v9;
  uint64_t i;
  HKIntegerSet *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("count"));
  v7 = -[HKIntegerSet initWithCapacity:](self, "initWithCapacity:", v6);
  if (!v7)
    goto LABEL_9;
  if (v6)
  {
    v8 = (const void **)malloc_type_calloc(v6, 8uLL, 0x100004000313F17uLL);
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v5, "decodeArrayOfObjCType:count:at:", "q", v6, v8);
      for (i = 0; i != v6; ++i)
        CFSetAddValue(v7->_set, v9[i]);
      free(v9);
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("HKIntegerSet.m"), 228, CFSTR("%@ falled to allocate space to decode %d items"), v13, v6);

LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
LABEL_7:
  v11 = v7;
LABEL_10:

  return v11;
}

@end
