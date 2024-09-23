@implementation ATXModeFaceLayoutRectangularAndTwoCircular

- (BOOL)assignComplicationsFromCandidates:(id)a3 forSuggestedFace:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_pas_filteredArrayWithTest:", &__block_literal_global_192);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_pas_filteredArrayWithTest:", &__block_literal_global_4_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v7, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __97__ATXModeFaceLayoutRectangularAndTwoCircular_assignComplicationsFromCandidates_forSuggestedFace___block_invoke_3;
    v18[3] = &unk_1E82DE740;
    v19 = v7;
    objc_msgSend(v8, "_pas_filteredArrayWithTest:", v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "count");
    v13 = v12 > 1;
    if (v12 >= 2)
    {
      v14 = objc_msgSend(v11, "count");
      if (v14 >= 2)
        v15 = 2;
      else
        v15 = v14;
      objc_msgSend(v11, "subarrayWithRange:", 0, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v16);
      objc_msgSend(v5, "setLayoutType:", 3);
      objc_msgSend(v5, "setComplications:", v9);

    }
  }
  else
  {
    v13 = 0;
    v11 = v8;
  }

  return v13;
}

BOOL __97__ATXModeFaceLayoutRectangularAndTwoCircular_assignComplicationsFromCandidates_forSuggestedFace___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "widgetFamily") == 11;
}

BOOL __97__ATXModeFaceLayoutRectangularAndTwoCircular_assignComplicationsFromCandidates_forSuggestedFace___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "widgetFamily") == 10;
}

uint64_t __97__ATXModeFaceLayoutRectangularAndTwoCircular_assignComplicationsFromCandidates_forSuggestedFace___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

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

  v10 = (void *)objc_msgSend(v5, "initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:", v6, v7, v8, 11, v9, 4);
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v10, "isEqual:", v11);

  return v4 ^ 1;
}

@end
