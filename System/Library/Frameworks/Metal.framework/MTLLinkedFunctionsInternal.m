@implementation MTLLinkedFunctionsInternal

- (id)binaryFunctions
{
  return self->_private.binaryFunctions;
}

- (void)dealloc
{
  MTLLinkedFunctionsPrivate *p_private;
  objc_super v4;

  p_private = &self->_private;

  v4.receiver = self;
  v4.super_class = (Class)MTLLinkedFunctionsInternal;
  -[MTLLinkedFunctionsInternal dealloc](&v4, sel_dealloc);
}

- (id)functions
{
  return self->_private.functions;
}

- (id)privateFunctions
{
  return self->_private.privateFunctions;
}

- (id)groups
{
  return self->_private.groups;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  _QWORD *v5;
  MTLLinkedFunctionsPrivate *p_private;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (_QWORD *)v4;
  if (v4)
  {
    p_private = &self->_private;
    *(_QWORD *)(v4 + 16) = -[NSArray copy](p_private->functions, "copy");
    v5[3] = -[NSArray copy](p_private->privateFunctions, "copy");
    v5[4] = -[NSArray copy](p_private->binaryFunctions, "copy");
    v5[5] = -[NSDictionary copy](p_private->groups, "copy");
  }
  return v5;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return +[MTLLinkedFunctionsInternal allocWithZone:](MTLLinkedFunctionsInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLLinkedFunctionsInternal;
  return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (unint64_t)hash
{
  MTLLinkedFunctionsPrivate *p_private;
  uint64_t v5;
  NSDictionary *groups;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD v14[4];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[MTLLinkedFunctionsInternal isEmpty](self, "isEmpty"))
    return 0;
  p_private = &self->_private;
  bzero(v14, 0x20uLL);
  v5 = 1;
  v14[0] = MTLHashArray(p_private->functions, 1, 1);
  v14[1] = MTLHashArray(p_private->privateFunctions, 1, 1);
  v14[2] = MTLHashArray(p_private->binaryFunctions, 1, 1);
  groups = p_private->groups;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](groups, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v5 = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(groups);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "hash");
        v13 = MTLHashArray(-[NSDictionary objectForKeyedSubscript:](groups, "objectForKeyedSubscript:", v11), 1, 1);
        v5 ^= v12 ^ ((v13 >> (v12 & 0x3F ^ 0x3F)) | (v13 << v12));
      }
      v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](groups, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  v14[3] = v5;
  return _MTLHashState((int *)v14, 0x20uLL);
}

- (BOOL)isEmpty
{
  return !self->_private.functions
      && !self->_private.privateFunctions
      && !self->_private.binaryFunctions
      && self->_private.groups == 0;
}

- (void)setPrivateFunctions:(id)a3
{
  MTLLinkedFunctionsPrivate *p_private;
  NSArray *privateFunctions;

  p_private = &self->_private;
  privateFunctions = self->_private.privateFunctions;
  if (privateFunctions != a3)
  {

    p_private->privateFunctions = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (void)setFunctions:(id)a3
{
  NSArray *functions;

  functions = self->_private.functions;
  if (functions != a3)
  {

    self->_private.functions = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (void)setBinaryFunctions:(id)a3
{
  MTLLinkedFunctionsPrivate *p_private;
  NSArray *binaryFunctions;

  p_private = &self->_private;
  binaryFunctions = self->_private.binaryFunctions;
  if (binaryFunctions != a3)
  {

    p_private->binaryFunctions = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (void)setGroups:(id)a3
{
  MTLLinkedFunctionsPrivate *p_private;
  NSDictionary *groups;

  p_private = &self->_private;
  groups = self->_private.groups;
  if (groups != a3)
  {

    p_private->groups = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  int v6;
  MTLLinkedFunctionsPrivate *p_private;
  NSArray **v8;
  NSArray *privateFunctions;
  NSArray *binaryFunctions;
  NSDictionary *groups;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    Class = object_getClass(self);
    if (Class == object_getClass(a3))
    {
      p_private = &self->_private;
      v8 = (NSArray **)((char *)a3 + 16);
      if (p_private->functions == *v8 || (v6 = -[NSArray isEqual:](p_private->functions, "isEqual:")) != 0)
      {
        privateFunctions = p_private->privateFunctions;
        if (privateFunctions == v8[1] || (v6 = -[NSArray isEqual:](privateFunctions, "isEqual:")) != 0)
        {
          binaryFunctions = p_private->binaryFunctions;
          if (binaryFunctions == v8[2] || (v6 = -[NSArray isEqual:](binaryFunctions, "isEqual:")) != 0)
          {
            groups = p_private->groups;
            if (groups == (NSDictionary *)v8[3] || (v6 = -[NSDictionary isEqual:](groups, "isEqual:")) != 0)
              LOBYTE(v6) = 1;
          }
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  MTLLinkedFunctionsPrivate *p_private;
  uint64_t functions;
  uint64_t privateFunctions;
  uint64_t binaryFunctions;
  uint64_t groups;
  objc_super v13;
  _QWORD v14[13];

  v14[12] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)MTLLinkedFunctionsInternal;
  v6 = -[MTLLinkedFunctionsInternal description](&v13, sel_description);
  v14[0] = v4;
  v14[1] = CFSTR("functions =");
  p_private = &self->_private;
  functions = (uint64_t)p_private->functions;
  if (!p_private->functions)
    functions = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14[2] = functions;
  v14[3] = v4;
  v14[4] = CFSTR("privateFunctions =");
  privateFunctions = (uint64_t)p_private->privateFunctions;
  if (!privateFunctions)
    privateFunctions = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14[5] = privateFunctions;
  v14[6] = v4;
  v14[7] = CFSTR("binaryFunctions =");
  binaryFunctions = (uint64_t)p_private->binaryFunctions;
  if (!binaryFunctions)
    binaryFunctions = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14[8] = binaryFunctions;
  v14[9] = v4;
  v14[10] = CFSTR("groups =");
  groups = (uint64_t)p_private->groups;
  if (!groups)
    groups = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14[11] = groups;
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 12), "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLLinkedFunctionsInternal formattedDescription:](self, "formattedDescription:", 0);
}

@end
