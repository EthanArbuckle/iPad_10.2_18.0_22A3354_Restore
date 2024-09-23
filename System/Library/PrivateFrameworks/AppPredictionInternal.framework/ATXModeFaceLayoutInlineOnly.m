@implementation ATXModeFaceLayoutInlineOnly

- (BOOL)assignComplicationsFromCandidates:(id)a3 forSuggestedFace:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "_pas_filteredArrayWithTest:", &__block_literal_global_16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    objc_msgSend(v5, "setLayoutType:", 0);
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSubtitleComplication:", v8);

  }
  return v7 != 0;
}

BOOL __82__ATXModeFaceLayoutInlineOnly_assignComplicationsFromCandidates_forSuggestedFace___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "widgetFamily") == 12;
}

@end
