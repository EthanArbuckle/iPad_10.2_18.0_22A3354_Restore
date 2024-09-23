@implementation HKIndexableObject

- (HKIndexableObject)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (id)indexableObjectWithObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:compoundIndex:", v4, 0);

  return v5;
}

+ (id)indexableObjectWithObject:(id)a3 index:(unsigned __int8)a4 error:(id *)a5
{
  unsigned int v6;
  id v8;
  void *v9;

  v6 = a4;
  v8 = a3;
  if ((v6 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("Attempt to create an indexable object with an index of %d (maximum allowed index is %ld)"), v6, 127);
    v9 = 0;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:compoundIndex:", v8, v6 | 0x80);
  }

  return v9;
}

+ (id)indexableObjectWithObject:(id)a3 compoundIndex:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:compoundIndex:", v6, a4);

  return v7;
}

- (HKIndexableObject)initWithObject:(id)a3 compoundIndex:(unint64_t)a4
{
  id v7;
  HKIndexableObject *v8;
  uint64_t v9;
  id object;
  void *v12;
  objc_super v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKIndexableObject.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

  }
  v13.receiver = self;
  v13.super_class = (Class)HKIndexableObject;
  v8 = -[HKIndexableObject init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    object = v8->_object;
    v8->_object = (id)v9;

    v8->_compoundIndex = a4;
  }

  return v8;
}

- (id)indexableObjectPoppingIndexWithError:(id *)a3
{
  void *v3;

  if ((self->_compoundIndex & 0x80) != 0)
  {
    v3 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithObject:compoundIndex:", self->_object, self->_compoundIndex >> 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Failed to create a new indexable object by popping index; no outermost index"));
    v3 = 0;
  }
  return v3;
}

- (id)indexableObjectCollectingPushingIndex:(unsigned __int8)a3 error:(id *)a4
{
  void *v4;

  if ((self->_compoundIndex & 0x8000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Failed to create a new indexable object by pushing index; already full"));
    v4 = 0;
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithObject:compoundIndex:", self->_object, a3 | 0x80u | (self->_compoundIndex << 8));
  }
  return v4;
}

- (unsigned)outermostIndex
{
  return self->_compoundIndex & 0x7F;
}

+ (id)indexableObjectsByApplyingOutermostIndex:(id)a3 expectedCount:(int64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  int64_t v9;
  id v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a3;
  if (objc_msgSend(v7, "count")
    && (objc_msgSend(v7, "lastObject"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "outermostIndex"),
        v8,
        v9 >= a4))
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v7, "lastObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hk_assignError:code:format:", a5, 3, CFSTR("Attempt to partition index with an expected count of %ld and a maximum index of %d"), a4, objc_msgSend(v10, "outermostIndex"));
    v18 = 0;
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = (void *)objc_msgSend(v7, "mutableCopy");
    if (a4 >= 1)
    {
      v12 = 0;
      while (2)
      {
        v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        while (objc_msgSend(v11, "count"))
        {
          objc_msgSend(v11, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "outermostIndex");

          if (v12 < v15)
            break;
          objc_msgSend(v11, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "indexableObjectPoppingIndexWithError:", a5);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {

            v18 = 0;
            goto LABEL_13;
          }
          objc_msgSend(v13, "addObject:", v17);
          objc_msgSend(v11, "removeObjectAtIndex:", 0);

        }
        objc_msgSend(v10, "addObject:", v13);

        if (++v12 != a4)
          continue;
        break;
      }
    }
    v18 = (void *)objc_msgSend(v10, "copy");
LABEL_13:

  }
  return v18;
}

- (id)object
{
  return self->_object;
}

- (unint64_t)compoundIndex
{
  return self->_compoundIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
}

@end
