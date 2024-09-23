@implementation PHASESubtreeView

- (PHASESubtreeView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHASESubtreeView;
  return -[PHASESubtreeView init](&v3, sel_init);
}

- (PHASESubtreeView)initWithEngine:(id)a3 shapeHandle:(Handle64)a4 voxelTreeInfo:(const void *)a5 subtreeIndex:(int64_t)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  PHASEVoxelLevelView *v14;
  PHASESubtreeView *v15;
  uint64_t v16;
  NSArray *levels;
  objc_super v19;

  v10 = a3;
  if (!v10)
    __assert_rtn("-[PHASESubtreeView initWithEngine:shapeHandle:voxelTreeInfo:subtreeIndex:]", "PHASEGeometryView.mm", 200, "engine");
  v11 = *(_QWORD *)(*(_QWORD *)a5 + 48 * a6 + 40);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    for (i = 0; i != v11; ++i)
    {
      v14 = -[PHASEVoxelLevelView initWithEngine:shapeHandle:voxelTreeInfo:subtreeIndex:levelIndex:]([PHASEVoxelLevelView alloc], "initWithEngine:shapeHandle:voxelTreeInfo:subtreeIndex:levelIndex:", v10, a4.mData, a5, a6, i);
      objc_msgSend(v12, "setObject:atIndexedSubscript:", v14, i);

    }
  }
  v19.receiver = self;
  v19.super_class = (Class)PHASESubtreeView;
  v15 = -[PHASESubtreeView init](&v19, sel_init);
  objc_storeWeak((id *)&v15->_engine, v10);
  v15->_geoShapeHandle = a4;
  v15->_subtreeIndex = a6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v12);
  v16 = objc_claimAutoreleasedReturnValue();
  levels = v15->_levels;
  v15->_levels = (NSArray *)v16;

  return v15;
}

- (NSArray)levels
{
  return self->_levels;
}

- (PHASEEngine)engine
{
  return (PHASEEngine *)objc_loadWeakRetained((id *)&self->_engine);
}

- (void)setEngine:(id)a3
{
  objc_storeWeak((id *)&self->_engine, a3);
}

- (Handle64)geoShapeHandle
{
  return self->_geoShapeHandle;
}

- (void)setGeoShapeHandle:(Handle64)a3
{
  self->_geoShapeHandle = a3;
}

- (int64_t)subtreeIndex
{
  return self->_subtreeIndex;
}

- (void)setSubtreeIndex:(int64_t)a3
{
  self->_subtreeIndex = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engine);
  objc_storeStrong((id *)&self->_levels, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
