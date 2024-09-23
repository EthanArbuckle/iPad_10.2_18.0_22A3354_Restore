@implementation PHASEGeometryView

- (PHASEGeometryView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHASEGeometryView;
  return -[PHASEGeometryView init](&v3, sel_init);
}

- (PHASEGeometryView)initWithEngine:(id)a3 handle:(Handle64)a4
{
  id v6;
  PHASEGeometryView *v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHASEGeometryView;
  v7 = -[PHASEGeometryView init](&v9, sel_init);
  objc_storeWeak((id *)&v7->_engine, v6);
  v7->_geoShapeHandle = a4;

  return v7;
}

+ (void)geometryViewWithObject:(id)a3 index:(unint64_t)a4 callback:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _BYTE v23[24];
  _BYTE *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  if (!v7)
    __assert_rtn("+[PHASEGeometryView geometryViewWithObject:index:callback:]", "PHASEGeometryView.mm", 298, "object");
  objc_msgSend(v7, "engine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    __assert_rtn("+[PHASEGeometryView geometryViewWithObject:index:callback:]", "PHASEGeometryView.mm", 299, "object.engine");

  objc_msgSend(v7, "geoShapeHandles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") <= a4)
    __assert_rtn("+[PHASEGeometryView geometryViewWithObject:index:callback:]", "PHASEGeometryView.mm", 301, "index < object.geoShapeHandles.count");

  objc_msgSend(v7, "geoShapeHandles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedLongLongValue");

  objc_msgSend(v7, "engine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = _Block_copy(v8);
  objc_msgSend(v7, "engine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(objc_msgSend(v16, "implementation") + 368);
  v18 = v14;
  v19 = _Block_copy(v15);
  v20 = operator new(0x20uLL);
  *v20 = &off_24D57F518;
  v20[1] = v13;
  v20[2] = v18;
  v20[3] = v19;
  v24 = v20;
  (*(void (**)(uint64_t, uint64_t, _BYTE *))(*(_QWORD *)v17 + 376))(v17, v13, v23);
  v21 = v24;
  if (v24 == v23)
  {
    v22 = 4;
    v21 = v23;
    goto LABEL_8;
  }
  if (v24)
  {
    v22 = 5;
LABEL_8:
    (*(void (**)(void))(*v21 + 8 * v22))();
  }

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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engine);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

+ (uint64_t)geometryViewWithObject:index:callback:
{

  return a1;
}

+ (void)geometryViewWithObject:index:callback:
{
  PHASEVoxelTreeView *v4;
  PHASEVoxelTreeView *v5;
  PHASEVoxelTreeView *v6;

  if (*a3)
  {
    if (*a2 == 2)
    {
      v4 = -[PHASEVoxelTreeView initWithEngine:shapeHandle:voxelTreeInfo:]([PHASEVoxelTreeView alloc], "initWithEngine:shapeHandle:voxelTreeInfo:", a1[2], a1[1], *a3);
      goto LABEL_7;
    }
    if (*a2 == 1)
    {
      v4 = -[PHASEMeshView initWithEngine:handle:]([PHASEMeshView alloc], "initWithEngine:handle:", a1[2], a1[1]);
LABEL_7:
      v5 = v4;
      goto LABEL_8;
    }
  }
  v5 = 0;
LABEL_8:
  v6 = v5;
  (*(void (**)(void))(a1[3] + 16))();

}

+ (_QWORD)geometryViewWithObject:index:callback:
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = operator new(0x20uLL);
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(void **)(a1 + 16);
  *v2 = &off_24D57F518;
  v2[1] = v3;
  v2[2] = v4;
  v2[3] = _Block_copy(*(const void **)(a1 + 24));
  return v2;
}

@end
