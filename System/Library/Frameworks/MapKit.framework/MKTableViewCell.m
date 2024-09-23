@implementation MKTableViewCell

- (void)set_mapkit_forceSeparatorFrameToCGRectZero:(BOOL)a3
{
  uint64_t v4;

  if (self->__mapkit_forceSeparatorFrameToCGRectZero != a3)
  {
    self->__mapkit_forceSeparatorFrameToCGRectZero = a3;
    v4 = -[MKTableViewCell separatorStyle](self, "separatorStyle");
    -[MKTableViewCell setSeparatorStyle:](self, "setSeparatorStyle:", (v4 + 1) % 3);
    -[MKTableViewCell setSeparatorStyle:](self, "setSeparatorStyle:", v4);
  }
}

- (void)set_mapkit_separatorStyleOverride:(int64_t)a3
{
  self->__mapkit_separatorStyleOverride = a3;
  self->__mapkit_separatorStyleOverrideEnabled = 1;
}

- (void)_mapkit_disableSeparatorStyleOverride
{
  self->__mapkit_separatorStyleOverrideEnabled = 0;
}

- (void)setSeparatorStyle:(int64_t)mapkit_separatorStyleOverride
{
  objc_super v3;

  if (self->__mapkit_separatorStyleOverrideEnabled)
    mapkit_separatorStyleOverride = self->__mapkit_separatorStyleOverride;
  v3.receiver = self;
  v3.super_class = (Class)MKTableViewCell;
  -[MKTableViewCell setSeparatorStyle:](&v3, sel_setSeparatorStyle_, mapkit_separatorStyleOverride);
}

- (CGRect)_separatorFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  if (self->__mapkit_forceSeparatorFrameToCGRectZero)
  {
    v2 = *MEMORY[0x1E0C9D648];
    v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MKTableViewCell;
    -[MKTableViewCell _separatorFrame](&v6, sel__separatorFrame);
  }
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKTableViewCell;
  -[MKTableViewCell setSemanticContentAttribute:](&v6, sel_setSemanticContentAttribute_);
  -[MKTableViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSemanticContentAttribute:", a3);

}

- (BOOL)_mapkit_forceSeparatorFrameToCGRectZero
{
  return self->__mapkit_forceSeparatorFrameToCGRectZero;
}

- (int64_t)_mapkit_separatorStyleOverride
{
  return self->__mapkit_separatorStyleOverride;
}

@end
