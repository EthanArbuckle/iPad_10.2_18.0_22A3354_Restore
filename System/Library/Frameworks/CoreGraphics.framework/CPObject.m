@implementation CPObject

- (CPObject)init
{
  CPObject *v2;
  NSMutableArray *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPObject;
  v2 = -[CPObject init](&v5, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->document = 0;
    v2->page = 0;
    v2->children = v3;
  }
  return v2;
}

- (id)initSuper
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPObject;
  return -[CPObject init](&v3, sel_init);
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  objc_super v5;

  v3 = -[NSMutableArray count](self->children, "count");
  if (v3)
  {
    v4 = 0;
    do
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v4++), "setParent:", 0);
    while (v3 != v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)CPObject;
  -[CPObject dealloc](&v5, sel_dealloc);
}

- (void)disposeDescendants
{
  uint64_t v3;
  uint64_t i;
  void *v5;

  v3 = -[NSMutableArray count](self->children, "count");
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      v5 = (void *)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", i);
      objc_msgSend(v5, "disposeDescendants");
      if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EDD2DEE0))
        objc_msgSend(v5, "dispose");
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = (_QWORD *)CPCopyObject(self, a3);
  if (v5)
  {
    v5[4] = -[CPObject page](self, "page");
    v5[1] = 0;
    if (self->children)
    {
      v5[2] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->children, "count"));
      v6 = -[NSMutableArray count](self->children, "count");
      if (v6)
      {
        v7 = 0;
        do
        {
          v8 = (void *)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v7), "copyWithZone:", a3);
          objc_msgSend(v5, "add:", v8);

          ++v7;
        }
        while (v6 != v7);
      }
    }
    else
    {
      v5[2] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }
  }
  return v5;
}

- (id)copyWithoutChildren
{
  NSMutableArray *children;
  id result;

  children = self->children;
  self->children = 0;
  result = (id)-[CPObject copy](self, "copy");
  self->children = children;
  return result;
}

- (id)copyAndSplitChildrenAtIndex:(unsigned int)a3
{
  id *v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = -[CPObject copyWithoutChildren](self, "copyWithoutChildren");
  v6 = -[NSMutableArray count](self->children, "count");
  v7 = v6 - a3;
  if (v6 > a3)
  {
    v8 = v6 - a3;
    v9 = a3;
    do
    {
      v10 = -[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v9);
      *(_QWORD *)(v10 + 8) = v5;
      objc_msgSend(v5[2], "addObject:", v10);
      ++v9;
      --v8;
    }
    while (v8);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", a3, v7);
    -[NSMutableArray removeObjectsAtIndexes:](self->children, "removeObjectsAtIndexes:", v11);

  }
  return v5;
}

- (id)newTakeChildren
{
  NSMutableArray *children;
  int v4;
  uint64_t v5;
  uint64_t v6;

  children = self->children;
  v4 = -[NSMutableArray count](children, "count");
  if (v4 >= 1)
  {
    v5 = 0;
    v6 = v4;
    do
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v5++), "setParent:", 0);
    while (v6 != v5);
  }
  self->children = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->zOrder = 0;
  return children;
}

- (id)newTakeChildrenAmong:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_msgSend(a3, "count");
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      v8 = (void *)objc_msgSend(a3, "objectAtIndex:", i);
      if ((CPObject *)objc_msgSend(v8, "parent") == self)
        objc_msgSend(v8, "setParent:", 0);
    }
  }
  v9 = -[NSMutableArray count](self->children, "count");
  if (v9)
  {
    v10 = 0;
    do
    {
      v11 = (void *)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v10);
      if (objc_msgSend(v11, "parent"))
      {
        ++v10;
      }
      else
      {
        objc_msgSend(v5, "addObject:", v11);
        -[NSMutableArray removeObjectAtIndex:](self->children, "removeObjectAtIndex:", v10);
        --v9;
      }
    }
    while (v10 < v9);
  }
  return v5;
}

- (void)setParent:(id)a3
{
  self->parent = (CPObject *)a3;
}

- (id)parent
{
  return self->parent;
}

- (unsigned)count
{
  return -[NSMutableArray count](self->children, "count");
}

- (unsigned)countOfClass:(Class)a3
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;

  v4 = -[NSMutableArray count](self->children, "count");
  if (!v4)
    return 0;
  v5 = 0;
  v6 = 0;
  do
  {
    -[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v5);
    v6 += objc_opt_isKindOfClass() & 1;
    ++v5;
  }
  while (v4 != v5);
  return v6;
}

- (id)childAtIndex:(unsigned int)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", a3);
}

- (id)firstChild
{
  id result;

  result = (id)-[NSMutableArray count](self->children, "count");
  if (result)
    return (id)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", 0);
  return result;
}

- (id)lastChild
{
  int v3;

  v3 = -[CPObject count](self, "count");
  if (v3 < 1)
    return 0;
  else
    return -[CPObject childAtIndex:](self, "childAtIndex:", (v3 - 1));
}

- (id)nextSibling
{
  uint64_t v3;

  if (self->parent
    && (v3 = objc_msgSend(-[CPObject parent](self, "parent"), "indexOf:", self) + 1,
        v3 < -[CPObject count](self->parent, "count")))
  {
    return (id)objc_msgSend(-[CPObject parent](self, "parent"), "childAtIndex:", v3);
  }
  else
  {
    return 0;
  }
}

- (id)previousSibling
{
  int v3;

  if (self->parent && (v3 = objc_msgSend(-[CPObject parent](self, "parent"), "indexOf:", self)) != 0)
    return (id)objc_msgSend(-[CPObject parent](self, "parent"), "childAtIndex:", (v3 - 1));
  else
    return 0;
}

- (id)lastSibling
{
  if (self->parent)
    return (id)objc_msgSend((id)objc_msgSend(-[CPObject parent](self, "parent"), "children"), "lastObject");
  else
    return 0;
}

- (id)firstSibling
{
  if (self->parent)
    return (id)objc_msgSend((id)objc_msgSend(-[CPObject parent](self, "parent"), "children"), "objectAtIndex:", 0);
  else
    return 0;
}

- (void)add:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(a3, "remove");
  -[NSMutableArray addObject:](self->children, "addObject:", a3);
  objc_msgSend(a3, "setParent:", self);
  objc_msgSend(a3, "setDocument:", self->document);

}

- (void)add:(id)a3 atIndex:(unsigned int)a4
{
  id v6;

  v6 = a3;
  if (objc_msgSend(a3, "parent"))
    objc_msgSend(a3, "remove");
  -[NSMutableArray insertObject:atIndex:](self->children, "insertObject:atIndex:", a3, a4);
  objc_msgSend(a3, "setParent:", self);
  objc_msgSend(a3, "setDocument:", self->document);

}

- (void)addChildren:(id)a3
{
  uint64_t v5;
  uint64_t i;

  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    for (i = 0; i != v5; ++i)
      -[CPObject add:](self, "add:", objc_msgSend(a3, "objectAtIndex:", i));
  }
}

- (void)addChildrenOf:(id)a3
{
  int v5;
  void *v6;
  uint64_t i;

  v5 = objc_msgSend(a3, "count");
  v6 = (void *)objc_msgSend(a3, "children");
  if (v5)
  {
    for (i = 0; i != v5; objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", i++), "setParent:", self))
      ;
  }
  -[NSMutableArray addObjectsFromArray:](self->children, "addObjectsFromArray:", v6);
  objc_msgSend(a3, "removeAll");
  -[CPObject recomputeZOrder](self, "recomputeZOrder");
}

- (void)remove:(id)a3
{
  objc_msgSend(a3, "setParent:", 0);
  -[NSMutableArray removeObject:](self->children, "removeObject:", a3);
}

- (void)removeFirstChild
{
  if (-[NSMutableArray count](self->children, "count"))
    -[CPObject remove:](self, "remove:", -[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", 0));
}

- (void)removeLastChild
{
  if (-[NSMutableArray count](self->children, "count"))
    -[CPObject remove:](self, "remove:", -[NSMutableArray lastObject](self->children, "lastObject"));
}

- (void)remove
{
  CPObject *parent;

  parent = self->parent;
  if (parent)
    -[CPObject remove:](parent, "remove:", self);
}

- (void)removeObjectAtIndex:(unsigned int)a3
{
  uint64_t v4;

  v4 = a3;
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", a3), "setParent:", 0);
  -[NSMutableArray removeObjectAtIndex:](self->children, "removeObjectAtIndex:", v4);
}

- (void)removeAll
{
  -[NSMutableArray removeAllObjects](self->children, "removeAllObjects");
  self->zOrder = 0;
}

- (void)promoteChildren
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  CPObject *parent;

  v3 = -[NSMutableArray count](self->children, "count");
  if (v3 >= 1)
  {
    v4 = 0;
    v5 = v3;
    do
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v4++), "setParent:", self->parent);
    while (v5 != v4);
  }
  parent = self->parent;
  if (parent)
    -[NSMutableArray addObjectsFromArray:](parent->children, "addObjectsFromArray:", self->children);
  -[CPObject removeAll](self, "removeAll");
}

- (id)ancestorOfClass:(Class)a3
{
  id result;
  char isKindOfClass;

  result = self->parent;
  if (result)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    result = self->parent;
    if ((isKindOfClass & 1) == 0)
      return (id)objc_msgSend(result, "ancestorOfClass:", a3);
  }
  return result;
}

- (void)childrenOfClass:(Class)a3 into:(id)a4
{
  uint64_t v6;
  uint64_t i;
  uint64_t v8;

  v6 = -[NSMutableArray count](self->children, "count");
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      v8 = -[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", i);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a4, "addObject:", v8);
    }
  }
}

- (id)childrenOfClass:(Class)a3
{
  uint64_t v4;
  void *v5;
  uint64_t i;
  uint64_t v7;

  v4 = -[NSMutableArray count](self->children, "count");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      v7 = -[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", i);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v5, "addObject:", v7);
    }
  }
  return v5;
}

- (id)childrenNotOfClass:(Class)a3
{
  uint64_t v4;
  void *v5;
  uint64_t i;
  uint64_t v7;

  v4 = -[NSMutableArray count](self->children, "count");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      v7 = -[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", i);
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v5, "addObject:", v7);
    }
  }
  return v5;
}

- (void)performSelector:(SEL)a3
{
  -[NSMutableArray performSelector:](self->children, "performSelector:", a3);
}

- (void)commonMapFuncCall:(SEL)a3 target:(id)a4 childrenOfClass:(Class)a5 ofCount:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  if (a6 >= 1)
  {
    v22 = v13;
    v23 = v12;
    v24 = v11;
    v25 = v10;
    v26 = v9;
    v27 = v8;
    v28 = v7;
    v29 = v6;
    v30 = v14;
    v31 = v15;
    v19 = 0;
    v20 = a6;
    do
    {
      v21 = -[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v19, a4, a5, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a4, a3, v21);
      ++v19;
    }
    while (v20 != v19);
  }
}

- (void)map:(SEL)a3 target:(id)a4 childrenOfClass:(Class)a5 last:(BOOL)a6
{
  -[CPObject commonMapFuncCall:target:childrenOfClass:ofCount:](self, "commonMapFuncCall:target:childrenOfClass:ofCount:", a3, a4, a5, -[NSMutableArray count](self->children, "count") - !a6);
}

- (void)map:(SEL)a3 target:(id)a4 childrenOfClass:(Class)a5
{
  -[CPObject commonMapFuncCall:target:childrenOfClass:ofCount:](self, "commonMapFuncCall:target:childrenOfClass:ofCount:", a3, a4, a5, -[NSMutableArray count](self->children, "count"));
}

- (void)mapSafely:(SEL)a3 target:(id)a4 childrenOfClass:(Class)a5
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v8 = -[NSMutableArray count](self->children, "count");
  v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
  if (v8 >= 1)
  {
    v9 = 0;
    v10 = v8;
    do
    {
      v11 = -[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v9);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v15, "addObject:", v11);
      ++v9;
    }
    while (v10 != v9);
  }
  v12 = objc_msgSend(v15, "count");
  if (v12 >= 1)
  {
    v13 = 0;
    v14 = v12;
    do
      objc_msgSend(a4, a3, objc_msgSend(v15, "objectAtIndex:", v13++));
    while (v14 != v13);
  }

}

- (void)map:(SEL)a3 target:(id)a4
{
  int v7;
  uint64_t v8;
  uint64_t v9;

  v7 = -[NSMutableArray count](self->children, "count");
  if (v7 >= 1)
  {
    v8 = 0;
    v9 = v7;
    do
      objc_msgSend(a4, a3, -[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v8++));
    while (v9 != v8);
  }
}

- (void)map:(SEL)a3 target:(id)a4 last:(BOOL)a5
{
  uint64_t v8;
  uint64_t i;

  v8 = -[NSMutableArray count](self->children, "count") - !a5;
  if ((int)v8 >= 1)
  {
    for (i = 0; i != v8; ++i)
      objc_msgSend(a4, a3, -[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", i));
  }
}

- (id)children
{
  return self->children;
}

- (id)descendantsOfClass:(Class)a3 deep:(BOOL)a4
{
  _BOOL8 v4;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char isKindOfClass;
  uint64_t v13;

  v4 = a4;
  v7 = -[NSMutableArray count](self->children, "count");
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
  if (v7 >= 1)
  {
    v9 = 0;
    v10 = v7;
    while (1)
    {
      v11 = (void *)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v9);
      isKindOfClass = objc_opt_isKindOfClass();
      v13 = v4;
      if ((isKindOfClass & 1) == 0)
        goto LABEL_6;
      objc_msgSend(v8, "addObject:", v11, v4);
      if (v4)
        break;
LABEL_7:
      if (v10 == ++v9)
        return v8;
    }
    v13 = 1;
LABEL_6:
    objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(v11, "descendantsOfClass:deep:", a3, v13));
    goto LABEL_7;
  }
  return v8;
}

- (void)descendantsOfClass:(Class)a3 to:(id)a4
{
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  if (a4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(a4, "addObject:", self);
    v7 = -[CPObject count](self, "count");
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      do
      {
        objc_msgSend(-[CPObject childAtIndex:](self, "childAtIndex:", v9), "descendantsOfClass:to:", a3, a4);
        v9 = (v9 + 1);
      }
      while (v8 != (_DWORD)v9);
    }
  }
}

- (id)descendantsOfClass:(Class)a3
{
  return -[CPObject descendantsOfClass:deep:](self, "descendantsOfClass:deep:", a3, 1);
}

- (id)shallowDescendantsOfClass:(Class)a3
{
  return -[CPObject descendantsOfClass:deep:](self, "descendantsOfClass:deep:", a3, 0);
}

- (id)descendantsOfClass:(Class)a3 omitTraversing:(Class)a4
{
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v7 = -[NSMutableArray count](self->children, "count");
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
  if (v7 >= 1)
  {
    v9 = 0;
    v10 = v7;
    do
    {
      v11 = (void *)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v9);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v8, "addObject:", v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(v11, "descendantsOfClass:omitTraversing:", a3, a4));
      ++v9;
    }
    while (v10 != v9);
  }
  return v8;
}

- (id)firstDescendantOfClass:(Class)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = -[NSMutableArray count](self->children, "count");
  if (v5 < 1)
    return 0;
  v6 = 0;
  v7 = v5;
  while (1)
  {
    v8 = (void *)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v6);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    v9 = (void *)objc_msgSend(v8, "firstDescendantOfClass:", a3);
    if (v9)
      return v9;
    if (v7 == ++v6)
      return 0;
  }
  return v8;
}

- (id)lastDescendantOfClass:(Class)a3
{
  unsigned int v5;
  uint64_t v6;
  id v7;
  id result;
  BOOL v9;
  BOOL v10;

  v5 = -[CPObject count](self, "count");
  v6 = v5 - 1;
  if ((int)(v5 - 1) < 0)
    return 0;
  do
  {
    v7 = -[CPObject childAtIndex:](self, "childAtIndex:", v6);
    result = (id)objc_msgSend(v7, "lastDescendantOfClass:", a3);
    if (result)
      break;
    result = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
    v9 = (_DWORD)v6 != 0;
    v6 = (v6 - 1);
    v10 = v9;
  }
  while (!result && v10);
  return result;
}

- (unsigned)countOfFirstDescendantsOfClass:(Class)a3
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;

  v5 = -[NSMutableArray count](self->children, "count");
  if (!v5)
    return 0;
  v6 = 0;
  v7 = 0;
  do
  {
    v8 = (void *)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v6);
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      ++v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 += objc_msgSend(v8, "countOfFirstDescendantsOfClass:", a3);
    }
    ++v6;
  }
  while (v5 != v6);
  return v7;
}

- (unint64_t)indexOf:(id)a3
{
  return -[NSMutableArray indexOfObject:](self->children, "indexOfObject:", a3);
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPObject;
  return -[CPObject isEqual:](&v4, sel_isEqual_, a3);
}

- (void)setDocument:(id)a3
{
  int v5;
  uint64_t v6;

  if (self->document != a3)
  {
    self->document = (CPDocument *)a3;
    v5 = -[NSMutableArray count](self->children, "count");
    if (v5 >= 1)
    {
      v6 = 0;
      do
      {
        objc_msgSend(-[CPObject childAtIndex:](self, "childAtIndex:", v6), "setDocument:", a3);
        v6 = (v6 + 1);
      }
      while (v5 != (_DWORD)v6);
    }
  }
}

- (id)document
{
  return self->document;
}

- (int64_t)zOrder
{
  return self->zOrder;
}

- (void)recomputeZOrder
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t i;
  int v7;

  v3 = -[NSMutableArray count](self->children, "count");
  if (v3)
  {
    v4 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", 0), "zOrder");
    if (v3 >= 2)
    {
      v5 = v3;
      for (i = 1; i != v5; ++i)
      {
        v7 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", i), "zOrder");
        if (v4 <= v7)
          v4 = v7;
      }
    }
    -[CPObject setZOrder:](self, "setZOrder:", v4);
  }
}

- (void)updateZOrder:(int64_t)a3
{
  CPObject *parent;

  if (self->zOrder < a3)
  {
    self->zOrder = a3;
    parent = self->parent;
    if (parent)
      -[CPObject updateZOrder:](parent, "updateZOrder:");
  }
}

- (void)setZOrder:(int64_t)a3
{
  self->zOrder = a3;
}

- (void)clearCachedInfo
{
  CPObject *parent;

  parent = self->parent;
  if (parent)
    -[CPObject clearCachedInfo](parent, "clearCachedInfo");
}

- (id)firstDescendantsOfClass:(Class)a3
{
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = -[NSMutableArray count](self->children, "count");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
  if (v5 >= 1)
  {
    v7 = 0;
    v8 = v5;
    do
    {
      v9 = (void *)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v7);
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "addObject:", v9);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v9, "firstDescendantsOfClass:", a3));
      }
      ++v7;
    }
    while (v8 != v7);
  }
  return v6;
}

- (void)setPage:(id)a3
{
  self->page = (CPPage *)a3;
}

- (id)page
{
  id result;
  CPObject *parent;

  result = self->page;
  if (!result)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self->page = (CPPage *)self;
      return self;
    }
    else
    {
      parent = self->parent;
      if (parent)
      {
        result = -[CPObject page](parent, "page");
        self->page = (CPPage *)result;
      }
      else
      {
        return self->page;
      }
    }
  }
  return result;
}

- (int)depth
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;

  v3 = -[NSMutableArray count](self->children, "count");
  if (v3)
  {
    v4 = -[NSMutableArray count](self->children, "count");
    if (v4 < 1)
    {
      LODWORD(v3) = 1;
    }
    else
    {
      v5 = 0;
      v6 = 0;
      v7 = v4;
      do
      {
        v8 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v5), "depth");
        if (v8 > v6)
          v6 = v8;
        ++v5;
      }
      while (v7 != v5);
      LODWORD(v3) = v6 + 1;
    }
  }
  return v3;
}

- (void)_printWithIndent:(int)a3
{
  int v5;
  objc_class *v6;
  const char *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSMutableArray *children;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3 >= 1)
  {
    v5 = a3;
    do
    {
      printf("    ");
      --v5;
    }
    while (v5);
  }
  v6 = (objc_class *)objc_opt_class();
  v7 = -[NSString UTF8String](NSStringFromClass(v6), "UTF8String");
  printf("(%s) %p", v7, self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CPObject zoneBounds](self, "zoneBounds");
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_9;
    -[CPObject renderedBounds](self, "renderedBounds");
  }
  printf("bounds: (%.2f, %.2f), [%.2f, %.2f]", v8, v9, v10, v11);
LABEL_9:
  fputc(10, (FILE *)*MEMORY[0x1E0C80C20]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  children = self->children;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    v16 = (a3 + 1);
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(children);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "_printWithIndent:", v16);
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }
}

- (void)print
{
  -[CPObject _printWithIndent:](self, "_printWithIndent:", 0);
}

@end
