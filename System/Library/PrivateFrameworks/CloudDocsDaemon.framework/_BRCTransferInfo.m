@implementation _BRCTransferInfo

- (_BRCTransferInfo)init
{
  _BRCTransferInfo *v2;
  BRCProgress *v3;
  BRCProgress *progress;
  BRCProgress *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *versionSizes;
  NSMutableDictionary *v9;
  NSMutableDictionary *childProgresses;
  NSMutableDictionary *v11;
  NSMutableDictionary *previousUnitCounts;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_BRCTransferInfo;
  v2 = -[_BRCTransferInfo init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(BRCProgress);
    progress = v2->_progress;
    v2->_progress = v3;

    v5 = v2->_progress;
    objc_msgSend(MEMORY[0x1E0D10E60], "mobileDocumentsURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCProgress setUserInfoObject:forKey:](v5, "setUserInfoObject:forKey:", v6, *MEMORY[0x1E0CB30F0]);

    -[BRCProgress setUserInfoObject:forKey:](v2->_progress, "setUserInfoObject:forKey:", &unk_1E87D7298, *MEMORY[0x1E0CB30E8]);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    versionSizes = v2->_versionSizes;
    v2->_versionSizes = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    childProgresses = v2->_childProgresses;
    v2->_childProgresses = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    previousUnitCounts = v2->_previousUnitCounts;
    v2->_previousUnitCounts = v11;

  }
  return v2;
}

- (id)description
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int64_t v18;
  void *v19;
  uint64_t v20;
  int64_t v21;
  void *v22;
  double v23;
  void *v24;
  __CFString *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;

  -[_BRCTransferInfo progress](self, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)0x1E0CB3000;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[_BRCTransferInfo progress](self, "progress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCTransferInfo progress](self, "progress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedAdditionalDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");
    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      -[_BRCTransferInfo progress](self, "progress");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedAdditionalDescription");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR(" (%@)"), v2);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = &stru_1E8769030;
    }
    objc_msgSend(v6, "stringWithFormat:", CFSTR(" d:'%@%@'"), v8, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {

    }
    v26 = (__CFString *)v14;
  }
  else
  {
    v26 = &stru_1E8769030;
  }
  v28 = (void *)MEMORY[0x1E0CB3940];
  v27 = objc_opt_class();
  -[_BRCTransferInfo progress](self, "progress");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "userInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0CB30E8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BRCTransferInfo progress](self, "progress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "completedUnitCount");
  v18 = -[_BRCTransferInfo sumOfCompletedUnitCountDelta](self, "sumOfCompletedUnitCountDelta");
  -[_BRCTransferInfo progress](self, "progress");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "totalUnitCount");
  v21 = -[_BRCTransferInfo sumOfTotalUnitCountDelta](self, "sumOfTotalUnitCountDelta");
  -[_BRCTransferInfo progress](self, "progress");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fractionCompleted");
  objc_msgSend(v28, "stringWithFormat:", CFSTR("<%@:%p c:%@ p:%lld(%+lld)/%lld(%+lld) [%.3f%%]%@>"), v27, self, v15, v17, v18, v20, v21, v23 * 100.0, v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)updateUnitCount
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_9_0();
  v3 = v2;
  v12 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(v2, "sumOfCompletedUnitCountDelta");
  objc_msgSend(v3, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218498;
  v7 = v4;
  v8 = 2048;
  v9 = objc_msgSend(v5, "completedUnitCount");
  v10 = 2112;
  v11 = v1;
  _os_log_debug_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_DEBUG, "[NOTIF] sumOfCompletedUnitCountDelta = %lld, progress.completedUnitCount = %lld%@", (uint8_t *)&v6, 0x20u);

}

- (void)copyProgressInfoToProgress:(id)a3 options:(char)a4
{
  BRCProgress *progress;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  progress = self->_progress;
  v6 = a3;
  objc_msgSend(v6, "setCompletedUnitCount:", -[BRCProgress completedUnitCount](progress, "completedUnitCount"));
  objc_msgSend(v6, "setTotalUnitCount:", -[BRCProgress totalUnitCount](self->_progress, "totalUnitCount"));
  -[BRCProgress userInfo](self->_progress, "userInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB30E8];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB30E8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInfoObject:forKey:", v8, v7);

}

- (void)verifyFutureProgressIsNotFinished
{
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  LODWORD(v4) = 134218242;
  *(_QWORD *)((char *)&v4 + 4) = a2;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v2, v3, "[CRIT] UNREACHABLE: future progress state isn't valid (unitCount: %lld)%@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_2();
}

- (BRCProgress)progress
{
  return self->_progress;
}

- (int64_t)sumOfCompletedUnitCountDelta
{
  return self->sumOfCompletedUnitCountDelta;
}

- (void)setSumOfCompletedUnitCountDelta:(int64_t)a3
{
  self->sumOfCompletedUnitCountDelta = a3;
}

- (int64_t)sumOfTotalUnitCountDelta
{
  return self->sumOfTotalUnitCountDelta;
}

- (void)setSumOfTotalUnitCountDelta:(int64_t)a3
{
  self->sumOfTotalUnitCountDelta = a3;
}

- (NSMutableDictionary)versionSizes
{
  return self->_versionSizes;
}

- (NSMutableDictionary)childProgresses
{
  return self->_childProgresses;
}

- (NSMutableDictionary)previousUnitCounts
{
  return self->_previousUnitCounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousUnitCounts, 0);
  objc_storeStrong((id *)&self->_childProgresses, 0);
  objc_storeStrong((id *)&self->_versionSizes, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

- (void)updateLocalizedDescriptionWithOptions:(char)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end
