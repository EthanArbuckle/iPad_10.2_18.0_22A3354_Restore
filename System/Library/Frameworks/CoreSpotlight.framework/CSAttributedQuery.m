@implementation CSAttributedQuery

- (CSAttributedQuery)initWithAttributedQuery:(id)a3 embedding:(id)a4
{
  id v7;
  id v8;
  CSAttributedQuery *v9;
  CSAttributedQuery *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSAttributedQuery;
  v9 = -[CSAttributedQuery init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_query, a3);
    objc_storeStrong((id *)&v10->_queryEmbedding, a4);
  }

  return v10;
}

- (CSAttributedQuery)initWithAttributedQuery:(id)a3
{
  return -[CSAttributedQuery initWithAttributedQuery:embedding:](self, "initWithAttributedQuery:embedding:", a3, 0);
}

- (CSAttributedQuery)initWithAttributedParses:(id)a3 outputTokenInfo:(id)a4 embedding:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  CSAttributedQuery *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v8, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithString:", v13);

    -[CSAttributedQuery _updateAttributedQuery:withOutputTokenInfo:](self, "_updateAttributedQuery:withOutputTokenInfo:", v14, v9);
    -[CSAttributedQuery _updateAttributedQuery:withAttributedParses:](self, "_updateAttributedQuery:withAttributedParses:", v14, v8);
    v15 = -[CSAttributedQuery initWithAttributedQuery:embedding:](self, "initWithAttributedQuery:embedding:", v14, v10);

  }
  else
  {
    v15 = -[CSAttributedQuery initWithAttributedQuery:embedding:](self, "initWithAttributedQuery:embedding:", 0, 0);
  }

  return v15;
}

- (void)_updateAttributedQuery:(id)a3 withOutputTokenInfo:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id obj;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = a4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenRange"), v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "rangeValue");
        v13 = v12;

        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenArgLabels"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenArgScores"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "count");
        if (v16 == objc_msgSend(v15, "count"))
        {
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __64__CSAttributedQuery__updateAttributedQuery_withOutputTokenInfo___block_invoke;
          v19[3] = &unk_1E24010F0;
          v20 = v15;
          v21 = v17;
          v22 = v11;
          v23 = v13;
          objc_msgSend(v14, "enumerateObjectsUsingBlock:", v19);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

}

void __64__CSAttributedQuery__updateAttributedQuery_withOutputTokenInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  float v6;
  double v7;
  const __CFString *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  if (v7 >= 0.2)
  {
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ARG_LOCATION")) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", CFSTR("ARG_GENERIC_LOCATION")) & 1) != 0)
    {
      v8 = CFSTR("kMDItemPhotosLocationKeywords");
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ARG_PERSON")) & 1) != 0
           || (objc_msgSend(v9, "isEqualToString:", CFSTR("ARG_PERSON_SENDER")) & 1) != 0)
    {
      v8 = CFSTR("kMDItemPhotosPeopleNames");
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ARG_MEDIA_TYPE")) & 1) != 0)
    {
      v8 = CFSTR("kMDItemPhotosMediaTypes");
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ARG_TIME")) & 1) != 0)
    {
      v8 = CFSTR("kMDItemContentCreationDate");
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ARG_EVENT")) & 1) != 0)
    {
      v8 = CFSTR("kMDItemPhotosEventNames");
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("ARG_FAVORITED")))
        goto LABEL_9;
      v8 = CFSTR("kMDItemPhotosFavorited");
    }
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", v8, MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
LABEL_9:

}

- (void)_updateAttributedQuery:(id)a3 withAttributedParses:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v21 = v5;
  objc_msgSend(v5, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("InRange\\(kMDItemContentCreationDate,\\$time\\.iso\\(([0-9-]+T[0-9:]+)\\),\\$time\\.iso\\(([0-9-]+T[0-9:]+)\\)\\)"), 0, 0);
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("kMDItemPhotosPeoplePersonIdentifiers=\\\"([A-Z0-9-]+)\\\"), 0, 0);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v15, "string", v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v7, "isEqualToString:", v16);

        if (v17)
        {
          objc_msgSend(v15, "string");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "length");
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __65__CSAttributedQuery__updateAttributedQuery_withAttributedParses___block_invoke;
          v22[3] = &unk_1E2401118;
          v23 = v21;
          v24 = v20;
          v25 = v8;
          v26 = v9;
          objc_msgSend(v15, "enumerateAttributesInRange:options:usingBlock:", 0, v19, 0, v22);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v12);
  }

}

void __65__CSAttributedQuery__updateAttributedQuery_withAttributedParses___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSUInteger v29;
  uint64_t v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSUInteger v41;
  NSUInteger v42;
  NSUInteger v43;
  uint64_t v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSRange v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  _QWORD v69[2];
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[3];
  NSRange v74;
  NSRange v75;

  v73[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kQPKind"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    v10 = *(void **)(a1 + 32);
    v73[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAttribute:value:range:", CFSTR("kMDItemPhotosMediaTypes"), v11, a3, a4);

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kQPPerson"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    v14 = *(void **)(a1 + 32);
    v72 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAttribute:value:range:", CFSTR("kMDItemPhotosPeopleNames"), v15, a3, a4);

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kQPGroundedPerson"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
  {
    v18 = *(void **)(a1 + 32);
    v71 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAttribute:value:range:", CFSTR("kMDItemPhotosPeopleNames"), v19, a3, a4);

  }
  v57 = v17;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kQPLocation"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
  {
    v22 = *(void **)(a1 + 32);
    v70 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAttribute:value:range:", CFSTR("kMDItemPhotosLocationKeywords"), v23, a3, a4);

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kQPDescription"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    objc_msgSend(*(id *)(a1 + 40), "firstMatchInString:options:range:", v24, 0, 0, objc_msgSend(v24, "length"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v54 = v13;
    v55 = v9;
    v56 = v26;
    if (v26)
    {
      v53 = a4;
      v28 = objc_msgSend(v26, "rangeAtIndex:", 1);
      v49.length = v29;
      objc_msgSend(v25, "substringWithRange:", v28, v29);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "dateFromString:");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v27, "rangeAtIndex:", 2);
      v33 = v32;
      objc_msgSend(v25, "substringWithRange:", v31, v32);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "dateFromString:");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v34;
      if (v30 && v34)
      {
        v36 = *(void **)(a1 + 32);
        v69[0] = v30;
        v69[1] = v34;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
        v37 = (void *)v30;
        v38 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addAttribute:value:range:", CFSTR("kMDItemContentCreationDate"), v38, a3, v53);
      }
      else
      {
        v49.location = v28;
        v37 = (void *)v30;
        logForCSLogCategoryDefault();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          NSStringFromRange(v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v74.location = v31;
          v74.length = v33;
          NSStringFromRange(v74);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v60 = v37;
          v61 = 2112;
          v62 = v35;
          v63 = 2112;
          v64 = v25;
          v65 = 2112;
          v66 = v50;
          v67 = 2112;
          v68 = v48;
          _os_log_error_impl(&dword_18C42F000, v38, OS_LOG_TYPE_ERROR, "startDate: %@, endDate: %@ from description: %@ startDateRange: %@, endDateRange: %@", buf, 0x34u);

        }
      }
      v13 = v54;
      v9 = v55;

      v27 = v56;
      a4 = v53;
    }
    objc_msgSend(*(id *)(a1 + 56), "firstMatchInString:options:range:", v25, 0, 0, objc_msgSend(v25, "length", v49.location));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
    {
      v41 = objc_msgSend(v39, "rangeAtIndex:", 1);
      v43 = v42;
      objc_msgSend(v25, "substringWithRange:", v41, v42);
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = (void *)v44;
      if (v44)
      {
        v46 = *(void **)(a1 + 32);
        v58 = v44;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
        v47 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addAttribute:value:range:", CFSTR("kMDItemPhotosPeoplePersonIdentifiers"), v47, a3, a4);
      }
      else
      {
        logForCSLogCategoryDefault();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v75.location = v41;
          v75.length = v43;
          __65__CSAttributedQuery__updateAttributedQuery_withAttributedParses___block_invoke_cold_1((uint64_t)v25, v75, v47);
        }
      }
      v13 = v54;
      v9 = v55;

      v27 = v56;
    }

  }
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_query, CFSTR("query"));
}

- (CSAttributedQuery)initWithCoder:(id)a3
{
  id v4;
  CSAttributedQuery *v5;
  uint64_t v6;
  NSAttributedString *query;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSAttributedQuery;
  v5 = -[CSAttributedQuery init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("query"));
    v6 = objc_claimAutoreleasedReturnValue();
    query = v5->_query;
    v5->_query = (NSAttributedString *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CSAttributedQuery *v4;
  void *v5;
  void *v6;
  CSAttributedQuery *v7;

  v4 = [CSAttributedQuery alloc];
  -[CSAttributedQuery query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAttributedQuery queryEmbedding](self, "queryEmbedding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CSAttributedQuery initWithAttributedQuery:embedding:](v4, "initWithAttributedQuery:embedding:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSAttributedString)query
{
  return self->_query;
}

- (_CSEmbedding)queryEmbedding
{
  return self->_queryEmbedding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryEmbedding, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

void __65__CSAttributedQuery__updateAttributedQuery_withAttributedParses___block_invoke_cold_1(uint64_t a1, NSRange range, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromRange(range);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_18C42F000, a3, OS_LOG_TYPE_ERROR, "personIdString: nil from description: %@, personIdRange: %@", (uint8_t *)&v6, 0x16u);

}

@end
