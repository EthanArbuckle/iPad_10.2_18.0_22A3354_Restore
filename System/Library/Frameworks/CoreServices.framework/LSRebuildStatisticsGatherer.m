@implementation LSRebuildStatisticsGatherer

- (LSRebuildStatisticsGatherer)init
{
  LSRebuildStatisticsGatherer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LSRebuildStatisticsGatherer;
  result = -[LSRebuildStatisticsGatherer init](&v3, sel_init);
  if (result)
  {
    result->_numApplications = 0;
    *(_OWORD *)&result->_containerizedContentScanTime = 0u;
    *(_OWORD *)&result->_systemContentSaveTime = 0u;
    *(_OWORD *)&result->_totalRebuildTime = 0u;
  }
  return result;
}

- (uint64_t)performRebuild:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    result = timeWorkBlock(a2);
    *(_QWORD *)(v2 + 8) = result;
  }
  return result;
}

- (uint64_t)performSystemContentScan:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    result = timeWorkBlock(a2);
    *(_QWORD *)(v2 + 16) = result;
  }
  return result;
}

- (uint64_t)performSystemContentSave:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    result = timeWorkBlock(a2);
    *(_QWORD *)(v2 + 24) = result;
  }
  return result;
}

- (uint64_t)performCryptexContentScan:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    result = timeWorkBlock(a2);
    *(_QWORD *)(v2 + 32) = result;
  }
  return result;
}

- (uint64_t)performContainerizedContentScan:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    result = timeWorkBlock(a2);
    *(_QWORD *)(v2 + 40) = result;
  }
  return result;
}

- (void)registeredBundleOfType:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v7 = v3;
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PluginKitPlugin")) & 1) != 0)
    {
      v5 = 48;
    }
    else
    {
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CoreServices")) & 1) == 0
        && (objc_msgSend(v7, "isEqualToString:", CFSTR("Internal")) & 1) == 0
        && (objc_msgSend(v7, "isEqualToString:", CFSTR("User")) & 1) == 0
        && (objc_msgSend(v7, "isEqualToString:", CFSTR("System")) & 1) == 0
        && (objc_msgSend(v7, "isEqualToString:", CFSTR("SystemAppPlaceholder")) & 1) == 0)
      {
        v6 = objc_msgSend(v7, "isEqualToString:", CFSTR("VPNPlugin"));
        v4 = v7;
        if (!v6)
          goto LABEL_12;
        v5 = 56;
        goto LABEL_11;
      }
      v5 = 56;
    }
    v4 = v7;
LABEL_11:
    ++*(_QWORD *)(a1 + v5);
  }
LABEL_12:

}

- (void)submitAnalytics
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "CoreAnalytics is not available; not sending rebuild analytics",
    v1,
    2u);
}

void __46__LSRebuildStatisticsGatherer_submitAnalytics__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.lsd.rebuildAnalyticsSubmit", v2);
  v1 = (void *)submitAnalytics_analyticsSubmitQueue;
  submitAnalytics_analyticsSubmitQueue = (uint64_t)v0;

}

void __46__LSRebuildStatisticsGatherer_submitAnalytics__block_invoke_15(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  unint64_t v24;
  void *v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  double v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  void *v39;
  double v40;
  uint64_t v41;
  void *v42;
  unint64_t v43;
  void *v44;
  double v45;
  uint64_t v46;
  void *v47;
  unint64_t v48;
  void *v49;
  double v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  uint8_t buf[4];
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(unsigned __int8 *)(v3 + 64) != 0;
  else
    v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("onlyCryptexContent"));

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(unsigned __int8 *)(v6 + 66) != 0;
  else
    v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("userRequested"));

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = *(unsigned __int8 *)(v9 + 65) != 0;
  else
    v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("migration"));

  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    v13 = *(unsigned __int16 *)(v12 + 68);
  else
    v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("rebuildReasonFlags"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("numPlugins"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, CFSTR("numApplications"));

  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
  {
    v18 = *(id *)(v17 + 72);
    v19 = v18;
    if (v18)
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v18, "domain");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@, %ld"), v21, objc_msgSend(v19, "code"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v22, CFSTR("errorInfo"));

    }
  }
  else
  {
    v19 = 0;
  }
  v23 = *(_QWORD **)(a1 + 32);
  v24 = v23[1];
  if (v24)
  {
    v25 = (void *)MEMORY[0x1E0CB37E8];
    v26 = (double)v24;
    v27 = _LSGetMachTimebase();
    objc_msgSend(v25, "numberWithDouble:", (double)v27 / (double)HIDWORD(v27) * v26 / 1000000000.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v28, CFSTR("totalRebuildTime"));

    v29 = (void *)MEMORY[0x1E0CB37E8];
    v30 = (double)(unint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                   - vaddvq_s64(vaddq_s64(*(int64x2_t *)(*(_QWORD *)(a1 + 32) + 16), *(int64x2_t *)(*(_QWORD *)(a1 + 32) + 32))));
    v31 = _LSGetMachTimebase();
    objc_msgSend(v29, "numberWithDouble:", (double)v31 / (double)HIDWORD(v31) * v30 / 1000000000.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v32, CFSTR("otherTime"));

    v23 = *(_QWORD **)(a1 + 32);
  }
  v33 = v23[2];
  if (v33)
  {
    v34 = (void *)MEMORY[0x1E0CB37E8];
    v35 = (double)v33;
    v36 = _LSGetMachTimebase();
    objc_msgSend(v34, "numberWithDouble:", (double)v36 / (double)HIDWORD(v36) * v35 / 1000000000.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v37, CFSTR("systemContentScanTime"));

    v23 = *(_QWORD **)(a1 + 32);
  }
  v38 = v23[3];
  if (v38)
  {
    v39 = (void *)MEMORY[0x1E0CB37E8];
    v40 = (double)v38;
    v41 = _LSGetMachTimebase();
    objc_msgSend(v39, "numberWithDouble:", (double)v41 / (double)HIDWORD(v41) * v40 / 1000000000.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v42, CFSTR("systemContentSaveTime"));

    v23 = *(_QWORD **)(a1 + 32);
  }
  v43 = v23[4];
  if (v43)
  {
    v44 = (void *)MEMORY[0x1E0CB37E8];
    v45 = (double)v43;
    v46 = _LSGetMachTimebase();
    objc_msgSend(v44, "numberWithDouble:", (double)v46 / (double)HIDWORD(v46) * v45 / 1000000000.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v47, CFSTR("cryptexContentScanTime"));

    v23 = *(_QWORD **)(a1 + 32);
  }
  v48 = v23[5];
  if (v48)
  {
    v49 = (void *)MEMORY[0x1E0CB37E8];
    v50 = (double)v48;
    v51 = _LSGetMachTimebase();
    objc_msgSend(v49, "numberWithDouble:", (double)v51 / (double)HIDWORD(v51) * v50 / 1000000000.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v52, CFSTR("containerizedContentScanTime"));

  }
  _LSDefaultLog();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v55 = v2;
    _os_log_impl(&dword_182882000, v53, OS_LOG_TYPE_DEFAULT, "Noting rebuild statistics: %@", buf, 0xCu);
  }

  ((void (*)(void *, void *))softLinkAnalyticsSendEvent[0])(CFSTR("com.apple.coreservices.DatabaseRebuildStatistics"), v2);
}

- (uint64_t)setOnlyCryptexContent:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 64) = a2;
  return result;
}

- (uint64_t)setMigratorRunning:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 65) = a2;
  return result;
}

- (uint64_t)setIsUserRequested:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 66) = a2;
  return result;
}

- (uint64_t)setRebuildReasonFlags:(uint64_t)result
{
  if (result)
    *(_WORD *)(result + 68) = a2;
  return result;
}

- (void)setRebuildError:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rebuildError, 0);
}

@end
