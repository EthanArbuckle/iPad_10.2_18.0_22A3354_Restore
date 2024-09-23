@implementation NSEnumerator

- (NSArray)allObjects
{
  NSArray *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = +[NSArray array](NSMutableArray, "array");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[NSEnumerator countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(self);
        -[NSArray addObject:](v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v5);
  }
  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t result;
  unint64_t v8;

  if (a3->var0 == -1)
    return 0;
  if (!a3->var0)
    a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_5;
  result = -[NSEnumerator nextObject](self, "nextObject");
  if (result)
  {
    a3->var1 = a4;
    *a4 = (id)result;
    v8 = a3->var0 + 1;
    result = 1;
  }
  else
  {
    v8 = -1;
  }
  a3->var0 = v8;
  return result;
}

- (id)nextObject
{
  objc_class *v3;

  v3 = __CFLookUpClass("NSEnumerator");
  __CFRequireConcreteImplementation(v3, (uint64_t)self);
}

@end
