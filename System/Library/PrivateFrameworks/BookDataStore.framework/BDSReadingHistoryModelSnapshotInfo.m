@implementation BDSReadingHistoryModelSnapshotInfo

- (BDSReadingHistoryModelSnapshotInfo)initWithLoaded:(int64_t)a3 lastSource:(int64_t)a4 modelReadingDay:(id)a5 modelLongestStreak:(id)a6 remoteModelReadingDay:(id)a7 remoteModelLongestStreak:(id)a8
{
  id v15;
  id v16;
  id v17;
  BDSReadingHistoryModelSnapshotInfo *v18;
  BDSReadingHistoryModelSnapshotInfo *v19;
  id v21;
  objc_super v22;

  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BDSReadingHistoryModelSnapshotInfo;
  v18 = -[BDSReadingHistoryModelSnapshotInfo init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_loaded = a3;
    v18->_lastSource = a4;
    objc_storeStrong((id *)&v18->_modelReadingDay, a5);
    objc_storeStrong((id *)&v19->_modelLongestStreak, a6);
    objc_storeStrong((id *)&v19->_remoteModelReadingDay, a7);
    objc_storeStrong((id *)&v19->_remoteModelLongestStreak, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingHistoryModelSnapshotInfo)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  BDSReadingHistoryModelSnapshotInfo *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  BDSReadingHistoryDayInfo *modelReadingDay;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  BDSReadingHistoryStreakInfo *modelLongestStreak;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  BDSReadingHistoryDayInfo *remoteModelReadingDay;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  BDSReadingHistoryStreakInfo *remoteModelLongestStreak;

  v4 = a3;
  v12 = (BDSReadingHistoryModelSnapshotInfo *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v12)
  {
    v12->_loaded = objc_msgSend_decodeIntegerForKey_(v4, v9, (uint64_t)CFSTR("loaded"), v10, v11);
    v12->_lastSource = objc_msgSend_decodeIntegerForKey_(v4, v13, (uint64_t)CFSTR("lastSource"), v14, v15);
    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("modelReadingDay"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    modelReadingDay = v12->_modelReadingDay;
    v12->_modelReadingDay = (BDSReadingHistoryDayInfo *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("modelLongestStreak"), v23);
    v24 = objc_claimAutoreleasedReturnValue();
    modelLongestStreak = v12->_modelLongestStreak;
    v12->_modelLongestStreak = (BDSReadingHistoryStreakInfo *)v24;

    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("remoteModelReadingDay"), v28);
    v29 = objc_claimAutoreleasedReturnValue();
    remoteModelReadingDay = v12->_remoteModelReadingDay;
    v12->_remoteModelReadingDay = (BDSReadingHistoryDayInfo *)v29;

    v31 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, (uint64_t)CFSTR("remoteModelLongestStreak"), v33);
    v34 = objc_claimAutoreleasedReturnValue();
    remoteModelLongestStreak = v12->_remoteModelLongestStreak;
    v12->_remoteModelLongestStreak = (BDSReadingHistoryStreakInfo *)v34;

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
  uint64_t Source;
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
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  id v46;

  v4 = a3;
  v9 = objc_msgSend_loaded(self, v5, v6, v7, v8);
  objc_msgSend_encodeInteger_forKey_(v4, v10, v9, (uint64_t)CFSTR("loaded"), v11);
  Source = objc_msgSend_lastSource(self, v12, v13, v14, v15);
  objc_msgSend_encodeInteger_forKey_(v4, v17, Source, (uint64_t)CFSTR("lastSource"), v18);
  objc_msgSend_modelReadingDay(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, (uint64_t)CFSTR("modelReadingDay"), v25);

  objc_msgSend_modelLongestStreak(self, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v31, (uint64_t)v30, (uint64_t)CFSTR("modelLongestStreak"), v32);

  objc_msgSend_remoteModelReadingDay(self, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, (uint64_t)CFSTR("remoteModelReadingDay"), v39);

  objc_msgSend_remoteModelLongestStreak(self, v40, v41, v42, v43);
  v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v44, (uint64_t)v46, (uint64_t)CFSTR("remoteModelLongestStreak"), v45);

}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BDSReadingHistoryModelSnapshotInfo *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t Source;
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
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;

  v8 = objc_alloc_init(BDSReadingHistoryModelSnapshotInfo);
  if (v8)
  {
    v9 = objc_msgSend_loaded(self, v4, v5, v6, v7);
    objc_msgSend_setLoaded_(v8, v10, v9, v11, v12);
    Source = objc_msgSend_lastSource(self, v13, v14, v15, v16);
    objc_msgSend_setLastSource_(v8, v18, Source, v19, v20);
    objc_msgSend_modelReadingDay(self, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setModelReadingDay_(v8, v26, (uint64_t)v25, v27, v28);

    objc_msgSend_modelLongestStreak(self, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setModelLongestStreak_(v8, v34, (uint64_t)v33, v35, v36);

    objc_msgSend_remoteModelReadingDay(self, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRemoteModelReadingDay_(v8, v42, (uint64_t)v41, v43, v44);

    objc_msgSend_remoteModelLongestStreak(self, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRemoteModelLongestStreak_(v8, v50, (uint64_t)v49, v51, v52);

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
  uint64_t Source;
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
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v9 = objc_msgSend_loaded(self, v5, v6, v7, v8);
  Source = objc_msgSend_lastSource(self, v10, v11, v12, v13);
  objc_msgSend_modelReadingDay(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modelLongestStreak(self, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteModelReadingDay(self, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteModelLongestStreak(self, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v35, (uint64_t)CFSTR("<%@: %p loaded:%ld, lastSource:%ld, modelReadingDay:%@, modelLongestStreak:%@, remoteModelReadingDay:%@, remoteModelLongestStreak:%@>"), v36, v37, v4, self, v9, Source, v19, v24, v29, v34);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (int64_t)loaded
{
  return self->_loaded;
}

- (void)setLoaded:(int64_t)a3
{
  self->_loaded = a3;
}

- (int64_t)lastSource
{
  return self->_lastSource;
}

- (void)setLastSource:(int64_t)a3
{
  self->_lastSource = a3;
}

- (BDSReadingHistoryDayInfo)modelReadingDay
{
  return self->_modelReadingDay;
}

- (void)setModelReadingDay:(id)a3
{
  objc_storeStrong((id *)&self->_modelReadingDay, a3);
}

- (BDSReadingHistoryStreakInfo)modelLongestStreak
{
  return self->_modelLongestStreak;
}

- (void)setModelLongestStreak:(id)a3
{
  objc_storeStrong((id *)&self->_modelLongestStreak, a3);
}

- (BDSReadingHistoryDayInfo)remoteModelReadingDay
{
  return self->_remoteModelReadingDay;
}

- (void)setRemoteModelReadingDay:(id)a3
{
  objc_storeStrong((id *)&self->_remoteModelReadingDay, a3);
}

- (BDSReadingHistoryStreakInfo)remoteModelLongestStreak
{
  return self->_remoteModelLongestStreak;
}

- (void)setRemoteModelLongestStreak:(id)a3
{
  objc_storeStrong((id *)&self->_remoteModelLongestStreak, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteModelLongestStreak, 0);
  objc_storeStrong((id *)&self->_remoteModelReadingDay, 0);
  objc_storeStrong((id *)&self->_modelLongestStreak, 0);
  objc_storeStrong((id *)&self->_modelReadingDay, 0);
}

@end
