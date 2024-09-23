@implementation PKToolPickerItem

- (PKToolPickerItem)initWithTool:(id)a3
{
  return -[PKToolPickerItem initWithTool:identifier:](self, "initWithTool:identifier:", a3, 0);
}

- (PKToolPickerItem)initWithTool:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  PKToolPickerItem *v9;
  uint64_t v10;
  NSHashTable *observers;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKToolPickerItem;
  v9 = -[PKToolPickerItem init](&v13, sel_init);
  if (v9)
  {
    if (v8)
      objc_msgSend(v7, "_setToolPickerItemIdentifier:", v8);
    objc_storeStrong((id *)&v9->__tool, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v10;

  }
  return v9;
}

- (NSString)identifier
{
  return -[PKTool _toolPickerItemIdentifier](self->__tool, "_toolPickerItemIdentifier");
}

- (UIColor)color
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[PKTool _configuration](self->__tool, "_configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsColor");

  if ((v4 & 1) != 0)
  {
    -[PKTool _color](self->__tool, "_color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v8;
}

- (void)setColor:(id)a3
{
  -[PKToolPickerItem _setColor:shouldCallObserver:](self, "_setColor:shouldCallObserver:", a3, 1);
}

- (void)_setColor:(id)a3 shouldCallObserver:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  int v7;
  id v8;
  id v9;
  CGColor *ConvertedToSRGB;
  id v11;
  uint64_t v12;
  CGColor *v13;
  BOOL IsEqualToColorIgnoringOpacity;
  void *v15;
  id v16;

  v4 = a4;
  v16 = a3;
  -[PKTool _configuration](self->__tool, "_configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsColor");

  if (v7)
  {
    -[PKToolPickerItem color](self, "color");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = v16;
    ConvertedToSRGB = DKUCGColorCreateConvertedToSRGB(objc_msgSend(v8, "CGColor"));
    v11 = objc_retainAutorelease(v9);
    v12 = objc_msgSend(v11, "CGColor");

    v13 = DKUCGColorCreateConvertedToSRGB(v12);
    IsEqualToColorIgnoringOpacity = DKUColorIsEqualToColorIgnoringOpacity(ConvertedToSRGB, v13, 0);
    CGColorRelease(ConvertedToSRGB);
    CGColorRelease(v13);

    if (!IsEqualToColorIgnoringOpacity)
    {
      -[PKToolPickerItem _toolCopyWithColor:](self, "_toolCopyWithColor:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKToolPickerItem _updateTool:shouldCallObserver:](self, "_updateTool:shouldCallObserver:", v15, v4);

    }
  }

}

- (double)width
{
  void *v3;
  int v4;
  double result;

  -[PKTool _configuration](self->__tool, "_configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsStrokeWeight");

  if (!v4)
    return 0.0;
  -[PKTool _width](self->__tool, "_width");
  return result;
}

- (void)setWidth:(double)a3
{
  -[PKToolPickerItem _setWidth:shouldCallObserver:](self, "_setWidth:shouldCallObserver:", 1, a3);
}

- (void)_setWidth:(double)a3 shouldCallObserver:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  int v8;
  double v9;
  id v10;

  v4 = a4;
  -[PKTool _configuration](self->__tool, "_configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsStrokeWeight");

  if (v8)
  {
    -[PKToolPickerItem width](self, "width");
    if (vabdd_f64(v9, a3) >= 0.01)
    {
      -[PKToolPickerItem _toolCopyWithWidth:](self, "_toolCopyWithWidth:", a3);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[PKToolPickerItem _updateTool:shouldCallObserver:](self, "_updateTool:shouldCallObserver:", v10, v4);

    }
  }
}

- (BOOL)_toolShouldBeSetOnCanvasView
{
  return 0;
}

- (NSDictionary)_dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("identifier");
  -[PKToolPickerItem _tool](self, "_tool");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (id)_toolCopyWithWidth:(double)a3
{
  return 0;
}

- (id)_toolCopyWithColor:(id)a3
{
  return 0;
}

- (void)_reloadImage
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_observers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "toolPickerItemReloadImage:", self, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_updateTool:(id)a3 shouldCallObserver:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)&self->__tool, a3);
    if (v4)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v8 = self->_observers;
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v14;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v14 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "toolPickerItemDidChange:", self, (_QWORD)v13);
          }
          while (v10 != v12);
          v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v10);
      }

    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTool:", self->__tool);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PKToolPickerItem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKToolPickerItem _tool](self, "_tool");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_tool");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PKTool)_tool
{
  return self->__tool;
}

- (void)set_tool:(id)a3
{
  objc_storeStrong((id *)&self->__tool, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tool, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
