@implementation NSConcreteSetChanges

- (unint64_t)count
{
  if (self->_changes)
    -[NSConcreteSetChanges _fault](self, "_fault");
  return -[NSSet count](self->_backing, "count");
}

- (id)member:(id)a3
{
  if (self->_changes)
    -[NSConcreteSetChanges _fault](self, "_fault");
  return -[NSSet member:](self->_backing, "member:", a3);
}

- (id)objectEnumerator
{
  if (self->_changes)
    -[NSConcreteSetChanges _fault](self, "_fault");
  return -[NSSet objectEnumerator](self->_backing, "objectEnumerator");
}

- (NSConcreteSetChanges)init
{
  return -[NSConcreteSetChanges initWithSet:](self, "initWithSet:", objc_msgSend(MEMORY[0x1E0C99E60], "set"));
}

- (NSConcreteSetChanges)initWithCapacity:(unint64_t)a3
{
  return -[NSConcreteSetChanges initWithSet:](self, "initWithSet:", objc_msgSend(MEMORY[0x1E0C99E60], "set", a3));
}

- (NSConcreteSetChanges)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  return -[NSConcreteSetChanges initWithSet:](self, "initWithSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", a3, a4));
}

- (NSConcreteSetChanges)initWithSet:(id)a3
{
  NSConcreteSetChanges *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSConcreteSetChanges;
  v4 = -[NSConcreteSetChanges init](&v6, sel_init);
  if (v4)
    v4->_backing = (NSSet *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)_willChange
{
  if (!self->_changes)
    self->_changes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
}

- (void)addChange:(id)a3
{
  -[NSConcreteSetChanges _willChange](self, "_willChange");
  -[NSConcreteSetChanges willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("changeCount"));
  -[NSMutableArray addObject:](self->_changes, "addObject:", a3);
  -[NSConcreteSetChanges didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("changeCount"));
}

- (void)addObjectsFromArray:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        -[NSSetChanges addObject:](self, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (self->_changes)
    -[NSConcreteSetChanges _fault](self, "_fault");
  return -[NSSet countByEnumeratingWithState:objects:count:](self->_backing, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void)intersectSet:(id)a3
{
  NSSet *backing;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSSetChange *v11;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NSConcreteSetChanges _willChange](self, "_willChange");
  if (self->_changes)
    -[NSConcreteSetChanges _fault](self, "_fault");
  backing = self->_backing;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](backing, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(backing);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!objc_msgSend(a3, "member:", v10))
        {
          v11 = -[NSSetChange initWithType:object:]([NSSetChange alloc], "initWithType:object:", 3, v10);
          -[NSConcreteSetChanges addChange:](self, "addChange:", v11);

        }
      }
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](backing, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v7);
  }
}

- (void)setSet:(id)a3
{
  -[NSConcreteSetChanges removeAllObjects](self, "removeAllObjects");
  -[NSConcreteSetChanges unionSet:](self, "unionSet:", a3);
}

- (void)minusSet:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSSetChange *v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[NSConcreteSetChanges _willChange](self, "_willChange");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = -[NSSetChange initWithType:object:]([NSSetChange alloc], "initWithType:object:", 3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        -[NSConcreteSetChanges addChange:](self, "addChange:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
}

- (void)removeAllObjects
{
  if (self->_changes)
    -[NSConcreteSetChanges _fault](self, "_fault");
  -[NSConcreteSetChanges minusSet:](self, "minusSet:", self->_backing);
}

- (void)unionSet:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSSetChange *v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[NSConcreteSetChanges _willChange](self, "_willChange");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = -[NSSetChange initWithType:object:]([NSSetChange alloc], "initWithType:object:", 2, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        -[NSConcreteSetChanges addChange:](self, "addChange:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
}

- (void)filterObjectsWithTest:(id)a3
{
  NSSet *backing;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  if (self->_changes)
    -[NSConcreteSetChanges _fault](self, "_fault");
  v11 = 0;
  backing = self->_backing;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](backing, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(backing);
      v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
      if (((*((uint64_t (**)(id, uint64_t, char *))a3 + 2))(a3, v10, &v11) & 1) == 0)
        -[NSSetChanges removeObject:](self, "removeObject:", v10);
      if (v11)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSSet countByEnumeratingWithState:objects:count:](backing, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
        if (v7)
          goto LABEL_5;
        return;
      }
    }
  }
}

- (void)transformObjectsWithBlock:(id)a3
{
  NSSet *backing;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  if (self->_changes)
    -[NSConcreteSetChanges _fault](self, "_fault");
  v13 = 0;
  backing = self->_backing;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](backing, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(backing);
      v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
      v11 = (*((uint64_t (**)(id, uint64_t, char *))a3 + 2))(a3, v10, &v13);
      if (v11 != v10)
      {
        v12 = v11;
        -[NSSetChanges removeObject:](self, "removeObject:", v10);
        -[NSSetChanges addObject:](self, "addObject:", v12);
      }
      if (v13)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSSet countByEnumeratingWithState:objects:count:](backing, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
        if (v7)
          goto LABEL_5;
        return;
      }
    }
  }
}

- (unint64_t)changeCount
{
  return -[NSMutableArray count](self->_changes, "count");
}

- (void)enumerateChangesUsingBlock:(id)a3
{
  NSMutableArray *changes;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  changes = self->_changes;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](changes, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(changes);
      (*((void (**)(id, _QWORD, char *))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), &v9);
      if (v9)
        break;
      if (v6 == ++v8)
      {
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](changes, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
        if (v6)
          goto LABEL_3;
        return;
      }
    }
  }
}

- (void)enumerateChanges:(unint64_t)a3 usingBlock:(id)a4
{
  NSMutableArray *changes;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  changes = self->_changes;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](changes, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(changes);
      v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
      if (objc_msgSend(v11, "changeType") == a3)
        (*((void (**)(id, void *, char *))a4 + 2))(a4, v11, &v12);
      if (v12)
        break;
      if (v8 == ++v10)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](changes, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
        if (v8)
          goto LABEL_3;
        return;
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSConcreteSetChanges *v4;

  v4 = -[NSConcreteSetChanges initWithSet:]([NSConcreteSetChanges alloc], "initWithSet:", self->_backing);
  v4->_changes = (NSMutableArray *)-[NSMutableArray mutableCopy](self->_changes, "mutableCopy");
  return v4;
}

- (void)_fault
{
  NSSet *backing;

  if (self->_changes)
  {
    if (!self->_backingIsMutable)
    {
      backing = self->_backing;
      self->_backing = (NSSet *)-[NSSet mutableCopy](backing, "mutableCopy");

      self->_backingIsMutable = 1;
    }
    -[NSSetChanges applyChangesToSet:](self, "applyChangesToSet:", self->_backing);
  }
}

- (id)description
{
  NSMutableString *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = -[NSString initWithFormat:]([NSMutableString alloc], "initWithFormat:", CFSTR("NSSetChanges(%p) with base %@, and changes:"), self, self->_backing);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__NSConcreteSetChanges_description__block_invoke;
  v5[3] = &unk_1E0F51078;
  v5[4] = v3;
  -[NSConcreteSetChanges enumerateChangesUsingBlock:](self, "enumerateChangesUsingBlock:", v5);
  return v3;
}

uint64_t __35__NSConcreteSetChanges_description__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  const __CFString *v4;

  v3 = *(void **)(a1 + 32);
  if (objc_msgSend(a2, "changeType") == 2)
    v4 = CFSTR("added");
  else
    v4 = CFSTR("removed");
  return objc_msgSend(v3, "appendFormat:", CFSTR("\n\t%@ %@"), v4, objc_msgSend(a2, "value"));
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSConcreteSetChanges;
  -[NSConcreteSetChanges dealloc](&v3, sel_dealloc);
}

@end
