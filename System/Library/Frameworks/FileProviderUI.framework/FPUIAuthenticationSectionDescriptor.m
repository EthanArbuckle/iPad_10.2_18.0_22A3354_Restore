@implementation FPUIAuthenticationSectionDescriptor

- (FPUIAuthenticationSectionDescriptor)init
{
  FPUIAuthenticationSectionDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FPUIAuthenticationSectionDescriptor;
  result = -[FPUIAuthenticationSectionDescriptor init](&v3, sel_init);
  if (result)
  {
    result->_headerHeight = *(double *)MEMORY[0x24BDF7DE0];
    *(_WORD *)&result->_shouldHighlightRows = 257;
  }
  return result;
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

- (double)footerHeight
{
  return self->_footerHeight;
}

- (void)setFooterHeight:(double)a3
{
  self->_footerHeight = a3;
}

- (BOOL)shouldHighlightRows
{
  return self->_shouldHighlightRows;
}

- (void)setShouldHighlightRows:(BOOL)a3
{
  self->_shouldHighlightRows = a3;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (Class)headerViewClass
{
  return self->_headerViewClass;
}

- (void)setHeaderViewClass:(Class)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)headerViewReuseIdentifier
{
  return self->_headerViewReuseIdentifier;
}

- (void)setHeaderViewReuseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)headerViewCustomizationBlock
{
  return self->_headerViewCustomizationBlock;
}

- (void)setHeaderViewCustomizationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)footerTitle
{
  return self->_footerTitle;
}

- (void)setFooterTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (Class)footerViewClass
{
  return self->_footerViewClass;
}

- (void)setFooterViewClass:(Class)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)footerViewReuseIdentifier
{
  return self->_footerViewReuseIdentifier;
}

- (void)setFooterViewReuseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)footerViewCustomizationBlock
{
  return self->_footerViewCustomizationBlock;
}

- (void)setFooterViewCustomizationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (Class)rowCellClass
{
  return self->_rowCellClass;
}

- (void)setRowCellClass:(Class)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)rowCellReuseIdentifier
{
  return self->_rowCellReuseIdentifier;
}

- (void)setRowCellReuseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_rowCellClass, 0);
  objc_storeStrong(&self->_footerViewCustomizationBlock, 0);
  objc_storeStrong((id *)&self->_footerViewReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_footerViewClass, 0);
  objc_storeStrong((id *)&self->_footerTitle, 0);
  objc_storeStrong(&self->_headerViewCustomizationBlock, 0);
  objc_storeStrong((id *)&self->_headerViewReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_headerViewClass, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
}

@end
