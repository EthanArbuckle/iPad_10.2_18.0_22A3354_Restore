@implementation ATXDefaultHomeScreenItemTilerGridSize5

- (id)tiledHomeScreenItems
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v10;

  v3 = (void *)objc_opt_new();
  -[ATXDefaultHomeScreenItemTilerGridSize5 _tilingBlueprint](self, "_tilingBlueprint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[ATXDefaultHomeScreenItemTilerGridSize5 _shouldAllowAlternatePodTypeAsBackupForTilingBlueprint:](self, "_shouldAllowAlternatePodTypeAsBackupForTilingBlueprint:", v4);
    v6 = 0;
    do
    {
      if ((unint64_t)objc_msgSend(v3, "count") >= 0xA && (v6 & 1) == 0)
        break;
      if ((v6 & 1) == 0
        && !-[ATXDefaultHomeScreenItemTilerGridSize5 _addTwoSmallWidgets:](self, "_addTwoSmallWidgets:", v3))
      {
        break;
      }
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6 % objc_msgSend(v4, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "integerValue");

      if (!v6 && v5)
        v6 = -[ATXDefaultHomeScreenItemTilerPodBuilder addFirstPod:](self, "addFirstPod:", v3);
      v10 = -[ATXDefaultHomeScreenItemTilerPodBuilder addPod:podType:allowAlternatePodTypeAsBackup:podsAdded:](self, "addPod:podType:allowAlternatePodTypeAsBackup:podsAdded:", v3, v8, v5, v6);
      v6 += v10;
    }
    while (v10);
  }

  return v3;
}

- (id)_tilingBlueprint
{
  NSObject *v4;

  if ((~-[ATXDefaultHomeScreenItemTilerPodBuilder widgetFamilyMask](self, "widgetFamilyMask") & 0x1E) == 0)
    return &unk_1E4DC2780;
  if ((~-[ATXDefaultHomeScreenItemTilerPodBuilder widgetFamilyMask](self, "widgetFamilyMask") & 0xE) == 0)
    return &unk_1E4DC2798;
  if ((-[ATXDefaultHomeScreenItemTilerPodBuilder widgetFamilyMask](self, "widgetFamilyMask") & 2) != 0)
    return &unk_1E4DC27B0;
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[ATXDefaultHomeScreenItemTilerGridSize5 _tilingBlueprint].cold.1(self, v4);

  return 0;
}

- (BOOL)_shouldAllowAlternatePodTypeAsBackupForTilingBlueprint:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToArray:", &unk_1E4DC27C8) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToArray:", &unk_1E4DC27E0);

  return v4;
}

- (BOOL)_addTwoSmallWidgets:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;

  v4 = a3;
  if ((-[ATXDefaultHomeScreenItemTilerPodBuilder widgetFamilyMask](self, "widgetFamilyMask") & 2) != 0
    && (-[ATXDefaultHomeScreenItemTilerPodBuilder defaultWidgetsSmall](self, "defaultWidgetsSmall"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 >= 2))
  {
    -[ATXDefaultHomeScreenItemTilerPodBuilder tilerHelper](self, "tilerHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXDefaultHomeScreenItemTilerPodBuilder defaultWidgetsSmall](self, "defaultWidgetsSmall");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filterForNextUnusedWidgetDescriptor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATXDefaultHomeScreenItemTilerPodBuilder tilerHelper](self, "tilerHelper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXDefaultHomeScreenItemTilerPodBuilder defaultWidgetsSmall](self, "defaultWidgetsSmall");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filterForNextUnusedWidgetDescriptor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && v12)
    {
      objc_msgSend(v4, "addObject:", v9);
      objc_msgSend(v4, "addObject:", v12);
      v13 = 1;
    }
    else
    {
      -[ATXDefaultHomeScreenItemTilerPodBuilder tilerHelper](self, "tilerHelper");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "unmarkWidgetAsUsed:", v9);

      -[ATXDefaultHomeScreenItemTilerPodBuilder tilerHelper](self, "tilerHelper");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "unmarkWidgetAsUsed:", v12);

      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_tilingBlueprint
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "widgetFamilyMask");
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "ATXDefaultHomeScreenItemTilerGridSize5: no tiling blueprint for the requested size family: %lu", (uint8_t *)&v3, 0xCu);
}

@end
