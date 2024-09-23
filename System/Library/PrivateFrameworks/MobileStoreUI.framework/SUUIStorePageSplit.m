@implementation SUUIStorePageSplit

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDividerColor:", self->_dividerColor);
  objc_msgSend(v4, "setNumberOfPageSections:", self->_numberOfPageSections);
  objc_msgSend(v4, "setPageComponents:", self->_pageComponents);
  objc_msgSend(v4, "setSectionContext:", self->_sectionContext);
  objc_msgSend(v4, "setWidthFraction:", self->_widthFraction);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SUUIStorePageSplit;
  -[SUUIStorePageSplit description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Count: %ld, Context: %@"), v4, self->_numberOfPageSections, self->_sectionContext);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIColor)dividerColor
{
  return self->_dividerColor;
}

- (void)setDividerColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)numberOfPageSections
{
  return self->_numberOfPageSections;
}

- (void)setNumberOfPageSections:(int64_t)a3
{
  self->_numberOfPageSections = a3;
}

- (NSArray)pageComponents
{
  return self->_pageComponents;
}

- (void)setPageComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SUUIStorePageSectionContext)sectionContext
{
  return self->_sectionContext;
}

- (void)setSectionContext:(id)a3
{
  objc_storeStrong((id *)&self->_sectionContext, a3);
}

- (double)widthFraction
{
  return self->_widthFraction;
}

- (void)setWidthFraction:(double)a3
{
  self->_widthFraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionContext, 0);
  objc_storeStrong((id *)&self->_pageComponents, 0);
  objc_storeStrong((id *)&self->_dividerColor, 0);
}

@end
