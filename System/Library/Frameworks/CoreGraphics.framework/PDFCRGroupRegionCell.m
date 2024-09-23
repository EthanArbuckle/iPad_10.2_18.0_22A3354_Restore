@implementation PDFCRGroupRegionCell

- (PDFCRGroupRegionCell)initWithBoundingQuad:(id)a3 layoutDirection:(unint64_t)a4 subregions:(id)a5 parent:(id)a6 groupID:(unint64_t)a7 rowIndex:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  PDFCRGroupRegionCell *v17;
  PDFCRGroupRegionCell *v18;
  objc_super v20;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PDFCRGroupRegionCell;
  v17 = -[PDFCRGroupRegion initWithBoundingQuad:layoutDirection:subregions:parent:](&v20, sel_initWithBoundingQuad_layoutDirection_subregions_parent_, v14, a4, v15, v16);
  v18 = v17;
  if (v17)
  {
    -[PDFCRGroupRegion setType:](v17, "setType:", 6);
    -[PDFCRGroupRegionCell setGroupID:](v18, "setGroupID:", a7);
    -[PDFCRGroupRegionCell setRowIndex:](v18, "setRowIndex:", a8);
  }

  return v18;
}

- (unint64_t)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(unint64_t)a3
{
  self->_groupID = a3;
}

- (unint64_t)rowIndex
{
  return self->_rowIndex;
}

- (void)setRowIndex:(unint64_t)a3
{
  self->_rowIndex = a3;
}

@end
