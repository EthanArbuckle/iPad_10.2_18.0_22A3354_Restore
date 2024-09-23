@implementation GEOResultRefinementSection

- (GEOResultRefinementSection)initWithSectionHeader:(id)a3 resultRefinements:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  GEOResultRefinementSection *v16;
  uint64_t v17;
  NSString *sectionHeader;
  uint64_t v19;
  NSArray *resultRefinements;
  GEOResultRefinementSection *v21;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "count");
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "type");

  if (v8)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          if (v10 != objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v15), "type"))
          {

            goto LABEL_14;
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
          continue;
        break;
      }
    }

    v23.receiver = self;
    v23.super_class = (Class)GEOResultRefinementSection;
    v16 = -[GEOResultRefinementSection init](&v23, sel_init);
    if (v16)
    {
      v17 = objc_msgSend(v6, "copy");
      sectionHeader = v16->_sectionHeader;
      v16->_sectionHeader = (NSString *)v17;

      v19 = objc_msgSend(v11, "copy");
      resultRefinements = v16->_resultRefinements;
      v16->_resultRefinements = (NSArray *)v19;

      v16->_refinementsType = v10;
    }
    self = v16;
    v21 = self;
  }
  else
  {
LABEL_14:
    v21 = 0;
  }

  return v21;
}

- (GEOResultRefinementSection)initWithResultRefinementSection:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  GEOResultRefinementSection *v8;

  v4 = (id *)a3;
  -[GEOPDResultRefinementSection resultRefinements](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_geo_compactMap:", &__block_literal_global_110);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOPDResultRefinementSection sectionHeader](v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[GEOResultRefinementSection initWithSectionHeader:resultRefinements:](self, "initWithSectionHeader:resultRefinements:", v7, v6);
  return v8;
}

GEOResultRefinement *__62__GEOResultRefinementSection_initWithResultRefinementSection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GEOResultRefinement *v3;

  v2 = a2;
  v3 = -[GEOResultRefinement initWithResultRefinement:]([GEOResultRefinement alloc], "initWithResultRefinement:", v2);

  return v3;
}

- (id)convertToGEOPDResultRefinementSection
{
  GEOPDResultRefinementSection *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(GEOPDResultRefinementSection);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[GEOResultRefinementSection resultRefinements](self, "resultRefinements", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "convertToGEOPDResultRefinement");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDResultRefinementSection addResultRefinement:]((uint64_t)v3, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[GEOResultRefinementSection sectionHeader](self, "sectionHeader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementSection setSectionHeader:]((uint64_t)v3, v10);

  return v3;
}

- (NSString)sectionHeader
{
  return self->_sectionHeader;
}

- (void)setSectionHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)resultRefinements
{
  return self->_resultRefinements;
}

- (void)setResultRefinements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)refinementsType
{
  return self->_refinementsType;
}

- (void)setRefinementsType:(int64_t)a3
{
  self->_refinementsType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultRefinements, 0);
  objc_storeStrong((id *)&self->_sectionHeader, 0);
}

@end
