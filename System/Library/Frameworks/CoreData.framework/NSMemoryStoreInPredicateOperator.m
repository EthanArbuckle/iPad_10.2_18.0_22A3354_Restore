@implementation NSMemoryStoreInPredicateOperator

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSMemoryStoreInPredicateOperator;
  -[NSMemoryStoreInPredicateOperator dealloc](&v3, sel_dealloc);
}

- (void)setContext:(id)a3
{
  NSManagedObjectContext *context;

  context = self->_context;
  if (context != a3)
  {

    self->_context = (NSManagedObjectContext *)a3;
  }
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  NSManagedObjectContext *context;
  id *v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  BOOL v23;
  BOOL v24;
  uint64_t v26;
  unint64_t v27;
  uint64_t *v28;
  id v29;
  char *v30;
  uint64_t v31;
  objc_super v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (a3 = (id)objc_msgSend(a3, "objectID")) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = objc_msgSend(a4, "count");
    v28 = &v26;
    if (v7 <= 1)
      v8 = 1;
    else
      v8 = v7;
    if (v7 >= 0x201)
      v9 = 1;
    else
      v9 = v8;
    v10 = (char *)&v26 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    v27 = v7;
    v29 = a3;
    if (v7 > 0x200)
      v10 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)&v26 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v8);
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
    v33 = 0u;
    v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v34;
      v30 = v10;
      do
      {
        v15 = 0;
        v31 = v13;
        v16 = &v10[8 * v13];
        do
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(a4);
          v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v17 = (void *)objc_msgSend(v17, "objectID");
          }
          context = self->_context;
          if (context)
          {
            v19 = (id *)*((_QWORD *)context->_additionalPrivateIvars + 1);
            if (v19)
            {
              v20 = objc_msgSend(*v19, "objectForKey:", v17);
              if (v20)
                v17 = (void *)v20;
            }
          }
          *(_QWORD *)&v16[8 * v15++] = v17;
        }
        while (v12 != v15);
        v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        v13 = v31 + v15;
        v10 = v30;
      }
      while (v12);
    }
    v21 = v27;
    if (v27)
    {
      v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v10, v27);
      v23 = v21 >= 0x201;
      a3 = v29;
      if (v23)
        NSZoneFree(0, v10);
    }
    else
    {
      v22 = (id)NSArray_EmptyArray;
      a3 = v29;
    }
    a4 = v22;
  }
  else
  {
    v22 = 0;
  }
  v32.receiver = self;
  v32.super_class = (Class)NSMemoryStoreInPredicateOperator;
  v24 = -[NSPredicateOperator performPrimitiveOperationUsingObject:andObject:](&v32, sel_performPrimitiveOperationUsingObject_andObject_, a3, a4);

  return v24;
}

@end
