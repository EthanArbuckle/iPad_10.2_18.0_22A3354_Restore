@implementation GVVerticalRank

- (GVVerticalRank)initWithSeparation:(CGSize)a3
{
  double height;
  GVVerticalRank *result;
  objc_super v5;

  height = a3.height;
  v5.receiver = self;
  v5.super_class = (Class)GVVerticalRank;
  result = -[GVRank initWithSeparation:](&v5, sel_initWithSeparation_, a3.width);
  if (result)
    result->super.separation = height;
  return result;
}

- (double)width
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
      objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "w");
      if (v6 < v8)
        v6 = v8;
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nodes, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v6;
}

- (double)height
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "h");
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
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)centerNodesWithRespectoTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t (*v10)(uint64_t, void *);
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double j;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *i;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;

  if (self->super.prev == a3)
  {
    v4 = (void *)-[NSMutableArray mutableCopy](self->super.nodes, "mutableCopy");
    objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_137);
    v5 = &__block_literal_global_51;
  }
  else
  {
    if (self->super.next != a3)
      -[GVVerticalRank centerNodesWithRespectoTo:].cold.1();
    v4 = (void *)-[NSMutableArray mutableCopy](self->super.nodes, "mutableCopy");
    objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_138);
    v5 = &__block_literal_global_53;
  }
  v6 = (void *)objc_msgSend(v4, "reverseObjectEnumerator");
  v7 = objc_msgSend(v6, "nextObject");
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      v9 = -[GVRank neighborsOfNode:](self->super.prev, "neighborsOfNode:", v8);
      if (objc_msgSend(v9, "count"))
      {
        v10 = (uint64_t (*)(uint64_t, void *))*((_QWORD *)v5 + 2);
        v11 = v10((uint64_t)v5, v8);
        medianY(v9);
        v13 = v12;
        objc_msgSend(v8, "cy");
        v15 = v13 - v14;
        if (v13 - v14 >= 0.0)
        {
          v18 = objc_msgSend(v8, "next");
          if (v18)
          {
            v19 = (void *)v18;
            while (v10((uint64_t)v5, v19) < v11)
            {
              v19 = (void *)objc_msgSend(v19, "next");
              if (!v19)
                goto LABEL_32;
            }
            objc_msgSend(v19, "y");
            v36 = v35;
            for (i = v19; ; i = v38)
            {
              v38 = (void *)objc_msgSend(i, "prev");
              if (v38 == (void *)objc_msgSend(v8, "prev"))
                break;
              objc_msgSend(v38, "h");
              v36 = v36 - (v39 + self->super.separation);
            }
            objc_msgSend(v8, "y");
            v41 = v36 - v40;
            if (v15 >= v41)
              v15 = v41;
          }
LABEL_32:
          objc_msgSend(v8, "x");
          objc_msgSend(v8, "setX:", v15 + v42);
          if (objc_msgSend(v8, "next"))
          {
            do
            {
              v43 = (void *)objc_msgSend(v8, "next");
              objc_msgSend(v43, "x");
              v45 = v44;
              objc_msgSend(v8, "y");
              v47 = v46;
              objc_msgSend(v8, "h");
              if (v45 >= v47 + v48 + self->super.separation)
                break;
              objc_msgSend(v8, "y");
              v50 = v49;
              objc_msgSend(v8, "h");
              objc_msgSend(v43, "setX:", v50 + v51 + self->super.separation);
              v8 = v43;
            }
            while (objc_msgSend(v43, "next"));
          }
        }
        else
        {
          v16 = objc_msgSend(v8, "prev");
          if (v16)
          {
            v17 = (void *)v16;
            while (v10((uint64_t)v5, v17) < v11)
            {
              v17 = (void *)objc_msgSend(v17, "prev");
              if (!v17)
                goto LABEL_23;
            }
            objc_msgSend(v17, "y");
            for (j = v20; v17 != v8; v17 = (void *)objc_msgSend(v17, "next"))
            {
              objc_msgSend(v17, "h");
              j = j + v22 + self->super.separation;
            }
            objc_msgSend(v8, "y");
            v24 = j - v23;
            if (v15 < v24)
              v15 = v24;
          }
LABEL_23:
          objc_msgSend(v8, "y");
          objc_msgSend(v8, "setY:", v15 + v25);
          if (objc_msgSend(v8, "prev"))
          {
            do
            {
              v26 = (void *)objc_msgSend(v8, "prev");
              objc_msgSend(v26, "y");
              v28 = v27;
              objc_msgSend(v8, "y");
              v30 = v29 - self->super.separation;
              objc_msgSend(v26, "h");
              if (v28 <= v30 - v31)
                break;
              objc_msgSend(v8, "y");
              v33 = v32 - self->super.separation;
              objc_msgSend(v26, "h");
              objc_msgSend(v26, "setY:", v33 - v34);
              v8 = v26;
            }
            while (objc_msgSend(v26, "prev"));
          }
        }
      }
      v8 = (void *)objc_msgSend(v6, "nextObject");
    }
    while (v8);
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

  objc_msgSend(a3, "cy");
  v8 = a4 - v7;
  if (a4 - v7 >= 0.0)
  {
    v18 = (void *)objc_msgSend(a3, "next");
    if (v18)
    {
      objc_msgSend(v18, "y");
      v20 = v19;
      objc_msgSend(a3, "h");
      v22 = v20 - v21 - self->super.separation;
      objc_msgSend(a3, "y");
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
      objc_msgSend(v9, "y");
      v12 = v11;
      objc_msgSend(v10, "h");
      v14 = v12 + v13 + self->super.separation;
      objc_msgSend(a3, "y");
      v16 = v14 - v15;
      if (v8 >= v16)
        v17 = v8;
      else
        v17 = v16;
LABEL_10:
      objc_msgSend(a3, "y");
      objc_msgSend(a3, "setY:", v25 + v17);
      return;
    }
  }
  objc_msgSend(a3, "setCy:", a4);
}

- (void)centerNodesWithRespectoTo:.cold.1()
{
  __assert_rtn("-[GVVerticalRank centerNodesWithRespectoTo:]", "GVLayout.m", 605, "rank == prev || rank == next");
}

@end
