@implementation PFUbiquityKnowledgeVector

- (PFUbiquityKnowledgeVector)init
{
  PFUbiquityKnowledgeVector *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityKnowledgeVector;
  result = -[PFUbiquityKnowledgeVector init](&v3, sel_init);
  if (result)
  {
    result->_storeKVDict = 0;
    result->_hash = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (PFUbiquityKnowledgeVector)initWithKnowledgeVectorString:(id)a3
{
  PFUbiquityKnowledgeVector *v4;
  NSDictionary *v5;

  v4 = -[PFUbiquityKnowledgeVector init](self, "init");
  if (v4)
  {
    v5 = +[PFUbiquityKnowledgeVector createKnowledgeVectorDictionaryFromString:](PFUbiquityKnowledgeVector, "createKnowledgeVectorDictionaryFromString:", a3);
    v4->_kv = v5;
    if (v5)
    {
      if (!-[NSDictionary count](v5, "count")
        && objc_msgSend(a3, "length")
        && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Got empty knowledge vector from string: %@"), "-[PFUbiquityKnowledgeVector initWithKnowledgeVectorString:]", 93, a3);
      }
      -[PFUbiquityKnowledgeVector _updateHash](v4, "_updateHash");
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unable to create knowledge vector from string: %@"), "-[PFUbiquityKnowledgeVector initWithKnowledgeVectorString:]", 89, a3);

      return 0;
    }
  }
  return v4;
}

- (PFUbiquityKnowledgeVector)initWithKnowledgeVectorDictionary:(id)a3
{
  PFUbiquityKnowledgeVector *v4;

  v4 = -[PFUbiquityKnowledgeVector init](self, "init");
  if (v4)
  {
    v4->_kv = (NSDictionary *)a3;
    -[PFUbiquityKnowledgeVector _updateHash](v4, "_updateHash");
  }
  return v4;
}

- (PFUbiquityKnowledgeVector)initWithStoreKnowledgeVectorDictionary:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PFUbiquityKnowledgeVector *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(a3);
        objc_msgSend(v5, "setObject:forKey:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9)), "objectForKey:", CFSTR("YTRANSACTIONNUMBER")), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  v10 = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorDictionary:](self, "initWithKnowledgeVectorDictionary:", v5);

  v10->_storeKVDict = (NSDictionary *)a3;
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  self->_kv = 0;
  self->_storeKVDict = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityKnowledgeVector;
  -[PFUbiquityKnowledgeVector dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  PFUbiquityKnowledgeVector *v4;
  NSDictionary *storeKVDict;
  NSDictionary *kv;
  unint64_t hash;
  PFUbiquityKnowledgeVector *v8;

  v4 = +[PFUbiquityKnowledgeVector allocWithZone:](PFUbiquityKnowledgeVector, "allocWithZone:", a3);
  if (!v4)
    return 0;
  kv = self->_kv;
  storeKVDict = self->_storeKVDict;
  hash = self->_hash;
  v8 = -[PFUbiquityKnowledgeVector init](v4, "init");
  if (v8)
  {
    v8->_kv = kv;
    v8->_storeKVDict = storeKVDict;
    v8->_hash = hash;
  }
  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  objc_super v6;

  v3 = -[PFUbiquityKnowledgeVector createKnowledgeVectorString]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)PFUbiquityKnowledgeVector;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), -[PFUbiquityKnowledgeVector description](&v6, sel_description), v3);

  return v4;
}

- (id)createKnowledgeVectorString
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *context;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  context = (void *)MEMORY[0x18D76B4E4]();
  v3 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", 0);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v9);
        if ((objc_msgSend(v4, "isEqualToNumber:", v10) & 1) == 0)
        {
          if (objc_msgSend(v2, "length"))
            objc_msgSend(v2, "appendString:", CFSTR(":"));
          objc_msgSend(v2, "appendString:", v9);
          objc_msgSend(v2, "appendString:", CFSTR(":"));
          objc_msgSend(v2, "appendString:", objc_msgSend(v10, "description"));
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_autoreleasePoolPop(context);
  return v2;
}

- (PFUbiquityKnowledgeVector)initWithCoder:(id)a3
{
  uint64_t v5;

  v5 = objc_opt_class();
  return -[PFUbiquityKnowledgeVector initWithKnowledgeVectorDictionary:](self, "initWithKnowledgeVectorDictionary:", objc_msgSend(a3, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v5, objc_opt_class(), CFSTR("kvDict")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_kv, CFSTR("kvDict"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)compare:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v23;
  const __CFString *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    v23 = *MEMORY[0x1E0C99778];
    if (a3)
      v24 = (const __CFString *)a3;
    else
      v24 = CFSTR("nil");
    v30 = CFSTR("offendingObject");
    v31[0] = v24;
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v23, CFSTR("Cannot invoke compare with an object that is not a knowledge vector"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1)));
  }
  v6 = -[PFUbiquityKnowledgeVector createSetOfAllPeerIDsWithOtherVector:](self, "createSetOfAllPeerIDsWithOtherVector:", a3);
  v7 = (void *)objc_msgSend(v6, "allObjects");

  v8 = (void *)objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13);
        if (self)
          v15 = -[NSDictionary objectForKey:](self->_kv, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13));
        else
          v15 = 0;
        if (v15)
          v16 = v15;
        else
          v16 = v9;
        if (a3)
          v17 = objc_msgSend(*((id *)a3 + 1), "objectForKey:", v14);
        else
          v17 = 0;
        if (v17)
          v18 = (void *)v17;
        else
          v18 = v9;
        v19 = objc_msgSend(v16, "compare:", v18);
        if (v19)
        {
          v21 = v19;
          goto LABEL_25;
        }
        ++v13;
      }
      while (v11 != v13);
      v20 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v11 = v20;
    }
    while (v20);
  }
  v21 = 0;
LABEL_25:

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t hash;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  hash = self->_hash;
  if (hash != objc_msgSend(a3, "hash"))
    return 0;
  v6 = -[PFUbiquityKnowledgeVector createSetOfAllPeerIDsWithOtherVector:](self, "createSetOfAllPeerIDsWithOtherVector:", a3);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
LABEL_7:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
      v12 = -[NSDictionary objectForKey:](self->_kv, "objectForKey:", v11);
      v13 = (void *)objc_msgSend(*((id *)a3 + 1), "objectForKey:", v11);
      v14 = v13;
      if (v12)
      {
        if (v13)
          goto LABEL_16;
        if (objc_msgSend(v12, "integerValue"))
        {
          v15 = 1;
          goto LABEL_17;
        }
      }
      else if (v13 && objc_msgSend(v13, "integerValue"))
      {
LABEL_16:
        v15 = 0;
LABEL_17:
        v16 = 0;
        if (!v12)
          v15 = 0;
        if (v14)
          v17 = v12 == 0;
        else
          v17 = 0;
        if (v17 || (v15 & 1) != 0)
          goto LABEL_31;
        if (!objc_msgSend(v12, "isEqualToNumber:", v14))
        {
          v16 = 0;
          goto LABEL_31;
        }
      }
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v8)
          goto LABEL_7;
        break;
      }
    }
  }
  v16 = 1;
LABEL_31:

  return v16;
}

- (unint64_t)length
{
  return -[NSDictionary count](self->_kv, "count");
}

- (void)_updateHash
{
  id v3;

  v3 = -[PFUbiquityKnowledgeVector createKnowledgeVectorString]((uint64_t)self);
  self->_hash = +[_PFRoutines _generateUbiquityHashForPath:]((uint64_t)_PFRoutines, v3);

}

- (id)isDescendantOfKnowledgeVector:(id *)result
{
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
    v5 = (void *)objc_msgSend(v3, "createSetOfAllPeerIDsWithOtherVector:", a2);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
          v12 = objc_msgSend(v3[1], "objectForKey:", v11);
          if (v12)
            v13 = (void *)v12;
          else
            v13 = v4;
          if (a2)
            v14 = objc_msgSend(*(id *)(a2 + 8), "objectForKey:", v11);
          else
            v14 = 0;
          if (v14)
            v15 = (void *)v14;
          else
            v15 = v4;
          v16 = objc_msgSend(v13, "compare:", v15);
          if (v16 == 1)
          {
            v8 = 1;
          }
          else if (v16 == -1)
          {
            v18 = 0;
            goto LABEL_26;
          }
          ++v10;
        }
        while (v7 != v10);
        v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v7 = v17;
      }
      while (v17);
    }
    else
    {
      v8 = 0;
    }
    v18 = 1;
LABEL_26:

    return (id *)(v8 & v18);
  }
  return result;
}

- (id)isAncestorOfKnowledgeVector:(id *)result
{
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
    v5 = (void *)objc_msgSend(v3, "createSetOfAllPeerIDsWithOtherVector:", a2);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
          v12 = objc_msgSend(v3[1], "objectForKey:", v11);
          if (v12)
            v13 = (void *)v12;
          else
            v13 = v4;
          if (a2)
            v14 = objc_msgSend(*(id *)(a2 + 8), "objectForKey:", v11);
          else
            v14 = 0;
          if (v14)
            v15 = (void *)v14;
          else
            v15 = v4;
          v16 = objc_msgSend(v13, "compare:", v15);
          if (v16 == -1)
          {
            v8 = 1;
          }
          else if (v16 == 1)
          {
            v18 = 0;
            goto LABEL_26;
          }
          ++v10;
        }
        while (v7 != v10);
        v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v7 = v17;
      }
      while (v17);
    }
    else
    {
      v8 = 0;
    }
    v18 = 1;
LABEL_26:

    return (id *)(v8 & v18);
  }
  return result;
}

- (uint64_t)isZeroVector
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v1 = (void *)objc_msgSend(*(id *)(result + 8), "allValues", 0);
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v7;
      while (2)
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(v1);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5), "integerValue"))
            return 0;
          ++v5;
        }
        while (v3 != v5);
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
        if (v3)
          continue;
        break;
      }
    }
    return 1;
  }
  return result;
}

- (uint64_t)updateWithKnowledgeVector:(uint64_t)result
{
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (id *)result;
    v4 = (void *)objc_msgSend(*(id *)(result + 8), "mutableCopy");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    if (a2)
      v5 = (void *)objc_msgSend(*(id *)(a2 + 8), "allKeys", (_QWORD)v15);
    else
      v5 = 0;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
          v11 = objc_msgSend(v3[1], "objectForKey:", v10, (_QWORD)v15);
          v12 = (void *)v11;
          if (a2)
          {
            v13 = objc_msgSend(*(id *)(a2 + 8), "objectForKey:", v10);
            if (v12)
              goto LABEL_11;
          }
          else
          {
            v13 = 0;
            if (v11)
            {
LABEL_11:
              if (objc_msgSend(v12, "compare:", v13) != -1)
                goto LABEL_13;
            }
          }
          objc_msgSend(v4, "setObject:forKey:", v13, v10);
LABEL_13:
          ++v9;
        }
        while (v7 != v9);
        v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v7 = v14;
      }
      while (v14);
    }

    v3[1] = v4;
    return objc_msgSend(v3, "_updateHash");
  }
  return result;
}

- (uint64_t)decrementToMinimumWithKnowledgeVector:(uint64_t)result
{
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (id *)result;
    v4 = (void *)objc_msgSend(*(id *)(result + 8), "mutableCopy");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    if (a2)
      v5 = (void *)objc_msgSend(*(id *)(a2 + 8), "allKeys", (_QWORD)v15);
    else
      v5 = 0;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
          v11 = objc_msgSend(v3[1], "objectForKey:", v10, (_QWORD)v15);
          v12 = (void *)v11;
          if (a2)
          {
            v13 = objc_msgSend(*(id *)(a2 + 8), "objectForKey:", v10);
            if (v12)
              goto LABEL_11;
          }
          else
          {
            v13 = 0;
            if (v11)
            {
LABEL_11:
              if (objc_msgSend(v12, "compare:", v13) != 1)
                goto LABEL_13;
            }
          }
          objc_msgSend(v4, "setObject:forKey:", v13, v10);
LABEL_13:
          ++v9;
        }
        while (v7 != v9);
        v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v7 = v14;
      }
      while (v14);
    }

    v3[1] = v4;
    return objc_msgSend(v3, "_updateHash");
  }
  return result;
}

- (id)createSetOfAllPeerIDsWithOtherVector:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", self, a3, 0);
  v4 = +[PFUbiquityKnowledgeVector createSetOfAllPeerIDsInKnowledgeVectors:]((uint64_t)PFUbiquityKnowledgeVector, v3);

  return v4;
}

+ (id)createSetOfAllPeerIDsInKnowledgeVectors:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  objc_opt_self();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(a2);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        if (v8)
          v9 = objc_msgSend(*(id *)(v8 + 8), "allKeys");
        else
          v9 = 0;
        objc_msgSend(v3, "addObjectsFromArray:", v9);
        ++v7;
      }
      while (v5 != v7);
      v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v5 = v10;
    }
    while (v10);
  }
  return v3;
}

- (id)newKnowledgeVectorByAddingKnowledgeVector:(uint64_t)a1
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  PFUbiquityKnowledgeVector *v16;
  void *v17;
  uint64_t v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!a2)
    return (id)a1;
  v3 = (void *)objc_msgSend((id)a1, "createSetOfAllPeerIDsWithOtherVector:", a2);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v6)
    goto LABEL_20;
  v7 = v6;
  v8 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v22 != v8)
        objc_enumerationMutation(v3);
      v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
      v11 = objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v10);
      if (v11)
        v12 = (void *)v11;
      else
        v12 = v5;
      v13 = objc_msgSend(*(id *)(a2 + 8), "objectForKey:", v10);
      if (v13)
        v14 = (void *)v13;
      else
        v14 = v5;
      v15 = objc_msgSend(v12, "compare:", v14);
      if (v15 >= 2)
      {
        if (v15 != -1)
          continue;
        v12 = v14;
      }
      objc_msgSend(v4, "setObject:forKey:", v12, v10);
    }
    v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v7);
LABEL_20:

  v16 = [PFUbiquityKnowledgeVector alloc];
  if (v16)
  {
    v17 = *(void **)(a1 + 16);
    v18 = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorDictionary:](v16, "initWithKnowledgeVectorDictionary:", v4);
    if (v18)
      *(_QWORD *)(v18 + 16) = v17;
  }
  else
  {
    v18 = 0;
  }

  return (id)v18;
}

- (id)newKnowledgeVectorBySubtractingVector:(uint64_t)a1
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  PFUbiquityKnowledgeVector *v19;
  void *v20;
  uint64_t v21;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (a2)
  {
    v3 = (void *)objc_msgSend((id)a1, "createSetOfAllPeerIDsWithOtherVector:", a2);
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v12 = objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v11);
          if (v12)
            v13 = (void *)v12;
          else
            v13 = v5;
          v14 = objc_msgSend(*(id *)(a2 + 8), "objectForKey:", v11);
          if (v14)
            v15 = (void *)v14;
          else
            v15 = v5;
          v16 = objc_msgSend(v13, "integerValue");
          v17 = v16 - objc_msgSend(v15, "integerValue");
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v17);
          objc_msgSend(v4, "setObject:forKey:", v18, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v8);
    }

    v19 = [PFUbiquityKnowledgeVector alloc];
    if (v19)
    {
      v20 = *(void **)(a1 + 16);
      v21 = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorDictionary:](v19, "initWithKnowledgeVectorDictionary:", v4);
      if (v21)
        *(_QWORD *)(v21 + 16) = v20;
    }
    else
    {
      v21 = 0;
    }

    return (id)v21;
  }
  return (id)a1;
}

- (uint64_t)createAncestorVectorForConflictingVector:(void *)a1
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  PFUbiquityKnowledgeVector *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v2 = (uint64_t)a1;
  v27 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return v2;
  v4 = (void *)objc_msgSend(a1, "createSetOfAllPeerIDsWithOtherVector:", a2);
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v7)
    goto LABEL_23;
  v8 = v7;
  v9 = *(_QWORD *)v23;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10);
      v12 = objc_msgSend(*(id *)(v2 + 8), "objectForKey:", v11);
      if (v12)
        v13 = (void *)v12;
      else
        v13 = v5;
      if (a2)
        v14 = objc_msgSend(*(id *)(a2 + 8), "objectForKey:", v11);
      else
        v14 = 0;
      if (v14)
        v15 = (void *)v14;
      else
        v15 = v5;
      v16 = objc_msgSend(v13, "compare:", v15);
      if (v16 >= 2)
      {
        if (v16 != -1)
          goto LABEL_19;
        v15 = v13;
      }
      objc_msgSend(v21, "setObject:forKey:", v15, v11);
LABEL_19:
      ++v10;
    }
    while (v8 != v10);
    v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    v8 = v17;
  }
  while (v17);
LABEL_23:

  v18 = [PFUbiquityKnowledgeVector alloc];
  if (v18)
  {
    v19 = *(void **)(v2 + 16);
    v2 = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorDictionary:](v18, "initWithKnowledgeVectorDictionary:", v21);
    if (v2)
      *(_QWORD *)(v2 + 16) = v19;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (uint64_t)newKnowledgeVectorByDecrementingPeerWithID:(uint64_t)a1
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  PFUbiquityKnowledgeVector *v9;
  void *v10;

  v2 = a1;
  if (a1)
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", a2);
    v5 = objc_msgSend(v4, "integerValue");
    if (v5)
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v5 - 1);
    else
      v6 = v4;
    v7 = v6;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", *(_QWORD *)(v2 + 8));
    objc_msgSend(v8, "setObject:forKey:", v7, a2);

    v9 = [PFUbiquityKnowledgeVector alloc];
    if (v9)
    {
      v10 = *(void **)(v2 + 16);
      v2 = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorDictionary:](v9, "initWithKnowledgeVectorDictionary:", v8);
      if (v2)
        *(_QWORD *)(v2 + 16) = v10;
    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (uint64_t)newKnowledgeVectorByIncrementingPeerWithID:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;
  PFUbiquityKnowledgeVector *v7;
  void *v8;

  v2 = a1;
  if (a1)
  {
    v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", a2), "integerValue");
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v4 + 1);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", *(_QWORD *)(v2 + 8));
    objc_msgSend(v6, "setObject:forKey:", v5, a2);

    v7 = [PFUbiquityKnowledgeVector alloc];
    if (v7)
    {
      v8 = *(void **)(v2 + 16);
      v2 = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorDictionary:](v7, "initWithKnowledgeVectorDictionary:", v6);
      if (v2)
        *(_QWORD *)(v2 + 16) = v8;
    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (uint64_t)conflictsWithKnowledgeVector:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a1 || (-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](a2, a1) & 1) != 0)
    return 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", objc_msgSend(*(id *)(a1 + 8), "allKeys"));
  if (a2)
    v6 = objc_msgSend(a2[1], "allKeys");
  else
    v6 = 0;
  objc_msgSend(v5, "addObjectsFromArray:", v6);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v5);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
        v14 = objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v13);
        if (v14)
          v15 = (void *)v14;
        else
          v15 = v7;
        if (a2)
          v16 = objc_msgSend(a2[1], "objectForKey:", v13);
        else
          v16 = 0;
        if (v16)
          v17 = (void *)v16;
        else
          v17 = v7;
        if (objc_msgSend(v15, "compare:", v17))
          ++v10;
        if (v10 > 1)
        {
          v4 = 1;
          goto LABEL_28;
        }
        ++v12;
      }
      while (v9 != v12);
      v18 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v9 = v18;
    }
    while (v18);
  }
  v4 = 0;
LABEL_28:

  return v4;
}

- (void)createStoreKnowledgeVectorDictionary
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = *(void **)(a1 + 16);
  if (v2)
    v3 = objc_msgSend(v2, "mutableCopy");
  else
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
  v4 = (void *)v3;
  v5 = objc_alloc(MEMORY[0x1E0C99E20]);
  v6 = objc_msgSend(*(id *)(a1 + 16), "allKeys");
  if (v6)
    v7 = v6;
  else
    v7 = NSArray_EmptyArray;
  v8 = (void *)objc_msgSend(v5, "initWithArray:", v7);
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 8), "allKeys"));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v14 = (void *)objc_msgSend(*(id *)(a1 + 16), "objectForKey:", v13);
        if (v14)
        {
          v15 = (id)objc_msgSend(v14, "mutableCopy");
          objc_msgSend(v15, "setObject:forKey:", objc_msgSend(v15, "objectForKey:", CFSTR("YTRANSACTIONNUMBER")), CFSTR("OLDYTRANSACTIONNUMBER"));
        }
        else
        {
          v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        }
        v16 = objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v13);
        if (v16)
          objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("YTRANSACTIONNUMBER"));
        objc_msgSend(v4, "setObject:forKey:", v15, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v4;
}

+ (id)createKnowledgeVectorDictionaryFromString:(id)a3
{
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"));
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = (void *)objc_msgSend(v3, "objectAtIndex:", v5);
      if ((v5 & 1) != 0)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", objc_msgSend(v7, "integerValue"));
        objc_msgSend(v4, "setObject:forKey:", v8, v6);

      }
      else
      {
        v6 = v7;
      }
      ++v5;
    }
    while (v5 < objc_msgSend(v3, "count"));
  }
  return v4;
}

- (unint64_t)hash
{
  return self->_hash;
}

@end
