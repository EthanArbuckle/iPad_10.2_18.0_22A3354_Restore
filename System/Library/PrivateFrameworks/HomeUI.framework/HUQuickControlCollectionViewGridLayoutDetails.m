@implementation HUQuickControlCollectionViewGridLayoutDetails

- (id)indexPathForSectionHeader
{
  void *v3;
  void *v4;

  -[HUQuickControlCollectionViewGridLayoutDetails sectionHeaderLayout](self, "sectionHeaderLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, -[HUQuickControlCollectionViewGridLayoutDetails sectionIndex](self, "sectionIndex"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)indexPathForRow:(unint64_t)a3 column:(unint64_t)a4
{
  void *v7;
  unint64_t v8;

  -[HUQuickControlCollectionViewGridLayoutDetails settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a4 + objc_msgSend(v7, "numberOfColumns") * a3;

  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v8, -[HUQuickControlCollectionViewGridLayoutDetails sectionIndex](self, "sectionIndex"));
}

- (unint64_t)numberOfColumnsInRow:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;

  -[HUQuickControlCollectionViewGridLayoutDetails settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfColumns");

  if (v6)
  {
    -[HUQuickControlCollectionViewGridLayoutDetails settings](self, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfRows") - 1;

    if (v8 == a3)
    {
      -[HUQuickControlCollectionViewGridLayoutDetails settings](self, "settings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "numberOfItems");
      -[HUQuickControlCollectionViewGridLayoutDetails settings](self, "settings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10 % objc_msgSend(v11, "numberOfColumns");

      if (v12)
        return v12;
    }
  }
  return v6;
}

- (HUQuickControlCollectionGridLayoutSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentFrame.origin.x;
  y = self->_contentFrame.origin.y;
  width = self->_contentFrame.size.width;
  height = self->_contentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (unint64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(unint64_t)a3
{
  self->_sectionIndex = a3;
}

- (HUQuickControlCollectionViewGridLayoutRowInfo)sectionHeaderLayout
{
  return self->_sectionHeaderLayout;
}

- (void)setSectionHeaderLayout:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeaderLayout, a3);
}

- (NSArray)rowLayouts
{
  return self->_rowLayouts;
}

- (void)setRowLayouts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowLayouts, 0);
  objc_storeStrong((id *)&self->_sectionHeaderLayout, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
