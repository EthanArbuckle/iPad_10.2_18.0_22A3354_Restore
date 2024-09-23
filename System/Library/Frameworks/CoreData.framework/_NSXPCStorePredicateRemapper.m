@implementation _NSXPCStorePredicateRemapper

- (void)visitPredicateExpression:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(a3, "constantValue");
    if (v4)
    {
      v5 = v4;
      if ((objc_msgSend(v4, "isNSArray") & 1) != 0 || objc_msgSend(v5, "isNSSet"))
      {
        if (objc_msgSend(v5, "count"))
        {
          objc_opt_class();
          v11 = 0u;
          v12 = 0u;
          v13 = 0u;
          v14 = 0u;
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v6)
          {
            v7 = v6;
            v8 = *(_QWORD *)v12;
LABEL_8:
            v9 = 0;
            while (1)
            {
              if (*(_QWORD *)v12 != v8)
                objc_enumerationMutation(v5);
              if ((objc_opt_isKindOfClass() & 1) == 0)
                break;
              if (v7 == ++v9)
              {
                v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
                if (v7)
                  goto LABEL_8;
                goto LABEL_14;
              }
            }
          }
          else
          {
LABEL_14:
            v10 = (objc_class *)objc_opt_class();
            object_setClass(a3, v10);
          }
        }
      }
    }
  }
}

- (id)createPredicateForFetchFromPredicate:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v4, "acceptVisitor:flags:", self, 1);
  return v4;
}

+ (id)defaultInstance
{
  id result;

  result = (id)defaultInstance_di_80;
  if (!defaultInstance_di_80)
  {
    result = objc_alloc_init(_NSXPCStorePredicateRemapper);
    defaultInstance_di_80 = (uint64_t)result;
  }
  return result;
}

- (_NSXPCStorePredicateRemapper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSXPCStorePredicateRemapper;
  return -[_NSXPCStorePredicateRemapper init](&v3, sel_init);
}

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS____NSXPCStorePredicateRemapper;
  objc_msgSendSuper2(&v2, sel_initialize);
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_NSXPCStorePredicateRemapper;
  -[_NSXPCStorePredicateRemapper dealloc](&v2, sel_dealloc);
}

@end
