@implementation PHLibraryScopeRule

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_proxyObject;
}

- (PHLibraryScopeRule)initWithProxyObject:(id)a3
{
  id v5;
  PHLibraryScopeRule *v6;
  PHLibraryScopeRule *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHLibraryScopeRule;
  v6 = -[PHLibraryScopeRule init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_proxyObject, a3);

  return v7;
}

- (PHLibraryScopeRule)initWithQuery:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  PHLibraryScopeRule *v7;

  v4 = (objc_class *)MEMORY[0x1E0D71828];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithQuery:", v5);

  v7 = -[PHLibraryScopeRule initWithProxyObject:](self, "initWithProxyObject:", v6);
  return v7;
}

- (PHLibraryScopeRule)init
{
  id v3;
  PHLibraryScopeRule *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D71828]);
  v4 = -[PHLibraryScopeRule initWithProxyObject:](self, "initWithProxyObject:", v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)-[PLLibraryScopeRule copyWithZone:](self->_proxyObject, "copyWithZone:", a3);
  v7 = (void *)objc_msgSend(v5, "initWithProxyObject:", v6);

  return v7;
}

- (void)addCondition:(id)a3
{
  PLLibraryScopeRule *proxyObject;
  id v4;

  proxyObject = self->_proxyObject;
  objc_msgSend(a3, "proxyObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PLLibraryScopeRule addCondition:](proxyObject, "addCondition:", v4);

}

- (void)removeConditionOfType:(Class)a3
{
  uint64_t v5;

  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3)
    v5 = objc_opt_class();
  else
    v5 = 0;
  -[PLLibraryScopeRule removeConditionOfType:](self->_proxyObject, "removeConditionOfType:", v5);
}

- (PLLibraryScopeRule)plRepresentation
{
  return self->_proxyObject;
}

- (id)dateRangeCondition
{
  void *v3;
  PHLibraryScopeConditionDateRange *v4;
  void *v5;
  PHLibraryScopeConditionDateRange *v6;

  -[PLLibraryScopeRule dateRangeCondition](self->_proxyObject, "dateRangeCondition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [PHLibraryScopeConditionDateRange alloc];
    -[PLLibraryScopeRule dateRangeCondition](self->_proxyObject, "dateRangeCondition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PHLibraryScopeCondition initWithProxyObject:](v4, "initWithProxyObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)personCondition
{
  void *v3;
  PHLibraryScopeConditionPerson *v4;
  void *v5;
  PHLibraryScopeConditionPerson *v6;

  -[PLLibraryScopeRule personCondition](self->_proxyObject, "personCondition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [PHLibraryScopeConditionPerson alloc];
    -[PLLibraryScopeRule personCondition](self->_proxyObject, "personCondition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PHLibraryScopeCondition initWithProxyObject:](v4, "initWithProxyObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)unknownConditions
{
  void *v3;
  void *v4;
  void *v5;

  -[PLLibraryScopeRule unknownConditions](self->_proxyObject, "unknownConditions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLLibraryScopeRule unknownConditions](self->_proxyObject, "unknownConditions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_pl_map:", &__block_literal_global_27060);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)description
{
  return (id)-[PLLibraryScopeRule description](self->_proxyObject, "description");
}

- (PLLibraryScopeRule)proxyObject
{
  return self->_proxyObject;
}

- (void)setProxyObject:(id)a3
{
  objc_storeStrong((id *)&self->_proxyObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyObject, 0);
}

PHLibraryScopeConditionUnknown *__39__PHLibraryScopeRule_unknownConditions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PHLibraryScopeConditionUnknown *v3;

  v2 = a2;
  v3 = -[PHLibraryScopeCondition initWithProxyObject:]([PHLibraryScopeConditionUnknown alloc], "initWithProxyObject:", v2);

  return v3;
}

+ (id)dataFromRules:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "_pl_map:", &__block_literal_global_25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71828], "dataForLibraryScopeRules:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)fetchLibraryScopeRulesForLibraryScope:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "rulesData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71828], "libraryScopeRulesForLibraryScopeRulesData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pl_map:", &__block_literal_global_27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)suggestedStartDateForRules:(id)a3 autoSharePolicy:(signed __int16)a4 options:(id)a5 error:(id *)a6
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "_estimatedAssetsForRules:autoSharePolicy:options:error:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "creationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (unint64_t)estimatedAssetCountForRules:(id)a3 autoSharePolicy:(signed __int16)a4 imageCount:(unint64_t *)a5 videoCount:(unint64_t *)a6 audioCount:(unint64_t *)a7 itemCount:(unint64_t *)a8 options:(id)a9 error:(id *)a10
{
  void *v14;
  void *v15;
  unint64_t v16;

  objc_msgSend(a1, "_estimatedAssetsForRules:autoSharePolicy:options:error:", a3, a4, a9, a10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (a5)
    *a5 = objc_msgSend(v14, "countOfAssetsWithMediaType:", 1);
  if (a6)
    *a6 = objc_msgSend(v15, "countOfAssetsWithMediaType:", 2);
  if (a7)
    *a7 = objc_msgSend(v15, "countOfAssetsWithMediaType:", 3);
  if (a8)
    *a8 = objc_msgSend(v15, "countOfAssetsWithMediaType:", 0);
  v16 = objc_msgSend(v15, "count");

  return v16;
}

+ (id)_estimatedAssetsForRules:(id)a3 autoSharePolicy:(signed __int16)a4 options:(id)a5 error:(id *)a6
{
  int v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  PHUserFeedbackCalculator *v18;
  void *v19;
  PHUserFeedbackCalculator *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id *v44;
  PHUserFeedbackCalculator *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *v50;
  uint64_t v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;
  _QWORD v55[3];

  v8 = a4;
  v55[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (v8 != 1)
  {
    objc_msgSend(v9, "_pl_map:", &__block_literal_global_30_27082);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D71828], "queryForLibraryScopeRules:", v11);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v54 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("estimatedAssetCountForRules: query is nil"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (a6)
        *a6 = objc_retainAutorelease(v41);

      goto LABEL_20;
    }
    v17 = (void *)v16;
    v18 = [PHUserFeedbackCalculator alloc];
    objc_msgSend(v10, "photoLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PHUserFeedbackCalculator initWithPhotoLibrary:](v18, "initWithPhotoLibrary:", v19);

    v45 = v20;
    -[PHUserFeedbackCalculator personUUIDsWithNegativeFeedback](v20, "personUUIDsWithNegativeFeedback");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
      v44 = a6;
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D732A8]), "initWithConjunction:", 0);
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v23 = v21;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v47;
        do
        {
          v27 = 0;
          do
          {
            if (*(_QWORD *)v47 != v26)
              objc_enumerationMutation(v23);
            objc_msgSend(v22, "addPersonUUIDQuery:comparator:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v27++), 22, v44);
          }
          while (v25 != v27);
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
        }
        while (v25);
      }

      v28 = (void *)MEMORY[0x1E0D732A8];
      objc_msgSend(v22, "query");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "notQuery:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D732A8], "andCombineFirstQuery:secondQuery:", v17, v30);
      v31 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v31;
      a6 = v44;
    }
    v32 = (void *)MEMORY[0x1E0D71A38];
    objc_msgSend(v10, "photoLibrary", v44);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "photoLibrary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_opt_new();
    objc_msgSend(v32, "predicateForQuery:inLibrary:changeDetectionCriteria:", v17, v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v36;
    if (v36)
      goto LABEL_3;
LABEL_15:
    v37 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("estimatedAssetCountForRules: generated predate is nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v12);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (a6)
      *a6 = objc_retainAutorelease(v38);
LABEL_20:

    v15 = 0;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_15;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0D71808], "compoundPredicateForMarkingOnboardingPreviewAssetsWithRulePredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShouldPrefetchCount:", 1);
  objc_msgSend(v10, "setInternalPredicate:", v12);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSortDescriptors:", v14);

  +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v15;
}

+ (BOOL)generateDefaultRulesForLibraryScope:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoAnalysisClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "localIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(v10, "requestGenerateDefaultRulesForLibraryScopeWithLocalIdentifier:withOptions:error:", v11, v7, a5);
  return (char)a5;
}

uint64_t __77__PHLibraryScopeRule__estimatedAssetsForRules_autoSharePolicy_options_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "plRepresentation");
}

PHLibraryScopeRule *__68__PHLibraryScopeRule_fetchLibraryScopeRulesForLibraryScope_options___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PHLibraryScopeRule *v3;

  v2 = a2;
  v3 = -[PHLibraryScopeRule initWithProxyObject:]([PHLibraryScopeRule alloc], "initWithProxyObject:", v2);

  return v3;
}

uint64_t __36__PHLibraryScopeRule_dataFromRules___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "plRepresentation");
}

@end
