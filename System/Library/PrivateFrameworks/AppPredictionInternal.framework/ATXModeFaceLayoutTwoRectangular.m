@implementation ATXModeFaceLayoutTwoRectangular

- (BOOL)assignComplicationsFromCandidates:(id)a3 forSuggestedFace:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a4;
  objc_msgSend(a3, "_pas_filteredArrayWithTest:", &__block_literal_global_141);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7 >= 2)
  {
    objc_msgSend(v5, "setLayoutType:", 1);
    v8 = objc_msgSend(v6, "count");
    if (v8 >= 2)
      v9 = 2;
    else
      v9 = v8;
    objc_msgSend(v6, "subarrayWithRange:", 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setComplications:", v10);

  }
  return v7 > 1;
}

BOOL __86__ATXModeFaceLayoutTwoRectangular_assignComplicationsFromCandidates_forSuggestedFace___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "widgetFamily") == 11;
}

@end
