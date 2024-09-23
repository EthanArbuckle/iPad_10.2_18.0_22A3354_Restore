@implementation CNContactCell

- (void)_setAnimating:(BOOL)a3 clippingAdjacentCells:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v4 = a4;
  v5 = a3;
  -[CNContactCell layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowsGroupBlending");

  if (_setAnimating_clippingAdjacentCells__onceToken != -1)
    dispatch_once(&_setAnimating_clippingAdjacentCells__onceToken, &__block_literal_global_7879);
  if (_setAnimating_clippingAdjacentCells__respondsToSelector)
  {
    v10.receiver = self;
    v10.super_class = (Class)CNContactCell;
    -[CNContactCell _setAnimating:clippingAdjacentCells:](&v10, sel__setAnimating_clippingAdjacentCells_, v5, v4);
  }
  -[CNContactCell layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsGroupBlending:", v8);

}

- (void)setCardGroupItem:(id)a3
{
  objc_storeStrong((id *)&self->_cardGroupItem, a3);
}

- (CNCardGroupItem)cardGroupItem
{
  return self->_cardGroupItem;
}

- (NSArray)variableConstraints
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (NSArray)constantConstraints
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[CNContactCell minCellHeight](self, "minCellHeight");
  if (v3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactCell minCellHeight](self, "minCellHeight");
    objc_msgSend(v4, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 8, 1, 0, 0, 0.0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v8) = 1148829696;
    objc_msgSend(v7, "setPriority:", v8);
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSArray *)v9;
  }
}

- (CNContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNContactCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactCell;
  v4 = -[CNContactCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  -[CNContactCell setNeedsUpdateConstraints](v4, "setNeedsUpdateConstraints");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  return v4;
}

- (void)updateConstraints
{
  NSArray *v3;
  NSArray *constantConstraints;
  NSArray *v5;
  NSArray *variableConstraints;
  objc_super v7;

  kdebug_trace();
  v7.receiver = self;
  v7.super_class = (Class)CNContactCell;
  -[CNContactCell updateConstraints](&v7, sel_updateConstraints);
  if (self->_variableConstraints)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
  if (!self->_constantConstraints)
  {
    -[CNContactCell constantConstraints](self, "constantConstraints");
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    constantConstraints = self->_constantConstraints;
    self->_constantConstraints = v3;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constantConstraints);
  }
  -[CNContactCell variableConstraints](self, "variableConstraints");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  variableConstraints = self->_variableConstraints;
  self->_variableConstraints = v5;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_variableConstraints);
  kdebug_trace();
}

- (void)setShowSeparator:(BOOL)a3
{
  -[CNContactCell setSeparatorStyle:](self, "setSeparatorStyle:", a3);
}

- (void)prepareForReuse
{
  objc_super v3;

  -[CNContactCell setCardGroupItem:](self, "setCardGroupItem:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CNContactCell;
  -[CNContactCell prepareForReuse](&v3, sel_prepareForReuse);
}

uint64_t __53__CNContactCell__setAnimating_clippingAdjacentCells___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0DC3D50], "instancesRespondToSelector:", sel__setAnimating_clippingAdjacentCells_);
  _setAnimating_clippingAdjacentCells__respondsToSelector = result;
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[CNContactCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "addObjectsFromArray:", self->_constantConstraints);
  objc_msgSend(v5, "addObjectsFromArray:", self->_variableConstraints);
  -[CNContactCell setCardGroupItem:](self, "setCardGroupItem:", 0);

  v6.receiver = self;
  v6.super_class = (Class)CNContactCell;
  -[CNContactCell dealloc](&v6, sel_dealloc);
}

- (BOOL)shouldPerformDefaultAction
{
  return -[CNContactCell isEditing](self, "isEditing") ^ 1;
}

- (BOOL)shouldPerformAccessoryAction
{
  return 1;
}

- (BOOL)showSeparator
{
  return -[CNContactCell separatorStyle](self, "separatorStyle") == 1;
}

- (BOOL)hasGapBetweenSeparatorAndTrailingEdge
{
  void *v3;
  uint64_t v4;
  double MinX;
  double v7;
  double v8;
  CGRect v9;
  CGRect v10;

  if (-[CNContactCell separatorStyle](self, "separatorStyle") != 1)
    return 0;
  -[CNContactCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutDirection");

  if (v4 == 1)
  {
    -[CNContactCell _separatorFrame](self, "_separatorFrame");
    MinX = CGRectGetMinX(v9);
  }
  else
  {
    -[CNContactCell bounds](self, "bounds");
    v8 = v7;
    -[CNContactCell _separatorFrame](self, "_separatorFrame");
    MinX = v8 - CGRectGetMaxX(v10);
  }
  return MinX >= 1.0;
}

- (double)minCellHeight
{
  return 0.0;
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  NSArray *constantConstraints;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_constantConstraints);
    constantConstraints = self->_constantConstraints;
    self->_constantConstraints = 0;

  }
  -[CNContactCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardGroupItem, 0);
  objc_storeStrong((id *)&self->_variableConstraints, 0);
  objc_storeStrong((id *)&self->_constantConstraints, 0);
}

+ (BOOL)shouldIndentWhileEditing
{
  return 0;
}

@end
