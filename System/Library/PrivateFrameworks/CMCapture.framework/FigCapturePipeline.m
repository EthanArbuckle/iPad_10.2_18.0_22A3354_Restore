@implementation FigCapturePipeline

- (NSString)name
{
  return self->_name;
}

- (BOOL)addNode:(id)a3 error:(id *)a4
{
  _BOOL4 v6;

  v6 = -[BWGraph addNode:error:](self->_graph, "addNode:error:", a3, a4);
  if (v6)
  {
    -[NSMutableArray addObject:](self->_nodes, "addObject:", a3);
    objc_msgSend(a3, "setSubgraphName:", self->_name);
  }
  return v6;
}

- (NSArray)nodes
{
  return &self->_nodes->super;
}

- (BWGraph)graph
{
  return self->_graph;
}

- (FigCapturePipeline)initWithGraph:(id)a3 name:(id)a4
{
  FigCapturePipeline *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FigCapturePipeline;
  v6 = -[FigCapturePipeline init](&v8, sel_init);
  if (v6)
  {
    v6->_graph = (BWGraph *)a3;
    v6->_name = (NSString *)objc_msgSend(a4, "copy");
    v6->_nodes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCapturePipeline;
  -[FigCapturePipeline dealloc](&v3, sel_dealloc);
}

- (void)removeAllNodes
{
  NSMutableArray *nodes;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  nodes = self->_nodes;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(nodes);
        -[BWGraph removeNode:](self->_graph, "removeNode:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i));
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

@end
