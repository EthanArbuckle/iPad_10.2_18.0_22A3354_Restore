@implementation GESSTriMeshBase

- (GESSTriMeshBase)init
{
  GESSTriMeshBase *v2;
  GESSTriMeshBase *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GESSTriMeshBase;
  v2 = -[GESSPolyMesh init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[GESSPolyMesh setMeshType:](v2, "setMeshType:", 0);
  return v3;
}

@end
