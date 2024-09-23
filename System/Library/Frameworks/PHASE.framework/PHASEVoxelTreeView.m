@implementation PHASEVoxelTreeView

- (PHASEVoxelTreeView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHASEVoxelTreeView;
  return -[PHASEGeometryView init](&v3, sel_init);
}

- (PHASEVoxelTreeView)initWithEngine:(id)a3 shapeHandle:(Handle64)a4 voxelTreeInfo:(const void *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  PHASESubtreeView *v12;
  PHASEVoxelTreeView *v13;
  uint64_t v14;
  NSArray *subtrees;
  const char *v17;
  int v18;
  objc_super v19;

  v8 = a3;
  if (!v8)
  {
    v17 = "engine";
    v18 = 238;
    goto LABEL_9;
  }
  if (!a5)
  {
    v17 = "voxelTreeInfo";
    v18 = 239;
LABEL_9:
    __assert_rtn("-[PHASEVoxelTreeView initWithEngine:shapeHandle:voxelTreeInfo:]", "PHASEGeometryView.mm", v18, v17);
  }
  v9 = *((_QWORD *)a5 + 5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    for (i = 0; i != v9; ++i)
    {
      v12 = -[PHASESubtreeView initWithEngine:shapeHandle:voxelTreeInfo:subtreeIndex:]([PHASESubtreeView alloc], "initWithEngine:shapeHandle:voxelTreeInfo:subtreeIndex:", v8, a4.mData, a5, i);
      objc_msgSend(v10, "setObject:atIndexedSubscript:", v12, i);

    }
  }
  v19.receiver = self;
  v19.super_class = (Class)PHASEVoxelTreeView;
  v13 = -[PHASEGeometryView initWithEngine:handle:](&v19, sel_initWithEngine_handle_, v8, a4.mData);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v10);
  v14 = objc_claimAutoreleasedReturnValue();
  subtrees = v13->_subtrees;
  v13->_subtrees = (NSArray *)v14;

  return v13;
}

- (id)levelViewWithIndex:(unint64_t)a3 inLevelIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;

  if (-[NSArray count](self->_subtrees, "count") <= a3)
  {
    v12 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_subtrees, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7
      && (objc_msgSend(v7, "levels"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "count"),
          v9,
          v10 > a4))
    {
      objc_msgSend(v8, "levels");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (NSArray)subtrees
{
  return self->_subtrees;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtrees, 0);
}

@end
