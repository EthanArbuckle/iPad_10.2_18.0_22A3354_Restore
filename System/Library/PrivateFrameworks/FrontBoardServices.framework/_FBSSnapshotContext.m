@implementation _FBSSnapshotContext

- (_FBSSnapshotContext)initWithDisplayConfiguration:(id)a3 layer:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  _FBSSnapshotContext *v10;

  v6 = (objc_class *)MEMORY[0x1E0C99E40];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithObject:", v7);

  v10 = -[_FBSSnapshotContext initWithDisplayConfiguration:layers:](self, "initWithDisplayConfiguration:layers:", v8, v9);
  return v10;
}

- (_FBSSnapshotContext)initWithDisplayConfiguration:(id)a3 layers:(id)a4
{
  id v7;
  id v8;
  _FBSSnapshotContext *v9;
  _FBSSnapshotContext *v10;
  uint64_t v11;
  NSOrderedSet *layers;
  double v13;
  CGFloat v14;
  CGFloat v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_FBSSnapshotContext;
  v9 = -[_FBSSnapshotContext init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayConfiguration, a3);
    v11 = objc_msgSend(v8, "copy");
    layers = v10->_layers;
    v10->_layers = (NSOrderedSet *)v11;

    objc_msgSend(v7, "pointScale");
    v10->_scale = v13;
    objc_msgSend(v7, "bounds");
    v10->_snapshotSize.width = v14;
    v10->_snapshotSize.height = v15;
    v10->_opaque = 1;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _FBSSnapshotContext *v4;

  v4 = -[_FBSSnapshotContext initWithDisplayConfiguration:layers:]([_FBSSnapshotContext alloc], "initWithDisplayConfiguration:layers:", self->_displayConfiguration, self->_layers);
  -[_FBSSnapshotContext setOpaque:](v4, "setOpaque:", self->_opaque);
  -[_FBSSnapshotContext setScale:](v4, "setScale:", self->_scale);
  -[_FBSSnapshotContext setSnapshotSize:](v4, "setSnapshotSize:", self->_snapshotSize.width, self->_snapshotSize.height);
  -[_FBSSnapshotContext setAllowsProtectedContent:](v4, "setAllowsProtectedContent:", self->_allowsProtectedContent);
  return v4;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (NSOrderedSet)layers
{
  return self->_layers;
}

- (BOOL)isOpaque
{
  return self->_opaque;
}

- (void)setOpaque:(BOOL)a3
{
  self->_opaque = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (CGSize)snapshotSize
{
  double width;
  double height;
  CGSize result;

  width = self->_snapshotSize.width;
  height = self->_snapshotSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSnapshotSize:(CGSize)a3
{
  self->_snapshotSize = a3;
}

- (BOOL)allowsProtectedContent
{
  return self->_allowsProtectedContent;
}

- (void)setAllowsProtectedContent:(BOOL)a3
{
  self->_allowsProtectedContent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

@end
