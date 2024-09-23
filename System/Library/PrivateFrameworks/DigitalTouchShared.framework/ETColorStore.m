@implementation ETColorStore

+ (id)defaultStore
{
  if (defaultStore_onceToken != -1)
    dispatch_once(&defaultStore_onceToken, &__block_literal_global_3);
  return (id)defaultStore_sharedStore;
}

void __28__ETColorStore_defaultStore__block_invoke()
{
  ETColorStore *v0;
  void *v1;

  v0 = objc_alloc_init(ETColorStore);
  v1 = (void *)defaultStore_sharedStore;
  defaultStore_sharedStore = (uint64_t)v0;

}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("ETColorPrefsChangedExternallyNotification"), 0);
  v5.receiver = self;
  v5.super_class = (Class)ETColorStore;
  -[ETColorStore dealloc](&v5, sel_dealloc);
}

- (ETColorStore)init
{
  ETColorStore *v2;
  ETColorStore *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ETColorStore;
  v2 = -[ETColorStore init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ETColorStore addDefaultsObserver](v2, "addDefaultsObserver");
  return v3;
}

- (void)addDefaultsObserver
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_defaultsChanged_, *MEMORY[0x24BDD13F0], 0);

}

- (void)defaultsChanged:(id)a3
{
  NSMutableArray *colors;

  colors = self->_colors;
  self->_colors = 0;

  self->_selectedIndexLoaded = 0;
}

- (id)_colors
{
  NSMutableArray *colors;
  void *v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;
  NSMutableArray *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  colors = self->_colors;
  if (!colors)
  {
    PaletteColorsDataArray();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = bswap32(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "unsignedIntValue", (_QWORD)v15));
          objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", (double)v11 / 255.0, (double)BYTE1(v11) / 255.0, (double)BYTE2(v11) / 255.0, (double)HIBYTE(v11) / 255.0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v5, "addObject:", v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    v13 = self->_colors;
    self->_colors = v5;

    colors = self->_colors;
  }
  return colors;
}

- (void)saveColor:(id)a3 forIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v6 = a3;
  -[ETColorStore _colors](self, "_colors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:atIndexedSubscript:", v6, a4);
  PaletteColorsDataArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v10 = (void *)MEMORY[0x24BDD16E0];
  v14 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  v17 = 0.0;
  objc_msgSend(v6, "getRed:green:blue:alpha:", &v17, &v16, &v15, &v14);

  objc_msgSend(v10, "numberWithUnsignedInt:", bswap32(((int)(v15 * 255.0) << 16) | ((int)(v14 * 255.0) << 24) | ((int)(v16 * 255.0) << 8) | (int)(v17 * 255.0)));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:atIndexedSubscript:", v11, a4);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObserver:name:object:", self, *MEMORY[0x24BDD13F0], 0);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v9, CFSTR("ETColorPickerColorData"));
  objc_msgSend(v13, "synchronize");
  -[ETColorStore addDefaultsObserver](self, "addDefaultsObserver");

}

- (unint64_t)selectedColorIndex
{
  void *v3;
  void *v4;

  if (!self->_selectedIndexLoaded)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "synchronize");
    objc_msgSend(v3, "objectForKey:", CFSTR("ETColorPickerSelectedIndex"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_selectedColorIndex = objc_msgSend(v4, "unsignedIntegerValue");

    if (self->_selectedColorIndex >= 8)
      self->_selectedColorIndex = 0;
    self->_selectedIndexLoaded = 1;

  }
  return self->_selectedColorIndex;
}

- (void)setSelectedColorIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_selectedColorIndex != a3)
  {
    self->_selectedColorIndex = a3;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDD13F0], 0);

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_selectedColorIndex);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("ETColorPickerSelectedIndex"));

    objc_msgSend(v6, "synchronize");
    -[ETColorStore addDefaultsObserver](self, "addDefaultsObserver");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
