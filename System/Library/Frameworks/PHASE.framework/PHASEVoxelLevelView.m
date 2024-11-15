@implementation PHASEVoxelLevelView

- (PHASEVoxelLevelView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHASEVoxelLevelView;
  return -[PHASEVoxelLevelView init](&v3, sel_init);
}

- (PHASEVoxelLevelView)initWithEngine:(id)a3 shapeHandle:(Handle64)a4 voxelTreeInfo:(const void *)a5 subtreeIndex:(int64_t)a6 levelIndex:(int64_t)a7
{
  id v12;
  uint64_t v13;
  PHASEVoxelLevelView *v14;
  _OWORD *v15;
  objc_super v17;

  v12 = a3;
  if (!v12)
    __assert_rtn("-[PHASEVoxelLevelView initWithEngine:shapeHandle:voxelTreeInfo:subtreeIndex:levelIndex:]", "PHASEGeometryView.mm", 154, "engine");
  v13 = *(_QWORD *)(*(_QWORD *)a5 + 48 * a6);
  v17.receiver = self;
  v17.super_class = (Class)PHASEVoxelLevelView;
  v14 = -[PHASEVoxelLevelView init](&v17, sel_init);
  v15 = (_OWORD *)(v13 + 48 * a7);
  objc_storeWeak((id *)&v14->_engine, v12);
  v14->_geoShapeHandle = a4;
  v14->_subtreeIndex = a6;
  v14->_levelIndex = a7;
  *(_OWORD *)v14->_dimensions = v15[2];
  *(_OWORD *)v14->_offset = *v15;
  *(_OWORD *)v14->_voxelSize = v15[1];

  return v14;
}

- (void)getVoxelsWithCallback:(id)a3
{
  void *v4;
  id WeakRetained;
  uint64_t v6;
  Handle64 v7;
  int64_t v8;
  int64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v12[3];
  _QWORD *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = _Block_copy(a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v6 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  v7.mData = (unint64_t)-[PHASEVoxelLevelView geoShapeHandle](self, "geoShapeHandle");
  v8 = -[PHASEVoxelLevelView subtreeIndex](self, "subtreeIndex");
  v9 = -[PHASEVoxelLevelView levelIndex](self, "levelIndex");
  v12[0] = &off_24D57F4D0;
  v12[1] = _Block_copy(v4);
  v13 = v12;
  (*(void (**)(uint64_t, Handle64, int64_t, int64_t, _QWORD *))(*(_QWORD *)v6 + 392))(v6, v7, v8, v9, v12);
  v10 = v13;
  if (v13 == v12)
  {
    v11 = 4;
    v10 = v12;
    goto LABEL_5;
  }
  if (v13)
  {
    v11 = 5;
LABEL_5:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }

}

- (__n128)dimensions
{
  return a1[3];
}

- (__n128)offset
{
  return a1[4];
}

- (__n128)voxelSize
{
  return a1[5];
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

- (int64_t)levelIndex
{
  return self->_levelIndex;
}

- (void)setLevelIndex:(int64_t)a3
{
  self->_levelIndex = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engine);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (uint64_t)getVoxelsWithCallback:
{

  return a1;
}

- (void)getVoxelsWithCallback:
{
  PHASEVoxelSet3D *v4;

  v4 = -[PHASEVoxelSet3D initWithPoints:count:]([PHASEVoxelSet3D alloc], "initWithPoints:count:", *a3, *a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();

}

- (_QWORD)getVoxelsWithCallback:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_24D57F4D0;
  v2[1] = _Block_copy(*(const void **)(a1 + 8));
  return v2;
}

@end
