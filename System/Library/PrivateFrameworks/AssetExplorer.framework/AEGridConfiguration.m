@implementation AEGridConfiguration

- (unint64_t)rowCount
{
  return self->_rowCount;
}

- (void)setRowCount:(unint64_t)a3
{
  self->_rowCount = a3;
}

- (double)tileHeight
{
  return self->_tileHeight;
}

- (void)setTileHeight:(double)a3
{
  self->_tileHeight = a3;
}

- (BOOL)isOversized
{
  return self->_oversized;
}

- (void)setOversized:(BOOL)a3
{
  self->_oversized = a3;
}

+ (id)configurationForEnvironment:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  AEGridConfiguration *v21;

  v3 = a3;
  objc_msgSend(v3, "compactExtensionHeight");
  v5 = v4;
  objc_msgSend(v3, "headerHeight");
  v7 = v5 - v6;
  objc_msgSend(v3, "targetBottomMargin");
  v9 = v7 - v8;
  objc_msgSend(v3, "minimumTileHeight");
  v11 = v10;
  v12 = v10;
  v13 = v10 * 2.0 + 1.0 > v9;
  v14 = 2;
  do
  {
    v15 = v14;
    v16 = v13;
    v14 = 1;
    v13 = 0;
  }
  while (v16);
  v17 = v9 - (double)(v15 - 1);
  if (v10 * (double)v15 < v17)
  {
    objc_msgSend(v3, "scale");
    v12 = floor(v17 * v18 / (double)v15) / v18;
  }
  v19 = PXFloatGreaterThanFloat();
  if ((_DWORD)v19)
    v20 = v11 * 1.25;
  else
    v20 = v12;
  v21 = objc_alloc_init(AEGridConfiguration);
  -[AEGridConfiguration setRowCount:](v21, "setRowCount:", v15);
  -[AEGridConfiguration setTileHeight:](v21, "setTileHeight:", v20);
  -[AEGridConfiguration setOversized:](v21, "setOversized:", v19);

  return v21;
}

@end
