@implementation CKQuadTree

- (CKQuadTree)init
{
  return -[CKQuadTree initWithPoints:](self, "initWithPoints:", 0);
}

- (CKQuadTree)initWithPoints:(id)a3
{
  id v5;
  CKQuadTree *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t i;
  double v16;
  double v17;
  double v18;
  double v19;
  CKQuadTreeNode *v20;
  CKQuadTreeNode *rootNode;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  CKQuadTreeNode *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKQuadTree.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points"));

  }
  v38.receiver = self;
  v38.super_class = (Class)CKQuadTree;
  v6 = -[CKQuadTree init](&v38, sel_init);
  if (v6)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v35;
      v11 = 1.79769313e308;
      v12 = 2.22507386e-308;
      v13 = 2.22507386e-308;
      v14 = 1.79769313e308;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "CGPointValue");
          if (v16 > v13)
            v13 = v16;
          if (v16 < v14)
            v14 = v16;
          if (v17 > v12)
            v12 = v17;
          if (v17 < v11)
            v11 = v17;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 1.79769313e308;
      v12 = 2.22507386e-308;
      v13 = 2.22507386e-308;
      v14 = 1.79769313e308;
    }

    v18 = v13 - v14;
    if (v13 - v14 < v12 - v11)
      v18 = v12 - v11;
    v19 = ceil(v18 + 1.0);
    v20 = -[CKQuadTreeNode initWithBounds:]([CKQuadTreeNode alloc], "initWithBounds:", floor(v14), floor(v11), v19, v19);
    rootNode = v6->_rootNode;
    v6->_rootNode = v20;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = v7;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v22);
          v27 = v6->_rootNode;
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "CGPointValue");
          -[CKQuadTreeNode insertPoint:](v27, "insertPoint:");
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v24);
    }

  }
  return v6;
}

- (void)visit:(id)a3
{
  -[CKQuadTreeNode visit:](self->_rootNode, "visit:", a3);
}

- (CKQuadTreeNode)rootNode
{
  return self->_rootNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootNode, 0);
}

@end
