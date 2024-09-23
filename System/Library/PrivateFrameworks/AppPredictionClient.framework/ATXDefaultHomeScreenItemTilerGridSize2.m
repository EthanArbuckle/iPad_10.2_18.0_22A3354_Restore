@implementation ATXDefaultHomeScreenItemTilerGridSize2

- (ATXDefaultHomeScreenItemTilerGridSize2)initWithDefaultStack:(id)a3 defaultWidgetsSmall:(id)a4 defaultWidgetsMedium:(id)a5 defaultWidgetsLarge:(id)a6 defaultWidgetsExtraLarge:(id)a7 widgetFamilyMask:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  ATXDefaultHomeScreenItemTilerGridSize2 *v18;
  ATXDefaultHomeScreenItemTilerGridSize2 *v19;
  uint64_t v20;
  NSMutableArray *defaultWidgetsSmall;
  uint64_t v22;
  NSMutableArray *defaultWidgetsMedium;
  uint64_t v24;
  NSMutableArray *defaultWidgetsLarge;
  uint64_t v26;
  ATXDefaultHomeScreenItemTilerHelper *tilerHelper;
  objc_super v29;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v29.receiver = self;
  v29.super_class = (Class)ATXDefaultHomeScreenItemTilerGridSize2;
  v18 = -[ATXDefaultHomeScreenItemTilerGridSize2 init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_defaultStack, a3);
    v20 = objc_msgSend(v15, "mutableCopy");
    defaultWidgetsSmall = v19->_defaultWidgetsSmall;
    v19->_defaultWidgetsSmall = (NSMutableArray *)v20;

    v22 = objc_msgSend(v16, "mutableCopy");
    defaultWidgetsMedium = v19->_defaultWidgetsMedium;
    v19->_defaultWidgetsMedium = (NSMutableArray *)v22;

    v24 = objc_msgSend(v17, "mutableCopy");
    defaultWidgetsLarge = v19->_defaultWidgetsLarge;
    v19->_defaultWidgetsLarge = (NSMutableArray *)v24;

    v19->_widgetFamilyMask = a8;
    v26 = objc_opt_new();
    tilerHelper = v19->_tilerHelper;
    v19->_tilerHelper = (ATXDefaultHomeScreenItemTilerHelper *)v26;

  }
  return v19;
}

- (NSArray)tiledHomeScreenItems
{
  void *v3;
  unint64_t widgetFamilyMask;
  uint64_t *p_widgetFamilyMask;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v12;

  v3 = (void *)objc_opt_new();
  p_widgetFamilyMask = (uint64_t *)&self->_widgetFamilyMask;
  widgetFamilyMask = self->_widgetFamilyMask;
  v6 = widgetFamilyMask & 6;
  if (v6 == 6)
  {
    if (self->_defaultStack)
      v7 = -[ATXDefaultHomeScreenItemTilerGridSize2 _addFirstRow:](self, "_addFirstRow:", v3);
    else
      v7 = 0;
    v8 = &unk_1E4DC27F8;
    goto LABEL_11;
  }
  if ((widgetFamilyMask & 2) != 0)
    v8 = &unk_1E4DC2810;
  else
    v8 = &unk_1E4DC2828;
  if ((widgetFamilyMask & 6) != 0)
  {
    v7 = 0;
    do
    {
LABEL_11:
      if ((unint64_t)objc_msgSend(v3, "count") > 0xB)
        break;
      objc_msgSend(v8, "objectAtIndexedSubscript:", v7 % objc_msgSend(v8, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "integerValue");

      ++v7;
    }
    while (-[ATXDefaultHomeScreenItemTilerGridSize2 _addRow:rowSizePreference:allowAlternateRowSizeAsBackup:](self, "_addRow:rowSizePreference:allowAlternateRowSizeAsBackup:", v3, v10, v6 == 6));
    return (NSArray *)v3;
  }
  if ((widgetFamilyMask & 8) != 0)
  {
    v7 = 0;
    v8 = &unk_1E4DC2840;
    goto LABEL_11;
  }
  __atxlog_handle_modes();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[ATXDefaultHomeScreenItemTilerGridSize2 tiledHomeScreenItems].cold.1(p_widgetFamilyMask, v12);

  return (NSArray *)v3;
}

- (BOOL)_addFirstRow:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  if (!-[ATXDefaultWidgetStack suggestedSize](self->_defaultStack, "suggestedSize")
    && -[NSMutableArray count](self->_defaultWidgetsSmall, "count"))
  {
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (self->_defaultStack && v7)
    {
      objc_msgSend(v4, "addObject:");
      objc_msgSend(v4, "addObject:", v8);

      goto LABEL_9;
    }
    -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v7);

LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  -[ATXDefaultWidgetStack mediumDefaultStack](self->_defaultStack, "mediumDefaultStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    goto LABEL_11;
  -[ATXDefaultWidgetStack setSuggestedSize:](self->_defaultStack, "setSuggestedSize:", 1);
  if (!self->_defaultStack)
    goto LABEL_11;
  objc_msgSend(v4, "addObject:");
LABEL_9:
  v9 = 1;
LABEL_12:

  return v9;
}

- (BOOL)_addRow:(id)a3 rowSizePreference:(unint64_t)a4 allowAlternateRowSizeAsBackup:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  BOOL v9;
  uint64_t v10;

  v5 = a5;
  v8 = a3;
  v9 = -[ATXDefaultHomeScreenItemTilerGridSize2 _addRow:rowType:](self, "_addRow:rowType:", v8, a4);
  if (!v9 && v5)
  {
    v10 = 0;
    while (a4 == 2
         || a4 == v10
         || !-[ATXDefaultHomeScreenItemTilerGridSize2 _addRow:rowType:](self, "_addRow:rowType:", v8, v10))
    {
      if (++v10 == 3)
      {
        v9 = 0;
        goto LABEL_10;
      }
    }
    v9 = 1;
  }
LABEL_10:

  return v9;
}

- (BOOL)_addRow:(id)a3 rowType:(unint64_t)a4
{
  id v6;
  BOOL v7;
  BOOL v8;

  v6 = a3;
  if (a4 == 2)
  {
    v7 = -[ATXDefaultHomeScreenItemTilerGridSize2 _addLargeRow:](self, "_addLargeRow:", v6);
  }
  else if (a4 == 1)
  {
    v7 = -[ATXDefaultHomeScreenItemTilerGridSize2 _addMediumRow:](self, "_addMediumRow:", v6);
  }
  else
  {
    if (a4)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v7 = -[ATXDefaultHomeScreenItemTilerGridSize2 _addSmallRow:](self, "_addSmallRow:", v6);
  }
  v8 = v7;
LABEL_9:

  return v8;
}

- (BOOL)_addSmallRow:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  BOOL v9;

  v4 = a3;
  if ((unint64_t)-[NSMutableArray count](self->_defaultWidgetsSmall, "count") < 2)
  {
    v9 = 0;
  }
  else
  {
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8)
    {
      -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v5);
      -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v7);
      v9 = 0;
    }
    else
    {
      objc_msgSend(v4, "addObject:", v5);
      objc_msgSend(v4, "addObject:", v7);
      v9 = 1;
    }

  }
  return v9;
}

- (BOOL)_addMediumRow:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsMedium);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObject:", v5);

  return v5 != 0;
}

- (BOOL)_addLargeRow:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsLarge);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObject:", v5);

  return v5 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tilerHelper, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsLarge, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsMedium, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsSmall, 0);
  objc_storeStrong((id *)&self->_defaultStack, 0);
}

- (void)tiledHomeScreenItems
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "ATXDefaultHomeScreenItemTilerGridSize4: no tiling blueprint for the requested size family: %lu", (uint8_t *)&v3, 0xCu);
}

@end
