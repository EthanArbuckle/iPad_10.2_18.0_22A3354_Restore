@implementation _MKResizingLayer

- (NSArray)sizeToBoundsLayers
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_sizedLayers, "copy");
}

- (void)sizeSublayerToBounds:(id)a3
{
  NSMutableArray *sizedLayers;
  NSMutableArray *v5;
  NSMutableArray *v6;

  sizedLayers = self->_sizedLayers;
  if (sizedLayers)
  {
    -[NSMutableArray addObject:](sizedLayers, "addObject:", a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", a3);
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sizedLayers;
    self->_sizedLayers = v5;

  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  char v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v30 = *MEMORY[0x1E0C80C00];
  if (self->_needsLayoutOnBoundsChange)
  {
    -[_MKResizingLayer bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }
  else
  {
    v15 = a3.size.height;
    v13 = a3.size.width;
    v11 = a3.origin.y;
    v9 = a3.origin.x;
  }
  v28.receiver = self;
  v28.super_class = (Class)_MKResizingLayer;
  -[_MKResizingLayer setBounds:](&v28, sel_setBounds_, x, y, width, height);
  v16 = objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters");
  if ((v16 & 1) == 0)
  {
    +[MKThreadContext currentContext](MKThreadContext, "currentContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_CA_setDisableActions:", 1);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = self->_sizedLayers;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "setFrame:", x, y, width, height, (_QWORD)v24);
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v20);
  }

  v31.origin.x = v9;
  v31.origin.y = v11;
  v31.size.width = v13;
  v31.size.height = v15;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  if (!CGRectEqualToRect(v31, v32))
    -[_MKResizingLayer layoutSublayers](self, "layoutSublayers");
  if ((v16 & 1) == 0)
  {
    +[MKThreadContext currentContext](MKThreadContext, "currentContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_CA_setDisableActions:", 0);

  }
}

- (void)setMask:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_MKResizingLayer;
  v4 = a3;
  -[_MKResizingLayer setMask:](&v17, sel_setMask_, v4);
  -[_MKResizingLayer contentsScale](self, "contentsScale", v17.receiver, v17.super_class);
  v6 = v5;
  -[_MKResizingLayer mask](self, "mask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentsScale:", v6);

  LODWORD(v7) = -[NSMutableArray containsObject:](self->_sizedLayers, "containsObject:", v4);
  if ((_DWORD)v7)
  {
    -[_MKResizingLayer bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[_MKResizingLayer mask](self, "mask");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  }
}

- (void)setContentsScale:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)_MKResizingLayer;
  -[_MKResizingLayer setContentsScale:](&v15, sel_setContentsScale_);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_MKResizingLayer sublayers](self, "sublayers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "setContentsScale:", a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

  -[_MKResizingLayer mask](self, "mask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentsScale:", a3);

}

- (BOOL)needsLayoutOnBoundsChange
{
  return self->_needsLayoutOnBoundsChange;
}

- (void)setNeedsLayoutOnBoundsChange:(BOOL)a3
{
  self->_needsLayoutOnBoundsChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizedLayers, 0);
}

@end
