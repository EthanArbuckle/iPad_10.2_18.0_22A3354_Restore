@implementation GEOMapsSearchHomeSection

- (GEOMapsSearchHomeSection)initWithMapsSearchHomeSection:(id)a3 mapsResults:(id)a4
{
  id *v6;
  id v7;
  void *v8;
  NSString *v9;
  NSString *name;
  void *v11;
  id *v12;
  void *v13;
  id v14;
  id *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  GEOSearchCategory *v21;
  NSArray *v22;
  NSArray *searchCategories;
  NSArray **p_searchCategories;
  void *v25;
  GEOCollectionSuggestionResult *v26;
  void *v27;
  void *v28;
  GEOCollectionSuggestionResult *v29;
  GEOCollectionSuggestionResult *collectionSuggestions;
  void *v31;
  void *v32;
  void *v33;
  GEOPublisherSuggestionResult *v34;
  void *v35;
  void *v36;
  GEOPublisherSuggestionResult *v37;
  GEOPublisherSuggestionResult *publisherSuggestions;
  GEOGuideLocationSuggestionResults *v39;
  void *v40;
  GEOGuideLocationSuggestionResults *v41;
  GEOGuideLocationSuggestionResults *guideLocationSuggestsions;
  GEOMapsSearchHomeSection *v43;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, void *);
  void *v48;
  void *v49;
  _QWORD v50[4];
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  objc_super v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = a4;
  if (-[GEOMapsSearchHomeSection dataModelIsValid:](self, "dataModelIsValid:", v6))
  {
    v56.receiver = self;
    v56.super_class = (Class)GEOMapsSearchHomeSection;
    self = -[GEOMapsSearchHomeSection init](&v56, sel_init);
    if (self)
    {
      -[GEOPDMapsSearchHomeSection name](v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (NSString *)objc_msgSend(v8, "copy");
      name = self->_name;
      self->_name = v9;

      switch(-[GEOPDMapsSearchHomeSection sectionType]((uint64_t)v6))
      {
        case 0u:
          self->_sectionType = 0;
          break;
        case 1u:
          self->_sectionType = 1;
          v11 = (void *)MEMORY[0x1E0C99DE8];
          -[GEOPDMapsSearchHomeSection searchBrowseCategorySuggestionResult](v6);
          v12 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDSearchBrowseCategorySuggestionResult categorys](v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v13, "count"));
          v14 = (id)objc_claimAutoreleasedReturnValue();

          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          -[GEOPDMapsSearchHomeSection searchBrowseCategorySuggestionResult](v6);
          v15 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDSearchBrowseCategorySuggestionResult categorys](v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v53;
            do
            {
              v20 = 0;
              do
              {
                if (*(_QWORD *)v53 != v19)
                  objc_enumerationMutation(v16);
                v21 = -[GEOSearchCategory initWithBrowseCategory:]([GEOSearchCategory alloc], "initWithBrowseCategory:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v20));
                if (v21)
                  objc_msgSend(v14, "addObject:", v21);

                ++v20;
              }
              while (v18 != v20);
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
            }
            while (v18);
          }

          if (objc_msgSend(v14, "count"))
          {
            v22 = (NSArray *)objc_msgSend(v14, "copy");
            p_searchCategories = &self->_searchCategories;
            searchCategories = self->_searchCategories;
            self->_searchCategories = v22;
          }
          else
          {
            p_searchCategories = &self->_searchCategories;
            searchCategories = self->_searchCategories;
            self->_searchCategories = 0;
          }

          v31 = *p_searchCategories;
          goto LABEL_23;
        case 2u:
          self->_sectionType = 2;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v50[0] = MEMORY[0x1E0C809B0];
          v50[1] = 3221225472;
          v50[2] = __70__GEOMapsSearchHomeSection_initWithMapsSearchHomeSection_mapsResults___block_invoke;
          v50[3] = &unk_1E1BFF5C8;
          v51 = v25;
          v14 = v25;
          objc_msgSend(v7, "enumerateObjectsUsingBlock:", v50);
          v26 = [GEOCollectionSuggestionResult alloc];
          -[GEOPDMapsSearchHomeSection collectionSuggestionResult](v6);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v14, "copy");
          v29 = -[GEOCollectionSuggestionResult initWithCollectionSuggestionResult:mapsResults:](v26, "initWithCollectionSuggestionResult:mapsResults:", v27, v28);
          collectionSuggestions = self->_collectionSuggestions;
          self->_collectionSuggestions = v29;

          v31 = self->_collectionSuggestions;
          v32 = v51;
          goto LABEL_18;
        case 3u:
          self->_sectionType = 3;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = MEMORY[0x1E0C809B0];
          v46 = 3221225472;
          v47 = __70__GEOMapsSearchHomeSection_initWithMapsSearchHomeSection_mapsResults___block_invoke_2;
          v48 = &unk_1E1BFF5C8;
          v49 = v33;
          v14 = v33;
          objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v45);
          v34 = [GEOPublisherSuggestionResult alloc];
          -[GEOPDMapsSearchHomeSection publisherSuggestionResult](v6);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)objc_msgSend(v14, "copy", v45, v46, v47, v48);
          v37 = -[GEOPublisherSuggestionResult initWithPublisherSuggestionResult:mapsResults:](v34, "initWithPublisherSuggestionResult:mapsResults:", v35, v36);
          publisherSuggestions = self->_publisherSuggestions;
          self->_publisherSuggestions = v37;

          v31 = self->_publisherSuggestions;
          v32 = v49;
LABEL_18:

LABEL_23:
          if (v31)
            break;
          goto LABEL_20;
        case 5u:
          self->_sectionType = 4;
          v39 = [GEOGuideLocationSuggestionResults alloc];
          -[GEOPDMapsSearchHomeSection guidesLocationsSuggestionResult](v6);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = -[GEOGuideLocationSuggestionResults initWithGuideLocationSuggestionResult:mapsResults:](v39, "initWithGuideLocationSuggestionResult:mapsResults:", v40, v7);
          guideLocationSuggestsions = self->_guideLocationSuggestsions;
          self->_guideLocationSuggestsions = v41;

          if (!self->_guideLocationSuggestsions)
            goto LABEL_20;
          break;
        default:
          break;
      }
    }
    self = self;
    v43 = self;
  }
  else
  {
LABEL_20:
    v43 = 0;
  }

  return v43;
}

void __70__GEOMapsSearchHomeSection_initWithMapsSearchHomeSection_mapsResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "resultType") == 2 && objc_msgSend(v3, "hasCollection"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __70__GEOMapsSearchHomeSection_initWithMapsSearchHomeSection_mapsResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "resultType") == 3 && objc_msgSend(v3, "hasPublisher"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (BOOL)dataModelIsValid:(id)a3
{
  id *v3;
  BOOL v4;
  void *v5;

  v3 = (id *)a3;
  v4 = 0;
  switch(-[GEOPDMapsSearchHomeSection sectionType]((uint64_t)v3))
  {
    case 1u:
      -[GEOPDMapsSearchHomeSection searchBrowseCategorySuggestionResult](v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2u:
      -[GEOPDMapsSearchHomeSection collectionSuggestionResult](v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3u:
      -[GEOPDMapsSearchHomeSection publisherSuggestionResult](v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 5u:
      -[GEOPDMapsSearchHomeSection guidesLocationsSuggestionResult](v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v4 = v5 != 0;

      break;
    default:
      break;
  }

  return v4;
}

- (id)description
{
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  switch(-[GEOMapsSearchHomeSection sectionType](self, "sectionType"))
  {
    case 0uLL:
      v3 = 0;
      v4 = CFSTR("Unknown");
      break;
    case 1uLL:
      -[GEOMapsSearchHomeSection searchCategories](self, "searchCategories");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "count");

      v4 = CFSTR("Browse Categories");
      break;
    case 2uLL:
      -[GEOMapsSearchHomeSection collectionSuggestions](self, "collectionSuggestions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "collections");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v7, "count");

      v4 = CFSTR("Curated Collections");
      break;
    case 3uLL:
      -[GEOMapsSearchHomeSection publisherSuggestions](self, "publisherSuggestions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "publishers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v9, "count");

      v4 = CFSTR("Publishers");
      break;
    case 4uLL:
      -[GEOMapsSearchHomeSection guideLocationSuggestsions](self, "guideLocationSuggestsions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "guideLocations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v11, "count");

      v4 = CFSTR("Guide Location Suggestion");
      break;
    default:
      v4 = 0;
      v3 = 0;
      break;
  }
  v12 = (void *)MEMORY[0x1E0CB3940];
  v16.receiver = self;
  v16.super_class = (Class)GEOMapsSearchHomeSection;
  -[GEOMapsSearchHomeSection description](&v16, sel_description);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@. %@, %lu objects"), v13, v4, v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (GEOCollectionSuggestionResult)collectionSuggestions
{
  return self->_collectionSuggestions;
}

- (NSString)name
{
  return self->_name;
}

- (GEOPublisherSuggestionResult)publisherSuggestions
{
  return self->_publisherSuggestions;
}

- (NSArray)searchCategories
{
  return self->_searchCategories;
}

- (GEOGuideLocationSuggestionResults)guideLocationSuggestsions
{
  return self->_guideLocationSuggestsions;
}

- (unint64_t)sectionType
{
  return self->_sectionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guideLocationSuggestsions, 0);
  objc_storeStrong((id *)&self->_searchCategories, 0);
  objc_storeStrong((id *)&self->_publisherSuggestions, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_collectionSuggestions, 0);
}

@end
