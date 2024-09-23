@implementation IDSRateLimiter

- (IDSRateLimiter)initWithLimit:(int64_t)a3 timeLimit:(double)a4
{
  NSObject *v7;
  IDSRateLimiter *v8;
  IDSRateLimiter *v9;
  NSMutableDictionary *cacheMap;
  objc_super v12;
  uint8_t buf[4];
  int64_t v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend_encryption(MEMORY[0x1E0D36A40], a2, a3, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v14 = a3;
    v15 = 2048;
    v16 = a4;
    _os_log_impl(&dword_19B949000, v7, OS_LOG_TYPE_DEFAULT, "Setting up rate limiter {limit: %ld, timeLimit: %f}", buf, 0x16u);
  }

  v12.receiver = self;
  v12.super_class = (Class)IDSRateLimiter;
  v8 = -[IDSRateLimiter init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_limit = a3;
    v8->_timeLimit = a4;
    cacheMap = v8->_cacheMap;
    v8->_cacheMap = 0;

    v9->_lock._os_unfair_lock_opaque = 0;
  }
  return v9;
}

- (BOOL)underLimitForItem:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  os_unfair_lock_s *p_lock;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  _BOOL4 v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  const __CFString *v28;
  void *v29;
  int v31;
  const __CFString *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_cleanupExpiredItems(self, v5, v6, v7);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_cacheMap(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)v4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v19 = objc_msgSend_count(v15, v16, v17, v18);
    v23 = v19 < objc_msgSend_limit(self, v20, v21, v22);
  }
  else
  {
    v23 = 1;
  }
  objc_msgSend_encryption(MEMORY[0x1E0D36A40], v16, v17, v18);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    if (v23)
      v28 = CFSTR("YES");
    else
      v28 = CFSTR("NO");
    objc_msgSend__unlockedDescription(self, v25, v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412802;
    v32 = v28;
    v33 = 2112;
    v34 = v4;
    v35 = 2112;
    v36 = v29;
    _os_log_impl(&dword_19B949000, v24, OS_LOG_TYPE_INFO, "Checking under limit {underLimit: %@, item: %@, cache: %@}", (uint8_t *)&v31, 0x20u);

  }
  os_unfair_lock_unlock(p_lock);

  return v23;
}

- (void)noteItem:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  os_unfair_lock_s *p_lock;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  id v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  IDSNegativeInfo *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  const char *v40;
  uint64_t v41;
  double v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  double v46;
  void *v47;
  int v48;
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_cleanupExpiredItems(self, v5, v6, v7);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_cacheMap(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend_setCacheMap_(self, v17, (uint64_t)v16, v18);

  }
  objc_msgSend_cacheMap(self, v13, v14, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)v4, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v23, v24, v25);
  v29 = v28;
  if (v22)
    v30 = objc_msgSend_count(v22, v26, v27, v28) + 1;
  else
    v30 = 1;
  v31 = [IDSNegativeInfo alloc];
  v33 = (void *)objc_msgSend_initWithTime_count_(v31, v32, v30, v29);
  objc_msgSend_cacheMap(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v37, v38, (uint64_t)v33, v39, v4);

  objc_msgSend_encryption(MEMORY[0x1E0D36A40], v40, v41, v42);
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend__unlockedDescription(self, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 138412546;
    v49 = v4;
    v50 = 2112;
    v51 = v47;
    _os_log_impl(&dword_19B949000, v43, OS_LOG_TYPE_DEFAULT, "Noting item {item: %@, cache: %@}", (uint8_t *)&v48, 0x16u);

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)clearItem:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  int v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_cacheMap(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v9, v10, (uint64_t)v4, v11);

  objc_msgSend_cacheMap(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_count(v15, v16, v17, v18);

  if (!v19)
    objc_msgSend_setCacheMap_(self, v20, 0, v22);
  objc_msgSend_encryption(MEMORY[0x1E0D36A40], v20, v21, v22);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend__unlockedDescription(self, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412546;
    v29 = v4;
    v30 = 2112;
    v31 = v27;
    _os_log_impl(&dword_19B949000, v23, OS_LOG_TYPE_DEFAULT, "Clearing item {item: %@, cache: %@}", (uint8_t *)&v28, 0x16u);

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)clearAllItems
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_cacheMap(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v7, v8, v9, v10);

  objc_msgSend_setCacheMap_(self, v11, 0, v12);
  objc_msgSend_encryption(MEMORY[0x1E0D36A40], v13, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend__unlockedDescription(self, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412290;
    v22 = v20;
    _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, "Clearing all items { cache: %@}", (uint8_t *)&v21, 0xCu);

  }
  os_unfair_lock_unlock(p_lock);
}

- (double)timeToUnderLimit:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  os_unfair_lock_s *p_lock;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  const char *v26;
  uint64_t v27;
  double v28;
  double v29;
  const char *v30;
  uint64_t v31;
  double v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  double v36;
  void *v37;
  int v39;
  double v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_cleanupExpiredItems(self, v5, v6, v7);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_cacheMap(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)v4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0.0;
  if (v15)
  {
    v20 = objc_msgSend_count(v15, v16, v17, v18);
    if (v20 >= objc_msgSend_limit(self, v21, v22, v23))
    {
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v16, v17, v18);
      v25 = v24;
      objc_msgSend_timeLimit(self, v26, v27, v24);
      v29 = v28;
      objc_msgSend_time(v15, v30, v31, v28);
      v18 = v29 - (v25 - v32);
      v19 = fmax(v18, 0.0);
    }
  }
  objc_msgSend_encryption(MEMORY[0x1E0D36A40], v16, v17, v18);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    objc_msgSend__unlockedDescription(self, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 134218498;
    v40 = v19;
    v41 = 2112;
    v42 = v4;
    v43 = 2112;
    v44 = v37;
    _os_log_impl(&dword_19B949000, v33, OS_LOG_TYPE_INFO, "Checking time until {timeUntilUnder: %f, item: %@, cache: %@}", (uint8_t *)&v39, 0x20u);

  }
  os_unfair_lock_unlock(p_lock);

  return v19;
}

- (void)cleanupExpiredItems
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  const char *v26;
  uint64_t v27;
  double v28;
  double v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  double v33;
  const char *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  double v40;
  NSObject *v41;
  _BOOL4 v42;
  const char *v43;
  uint64_t v44;
  double v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  id v52;
  const char *v53;
  double v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  uint64_t v62;
  void *v63;
  const char *v64;
  double v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  double v69;
  double v70;
  double v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  double v76;
  void *v77;
  const char *v78;
  double v79;
  const char *v80;
  uint64_t v81;
  double v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  double v86;
  uint64_t v87;
  const char *v88;
  double v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint8_t v98[128];
  uint8_t buf[4];
  id v100;
  __int16 v101;
  void *v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  os_unfair_lock_lock(&self->_lock);
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  objc_msgSend_cacheMap(self, v4, v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v94, v8, v103, 16);
  if (v9)
  {
    v13 = v9;
    v14 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v95 != v14)
          objc_enumerationMutation(v6);
        v16 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * i);
        objc_msgSend_cacheMap(self, v10, v11, v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v17, v18, v16, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v21, v22, v23);
        v25 = v24;
        objc_msgSend_time(v20, v26, v27, v24);
        v29 = v25 - v28;
        objc_msgSend_timeLimit(self, v30, v31, v28);
        if (v29 > v33)
          objc_msgSend_addObject_(v3, v32, v16, v33);

      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v10, (uint64_t)&v94, v12, v103, 16);
    }
    while (v13);
  }

  v37 = objc_msgSend_count(v3, v34, v35, v36);
  objc_msgSend_encryption(MEMORY[0x1E0D36A40], v38, v39, v40);
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
  if (v37)
  {
    if (v42)
    {
      objc_msgSend__unlockedDescription(self, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v100 = v3;
      v101 = 2112;
      v102 = v46;
      _os_log_impl(&dword_19B949000, v41, OS_LOG_TYPE_INFO, "Cleaning expired negative items {removeItems: %@, cache: %@}", buf, 0x16u);

    }
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v47, v48, v49);
    v51 = v50;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v52 = v3;
    v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v90, v54, v98, 16);
    if (v55)
    {
      v59 = v55;
      v60 = *(_QWORD *)v91;
      do
      {
        for (j = 0; j != v59; ++j)
        {
          if (*(_QWORD *)v91 != v60)
            objc_enumerationMutation(v52);
          v62 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * j);
          objc_msgSend_cacheMap(self, v56, v57, v58);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v63, v64, v62, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          if (v66)
          {
            objc_msgSend_time(v66, v67, v68, v69);
            v71 = v51 - v70;
            objc_msgSend_timeLimit(self, v72, v73, v70);
            if (v71 > v76)
            {
              objc_msgSend_cacheMap(self, v74, v75, v76);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_removeObjectForKey_(v77, v78, v62, v79);

            }
          }

        }
        v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v56, (uint64_t)&v90, v58, v98, 16);
      }
      while (v59);
    }

    objc_msgSend_cacheMap(self, v80, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend_count(v83, v84, v85, v86);

    if (!v87)
      objc_msgSend_setCacheMap_(self, v88, 0, v89);
  }
  else
  {
    if (v42)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v41, OS_LOG_TYPE_INFO, "No expired items to clean", buf, 2u);
    }

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (id)description
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_cacheMap(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_copy(v7, v8, v9, v10);

  os_unfair_lock_unlock(p_lock);
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = objc_opt_class();
  objc_msgSend_stringWithFormat_(v12, v14, (uint64_t)CFSTR("<%@: %p> limit: %ld timeLimit: %f map: %@"), self->_timeLimit, v13, self, self->_limit, *(_QWORD *)&self->_timeLimit, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_unlockedDescription
{
  void *v3;
  uint64_t v4;
  const char *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@: %p> limit: %ld timeLimit: %f map: %@"), self->_timeLimit, v4, self, self->_limit, *(_QWORD *)&self->_timeLimit, self->_cacheMap);
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (double)timeLimit
{
  return self->_timeLimit;
}

- (void)setTimeLimit:(double)a3
{
  self->_timeLimit = a3;
}

- (NSMutableDictionary)cacheMap
{
  return self->_cacheMap;
}

- (void)setCacheMap:(id)a3
{
  objc_storeStrong((id *)&self->_cacheMap, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheMap, 0);
}

@end
