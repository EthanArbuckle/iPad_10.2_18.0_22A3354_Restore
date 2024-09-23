@implementation ATXDefaultHomeScreenItemTilerGridSize4

- (id)tiledHomeScreenItems
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  v3 = (void *)objc_opt_new();
  -[ATXDefaultHomeScreenItemTilerGridSize4 _tilingBlueprint](self, "_tilingBlueprint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[ATXDefaultHomeScreenItemTilerGridSize4 _shouldAllowAlternatePodTypeAsBackupForTilingBlueprint:](self, "_shouldAllowAlternatePodTypeAsBackupForTilingBlueprint:", v4);
    if (v5)
      v6 = -[ATXDefaultHomeScreenItemTilerPodBuilder addFirstPod:](self, "addFirstPod:", v3);
    else
      v6 = 0;
    do
    {
      if ((unint64_t)objc_msgSend(v3, "count") >= 7 && (v6 & 1) == 0)
        break;
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6 % objc_msgSend(v4, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "integerValue");

      v9 = -[ATXDefaultHomeScreenItemTilerPodBuilder addPod:podType:allowAlternatePodTypeAsBackup:podsAdded:](self, "addPod:podType:allowAlternatePodTypeAsBackup:podsAdded:", v3, v8, v5, v6);
      v6 += v9;
    }
    while (v9);
  }

  return v3;
}

- (id)_tilingBlueprint
{
  NSObject *v4;

  if ((~-[ATXDefaultHomeScreenItemTilerPodBuilder widgetFamilyMask](self, "widgetFamilyMask") & 0x1E) == 0)
    return &unk_1E4DC28A0;
  if ((~-[ATXDefaultHomeScreenItemTilerPodBuilder widgetFamilyMask](self, "widgetFamilyMask") & 0xE) == 0)
    return &unk_1E4DC28B8;
  if ((-[ATXDefaultHomeScreenItemTilerPodBuilder widgetFamilyMask](self, "widgetFamilyMask") & 2) != 0)
    return &unk_1E4DC28D0;
  if ((-[ATXDefaultHomeScreenItemTilerPodBuilder widgetFamilyMask](self, "widgetFamilyMask") & 4) != 0)
    return &unk_1E4DC28E8;
  if ((-[ATXDefaultHomeScreenItemTilerPodBuilder widgetFamilyMask](self, "widgetFamilyMask") & 8) != 0)
    return &unk_1E4DC2900;
  if ((-[ATXDefaultHomeScreenItemTilerPodBuilder widgetFamilyMask](self, "widgetFamilyMask") & 0x10) != 0)
    return &unk_1E4DC2918;
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[ATXDefaultHomeScreenItemTilerGridSize4 _tilingBlueprint].cold.1(self, v4);

  return 0;
}

- (BOOL)_shouldAllowAlternatePodTypeAsBackupForTilingBlueprint:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToArray:", &unk_1E4DC2930) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToArray:", &unk_1E4DC2948);

  return v4;
}

- (void)_tilingBlueprint
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "widgetFamilyMask");
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "ATXDefaultHomeScreenItemTilerGridSize4: no tiling blueprint for the requested size family: %lu", (uint8_t *)&v3, 0xCu);
}

@end
