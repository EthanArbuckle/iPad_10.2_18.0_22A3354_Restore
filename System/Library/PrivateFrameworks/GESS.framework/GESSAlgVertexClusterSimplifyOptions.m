@implementation GESSAlgVertexClusterSimplifyOptions

- (GESSAlgVertexClusterSimplifyOptions)init
{
  GESSAlgVertexClusterSimplifyOptions *v2;
  double v3;
  GESSAlgVertexClusterSimplifyOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GESSAlgVertexClusterSimplifyOptions;
  v2 = -[GESSAlgVertexClusterSimplifyOptions init](&v6, sel_init);
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 1.0;
    -[GESSAlgVertexClusterSimplifyOptions setVoxelSize:](v2, "setVoxelSize:", v3);
  }
  return v4;
}

- (float)voxelSize
{
  return self->voxelSize;
}

- (void)setVoxelSize:(float)a3
{
  self->voxelSize = a3;
}

@end
