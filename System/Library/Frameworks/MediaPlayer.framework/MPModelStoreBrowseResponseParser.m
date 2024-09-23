@implementation MPModelStoreBrowseResponseParser

- (MPModelStoreBrowseResponseParser)initWithRawResponseOutput:(id)a3 options:(id)a4 sectionBuilder:(id)a5 contentItemBuilder:(id)a6 userIdentity:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MPModelStoreBrowseResponseParser *v17;
  MPModelStoreBrowseResponseParser *v18;
  objc_super v20;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)MPModelStoreBrowseResponseParser;
  v17 = -[MPModelStoreBrowseResponseParser init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contentItemBuilder, a6);
    v18->_options = ($D56A91B0D9B4BA8C66615E7F684A800E)a4;
    objc_storeStrong(&v18->_rawResponseOutput, a3);
    objc_storeStrong((id *)&v18->_sectionBuilder, a5);
    objc_storeStrong((id *)&v18->_userIdentity, a7);
  }

  return v18;
}

- (MPModelStoreBrowseResponseParser)initWithPreviousParser:(id)a3 additionalStoreItemMetadataResponse:(id)a4 options:(id)a5 sectionBuilder:(id)a6 contentItemBuilder:(id)a7 userIdentity:(id)a8
{
  id v15;
  id v16;
  id v17;
  MPModelStoreBrowseResponseParser *v18;
  MPModelStoreBrowseResponseParser *v19;
  MPModelStoreBrowseResponseParser *previousParser;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)MPModelStoreBrowseResponseParser;
  v18 = -[MPModelStoreBrowseResponseParser init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_additionalStoreItemMetadataResponse, a4);
    objc_storeStrong((id *)&v19->_contentItemBuilder, a7);
    v19->_options = ($D56A91B0D9B4BA8C66615E7F684A800E)a5;
    objc_storeStrong((id *)&v19->_previousParser, a3);
    previousParser = v19->_previousParser;
    if (previousParser)
      objc_storeStrong(&v19->_rawResponseOutput, previousParser->_rawResponseOutput);
    objc_storeStrong((id *)&v19->_sectionBuilder, a6);
    objc_storeStrong((id *)&v19->_userIdentity, a8);
  }

  return v19;
}

- (MPSectionedCollection)results
{
  int64_t *p_parseOnceToken;
  int64_t parseOnceToken;
  _QWORD block[5];

  parseOnceToken = self->_parseOnceToken;
  p_parseOnceToken = &self->_parseOnceToken;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MPModelStoreBrowseResponseParser_results__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  if (parseOnceToken != -1)
    dispatch_once(p_parseOnceToken, block);
  return self->_results;
}

- (MPSectionedCollection)additionalContentIdentifiers
{
  int64_t *p_parseOnceToken;
  int64_t parseOnceToken;
  _QWORD block[5];

  parseOnceToken = self->_parseOnceToken;
  p_parseOnceToken = &self->_parseOnceToken;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MPModelStoreBrowseResponseParser_additionalContentIdentifiers__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  if (parseOnceToken != -1)
    dispatch_once(p_parseOnceToken, block);
  return self->_additionalContentIdentifiers;
}

- (NSArray)allAdditionalContentIdentifiersNeedingLookup
{
  int64_t *p_parseOnceToken;
  int64_t parseOnceToken;
  _QWORD block[5];

  parseOnceToken = self->_parseOnceToken;
  p_parseOnceToken = &self->_parseOnceToken;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__MPModelStoreBrowseResponseParser_allAdditionalContentIdentifiersNeedingLookup__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  if (parseOnceToken != -1)
    dispatch_once(p_parseOnceToken, block);
  return self->_allAdditionalContentIdentifiersNeedingLookup;
}

- (void)_parse
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MPModelStoreBrowseResponseParser *v8;
  id v9;
  uint64_t v10;
  id v11;

  if (_NSIsNSDictionary())
  {
    v11 = self->_rawResponseOutput;
    -[MPModelStoreBrowseResponseParser _populateStorePlatformDataResultsFromRawResponseOutputDictionary:](self, "_populateStorePlatformDataResultsFromRawResponseOutputDictionary:");
    if (self->_previousParser)
    {
      -[MPModelStoreBrowseResponseParser _parseUsingAdditionalContentIdentifiersFromPreviousParser](self, "_parseUsingAdditionalContentIdentifiersFromPreviousParser");
    }
    else
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("pageData"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSDictionary())
      {
        v4 = v3;
        -[MPModelStoreBrowseResponseParser _populateUnavailableContentIdentifiersFromPageDataDictionary:](self, "_populateUnavailableContentIdentifiersFromPageDataDictionary:", v4);
        objc_msgSend(v4, "objectForKey:", CFSTR("fcStructure"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (_NSIsNSDictionary())
        {
          objc_msgSend(v5, "objectForKey:", CFSTR("model"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (_NSIsNSDictionary())
          {
            objc_msgSend(v6, "objectForKey:", CFSTR("children"));
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            if (_NSIsNSArray())
              -[MPModelStoreBrowseResponseParser _parseFeaturedContentStructureModelChildren:](self, "_parseFeaturedContentStructureModelChildren:", v7);

          }
        }
        else
        {
          objc_msgSend(v4, "objectForKey:", CFSTR("selectedChart"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (_NSIsNSDictionary())
          {
            v8 = self;
            v9 = v6;
            v10 = 1;
          }
          else
          {
            v8 = self;
            v9 = v4;
            v10 = 0;
          }
          -[MPModelStoreBrowseResponseParser _parseSingleContentListFromPageDataDictionary:isMemberOfChartSet:](v8, "_parseSingleContentListFromPageDataDictionary:isMemberOfChartSet:", v9, v10);
        }

      }
    }

  }
}

- (void)_parseFeaturedContentStructureModelChildren:(id)a3
{
  id v4;
  id v5;
  MPMutableSectionedCollection *v6;
  MPMutableSectionedCollection *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  BOOL v25;
  id v26;
  MPMutableSectionedCollection *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  MPSectionedCollection *v35;
  MPSectionedCollection *results;
  MPSectionedCollection *v37;
  MPSectionedCollection *additionalContentIdentifiers;
  NSArray *v39;
  NSArray *allAdditionalContentIdentifiersNeedingLookup;
  int v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id obj;
  int v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  id v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v5, "addIndex:", 324);
  objc_msgSend(v5, "addIndex:", 323);
  objc_msgSend(v5, "addIndex:", 326);
  if (!self->_options.useCarPlayBrowseTopLevelContentOnly)
  {
    objc_msgSend(v5, "addIndex:", 327);
    objc_msgSend(v5, "addIndex:", 328);
  }
  objc_msgSend(v5, "addIndex:", 329);
  v6 = objc_alloc_init(MPMutableSectionedCollection);
  v7 = objc_alloc_init(MPMutableSectionedCollection);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v51 = 0;
    v41 = 0;
    v13 = *(_QWORD *)v59;
    v43 = v9;
    v44 = v5;
    v42 = *(_QWORD *)v59;
    do
    {
      v14 = 0;
      v45 = v11;
      do
      {
        if (*(_QWORD *)v59 != v13)
        {
          v15 = v14;
          objc_enumerationMutation(v9);
          v14 = v15;
        }
        v48 = v14;
        v16 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v14);
        if (_NSIsNSDictionary())
        {
          v47 = v16;
          objc_msgSend(v47, "objectForKey:", CFSTR("fcKind"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v49 = objc_msgSend(v17, "integerValue");
            if (objc_msgSend(v5, "containsIndex:"))
            {
              v53 = v17;
              objc_msgSend(v47, "objectForKey:", CFSTR("children"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = v18;
              if (_NSIsNSArray())
              {
                v19 = v18;
              }
              else
              {
                v63 = v47;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
                v19 = (id)objc_claimAutoreleasedReturnValue();
              }
              v20 = v49;
              v56 = 0u;
              v57 = 0u;
              v54 = 0u;
              v55 = 0u;
              obj = v19;
              v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
              if (v21)
              {
                v22 = v21;
                v52 = *(_QWORD *)v55;
                do
                {
                  for (i = 0; i != v22; ++i)
                  {
                    if (*(_QWORD *)v55 != v52)
                      objc_enumerationMutation(obj);
                    v24 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
                    if (!(!self->_options.useCarPlayBrowseTopLevelRequestReorderingHeuristics | (v41 ^ 1 | v51) & 1))
                    {
                      v32 = -[MPModelStoreBrowseResponseParser _parseFeaturedContentChild:isMemberOfChartSet:insertingResultsToSectionedCollection:atSectionIndex:additionalContentIdentifiers:allAdditionalContentIdentifiersNeedingLookup:](self, "_parseFeaturedContentChild:isMemberOfChartSet:insertingResultsToSectionedCollection:atSectionIndex:additionalContentIdentifiers:allAdditionalContentIdentifiersNeedingLookup:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i), v20 == 323, v6, v12, v7, v8);
LABEL_26:
                      v33 = v12 + 1;
                      goto LABEL_27;
                    }
                    v25 = v20 == 323;
                    v26 = v8;
                    v27 = v7;
                    v28 = v25;
                    v29 = -[MPSectionedCollection numberOfSections](v6, "numberOfSections");
                    v30 = !self->_options.useCarPlayBrowseTopLevelRequestReorderingHeuristics | v41 | (v49 == 324);
                    v31 = v28;
                    v7 = v27;
                    v8 = v26;
                    v20 = v49;
                    v32 = -[MPModelStoreBrowseResponseParser _parseFeaturedContentChild:isMemberOfChartSet:insertingResultsToSectionedCollection:atSectionIndex:additionalContentIdentifiers:allAdditionalContentIdentifiersNeedingLookup:](self, "_parseFeaturedContentChild:isMemberOfChartSet:insertingResultsToSectionedCollection:atSectionIndex:additionalContentIdentifiers:allAdditionalContentIdentifiersNeedingLookup:", v24, v31, v6, v29, v7, v8);
                    v33 = v12;
                    if ((v30 & 1) == 0)
                      goto LABEL_26;
LABEL_27:
                    if (v32)
                      v12 = v33;
                    v17 = v53;
                  }
                  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
                }
                while (v22);
              }

              if (self->_options.useCarPlayBrowseTopLevelRequestReorderingHeuristics)
              {
                v25 = v20 == 323;
                v34 = v20;
                v9 = v43;
                v5 = v44;
                v13 = v42;
                v11 = v45;
                if (v25)
                {
                  v51 = 1;
                }
                else if (v34 == 324)
                {
                  v41 = 1;
                }
              }
              else
              {
                v9 = v43;
                v5 = v44;
                v13 = v42;
                v11 = v45;
              }

            }
          }

        }
        v14 = v48 + 1;
      }
      while (v48 + 1 != v11);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v11);
  }

  if (-[MPSectionedCollection numberOfSections](v6, "numberOfSections") <= 0)
  {
    results = self->_results;
    self->_results = 0;
  }
  else
  {
    v35 = (MPSectionedCollection *)-[MPMutableSectionedCollection copy](v6, "copy");
    results = self->_results;
    self->_results = v35;
  }

  if (-[MPSectionedCollection numberOfSections](v7, "numberOfSections") <= 0)
  {
    additionalContentIdentifiers = self->_additionalContentIdentifiers;
    self->_additionalContentIdentifiers = 0;
  }
  else
  {
    v37 = (MPSectionedCollection *)-[MPMutableSectionedCollection copy](v7, "copy");
    additionalContentIdentifiers = self->_additionalContentIdentifiers;
    self->_additionalContentIdentifiers = v37;
  }

  if (objc_msgSend(v8, "count"))
  {
    v39 = (NSArray *)objc_msgSend(v8, "copy");
    allAdditionalContentIdentifiersNeedingLookup = self->_allAdditionalContentIdentifiersNeedingLookup;
    self->_allAdditionalContentIdentifiersNeedingLookup = v39;
  }
  else
  {
    allAdditionalContentIdentifiersNeedingLookup = self->_allAdditionalContentIdentifiersNeedingLookup;
    self->_allAdditionalContentIdentifiersNeedingLookup = 0;
  }

}

- (BOOL)_parseFeaturedContentChild:(id)a3 isMemberOfChartSet:(BOOL)a4 insertingResultsToSectionedCollection:(id)a5 atSectionIndex:(int64_t)a6 additionalContentIdentifiers:(id)a7 allAdditionalContentIdentifiersNeedingLookup:(id)a8
{
  _BOOL4 v11;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  char v27;
  MPModelStoreBrowseResponseParser *v28;
  void *i;
  void *v30;
  id v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  MPModelStoreBrowseContentItemBuilder *contentItemBuilder;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  int v44;
  void *v45;
  int v47;
  void *v48;
  uint64_t v49;
  int v51;
  id v52;
  char v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  uint64_t v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t k;
  uint64_t v73;
  void *v74;
  _BOOL4 v76;
  _BOOL4 v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  MPModelStoreBrowseResponseParser *v91;
  MPModelStoreBrowseSectionUniformContentItemTypeResolver *v92;
  int v93;
  void *v94;
  id v95;
  id v96;
  id obj;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v11 = a4;
  v114 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v96 = a5;
  v95 = a7;
  v86 = a8;
  if (_NSIsNSDictionary())
  {
    v77 = v11;
    v14 = v13;
    objc_msgSend(v14, "objectForKey:", CFSTR("name"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if ((_NSIsNSString() & 1) != 0)
    {
      if (v15)
        goto LABEL_11;
    }
    else
    {

    }
    objc_msgSend(v14, "objectForKey:", CFSTR("title"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
      v15 = v17;
    else
      v15 = 0;

LABEL_11:
    v91 = self;
    objc_msgSend(v14, "objectForKey:", CFSTR("seeAllUrl"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_NSIsNSString() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        goto LABEL_22;
    }
    else
    {

    }
    objc_msgSend(v14, "objectForKey:", CFSTR("link"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      objc_msgSend(v20, "objectForKey:", CFSTR("url"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString())
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

LABEL_22:
    objc_msgSend(v14, "objectForKey:", CFSTR("fcKind"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v22, "integerValue") == 325;
    objc_msgSend(v14, "objectForKey:", CFSTR("content"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if ((_NSIsNSArray() & 1) != 0)
    {
      if (v23)
        goto LABEL_33;
    }
    else
    {

    }
    objc_msgSend(v14, "objectForKey:", CFSTR("links"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSArray())
      v23 = v24;
    else
      v23 = 0;

LABEL_33:
    v92 = objc_alloc_init(MPModelStoreBrowseSectionUniformContentItemTypeResolver);
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    obj = v23;
    v25 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v113, 16);
    if (v25)
    {
      v79 = v22;
      v81 = v19;
      v82 = v15;
      v84 = v14;
      v78 = v13;
      v87 = 0;
      v89 = 0;
      v93 = 0;
      v26 = *(_QWORD *)v108;
      v27 = 1;
      v28 = v91;
      while (1)
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v108 != v26)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)i);
          if (_NSIsNSDictionary())
          {
            v31 = v30;
            objc_msgSend(v31, "objectForKey:", CFSTR("type"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (_NSIsNSString())
              v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("content"));
            else
              v33 = 0;
            objc_msgSend(v31, "objectForKey:", CFSTR("contentId"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v34;
            if (!v34)
            {
              v36 = 0;
              goto LABEL_86;
            }
            MPStoreItemMetadataStringNormalizeStoreIDValue(v34);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
              v37 = v33;
            else
              v37 = 0;
            if (v37 != 1 || -[NSSet containsObject:](v28->_unavailableContentIdentifiers, "containsObject:", v36))
              goto LABEL_86;
            -[MPModelStoreBrowseResponseParser _storeItemMetadataForContentIdentifier:](v28, "_storeItemMetadataForContentIdentifier:", v36);
            v38 = objc_claimAutoreleasedReturnValue();
            contentItemBuilder = v28->_contentItemBuilder;
            v94 = (void *)v38;
            if (v38)
            {
              if ((v27 & 1) != 0)
              {
                -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:userIdentity:](contentItemBuilder, "modelObjectWithStoreItemMetadata:userIdentity:", v38, v28->_userIdentity);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                if (v40)
                {
                  v41 = v40;
                  v42 = objc_msgSend(v40, "detailedItemType");
                  v43 = v87;
                  if (!v87)
                    v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v87 = v43;
                  objc_msgSend(v43, "addObject:", v41);

                  if ((v93 & 1) != 0)
                    v44 = v93;
                  else
                    v44 = 1;
                  if (v42)
                  {
                    v27 = 1;
                    goto LABEL_80;
                  }
                }
                else if ((v93 & 1) != 0)
                {
                  v44 = v93;
                }
                else
                {
                  v44 = 1;
                }
                v93 = v44;
                v48 = v94;
                v42 = 0;
                v27 = 1;
LABEL_85:
                -[MPModelStoreBrowseSectionUniformContentItemTypeResolver addContentItemType:](v92, "addContentItemType:", v42);

                v28 = v91;
LABEL_86:

                continue;
              }
              v48 = (void *)v38;
              v49 = -[MPModelStoreBrowseContentItemBuilder contentItemTypeForStoreItemMetadata:](v28->_contentItemBuilder, "contentItemTypeForStoreItemMetadata:", v38);
              v42 = v49;
              if ((v93 & 1) == 0 && v49 == 0)
                v51 = 1;
              else
                v51 = v93;
              v93 = v51;
              if (v49)
              {
LABEL_74:
                v52 = v89;
                if (!v89)
                  v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v89 = v52;
                objc_msgSend(v52, "addObject:", v36);
                if (!v48)
                  objc_msgSend(v86, "addObject:", v36);
              }
              v27 = 0;
              goto LABEL_85;
            }
            objc_msgSend(v31, "objectForKey:", CFSTR("kindIds"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = -[MPModelStoreBrowseContentItemBuilder contentItemTypeForRawResponseKindIdentifiers:](contentItemBuilder, "contentItemTypeForRawResponseKindIdentifiers:", v45);

            if ((v93 & 1) == 0 && v42 == 0)
              v47 = 1;
            else
              v47 = v93;
            v93 = v47;
            if (!v42)
            {
              v27 = 0;
LABEL_80:
              v48 = v94;
              goto LABEL_85;
            }
            v48 = 0;
            goto LABEL_74;
          }
        }
        v25 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v113, 16);
        if (!v25)
        {
          v53 = v93 & 1;
          v13 = v78;
          v22 = v79;
          v15 = v82;
          v14 = v84;
          v19 = v81;
          v25 = v87;
          v54 = v89;
          goto LABEL_91;
        }
      }
    }
    v54 = 0;
    v53 = 0;
LABEL_91:

    v55 = -[MPModelStoreBrowseSectionUniformContentItemTypeResolver uniformContentItemType](v92, "uniformContentItemType");
    v56 = objc_msgSend(v25, "count");
    if (v56)
      v57 = 0;
    else
      v57 = v53;
    if ((v57 & 1) != 0 || v56)
    {
      if ((v57 & 1) != 0)
      {
LABEL_102:
        v16 = 0;
LABEL_118:

        goto LABEL_119;
      }
    }
    else
    {
      v16 = 0;
      if (!v15 || !v19)
        goto LABEL_118;
    }
    if (!v91->_options.useCarPlayBrowseTopLevelContentOnly || v55 != 7)
    {
      v90 = v54;
      v80 = v22;
      v83 = v15;
      v85 = v14;
      -[MPModelStoreBrowseSectionBuilder modelObjectWithTitle:loadAdditionalContentURL:uniformContentItemType:isMemberOfChartSet:isBrick:previouslyRetrievedNestedResponse:](v91->_sectionBuilder, "modelObjectWithTitle:loadAdditionalContentURL:uniformContentItemType:isMemberOfChartSet:isBrick:previouslyRetrievedNestedResponse:", v15, v19, v55, v77, v76, 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "insertSection:atIndex:", v58, a6);
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v88 = v25;
      v59 = v25;
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v103, v112, 16);
      if (v60)
      {
        v61 = v60;
        v62 = 0;
        v63 = *(_QWORD *)v104;
        do
        {
          for (j = 0; j != v61; ++j)
          {
            if (*(_QWORD *)v104 != v63)
              objc_enumerationMutation(v59);
            v65 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * j);
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v62 + j, a6);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "insertItem:atIndexPath:", v65, v66);

          }
          v62 += j;
          v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v103, v112, 16);
        }
        while (v61);
      }

      objc_msgSend(v95, "insertSection:atIndex:", v58, a6);
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v67 = v90;
      v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
      if (v68)
      {
        v69 = v68;
        v70 = 0;
        v71 = *(_QWORD *)v100;
        do
        {
          for (k = 0; k != v69; ++k)
          {
            if (*(_QWORD *)v100 != v71)
              objc_enumerationMutation(v67);
            v73 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * k);
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v70 + k, a6);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "insertItem:atIndexPath:", v73, v74);

          }
          v70 += k;
          v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
        }
        while (v69);
      }

      v16 = 1;
      v15 = v83;
      v14 = v85;
      v22 = v80;
      v25 = v88;
      v54 = v90;
      goto LABEL_118;
    }
    goto LABEL_102;
  }
  v16 = 0;
LABEL_119:

  return v16;
}

- (void)_parseSingleContentListFromPageDataDictionary:(id)a3 isMemberOfChartSet:(BOOL)a4
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  MPMutableSectionedCollection *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  MPMutableSectionedCollection *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  MPSectionedCollection *v44;
  MPSectionedCollection *results;
  MPSectionedCollection *v46;
  MPSectionedCollection *additionalContentIdentifiers;
  NSArray *v48;
  NSArray *allAdditionalContentIdentifiersNeedingLookup;
  _BOOL4 v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  MPModelStoreBrowseSectionUniformContentItemTypeResolver *v57;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[5];
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v50 = a4;
  v86 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  objc_msgSend(v54, "objectForKey:", CFSTR("title"));
  v53 = (id)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {

LABEL_5:
    objc_msgSend(v54, "objectForKey:", CFSTR("pageTitle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
      v53 = v4;
    else
      v53 = 0;

    goto LABEL_9;
  }
  if (!v53)
    goto LABEL_5;
LABEL_9:
  objc_msgSend(v54, "objectForKey:", CFSTR("seeAllUrl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v51 = 0;
  }

  v57 = objc_alloc_init(MPModelStoreBrowseSectionUniformContentItemTypeResolver);
  objc_msgSend(v54, "objectForKey:", CFSTR("adamIds"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_NSIsNSArray())
  {
    v55 = 0;
    v56 = 0;
    v8 = 0;
    goto LABEL_43;
  }
  v6 = v52;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
  if (!v7)
  {
    v55 = 0;
    v56 = 0;
    v8 = 0;
    goto LABEL_42;
  }
  v55 = 0;
  v56 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v79;
  v10 = 1;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v79 != v9)
        objc_enumerationMutation(v6);
      MPStoreItemMetadataStringNormalizeStoreIDValue(*(void **)(*((_QWORD *)&v78 + 1) + 8 * i));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 && !-[NSSet containsObject:](self->_unavailableContentIdentifiers, "containsObject:", v12))
      {
        if ((v10 & 1) != 0)
        {
          -[MPModelStoreBrowseResponseParser _storeItemMetadataForContentIdentifier:](self, "_storeItemMetadataForContentIdentifier:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13 != 0;
          if (v13)
          {
            -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:userIdentity:](self->_contentItemBuilder, "modelObjectWithStoreItemMetadata:userIdentity:", v13, self->_userIdentity);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v16 = v55;
              if (!v55)
                v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v55 = v16;
              objc_msgSend(v16, "addObject:", v15);
              v17 = objc_msgSend(v15, "detailedItemType");
            }
            else
            {
              v17 = 0;
            }

            v10 = 1;
LABEL_36:
            -[MPModelStoreBrowseSectionUniformContentItemTypeResolver addContentItemType:](v57, "addContentItemType:", v17);
            goto LABEL_37;
          }
        }
        else
        {
          v14 = -[MPModelStoreBrowseResponseParser _storeItemMetadataIsAvailableForContentIdentifier:](self, "_storeItemMetadataIsAvailableForContentIdentifier:", v12);
        }
        v18 = v8;
        if (!v8)
          v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v8 = v18;
        objc_msgSend(v18, "addObject:", v12);
        if (v14)
        {
          v17 = 0;
        }
        else
        {
          v19 = v56;
          if (!v56)
            v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v56 = v19;
          objc_msgSend(v19, "addObject:", v12);
          v17 = 0;
          v10 = 0;
        }
        goto LABEL_36;
      }
LABEL_37:

    }
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
  }
  while (v7);
LABEL_42:

LABEL_43:
  v20 = -[MPModelStoreBrowseSectionUniformContentItemTypeResolver uniformContentItemType](v57, "uniformContentItemType");
  if (!v20)
  {
    objc_msgSend(v54, "objectForKey:", CFSTR("kinds"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0;
    v73 = &v72;
    v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__42040;
    v76 = __Block_byref_object_dispose__42041;
    v77 = 0;
    if (_NSIsNSDictionary())
    {
      v22 = v21;
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = __101__MPModelStoreBrowseResponseParser__parseSingleContentListFromPageDataDictionary_isMemberOfChartSet___block_invoke;
      v71[3] = &unk_1E315F328;
      v71[4] = &v72;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v71);
      goto LABEL_59;
    }
    if (objc_msgSend(v21, "conformsToProtocol:", &unk_1EE2F9E88))
    {
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v23 = v21;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v67, v84, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v68;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v68 != v25)
              objc_enumerationMutation(v23);
            v27 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
            if (_NSIsNSString())
            {
              v28 = v27;
              v29 = (void *)v73[5];
              if (!v29)
              {
                v30 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                v31 = (void *)v73[5];
                v73[5] = (uint64_t)v30;

                v29 = (void *)v73[5];
              }
              objc_msgSend(v29, "addObject:", v28);

            }
          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v67, v84, 16);
        }
        while (v24);
      }

LABEL_59:
    }
    if (objc_msgSend((id)v73[5], "count") == 1)
    {
      objc_msgSend((id)v73[5], "anyObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v32, "isEqualToString:", CFSTR("album")) & 1) != 0)
      {
        v20 = 1;
      }
      else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("musicVideo")) & 1) != 0)
      {
        v20 = 6;
      }
      else if (objc_msgSend(v32, "isEqualToString:", CFSTR("song")))
      {
        v20 = 10;
      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }
    _Block_object_dispose(&v72, 8);

  }
  -[MPModelStoreBrowseSectionBuilder modelObjectWithTitle:loadAdditionalContentURL:uniformContentItemType:isMemberOfChartSet:isBrick:previouslyRetrievedNestedResponse:](self->_sectionBuilder, "modelObjectWithTitle:loadAdditionalContentURL:uniformContentItemType:isMemberOfChartSet:isBrick:previouslyRetrievedNestedResponse:", v53, v51, v20, v50, 0, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_alloc_init(MPMutableSectionedCollection);
  -[MPMutableSectionedCollection appendSection:](v34, "appendSection:", v33);
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v35 = v55;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v63, v83, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v64;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v64 != v37)
          objc_enumerationMutation(v35);
        -[MPMutableSectionedCollection appendItem:](v34, "appendItem:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * k));
      }
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v63, v83, 16);
    }
    while (v36);
  }

  v39 = objc_alloc_init(MPMutableSectionedCollection);
  -[MPMutableSectionedCollection appendSection:](v39, "appendSection:", v33);
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v40 = v8;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v59, v82, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v60;
    do
    {
      for (m = 0; m != v41; ++m)
      {
        if (*(_QWORD *)v60 != v42)
          objc_enumerationMutation(v40);
        -[MPMutableSectionedCollection appendItem:](v39, "appendItem:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * m));
      }
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v59, v82, 16);
    }
    while (v41);
  }

  v44 = (MPSectionedCollection *)-[MPMutableSectionedCollection copy](v34, "copy");
  results = self->_results;
  self->_results = v44;

  v46 = (MPSectionedCollection *)-[MPMutableSectionedCollection copy](v39, "copy");
  additionalContentIdentifiers = self->_additionalContentIdentifiers;
  self->_additionalContentIdentifiers = v46;

  v48 = (NSArray *)objc_msgSend(v56, "copy");
  allAdditionalContentIdentifiersNeedingLookup = self->_allAdditionalContentIdentifiersNeedingLookup;
  self->_allAdditionalContentIdentifiersNeedingLookup = v48;

}

- (void)_parseUsingAdditionalContentIdentifiersFromPreviousParser
{
  void *v3;
  void *v4;
  MPMutableSectionedCollection *v5;
  id v6;
  MPMutableSectionedCollection *v7;
  id v8;
  uint64_t v9;
  MPMutableSectionedCollection *v10;
  MPMutableSectionedCollection *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  MPChangeDetails *v16;
  MPChangeDetails *v17;
  MPSectionedCollection *v18;
  MPSectionedCollection *results;
  MPSectionedCollection *v20;
  MPSectionedCollection *additionalContentIdentifiers;
  NSArray *v22;
  NSArray *allAdditionalContentIdentifiersNeedingLookup;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  _QWORD v29[4];
  MPMutableSectionedCollection *v30;
  MPMutableSectionedCollection *v31;
  id v32;
  id v33;
  MPModelStoreBrowseResponseParser *v34;
  id v35;
  id v36;

  -[MPModelStoreBrowseResponseParser results](self->_previousParser, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelStoreBrowseResponseParser additionalContentIdentifiers](self->_previousParser, "additionalContentIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MPMutableSectionedCollection);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MPMutableSectionedCollection);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __93__MPModelStoreBrowseResponseParser__parseUsingAdditionalContentIdentifiersFromPreviousParser__block_invoke;
  v29[3] = &unk_1E315F3A0;
  v10 = v7;
  v30 = v10;
  v11 = v5;
  v31 = v11;
  v12 = v3;
  v32 = v12;
  v13 = v4;
  v33 = v13;
  v34 = self;
  v14 = v6;
  v35 = v14;
  v15 = v8;
  v36 = v15;
  objc_msgSend(v12, "enumerateSectionsUsingBlock:", v29);
  if (objc_msgSend(v14, "count"))
  {
    v16 = [MPChangeDetails alloc];
    v24 = v9;
    v25 = 3221225472;
    v26 = __93__MPModelStoreBrowseResponseParser__parseUsingAdditionalContentIdentifiersFromPreviousParser__block_invoke_4;
    v27 = &unk_1E315F3C8;
    v28 = v14;
    v17 = -[MPChangeDetails initWithBlock:](v16, "initWithBlock:", &v24);

  }
  else
  {
    v17 = 0;
  }
  if (-[MPSectionedCollection numberOfSections](v11, "numberOfSections", v24, v25, v26, v27) <= 0)
  {
    results = self->_results;
    self->_results = 0;
  }
  else
  {
    v18 = (MPSectionedCollection *)-[MPMutableSectionedCollection copy](v11, "copy");
    results = self->_results;
    self->_results = v18;
  }

  objc_storeStrong((id *)&self->_changeDetails, v17);
  if (-[MPSectionedCollection numberOfSections](v10, "numberOfSections") <= 0)
  {
    additionalContentIdentifiers = self->_additionalContentIdentifiers;
    self->_additionalContentIdentifiers = 0;
  }
  else
  {
    v20 = (MPSectionedCollection *)-[MPMutableSectionedCollection copy](v10, "copy");
    additionalContentIdentifiers = self->_additionalContentIdentifiers;
    self->_additionalContentIdentifiers = v20;
  }

  if (objc_msgSend(v15, "count"))
  {
    v22 = (NSArray *)objc_msgSend(v15, "copy");
    allAdditionalContentIdentifiersNeedingLookup = self->_allAdditionalContentIdentifiersNeedingLookup;
    self->_allAdditionalContentIdentifiersNeedingLookup = v22;
  }
  else
  {
    allAdditionalContentIdentifiersNeedingLookup = self->_allAdditionalContentIdentifiersNeedingLookup;
    self->_allAdditionalContentIdentifiersNeedingLookup = 0;
  }

}

- (void)_populateStorePlatformDataResultsFromRawResponseOutputDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSDictionary *v10;
  NSDictionary *storePlatformDataResults;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("storePlatformData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (_NSIsNSDictionary())
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("results"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSDictionary())
      {
        v9 = v8;
        v13 = 0;
        v14 = &v13;
        v15 = 0x3032000000;
        v16 = __Block_byref_object_copy__42040;
        v17 = __Block_byref_object_dispose__42041;
        v18 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __101__MPModelStoreBrowseResponseParser__populateStorePlatformDataResultsFromRawResponseOutputDictionary___block_invoke;
        v12[3] = &unk_1E315F328;
        v12[4] = &v13;
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);
        v10 = (NSDictionary *)objc_msgSend((id)v14[5], "copy");
        storePlatformDataResults = self->_storePlatformDataResults;
        self->_storePlatformDataResults = v10;

        _Block_object_dispose(&v13, 8);
      }

    }
  }

}

- (void)_populateUnavailableContentIdentifiersFromPageDataDictionary:(id)a3
{
  id v4;
  void *v5;
  NSSet *v6;
  NSSet *unavailableContentIdentifiers;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSSet *v14;
  NSSet *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("unAvailableContentIds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__42040;
    v25 = __Block_byref_object_dispose__42041;
    v26 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __97__MPModelStoreBrowseResponseParser__populateUnavailableContentIdentifiersFromPageDataDictionary___block_invoke;
    v20[3] = &unk_1E315F328;
    v20[4] = &v21;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v20);
    v6 = (NSSet *)objc_msgSend((id)v22[5], "copy");
    unavailableContentIdentifiers = self->_unavailableContentIdentifiers;
    self->_unavailableContentIdentifiers = v6;

    _Block_object_dispose(&v21, 8);
  }
  else if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE2F9E88))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v5;
    v9 = 0;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          MPStoreItemMetadataStringNormalizeStoreIDValue(*(void **)(*((_QWORD *)&v16 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            if (!v9)
              v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(v9, "addObject:", v13, (_QWORD)v16);
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
      }
      while (v10);
    }

    v14 = (NSSet *)objc_msgSend(v9, "copy");
    v15 = self->_unavailableContentIdentifiers;
    self->_unavailableContentIdentifiers = v14;

  }
}

- (id)_storeItemMetadataForContentIdentifier:(id)a3
{
  id v4;
  MPStoreItemMetadata *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MPModelStoreBrowseResponseParser _storeItemMetadataForContentIdentifier:](self->_previousParser, "_storeItemMetadataForContentIdentifier:", v4);
  v5 = (MPStoreItemMetadata *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[MPStoreItemMetadataResponse storeItemMetadataForItemIdentifier:](self->_additionalStoreItemMetadataResponse, "storeItemMetadataForItemIdentifier:", v4);
    v5 = (MPStoreItemMetadata *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[NSDictionary objectForKey:](self->_storePlatformDataResults, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSDictionary())
      {
        v7 = v6;
        v5 = -[MPStoreItemMetadata initWithStorePlatformDictionary:]([MPStoreItemMetadata alloc], "initWithStorePlatformDictionary:", v7);

      }
      else
      {
        v5 = 0;
      }

    }
  }

  return v5;
}

- (BOOL)_storeItemMetadataIsAvailableForContentIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  if (-[MPModelStoreBrowseResponseParser _storeItemMetadataIsAvailableForContentIdentifier:](self->_previousParser, "_storeItemMetadataIsAvailableForContentIdentifier:", v4)|| (-[MPStoreItemMetadataResponse storeItemMetadataForItemIdentifier:](self->_additionalStoreItemMetadataResponse, "storeItemMetadataForItemIdentifier:", v4), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v6 = 1;
  }
  else
  {
    -[NSDictionary objectForKey:](self->_storePlatformDataResults, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = _NSIsNSDictionary();

  }
  return v6;
}

- (id)rawResponseOutput
{
  return self->_rawResponseOutput;
}

- ($96EE1C12479E9B303E9C2794B92A11A2)options
{
  return ($96EE1C12479E9B303E9C2794B92A11A2)self->_options;
}

- (MPModelStoreBrowseResponseParser)previousParser
{
  return self->_previousParser;
}

- (MPStoreItemMetadataResponse)additionalStoreItemMetadataResponse
{
  return self->_additionalStoreItemMetadataResponse;
}

- (MPModelStoreBrowseSectionBuilder)sectionBuilder
{
  return self->_sectionBuilder;
}

- (MPModelStoreBrowseContentItemBuilder)contentItemBuilder
{
  return self->_contentItemBuilder;
}

- (MPChangeDetails)changeDetails
{
  return self->_changeDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeDetails, 0);
  objc_storeStrong((id *)&self->_contentItemBuilder, 0);
  objc_storeStrong((id *)&self->_sectionBuilder, 0);
  objc_storeStrong((id *)&self->_additionalStoreItemMetadataResponse, 0);
  objc_storeStrong((id *)&self->_previousParser, 0);
  objc_storeStrong(&self->_rawResponseOutput, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_unavailableContentIdentifiers, 0);
  objc_storeStrong((id *)&self->_storePlatformDataResults, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_allAdditionalContentIdentifiersNeedingLookup, 0);
  objc_storeStrong((id *)&self->_additionalContentIdentifiers, 0);
}

void __97__MPModelStoreBrowseResponseParser__populateUnavailableContentIdentifiersFromPageDataDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v5, "BOOLValue"))
  {
    MPStoreItemMetadataStringNormalizeStoreIDValue(v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      if (!v7)
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      }
      objc_msgSend(v7, "addObject:", v6);
    }

  }
}

void __101__MPModelStoreBrowseResponseParser__populateStorePlatformDataResultsFromRawResponseOutputDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  MPStoreItemMetadataStringNormalizeStoreIDValue(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && _NSIsNSDictionary())
  {
    v6 = v12;
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    v11 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v7, "setObject:forKey:", v11, v5);

  }
}

void __93__MPModelStoreBrowseResponseParser__parseUsingAdditionalContentIdentifiersFromPreviousParser__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v18[3];
  char v19;
  _QWORD v20[3];
  uint64_t v21;
  _QWORD v22[4];
  id v23;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "appendSection:", v5);
  objc_msgSend(*(id *)(a1 + 40), "appendSection:", v5);
  v6 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __93__MPModelStoreBrowseResponseParser__parseUsingAdditionalContentIdentifiersFromPreviousParser__block_invoke_2;
  v22[3] = &unk_1E315F350;
  v7 = *(void **)(a1 + 48);
  v23 = *(id *)(a1 + 40);
  objc_msgSend(v7, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v22);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v21 = objc_msgSend(*(id *)(a1 + 40), "numberOfItemsInSection:", a3);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 1;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __93__MPModelStoreBrowseResponseParser__parseUsingAdditionalContentIdentifiersFromPreviousParser__block_invoke_3;
  v10[3] = &unk_1E315F378;
  v9 = *(void **)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v15 = v18;
  v10[4] = v8;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 72);
  v16 = v20;
  v17 = a3;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 80);
  objc_msgSend(v9, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v10);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

}

uint64_t __93__MPModelStoreBrowseResponseParser__parseUsingAdditionalContentIdentifiersFromPreviousParser__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInsertedItemIndexPaths:", *(_QWORD *)(a1 + 32));
}

uint64_t __93__MPModelStoreBrowseResponseParser__parseUsingAdditionalContentIdentifiersFromPreviousParser__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendItem:", a2);
}

void __93__MPModelStoreBrowseResponseParser__parseUsingAdditionalContentIdentifiersFromPreviousParser__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v12 = v3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v11 = objc_msgSend(v4, "_storeItemMetadataIsAvailableForContentIdentifier:", v3);
    objc_msgSend(*(id *)(a1 + 56), "appendItem:", v12);
    v10 = v12;
    if ((v11 & 1) != 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(v4, "_storeItemMetadataForContentIdentifier:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 56), "appendItem:", v12);
LABEL_9:
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v12);
    v10 = v12;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    goto LABEL_10;
  }
  v6 = (void *)v5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "modelObjectWithStoreItemMetadata:userIdentity:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "appendItem:", v7);
    v8 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), *(_QWORD *)(a1 + 88));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  }

  v10 = v12;
LABEL_10:

}

void __101__MPModelStoreBrowseResponseParser__parseSingleContentListFromPageDataDictionary_isMemberOfChartSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (_NSIsNSString()
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v5, "BOOLValue"))
  {
    v6 = v11;
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v7, "addObject:", v6);

  }
}

uint64_t __80__MPModelStoreBrowseResponseParser_allAdditionalContentIdentifiersNeedingLookup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_parse");
}

uint64_t __64__MPModelStoreBrowseResponseParser_additionalContentIdentifiers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_parse");
}

uint64_t __43__MPModelStoreBrowseResponseParser_results__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_parse");
}

@end
