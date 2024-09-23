@implementation BDSReadingHistoryStateInfo

- (BDSReadingHistoryStateInfo)initWithCurrentStreak:(int64_t)a3 longestStreak:(id)a4 today:(id)a5 readingHistory:(id)a6
{
  id v11;
  id v12;
  id v13;
  BDSReadingHistoryStateInfo *v14;
  BDSReadingHistoryStateInfo *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BDSReadingHistoryStateInfo;
  v14 = -[BDSReadingHistoryStateInfo init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_currentStreak = a3;
    objc_storeStrong((id *)&v14->_longestStreak, a4);
    objc_storeStrong((id *)&v15->_today, a5);
    objc_storeStrong((id *)&v15->_readingHistory, a6);
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char isEqualToArray;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  int isEqual;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;

  if (self != a3)
  {
    v4 = a3;
    objc_opt_class();
    BUDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    isEqualToArray = 0;
    if (!self || !v5)
      goto LABEL_18;
    v11 = objc_msgSend_currentStreak(self, v6, v7, v8, v9);
    if (v11 == objc_msgSend_currentStreak(v5, v12, v13, v14, v15))
    {
      objc_msgSend_longestStreak(self, v16, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_longestStreak(v5, v21, v22, v23, v24);
      v25 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v25)
      {

      }
      else
      {
        v30 = (void *)v25;
        objc_msgSend_longestStreak(self, v26, v27, v28, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_longestStreak(v5, v32, v33, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v31, v37, (uint64_t)v36, v38, v39);

        if (!isEqual)
          goto LABEL_12;
      }
      objc_msgSend_today(self, v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_today(v5, v46, v47, v48, v49);
      v50 = objc_claimAutoreleasedReturnValue();
      if (v45 == (void *)v50)
      {

      }
      else
      {
        v55 = (void *)v50;
        objc_msgSend_today(self, v51, v52, v53, v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_today(v5, v57, v58, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend_isEqual_(v56, v62, (uint64_t)v61, v63, v64);

        if (!v65)
          goto LABEL_12;
      }
      objc_msgSend_readingHistory(self, v66, v67, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_readingHistory(v5, v71, v72, v73, v74);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      if (v70 == v79)
      {
        isEqualToArray = 1;
      }
      else
      {
        objc_msgSend_readingHistory(self, v75, v76, v77, v78);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_readingHistory(v5, v81, v82, v83, v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToArray = objc_msgSend_isEqualToArray_(v80, v86, (uint64_t)v85, v87, v88);

      }
      goto LABEL_18;
    }
LABEL_12:
    isEqualToArray = 0;
LABEL_18:

    return isEqualToArray;
  }
  return 1;
}

- (BOOL)isEmptyState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend_currentStreak(self, a2, v2, v3, v4))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend_longestStreak(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v11, v12, v13, v14, v15))
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend_today(self, v16, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend_readingTime(v20, v21, v22, v23, v24) == 0;

    }
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend_readingHistory(self, v6, v7, v8, v9, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v41, (uint64_t)v45, 16);
  if (v27)
  {
    v32 = v27;
    v33 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v42 != v33)
          objc_enumerationMutation(v25);
        if (v10)
        {
          objc_msgSend_day(*(void **)(*((_QWORD *)&v41 + 1) + 8 * i), v28, v29, v30, v31);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend_readingTime(v35, v36, v37, v38, v39) == 0;

        }
        else
        {
          v10 = 0;
        }
      }
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v41, (uint64_t)v45, 16);
    }
    while (v32);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingHistoryStateInfo)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  BDSReadingHistoryStateInfo *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  BDSReadingHistoryStreakInfo *longestStreak;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  BDSReadingHistoryDayInfo *today;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSArray *readingHistory;

  v4 = a3;
  v12 = (BDSReadingHistoryStateInfo *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v12)
  {
    v12->_currentStreak = objc_msgSend_decodeIntegerForKey_(v4, v9, (uint64_t)CFSTR("currentStreak"), v10, v11);
    v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, (uint64_t)CFSTR("longestStreak"), v15);
    v16 = objc_claimAutoreleasedReturnValue();
    longestStreak = v12->_longestStreak;
    v12->_longestStreak = (BDSReadingHistoryStreakInfo *)v16;

    v18 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, (uint64_t)CFSTR("today"), v20);
    v21 = objc_claimAutoreleasedReturnValue();
    today = v12->_today;
    v12->_today = (BDSReadingHistoryDayInfo *)v21;

    v23 = (void *)MEMORY[0x24BDBCF20];
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    objc_msgSend_setWithObjects_(v23, v26, v24, v27, v28, v25, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v30, (uint64_t)v29, (uint64_t)CFSTR("readingHistory"), v31);
    v32 = objc_claimAutoreleasedReturnValue();
    readingHistory = v12->_readingHistory;
    v12->_readingHistory = (NSArray *)v32;

  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  id v32;

  v4 = a3;
  v9 = objc_msgSend_currentStreak(self, v5, v6, v7, v8);
  objc_msgSend_encodeInteger_forKey_(v4, v10, v9, (uint64_t)CFSTR("currentStreak"), v11);
  objc_msgSend_longestStreak(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v16, (uint64_t)CFSTR("longestStreak"), v18);

  objc_msgSend_today(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, (uint64_t)CFSTR("today"), v25);

  objc_msgSend_readingHistory(self, v26, v27, v28, v29);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v30, (uint64_t)v32, (uint64_t)CFSTR("readingHistory"), v31);

}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BDSReadingHistoryStateInfo *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;

  v8 = objc_alloc_init(BDSReadingHistoryStateInfo);
  if (v8)
  {
    v9 = objc_msgSend_currentStreak(self, v4, v5, v6, v7);
    objc_msgSend_setCurrentStreak_(v8, v10, v9, v11, v12);
    objc_msgSend_longestStreak(self, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLongestStreak_(v8, v18, (uint64_t)v17, v19, v20);

    objc_msgSend_today(self, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setToday_(v8, v26, (uint64_t)v25, v27, v28);

    objc_msgSend_readingHistory(self, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setReadingHistory_(v8, v34, (uint64_t)v33, v35, v36);

  }
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v9 = objc_msgSend_currentStreak(self, v5, v6, v7, v8);
  objc_msgSend_longestStreak(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_today(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistory(self, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v25, (uint64_t)CFSTR("<%@: %p currentStreak:%ld, longestStreak:%@, today:%@, readingHistory:%@>"), v26, v27, v4, self, v9, v14, v19, v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (int64_t)currentStreak
{
  return self->_currentStreak;
}

- (void)setCurrentStreak:(int64_t)a3
{
  self->_currentStreak = a3;
}

- (BDSReadingHistoryStreakInfo)longestStreak
{
  return self->_longestStreak;
}

- (void)setLongestStreak:(id)a3
{
  objc_storeStrong((id *)&self->_longestStreak, a3);
}

- (BDSReadingHistoryDayInfo)today
{
  return self->_today;
}

- (void)setToday:(id)a3
{
  objc_storeStrong((id *)&self->_today, a3);
}

- (NSArray)readingHistory
{
  return self->_readingHistory;
}

- (void)setReadingHistory:(id)a3
{
  objc_storeStrong((id *)&self->_readingHistory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingHistory, 0);
  objc_storeStrong((id *)&self->_today, 0);
  objc_storeStrong((id *)&self->_longestStreak, 0);
}

@end
