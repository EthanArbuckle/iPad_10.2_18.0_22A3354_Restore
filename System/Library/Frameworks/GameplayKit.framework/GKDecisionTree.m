@implementation GKDecisionTree

- (GKDecisionTree)init
{
  GKDecisionTree *v2;
  GKCDecisionTree *v3;
  uint64_t v4;
  GKDecisionNode *v5;
  GKDecisionNode *rootNode;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKDecisionTree;
  v2 = -[GKDecisionTree init](&v8, sel_init);
  if (v2)
  {
    v3 = (GKCDecisionTree *)operator new();
    v3->var0 = 0;
    v3->var1 = 0;
    v4 = operator new();
    *(_OWORD *)v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(_OWORD *)(v4 + 48) = 0u;
    *(_OWORD *)(v4 + 64) = 0u;
    *(_QWORD *)(v4 + 80) = 0;
    *(_OWORD *)(v4 + 32) = xmmword_227BC0080;
    v3->var0 = (GKCDecisionNode *)v4;
    v3->var1 = (GKCDecisionNode *)v4;
    v2->_decisionTree = v3;
    v5 = -[GKDecisionNode initWithNode:tree:]([GKDecisionNode alloc], "initWithNode:tree:", v2->_decisionTree->var0, v2);
    rootNode = v2->_rootNode;
    v2->_rootNode = v5;

    v2->_isInduced = 0;
  }
  return v2;
}

- (GKDecisionTree)initWithAttribute:(id)attribute
{
  id v5;
  GKDecisionTree *v6;
  GKDecisionTree *v7;
  GKDecisionNode *v8;

  v5 = attribute;
  v6 = -[GKDecisionTree init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)v6->_decisionTree->var0 + 6, attribute);
    v8 = -[GKDecisionNode initWithNode:tree:]([GKDecisionNode alloc], "initWithNode:tree:", v7->_decisionTree->var0, v7);
    -[GKDecisionTree setRootNode:](v7, "setRootNode:", v8);

    v7->_isInduced = 0;
  }

  return v7;
}

- (GKDecisionTree)initWithCoder:(id)a3
{
  id v4;
  GKDecisionTree *v5;
  GKCDecisionTree *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSArray *v12;
  id v13;
  GKDecisionNode *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  uint64_t v19;
  MLGKDecisionTree *mlkitDecisionTree;
  id v22;
  _QWORD v23[16];

  v23[15] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[GKDecisionTree init](self, "init");
  if (v5)
  {
    v6 = (GKCDecisionTree *)operator new();
    v6->var0 = 0;
    v6->var1 = 0;
    v7 = operator new();
    *(_OWORD *)v7 = 0u;
    *(_OWORD *)(v7 + 16) = 0u;
    *(_OWORD *)(v7 + 48) = 0u;
    *(_OWORD *)(v7 + 64) = 0u;
    *(_QWORD *)(v7 + 80) = 0;
    *(_OWORD *)(v7 + 32) = xmmword_227BC0080;
    v6->var0 = (GKCDecisionNode *)v7;
    v6->var1 = (GKCDecisionNode *)v7;
    v5->_decisionTree = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rand"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDecisionTree setRandomSource:](v5, "setRandomSource:", v8);

    v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v23[3] = objc_opt_class();
    v23[4] = objc_opt_class();
    v23[5] = objc_opt_class();
    v23[6] = objc_opt_class();
    v23[7] = objc_opt_class();
    v23[8] = objc_opt_class();
    v23[9] = objc_opt_class();
    v23[10] = objc_opt_class();
    v23[11] = objc_opt_class();
    v23[12] = objc_opt_class();
    v23[13] = objc_opt_class();
    v23[14] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v10);

    objc_msgSend(v4, "allowedClasses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unionSet:", v11);

    v22 = 0;
    objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v9, CFSTR("tree"), &v22);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v13 = v22;
    NSLog(CFSTR("GKDecisionTree: Encountered an error decoding: %@"), v13);
    GKCDecisionTree::decode(v5->_decisionTree, v12);
    v14 = -[GKDecisionNode initWithNode:tree:]([GKDecisionNode alloc], "initWithNode:tree:", v5->_decisionTree->var0, v5);
    -[GKDecisionTree setRootNode:](v5, "setRootNode:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("induced"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");
    v5->_isInduced = v16;
    if (v16)
    {
      v17 = objc_alloc(MEMORY[0x24BDBFFA8]);
      GKCDecisionTree::encodeWithCoder(v5->_decisionTree, 0, 0, 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "_initWithFlattenedTree:", v18);
      mlkitDecisionTree = v5->mlkitDecisionTree;
      v5->mlkitDecisionTree = (MLGKDecisionTree *)v19;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[GKDecisionTree randomSource](self, "randomSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("rand"));

  GKCDecisionTree::encodeWithCoder(self->_decisionTree, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("tree"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isInduced);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("induced"));

}

- (void)dealloc
{
  GKCDecisionTree *decisionTree;
  objc_super v4;

  -[GKDecisionTree setRootNode:](self, "setRootNode:", 0);
  decisionTree = self->_decisionTree;
  if (decisionTree)
  {
    if (decisionTree->var0)
    {
      GKCDecisionNode::~GKCDecisionNode(decisionTree->var0);
      MEMORY[0x22E2A50A0]();
    }
    decisionTree->var0 = 0;
    decisionTree->var1 = 0;
    MEMORY[0x22E2A50A0](decisionTree, 0x20C40A4A59CD2);
  }
  v4.receiver = self;
  v4.super_class = (Class)GKDecisionTree;
  -[GKDecisionTree dealloc](&v4, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKDecisionTree)initWithExamples:(NSArray *)examples actions:(NSArray *)actions attributes:(NSArray *)attributes
{
  return -[GKDecisionTree initWithExamples:actions:attributes:maxDepth:minSamplesSplit:](self, "initWithExamples:actions:attributes:maxDepth:minSamplesSplit:", examples, actions, attributes, 1000000000, 0);
}

- (GKDecisionTree)initWithExamples:(id)a3 actions:(id)a4 attributes:(id)a5 maxDepth:(unint64_t)a6 minSamplesSplit:(unint64_t)a7
{
  id v10;
  GKDecisionTree *v11;
  GKDecisionTree *v12;
  GKCDecisionTree *decisionTree;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *v18;
  id v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  MLGKDecisionTree *mlkitDecisionTree;
  GKCDecisionTree *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSArray *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v41 = a4;
  v40 = (NSArray *)a5;
  v11 = -[GKDecisionTree init](self, "init");
  v12 = v11;
  if (!v11)
    goto LABEL_23;
  decisionTree = v11->_decisionTree;
  if (!decisionTree || !decisionTree->var0)
    goto LABEL_23;
  v14 = objc_msgSend(v10, "count");
  if (v14 != objc_msgSend(v41, "count"))
  {
    NSLog(CFSTR("GKDecisionTree: Mismatch between the number of actions provided: %tu and the number of examples provided: %tu"), objc_msgSend(v41, "count"), objc_msgSend(v10, "count"));
    v33 = (GKCDecisionTree *)operator new();
    v33->var0 = 0;
    v33->var1 = 0;
    v34 = operator new();
LABEL_22:
    *(_OWORD *)v34 = 0u;
    *(_OWORD *)(v34 + 16) = 0u;
    *(_OWORD *)(v34 + 48) = 0u;
    *(_OWORD *)(v34 + 64) = 0u;
    *(_QWORD *)(v34 + 80) = 0;
    *(_OWORD *)(v34 + 32) = xmmword_227BC0080;
    v33->var0 = (GKCDecisionNode *)v34;
    v33->var1 = (GKCDecisionNode *)v34;
    v12->_decisionTree = v33;
    goto LABEL_23;
  }
  objc_msgSend(v10, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  v17 = -[NSArray count](v40, "count");

  if (v16 != v17)
  {
    v35 = -[NSArray count](v40, "count");
    objc_msgSend(v10, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("GKDecisionTree: Mismatch between the number of attributes provided: %tu and the number of attributes per example: %tu"), v35, objc_msgSend(v36, "count"));

    v33 = (GKCDecisionTree *)operator new();
    v33->var0 = 0;
    v33->var1 = 0;
    v34 = operator new();
    goto LABEL_22;
  }
  v18 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v19 = v41;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v20)
  {
    v21 = 0;
    v22 = *(_QWORD *)v43;
    do
    {
      v23 = 0;
      v24 = v21;
      do
      {
        if (*(_QWORD *)v43 != v22)
          objc_enumerationMutation(v19);
        v25 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v23);
        objc_msgSend(v10, "objectAtIndexedSubscript:", v24 + v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "arrayByAddingObject:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v18, "addObject:", v27);

        ++v23;
      }
      while (v20 != v23);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      v21 = v24 + v23;
    }
    while (v20);
  }

  if (a6)
    v28 = a6;
  else
    v28 = 1000000000;
  GKCDecisionTree::cartTreeGrowth(v12->_decisionTree, v18, v40, v12->_decisionTree->var0, v28, a7);
  if (!a7 && v28 == 1000000000)
  {
    v29 = objc_alloc(MEMORY[0x24BDBFFA8]);
    GKCDecisionTree::encodeWithCoder(v12->_decisionTree, 0, 0, 0, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "_initWithFlattenedTree:", v30);
    mlkitDecisionTree = v12->mlkitDecisionTree;
    v12->mlkitDecisionTree = (MLGKDecisionTree *)v31;

    v12->_isInduced = 1;
  }

LABEL_23:
  return v12;
}

- (GKDecisionTree)initWithURL:(NSURL *)url error:(NSError *)error
{
  NSURL *v6;
  NSError *v7;
  void *v8;
  NSError *v9;
  GKDecisionTree *v10;
  NSError *v11;
  GKDecisionTree *v12;
  MLGKDecisionTree *v13;
  MLGKDecisionTree *mlkitDecisionTree;
  GKDecisionTree *v15;
  NSError *v17;
  NSError *v18;

  v6 = url;
  v7 = error;
  v18 = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:options:error:", v6, 2, &v18);
  v9 = v18;

  v17 = v9;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v17);
  v10 = (GKDecisionTree *)objc_claimAutoreleasedReturnValue();
  v11 = v17;

  if (v11 || !v8)
  {
    v12 = objc_alloc_init(GKDecisionTree);

    v12->_isInduced = 1;
    v13 = (MLGKDecisionTree *)objc_alloc_init(MEMORY[0x24BDBFFA8]);
    mlkitDecisionTree = v12->mlkitDecisionTree;
    v12->mlkitDecisionTree = v13;

    -[MLGKDecisionTree _loadModelAssetWithModelAtPath:withError:](v12->mlkitDecisionTree, "_loadModelAssetWithModelAtPath:withError:", v6, v11);
  }
  else
  {
    v12 = v10;
  }
  v15 = v12;

  return v15;
}

- (BOOL)exportToURL:(NSURL *)url error:(NSError *)error
{
  NSURL *v6;
  NSError *v7;
  char v8;
  void *v9;
  NSError *v10;
  NSError *v12;

  v6 = url;
  v7 = error;
  if (self->_isInduced)
  {
    v8 = -[MLGKDecisionTree _saveModelAssetWithModelToPath:withError:](self->mlkitDecisionTree, "_saveModelAssetWithModelToPath:withError:", v6, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    v8 = objc_msgSend(v9, "writeToURL:options:error:", v6, 1, &v12);
    v10 = v12;

    v7 = v10;
  }

  return v8;
}

- (id)getFlattenedTree
{
  return GKCDecisionTree::encodeWithCoder(self->_decisionTree, 0, 0, 0, 0);
}

- (id)findActionForAnswers:(NSDictionary *)answers
{
  NSDictionary *v4;
  void *v5;

  v4 = answers;
  if (self->_isInduced)
    -[MLGKDecisionTree _makeInferenceFromAnswers:withError:](self->mlkitDecisionTree, "_makeInferenceFromAnswers:withError:", v4, 0);
  else
    GKCDecisionTree::findActionForAnswers((uint64_t **)self->_decisionTree, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)findAccuracyWithExamples:(id)a3 actions:(id)a4 attributes:(id)a5
{
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  id obj;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v28 = a4;
  v29 = a5;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v8)
  {
    v32 = 0;
    v9 = 0;
    v27 = *(_QWORD *)v38;
    do
    {
      v10 = 0;
      v30 = v8;
      do
      {
        v31 = v9;
        if (*(_QWORD *)v38 != v27)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v10);
        v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v13 = v29;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v14)
        {
          v15 = 0;
          v16 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v34 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_msgSend(v11, "objectAtIndexedSubscript:", v15 + i);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKey:", v19, v18);

            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            v15 += i;
          }
          while (v14);
        }

        -[GKDecisionTree findActionForAnswers:](self, "findActionForAnswers:", v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndexedSubscript:", v32);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqual:", v20);

        v9 = v31 + v22;
        ++v32;
        ++v10;
      }
      while (v10 != v30);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9 / objc_msgSend(obj, "count"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)description
{
  GKCDecisionTree *decisionTree;

  decisionTree = self->_decisionTree;
  if (!decisionTree || !decisionTree->var0)
    return &stru_24F04FAF0;
  GKCDecisionTree::printTree(decisionTree, decisionTree->var0, CFSTR("\t"), CFSTR("-"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (GKDecisionNode)rootNode
{
  return self->_rootNode;
}

- (void)setRootNode:(id)a3
{
  objc_storeStrong((id *)&self->_rootNode, a3);
}

- (GKRandomSource)randomSource
{
  return self->_randomSource;
}

- (void)setRandomSource:(GKRandomSource *)randomSource
{
  objc_setProperty_nonatomic_copy(self, a2, randomSource, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomSource, 0);
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_storeStrong((id *)&self->mlkitDecisionTree, 0);
}

@end
