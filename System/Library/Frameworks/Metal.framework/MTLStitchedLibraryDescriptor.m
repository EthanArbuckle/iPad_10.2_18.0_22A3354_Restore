@implementation MTLStitchedLibraryDescriptor

- (MTLStitchedLibraryDescriptor)init
{
  MTLStitchedLibraryDescriptor *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLStitchedLibraryDescriptor;
  v2 = -[MTLStitchedLibraryDescriptor init](&v4, sel_init);
  -[MTLStitchedLibraryDescriptor setBinaryArchives:](v2, "setBinaryArchives:", MEMORY[0x1E0C9AA60]);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setFunctionGraphs:", self->_functionGraphs);
  objc_msgSend(v4, "setFunctions:", self->_functions);
  objc_msgSend(v4, "setBinaryArchives:", self->_binaryArchives);
  objc_msgSend(v4, "setOptions:", self->_options);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLStitchedLibraryDescriptor;
  -[MTLStitchedLibraryDescriptor dealloc](&v3, sel_dealloc);
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  NSArray *functionGraphs;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSArray *functions;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[6];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3 + 4;
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  functionGraphs = self->_functionGraphs;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](functionGraphs, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(functionGraphs);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (v9)
          objc_msgSend(v9, "appendString:", v5);
        else
          v9 = (id)objc_opt_new();
        objc_msgSend(v9, "appendString:", objc_msgSend(v12, "formattedDescription:", v4));
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](functionGraphs, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  v13 = (void *)MEMORY[0x1E0CB3940];
  v18.receiver = self;
  v18.super_class = (Class)MTLStitchedLibraryDescriptor;
  v14 = -[MTLStitchedLibraryDescriptor description](&v18, sel_description);
  v23[0] = v5;
  v23[1] = CFSTR("functionGraphs =");
  v15 = (id)MEMORY[0x1E0C9AA60];
  if (v9)
    v15 = v9;
  v23[2] = v15;
  v23[3] = v5;
  v23[4] = CFSTR("functions =");
  functions = self->_functions;
  if (!functions)
    functions = (NSArray *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v23[5] = functions;
  return (id)objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@"), v14, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 6), "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLStitchedLibraryDescriptor formattedDescription:](self, "formattedDescription:", 0);
}

- (NSArray)functionGraphs
{
  return self->_functionGraphs;
}

- (void)setFunctionGraphs:(NSArray *)functionGraphs
{
  objc_setProperty_nonatomic_copy(self, a2, functionGraphs, 8);
}

- (NSArray)functions
{
  return self->_functions;
}

- (void)setFunctions:(NSArray *)functions
{
  objc_setProperty_nonatomic_copy(self, a2, functions, 16);
}

- (NSArray)binaryArchives
{
  return self->_binaryArchives;
}

- (void)setBinaryArchives:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

@end
