@implementation HUQuickControlCollectionGridLayoutSettings

- (unint64_t)sectionNumber
{
  return self->_sectionNumber;
}

- (void)setSectionNumber:(unint64_t)a3
{
  self->_sectionNumber = a3;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIdentifier, a3);
}

- (NSString)sectionHeader
{
  return self->_sectionHeader;
}

- (void)setSectionHeader:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeader, a3);
}

- (NSAttributedString)sectionAttributedHeader
{
  return self->_sectionAttributedHeader;
}

- (void)setSectionAttributedHeader:(id)a3
{
  objc_storeStrong((id *)&self->_sectionAttributedHeader, a3);
}

- (unint64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (void)setNumberOfItems:(unint64_t)a3
{
  self->_numberOfItems = a3;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (void)setNumberOfRows:(unint64_t)a3
{
  self->_numberOfRows = a3;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void)setNumberOfColumns:(unint64_t)a3
{
  self->_numberOfColumns = a3;
}

- (int64_t)horizontalAlignment
{
  return self->_horizontalAlignment;
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  self->_horizontalAlignment = a3;
}

- (unint64_t)itemSize
{
  return self->_itemSize;
}

- (void)setItemSize:(unint64_t)a3
{
  self->_itemSize = a3;
}

- (double)rowSpacing
{
  return self->_rowSpacing;
}

- (void)setRowSpacing:(double)a3
{
  self->_rowSpacing = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (unint64_t)preferredLayoutStyle
{
  return self->_preferredLayoutStyle;
}

- (void)setPreferredLayoutStyle:(unint64_t)a3
{
  self->_preferredLayoutStyle = a3;
}

- (double)sectionTopPadding
{
  return self->_sectionTopPadding;
}

- (void)setSectionTopPadding:(double)a3
{
  self->_sectionTopPadding = a3;
}

- (unint64_t)titlePosition
{
  return self->_titlePosition;
}

- (void)setTitlePosition:(unint64_t)a3
{
  self->_titlePosition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionAttributedHeader, 0);
  objc_storeStrong((id *)&self->_sectionHeader, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
}

@end
