@implementation ATXModeFaceLandscapeLayoutThreeSmallAndTwoRectangular

- (BOOL)assignComplicationsFromCandidates:(id)a3 forSuggestedFace:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_pas_filteredArrayWithTest:", &__block_literal_global_106);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_pas_filteredArrayWithTest:", &__block_literal_global_4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  v10 = objc_msgSend(v8, "count");
  if (v10 >= 3)
    v11 = 3;
  else
    v11 = v10;
  objc_msgSend(v8, "subarrayWithRange:", 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v12);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __108__ATXModeFaceLandscapeLayoutThreeSmallAndTwoRectangular_assignComplicationsFromCandidates_forSuggestedFace___block_invoke_3;
  v19[3] = &unk_1E82DE740;
  v20 = v9;
  v13 = v9;
  objc_msgSend(v7, "_pas_filteredArrayWithTest:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "count");
  if (v15 >= 2)
    v16 = 2;
  else
    v16 = v15;
  objc_msgSend(v14, "subarrayWithRange:", 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObjectsFromArray:", v17);
  objc_msgSend(v5, "setLandscapeComplications:", v13);

  return 1;
}

BOOL __108__ATXModeFaceLandscapeLayoutThreeSmallAndTwoRectangular_assignComplicationsFromCandidates_forSuggestedFace___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "widgetFamily") == 11;
}

BOOL __108__ATXModeFaceLandscapeLayoutThreeSmallAndTwoRectangular_assignComplicationsFromCandidates_forSuggestedFace___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "widgetFamily") == 1;
}

uint64_t __108__ATXModeFaceLandscapeLayoutThreeSmallAndTwoRectangular_assignComplicationsFromCandidates_forSuggestedFace___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = (objc_class *)MEMORY[0x1E0CF8D38];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v5, "initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:", v6, v7, v8, 1, v9, 4);
  v11 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v10) ^ 1;

  return v11;
}

@end
