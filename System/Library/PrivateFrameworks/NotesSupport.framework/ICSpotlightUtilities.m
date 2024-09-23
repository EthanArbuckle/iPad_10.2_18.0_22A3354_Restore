@implementation ICSpotlightUtilities

+ (id)queryFields
{
  if (queryFields_onceTokenForAllQueryFields != -1)
    dispatch_once(&queryFields_onceTokenForAllQueryFields, &__block_literal_global_19);
  return (id)queryFields_allQueryFields;
}

void __35__ICSpotlightUtilities_queryFields__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CA6048];
  v4[0] = CFSTR("_ICItemDisplayName");
  v4[1] = v0;
  v1 = *MEMORY[0x1E0CA6678];
  v4[2] = *MEMORY[0x1E0CA6910];
  v4[3] = v1;
  v4[4] = *MEMORY[0x1E0CA6688];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)queryFields_allQueryFields;
  queryFields_allQueryFields = v2;

}

+ (unint64_t)rankingQueryLimit
{
  return 64;
}

+ (id)rankingQueryFieldsForGenericHighlighting
{
  if (rankingQueryFieldsForGenericHighlighting_onceTokenForAllQueryFields != -1)
    dispatch_once(&rankingQueryFieldsForGenericHighlighting_onceTokenForAllQueryFields, &__block_literal_global_2_0);
  return (id)rankingQueryFieldsForGenericHighlighting_rankingQueryFields;
}

void __64__ICSpotlightUtilities_rankingQueryFieldsForGenericHighlighting__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CA6048];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)rankingQueryFieldsForGenericHighlighting_rankingQueryFields;
  rankingQueryFieldsForGenericHighlighting_rankingQueryFields = v1;

}

+ (id)rankingQueryFieldsForWordSpecificHighlighting
{
  if (rankingQueryFieldsForWordSpecificHighlighting_onceTokenForAllQueryFields != -1)
    dispatch_once(&rankingQueryFieldsForWordSpecificHighlighting_onceTokenForAllQueryFields, &__block_literal_global_3);
  return (id)rankingQueryFieldsForWordSpecificHighlighting_rankingQueryFields;
}

void __69__ICSpotlightUtilities_rankingQueryFieldsForWordSpecificHighlighting__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CA6910];
  v4[0] = CFSTR("_ICItemDisplayName");
  v4[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)rankingQueryFieldsForWordSpecificHighlighting_rankingQueryFields;
  rankingQueryFieldsForWordSpecificHighlighting_rankingQueryFields = v2;

}

+ (id)rankingQueryFieldsForSorting
{
  if (rankingQueryFieldsForSorting_onceTokenForAllQueryFields != -1)
    dispatch_once(&rankingQueryFieldsForSorting_onceTokenForAllQueryFields, &__block_literal_global_4);
  return (id)rankingQueryFieldsForSorting_rankingQueryFields;
}

void __52__ICSpotlightUtilities_rankingQueryFieldsForSorting__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("_ICItemDisplayName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v6 = *MEMORY[0x1E0CA6048];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v5 = *MEMORY[0x1E0CA6910];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)rankingQueryFieldsForSorting_rankingQueryFields;
  rankingQueryFieldsForSorting_rankingQueryFields = v3;

}

+ (id)stringByEscapingSearchString:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), CFSTR("\\\\"), 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("\\\"), 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("'"), CFSTR("\\'"), 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("*"), CFSTR("\\*"), 0, 0, objc_msgSend(v3, "length"));
  return v3;
}

+ (id)userActivityPersistentIdentifierForNote:(id)a3
{
  return (id)objc_msgSend(a3, "contentIdentifier");
}

@end
