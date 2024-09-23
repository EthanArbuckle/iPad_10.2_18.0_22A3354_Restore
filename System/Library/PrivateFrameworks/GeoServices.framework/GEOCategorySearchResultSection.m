@implementation GEOCategorySearchResultSection

- (GEOCategorySearchResultSection)init
{
  GEOCategorySearchResultSection *result;

  result = (GEOCategorySearchResultSection *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOCategorySearchResultSection)initWithCategorySearchResultSection:(id)a3
{
  id *v4;
  GEOCategorySearchResultSection *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  NSString *headerDisplayName;
  uint64_t v10;
  NSString *subHeaderDisplayName;
  uint64_t v12;
  GEOStyleAttributes *styleAttributes;
  objc_super v15;

  v4 = (id *)a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOCategorySearchResultSection;
  v5 = -[GEOCategorySearchResultSection init](&v15, sel_init);
  if (v5)
  {
    v6 = -[GEOPDSCategorySearchResultSection categorySearchResultSectionCellType]((uint64_t)v4);
    if (v6)
    {
      if (v6 != 1)
      {
LABEL_7:
        -[GEOPDSCategorySearchResultSection sectionHeaderDisplayName](v4);
        v8 = objc_claimAutoreleasedReturnValue();
        headerDisplayName = v5->_headerDisplayName;
        v5->_headerDisplayName = (NSString *)v8;

        -[GEOPDSCategorySearchResultSection sectionSubHeaderDisplayName](v4);
        v10 = objc_claimAutoreleasedReturnValue();
        subHeaderDisplayName = v5->_subHeaderDisplayName;
        v5->_subHeaderDisplayName = (NSString *)v10;

        -[GEOPDSCategorySearchResultSection styleAttributes](v4);
        v12 = objc_claimAutoreleasedReturnValue();
        styleAttributes = v5->_styleAttributes;
        v5->_styleAttributes = (GEOStyleAttributes *)v12;

        goto LABEL_8;
      }
      v7 = 1;
    }
    else
    {
      v7 = 0;
    }
    v5->_cellType = v7;
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (int64_t)cellType
{
  return self->_cellType;
}

- (void)setCellType:(int64_t)a3
{
  self->_cellType = a3;
}

- (NSString)headerDisplayName
{
  return self->_headerDisplayName;
}

- (void)setHeaderDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subHeaderDisplayName
{
  return self->_subHeaderDisplayName;
}

- (void)setSubHeaderDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_subHeaderDisplayName, 0);
  objc_storeStrong((id *)&self->_headerDisplayName, 0);
}

@end
