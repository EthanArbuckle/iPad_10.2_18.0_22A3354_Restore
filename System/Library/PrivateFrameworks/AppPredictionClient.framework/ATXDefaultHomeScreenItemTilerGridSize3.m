@implementation ATXDefaultHomeScreenItemTilerGridSize3

- (ATXDefaultHomeScreenItemTilerGridSize3)initWithDefaultStack:(id)a3 defaultWidgetsSmall:(id)a4 defaultWidgetsMedium:(id)a5 defaultWidgetsLarge:(id)a6 defaultWidgetsExtraLarge:(id)a7 widgetFamilyMask:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  ATXDefaultHomeScreenItemTilerGridSize3 *v18;
  ATXDefaultHomeScreenItemTilerGridSize3 *v19;
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
  v29.super_class = (Class)ATXDefaultHomeScreenItemTilerGridSize3;
  v18 = -[ATXDefaultHomeScreenItemTilerGridSize3 init](&v29, sel_init);
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
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = (void *)objc_opt_new();
  p_widgetFamilyMask = (uint64_t *)&self->_widgetFamilyMask;
  widgetFamilyMask = self->_widgetFamilyMask;
  v6 = widgetFamilyMask & 6;
  if (v6 == 6)
  {
    if (self->_defaultStack)
      v7 = -[ATXDefaultHomeScreenItemTilerGridSize3 _addFirstRow:](self, "_addFirstRow:", v3);
    else
      v7 = 0;
    v9 = &unk_1E4DC29A8;
    goto LABEL_11;
  }
  if ((widgetFamilyMask & 2) != 0)
  {
    v7 = 0;
    v9 = &unk_1E4DC29C0;
    do
    {
LABEL_11:
      if ((unint64_t)objc_msgSend(v3, "count") > 6)
        break;
      objc_msgSend(v9, "objectAtIndexedSubscript:", v7 % objc_msgSend(v9, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      ++v7;
    }
    while (-[ATXDefaultHomeScreenItemTilerGridSize3 _addRow:rowSizePreference:allowAlternateRowSizeAsBackup:](self, "_addRow:rowSizePreference:allowAlternateRowSizeAsBackup:", v3, v11, v6 == 6));
    return (NSArray *)v3;
  }
  __atxlog_handle_modes();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[ATXDefaultHomeScreenItemTilerGridSize2 tiledHomeScreenItems].cold.1(p_widgetFamilyMask, v8);

  return (NSArray *)v3;
}

- (BOOL)_addFirstRow:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  v4 = a3;
  if (!-[ATXDefaultWidgetStack suggestedSize](self->_defaultStack, "suggestedSize")
    && (unint64_t)-[NSMutableArray count](self->_defaultWidgetsSmall, "count") >= 2)
  {
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (self->_defaultStack && v5 && v6)
    {
      objc_msgSend(v4, "addObject:");
      objc_msgSend(v4, "addObject:", v5);
      objc_msgSend(v4, "addObject:", v7);

LABEL_12:
      v10 = 1;
LABEL_17:

      goto LABEL_18;
    }
    -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v5);
    -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v7);

    goto LABEL_16;
  }
  -[ATXDefaultWidgetStack mediumDefaultStack](self->_defaultStack, "mediumDefaultStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
    goto LABEL_16;
  v8 = -[NSMutableArray count](self->_defaultWidgetsSmall, "count");

  if (v8)
  {
    -[ATXDefaultWidgetStack setSuggestedSize:](self->_defaultStack, "setSuggestedSize:", 1);
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
    v9 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v9;
    if (self->_defaultStack && v9)
    {
      objc_msgSend(v4, "addObject:");
      objc_msgSend(v4, "addObject:", v5);
      goto LABEL_12;
    }
    -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v9);
LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  v10 = 0;
LABEL_18:

  return v10;
}

- (BOOL)_addRow:(id)a3 rowSizePreference:(unint64_t)a4 allowAlternateRowSizeAsBackup:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  BOOL v9;
  uint64_t v10;
  int v11;
  int v12;

  v5 = a5;
  v8 = a3;
  v9 = -[ATXDefaultHomeScreenItemTilerGridSize3 _addRow:rowType:](self, "_addRow:rowType:", v8, a4);
  if (!v9 && v5)
  {
    v10 = 0;
    v11 = 1;
    do
    {
      while (1)
      {
        v12 = v11;
        if (v10 != a4)
          break;
        v11 = 0;
        v9 = 0;
        v10 = 1;
        if ((v12 & 1) == 0)
          goto LABEL_9;
      }
      v9 = -[ATXDefaultHomeScreenItemTilerGridSize3 _addRow:rowType:](self, "_addRow:rowType:", v8);
      if (v9)
        break;
      v11 = 0;
      v10 = 1;
    }
    while (((v12 ^ 1) & 1) == 0);
  }
LABEL_9:

  return v9;
}

- (BOOL)_addRow:(id)a3 rowType:(unint64_t)a4
{
  id v6;
  BOOL v7;
  BOOL v8;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = -[ATXDefaultHomeScreenItemTilerGridSize3 _addMediumRow:](self, "_addMediumRow:", v6);
  }
  else
  {
    if (a4)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = -[ATXDefaultHomeScreenItemTilerGridSize3 _addSmallRow:](self, "_addSmallRow:", v6);
  }
  v8 = v7;
LABEL_7:

  return v8;
}

- (BOOL)_addSmallRow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  if ((unint64_t)-[NSMutableArray count](self->_defaultWidgetsSmall, "count") < 3)
  {
    v9 = 0;
  }
  else
  {
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v5 && v6 && v7)
    {
      objc_msgSend(v4, "addObject:", v5);
      objc_msgSend(v4, "addObject:", v6);
      objc_msgSend(v4, "addObject:", v8);
      v9 = 1;
    }
    else
    {
      -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v5);
      -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v6);
      -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v8);
      v9 = 0;
    }

  }
  return v9;
}

- (BOOL)_addMediumRow:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  BOOL v9;

  v4 = a3;
  -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsMedium);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDefaultHomeScreenItemTilerHelper filterForNextUnusedWidgetDescriptor:](self->_tilerHelper, "filterForNextUnusedWidgetDescriptor:", self->_defaultWidgetsSmall);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (v8)
  {
    -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v5);
    -[ATXDefaultHomeScreenItemTilerHelper unmarkWidgetAsUsed:](self->_tilerHelper, "unmarkWidgetAsUsed:", v7);
  }
  else
  {
    objc_msgSend(v4, "addObject:", v5);
    objc_msgSend(v4, "addObject:", v7);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tilerHelper, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsLarge, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsMedium, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsSmall, 0);
  objc_storeStrong((id *)&self->_defaultStack, 0);
}

@end
