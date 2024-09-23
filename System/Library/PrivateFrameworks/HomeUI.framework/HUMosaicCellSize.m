@implementation HUMosaicCellSize

+ (id)createMosaicCellSizeForSizeDescription:(unint64_t)a3
{
  HUMosaicCellSize *v4;
  unint64_t v5;
  uint64_t v6;

  v4 = objc_alloc_init(HUMosaicCellSize);
  -[HUMosaicCellSize setSizeDescription:](v4, "setSizeDescription:", a3);
  v5 = a3 - 1;
  if (a3 - 1 <= 3)
  {
    v6 = qword_1B9443020[v5];
    -[HUMosaicCellSize setNumCols:](v4, "setNumCols:", qword_1B9443000[v5]);
    -[HUMosaicCellSize setNumRows:](v4, "setNumRows:", v6);
  }
  return v4;
}

- (unint64_t)sizeDescription
{
  return self->_sizeDescription;
}

- (void)setSizeDescription:(unint64_t)a3
{
  self->_sizeDescription = a3;
}

- (unint64_t)numRows
{
  return self->_numRows;
}

- (void)setNumRows:(unint64_t)a3
{
  self->_numRows = a3;
}

- (unint64_t)numCols
{
  return self->_numCols;
}

- (void)setNumCols:(unint64_t)a3
{
  self->_numCols = a3;
}

@end
