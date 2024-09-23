@implementation GVHorizontalRank

- (GVHorizontalRank)initWithSeparation:(CGSize)a3
{
  double width;
  GVHorizontalRank *result;
  objc_super v5;

  width = a3.width;
  v5.receiver = self;
  v5.super_class = (Class)GVHorizontalRank;
  result = -[GVRank initWithSeparation:](&v5, sel_initWithSeparation_, a3.width, a3.height);
  if (result)
    result->super.separation = width;
  return result;
}

- (double)width
{
  double v3;
  NSMutableArray *nodes;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = self->super.separation * (double)(unint64_t)(-[NSMutableArray count](self->super.nodes, "count") - 1);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  nodes = self->super.nodes;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(nodes);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "w");
        v3 = v3 + v9;
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (double)height
{
  NSMutableArray *nodes;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  nodes = self->super.nodes;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0.0;
  v4 = v3;
  v5 = *(_QWORD *)v11;
  v6 = 0.0;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(nodes);
      objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "h");
      if (v6 < v8)
        v6 = v8;
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v6;
}

- (CGSize)sizeForDummy
{
  NSMutableArray *nodes;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  double v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;
  CGSize result;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  nodes = self->super.nodes;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(nodes);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "h");
        if (v6 < v8)
          v6 = v8;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }
  v9 = 20.0;
  v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)centerNodesWithRespectoTo:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t (*v11)(uint64_t, void *);
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double j;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *i;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;

  if (self->super.prev == a3)
  {
    v5 = (void *)-[NSMutableArray mutableCopy](self->super.nodes, "mutableCopy");
    objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_137);
    v6 = &__block_literal_global;
  }
  else
  {
    if (self->super.next != a3)
      -[GVHorizontalRank centerNodesWithRespectoTo:].cold.1();
    v5 = (void *)-[NSMutableArray mutableCopy](self->super.nodes, "mutableCopy");
    objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_138);
    v6 = &__block_literal_global_47;
  }
  v7 = (void *)objc_msgSend(v5, "reverseObjectEnumerator");
  v8 = objc_msgSend(v7, "nextObject");
  if (v8)
  {
    v9 = (void *)v8;
    do
    {
      v10 = (void *)objc_msgSend(a3, "neighborsOfNode:", v9);
      if (objc_msgSend(v10, "count"))
      {
        v11 = (uint64_t (*)(uint64_t, void *))*((_QWORD *)v6 + 2);
        v12 = v11((uint64_t)v6, v9);
        medianX(v10);
        v14 = v13;
        objc_msgSend(v9, "cx");
        v16 = v14 - v15;
        if (v14 - v15 >= 0.0)
        {
          v19 = objc_msgSend(v9, "next");
          if (v19)
          {
            v20 = (void *)v19;
            while (v11((uint64_t)v6, v20) < v12)
            {
              v20 = (void *)objc_msgSend(v20, "next");
              if (!v20)
                goto LABEL_32;
            }
            objc_msgSend(v20, "x");
            v37 = v36;
            for (i = v20; ; i = v39)
            {
              v39 = (void *)objc_msgSend(i, "prev");
              if (v39 == (void *)objc_msgSend(v9, "prev"))
                break;
              objc_msgSend(v39, "w");
              v37 = v37 - (v40 + self->super.separation);
            }
            objc_msgSend(v9, "x");
            v42 = v37 - v41;
            if (v16 >= v42)
              v16 = v42;
          }
LABEL_32:
          objc_msgSend(v9, "x");
          objc_msgSend(v9, "setX:", v16 + v43);
          if (objc_msgSend(v9, "next"))
          {
            do
            {
              v44 = (void *)objc_msgSend(v9, "next");
              objc_msgSend(v44, "x");
              v46 = v45;
              objc_msgSend(v9, "x");
              v48 = v47;
              objc_msgSend(v9, "w");
              if (v46 >= v48 + v49 + self->super.separation)
                break;
              objc_msgSend(v9, "x");
              v51 = v50;
              objc_msgSend(v9, "w");
              objc_msgSend(v44, "setX:", v51 + v52 + self->super.separation);
              v9 = v44;
            }
            while (objc_msgSend(v44, "next"));
          }
        }
        else
        {
          v17 = objc_msgSend(v9, "prev");
          if (v17)
          {
            v18 = (void *)v17;
            while (v11((uint64_t)v6, v18) < v12)
            {
              v18 = (void *)objc_msgSend(v18, "prev");
              if (!v18)
                goto LABEL_23;
            }
            objc_msgSend(v18, "x");
            for (j = v21; v18 != v9; v18 = (void *)objc_msgSend(v18, "next"))
            {
              objc_msgSend(v18, "w");
              j = j + v23 + self->super.separation;
            }
            objc_msgSend(v9, "x");
            v25 = j - v24;
            if (v16 < v25)
              v16 = v25;
          }
LABEL_23:
          objc_msgSend(v9, "x");
          objc_msgSend(v9, "setX:", v16 + v26);
          if (objc_msgSend(v9, "prev"))
          {
            do
            {
              v27 = (void *)objc_msgSend(v9, "prev");
              objc_msgSend(v27, "x");
              v29 = v28;
              objc_msgSend(v9, "x");
              v31 = v30 - self->super.separation;
              objc_msgSend(v27, "w");
              if (v29 <= v31 - v32)
                break;
              objc_msgSend(v9, "x");
              v34 = v33 - self->super.separation;
              objc_msgSend(v27, "w");
              objc_msgSend(v27, "setX:", v34 - v35);
              v9 = v27;
            }
            while (objc_msgSend(v27, "prev"));
          }
        }
      }
      v9 = (void *)objc_msgSend(v7, "nextObject");
    }
    while (v9);
  }
}

- (void)centerNode:(id)a3 at:(double)a4
{
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  objc_msgSend(a3, "cx");
  v8 = a4 - v7;
  if (a4 - v7 >= 0.0)
  {
    v18 = (void *)objc_msgSend(a3, "next");
    if (v18)
    {
      objc_msgSend(v18, "x");
      v20 = v19;
      objc_msgSend(a3, "w");
      v22 = v20 - v21 - self->super.separation;
      objc_msgSend(a3, "x");
      v24 = v22 - v23;
      if (v8 >= v24)
        v17 = v24;
      else
        v17 = v8;
      goto LABEL_10;
    }
  }
  else
  {
    v9 = (void *)objc_msgSend(a3, "prev");
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, "x");
      v12 = v11;
      objc_msgSend(v10, "w");
      v14 = v12 + v13 + self->super.separation;
      objc_msgSend(a3, "x");
      v16 = v14 - v15;
      if (v8 >= v16)
        v17 = v8;
      else
        v17 = v16;
LABEL_10:
      objc_msgSend(a3, "x");
      objc_msgSend(a3, "setX:", v25 + v17);
      return;
    }
  }
  objc_msgSend(a3, "setCx:", a4);
}

- (void)centerNodesWithRespectoTo:.cold.1()
{
  __assert_rtn("-[GVHorizontalRank centerNodesWithRespectoTo:]", "GVLayout.m", 423, "rank == prev || rank == next");
}

@end
