@implementation ATXDefaultHomeScreenItemTilerWrapper

- (ATXDefaultHomeScreenItemTilerWrapper)initWithDefaultStack:(id)a3 defaultWidgetsSmall:(id)a4 defaultWidgetsMedium:(id)a5 defaultWidgetsLarge:(id)a6 defaultWidgetsExtraLarge:(id)a7 widgetFamilyMask:(unint64_t)a8 gridSize:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  ATXDefaultHomeScreenItemTilerWrapper *v20;
  __objc2_class *v21;
  uint64_t v22;
  NSObject *tiler;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v25.receiver = self;
  v25.super_class = (Class)ATXDefaultHomeScreenItemTilerWrapper;
  v20 = -[ATXDefaultHomeScreenItemTilerWrapper init](&v25, sel_init);
  switch(a9)
  {
    case 0uLL:
      v21 = ATXDefaultHomeScreenItemTilerGridSize2;
      goto LABEL_6;
    case 1uLL:
      v21 = ATXDefaultHomeScreenItemTilerGridSize3;
      goto LABEL_6;
    case 2uLL:
      v21 = ATXDefaultHomeScreenItemTilerGridSize4;
      goto LABEL_6;
    case 3uLL:
      v21 = ATXDefaultHomeScreenItemTilerGridSize5;
LABEL_6:
      v22 = objc_msgSend([v21 alloc], "initWithDefaultStack:defaultWidgetsSmall:defaultWidgetsMedium:defaultWidgetsLarge:defaultWidgetsExtraLarge:widgetFamilyMask:", v15, v16, v17, v18, v19, a8);
      tiler = v20->_tiler;
      v20->_tiler = (ATXDefaultHomeScreenItemTiler *)v22;
      goto LABEL_7;
    case 4uLL:
      __atxlog_handle_modes();
      tiler = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(tiler, OS_LOG_TYPE_FAULT))
        -[ATXDefaultHomeScreenItemTilerWrapper initWithDefaultStack:defaultWidgetsSmall:defaultWidgetsMedium:defaultWidgetsLarge:defaultWidgetsExtraLarge:widgetFamilyMask:gridSize:].cold.1(tiler);
LABEL_7:

      break;
    default:
      break;
  }

  return v20;
}

- (NSArray)tiledHomeScreenItems
{
  return (NSArray *)-[ATXDefaultHomeScreenItemTiler tiledHomeScreenItems](self->_tiler, "tiledHomeScreenItems");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiler, 0);
}

- (void)initWithDefaultStack:(os_log_t)log defaultWidgetsSmall:defaultWidgetsMedium:defaultWidgetsLarge:defaultWidgetsExtraLarge:widgetFamilyMask:gridSize:.cold.1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 134217984;
  v2 = 4;
  _os_log_fault_impl(&dword_1A49EF000, log, OS_LOG_TYPE_FAULT, "ATXDefaultHomeScreenItemTiler: grid size is not valid: %lu", (uint8_t *)&v1, 0xCu);
}

@end
