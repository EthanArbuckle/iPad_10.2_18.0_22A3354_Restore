@implementation MTLFunctionStitchingFunctionNode

- (MTLFunctionStitchingFunctionNode)init
{
  MTLFunctionStitchingFunctionNode *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLFunctionStitchingFunctionNode;
  v2 = -[MTLFunctionStitchingFunctionNode init](&v4, sel_init);
  -[MTLFunctionStitchingFunctionNode setControlDependencies:](v2, "setControlDependencies:", MEMORY[0x1E0C9AA60]);
  return v2;
}

- (MTLFunctionStitchingFunctionNode)initWithName:(NSString *)name arguments:(NSArray *)arguments controlDependencies:(NSArray *)controlDependencies
{
  MTLFunctionStitchingFunctionNode *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLFunctionStitchingFunctionNode;
  v8 = -[MTLFunctionStitchingFunctionNode init](&v10, sel_init);
  v8->_name = (NSString *)-[NSString copy](name, "copy");
  v8->_arguments = (NSArray *)-[NSArray copy](arguments, "copy");
  v8->_controlDependencies = (NSArray *)-[NSArray copy](controlDependencies, "copy");
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setName:", self->_name);
  objc_msgSend(v4, "setArguments:", self->_arguments);
  objc_msgSend(v4, "setControlDependencies:", self->_controlDependencies);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  int v6;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    Class = object_getClass(self);
    if (Class == object_getClass(a3))
    {
      v6 = -[NSString isEqualToString:](-[MTLFunctionStitchingFunctionNode name](self, "name"), "isEqualToString:", objc_msgSend(a3, "name"));
      if (v6)
      {
        v6 = MTLCompareArray(-[MTLFunctionStitchingFunctionNode arguments](self, "arguments"), (void *)objc_msgSend(a3, "arguments"), 1, 1);
        if (v6)
          LOBYTE(v6) = MTLCompareArray(-[MTLFunctionStitchingFunctionNode controlDependencies](self, "controlDependencies"), (void *)objc_msgSend(a3, "controlDependencies"), 1, 0);
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (unint64_t)hash
{
  _QWORD v4[3];

  bzero(v4, 0x18uLL);
  v4[0] = -[NSString hash](-[MTLFunctionStitchingFunctionNode name](self, "name"), "hash");
  v4[1] = MTLHashArray(-[MTLFunctionStitchingFunctionNode arguments](self, "arguments"), 1, 1);
  v4[2] = MTLHashArray(-[MTLFunctionStitchingFunctionNode controlDependencies](self, "controlDependencies"), 1, 0);
  return _MTLHashState((int *)v4, 0x18uLL);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLFunctionStitchingFunctionNode;
  -[MTLFunctionStitchingFunctionNode dealloc](&v3, sel_dealloc);
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  NSArray *arguments;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSArray *controlDependencies;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  NSString *v21;
  id v22;
  id v23;
  MTLFunctionStitchingFunctionNode *v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[9];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3 + 4;
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  arguments = self->_arguments;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](arguments, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(arguments);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (v9)
          objc_msgSend(v9, "appendString:", v5);
        else
          v9 = (id)objc_opt_new();
        objc_msgSend(v9, "appendString:", objc_msgSend(v12, "formattedDescription:", v4));
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](arguments, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = self;
  controlDependencies = self->_controlDependencies;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](controlDependencies, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(controlDependencies);
        v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        if (v16)
          objc_msgSend(v16, "appendString:", v5);
        else
          v16 = (id)objc_opt_new();
        objc_msgSend(v16, "appendString:", objc_msgSend(v19, "formattedDescription:", v4));
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](controlDependencies, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }
  v20 = (void *)MEMORY[0x1E0CB3940];
  v26.receiver = v25;
  v26.super_class = (Class)MTLFunctionStitchingFunctionNode;
  v21 = -[MTLFunctionStitchingFunctionNode description](&v26, sel_description);
  v35[0] = v5;
  v35[1] = CFSTR("name =");
  v35[2] = v25->_name;
  v35[3] = v5;
  if (v9)
    v22 = v9;
  else
    v22 = (id)MEMORY[0x1E0C9AA60];
  v35[4] = CFSTR("arguments =");
  v35[5] = v22;
  v35[6] = v5;
  v35[7] = CFSTR("controlDependencies =");
  if (v16)
    v23 = v16;
  else
    v23 = (id)MEMORY[0x1E0C9AA60];
  v35[8] = v23;
  return (id)objc_msgSend(v20, "stringWithFormat:", CFSTR("%@%@"), v21, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 9), "componentsJoinedByString:", CFSTR(" ")));
}

- (NSString)description
{
  return (NSString *)-[MTLFunctionStitchingFunctionNode formattedDescription:](self, "formattedDescription:", 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 8);
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(NSArray *)arguments
{
  objc_setProperty_nonatomic_copy(self, a2, arguments, 16);
}

- (NSArray)controlDependencies
{
  return self->_controlDependencies;
}

- (void)setControlDependencies:(NSArray *)controlDependencies
{
  objc_setProperty_nonatomic_copy(self, a2, controlDependencies, 24);
}

@end
