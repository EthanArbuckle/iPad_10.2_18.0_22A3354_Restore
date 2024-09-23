@implementation GESSTriMesh

- (GESSTriMesh)init
{
  GESSTriMesh *v2;
  GESSTriMesh *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GESSTriMesh;
  v2 = -[GESSTriMeshBase init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[GESSPolyMesh setMeshType:](v2, "setMeshType:", 1);
  return v3;
}

- (void)meshImpl
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GESSTriMesh;
  return -[GESSPolyMesh meshImpl](&v3, sel_meshImpl);
}

- (void)setMeshImpl:(const void *)a3
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  objc_super v9;
  uint64_t v10;
  std::__shared_weak_count *v11;

  v3 = (std::__shared_weak_count *)*((_QWORD *)a3 + 1);
  v10 = *(_QWORD *)a3;
  v11 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v9.receiver = self;
  v9.super_class = (Class)GESSTriMesh;
  -[GESSPolyMesh setMeshImpl:](&v9, sel_setMeshImpl_, &v10);
  v6 = v11;
  if (v11)
  {
    v7 = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

- (BOOL)getPositions:(float *)a3 size:(unint64_t)a4
{
  unsigned int v7;
  uint64_t v8;
  void *v9;

  v7 = -[GESSPolyMesh vertexSize](self, "vertexSize");
  v8 = 3 * v7;
  if (v8 == a4)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, 12 * v7, 0);
    -[GESSPolyMesh getPositionData:](self, "getPositionData:", v9);

  }
  return v8 == a4;
}

- (BOOL)getFaces:(unsigned int *)a3 size:(unint64_t)a4
{
  unsigned int v7;
  uint64_t v8;
  void *v9;

  v7 = -[GESSPolyMesh faceSize](self, "faceSize");
  v8 = 3 * v7;
  if (v8 == a4)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, 12 * v7, 0);
    -[GESSPolyMesh getFaceData:](self, "getFaceData:", v9);

  }
  return v8 == a4;
}

- (BOOL)getTexCoords:(float *)a3 size:(unint64_t)a4
{
  unsigned int v7;
  uint64_t v8;
  void *v9;

  v7 = -[GESSPolyMesh texCoordSize](self, "texCoordSize");
  v8 = 2 * v7;
  if (v8 == a4)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, 8 * v7, 0);
    -[GESSPolyMesh getTexCoordData:](self, "getTexCoordData:", v9);

  }
  return v8 == a4;
}

- (BOOL)getTexCoordFaces:(unsigned int *)a3 size:(unint64_t)a4
{
  unsigned int v7;
  uint64_t v8;
  void *v9;

  v7 = -[GESSPolyMesh faceSize](self, "faceSize");
  v8 = 3 * v7;
  if (v8 == a4)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, 12 * v7, 0);
    -[GESSPolyMesh getTexCoordFaceData:](self, "getTexCoordFaceData:", v9);

  }
  return v8 == a4;
}

- (BOOL)getVertexNormals:(float *)a3 size:(unint64_t)a4
{
  unsigned int v7;
  uint64_t v8;
  void *v9;

  v7 = -[GESSPolyMesh vertexNormalSize](self, "vertexNormalSize");
  v8 = 3 * v7;
  if (v8 == a4)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, 12 * v7, 0);
    -[GESSPolyMesh getVertexNormalData:](self, "getVertexNormalData:", v9);

  }
  return v8 == a4;
}

- (BOOL)getVertexNormalFaces:(unsigned int *)a3 size:(unint64_t)a4
{
  unsigned int v7;
  uint64_t v8;
  void *v9;

  v7 = -[GESSPolyMesh faceSize](self, "faceSize");
  v8 = 3 * v7;
  if (v8 == a4)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, 12 * v7, 0);
    -[GESSPolyMesh getVertexNormalFaceData:](self, "getVertexNormalFaceData:", v9);

  }
  return v8 == a4;
}

- (BOOL)getVertexColors:(float *)a3 size:(unint64_t)a4
{
  unsigned int v7;
  uint64_t v8;
  void *v9;

  v7 = -[GESSPolyMesh vertexSize](self, "vertexSize");
  v8 = 3 * v7;
  if (v8 == a4)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, 12 * v7, 0);
    -[GESSPolyMesh getVertexColorData:](self, "getVertexColorData:", v9);

  }
  return v8 == a4;
}

@end
