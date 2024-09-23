@implementation MTLStructTypeInternal

- (void)setIsIndirectArgumentBuffer:(BOOL)a3
{
  self->_isIndirectArgumentBuffer = a3;
}

- (MTLStructTypeInternal)init
{
  MTLStructTypeInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLStructTypeInternal;
  result = -[MTLStructTypeInternal init](&v3, sel_init);
  result->_dataType = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLStructTypeInternal;
  -[MTLStructTypeInternal dealloc](&v3, sel_dealloc);
}

- (id)members
{
  return self->_members;
}

- (BOOL)isIndirectArgumentBuffer
{
  return self->_isIndirectArgumentBuffer;
}

- (void)setMembers:(id *)a3 count:(unint64_t)a4
{
  NSDictionary *v7;
  NSArray *members;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];

  self->_members = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", a3, a4);
  v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  members = self->_members;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](members, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(members);
        -[NSDictionary setObject:forKey:](v7, "setObject:forKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "name"));
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](members, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  self->_dictionary = v7;
}

- (MTLStructTypeInternal)initWithMembers:(id *)a3 count:(unint64_t)a4
{
  MTLStructTypeInternal *v6;
  NSDictionary *v7;
  NSArray *members;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)MTLStructTypeInternal;
  v6 = -[MTLStructTypeInternal init](&v18, sel_init);
  v6->_dataType = 1;
  v6->_members = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", a3, a4);
  v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  members = v6->_members;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](members, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(members);
        -[NSDictionary setObject:forKey:](v7, "setObject:forKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "name"));
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](members, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }
  v6->_dictionary = v7;
  return v6;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (MTLStructTypeInternal)initWithMembers:(id *)a3 count:(unint64_t)a4 typeName:(id)a5
{
  MTLStructTypeInternal *v6;

  v6 = -[MTLStructTypeInternal initWithMembers:count:](self, "initWithMembers:count:", a3, a4);
  v6->_typeName = (NSString *)objc_msgSend(a5, "copy");
  return v6;
}

- (id)memberByName:(id)a3
{
  return -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
}

- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  unint64_t v15;
  void *v16;
  MTLStructTypeInternal *v18;
  NSArray *obj;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  _BYTE v26[128];
  _QWORD v27[2];
  _QWORD v28[5];

  v28[3] = *MEMORY[0x1E0C80C00];
  v6 = a3 + 4;
  v7 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 128);
  v28[0] = v7;
  v28[1] = CFSTR("DataType =");
  v28[2] = MTLDataTypeString(self->_dataType);
  v9 = 0x1E0C99000uLL;
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3));
  if (objc_msgSend(a4, "containsObject:", self))
  {
    v27[0] = v7;
    v27[1] = CFSTR("<Recursive>");
    objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2));
  }
  else
  {
    objc_msgSend(a4, "addObject:", self);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = self;
    obj = self->_members;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          v15 = v9;
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v25[0] = v7;
          v25[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), v12 + i);
          v25[2] = objc_msgSend(v16, "formattedDescription:withPrintedTypes:", v6, a4);
          v9 = v15;
          objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(*(id *)(v15 + 3360), "arrayWithObjects:count:", v25, 3));
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        v12 = (v12 + i);
      }
      while (v11);
    }
    objc_msgSend(a4, "removeLastObject");
    self = v18;
  }
  v20.receiver = self;
  v20.super_class = (Class)MTLStructTypeInternal;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), -[MTLStructTypeInternal description](&v20, sel_description), objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  id v3;
  id v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = -[MTLStructTypeInternal formattedDescription:withPrintedTypes:](self, "formattedDescription:withPrintedTypes:", 0, v3);

  return v4;
}

- (BOOL)isStructLayoutThreadSafeWith:(id)a3
{
  void *v4;
  NSUInteger v5;
  int v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  NSArray *obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "members");
  v5 = -[NSArray count](self->_members, "count");
  if (v5 == objc_msgSend(v4, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = self->_members;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v19)
    {
      v18 = *(_QWORD *)v25;
      v6 = 1;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v9)
          {
            v10 = v9;
            v11 = 0;
            v12 = *(_QWORD *)v21;
            do
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v21 != v12)
                  objc_enumerationMutation(v4);
                v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
                v15 = objc_msgSend(v14, "offset");
                if (v15 == objc_msgSend(v8, "offset"))
                {
                  v6 &= objc_msgSend(v8, "isMemberLayoutThreadSafeWith:", v14);
                  v11 = 1;
                }
              }
              v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v10);
          }
          else
          {
            v11 = 0;
          }
          v6 &= v11;
        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v19);
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6 & 1;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v5;
  uint64_t v6;

  if (!a3)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_dataType == *((_QWORD *)a3 + 1))
  {
    v5 = -[NSArray count](self->_members, "count");
    if (v5 == objc_msgSend(*((id *)a3 + 3), "count"))
    {
      if (!-[NSArray count](self->_members, "count"))
        return self->_isIndirectArgumentBuffer == *((unsigned __int8 *)a3 + 32);
      v6 = 0;
      while ((objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_members, "objectAtIndexedSubscript:", v6), "isEqual:", objc_msgSend(*((id *)a3 + 3), "objectAtIndexedSubscript:", v6)) & 1) != 0)
      {
        if (-[NSArray count](self->_members, "count") <= ++v6)
          return self->_isIndirectArgumentBuffer == *((unsigned __int8 *)a3 + 32);
      }
    }
  }
  return 0;
}

- (NSString)typeName
{
  return self->_typeName;
}

@end
