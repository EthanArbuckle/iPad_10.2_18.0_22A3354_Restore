@implementation ATXHomeScreenStackConfig

- (unint64_t)numberOfLeafIconSpots
{
  int v3;
  unint64_t result;
  BOOL v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_msgSend(MEMORY[0x1E0D81588], "isiPad");
  result = -[ATXHomeScreenStackConfig stackLayoutSize](self, "stackLayoutSize");
  switch(result)
  {
    case 0uLL:
      if (v3)
        return 1;
      else
        return 4;
    case 1uLL:
      v5 = v3 == 0;
      v6 = 8;
      v7 = 2;
      goto LABEL_9;
    case 2uLL:
      v5 = v3 == 0;
      v6 = 16;
      v7 = 4;
      goto LABEL_9;
    case 3uLL:
      v5 = v3 == 0;
      v6 = 24;
      v7 = 6;
      goto LABEL_9;
    case 4uLL:
      v5 = v3 == 0;
      v6 = 32;
      v7 = 8;
LABEL_9:
      if (v5)
        result = v6;
      else
        result = v7;
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHomeScreenStackConfig)init
{
  ATXHomeScreenStackConfig *v2;
  ATXHomeScreenStackConfig *v3;
  ATXHomeScreenStackConfig *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXHomeScreenStackConfig;
  v2 = -[ATXHomeScreenStackConfig init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_allowsNewWidget = 256;
    v4 = v2;
  }

  return v3;
}

- (ATXHomeScreenStackConfig)initWithCoder:(id)a3
{
  id v4;
  ATXHomeScreenStackConfig *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXHomeScreenStackConfig;
  v5 = -[ATXHomeScreenStackConfig init](&v12, sel_init);
  if (v5)
  {
    -[ATXHomeScreenStackConfig setAllowsSmartRotate:](v5, "setAllowsSmartRotate:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsSmartRotate")));
    -[ATXHomeScreenStackConfig setAllowsNewWidget:](v5, "setAllowsNewWidget:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsNewWidget")));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("widgets"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenStackConfig setWidgets:](v5, "setWidgets:", v9);

    -[ATXHomeScreenStackConfig setStackLayoutSize:](v5, "setStackLayoutSize:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stackLayoutSize")));
    -[ATXHomeScreenStackConfig setCoordinateRow:](v5, "setCoordinateRow:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("coordinateRow")));
    -[ATXHomeScreenStackConfig setCoordinateColumn:](v5, "setCoordinateColumn:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("coordinateColumn")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenStackConfig setIdentifier:](v5, "setIdentifier:", v10);

  }
  return v5;
}

- (void)_updateWidgetBackpointers
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_widgets;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[ATXHomeScreenStackConfig page](self, "page", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPage:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)setPage:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_page);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_page, obj);
    -[ATXHomeScreenStackConfig _updateWidgetBackpointers](self, "_updateWidgetBackpointers");
    v5 = obj;
  }

}

- (void)setWidgets:(id)a3
{
  NSArray *v4;
  NSArray *widgets;

  if (self->_widgets != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    widgets = self->_widgets;
    self->_widgets = v4;

    -[ATXHomeScreenStackConfig _updateWidgetBackpointers](self, "_updateWidgetBackpointers");
  }
}

- (void)assignWidgetSpaceCoordinateWithRow:(int64_t)a3 column:(int64_t)a4
{
  char v7;

  v7 = objc_msgSend(MEMORY[0x1E0D81588], "isiPad") ^ 1;
  -[ATXHomeScreenStackConfig setCoordinateRow:](self, "setCoordinateRow:", a3 << v7);
  -[ATXHomeScreenStackConfig setCoordinateColumn:](self, "setCoordinateColumn:", a4 << v7);
}

- (BOOL)isPinnedWidget
{
  return !self->_allowsSmartRotate && !self->_allowsNewWidget && -[NSArray count](self->_widgets, "count") == 1;
}

- (BOOL)isPinnedSuggestionsWidget
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[ATXHomeScreenStackConfig isPinnedWidget](self, "isPinnedWidget");
  if (v3)
  {
    -[NSArray firstObject](self->_widgets, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extensionBundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CF9480]);

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isAppPredictionPanel
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[ATXHomeScreenStackConfig isPinnedWidget](self, "isPinnedWidget");
  if (v3)
  {
    -[NSArray firstObject](self->_widgets, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extensionBundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.proactive.appprediction.panel"));

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[ATXHomeScreenStackConfig allowsNewWidget](self, "allowsNewWidget"), CFSTR("allowsNewWidget"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ATXHomeScreenStackConfig allowsSmartRotate](self, "allowsSmartRotate"), CFSTR("allowsSmartRotate"));
  -[ATXHomeScreenStackConfig widgets](self, "widgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("widgets"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXHomeScreenStackConfig stackLayoutSize](self, "stackLayoutSize"), CFSTR("stackLayoutSize"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXHomeScreenStackConfig coordinateRow](self, "coordinateRow"), CFSTR("coordinateRow"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXHomeScreenStackConfig coordinateColumn](self, "coordinateColumn"), CFSTR("coordinateColumn"));
  -[ATXHomeScreenStackConfig identifier](self, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;

  -[ATXHomeScreenStackConfig identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return -[ATXHomeScreenStackConfig stackLayoutSize](self, "stackLayoutSize") - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  ATXHomeScreenStackConfig *v4;
  ATXHomeScreenStackConfig *v5;
  NSArray *widgets;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  char v10;
  char v11;
  NSString *v13;
  NSString *v14;

  v4 = (ATXHomeScreenStackConfig *)a3;
  if (self == v4)
  {
    v11 = 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    goto LABEL_14;
  }
  v5 = v4;
  if (self->_allowsNewWidget != -[ATXHomeScreenStackConfig allowsNewWidget](v5, "allowsNewWidget")
    || self->_allowsSmartRotate != -[ATXHomeScreenStackConfig allowsSmartRotate](v5, "allowsSmartRotate")
    || -[ATXHomeScreenStackConfig stackLayoutSize](v5, "stackLayoutSize") != self->_stackLayoutSize
    || -[ATXHomeScreenStackConfig coordinateRow](v5, "coordinateRow") != self->_coordinateRow
    || -[ATXHomeScreenStackConfig coordinateColumn](v5, "coordinateColumn") != self->_coordinateColumn)
  {
    goto LABEL_10;
  }
  widgets = self->_widgets;
  v7 = v5->_widgets;
  if (widgets == v7)
  {

    goto LABEL_16;
  }
  v8 = v7;
  v9 = widgets;
  v10 = -[NSArray isEqual:](v9, "isEqual:", v8);

  if ((v10 & 1) != 0)
  {
LABEL_16:
    v13 = self->_identifier;
    v14 = v13;
    if (v13 == v5->_identifier)
      v11 = 1;
    else
      v11 = -[NSString isEqual:](v13, "isEqual:");

    goto LABEL_11;
  }
LABEL_10:
  v11 = 0;
LABEL_11:

LABEL_14:
  return v11;
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("Identifier: %@;"), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("Allows new widget: %d; "), self->_allowsNewWidget);
  objc_msgSend(v3, "appendFormat:", CFSTR("Allows smart rotate: %d; "), self->_allowsSmartRotate);
  objc_msgSend(v3, "appendFormat:", CFSTR("Widgets: %@; "), self->_widgets);
  objc_msgSend(v3, "appendFormat:", CFSTR("Layout size: %lu; "), self->_stackLayoutSize);
  objc_msgSend(v3, "appendFormat:", CFSTR("Row: %lu, Column: %lu; "), self->_coordinateRow, self->_coordinateColumn);
  return v3;
}

- (id)compactDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ATXHomeScreenStackConfig *v14;
  NSArray *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("Id: %@; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("N+1?: %d; "), self->_allowsNewWidget);
  objc_msgSend(v3, "appendFormat:", CFSTR("Rotation?: %d; "), self->_allowsSmartRotate);
  objc_msgSend(v3, "appendFormat:", CFSTR("Widgets:[\n"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = self;
  obj = self->_widgets;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v8, "extensionBundleId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "widgetKind");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "intent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "widgetUniqueId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("  %@ : %@ : hasIntent=%d : %@\n"), v9, v10, v11 != 0, v12);

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("]; "));
  objc_msgSend(v3, "appendFormat:", CFSTR("Layout size: %lu; "), v14->_stackLayoutSize);
  objc_msgSend(v3, "appendFormat:", CFSTR("Row: %lu, Column: %lu; "), v14->_coordinateRow, v14->_coordinateColumn);
  return v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_widgets;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowsNewWidget);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("allowsNewWidget"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowsSmartRotate);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("allowsSmartRotate"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("widgets"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_stackLayoutSize);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("stackLayoutSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_coordinateRow);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("coordinateRow"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_coordinateColumn);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("coordinateColumn"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  v16 = (void *)objc_msgSend(v3, "copy");

  return v16;
}

- (id)initFromDictionaryRepresentation:(id)a3
{
  id v4;
  ATXHomeScreenStackConfig *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  ATXHomeScreenWidgetIdentifiable *v21;
  id v22;
  ATXHomeScreenStackConfig *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ATXHomeScreenStackConfig;
  v5 = -[ATXHomeScreenStackConfig init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allowsNewWidget"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsNewWidget = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allowsSmartRotate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsSmartRotate = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stackLayoutSize"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_stackLayoutSize = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coordinateRow"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_coordinateRow = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coordinateColumn"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_coordinateColumn = objc_msgSend(v10, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("widgets"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v19);
          v21 = [ATXHomeScreenWidgetIdentifiable alloc];
          v22 = -[ATXHomeScreenWidgetIdentifiable initFromDictionaryRepresentation:](v21, "initFromDictionaryRepresentation:", v20, (_QWORD)v25);
          if (v22)
            objc_msgSend(v14, "addObject:", v22);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v17);
    }

    -[ATXHomeScreenStackConfig setWidgets:](v5, "setWidgets:", v14);
    v23 = v5;

  }
  return v5;
}

- (BOOL)allowsNewWidget
{
  return self->_allowsNewWidget;
}

- (void)setAllowsNewWidget:(BOOL)a3
{
  self->_allowsNewWidget = a3;
}

- (BOOL)allowsSmartRotate
{
  return self->_allowsSmartRotate;
}

- (void)setAllowsSmartRotate:(BOOL)a3
{
  self->_allowsSmartRotate = a3;
}

- (NSArray)widgets
{
  return self->_widgets;
}

- (unint64_t)stackLayoutSize
{
  return self->_stackLayoutSize;
}

- (void)setStackLayoutSize:(unint64_t)a3
{
  self->_stackLayoutSize = a3;
}

- (int64_t)coordinateRow
{
  return self->_coordinateRow;
}

- (void)setCoordinateRow:(int64_t)a3
{
  self->_coordinateRow = a3;
}

- (int64_t)coordinateColumn
{
  return self->_coordinateColumn;
}

- (void)setCoordinateColumn:(int64_t)a3
{
  self->_coordinateColumn = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (ATXHomeScreenPage)page
{
  return (ATXHomeScreenPage *)objc_loadWeakRetained((id *)&self->_page);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_page);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_widgets, 0);
}

@end
