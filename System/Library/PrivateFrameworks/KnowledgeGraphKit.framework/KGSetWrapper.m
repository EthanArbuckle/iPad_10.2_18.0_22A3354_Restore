@implementation KGSetWrapper

- (KGSetWrapper)initWithSet:(id)a3
{
  id v4;
  KGSetWrapper *v5;
  uint64_t v6;
  NSSet *set;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGSetWrapper;
  v5 = -[KGSetWrapper init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    set = v5->_set;
    v5->_set = (NSSet *)v6;

  }
  return v5;
}

- (KGSetWrapper)initWithArray:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  KGSetWrapper *v7;

  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithArray:", v5);

  v7 = -[KGSetWrapper initWithSet:](self, "initWithSet:", v6);
  return v7;
}

- (unint64_t)count
{
  return -[NSSet count](self->_set, "count");
}

- (BOOL)isEqual:(id)a3
{
  KGSetWrapper *v4;
  BOOL v5;

  v4 = (KGSetWrapper *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[NSSet isEqualToSet:](self->_set, "isEqualToSet:", v4->_set);
  }

  return v5;
}

- (unint64_t)hash
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_set;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 ^= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hash", (_QWORD)v9);
      }
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSSet)set
{
  return self->_set;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_set, 0);
}

@end
