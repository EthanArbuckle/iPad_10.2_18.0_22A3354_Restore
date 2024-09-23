@implementation ATXStackStateTrackerInternalState

- (NSMutableDictionary)stackStateByStackId
{
  return self->_stackStateByStackId;
}

- (NSMutableDictionary)lastThreeUserVisitDatesOfPages
{
  return self->_lastThreeUserVisitDatesOfPages;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXStackStateTrackerInternalState lastThreeUserVisitDatesOfPages](self, "lastThreeUserVisitDatesOfPages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("codingKeyForLastThreeUserVisitDatesOfPages"));

  -[ATXStackStateTrackerInternalState stackStateByStackId](self, "stackStateByStackId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("codingKeyForStackStateByStackId"));

  -[ATXStackStateTrackerInternalState cachedStackLayoutsByBlendingUpdateUUID](self, "cachedStackLayoutsByBlendingUpdateUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("codingKeyForBlendingCacheUpdateByBlendingUpdateUUID"));

  -[ATXStackStateTrackerInternalState blendingCacheUpdateUUIDs](self, "blendingCacheUpdateUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("codingKeyForBlendingCacheUpdateUUIDs"));

  -[ATXStackStateTrackerInternalState bookmark](self, "bookmark");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v9, "serializeBookmark:", &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;

  if (v11)
  {
    __atxlog_handle_blending();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v14;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v10;
      _os_log_error_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_ERROR, "%@ - bookmark serialization failed with err: %@, data: %@", buf, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("codingKeyForBookmark"));
  }

}

- (NSMutableDictionary)cachedStackLayoutsByBlendingUpdateUUID
{
  return self->_cachedStackLayoutsByBlendingUpdateUUID;
}

- (ATXBMBookmark)bookmark
{
  return self->_bookmark;
}

- (NSMutableArray)blendingCacheUpdateUUIDs
{
  return self->_blendingCacheUpdateUUIDs;
}

- (ATXStackStateTrackerInternalState)init
{
  ATXStackStateTrackerInternalState *v2;
  uint64_t v3;
  NSMutableDictionary *lastThreeUserVisitDatesOfPages;
  uint64_t v5;
  NSMutableDictionary *stackStateByStackId;
  uint64_t v7;
  NSMutableDictionary *cachedStackLayoutsByBlendingUpdateUUID;
  uint64_t v9;
  NSMutableArray *blendingCacheUpdateUUIDs;
  ATXBMBookmark *bookmark;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ATXStackStateTrackerInternalState;
  v2 = -[ATXStackStateTrackerInternalState init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    lastThreeUserVisitDatesOfPages = v2->_lastThreeUserVisitDatesOfPages;
    v2->_lastThreeUserVisitDatesOfPages = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    stackStateByStackId = v2->_stackStateByStackId;
    v2->_stackStateByStackId = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    cachedStackLayoutsByBlendingUpdateUUID = v2->_cachedStackLayoutsByBlendingUpdateUUID;
    v2->_cachedStackLayoutsByBlendingUpdateUUID = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    blendingCacheUpdateUUIDs = v2->_blendingCacheUpdateUUIDs;
    v2->_blendingCacheUpdateUUIDs = (NSMutableArray *)v9;

    bookmark = v2->_bookmark;
    v2->_bookmark = 0;

  }
  return v2;
}

- (void)updateLastThreeUserVisitDatesIfNecessaryForPage:(id)a3 date:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9 && v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_lastThreeUserVisitDatesOfPages, "objectForKeyedSubscript:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      if ((objc_msgSend(v7, "containsObject:", v6) & 1) == 0)
      {
        objc_msgSend(v8, "addObject:", v6);
        objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_116);
        if ((unint64_t)objc_msgSend(v8, "count") >= 4)
        {
          do
            objc_msgSend(v8, "removeLastObject");
          while ((unint64_t)objc_msgSend(v8, "count") > 3);
        }
      }
    }
    else
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(v8, "addObject:", v6);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lastThreeUserVisitDatesOfPages, "setObject:forKeyedSubscript:", v8, v9);
    }

  }
}

uint64_t __90__ATXStackStateTrackerInternalState_updateLastThreeUserVisitDatesIfNecessaryForPage_date___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXStackStateTrackerInternalState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ATXStackStateTrackerInternalState *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  ATXStackStateTrackerInternalState *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  _QWORD v61[4];
  ATXStackStateTrackerInternalState *v62;
  uint8_t buf[4];
  const char *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = (void *)MEMORY[0x1CAA48B6C]();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, v10, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  __atxlog_handle_blending();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v11, CFSTR("codingKeyForLastThreeUserVisitDatesOfPages"), v4, 0, CFSTR("com.apple.duetexpertd.ATXStackStateTracker"), -1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v16 = (void *)MEMORY[0x1E0D81610];
    v17 = (void *)MEMORY[0x1CAA48B6C]();
    v18 = objc_alloc(MEMORY[0x1E0C99E60]);
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = (void *)objc_msgSend(v18, "initWithObjects:", v19, v20, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v17);
    __atxlog_handle_blending();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v21, CFSTR("codingKeyForStackStateByStackId"), v4, 0, CFSTR("com.apple.duetexpertd.ATXStackStateTracker"), -1, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v15 = -[ATXStackStateTrackerInternalState init](self, "init");
LABEL_23:

      goto LABEL_24;
    }
    v25 = (void *)MEMORY[0x1E0D81610];
    v26 = (void *)MEMORY[0x1CAA48B6C]();
    v27 = objc_alloc(MEMORY[0x1E0C99E60]);
    v28 = objc_opt_class();
    v29 = (void *)objc_msgSend(v27, "initWithObjects:", v28, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v26);
    __atxlog_handle_blending();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v29, CFSTR("codingKeyForBlendingCacheUpdateByBlendingUpdateUUID"), v4, 0, CFSTR("com.apple.duetexpertd.ATXStackStateTracker"), -1, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v15 = -[ATXStackStateTrackerInternalState init](self, "init");
LABEL_22:

      goto LABEL_23;
    }
    v33 = (void *)MEMORY[0x1E0D81610];
    v34 = (void *)MEMORY[0x1CAA48B6C]();
    v35 = objc_alloc(MEMORY[0x1E0C99E60]);
    v36 = objc_opt_class();
    v37 = (void *)objc_msgSend(v35, "initWithObjects:", v36, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v34);
    __atxlog_handle_blending();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v37, CFSTR("codingKeyForBlendingCacheUpdateUUIDs"), v4, 0, CFSTR("com.apple.duetexpertd.ATXStackStateTracker"), -1, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      v15 = -[ATXStackStateTrackerInternalState init](self, "init");
LABEL_21:

      goto LABEL_22;
    }
    v41 = (void *)MEMORY[0x1E0D81610];
    v42 = objc_opt_class();
    __atxlog_handle_blending();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v42, CFSTR("codingKeyForBookmark"), v4, 0, CFSTR("com.apple.duetexpertd.ATXStackStateTracker"), -1, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
      goto LABEL_10;
    if (v44)
    {
      objc_msgSend(MEMORY[0x1E0CF94A0], "bookmarkFromData:bookmarkLocation:versionNumber:", v44, 0, &unk_1E83CD2E8);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v46)
      {
        __atxlog_handle_blending();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          -[ATXStackStateTrackerInternalState initWithCoder:].cold.1(v47, v48, v49, v50, v51, v52, v53, v54);

LABEL_10:
        v15 = -[ATXStackStateTrackerInternalState init](self, "init");
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      v46 = 0;
    }
    v55 = -[ATXStackStateTrackerInternalState init](self, "init");
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __51__ATXStackStateTrackerInternalState_initWithCoder___block_invoke;
    v61[3] = &unk_1E82E4208;
    v15 = v55;
    v62 = v15;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v61);
    v56 = (void *)objc_msgSend(v23, "mutableCopy");
    -[ATXStackStateTrackerInternalState setStackStateByStackId:](v15, "setStackStateByStackId:", v56);

    v57 = (void *)objc_msgSend(v31, "mutableCopy");
    -[ATXStackStateTrackerInternalState setCachedStackLayoutsByBlendingUpdateUUID:](v15, "setCachedStackLayoutsByBlendingUpdateUUID:", v57);

    v58 = (void *)objc_msgSend(v39, "mutableCopy");
    -[ATXStackStateTrackerInternalState setBlendingCacheUpdateUUIDs:](v15, "setBlendingCacheUpdateUUIDs:", v58);

    -[ATXStackStateTrackerInternalState setBookmark:](v15, "setBookmark:", v46);
    __atxlog_handle_blending();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v64 = "-[ATXStackStateTrackerInternalState initWithCoder:]";
      _os_log_impl(&dword_1C9A3B000, v59, OS_LOG_TYPE_DEFAULT, "%s: Successfully deserialized ATXStackStateTrackerInternalState from disk", buf, 0xCu);
    }

    goto LABEL_20;
  }
  v15 = -[ATXStackStateTrackerInternalState init](self, "init");
LABEL_24:

  return v15;
}

void __51__ATXStackStateTrackerInternalState_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  v7 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "lastThreeUserVisitDatesOfPages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v5);

}

- (void)setLastThreeUserVisitDatesOfPages:(id)a3
{
  objc_storeStrong((id *)&self->_lastThreeUserVisitDatesOfPages, a3);
}

- (void)setStackStateByStackId:(id)a3
{
  objc_storeStrong((id *)&self->_stackStateByStackId, a3);
}

- (void)setCachedStackLayoutsByBlendingUpdateUUID:(id)a3
{
  objc_storeStrong((id *)&self->_cachedStackLayoutsByBlendingUpdateUUID, a3);
}

- (void)setBlendingCacheUpdateUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_blendingCacheUpdateUUIDs, a3);
}

- (void)setBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_bookmark, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_blendingCacheUpdateUUIDs, 0);
  objc_storeStrong((id *)&self->_cachedStackLayoutsByBlendingUpdateUUID, 0);
  objc_storeStrong((id *)&self->_stackStateByStackId, 0);
  objc_storeStrong((id *)&self->_lastThreeUserVisitDatesOfPages, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%s: Unable to init ATXStackStateTrackerInternalState due to bookmark init failure. Creating an empty internal state instead.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
