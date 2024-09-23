@implementation PHASEMeshView

- (PHASEMeshView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHASEMeshView;
  return -[PHASEGeometryView init](&v3, sel_init);
}

- (PHASEMeshView)initWithEngine:(id)a3 handle:(Handle64)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHASEMeshView;
  return -[PHASEGeometryView initWithEngine:handle:](&v5, sel_initWithEngine_handle_, a3, a4.mData);
}

@end
