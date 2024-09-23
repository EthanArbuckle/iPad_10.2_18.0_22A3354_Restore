@implementation GESSIOTriMeshCreator

- (BOOL)setPositions:(float *)a3 size:(unint64_t)a4
{
  void *v5;
  BOOL v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, 4 * a4, 0);
  v6 = -[GESSIOPolyMeshCreator setPositionData:](self, "setPositionData:", v5);

  return v6;
}

- (BOOL)setFaces:(unsigned int *)a3 size:(unint64_t)a4
{
  void *v5;
  BOOL v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, 4 * a4, 0);
  v6 = -[GESSIOPolyMeshCreator setFaceData:](self, "setFaceData:", v5);

  return v6;
}

- (BOOL)setVertexNormals:(float *)a3 size:(unint64_t)a4
{
  void *v5;
  BOOL v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, 4 * a4, 0);
  v6 = -[GESSIOPolyMeshCreator setVertexNormalData:](self, "setVertexNormalData:", v5);

  return v6;
}

- (BOOL)setVertexNormalFaces:(unsigned int *)a3 size:(unint64_t)a4
{
  void *v5;
  BOOL v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, 4 * a4, 0);
  v6 = -[GESSIOPolyMeshCreator setVertexNormalFaceData:](self, "setVertexNormalFaceData:", v5);

  return v6;
}

- (BOOL)setVertexColors:(float *)a3 size:(unint64_t)a4
{
  void *v5;
  BOOL v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, 4 * a4, 0);
  v6 = -[GESSIOPolyMeshCreator setVertexColorData:](self, "setVertexColorData:", v5);

  return v6;
}

- (BOOL)setTexCoords:(float *)a3 size:(unint64_t)a4
{
  void *v5;
  BOOL v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, 4 * a4, 0);
  v6 = -[GESSIOPolyMeshCreator setTexCoordData:](self, "setTexCoordData:", v5);

  return v6;
}

- (BOOL)setTexCoordFaces:(unsigned int *)a3 size:(unint64_t)a4
{
  void *v5;
  BOOL v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, 4 * a4, 0);
  v6 = -[GESSIOPolyMeshCreator setTexCoordFaceData:](self, "setTexCoordFaceData:", v5);

  return v6;
}

- (BOOL)setFaceGroupIDs:(unsigned __int16 *)a3 size:(unint64_t)a4
{
  void *v5;
  BOOL v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, 2 * a4, 0);
  v6 = -[GESSIOPolyMeshCreator setFaceGroupIDData:](self, "setFaceGroupIDData:", v5);

  return v6;
}

- (BOOL)create:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GESSIOTriMeshCreator;
  return -[GESSIOPolyMeshCreator create:](&v4, sel_create_, a3);
}

@end
