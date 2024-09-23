@implementation ATXAction

- (BOOL)isEqualToAction:(id)a3
{
  id *v4;
  NSString *bundleId;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  unint64_t actionType;
  unint64_t *p_actionType;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  NSString *heuristic;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  char v34;
  NSString *title;
  NSString *v36;
  NSString *v37;
  NSString *v38;
  char v39;
  NSString *subtitle;
  NSString *v41;
  NSString *v42;
  NSString *v43;
  char v44;
  BOOL v45;

  v4 = (id *)a3;
  bundleId = self->_bundleId;
  v6 = (NSString *)v4[10];
  if (bundleId == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = bundleId;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_28;
  }
  p_actionType = &self->_actionType;
  actionType = self->_actionType;
  if ((id)actionType == v4[11])
  {
    if (actionType <= 6)
    {
      if (((1 << actionType) & 0x58) != 0)
      {
        __atxlog_handle_default();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[ATXAction isEqualToAction:].cold.1((uint64_t)p_actionType, v22, v23, v24, v25, v26, v27, v28);

        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Encountered invalid ATXActionType value: %tu"), *p_actionType);
        goto LABEL_28;
      }
      if (((1 << actionType) & 5) != 0)
      {
        -[ATXAction intent](self, "intent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_className");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "intent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_className");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "isEqual:", v15);

        if (!v16)
          goto LABEL_28;
        -[ATXAction intent](self, "intent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "atx_nonNilParametersByName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "intent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "atx_nonNilParametersByName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v18, "atx_isFuzzyMatch:", v20);

        if ((v21 & 1) == 0)
          goto LABEL_28;
      }
      else
      {
        v29 = -[ATXAction userActivityHash](self, "userActivityHash");
        if (v29 != objc_msgSend(v4, "userActivityHash"))
          goto LABEL_28;
      }
    }
    heuristic = self->_heuristic;
    v31 = (NSString *)v4[14];
    if (heuristic == v31)
    {

    }
    else
    {
      v32 = v31;
      v33 = heuristic;
      v34 = -[NSString isEqual:](v33, "isEqual:", v32);

      if ((v34 & 1) == 0)
        goto LABEL_28;
    }
    if (self->_isFutureMedia == *((unsigned __int8 *)v4 + 73))
    {
      if (-[ATXAction isHeuristic](self, "isHeuristic"))
      {
        title = self->_title;
        v36 = (NSString *)v4[4];
        if (title == v36)
        {

        }
        else
        {
          v37 = v36;
          v38 = title;
          v39 = -[NSString isEqual:](v38, "isEqual:", v37);

          if ((v39 & 1) == 0)
            goto LABEL_28;
        }
        subtitle = self->_subtitle;
        v41 = (NSString *)v4[5];
        if (subtitle == v41)
        {

        }
        else
        {
          v42 = v41;
          v43 = subtitle;
          v44 = -[NSString isEqual:](v43, "isEqual:", v42);

          if ((v44 & 1) == 0)
            goto LABEL_28;
        }
      }
      v45 = 1;
      goto LABEL_29;
    }
  }
LABEL_28:
  v45 = 0;
LABEL_29:

  return v45;
}

- (ATXAction)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  ATXAction *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  ATXActionCriteria *v49;
  ATXAVRouteInfo *v50;
  void *v51;
  void *v52;
  void *v53;
  ATXAction *v54;
  uint64_t v56;
  ATXAVRouteInfo *v57;
  ATXActionCriteria *v58;
  char v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  ATXLazyIntent *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  id v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSObject intent](v5, "intent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v7 = -[ATXLazyIntent initWithIntentData:]([ATXLazyIntent alloc], "initWithIntentData:", v6);
      else
        v7 = 0;
      -[NSObject userActivityProxy](v5, "userActivityProxy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10)
      {
        v11 = (void *)MEMORY[0x1A85A4F90]();
        v12 = (void *)MEMORY[0x1E0CB3710];
        v13 = objc_opt_class();
        -[NSObject userActivityProxy](v5, "userActivityProxy");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = 0;
        objc_msgSend(v12, "unarchivedObjectOfClass:fromData:error:", v13, v14, &v79);
        v10 = objc_claimAutoreleasedReturnValue();
        v15 = v79;

        objc_autoreleasePoolPop(v11);
        if (v15)
        {
          __atxlog_handle_default();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            -[ATXAction initWithProto:].cold.2();

        }
      }
      if (!(v10 | v7))
      {
        -[NSObject activityString](v5, "activityString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
          goto LABEL_27;
      }
      -[NSObject bundleId](v5, "bundleId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18
        && (-[NSObject uuid](v5, "uuid"), v19 = (void *)objc_claimAutoreleasedReturnValue(), v19, v19))
      {
        v20 = objc_alloc(MEMORY[0x1E0CB3A28]);
        -[NSObject uuid](v5, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v20, "initWithUUIDString:", v21);

        if (v22)
        {
          v72 = v22;
          -[NSObject contentAttributeSet](v5, "contentAttributeSet");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "length");

          v73 = (ATXLazyIntent *)v7;
          if (v24)
          {
            v25 = (void *)MEMORY[0x1A85A4F90]();
            v26 = (void *)MEMORY[0x1E0CB3710];
            v27 = objc_opt_class();
            -[NSObject contentAttributeSet](v5, "contentAttributeSet");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = 0;
            objc_msgSend(v26, "unarchivedObjectOfClass:fromData:error:", v27, v28, &v78);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v78;

            objc_autoreleasePoolPop(v25);
            if (v29)
            {
              __atxlog_handle_default();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
                -[ATXAction initWithProto:].cold.1();

            }
          }
          else
          {
            v71 = 0;
          }
          -[NSObject heuristicMetadatas](v5, "heuristicMetadatas");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "count");

          v67 = v10;
          v68 = v6;
          if (v32)
          {
            v33 = objc_alloc(MEMORY[0x1E0C99E08]);
            -[NSObject heuristicMetadatas](v5, "heuristicMetadatas");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)objc_msgSend(v33, "initWithCapacity:", objc_msgSend(v34, "count"));

            v76 = 0u;
            v77 = 0u;
            v74 = 0u;
            v75 = 0u;
            -[NSObject heuristicMetadatas](v5, "heuristicMetadatas");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
            if (v37)
            {
              v38 = v37;
              v39 = *(_QWORD *)v75;
              do
              {
                for (i = 0; i != v38; ++i)
                {
                  if (*(_QWORD *)v75 != v39)
                    objc_enumerationMutation(v36);
                  v41 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
                  objc_msgSend(v41, "key");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v42)
                  {
                    objc_msgSend(v41, "value");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "key");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "setObject:forKeyedSubscript:", v43, v44);

                  }
                }
                v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
              }
              while (v38);
            }

          }
          else
          {
            v35 = 0;
          }
          -[NSObject predictableParameterCombinations](v5, "predictableParameterCombinations");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "count");

          if (v46)
          {
            -[NSObject predictableParameterCombinations](v5, "predictableParameterCombinations");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "_pas_mappedArrayWithTransform:", &__block_literal_global_14);
            v48 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v48 = 0;
          }
          v66 = (void *)v48;
          if (-[NSObject hasCachedHash](v5, "hasCachedHash"))
            v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", -[NSObject cachedHash](v5, "cachedHash"));
          else
            v70 = 0;
          -[NSObject activityString](v5, "activityString");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject itemIdentifier](v5, "itemIdentifier");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject bundleId](v5, "bundleId");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = -[NSObject actionType](v5, "actionType");
          -[NSObject heuristic](v5, "heuristic");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = [ATXActionCriteria alloc];
          -[NSObject criteria](v5, "criteria");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = -[ATXActionCriteria initWithProto:](v49, "initWithProto:", v64);
          v59 = -[NSObject isFutureMedia](v5, "isFutureMedia");
          v50 = [ATXAVRouteInfo alloc];
          -[NSObject routeInfo](v5, "routeInfo");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = -[ATXAVRouteInfo initWithProto:](v50, "initWithProto:", v61);
          -[NSObject title](v5, "title");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject subtitle](v5, "subtitle");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject languageCode](v5, "languageCode");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v56) = v59;
          v10 = v67;
          v54 = -[ATXAction initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:](self, "initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:", v67, 0, v65, v63, v71, v73, v72, v69, v62, v60, v35, v58, v56, v57, v51, v52,
                  v53,
                  v70);

          if (v54)
          {
            -[ATXAction _setUserActivityHash:](v54, "_setUserActivityHash:", -[NSObject userActivityHash](v5, "userActivityHash"));
            objc_storeStrong((id *)&v54->_predictableParameterCombinations, v66);
          }
          self = v54;

          v8 = self;
          v6 = v68;
          v22 = v72;
          v7 = (unint64_t)v73;
        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
LABEL_27:
        v8 = 0;
      }

    }
    else
    {
      __atxlog_handle_default();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXAction initWithProto:].cold.3((uint64_t)self, v5);
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (ATXAction)initWithActivityProxy:(id)a3 activity:(id)a4 activityString:(id)a5 itemIdentifier:(id)a6 contentAttributeSet:(id)a7 intent:(id)a8 actionUUID:(id)a9 bundleId:(id)a10 type:(unint64_t)a11 heuristic:(id)a12 heuristicMetadata:(id)a13 criteria:(id)a14 isFutureMedia:(BOOL)a15 routeInfo:(id)a16 title:(id)a17 subtitle:(id)a18 languageCode:(id)a19 cachedHash:(id)a20
{
  unint64_t v24;
  unint64_t v25;
  id v26;
  id v27;
  id v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  ATXAction *v32;
  void *v33;
  ATXAction *v34;
  ATXAction *v35;
  CSSearchableItemAttributeSet *v36;
  CSSearchableItemAttributeSet *contentAttributeSet;
  NSString *v38;
  void *languageCode;
  uint64_t v40;
  NSString *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  id v66;
  id v67;
  objc_super v68;

  v53 = a3;
  v49 = a4;
  v63 = a4;
  v50 = a5;
  v24 = (unint64_t)a5;
  v51 = a6;
  v67 = a6;
  v66 = a7;
  v52 = a8;
  v25 = (unint64_t)a8;
  v61 = a9;
  v26 = a10;
  v59 = a12;
  v58 = a13;
  v57 = a14;
  v56 = a16;
  v55 = a17;
  v54 = a18;
  v27 = a19;
  v28 = a20;
  v60 = v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXAction.m"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

  }
  v29 = (v24 | v25) != 0;
  v30 = (void *)v24;
  v62 = (void *)v25;
  if (!v53 && !(v24 | v25))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = self;
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXAction.m"), 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("intent || activityString || userActivityProxy"));
    v31 = v67;
LABEL_24:

    goto LABEL_10;
  }
  v31 = v67;
  v32 = self;
  if (v53)
  {
    if (!v29)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXAction.m"), 275, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!intent && !activityString"));
    goto LABEL_24;
  }
  if (v30 && v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXAction.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!(intent && activityString)"));
    goto LABEL_24;
  }
LABEL_10:
  if (a11 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, v32, CFSTR("ATXAction.m"), 279, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionType < ATXActionTypeMax"));

  }
  v68.receiver = v32;
  v68.super_class = (Class)ATXAction;
  v34 = -[ATXAction init](&v68, sel_init);
  v35 = v34;
  if (v34)
  {
    objc_storeStrong((id *)&v34->_userActivityProxy, a3);
    objc_storeStrong((id *)&v35->_userActivity, v49);
    objc_storeStrong((id *)&v35->_userActivityString, v50);
    objc_storeStrong((id *)&v35->_itemIdentifier, v51);
    if (v66)
      v36 = (CSSearchableItemAttributeSet *)v66;
    else
      v36 = (CSSearchableItemAttributeSet *)objc_opt_new();
    contentAttributeSet = v35->_contentAttributeSet;
    v35->_contentAttributeSet = v36;

    objc_storeStrong((id *)&v35->_lazyIntent, v52);
    objc_storeStrong((id *)&v35->_actionUUID, a9);
    objc_storeStrong((id *)&v35->_bundleId, a10);
    v35->_actionType = a11;
    objc_storeStrong((id *)&v35->_heuristic, a12);
    objc_storeStrong((id *)&v35->_heuristicMetadata, a13);
    objc_storeStrong((id *)&v35->_criteria, a14);
    v35->_isFutureMedia = a15;
    objc_storeStrong((id *)&v35->_routeInfo, a16);
    objc_storeStrong((id *)&v35->_title, a17);
    objc_storeStrong((id *)&v35->_subtitle, a18);
    if (v27)
    {
      v38 = (NSString *)v27;
      languageCode = v35->_languageCode;
      v35->_languageCode = v38;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      languageCode = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(languageCode, "localeIdentifier");
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = v35->_languageCode;
      v35->_languageCode = (NSString *)v40;

    }
    v35->_isTVWhiteListedLongFormMediaDoNotUseDirectly = 0;
    objc_storeStrong((id *)&v35->_cachedHash, a20);
    -[ATXLazyIntent setDelegate:](v35->_lazyIntent, "setDelegate:", v35);
    objc_msgSend(MEMORY[0x1E0CF94C8], "sharedInstance");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "registerObserver:", v35);

    v31 = v67;
    if (-[ATXLazyIntent isDeserialized](v35->_lazyIntent, "isDeserialized"))
    {
      -[ATXLazyIntent intent](v35->_lazyIntent, "intent");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXAction setLaunchIdForIntent:](v35, "setLaunchIdForIntent:", v43);

    }
  }

  return v35;
}

- (void)_setUserActivityHash:(unint64_t)a3
{
  self->_userActivityHash = a3;
}

- (BOOL)isEqual:(id)a3
{
  ATXAction *v4;
  ATXAction *v5;
  BOOL v6;

  v4 = (ATXAction *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXAction isEqualToAction:](self, "isEqualToAction:", v5);

  return v6;
}

- (unint64_t)hash
{
  ATXAction *v2;
  NSNumber *cachedHash;
  unint64_t v4;
  uint64_t v5;
  NSNumber *v6;

  v2 = self;
  objc_sync_enter(v2);
  cachedHash = v2->_cachedHash;
  if (cachedHash)
  {
    v4 = -[NSNumber unsignedIntegerValue](cachedHash, "unsignedIntegerValue");
  }
  else
  {
    v4 = -[ATXAction _hash](v2, "_hash");
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v4);
    v6 = v2->_cachedHash;
    v2->_cachedHash = (NSNumber *)v5;

  }
  objc_sync_exit(v2);

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CF94C8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ATXAction;
  -[ATXAction dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedHash, 0);
  objc_storeStrong((id *)&self->_routeInfo, 0);
  objc_storeStrong((id *)&self->_contentAttributeSet, 0);
  objc_storeStrong((id *)&self->_userActivityString, 0);
  objc_storeStrong((id *)&self->_predictableParameterCombinations, 0);
  objc_storeStrong((id *)&self->_heuristicMetadata, 0);
  objc_storeStrong((id *)&self->_heuristic, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_actionUUID, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_lazyIntent, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_userActivityProxy, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
}

- (ATXAction)initWithIntent:(id)a3 actionUUID:(id)a4 bundleId:(id)a5 heuristic:(id)a6 heuristicMetadata:(id)a7 criteria:(id)a8 isFutureMedia:(BOOL)a9 title:(id)a10 subtitle:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  ATXLazyIntent *v25;
  _BOOL4 v26;
  ATXAction *v27;
  uint64_t v29;

  v17 = a11;
  v18 = a10;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = -[ATXLazyIntent initWithIntent:]([ATXLazyIntent alloc], "initWithIntent:", v24);
  v26 = objc_msgSend(v24, "_type") == 2;

  LOBYTE(v29) = a9;
  v27 = -[ATXAction initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:](self, "initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:", 0, 0, 0, 0, 0, v25, v23, v22, 2 * v26, v21, v20, v19, v29, 0, v18, v17,
          0,
          0);

  return v27;
}

- (ATXAction)initWithNSUserActivity:(id)a3 actionUUID:(id)a4 bundleId:(id)a5 contentAttributeSet:(id)a6 itemIdentifier:(id)a7 heuristic:(id)a8 heuristicMetadata:(id)a9 criteria:(id)a10 isFutureMedia:(BOOL)a11 title:(id)a12 subtitle:(id)a13
{
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  dispatch_semaphore_t v23;
  NSObject *v24;
  ATXAction *v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  ATXAction *v29;
  uint64_t v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  NSObject *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t buf[16];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v33 = a4;
  v34 = a5;
  v19 = a6;
  v35 = a7;
  v36 = a8;
  v37 = a9;
  v20 = a10;
  v21 = a12;
  v22 = a13;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__1;
  v45 = __Block_byref_object_dispose__1;
  v46 = 0;
  v23 = dispatch_semaphore_create(0);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __157__ATXAction_initWithNSUserActivity_actionUUID_bundleId_contentAttributeSet_itemIdentifier_heuristic_heuristicMetadata_criteria_isFutureMedia_title_subtitle___block_invoke;
  v38[3] = &unk_1E4D58258;
  v40 = &v41;
  v24 = v23;
  v39 = v24;
  objc_msgSend(v18, "_createUserActivityStringsWithOptions:completionHandler:", 0, v38);
  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v24, 1.0) == 1)
  {
    __atxlog_handle_default();
    v25 = self;
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXAction initWithNSUserActivity:actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:].cold.1(v28, buf, v26);
    }
    v29 = 0;
LABEL_5:

    goto LABEL_10;
  }
  v29 = (ATXAction *)v42[5];
  v25 = self;
  if (v29)
  {
    v26 = v19;
    if (!v19)
    {
      objc_msgSend(v18, "contentAttributeSet");
      v26 = objc_claimAutoreleasedReturnValue();
      v25 = self;
    }
    LOBYTE(v31) = a11;
    v25 = objc_retain(-[ATXAction initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:](v25, "initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:", 0, v18, v29, v35, v26, 0, v33, v34, 1, v36, v37, v20, v31, 0, v21,
              v22,
              0,
              0));
    v29 = v25;
    if (!v19)
      goto LABEL_5;
  }
LABEL_10:

  _Block_object_dispose(&v41, 8);
  return v29;
}

void __157__ATXAction_initWithNSUserActivity_actionUUID_bundleId_contentAttributeSet_itemIdentifier_heuristic_heuristicMetadata_criteria_isFutureMedia_title_subtitle___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8;

  v8 = a2;
  if (!a5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)initFromBestAppSuggestion:(id)a3 activity:(id)a4 actionUUID:(id)a5 bundleId:(id)a6 contentAttributeSet:(id)a7 itemIdentifier:(id)a8 heuristic:(id)a9 heuristicMetadata:(id)a10 criteria:(id)a11 isFutureMedia:(BOOL)a12 title:(id)a13 subtitle:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  dispatch_semaphore_t v25;
  NSObject *v26;
  int v27;
  void *v28;
  void *v29;
  ATXAction *v30;
  ATXAction *v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  NSObject *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v38 = a3;
  v19 = a4;
  v37 = a5;
  v41 = a6;
  v20 = a7;
  v40 = a8;
  v39 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a13;
  v24 = a14;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__1;
  v49 = __Block_byref_object_dispose__1;
  v50 = 0;
  if (v19)
  {
    v25 = dispatch_semaphore_create(0);
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __169__ATXAction_initFromBestAppSuggestion_activity_actionUUID_bundleId_contentAttributeSet_itemIdentifier_heuristic_heuristicMetadata_criteria_isFutureMedia_title_subtitle___block_invoke;
    v42[3] = &unk_1E4D58258;
    v44 = &v45;
    v26 = v25;
    v43 = v26;
    objc_msgSend(v19, "_createUserActivityStringsWithOptions:completionHandler:", 0, v42);
    v27 = objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v26, 1.0);

    v29 = v37;
    v28 = v38;
    if (v27 == 1)
    {
      v30 = 0;
      v31 = self;
      goto LABEL_11;
    }
    v32 = v46[5];
  }
  else
  {
    v32 = 0;
    v29 = v37;
    v28 = v38;
  }
  v33 = v20;
  if (!v20)
  {
    objc_msgSend(v19, "contentAttributeSet");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  LOBYTE(v35) = a12;
  v31 = objc_retain(-[ATXAction initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:](self, "initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:", v28, v19, v32, v40, v33, 0, v29, v41, 5, v39, v21, v22, v35, 0, v23,
            v24,
            0,
            0));
  if (!v20)

  v30 = v31;
LABEL_11:
  _Block_object_dispose(&v45, 8);

  return v30;
}

void __169__ATXAction_initFromBestAppSuggestion_activity_actionUUID_bundleId_contentAttributeSet_itemIdentifier_heuristic_heuristicMetadata_criteria_isFutureMedia_title_subtitle___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (ATXAction)initWithNSUserActivityString:(id)a3 actionUUID:(id)a4 bundleId:(id)a5 itemIdentifier:(id)a6 contentAttributeSet:(id)a7 heuristic:(id)a8 heuristicMetadata:(id)a9 isFutureMedia:(BOOL)a10 title:(id)a11 subtitle:(id)a12
{
  uint64_t v13;

  LOBYTE(v13) = a10;
  return -[ATXAction initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:](self, "initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:", 0, 0, a3, a6, a7, 0, a4, a5, 1, a8, a9, 0, v13, 0, a11, a12,
           0,
           0);
}

- (ATXAction)actionWithRouteInfo:(id)a3
{
  id v4;
  ATXAction *v5;
  ATXAction *v6;
  uint64_t v8;

  if (a3)
  {
    v4 = a3;
    v5 = [ATXAction alloc];
    LOBYTE(v8) = self->_isFutureMedia;
    v6 = -[ATXAction initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:](v5, "initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:", 0, self->_userActivity, self->_userActivityString, self->_itemIdentifier, self->_contentAttributeSet, self->_lazyIntent, self->_actionUUID, self->_bundleId, self->_actionType, self->_heuristic, self->_heuristicMetadata, self->_criteria, v8, v4, self->_title, self->_subtitle,
           self->_languageCode,
           self->_cachedHash);

  }
  else
  {
    v6 = self;
  }
  return v6;
}

- (BOOL)isTVWhiteListedLongFormMedia
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  BOOL isTVWhiteListedLongFormMediaDoNotUseDirectly;

  -[ATXAction intent](self, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[ATXAction _isTVIntent:bundleId:](ATXAction, "_isTVIntent:bundleId:", v3, self->_bundleId))
  {
    v4 = v3;
    objc_msgSend(v4, "proxiedBundleIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "proxiedBundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = +[ATXAVRoutingUtils isTVExperienceAppWithBundleId:](ATXAVRoutingUtils, "isTVExperienceAppWithBundleId:", v7);

      if (v8)
        self->_isTVWhiteListedLongFormMediaDoNotUseDirectly = 1;
    }

  }
  isTVWhiteListedLongFormMediaDoNotUseDirectly = self->_isTVWhiteListedLongFormMediaDoNotUseDirectly;

  return isTVWhiteListedLongFormMediaDoNotUseDirectly;
}

+ (BOOL)_isTVIntent:(id)a3 bundleId:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  v7 = v5
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && +[ATXAVRoutingUtils isTVAppWithBundleId:](ATXAVRoutingUtils, "isTVAppWithBundleId:", v6);

  return v7;
}

- (void)invalidateCachedHash
{
  NSNumber *cachedHash;
  ATXAction *obj;

  obj = self;
  objc_sync_enter(obj);
  cachedHash = obj->_cachedHash;
  obj->_cachedHash = 0;

  objc_sync_exit(obj);
}

- (unint64_t)_hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  NSUInteger v8;
  void *v9;
  void *v10;
  unint64_t actionType;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = -[ATXAction userActivityHash](self, "userActivityHash");
  v4 = self->_actionType - v3 + 32 * v3;
  v5 = -[NSString hash](self->_bundleId, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_heuristic, "hash");
  v7 = self->_isFutureMedia - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  if (-[ATXAction isHeuristic](self, "isHeuristic"))
  {
    v8 = -[NSString hash](self->_title, "hash") - v7 + 32 * v7;
    v7 = -[NSString hash](self->_subtitle, "hash") - v8 + 32 * v8;
  }
  -[ATXAction intent](self, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  actionType = self->_actionType;
  if ((!actionType || actionType == 2) && v9)
  {
    objc_msgSend(v9, "atx_nonNilParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ATXAction hashSlotSetWithNonNilParameters:](self, "hashSlotSetWithNonNilParameters:", v12) - v7 + 32 * v7;
    v37 = v10;
    objc_msgSend(v10, "atx_nonNilParametersByName");
    v39 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingSelector:", sel_compare_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
    v15 = v12;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = v14;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v46;
      v20 = (void *)v38;
      v19 = (void *)v39;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v46 != v18)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          if (!v15 || objc_msgSend(v15, "containsObject:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i)))
          {
            v23 = objc_msgSend(v22, "hash");
            objc_msgSend(v19, "objectForKeyedSubscript:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (v24)
            {
              v26 = v24;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v26 = (id)objc_claimAutoreleasedReturnValue();
            }
            v27 = v26;
            v7 = v23 - v7 + 32 * v7;

            objc_msgSend(v20, "addObject:", v27);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v28 = objc_msgSend(v27, "atx_locationHashWithLevel:", 17);
                v7 = 31 * (31 * v7 + HIDWORD(v28)) + v28;
              }
              else
              {
                objc_msgSend(v27, "location");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "atx_locationHashWithLevel:", 17);
                v7 = 31 * (31 * v7 + HIDWORD(v30)) + v30;

              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v43 = 0u;
                v44 = 0u;
                v41 = 0u;
                v42 = 0u;
                v31 = v27;
                v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
                if (v32)
                {
                  v33 = v32;
                  v34 = *(_QWORD *)v42;
                  do
                  {
                    for (j = 0; j != v33; ++j)
                    {
                      if (*(_QWORD *)v42 != v34)
                        objc_enumerationMutation(v31);
                      v7 = objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "hash") - v7 + 32 * v7;
                    }
                    v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
                  }
                  while (v33);
                }

                v20 = (void *)v38;
                v19 = (void *)v39;
              }
              else
              {
                v7 = objc_msgSend(v27, "hash") - v7 + 32 * v7;
              }
            }

          }
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v17);
    }
    else
    {
      v20 = (void *)v38;
      v19 = (void *)v39;
    }

    v10 = v37;
  }

  return v7;
}

- (unint64_t)paramHash
{
  void *v3;
  ATXSlotResolutionParameters *v4;
  unint64_t v5;

  -[ATXAction slotSet](self, "slotSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXSlotResolutionParameters initWithAction:slots:]([ATXSlotResolutionParameters alloc], "initWithAction:slots:", self, v3);
  v5 = -[ATXSlotResolutionParameters hash](v4, "hash");

  return v5;
}

- (id)slotSet
{
  ATXSlotSet *v3;
  void *v4;
  void *v5;
  ATXSlotSet *v6;

  if ((self->_actionType | 2) == 2)
  {
    v3 = [ATXSlotSet alloc];
    -[ATXAction intent](self, "intent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "atx_nonNilParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ATXSlotSet initWithParameters:](v3, "initWithParameters:", v5);

  }
  else
  {
    v6 = -[ATXSlotSet initWithOpaqueParameters]([ATXSlotSet alloc], "initWithOpaqueParameters");
  }
  return v6;
}

ATXActionPredictableParameters *__27__ATXAction_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXActionPredictableParameters *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ATXActionPredictableParameters *v8;

  v2 = a2;
  v3 = [ATXActionPredictableParameters alloc];
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v2, "parameterKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = (void *)objc_msgSend(v4, "initWithArray:", v6);
  v8 = -[ATXActionPredictableParameters initWithParameterKeys:](v3, "initWithParameterKeys:", v7);

  return v8;
}

- (void)setLaunchIdForIntent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "launchId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v6;
    if (!v5)
    {
      objc_msgSend(v6, "_setLaunchId:", self->_bundleId);
      v4 = v6;
    }
  }

}

- (INIntent)intent
{
  return -[ATXLazyIntent intent](self->_lazyIntent, "intent");
}

- (void)handleMemoryPressure
{
  -[ATXLazyIntent handleMemoryPressure](self->_lazyIntent, "handleMemoryPressure");
}

- (ATXAction)initWithProtoData:(id)a3
{
  id v4;
  ATXPBAction *v5;
  ATXAction *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBAction initWithData:]([ATXPBAction alloc], "initWithData:", v4);

    self = -[ATXAction initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXAction proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  CSSearchableItemAttributeSet *contentAttributeSet;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSDictionary *heuristicMetadata;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;

  v3 = (void *)objc_opt_new();
  -[ATXAction bundleId](self, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleId:", v4);

  objc_msgSend(v3, "setActionType:", -[ATXAction actionType](self, "actionType"));
  -[ATXAction heuristic](self, "heuristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHeuristic:", v5);

  objc_msgSend(v3, "setIsFutureMedia:", -[ATXAction isFutureMedia](self, "isFutureMedia"));
  -[ATXAction _title](self, "_title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v6);

  -[ATXAction _subtitle](self, "_subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSubtitle:", v7);

  objc_msgSend(v3, "setUserActivityHash:", -[ATXAction userActivityHash](self, "userActivityHash"));
  -[ATXAction userActivityString](self, "userActivityString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActivityString:", v8);

  -[ATXAction itemIdentifier](self, "itemIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setItemIdentifier:", v9);

  -[ATXAction actionUUID](self, "actionUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUuid:", v11);

  objc_msgSend(v3, "setLanguageCode:", self->_languageCode);
  -[ATXAVRouteInfo proto](self->_routeInfo, "proto");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRouteInfo:", v12);

  -[ATXActionCriteria proto](self->_criteria, "proto");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCriteria:", v13);

  v14 = objc_msgSend(v3, "setCachedHash:", -[ATXAction hash](self, "hash"));
  if (self->_contentAttributeSet)
  {
    v15 = (void *)MEMORY[0x1A85A4F90](v14);
    contentAttributeSet = self->_contentAttributeSet;
    v45 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", contentAttributeSet, 1, &v45);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v45;
    objc_msgSend(v3, "setContentAttributeSet:", v17);

    objc_autoreleasePoolPop(v15);
    if (v18)
    {
      __atxlog_handle_default();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[ATXAction proto].cold.3();

    }
  }
  if (self->_heuristicMetadata)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSDictionary count](self->_heuristicMetadata, "count"));
    heuristicMetadata = self->_heuristicMetadata;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __18__ATXAction_proto__block_invoke;
    v43[3] = &unk_1E4D582A0;
    v44 = v20;
    v22 = v20;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](heuristicMetadata, "enumerateKeysAndObjectsUsingBlock:", v43);
    objc_msgSend(v3, "setHeuristicMetadatas:", v22);

  }
  -[ATXLazyIntent intentData](self->_lazyIntent, "intentData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[ATXLazyIntent intentData](self->_lazyIntent, "intentData");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIntent:", v24);
LABEL_11:

    goto LABEL_12;
  }
  -[ATXAction intent](self, "intent");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v36 = (void *)MEMORY[0x1A85A4F90]();
    v37 = (void *)MEMORY[0x1E0CB36F8];
    -[ATXAction intent](self, "intent");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend(v37, "archivedDataWithRootObject:requiringSecureCoding:error:", v38, 1, &v42);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v42;
    objc_msgSend(v3, "setIntent:", v39);

    objc_autoreleasePoolPop(v36);
    if (v24)
    {
      __atxlog_handle_default();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
        -[ATXAction proto].cold.2();

    }
    goto LABEL_11;
  }
LABEL_12:
  -[ATXAction userActivityProxy](self, "userActivityProxy");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (void *)MEMORY[0x1A85A4F90]();
    v27 = (void *)MEMORY[0x1E0CB36F8];
    -[ATXAction userActivityProxy](self, "userActivityProxy");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend(v27, "archivedDataWithRootObject:requiringSecureCoding:error:", v28, 1, &v41);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v41;
    objc_msgSend(v3, "setUserActivityProxy:", v29);

    objc_autoreleasePoolPop(v26);
    if (v30)
    {
      __atxlog_handle_default();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        -[ATXAction proto].cold.1();

    }
  }
  if (-[NSArray count](self->_predictableParameterCombinations, "count"))
  {
    -[NSArray _pas_mappedArrayWithTransform:](self->_predictableParameterCombinations, "_pas_mappedArrayWithTransform:", &__block_literal_global_82);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "mutableCopy");
    objc_msgSend(v3, "setPredictableParameterCombinations:", v33);

  }
  return v3;
}

void __18__ATXAction_proto__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  ATXPBHeuristicMetadata *v7;

  v5 = a3;
  v6 = a2;
  v7 = objc_alloc_init(ATXPBHeuristicMetadata);
  -[ATXPBHeuristicMetadata setKey:](v7, "setKey:", v6);

  -[ATXPBHeuristicMetadata setValue:](v7, "setValue:", v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

ATXPBPredictableParameters *__18__ATXAction_proto__block_invoke_80(uint64_t a1, void *a2)
{
  id v2;
  ATXPBPredictableParameters *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = objc_alloc_init(ATXPBPredictableParameters);
  objc_msgSend(v2, "parameterKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[ATXPBPredictableParameters setParameterKeys:](v3, "setParameterKeys:", v5);

  return v3;
}

- (unint64_t)hashSlotSetWithNonNilParameters:(id)a3
{
  id v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v4 += objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "hash", (_QWORD)v12);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  if ((v4 ^ HIDWORD(v4)) <= 1)
    v10 = 1;
  else
    v10 = v4 ^ HIDWORD(v4);

  return v10;
}

- (unint64_t)userActivityHash
{
  ATXAction *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t userActivityHash;

  v2 = self;
  objc_sync_enter(v2);
  if ((v2->_actionType | 4) == 5 && !v2->_userActivityHash)
  {
    -[ATXAction userActivity](v2, "userActivity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "activityType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "webpageURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v2->_userActivityHash = +[ATXAction _userActivityHashForUserInfoDict:activityType:webpageURL:](ATXAction, "_userActivityHashForUserInfoDict:activityType:webpageURL:", v5, v6, v7);

    }
    else
    {
      v2->_userActivityHash = -1;
    }

  }
  userActivityHash = v2->_userActivityHash;
  objc_sync_exit(v2);

  return userActivityHash;
}

- (id)userActivityWebpageURL
{
  void *v2;
  void *v3;

  if ((self->_actionType | 4) == 5)
  {
    -[ATXAction userActivity](self, "userActivity");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "webpageURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (unint64_t)_userActivityHashForUserInfoDict:(id)a3 activityType:(id)a4 webpageURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  id v43;
  id v44;
  unint64_t v45;
  NSObject *v46;
  id v48;
  id v49;
  void *context;
  void *v51;
  id obj;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  __int128 v58;
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
  uint8_t buf[4];
  id v71;
  _QWORD v72[2];
  _BYTE v73[128];
  _BYTE v74[128];
  unsigned __int8 v75[128];
  unsigned __int8 md[16];
  __int128 v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  context = (void *)MEMORY[0x1A85A4F90]();
  *(_OWORD *)md = 0u;
  v77 = 0u;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "addObject:", v8);
  v51 = v9;
  objc_msgSend(v9, "absoluteString");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1E4D5DB30;
  objc_msgSend(v10, "addObject:", v13);

  v14 = (void *)objc_opt_new();
  v55 = (void *)objc_opt_new();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v67 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v21 = v14;
        else
          v21 = v55;
        objc_msgSend(v21, "addObject:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    }
    while (v17);
  }

  objc_msgSend(v14, "sortUsingSelector:", sel_compare_);
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v22 = v14;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v63 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
        objc_msgSend(v10, "addObject:", v27);
        objc_msgSend(v15, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        plistableReplacementFor(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v29);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    }
    while (v24);
  }

  if (objc_msgSend(v55, "count"))
  {
    v48 = v22;
    v49 = v8;
    v53 = (void *)objc_opt_new();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = v55;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
    if (v30)
    {
      v31 = v30;
      v54 = *(_QWORD *)v59;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v59 != v54)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * k);
          v34 = (void *)MEMORY[0x1A85A4F90]();
          objc_msgSend(v15, "objectForKeyedSubscript:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          plistableReplacementFor(v33);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v72[0] = v36;
          plistableReplacementFor(v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v72[1] = v37;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v57 = 0;
          objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v38, 100, 0, &v57);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v57;
          if (v39)
          {
            objc_msgSend(v53, "addObject:", v39);
          }
          else
          {
            __atxlog_handle_default();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v71 = v40;
              _os_log_fault_impl(&dword_1A49EF000, v41, OS_LOG_TYPE_FAULT, "Error serializing: %@", buf, 0xCu);
            }

          }
          objc_autoreleasePoolPop(v34);
        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
      }
      while (v31);
    }

    objc_msgSend(v53, "sortUsingComparator:", &__block_literal_global_439);
    objc_msgSend(v10, "addObject:", v53);

    v22 = v48;
    v8 = v49;
  }
  v56 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 100, 0, &v56, v48, v49);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v56;
  if (v42)
  {
    v44 = objc_retainAutorelease(v42);
    CC_SHA256((const void *)objc_msgSend(v44, "bytes"), objc_msgSend(v44, "length"), md);
    if (*(_QWORD *)md <= 1uLL)
      v45 = 1;
    else
      v45 = *(_QWORD *)md;
  }
  else
  {
    __atxlog_handle_default();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      +[ATXAction _userActivityHashForUserInfoDict:activityType:webpageURL:].cold.1();

    v45 = 1;
  }

  objc_autoreleasePoolPop(context);
  return v45;
}

- (NSString)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("bundleId: %@\n"), self->_bundleId);
  objc_msgSend(v3, "appendFormat:", CFSTR("actionType: %lu\n"), self->_actionType);
  -[NSUUID UUIDString](self->_actionUUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("actionUUID: %@\n"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("heuristic: %@\n"), self->_heuristic);
  objc_msgSend(v3, "appendFormat:", CFSTR("itemIdentifier: %@\n"), self->_itemIdentifier);
  if (self->_isFutureMedia)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("isFutureMedia: %@\n"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("criteria: %@\n"), self->_criteria);
  if (ATXDetailedActionLoggingEnabled())
  {
    -[ATXAction actionTitle](self, "actionTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("actionTitle: %@\n"), v6);

    -[ATXAction actionSubtitle](self, "actionSubtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("actionSubtitle: %@\n"), v7);

    -[ATXAction actionDescription](self, "actionDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("actionDescription: %@\n"), v8);

  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v9;
}

- (BOOL)isHeuristic
{
  return self->_heuristic != 0;
}

- (id)actionDescription
{
  __CFString *v2;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *userActivityString;

  v2 = CFSTR("No Intent or action");
  switch(self->_actionType)
  {
    case 0uLL:
    case 2uLL:
      -[ATXAction intent](self, "intent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "description");
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1uLL:
    case 5uLL:
      -[ATXAction userActivity](self, "userActivity");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "description");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      userActivityString = v6;
      if (!v6)
        userActivityString = self->_userActivityString;
      v2 = userActivityString;

LABEL_6:
      break;
    default:
      return v2;
  }
  return v2;
}

- (BOOL)_shouldUseCachedTitle:(id)a3 cachedLanguageCode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  BOOL v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(a3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "isEqualToString:", v6);
    if (v9)
    {
      __atxlog_handle_default();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v12;
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "%@ - Using cached title because there is a matching cached languageCode: %@.", (uint8_t *)&v15, 0x16u);

      }
    }
    if (self->_heuristic)
      v13 = 1;
    else
      v13 = v9;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)setTitleForSerializationToCache
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSString *languageCode;
  NSString *v7;
  NSString *title;
  int v9;
  void *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    languageCode = self->_languageCode;
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = languageCode;
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "%@ - Setting title for serialization for language code: %@.", (uint8_t *)&v9, 0x16u);

  }
  -[ATXAction actionTitle](self, "actionTitle");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  self->_title = v7;

  -[ATXAction invalidateCachedHash](self, "invalidateCachedHash");
}

- (void)setSubtitleForSerializationToCache
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSString *languageCode;
  NSString *v7;
  NSString *subtitle;
  int v9;
  void *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    languageCode = self->_languageCode;
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = languageCode;
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "%@ - Setting subtitle for serialization for language code: %@.", (uint8_t *)&v9, 0x16u);

  }
  -[ATXAction actionSubtitle](self, "actionSubtitle");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  subtitle = self->_subtitle;
  self->_subtitle = v7;

  -[ATXAction invalidateCachedHash](self, "invalidateCachedHash");
}

- (id)actionTitle
{
  NSString *v3;
  unint64_t actionType;
  void *v5;
  uint64_t v6;

  if (-[ATXAction _shouldUseCachedTitle:cachedLanguageCode:](self, "_shouldUseCachedTitle:cachedLanguageCode:", self->_title, self->_languageCode))
  {
    v3 = self->_title;
  }
  else
  {
    actionType = self->_actionType;
    switch(actionType)
    {
      case 0uLL:
      case 2uLL:
        -[ATXAction intent](self, "intent");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "atx_titleWithEfficientLocalization");
        v6 = objc_claimAutoreleasedReturnValue();
        break;
      case 1uLL:
        -[ATXAction userActivity](self, "userActivity");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "title");
        v6 = objc_claimAutoreleasedReturnValue();
        break;
      case 5uLL:
        -[ATXAction userActivityProxy](self, "userActivityProxy");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "activityTitle");
        v6 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        reportInvalidActionTypeAndCrash(actionType);
    }
    v3 = (NSString *)v6;

  }
  return v3;
}

- (BOOL)hasActionTitle
{
  char v3;
  unint64_t actionType;
  void *v5;
  void *v6;
  void *v7;

  if (-[ATXAction _shouldUseCachedTitle:cachedLanguageCode:](self, "_shouldUseCachedTitle:cachedLanguageCode:", self->_title, self->_languageCode))
  {
    return 1;
  }
  actionType = self->_actionType;
  switch(actionType)
  {
    case 0uLL:
    case 2uLL:
      -[ATXAction intent](self, "intent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "_hasTitle");
      goto LABEL_8;
    case 1uLL:
      -[ATXAction userActivity](self, "userActivity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 5uLL:
      -[ATXAction userActivityProxy](self, "userActivityProxy");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activityTitle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v7 = v6;
      v3 = objc_msgSend(v6, "length") != 0;

LABEL_8:
      break;
    default:
      reportInvalidActionTypeAndCrash(actionType);
  }
  return v3;
}

- (id)actionSubtitle
{
  NSString *v3;
  unint64_t actionType;
  void *v5;
  void *v6;

  if (!-[ATXAction _shouldUseCachedTitle:cachedLanguageCode:](self, "_shouldUseCachedTitle:cachedLanguageCode:", self->_subtitle, self->_languageCode))
  {
    actionType = self->_actionType;
    switch(actionType)
    {
      case 0uLL:
      case 2uLL:
        -[ATXAction intent](self, "intent");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "atx_subtitleWithEfficientLocalization");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        return v6;
      case 1uLL:
      case 5uLL:
        -[CSSearchableItemAttributeSet contentDescription](self->_contentAttributeSet, "contentDescription");
        v3 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      default:
        reportInvalidActionTypeAndCrash(actionType);
    }
  }
  v3 = self->_subtitle;
LABEL_6:
  v6 = v3;
  return v6;
}

+ (id)getActionKeyForBundleId:(id)a3 actionType:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0CB37A0];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "length") + objc_msgSend(v7, "length") + objc_msgSend(CFSTR(":"), "length"));
  objc_msgSend(v8, "appendString:", v7);

  objc_msgSend(v8, "appendString:", CFSTR(":"));
  objc_msgSend(v8, "appendString:", v6);

  return v8;
}

- (id)dateForAction
{
  void *v3;
  void *v4;

  if (self->_userActivityString)
  {
    -[ATXAction actionKey](self, "actionKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      +[ATXAction getDateFromUserActivityString:forActionKey:](ATXAction, "getDateFromUserActivityString:forActionKey:", self->_userActivityString, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)archivedDataForAction
{
  void *v3;
  void *v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  id v9;

  v3 = (void *)MEMORY[0x1A85A4F90](self, a2);
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  objc_autoreleasePoolPop(v3);
  if (v4)
    v6 = 1;
  else
    v6 = v5 == 0;
  if (!v6)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXAction archivedDataForAction].cold.1();

  }
  return v4;
}

+ (id)unarchivedActionFromData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  id v9;
  id v11;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A85A4F90]();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  objc_autoreleasePoolPop(v4);
  if (v5)
    v7 = 1;
  else
    v7 = v6 == 0;
  if (!v7)
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[ATXAction unarchivedActionFromData:].cold.1();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v5;
  else
    v9 = 0;

  return v9;
}

+ (id)getDateFromUserActivityString:(id)a3 forActionKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAction.m"), 1048, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userActivityString"));

    if (v9)
      goto LABEL_3;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAction.m"), 1049, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionKey"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_27;
LABEL_3:
  if (!objc_msgSend(v7, "containsString:", CFSTR("{"))
    || !objc_msgSend(v7, "containsString:", CFSTR("}")))
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("{}"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v11, "count") <= 1)
  {

LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v12, "length") >= 2)
  {
    objc_msgSend(v12, "substringFromIndex:", 1);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }

  if (v12)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.news:NSUA_com.apple.news.articleViewing")))
    {
      objc_msgSend(a1, "_extractValueInKeyValueBlob:withKey:", v12, CFSTR("contentURL"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v26 = 0;
        objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(19|20)\\d\\d[-/\\.](0[1-9]|1[012])[-/\\.](0[1-9]|[12][0-9]|3[01])"), 1, &v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "rangeOfFirstMatchInString:options:range:", v14, 0, 0, objc_msgSend(v14, "length"));
        v18 = 0;
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v14, "substringWithRange:", v16, v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_alloc_init(MEMORY[0x1E0CB3578]);
          objc_msgSend(v20, "setDateFormat:", CFSTR("yyyy-MM-dd"));
          objc_msgSend(v20, "dateFromString:", v19);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_25;
      }
      goto LABEL_24;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilecal:NSUA_com.apple.calendar.continuity.event_selection")))
    {
      v22 = CFSTR("com.apple.calendarUIKit.userActivity.endDate");
      goto LABEL_22;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilecal:NSUA_com.apple.calendar.continuity.date_selection")))
    {
      v22 = CFSTR("com.apple.calendarUIKit.userActivity.date");
LABEL_22:
      objc_msgSend(a1, "_extractValueInKeyValueBlob:withKey:", v12, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v23;
      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v23, "integerValue"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

        goto LABEL_17;
      }
LABEL_24:
      v18 = 0;
      goto LABEL_25;
    }
  }
LABEL_16:
  v18 = 0;
LABEL_17:

  return v18;
}

+ (id)getNSUATypefromActivityType:(id)a3
{
  return (id)objc_msgSend(CFSTR("NSUA_"), "stringByAppendingString:", a3);
}

+ (id)_extractValueInKeyValueBlob:(id)a3 withKey:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(",'"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v11, "containsString:", CFSTR("'=")))
        {
          objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("'="));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count") == 2)
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isEqualToString:", v5);

            if ((v14 & 1) != 0)
            {
              objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "stringByRemovingPercentEncoding");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_14;
            }
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (id)actionKey
{
  NSString *heuristic;
  NSString *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  heuristic = self->_heuristic;
  if (!heuristic)
  {
    if ((-[ATXAction actionType](self, "actionType") == 1 || -[ATXAction actionType](self, "actionType") == 5)
      && (-[ATXAction userActivity](self, "userActivity"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "activityType"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          v6))
    {
      -[ATXAction userActivity](self, "userActivity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activityType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXAction getNSUATypefromActivityType:](ATXAction, "getNSUATypefromActivityType:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (-[ATXAction actionType](self, "actionType") && -[ATXAction actionType](self, "actionType") != 2)
      {
        v3 = 0;
        return v3;
      }
      -[ATXAction intent](self, "intent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_className");
      v9 = objc_claimAutoreleasedReturnValue();
    }

    -[ATXAction bundleId](self, "bundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (v9)
      {
        -[ATXAction bundleId](self, "bundleId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXAction getActionKeyForBundleId:actionType:](ATXAction, "getActionKeyForBundleId:actionType:", v11, v9);
        v3 = (NSString *)objc_claimAutoreleasedReturnValue();

LABEL_19:
        return v3;
      }
      __atxlog_handle_default();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[ATXAction actionKey].cold.2();
    }
    else
    {
      __atxlog_handle_default();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[ATXAction actionKey].cold.1();

    }
    v3 = 0;
    goto LABEL_19;
  }
  v3 = heuristic;
  return v3;
}

- (id)copyWithParameterWhitelist:(id)a3
{
  return -[ATXAction copyWithParameterAllowList:metadataProvider:](self, "copyWithParameterAllowList:metadataProvider:", a3, 0);
}

- (id)copyWithParameterAllowList:(id)a3 metadataProvider:(id)a4
{
  id v6;
  id v7;
  unint64_t actionType;
  ATXAction *v11;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  ATXAction *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  ATXAction *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  uint64_t v52;
  void *v53;
  ATXAction *v54;
  NSObject *v55;
  NSObject *v56;
  uint64_t v57;
  id v58;
  id v59;
  ATXAction *v60;
  void *v61;
  id obj;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[4];
  id v73;
  id v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  actionType = self->_actionType;
  v63 = v6;
  if (actionType == 1 || v6 == 0 || actionType == 5)
  {
    v11 = self;
  }
  else
  {
    -[ATXAction intent](self, "intent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[ATXAction intent](self, "intent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v15, "atx_nonNilParameters");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      objc_msgSend(v18, "minusSet:", v6);
      objc_msgSend(v16, "launchId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        if (!v7)
          v7 = objc_alloc_init(MEMORY[0x1E0D44208]);
        objc_msgSend(v16, "launchId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appIntentIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = 0;
        objc_msgSend(v7, "actionForBundleIdentifier:andActionIdentifier:error:", v20, v21, &v74);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v74;

        if (v22)
        {
          v24 = self;
          objc_msgSend(v18, "allObjects");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v72[0] = MEMORY[0x1E0C809B0];
          v72[1] = 3221225472;
          v72[2] = __57__ATXAction_copyWithParameterAllowList_metadataProvider___block_invoke;
          v72[3] = &unk_1E4D58330;
          v73 = v22;
          objc_msgSend(v25, "_pas_filteredArrayWithTest:", v72);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v26, "count"))
          {
            objc_msgSend(v16, "serializedParameters");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v7;
            v28 = (void *)objc_msgSend(v27, "mutableCopy");

            objc_msgSend(v28, "removeObjectsForKeys:", v26);
            v29 = objc_alloc(MEMORY[0x1E0CBD738]);
            objc_msgSend(v16, "launchId");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "appIntentIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (void *)objc_msgSend(v29, "initWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:", v30, v31, v28);

            v33 = [ATXAction alloc];
            LOBYTE(v57) = v24->_isFutureMedia;
            v11 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v33, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v32, v24->_actionUUID, v24->_bundleId, v24->_heuristic, v24->_heuristicMetadata, 0, v57, v24->_title, v24->_subtitle);

            v7 = v58;
          }
          else
          {
            v11 = v24;
          }

        }
        else
        {
          __atxlog_handle_default();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            -[ATXAction copyWithParameterAllowList:metadataProvider:].cold.2();

          v11 = self;
        }

      }
      else
      {
        __atxlog_handle_default();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
          -[ATXAction copyWithParameterAllowList:metadataProvider:].cold.1();

        v11 = self;
      }

    }
    else
    {
      objc_msgSend(v15, "_emptyCopy");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v60 = self;
      -[ATXAction intent](self, "intent");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "atx_nonNilParameters");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v36, "mutableCopy");

      objc_msgSend(v37, "intersectSet:", v6);
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v38 = v37;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v40; ++i)
          {
            if (*(_QWORD *)v69 != v41)
              objc_enumerationMutation(v38);
            v43 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
            objc_msgSend(v35, "atx_parameterValueForKey:", v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setValue:forKey:", v44, v43);

          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
        }
        while (v40);
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v63, "containsObject:", CFSTR("buckets")) & 1) == 0)
      {
        v59 = v7;
        v61 = (void *)objc_opt_new();
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        -[ATXAction intent](v60, "intent");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "buckets");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v46;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v65;
          v50 = 1;
          do
          {
            for (j = 0; j != v48; ++j)
            {
              if (*(_QWORD *)v65 != v49)
                objc_enumerationMutation(obj);
              v52 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bucket_%i"), v50 + j);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v63, "containsObject:", v53))
                objc_msgSend(v61, "addObject:", v52);

            }
            v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
            v50 = (v50 + j);
          }
          while (v48);
        }

        objc_msgSend(v34, "setValue:forKey:", v61, CFSTR("buckets"));
        v7 = v59;
      }
      v54 = [ATXAction alloc];
      LOBYTE(v57) = v60->_isFutureMedia;
      v11 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v54, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v34, v60->_actionUUID, v60->_bundleId, v60->_heuristic, v60->_heuristicMetadata, 0, v57, 0, 0);

    }
  }

  return v11;
}

uint64_t __57__ATXAction_copyWithParameterAllowList_metadataProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__ATXAction_copyWithParameterAllowList_metadataProvider___block_invoke_2;
  v10[3] = &unk_1E4D58308;
  v11 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pas_filteredArrayWithTest:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "isOptional");
  return v8;
}

uint64_t __57__ATXAction_copyWithParameterAllowList_metadataProvider___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)json
{
  uint64_t v3;
  void *v4;
  NSString *heuristic;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[8];
  _QWORD v20[10];

  v20[8] = *MEMORY[0x1E0C80C00];
  v20[0] = self->_bundleId;
  v19[0] = CFSTR("bundleId");
  v19[1] = CFSTR("description");
  -[ATXAction actionDescription](self, "actionDescription");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v3;
  v20[1] = v3;
  v19[2] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_actionType);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v18;
  v19[3] = CFSTR("heuristic");
  heuristic = self->_heuristic;
  v6 = (uint64_t)heuristic;
  if (!heuristic)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v6;
  v20[3] = v6;
  v19[4] = CFSTR("criteria");
  -[ATXAction criteria](self, "criteria");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "json");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v8;
  v19[5] = CFSTR("actionUUID");
  -[NSUUID UUIDString](self->_actionUUID, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v9;
  v19[6] = CFSTR("actionTitle");
  -[ATXAction actionTitle](self, "actionTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[6] = v11;
  v19[7] = CFSTR("actionSubtitle");
  -[ATXAction actionSubtitle](self, "actionSubtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[7] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)

  if (!v10)
  if (!heuristic)

  if (!v4)
  return v14;
}

- (ATXActionCriteria)criteria
{
  ATXActionCriteria *criteria;

  criteria = self->_criteria;
  if (criteria)
    return criteria;
  else
    return (ATXActionCriteria *)(id)objc_opt_new();
}

- (void)setCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_criteria, a3);
}

- (void)setHeuristic:(id)a3
{
  NSString *v4;
  NSString *heuristic;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  heuristic = self->_heuristic;
  self->_heuristic = v4;

}

- (NSUserActivity)userActivity
{
  ATXAction *v2;
  uint64_t v3;
  NSUserActivity *userActivity;
  void *v5;
  uint64_t v6;
  NSUserActivity *v7;
  NSUserActivity *v8;

  v2 = self;
  v3 = objc_sync_enter(v2);
  userActivity = v2->_userActivity;
  if (!userActivity)
  {
    v5 = (void *)MEMORY[0x1A85A4F90](v3);
    if (-[ATXAction actionType](v2, "actionType") == 1 || -[ATXAction actionType](v2, "actionType") == 5)
    {
      if (v2->_userActivityString)
      {
        v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityStrings:secondaryString:optionalData:", v2->_userActivityString, 0, 0);
        v7 = v2->_userActivity;
        v2->_userActivity = (NSUserActivity *)v6;

        -[NSUserActivity setContentAttributeSet:](v2->_userActivity, "setContentAttributeSet:", v2->_contentAttributeSet);
      }
    }
    objc_autoreleasePoolPop(v5);
    userActivity = v2->_userActivity;
  }
  v8 = userActivity;
  objc_sync_exit(v2);

  return v8;
}

- (id)predictionTypeStringForPET
{
  __CFString *v3;

  if (-[ATXAction isHeuristic](self, "isHeuristic"))
  {
    objc_msgSend(CFSTR("heuristic_"), "stringByAppendingString:", self->_heuristic);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[ATXAction isFutureMedia](self, "isFutureMedia"))
  {
    v3 = CFSTR("upcoming_media");
  }
  else
  {
    v3 = CFSTR("default");
  }
  return v3;
}

- (id)_bundleIdForDisplay
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[ATXAction bundleId](self, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAction intent](self, "intent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ATXAction intent](self, "intent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_intents_bundleIdForDisplay");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ATXAction userActivity](self, "userActivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else
    {
      -[ATXAction userActivityProxy](self, "userActivityProxy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v11 = v3;
        goto LABEL_11;
      }
    }
    -[ATXAction bundleId](self, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    INDisplayableOrLaunchableBundleIdForBundleIdFromUserActivity();
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;
  if (v6)
    v10 = (void *)v6;
  else
    v10 = v3;
  v11 = v10;

LABEL_11:
  return v11;
}

- (id)_spotlightContentType
{
  void *v3;
  id *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;

  -[ATXAction intent](self, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!self->_userActivityString && !self->_userActivityProxy)
    {
      __atxlog_handle_default();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXAction _spotlightContentType].cold.1();

    }
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0CBD4E8];
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (-[ATXAction intent](self, "intent"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "callCapability"),
        v6,
        v7 == 1))
  {
    v4 = (id *)MEMORY[0x1E0CBD4C8];
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (-[ATXAction intent](self, "intent"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "callCapability"),
        v8,
        v9 == 2))
  {
    v4 = (id *)MEMORY[0x1E0CBD4F0];
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_21:
    v4 = (id *)MEMORY[0x1E0CBD4D0];
    goto LABEL_22;
  }
  -[ATXAction routeInfo](self, "routeInfo");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10
    && (v11 = (void *)v10,
        -[ATXAction routeInfo](self, "routeInfo"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isExternalRoute"),
        v12,
        v11,
        (v13 & 1) != 0))
  {
    v4 = (id *)MEMORY[0x1E0CBD4D8];
  }
  else
  {
    v4 = (id *)MEMORY[0x1E0CBD4E0];
  }
LABEL_22:
  v14 = *v4;

  return v14;
}

- (id)_title
{
  return self->_title;
}

- (id)_subtitle
{
  return self->_subtitle;
}

+ (id)actionFromProactiveSuggestion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v3 = a3;
  objc_msgSend(v3, "executableSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "executableType");

  if (v5 == 2)
  {
    objc_msgSend(v3, "executableSpecification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "executableClassString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

    if ((v10 & 1) == 0)
    {
      __atxlog_handle_default();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        +[ATXAction actionFromProactiveSuggestion:].cold.2();
      v12 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v3, "executableSpecification");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "executableObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      __atxlog_handle_default();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        +[ATXAction actionFromProactiveSuggestion:].cold.1();
LABEL_10:

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)underlyingInteraction
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[ATXAction intent](self, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CBD9A8]);
    -[ATXAction intent](self, "intent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithIntent:response:", v5, 0);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  ATXAction *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  char v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  ATXLazyIntent *v52;
  char v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;
  char v60;
  char v61;
  char v62;
  char v63;
  char v64;
  _BYTE v65[9];

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("heuristicMetadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v65[0] = 0;
  v9 = objc_opt_class();
  _decodeOrFail(v4, v9, CFSTR("INIntent"), 0, v65);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v65[0])
  {

    v12 = 0;
  }
  else
  {
    v64 = 0;
    v13 = objc_opt_class();
    _decodeOrFail(v4, v13, CFSTR("userActivityProxy"), 0, &v64);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v64)
    {

      v12 = 0;
    }
    else
    {
      v63 = 0;
      v16 = objc_opt_class();
      _decodeOrFail(v4, v16, CFSTR("userActivityStr"), 0, &v63);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v63)
      {

        v12 = 0;
      }
      else
      {
        v62 = 0;
        v19 = objc_opt_class();
        _decodeOrFail(v4, v19, CFSTR("itemIdentifier"), 0, &v62);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v62)
        {

          v12 = 0;
        }
        else
        {
          v61 = 0;
          v22 = objc_opt_class();
          _decodeOrFail(v4, v22, CFSTR("contentAttributeSet"), 0, &v61);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v61)
          {

            v12 = 0;
          }
          else
          {
            if (v11)
              v52 = -[ATXLazyIntent initWithIntent:]([ATXLazyIntent alloc], "initWithIntent:", v11);
            else
              v52 = 0;
            v60 = 0;
            v25 = objc_opt_class();
            _decodeOrFail(v4, v25, CFSTR("actionUUID"), 1, &v60);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26;
            if (v60)
            {

              v12 = 0;
            }
            else
            {
              v59 = 0;
              v28 = objc_opt_class();
              _decodeOrFail(v4, v28, CFSTR("bundleId"), 1, &v59);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = v27;
              if (v59)
              {

                v12 = 0;
              }
              else
              {
                v50 = v29;
                v49 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("actionType"));
                v58 = 0;
                v30 = objc_opt_class();
                _decodeOrFail(v4, v30, CFSTR("heuristic"), 0, &v58);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                if (v58)
                {

                  v12 = 0;
                }
                else
                {
                  v48 = v31;
                  v57 = 0;
                  v32 = objc_opt_class();
                  _decodeOrFail(v4, v32, CFSTR("criteria"), 0, &v57);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v57)
                  {

                    v12 = 0;
                  }
                  else
                  {
                    v47 = v33;
                    v34 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFutureMedia"));
                    v56 = 0;
                    v35 = objc_opt_class();
                    _decodeOrFail(v4, v35, CFSTR("routeInfo"), 0, &v56);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v56)
                    {

                      v12 = 0;
                    }
                    else
                    {
                      v46 = v36;
                      v55 = 0;
                      v37 = objc_opt_class();
                      _decodeOrFail(v4, v37, CFSTR("title"), 0, &v55);
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v55)
                      {

                        v12 = 0;
                      }
                      else
                      {
                        v54 = 0;
                        v38 = objc_opt_class();
                        _decodeOrFail(v4, v38, CFSTR("subtitle"), 0, &v54);
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v54)
                        {

                          v12 = 0;
                        }
                        else
                        {
                          v53 = 0;
                          v39 = objc_opt_class();
                          _decodeOrFail(v4, v39, CFSTR("languageCode"), 0, &v53);
                          v40 = (void *)objc_claimAutoreleasedReturnValue();
                          v41 = v40;
                          if (v53)
                          {

                            v12 = 0;
                          }
                          else
                          {
                            LOBYTE(v43) = v34;
                            self = objc_retain(-[ATXAction initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:](self, "initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:", v15, 0, v18, v21, v24, v52, v51, v50, v49, v48, v8, v47, v43, v46,
                                       v45,
                                       v44,
                                       v40,
                                       0));

                            v12 = self;
                          }

                        }
                      }

                    }
                  }

                }
              }

            }
            if (v11)

          }
        }

      }
    }

  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXAction encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXAction *v6;
  ATXAction *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[ATXAction initWithProtoData:](self, "initWithProtoData:", v5);
  else
    v6 = -[ATXAction _initWithCoder:](self, "_initWithCoder:", v4);
  v7 = v6;

  return v7;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (NSUUID)actionUUID
{
  return self->_actionUUID;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)heuristic
{
  return self->_heuristic;
}

- (NSDictionary)heuristicMetadata
{
  return self->_heuristicMetadata;
}

- (BOOL)isFutureMedia
{
  return self->_isFutureMedia;
}

- (NSArray)predictableParameterCombinations
{
  return self->_predictableParameterCombinations;
}

- (void)setPredictableParameterCombinations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (UAUserActivityProxy)userActivityProxy
{
  return self->_userActivityProxy;
}

- (NSString)userActivityString
{
  return self->_userActivityString;
}

- (CSSearchableItemAttributeSet)contentAttributeSet
{
  return self->_contentAttributeSet;
}

- (ATXAVRouteInfo)routeInfo
{
  return self->_routeInfo;
}

- (NSNumber)cachedHash
{
  return self->_cachedHash;
}

- (BOOL)isTVAction
{
  ATXAction *v2;
  void *v3;

  v2 = self;
  -[ATXAction intent](self, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = +[ATXAction _isTVIntent:bundleId:](ATXAction, "_isTVIntent:bundleId:", v3, v2->_bundleId);

  return (char)v2;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  if (a4 == 1)
  {
    v5 = a3;
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)atx_doNotDisturbForCurrentLocationActionWithTitle:(id)a3 subtitle:(id)a4 heuristicName:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  ATXAction *v13;
  void *v14;
  ATXAction *v15;
  uint64_t v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  initializeDNDToggleDoNotDisturbIntent();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setValue:forKey:", &unk_1E4DC1A28, CFSTR("state"));
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA08]), "initWithIdentifier:displayString:", 0, &stru_1E4D5DB30);
    objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("location"));

    v13 = [ATXAction alloc];
    v14 = (void *)objc_opt_new();
    LOBYTE(v17) = 0;
    v15 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v13, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v11, v14, CFSTR("com.apple.Preferences"), v9, 0, 0, v17, v7, v8);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)atx_doNotDisturbForEventActionWithTitle:(id)a3 subtitle:(id)a4 eventTitle:(id)a5 eventIdentifier:(id)a6 eventUniqueID:(id)a7 heuristicName:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ATXAction *v23;
  ATXAction *v24;
  void *v25;
  uint64_t v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  initializeDNDToggleDoNotDisturbIntent();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "setValue:forKey:", &unk_1E4DC1A28, CFSTR("state"));
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA08]), "initWithIdentifier:displayString:", v17, v15);
    objc_msgSend(v20, "setValue:forKey:", v21, CFSTR("event"));

    if (v16)
    {
      v28 = CFSTR("eventIdentifier");
      v29[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    v24 = [ATXAction alloc];
    v25 = (void *)objc_opt_new();
    LOBYTE(v27) = 0;
    v23 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v24, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v20, v25, CFSTR("com.apple.Preferences"), v18, v22, 0, v27, v13, v14);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (id)atx_startCallActionWithTitle:(id)a3 subtitle:(id)a4 recipientName:(id)a5 recipientHandle:(id)a6 callService:(id)a7 contactIdentifier:(id)a8 eventIdentifier:(id)a9 heuristicName:(id)a10 mediaType:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v26 = v25;
  if (!v25)
    goto LABEL_5;
  v27 = objc_msgSend(v25, "integerValue");
  if (!v27)
  {
    __atxlog_handle_heuristic();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      +[ATXAction(Factory) atx_startCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:mediaType:].cold.2();
    goto LABEL_12;
  }
  if (v27 == 2)
  {
    objc_msgSend(a1, "atx_startVideoCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:", v17, v18, v19, v20, v21, v22, v23, v24);
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v27 != 1)
  {
    __atxlog_handle_heuristic();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      +[ATXAction(Factory) atx_startCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:mediaType:].cold.1();
LABEL_12:

    v30 = 0;
    goto LABEL_13;
  }
LABEL_5:
  objc_msgSend(a1, "atx_startAudioCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:", v17, v18, v19, v20, v21, v22, v23, v24);
  v28 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v30 = (void *)v28;
LABEL_13:

  return v30;
}

+ (id)atx_startVideoCallActionWithTitle:(id)a3 subtitle:(id)a4 recipientName:(id)a5 recipientHandle:(id)a6 callService:(id)a7 contactIdentifier:(id)a8 eventIdentifier:(id)a9 heuristicName:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  ATXAction *v26;
  ATXAction *v27;
  void *v28;
  uint64_t v30;
  const __CFString *v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a9;
  v19 = a10;
  personFromCallRecipient(a8, a6, a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc(MEMORY[0x1E0CBDC10]);
  v33[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:contacts:callCapability:", 0, 0, 0, 1, v22, 2);

  __atxlog_handle_heuristic();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    +[ATXAction(Factory) atx_startVideoCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:].cold.2();

  if (objc_msgSend(v17, "isEqualToString:", CFSTR("facetime")))
  {
    objc_msgSend(v23, "_setLaunchId:", CFSTR("com.apple.InCallService"));
    objc_msgSend(v23, "_setExtensionBundleId:", CFSTR("com.apple.TelephonyUtilities.PhoneIntentHandler"));
    objc_msgSend(v23, "setPreferredCallProvider:", 2);
    if (v18)
    {
      v31 = CFSTR("eventIdentifier");
      v32 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
    v27 = [ATXAction alloc];
    v28 = (void *)objc_opt_new();
    LOBYTE(v30) = 0;
    v26 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v27, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v23, v28, CFSTR("com.apple.InCallService"), v19, v25, 0, v30, v15, v16);

  }
  else
  {
    __atxlog_handle_heuristic();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      +[ATXAction(Factory) atx_startVideoCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:].cold.1();
    v26 = 0;
  }

  return v26;
}

+ (id)atx_setAirplaneModeActionWithTitle:(id)a3 subtitle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  ATXAction *v14;
  void *v15;
  ATXAction *v16;
  uint64_t v18;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1A85A4F90]();
  loadIntentWithBundleIdAndName(CFSTR("com.apple.ActionKit.BundledIntentHandler"), CFSTR("WFSetAirplaneModeIntent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "_setExtensionBundleId:", CFSTR("com.apple.ActionKit.BundledIntentHandler"));
    objc_msgSend(v9, "_setLaunchId:", CFSTR("com.apple.ActionKit.BundledIntentHandler"));
    objc_msgSend(v9, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("state"));
    objc_msgSend(v9, "setValue:forKey:", &unk_1E4DC1A28, CFSTR("operation"));
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.proactive.HeuristicInterpreter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLForResource:withExtension:", CFSTR("AirplaneMode"), CFSTR("png"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CBD958], "imageWithURL:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setImage:forParameterNamed:", v12, CFSTR("state"));

    }
    __atxlog_handle_heuristic();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      +[ATXAction(Factory) atx_setAirplaneModeActionWithTitle:subtitle:].cold.1();

    v14 = [ATXAction alloc];
    v15 = (void *)objc_opt_new();
    LOBYTE(v18) = 0;
    v16 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v14, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v9, v15, CFSTR("com.apple.Preferences"), CFSTR("enableAirplaneMode"), 0, 0, v18, v5, v6);

  }
  else
  {
    v16 = 0;
  }

  objc_autoreleasePoolPop(v7);
  return v16;
}

+ (id)atx_startAudioCallActionWithTitle:(id)a3 subtitle:(id)a4 recipientName:(id)a5 recipientHandle:(id)a6 callService:(id)a7 contactIdentifier:(id)a8 eventIdentifier:(id)a9 heuristicName:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  ATXAction *v27;
  void *v28;
  ATXAction *v29;
  uint64_t v31;
  const __CFString *v32;
  id v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a9;
  v19 = a10;
  personFromCallRecipient(a8, a6, a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc(MEMORY[0x1E0CBDC10]);
  v34[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:contacts:callCapability:", 0, 0, 0, 1, v22, 1);

  __atxlog_handle_heuristic();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    +[ATXAction(Factory) atx_startVideoCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:].cold.2();

  if ((objc_msgSend(v17, "isEqualToString:", CFSTR("phone")) & 1) != 0)
  {
    v25 = 1;
LABEL_7:
    objc_msgSend(v23, "_setLaunchId:", CFSTR("com.apple.InCallService"));
    objc_msgSend(v23, "_setExtensionBundleId:", CFSTR("com.apple.TelephonyUtilities.PhoneIntentHandler"));
    objc_msgSend(v23, "setPreferredCallProvider:", v25);
    objc_msgSend(v23, "setTTYType:", 1);
    if (v18)
    {
      v32 = CFSTR("eventIdentifier");
      v33 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    v27 = [ATXAction alloc];
    v28 = (void *)objc_opt_new();
    LOBYTE(v31) = 0;
    v29 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v27, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v23, v28, CFSTR("com.apple.InCallService"), v19, v26, 0, v31, v15, v16);

    goto LABEL_14;
  }
  if ((objc_msgSend(v17, "isEqualToString:", CFSTR("facetime")) & 1) != 0)
  {
    v25 = 2;
    goto LABEL_7;
  }
  __atxlog_handle_heuristic();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    +[ATXAction(Factory) atx_startAudioCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:].cold.1();
  v29 = 0;
LABEL_14:

  return v29;
}

+ (id)atx_sendMessageActionWithTitle:(id)a3 subtitle:(id)a4 recipientName:(id)a5 recipientHandle:(id)a6 text:(id)a7 contactIdentifier:(id)a8 conversationIdentifier:(id)a9 eventIdentifier:(id)a10 heuristicName:(id)a11
{
  objc_class *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  ATXAction *v30;
  void *v31;
  ATXAction *v32;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  const __CFString *v38;
  id v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v35 = a10;
  v17 = (objc_class *)MEMORY[0x1E0CBDA60];
  v37 = a11;
  v36 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = (void *)objc_msgSend([v17 alloc], "initWithValue:type:", v20, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA58]), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v24, 0, v21, 0, v18, v20);

  v26 = objc_alloc(MEMORY[0x1E0CBDB80]);
  v40[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithRecipients:outgoingMessageType:content:speakableGroupName:conversationIdentifier:serviceName:sender:attachments:", v27, 0, v19, 0, v36, 0, 0, 0);

  if (v35)
  {
    v38 = CFSTR("eventIdentifier");
    v39 = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
  v30 = [ATXAction alloc];
  v31 = (void *)objc_opt_new();
  LOBYTE(v34) = 0;
  v32 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v30, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v28, v31, CFSTR("com.apple.MobileSMS"), v37, v29, 0, v34, v23, v22);

  return v32;
}

+ (id)atx_userActivityActionWithBestAppSuggestion:(id)a3 title:(id)a4 subtitle:(id)a5 bundleID:(id)a6 activityType:(id)a7 heuristicName:(id)a8
{
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  ATXAction *v22;
  void *v23;
  id v24;
  uint64_t v26;
  uint8_t buf[16];

  v12 = a5;
  v13 = (objc_class *)MEMORY[0x1E0DC5EC8];
  v14 = a8;
  v15 = a6;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_msgSend([v13 alloc], "initWithSuggestion:", v17);

  if (objc_msgSend(v12, "length"))
  {
    v19 = objc_alloc(MEMORY[0x1E0CA6B50]);
    v20 = (void *)objc_msgSend(v19, "initWithContentType:", *MEMORY[0x1E0CEC498]);
    objc_msgSend(v20, "setContentDescription:", v12);
  }
  else
  {
    __atxlog_handle_heuristic();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v21, OS_LOG_TYPE_INFO, "BestAppSuggestion didn't have a valid subtitle, either because it was an empty string or it was 'null'.", buf, 2u);
    }

    v20 = 0;
  }
  v22 = [ATXAction alloc];
  v23 = (void *)objc_opt_new();
  LOBYTE(v26) = 0;
  v24 = -[ATXAction initFromBestAppSuggestion:activity:actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v22, "initFromBestAppSuggestion:activity:actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v18, 0, v23, v15, v20, 0, v14, 0, 0, v26, v16, v12);

  return v24;
}

+ (id)webUrlParsedForUserActivityWithUrlString:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    v4 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v4, 1)) == 0)
  {
    __atxlog_handle_heuristic();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v3;
      _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "Invalid URL: '%@'", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_14;
  }
  v6 = v5;
  -[NSObject scheme](v5, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("http")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("https")) & 1) == 0)
  {
    __atxlog_handle_heuristic();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "Unsupported NSUA URL scheme: %@", (uint8_t *)&v12, 0xCu);
    }

LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }

LABEL_10:
  v4 = v4;
  v9 = v4;
LABEL_15:

  return v9;
}

+ (id)atx_userActivityActionWithTitle:(id)a3 subtitle:(id)a4 bundleID:(id)a5 activityType:(id)a6 urlString:(id)a7 userInfo:(id)a8 heuristicName:(id)a9
{
  id v15;
  id v16;
  __CFString *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  ATXAction *v33;
  void *v34;
  ATXAction *v35;
  uint64_t v37;
  void *context;
  void *v39;
  void *v40;
  uint8_t buf[8];
  const __CFString *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = (__CFString *)a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  context = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "webUrlParsedForUserActivityWithUrlString:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v18;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", v18);
  v40 = v15;
  objc_msgSend(v23, "setTitle:", v15);
  if (v20)
    objc_msgSend(v23, "setUserInfo:", v20);
  if (v22)
    objc_msgSend(v23, "setWebpageURL:", v22);
  objc_msgSend(v22, "host");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("trackingshipment.apple.com"));

  if (objc_msgSend(v22, "atx_isOpenableFaceTimeURL"))
  {

    v17 = CFSTR("com.apple.InCallService");
  }
  if (v22
    && ((-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("com.apple.mobilesafari")) ^ 1 | v25) & 1) == 0)
  {
    objc_msgSend(v22, "_lp_simplifiedDisplayString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = CFSTR("contentDescription");
    v43[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_setContentAttributes:", v29);

    v30 = objc_alloc(MEMORY[0x1E0CA6B50]);
    v27 = (void *)objc_msgSend(v30, "initWithContentType:", *MEMORY[0x1E0CEC498]);
    objc_msgSend(v27, "setContentDescription:", v28);

  }
  else if (objc_msgSend(v16, "length"))
  {
    v26 = objc_alloc(MEMORY[0x1E0CA6B50]);
    v27 = (void *)objc_msgSend(v26, "initWithContentType:", *MEMORY[0x1E0CEC498]);
    objc_msgSend(v27, "setContentDescription:", v16);
  }
  else
  {
    __atxlog_handle_heuristic();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v31, OS_LOG_TYPE_INFO, "NSUA didn't have a valid subtitle, either because it was an empty string or it was 'null'.", buf, 2u);
    }

    v27 = 0;
  }
  v32 = v16;
  v33 = [ATXAction alloc];
  v34 = (void *)objc_opt_new();
  LOBYTE(v37) = 0;
  v35 = -[ATXAction initWithNSUserActivity:actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v33, "initWithNSUserActivity:actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v23, v34, v17, v27, 0, v21, 0, 0, v37, 0, 0);

  objc_autoreleasePoolPop(context);
  return v35;
}

+ (id)atx_updateAlarmActionWithTitle:(id)a3 subtitle:(id)a4 alarmID:(id)a5 alarmTitle:(id)a6 heuristicName:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  ATXAction *v23;
  void *v24;
  ATXAction *v25;
  NSObject *v26;
  NSObject *v27;
  void *v29;
  uint64_t v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v18 = (void *)getMTUpdateAlarmIntentClass_softClass;
  v35 = getMTUpdateAlarmIntentClass_softClass;
  if (!getMTUpdateAlarmIntentClass_softClass)
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __getMTUpdateAlarmIntentClass_block_invoke;
    v31[3] = &unk_1E4D570B8;
    v31[4] = &v32;
    __getMTUpdateAlarmIntentClass_block_invoke((uint64_t)v31);
    v18 = (void *)v33[3];
  }
  v19 = objc_retainAutorelease(v18);
  _Block_object_dispose(&v32, 8);
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAction+Factory.m"), 392, CFSTR("Failed to dyload MobileTimer."));

  }
  v20 = (void *)objc_opt_new();
  objc_msgSend(v20, "_setExtensionBundleId:", CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents"));
  objc_msgSend(v20, "_setLaunchId:", CFSTR("com.apple.mobiletimer"));
  objc_msgSend(v20, "_setNanoLaunchId:", CFSTR("com.apple.NanoAlarm"));
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA08]), "initWithIdentifier:displayString:", v15, v16);
  objc_msgSend(v20, "setAlarmID:", v21);

  INIntentWithTypedIntent();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    __atxlog_handle_heuristic();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      +[ATXAction(Factory) atx_updateAlarmActionWithTitle:subtitle:alarmID:alarmTitle:heuristicName:].cold.1();

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_heuristic();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      +[ATXAction(Factory) atx_updateAlarmActionWithTitle:subtitle:alarmID:alarmTitle:heuristicName:].cold.2();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Generic intent created from MTUpdateAlarmIntent is not an INIntent object."));
LABEL_14:
    v25 = 0;
    goto LABEL_15;
  }
  v23 = [ATXAction alloc];
  v24 = (void *)objc_opt_new();
  LOBYTE(v30) = 0;
  v25 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v23, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v22, v24, CFSTR("com.apple.mobiletimer"), v17, 0, 0, v30, v13, v14);

LABEL_15:
  return v25;
}

+ (id)atx_setAlarmActionWithTitle:(id)a3 subtitle:(id)a4 eventIdentifier:(id)a5 eventTitle:(id)a6 alarmDate:(id)a7 heuristicName:(id)a8
{
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  ATXAction *v33;
  ATXAction *v34;
  void *v35;
  void *v37;
  uint64_t v38;
  void *context;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[5];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  const __CFString *v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v41 = a4;
  v42 = a5;
  v44 = a6;
  v45 = a7;
  v43 = a8;
  context = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "components:fromDate:", 96, v45);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hour");
  v18 = objc_msgSend(v16, "minute");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateBySettingHour:minute:second:ofDate:options:", v17, v18, 0, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v20, 0, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v20, "timeIntervalSinceReferenceDate");
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%f"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v48 = &v47;
  v49 = 0x2050000000;
  v25 = (void *)getMTCreateAlarmIntentClass_softClass;
  v50 = getMTCreateAlarmIntentClass_softClass;
  if (!getMTCreateAlarmIntentClass_softClass)
  {
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __getMTCreateAlarmIntentClass_block_invoke;
    v46[3] = &unk_1E4D570B8;
    v46[4] = &v47;
    __getMTCreateAlarmIntentClass_block_invoke((uint64_t)v46);
    v25 = (void *)v48[3];
  }
  v26 = objc_retainAutorelease(v25);
  _Block_object_dispose(&v47, 8);
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAction+Factory.m"), 443, CFSTR("Failed to dyload MobileTimer."));

  }
  v27 = (void *)objc_opt_new();
  objc_msgSend(v27, "_setExtensionBundleId:", CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents"));
  objc_msgSend(v27, "_setLaunchId:", CFSTR("com.apple.mobiletimer"));
  objc_msgSend(v27, "_setNanoLaunchId:", CFSTR("com.apple.NanoAlarm"));
  objc_msgSend(v27, "setRequiresAppLaunch:", 1);
  objc_msgSend(v27, "setLabel:", v44);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA08]), "initWithIdentifier:displayString:", v24, v21);
  objc_msgSend(v27, "setTime:", v28);

  INIntentWithTypedIntent();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    __atxlog_handle_heuristic();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      +[ATXAction(Factory) atx_setAlarmActionWithTitle:subtitle:eventIdentifier:eventTitle:alarmDate:heuristicName:].cold.1();

    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_heuristic();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      +[ATXAction(Factory) atx_setAlarmActionWithTitle:subtitle:eventIdentifier:eventTitle:alarmDate:heuristicName:].cold.2();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Generic intent created from MTCreateAlarmIntent is not an INIntent object."));
LABEL_15:
    v33 = 0;
    goto LABEL_18;
  }
  if (v42)
  {
    v51 = CFSTR("eventIdentifier");
    v52[0] = v42;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }
  v34 = [ATXAction alloc];
  v35 = (void *)objc_opt_new();
  LOBYTE(v38) = 0;
  v33 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v34, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v29, v35, CFSTR("com.apple.mobiletimer"), v43, v30, 0, v38, v40, v41);

LABEL_18:
  objc_autoreleasePoolPop(context);

  return v33;
}

+ (id)atx_showCheckInActionWithTeamId:(id)a3 userActivityString:(id)a4 subtitle:(id)a5 overrideBundleId:(id)a6 suggestedEventUniqueKey:(id)a7 heuristicName:(id)a8
{
  return (id)objc_msgSend(a1, "atx_showCheckInActionWithTeamId:userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:", a3, a4, a5, a6, a7, a8, 0);
}

+ (id)atx_showCheckInActionWithTeamId:(id)a3 userActivityString:(id)a4 subtitle:(id)a5 overrideBundleId:(id)a6 suggestedEventUniqueKey:(id)a7 heuristicName:(id)a8 criteria:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  ATXAction *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  ATXAction *v50;
  void *v51;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  const __CFString *v62;
  id v63;
  const __CFString *v64;
  id v65;
  uint8_t buf[4];
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (objc_msgSend(v14, "length"))
  {
    if (objc_msgSend(v15, "length"))
    {
      if (objc_msgSend(v16, "length"))
      {
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityStrings:secondaryString:optionalData:", v15, 0, 0);
        v61 = v21;
        if (!v21)
        {
          __atxlog_handle_heuristic();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
            +[ATXAction(Factory) atx_showCheckInActionWithTeamId:userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:].cold.4();
          v24 = 0;
          v26 = 0;
          goto LABEL_35;
        }
        v22 = v21;
        v57 = v19;
        v58 = v20;
        v59 = v16;
        v60 = v18;
        if (v17)
        {
          __atxlog_handle_heuristic();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v67 = v17;
            _os_log_impl(&dword_1A49EF000, v23, OS_LOG_TYPE_INFO, "atx_showCheckInAction: Using fallback bundle. Override bundle is: %@", buf, 0xCu);
          }

          v24 = v22;
          v25 = v17;
          goto LABEL_30;
        }
        objc_msgSend(v21, "activityType");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = _LSCopyAdvertisementStringForTeamIdentifierAndActivityType();

        v30 = v29;
        objc_msgSend(MEMORY[0x1E0CA5870], "applicationRecordsForUserActivityType:limit:error:", v29, 1, 0);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "applicationState");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v31;
        if ((objc_msgSend(v32, "isInstalled") & 1) != 0)
        {
          objc_msgSend(v31, "bundleIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
            __atxlog_handle_heuristic();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v22, "activityType");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v67 = v35;
              _os_log_impl(&dword_1A49EF000, v34, OS_LOG_TYPE_INFO, "atx_showCheckInAction: Found an installed app that can handle activityType='%@'", buf, 0xCu);

            }
            v24 = v22;
            v36 = v54;
            objc_msgSend(v54, "bundleIdentifier");
            v37 = (const __CFString *)objc_claimAutoreleasedReturnValue();
LABEL_29:

            v25 = v37;
            v16 = v59;
LABEL_30:
            v56 = v17;
            v64 = CFSTR("contentDescription");
            v65 = v16;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject _setContentAttributes:](v24, "_setContentAttributes:", v46);

            v47 = objc_alloc(MEMORY[0x1E0CA6B50]);
            v48 = (void *)objc_msgSend(v47, "initWithContentType:", *MEMORY[0x1E0CEC498]);
            objc_msgSend(v48, "setContentDescription:", v16);
            if (v60)
            {
              v62 = CFSTR("uniqueKey");
              v63 = v60;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v49 = 0;
            }
            v50 = [ATXAction alloc];
            v51 = (void *)objc_opt_new();
            LOBYTE(v53) = 0;
            v20 = v58;
            v26 = -[ATXAction initWithNSUserActivity:actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v50, "initWithNSUserActivity:actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v24, v51, v25, v48, 0, v57, v49, v58, v53, 0, 0);

            v27 = v25;
            v19 = v57;
            v18 = v60;
            v17 = v56;
LABEL_34:
            v16 = v59;
LABEL_35:

            goto LABEL_36;
          }
        }
        else
        {

        }
        objc_msgSend(v22, "webpageURL");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        __atxlog_handle_heuristic();
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (!v38)
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
            +[ATXAction(Factory) atx_showCheckInActionWithTeamId:userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:].cold.5(v22, v40);

          v24 = 0;
          v26 = 0;
          v20 = v58;
          v27 = v30;
          goto LABEL_34;
        }
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v22, "activityType");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v67 = v41;
          _os_log_impl(&dword_1A49EF000, v40, OS_LOG_TYPE_INFO, "atx_showCheckInAction: Could not find an installed app to handle activityType='%@'. Using webpageURL to handle in Safari.", buf, 0xCu);

        }
        v42 = objc_alloc(MEMORY[0x1E0CA5920]);
        v43 = v22;
        v24 = objc_msgSend(v42, "initWithActivityType:", *MEMORY[0x1E0CB3418]);
        objc_msgSend(v43, "title");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setTitle:](v24, "setTitle:", v44);

        objc_msgSend(v43, "webpageURL");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setWebpageURL:](v24, "setWebpageURL:", v45);

        v37 = CFSTR("com.apple.mobilesafari");
        v36 = v54;
        goto LABEL_29;
      }
      __atxlog_handle_heuristic();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        +[ATXAction(Factory) atx_showCheckInActionWithTeamId:userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:].cold.3();
    }
    else
    {
      __atxlog_handle_heuristic();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        +[ATXAction(Factory) atx_showCheckInActionWithTeamId:userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:].cold.2();
    }
  }
  else
  {
    __atxlog_handle_heuristic();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      +[ATXAction(Factory) atx_showCheckInActionWithTeamId:userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:].cold.1();
  }
  v26 = 0;
LABEL_36:

  return v26;
}

- (void)initWithNSUserActivity:(os_log_t)log actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "%@ - timed out trying to fetch activityString from NSUserActivity", buf, 0xCu);

}

- (void)isEqualToAction:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "Encountered invalid ATXActionType value: %tu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "Could not de-serialize content attribute set: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "Could not de-serialize user activity proxy from recently engaged protobufs: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBAction proto", v5, 0xCu);

}

- (void)proto
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "Could not serialize content attribute set via protobufs: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_userActivityHashForUserInfoDict:activityType:webpageURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "Error serializing: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)archivedDataForAction
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Unable to archive ATXAction. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)unarchivedActionFromData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "error unarchiving action from data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)actionKey
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, v0, v1, "actionType is null to build actionKey for ATXAction %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)copyWithParameterAllowList:metadataProvider:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "The app intent doesn't have an app bundle id", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)copyWithParameterAllowList:metadataProvider:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Could not obtain link action metadata: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_spotlightContentType
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "reached presumably unreachable code path in APUISpotlightContentTypeForAction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)actionFromProactiveSuggestion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "Found nil ATXAction from ATXProactiveSuggestion with executable type Action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)actionFromProactiveSuggestion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "executableClassString is not ATXAction for ATXProactiveSuggestion with executable type Action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
