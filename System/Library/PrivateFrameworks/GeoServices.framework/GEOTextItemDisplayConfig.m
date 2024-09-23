@implementation GEOTextItemDisplayConfig

- (GEOTextItemDisplayConfig)init
{
  GEOTextItemDisplayConfig *result;

  result = (GEOTextItemDisplayConfig *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOTextItemDisplayConfig)initWithMaxItemsPerRow:(unsigned int)a3 maxRowCount:(unsigned int)a4
{
  GEOTextItemDisplayConfig *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTextItemDisplayConfig;
  result = -[GEOTextItemDisplayConfig init](&v7, sel_init);
  if (result)
  {
    result->_maxItemsPerRow = a3;
    result->_maxRowCount = a4;
  }
  return result;
}

- (GEOTextItemDisplayConfig)initWithTextItemDisplayConfig:(id)a3
{
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  if (!v4)
  {
    v5 = 0;
    v6 = 0;
    goto LABEL_7;
  }
  if ((v4[24] & 1) != 0)
  {
    v5 = *((unsigned int *)v4 + 4);
    if ((v4[24] & 2) != 0)
      goto LABEL_4;
LABEL_6:
    v6 = 3;
    goto LABEL_7;
  }
  v5 = 4;
  if ((v4[24] & 2) == 0)
    goto LABEL_6;
LABEL_4:
  v6 = *((unsigned int *)v4 + 5);
LABEL_7:

  return -[GEOTextItemDisplayConfig initWithMaxItemsPerRow:maxRowCount:](self, "initWithMaxItemsPerRow:maxRowCount:", v5, v6);
}

- (unsigned)maxItemsPerRow
{
  return self->_maxItemsPerRow;
}

- (unsigned)maxRowCount
{
  return self->_maxRowCount;
}

@end
