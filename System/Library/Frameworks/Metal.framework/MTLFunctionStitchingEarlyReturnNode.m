@implementation MTLFunctionStitchingEarlyReturnNode

- (MTLFunctionStitchingEarlyReturnNode)initWithCondition:(id)a3 controlDependencies:(id)a4
{
  objc_super v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = a3;
  v5.receiver = self;
  v5.super_class = (Class)MTLFunctionStitchingEarlyReturnNode;
  return -[MTLFunctionStitchingFunctionNode initWithName:arguments:controlDependencies:](&v5, sel_initWithName_arguments_controlDependencies_, &stru_1E0FE5DC8, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1), a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setName:", -[NSString copy](-[MTLFunctionStitchingFunctionNode name](self, "name"), "copy"));
  objc_msgSend(v4, "setArguments:", -[NSArray copy](-[MTLFunctionStitchingFunctionNode arguments](self, "arguments"), "copy"));
  objc_msgSend(v4, "setControlDependencies:", -[NSArray copy](-[MTLFunctionStitchingFunctionNode controlDependencies](self, "controlDependencies"), "copy"));
  return v4;
}

- (MTLFunctionStitchingNode)condition
{
  return (MTLFunctionStitchingNode *)-[NSArray objectAtIndexedSubscript:](-[MTLFunctionStitchingFunctionNode arguments](self, "arguments"), "objectAtIndexedSubscript:", 0);
}

- (void)setCondition:(id)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a3;
  -[MTLFunctionStitchingFunctionNode setArguments:](self, "setArguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1));
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[6];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3 + 4;
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = -[MTLFunctionStitchingFunctionNode controlDependencies](self, "controlDependencies");
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (v9)
          objc_msgSend(v9, "appendString:", v5);
        else
          v9 = (id)objc_opt_new();
        objc_msgSend(v9, "appendString:", objc_msgSend(v12, "formattedDescription:", v4));
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_opt_class();
  v21[0] = v5;
  v21[1] = CFSTR("condition =");
  v21[2] = -[MTLFunctionStitchingNode formattedDescription:](-[MTLFunctionStitchingEarlyReturnNode condition](self, "condition"), "formattedDescription:", v4);
  v21[3] = v5;
  v15 = (id)MEMORY[0x1E0C9AA60];
  if (v9)
    v15 = v9;
  v21[4] = CFSTR("controlDependencies =");
  v21[5] = v15;
  return (id)objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>\n%@"), v14, self, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 6), "componentsJoinedByString:", CFSTR(" ")));
}

@end
