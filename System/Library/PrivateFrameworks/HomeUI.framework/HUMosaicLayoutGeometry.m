@implementation HUMosaicLayoutGeometry

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t);
  void *v13;
  id v14;
  HUMosaicLayoutGeometry *v15;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D519B8]), "initWithObject:", self);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __37__HUMosaicLayoutGeometry_description__block_invoke;
  v13 = &unk_1E6F4C638;
  v14 = v3;
  v15 = self;
  v4 = v3;
  objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("gridSize"), CFSTR("\t"), &v10);
  -[HUMosaicLayoutGeometry cellSize](self, "cellSize", v10, v11, v12, v13);
  v5 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", CFSTR("cellSize"), 0);
  -[HUMosaicLayoutGeometry cellSpacing](self, "cellSpacing");
  v6 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", CFSTR("cellSpacing"), 0);
  v7 = (id)objc_msgSend(v4, "appendBool:withName:", -[HUMosaicLayoutGeometry isPortrait](self, "isPortrait"), CFSTR("isPortrait"));
  objc_msgSend(v4, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __37__HUMosaicLayoutGeometry_description__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInt64:withName:", objc_msgSend(*(id *)(a1 + 40), "gridSize"), CFSTR("rowsDown"));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "gridSize");
  return (id)objc_msgSend(v3, "appendInt64:withName:", v4, CFSTR("columnsAcross"));
}

- (HUGridSize)gridSize
{
  int64_t columnsAcross;
  int64_t rowsDown;
  HUGridSize result;

  columnsAcross = self->_gridSize.columnsAcross;
  rowsDown = self->_gridSize.rowsDown;
  result.columnsAcross = columnsAcross;
  result.rowsDown = rowsDown;
  return result;
}

- (void)setGridSize:(HUGridSize)a3
{
  self->_gridSize = a3;
}

- (double)cellSize
{
  return self->_cellSize;
}

- (void)setCellSize:(double)a3
{
  self->_cellSize = a3;
}

- (double)cellSpacing
{
  return self->_cellSpacing;
}

- (void)setCellSpacing:(double)a3
{
  self->_cellSpacing = a3;
}

- (BOOL)isPortrait
{
  return self->_isPortrait;
}

- (void)setIsPortrait:(BOOL)a3
{
  self->_isPortrait = a3;
}

@end
