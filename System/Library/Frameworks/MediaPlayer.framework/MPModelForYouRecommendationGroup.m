@implementation MPModelForYouRecommendationGroup

+ (id)__traits_KEY
{
  return CFSTR("MPModelForYouRecommendationGroupPropertyTraits");
}

+ (id)__title_KEY
{
  return CFSTR("MPModelForYouRecommendationGroupPropertyTitle");
}

+ (id)__subgroups_KEY
{
  return CFSTR("MPModelForYouRecommendationGroupPropertySubgroups");
}

+ (id)__sectionedItems_KEY
{
  return CFSTR("MPModelForYouRecommendationGroupPropertySectionedItems");
}

+ (id)__sectionIndex_KEY
{
  return CFSTR("MPModelForYouRecommendationGroupPropertySectionIndex");
}

+ (id)__refreshURL_KEY
{
  return CFSTR("MPModelForYouRecommendationGroupPropertyRefreshURL");
}

+ (id)__loadAdditionalContentURL_KEY
{
  return CFSTR("MPModelForYouRecommendationGroupPropertyLoadAdditionalContentURL");
}

+ (id)__lastUpdatedDate_KEY
{
  return CFSTR("MPModelForYouRecommendationGroupPropertyLastUpdatedDate");
}

+ (id)__hrefURL_KEY
{
  return CFSTR("MPModelForYouRecommendationGroupPropertyHrefURL");
}

+ (id)__groupType_KEY
{
  return CFSTR("MPModelForYouRecommendationGroupPropertyGroupType");
}

+ (id)__displaysAsTitledSectionWithRowsInCarPlay_KEY
{
  return CFSTR("MPModelForYouRecommendationGroupPropertyDisplaysAsTitledSectionWithRowsInCarPlay");
}

+ (id)__displaysAsGridCellInCarPlay_KEY
{
  return CFSTR("MPModelForYouRecommendationGroupPropertyDisplaysAsGridCellInCarPlay");
}

- (NSURL)refreshURL
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%lld"), llround(v6 * 1000.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("time"));
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", self->_refreshURL, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "mutableCopy");

  if (!v10)
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__MPModelForYouRecommendationGroup_refreshURL__block_invoke;
  v14[3] = &unk_1E315F2B0;
  v15 = v10;
  v11 = v10;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v14);
  objc_msgSend(v8, "setQueryItems:", v11);
  objc_msgSend(v8, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v12;
}

- (void)setRefreshURL:(id)a3
{
  objc_storeStrong((id *)&self->_refreshURL, a3);
}

- (int64_t)numberOfItems
{
  void *v3;
  int64_t v4;

  -[MPModelForYouRecommendationGroup sectionedItems](self, "sectionedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItemsInSection:", -[MPModelForYouRecommendationGroup sectionIndex](self, "sectionIndex"));

  return v4;
}

- (id)itemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, -[MPModelForYouRecommendationGroup sectionIndex](self, "sectionIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelForYouRecommendationGroup sectionedItems](self, "sectionedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isGroupRecommendation
{
  return self->_groupRecommendation;
}

- (void)setGroupRecommendation:(BOOL)a3
{
  self->_groupRecommendation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshURL, 0);
}

void __46__MPModelForYouRecommendationGroup_refreshURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a2;
  v5 = (objc_class *)MEMORY[0x1E0CB39D8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithName:value:", v11, v6);

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__MPModelForYouRecommendationGroup_refreshURL__block_invoke_2;
    v12[3] = &unk_1E315F288;
    v13 = v11;
    v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", v12);
    v10 = *(void **)(a1 + 32);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v10, "addObject:", v7);
    else
      objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v9, v7);

  }
}

uint64_t __46__MPModelForYouRecommendationGroup_refreshURL__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

+ (id)classesForSecureCoding
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)__MPModelForYouRecommendationGroupPropertyGroupType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelForYouRecommendationGroup.m"), 39, CFSTR("Translator was missing mapping for MPModelForYouRecommendationGroupPropertyGroupType"));

}

+ (void)__MPModelForYouRecommendationGroupPropertyLastUpdatedDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelForYouRecommendationGroup.m"), 40, CFSTR("Translator was missing mapping for MPModelForYouRecommendationGroupPropertyLastUpdatedDate"));

}

+ (void)__MPModelForYouRecommendationGroupPropertySectionedItems__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelForYouRecommendationGroup.m"), 41, CFSTR("Translator was missing mapping for MPModelForYouRecommendationGroupPropertySectionedItems"));

}

+ (void)__MPModelForYouRecommendationGroupPropertySectionIndex__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelForYouRecommendationGroup.m"), 42, CFSTR("Translator was missing mapping for MPModelForYouRecommendationGroupPropertySectionIndex"));

}

+ (void)__MPModelForYouRecommendationGroupPropertySubgroups__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelForYouRecommendationGroup.m"), 43, CFSTR("Translator was missing mapping for MPModelForYouRecommendationGroupPropertySubgroups"));

}

+ (void)__MPModelForYouRecommendationGroupPropertyTitle__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelForYouRecommendationGroup.m"), 44, CFSTR("Translator was missing mapping for MPModelForYouRecommendationGroupPropertyTitle"));

}

+ (void)__MPModelForYouRecommendationGroupPropertyLoadAdditionalContentURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelForYouRecommendationGroup.m"), 45, CFSTR("Translator was missing mapping for MPModelForYouRecommendationGroupPropertyLoadAdditionalContentURL"));

}

+ (void)__MPModelForYouRecommendationGroupPropertyHrefURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelForYouRecommendationGroup.m"), 46, CFSTR("Translator was missing mapping for MPModelForYouRecommendationGroupPropertyHrefURL"));

}

+ (void)__MPModelForYouRecommendationGroupPropertyRefreshURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelForYouRecommendationGroup.m"), 47, CFSTR("Translator was missing mapping for MPModelForYouRecommendationGroupPropertyRefreshURL"));

}

+ (void)__MPModelForYouRecommendationGroupPropertyTraits__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelForYouRecommendationGroup.m"), 48, CFSTR("Translator was missing mapping for MPModelForYouRecommendationGroupPropertyTraits"));

}

+ (void)__MPModelForYouRecommendationGroupPropertyDisplaysAsGridCellInCarPlay__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelForYouRecommendationGroup.m"), 49, CFSTR("Translator was missing mapping for MPModelForYouRecommendationGroupPropertyDisplaysAsGridCellInCarPlay"));

}

+ (void)__MPModelForYouRecommendationGroupPropertyDisplaysAsTitledSectionWithRowsInCarPlay__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelForYouRecommendationGroup.m"), 50, CFSTR("Translator was missing mapping for MPModelForYouRecommendationGroupPropertyDisplaysAsTitledSectionWithRowsInCarPlay"));

}

@end
