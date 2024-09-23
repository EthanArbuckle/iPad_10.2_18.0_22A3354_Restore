@implementation AEGridEnvironment

- (AEGridEnvironment)init
{
  AEGridEnvironment *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AEGridEnvironment;
  result = -[AEGridEnvironment init](&v3, sel_init);
  if (result)
    result->_scale = 1.0;
  return result;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  double v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  double v9;
  unint64_t v10;
  double v11;

  -[AEGridEnvironment scale](self, "scale");
  v4 = v3;
  -[AEGridEnvironment headerHeight](self, "headerHeight");
  v6 = (unint64_t)(v4 * v5);
  -[AEGridEnvironment targetBottomMargin](self, "targetBottomMargin");
  v8 = (unint64_t)(v4 * v7);
  -[AEGridEnvironment minimumTileHeight](self, "minimumTileHeight");
  v10 = (unint64_t)(v4 * v9);
  -[AEGridEnvironment compactExtensionHeight](self, "compactExtensionHeight");
  return v6 ^ (unint64_t)v4 ^ v8 ^ v10 ^ (unint64_t)(v4 * v11);
}

- (BOOL)isEqual:(id)a3
{
  AEGridEnvironment *v4;
  AEGridEnvironment *v5;
  AEGridEnvironment *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;

  v4 = (AEGridEnvironment *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  if (v4 == self)
  {
    v22 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[AEGridEnvironment headerHeight](self, "headerHeight");
    v8 = v7;
    -[AEGridEnvironment headerHeight](v6, "headerHeight");
    if (v8 != v9)
      goto LABEL_11;
    -[AEGridEnvironment targetBottomMargin](self, "targetBottomMargin");
    v11 = v10;
    -[AEGridEnvironment targetBottomMargin](v6, "targetBottomMargin");
    if (v11 != v12)
      goto LABEL_11;
    -[AEGridEnvironment minimumTileHeight](self, "minimumTileHeight");
    v14 = v13;
    -[AEGridEnvironment minimumTileHeight](v6, "minimumTileHeight");
    if (v14 == v15
      && (-[AEGridEnvironment scale](self, "scale"), v17 = v16, -[AEGridEnvironment scale](v6, "scale"), v17 == v18))
    {
      -[AEGridEnvironment compactExtensionHeight](self, "compactExtensionHeight");
      v20 = v19;
      -[AEGridEnvironment compactExtensionHeight](v6, "compactExtensionHeight");
      v22 = v20 == v21;
    }
    else
    {
LABEL_11:
      v22 = 0;
    }

  }
  else
  {
LABEL_9:
    v22 = 0;
  }
LABEL_13:

  return v22;
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

- (double)targetBottomMargin
{
  return self->_targetBottomMargin;
}

- (void)setTargetBottomMargin:(double)a3
{
  self->_targetBottomMargin = a3;
}

- (double)minimumTileHeight
{
  return self->_minimumTileHeight;
}

- (void)setMinimumTileHeight:(double)a3
{
  self->_minimumTileHeight = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)compactExtensionHeight
{
  return self->_compactExtensionHeight;
}

- (void)setCompactExtensionHeight:(double)a3
{
  self->_compactExtensionHeight = a3;
}

@end
