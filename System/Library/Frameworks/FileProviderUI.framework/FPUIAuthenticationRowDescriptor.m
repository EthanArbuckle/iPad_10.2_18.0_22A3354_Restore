@implementation FPUIAuthenticationRowDescriptor

+ (Class)defaultCellClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultCellReuseIdentifier
{
  return CFSTR("UITableViewCellReuseIdentifier");
}

- (FPUIAuthenticationRowDescriptor)init
{
  FPUIAuthenticationRowDescriptor *v2;
  FPUIAuthenticationRowDescriptor *v3;
  uint64_t v4;
  Class cellClass;
  uint64_t v6;
  NSString *cellReuseIdentifier;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FPUIAuthenticationRowDescriptor;
  v2 = -[FPUIAuthenticationRowDescriptor init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_rowHeight = *(double *)MEMORY[0x24BDF7DE0];
    v2->_shouldHighlight = 1.0;
    objc_msgSend((id)objc_opt_class(), "defaultCellClass");
    v4 = objc_claimAutoreleasedReturnValue();
    cellClass = v3->_cellClass;
    v3->_cellClass = (Class)v4;

    objc_msgSend((id)objc_opt_class(), "defaultCellReuseIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    cellReuseIdentifier = v3->_cellReuseIdentifier;
    v3->_cellReuseIdentifier = (NSString *)v6;

    v3->_cellSelectionStyle = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = objc_opt_new();
  *(double *)(v4 + 8) = self->_rowHeight;
  *(double *)(v4 + 16) = self->_shouldHighlight;
  v5 = objc_msgSend(self->_selectionHandler, "copy");
  v6 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v5;

  v7 = -[objc_class copy](self->_cellClass, "copy");
  v8 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v7;

  v9 = -[NSString copy](self->_cellReuseIdentifier, "copy");
  v10 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v9;

  v11 = objc_msgSend(self->_cellCustomizationHandler, "copy");
  v12 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v11;

  v13 = objc_msgSend(self->_cellWillDisplayHandler, "copy");
  v14 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v13;

  return (id)v4;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (double)shouldHighlight
{
  return self->_shouldHighlight;
}

- (void)setShouldHighlight:(double)a3
{
  self->_shouldHighlight = a3;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)accessoryButtonTapHandler
{
  return self->_accessoryButtonTapHandler;
}

- (void)setAccessoryButtonTapHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (Class)cellClass
{
  return self->_cellClass;
}

- (void)setCellClass:(Class)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)cellReuseIdentifier
{
  return self->_cellReuseIdentifier;
}

- (void)setCellReuseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)cellCustomizationHandler
{
  return self->_cellCustomizationHandler;
}

- (void)setCellCustomizationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)cellWillDisplayHandler
{
  return self->_cellWillDisplayHandler;
}

- (void)setCellWillDisplayHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)cellSelectionStyle
{
  return self->_cellSelectionStyle;
}

- (void)setCellSelectionStyle:(int64_t)a3
{
  self->_cellSelectionStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cellWillDisplayHandler, 0);
  objc_storeStrong(&self->_cellCustomizationHandler, 0);
  objc_storeStrong((id *)&self->_cellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_cellClass, 0);
  objc_storeStrong(&self->_accessoryButtonTapHandler, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
}

@end
