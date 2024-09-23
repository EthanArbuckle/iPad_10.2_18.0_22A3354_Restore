@implementation SUUITracklistColumn

- (void)setPreferredWidthForAttributedStrings:(id)a3
{
  id v4;
  uint64_t v5;
  float v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  id v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  v6 = 0.0;
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (v8)
        {
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "length");
          if (v12 > objc_msgSend(v8, "length"))
          {
            v13 = v11;

            v8 = v13;
          }
        }
        else
        {
          v8 = v11;
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
    if (v8)
    {
      objc_msgSend(v8, "size");
      v6 = v14;
    }
  }
  else
  {
    v8 = 0;
  }
  -[SUUITracklistColumn setPreferredWidth:](self, "setPreferredWidth:", ceilf(v6));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SUUITracklistColumn;
  -[SUUITracklistColumn description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [ID: %ld, Width: %.2f]"), v4, self->_columnIdentifier, *(_QWORD *)&self->_width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setColumnIdentifier:", self->_columnIdentifier);
  objc_msgSend(v4, "setContentAlignment:", self->_contentAlignment);
  objc_msgSend(v4, "setHeaderAlignment:", self->_headerAlignment);
  objc_msgSend(v4, "setMaximumWidthFraction:", self->_maximumWidthFraction);
  objc_msgSend(v4, "setPreferredWidth:", self->_preferredWidth);
  objc_msgSend(v4, "setShowsPreviewControl:", self->_showsPreviewControl);
  objc_msgSend(v4, "setSizesToFit:", self->_sizesToFit);
  objc_msgSend(v4, "setWidth:", self->_width);
  return v4;
}

- (int64_t)columnIdentifier
{
  return self->_columnIdentifier;
}

- (void)setColumnIdentifier:(int64_t)a3
{
  self->_columnIdentifier = a3;
}

- (int64_t)contentAlignment
{
  return self->_contentAlignment;
}

- (void)setContentAlignment:(int64_t)a3
{
  self->_contentAlignment = a3;
}

- (int64_t)headerAlignment
{
  return self->_headerAlignment;
}

- (void)setHeaderAlignment:(int64_t)a3
{
  self->_headerAlignment = a3;
}

- (double)maximumWidthFraction
{
  return self->_maximumWidthFraction;
}

- (void)setMaximumWidthFraction:(double)a3
{
  self->_maximumWidthFraction = a3;
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setPreferredWidth:(double)a3
{
  self->_preferredWidth = a3;
}

- (BOOL)showsPreviewControl
{
  return self->_showsPreviewControl;
}

- (void)setShowsPreviewControl:(BOOL)a3
{
  self->_showsPreviewControl = a3;
}

- (BOOL)sizesToFit
{
  return self->_sizesToFit;
}

- (void)setSizesToFit:(BOOL)a3
{
  self->_sizesToFit = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

@end
