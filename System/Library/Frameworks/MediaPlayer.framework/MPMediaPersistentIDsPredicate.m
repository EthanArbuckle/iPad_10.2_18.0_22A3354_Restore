@implementation MPMediaPersistentIDsPredicate

- (void)dealloc
{
  int64_t *persistentIDs;
  objc_super v4;

  persistentIDs = self->_persistentIDs;
  if (persistentIDs)
    free(persistentIDs);
  v4.receiver = self;
  v4.super_class = (Class)MPMediaPersistentIDsPredicate;
  -[MPMediaPersistentIDsPredicate dealloc](&v4, sel_dealloc);
}

- (MPMediaPersistentIDsPredicate)initWithCoder:(id)a3
{
  id v4;
  MPMediaPersistentIDsPredicate *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MPMediaPersistentIDsPredicate;
  v5 = -[MPMediaPersistentIDsPredicate init](&v19, sel_init);
  if (v5)
  {
    v5->_shouldContain = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldContain"));
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("persistentIDs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSArray() && objc_msgSend(v6, "count"))
    {
      v5->_persistentIDs = (int64_t *)malloc_type_malloc(8 * objc_msgSend(v6, "count"), 0x100004000313F17uLL);
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = 0;
        v11 = *(_QWORD *)v16;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v7);
            v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
            if (_NSIsNSNumber())
              v5->_persistentIDs[v10++] = objc_msgSend(v13, "longLongValue", (_QWORD)v15);
            ++v12;
          }
          while (v9 != v12);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        }
        while (v9);
      }

    }
    v5->_count = objc_msgSend(v6, "count", (_QWORD)v15);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeBool:forKey:", self->_shouldContain, CFSTR("shouldContain"));
  if (self->_count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_count)
    {
      v5 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_persistentIDs[v5]);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v6);

        ++v5;
      }
      while (v5 < self->_count);
    }
    objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("persistentIDs"));

  }
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_shouldContain)
    v5 = &stru_1E3163D10;
  else
    v5 = CFSTR("NOT");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> should%@ contain %lu persistent IDs"), v4, self, v5, self->_count);
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unint64_t count;
  BOOL v6;
  objc_super v8;

  v4 = (unsigned __int8 *)a3;
  v8.receiver = self;
  v8.super_class = (Class)MPMediaPersistentIDsPredicate;
  v6 = -[MPMediaPersistentIDsPredicate isEqual:](&v8, sel_isEqual_, v4)
    && (count = self->_count, count == *((_QWORD *)v4 + 3))
    && self->_shouldContain == v4[16]
    && memcmp(self->_persistentIDs, *((const void **)v4 + 1), 8 * count) == 0;

  return v6;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPMediaPersistentIDsPredicate;
  return self->_count ^ -[MPMediaPersistentIDsPredicate hash](&v3, sel_hash) ^ self->_shouldContain;
}

- (MPMediaPersistentIDsPredicate)initWithProtobufferDecodableObject:(id)a3 library:(id)a4
{
  id v6;
  MPMediaPersistentIDsPredicate *v7;
  void *v8;
  uint64_t v9;
  int64_t *v10;
  void *v12;
  objc_super v13;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaQuery.m"), 1838, CFSTR("Cannot decode object of type %@"), objc_opt_class());

  }
  v13.receiver = self;
  v13.super_class = (Class)MPMediaPersistentIDsPredicate;
  v7 = -[MPMediaPersistentIDsPredicate init](&v13, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "persistentIDsPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_shouldContain = objc_msgSend(v8, "shouldContain");
    v9 = objc_msgSend(v8, "persistentIDsCount");
    v7->_count = v9;
    v10 = (int64_t *)malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
    v7->_persistentIDs = v10;
    memcpy(v10, (const void *)objc_msgSend(v8, "persistentIDs"), 8 * v7->_count);

  }
  return v7;
}

- (id)protobufferEncodableObjectFromLibrary:(id)a3
{
  MPPPersistentIDsPredicate *v4;
  uint64_t v5;
  unsigned int v6;
  MPPMediaPredicate *v8;

  v4 = objc_alloc_init(MPPPersistentIDsPredicate);
  -[MPPPersistentIDsPredicate setShouldContain:](v4, "setShouldContain:", self->_shouldContain);
  if (self->_count)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      -[MPPPersistentIDsPredicate addPersistentIDs:](v4, "addPersistentIDs:", self->_persistentIDs[v5]);
      v5 = v6;
    }
    while (self->_count > v6++);
  }
  v8 = objc_alloc_init(MPPMediaPredicate);
  -[MPPMediaPredicate setType:](v8, "setType:", 4);
  -[MPPMediaPredicate setPersistentIDsPredicate:](v8, "setPersistentIDsPredicate:", v4);

  return v8;
}

- (unint64_t)count
{
  return self->_count;
}

- (const)persistentIDs
{
  return self->_persistentIDs;
}

- (BOOL)shouldContain
{
  return self->_shouldContain;
}

+ (id)predicateWithPersistentIDs:(const int64_t *)a3 count:(unint64_t)a4 shouldContain:(BOOL)a5
{
  MPMediaPersistentIDsPredicate *v8;
  int64_t *v9;

  v8 = objc_alloc_init(MPMediaPersistentIDsPredicate);
  v8->_shouldContain = a5;
  if (a4)
  {
    v9 = (int64_t *)malloc_type_malloc(8 * a4, 0x29F418DBuLL);
    v8->_persistentIDs = v9;
    memcpy(v9, a3, 8 * a4);
    v8->_count = a4;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_ML3PredicateForEntityClass:(Class)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D51290], "predicateWithPersistentIDs:count:shouldContain:", -[MPMediaPersistentIDsPredicate persistentIDs](self, "persistentIDs", a3), -[MPMediaPersistentIDsPredicate count](self, "count"), -[MPMediaPersistentIDsPredicate shouldContain](self, "shouldContain"));
}

- (id)ML3PredicateForTrack
{
  return -[MPMediaPersistentIDsPredicate _ML3PredicateForEntityClass:](self, "_ML3PredicateForEntityClass:", objc_opt_class());
}

- (id)ML3PredicateForContainer
{
  return -[MPMediaPersistentIDsPredicate _ML3PredicateForEntityClass:](self, "_ML3PredicateForEntityClass:", objc_opt_class());
}

@end
