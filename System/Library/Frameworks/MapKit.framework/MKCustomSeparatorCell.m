@implementation MKCustomSeparatorCell

- (MKCustomSeparatorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MKCustomSeparatorCell *v4;
  MKCustomSeparatorCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKCustomSeparatorCell;
  v4 = -[MKCustomSeparatorCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[MKCustomSeparatorCell _updateSeparatorInset](v4, "_updateSeparatorInset");
  return v5;
}

- (CGRect)_separatorFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double Width;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect v18;
  CGRect result;

  if (-[MKCustomSeparatorCell isSeparatorHidden](self, "isSeparatorHidden"))
  {
    v4 = *MEMORY[0x1E0C9D648];
    v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)MKCustomSeparatorCell;
    -[MKTableViewCell _separatorFrame](&v17, sel__separatorFrame);
    v3 = v7;
    v6 = v8;
    -[MKCustomSeparatorCell leftSeparatorInset](self, "leftSeparatorInset");
    v4 = v9;
    -[MKCustomSeparatorCell bounds](self, "bounds");
    Width = CGRectGetWidth(v18);
    -[MKCustomSeparatorCell leftSeparatorInset](self, "leftSeparatorInset");
    v12 = Width - v11;
    -[MKCustomSeparatorCell rightSeparatorInset](self, "rightSeparatorInset");
    v5 = v12 - v13;
  }
  v14 = v4;
  v15 = v3;
  v16 = v6;
  result.size.height = v16;
  result.size.width = v5;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_updateSeparatorInset
{
  double v3;
  double v4;
  double v5;

  -[MKCustomSeparatorCell leftSeparatorInset](self, "leftSeparatorInset");
  v4 = v3;
  -[MKCustomSeparatorCell rightSeparatorInset](self, "rightSeparatorInset");
  -[MKCustomSeparatorCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v4, 0.0, v5);
}

- (void)setLeftSeparatorInset:(double)a3
{
  if (self->_leftSeparatorInset != a3)
  {
    self->_leftSeparatorInset = a3;
    -[MKCustomSeparatorCell _updateSeparatorInset](self, "_updateSeparatorInset");
  }
}

- (void)setRightSeparatorInset:(double)a3
{
  if (self->_rightSeparatorInset != a3)
  {
    self->_rightSeparatorInset = a3;
    -[MKCustomSeparatorCell _updateSeparatorInset](self, "_updateSeparatorInset");
  }
}

- (void)setLeadingSeparatorInset:(double)a3
{
  if (MKApplicationLayoutDirectionIsRightToLeft())
    -[MKCustomSeparatorCell setRightSeparatorInset:](self, "setRightSeparatorInset:", a3);
  else
    -[MKCustomSeparatorCell setLeftSeparatorInset:](self, "setLeftSeparatorInset:", a3);
}

- (double)leadingSeparatorInset
{
  double result;

  if (MKApplicationLayoutDirectionIsRightToLeft())
    -[MKCustomSeparatorCell rightSeparatorInset](self, "rightSeparatorInset");
  else
    -[MKCustomSeparatorCell leftSeparatorInset](self, "leftSeparatorInset");
  return result;
}

- (void)setTrailingSeparatorInset:(double)a3
{
  if (MKApplicationLayoutDirectionIsRightToLeft())
    -[MKCustomSeparatorCell setLeftSeparatorInset:](self, "setLeftSeparatorInset:", a3);
  else
    -[MKCustomSeparatorCell setRightSeparatorInset:](self, "setRightSeparatorInset:", a3);
}

- (double)trailingSeparatorInset
{
  double result;

  if (MKApplicationLayoutDirectionIsRightToLeft())
    -[MKCustomSeparatorCell leftSeparatorInset](self, "leftSeparatorInset");
  else
    -[MKCustomSeparatorCell rightSeparatorInset](self, "rightSeparatorInset");
  return result;
}

- (double)leftSeparatorInset
{
  return self->_leftSeparatorInset;
}

- (double)rightSeparatorInset
{
  return self->_rightSeparatorInset;
}

@end
