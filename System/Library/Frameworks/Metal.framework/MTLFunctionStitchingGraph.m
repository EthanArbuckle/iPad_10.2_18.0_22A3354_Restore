@implementation MTLFunctionStitchingGraph

- (void)setOutputNode:(MTLFunctionStitchingFunctionNode *)outputNode
{
  MTLFunctionStitchingFunctionNode *v5;
  MTLFunctionStitchingFunctionNode *v6;

  v6 = self->_outputNode;
  if (shouldOutputNodePropertyRetain(void)::onceToken != -1)
    dispatch_once(&shouldOutputNodePropertyRetain(void)::onceToken, &__block_literal_global_20);
  if (shouldOutputNodePropertyRetain(void)::result)
    v5 = outputNode;
  else
    v5 = (MTLFunctionStitchingFunctionNode *)-[MTLFunctionStitchingFunctionNode copy](outputNode, "copy");
  self->_outputNode = v5;

}

- (MTLFunctionStitchingGraph)init
{
  MTLFunctionStitchingGraph *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLFunctionStitchingGraph;
  v2 = -[MTLFunctionStitchingGraph init](&v5, sel_init);
  v3 = MEMORY[0x1E0C9AA60];
  -[MTLFunctionStitchingGraph setNodes:](v2, "setNodes:", MEMORY[0x1E0C9AA60]);
  -[MTLFunctionStitchingGraph setAttributes:](v2, "setAttributes:", v3);
  return v2;
}

- (MTLFunctionStitchingGraph)initWithFunctionName:(NSString *)functionName nodes:(NSArray *)nodes outputNode:(MTLFunctionStitchingFunctionNode *)outputNode attributes:(NSArray *)attributes
{
  MTLFunctionStitchingGraph *v10;
  MTLFunctionStitchingFunctionNode *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTLFunctionStitchingGraph;
  v10 = -[MTLFunctionStitchingGraph init](&v13, sel_init);
  v10->_functionName = (NSString *)-[NSString copy](functionName, "copy");
  v10->_nodes = (NSArray *)-[NSArray copy](nodes, "copy");
  if (shouldOutputNodePropertyRetain(void)::onceToken != -1)
    dispatch_once(&shouldOutputNodePropertyRetain(void)::onceToken, &__block_literal_global_20);
  if (shouldOutputNodePropertyRetain(void)::result)
    v11 = outputNode;
  else
    v11 = (MTLFunctionStitchingFunctionNode *)-[MTLFunctionStitchingFunctionNode copy](outputNode, "copy");
  v10->_outputNode = v11;
  v10->_attributes = (NSArray *)-[NSArray copy](attributes, "copy");
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setFunctionName:", self->_functionName);
  objc_msgSend(v4, "setNodes:", self->_nodes);
  objc_msgSend(v4, "setOutputNode:", self->_outputNode);
  objc_msgSend(v4, "setAttributes:", self->_attributes);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLFunctionStitchingGraph;
  -[MTLFunctionStitchingGraph dealloc](&v3, sel_dealloc);
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  NSArray *nodes;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSArray *attributes;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t outputNode;
  id v25;
  MTLFunctionStitchingGraph *v27;
  objc_super v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[12];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3 + 4;
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v27 = self;
  nodes = self->_nodes;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(nodes);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (v9)
          objc_msgSend(v9, "appendString:", v5);
        else
          v9 = (id)objc_opt_new();
        objc_msgSend(v9, "appendString:", objc_msgSend(v12, "formattedDescription:", v4));
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  attributes = self->_attributes;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](attributes, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(attributes);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        if (v16)
          objc_msgSend(v16, "appendString:", v5);
        else
          v16 = (id)objc_opt_new();
        objc_msgSend(v16, "appendString:", objc_msgSend(v19, "formattedDescription:", v4));
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](attributes, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }
  v20 = (void *)MEMORY[0x1E0CB3940];
  v28.receiver = v27;
  v28.super_class = (Class)MTLFunctionStitchingGraph;
  v21 = -[MTLFunctionStitchingGraph description](&v28, sel_description);
  v37[0] = v5;
  v37[1] = CFSTR("functionName =");
  v37[2] = v27->_functionName;
  v37[3] = v5;
  v22 = (void *)MEMORY[0x1E0C9AA60];
  if (v9)
    v23 = v9;
  else
    v23 = (id)MEMORY[0x1E0C9AA60];
  v37[4] = CFSTR("nodes =");
  v37[5] = v23;
  v37[6] = v5;
  v37[7] = CFSTR("outputNode =");
  outputNode = (uint64_t)v27->_outputNode;
  if (!outputNode)
    outputNode = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v37[8] = outputNode;
  v37[9] = v5;
  if (v16)
    v25 = v16;
  else
    v25 = v22;
  v37[10] = CFSTR("attributes =");
  v37[11] = v25;
  return (id)objc_msgSend(v20, "stringWithFormat:", CFSTR("%@%@"), v21, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 12), "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLFunctionStitchingGraph formattedDescription:](self, "formattedDescription:", 0);
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(NSString *)functionName
{
  objc_setProperty_nonatomic_copy(self, a2, functionName, 8);
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void)setNodes:(NSArray *)nodes
{
  objc_setProperty_nonatomic_copy(self, a2, nodes, 16);
}

- (MTLFunctionStitchingFunctionNode)outputNode
{
  return self->_outputNode;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(NSArray *)attributes
{
  objc_setProperty_nonatomic_copy(self, a2, attributes, 32);
}

@end
