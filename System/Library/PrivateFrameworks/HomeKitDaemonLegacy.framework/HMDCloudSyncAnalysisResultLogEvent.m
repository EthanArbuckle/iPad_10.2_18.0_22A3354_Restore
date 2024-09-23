@implementation HMDCloudSyncAnalysisResultLogEvent

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.cloudSyncHomeData");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDCloudSyncAnalysisResultLogEvent *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;
  HMDCloudSyncAnalysisResultLogEvent *v46;
  unint64_t v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  uint64_t v63;
  void *v64;
  __objc2_class **p_superclass;
  unint64_t v66;
  void *v67;
  unint64_t v68;
  __objc2_class **v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  unint64_t v78;
  void *v79;
  unint64_t v80;
  unint64_t v81;
  void *v82;
  unint64_t v83;
  void *v84;
  unint64_t v85;
  unint64_t v86;
  void *v87;
  unint64_t v88;
  void *v89;
  unint64_t v90;
  unint64_t v91;
  void *v92;
  unint64_t v93;
  void *v94;
  unint64_t v95;
  unint64_t v96;
  void *v97;
  void *v98;
  void *v100;
  void *v101;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCloudSyncAnalysisResultLogEvent uploadMaximumDelayReached](self, "uploadMaximumDelayReached"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("uploadMaximumDelayReached"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent decryptionFailedCount](self, "decryptionFailedCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("decryptionFailedCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent incomingPushCount](self, "incomingPushCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("incomingPushCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent fetchCount](self, "fetchCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("fetchCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent fetchErrorCount](self, "fetchErrorCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("fetchErrorCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent legacyFetchCount](self, "legacyFetchCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("legacyFetchCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent legacyFetchErrorCount](self, "legacyFetchErrorCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("legacyFetchErrorCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent uploadCount](self, "uploadCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("uploadCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent legacyUploadCount](self, "legacyUploadCount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("legacyUploadCount"));

  -[HMDCloudSyncAnalysisResultLogEvent legacyUploadReasonCountMap](self, "legacyUploadReasonCountMap");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "keysSortedByValueUsingComparator:", &__block_literal_global_135485);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "count");
  if (v23 >= 3)
    v24 = 3;
  else
    v24 = v23;
  objc_msgSend(v22, "subarrayWithRange:", 0, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v100 = v25;
  if (objc_msgSend(v25, "count"))
  {
    v26 = 0;
    do
    {
      objc_msgSend(v25, "objectAtIndexedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v26 + 1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("topLegacyUploadReason%d"), v26 + 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, v29);

      -[HMDCloudSyncAnalysisResultLogEvent legacyUploadReasonCountMap](self, "legacyUploadReasonCountMap");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", v26);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = self;
      v34 = objc_msgSend(v32, "unsignedIntegerValue");

      +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v34;
      self = v33;
      v25 = v100;
      objc_msgSend(v35, "intervalIndexForValue:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("topLegacyUploadReasonCount%d"), v28);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, v38);

      v26 = v28;
    }
    while (objc_msgSend(v100, "count") > v28);
  }
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent uploadErrorCount](self, "uploadErrorCount"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("uploadErrorCount"));

  -[HMDCloudSyncAnalysisResultLogEvent uploadErrorCountMap](self, "uploadErrorCountMap");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "keysSortedByValueUsingComparator:", &__block_literal_global_77);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = objc_msgSend(v42, "count");
  if (v43 >= 3)
    v44 = 3;
  else
    v44 = v43;
  objc_msgSend(v42, "subarrayWithRange:", 0, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = self;
  v101 = v45;
  if (objc_msgSend(v45, "count"))
  {
    v47 = 0;
    do
    {
      objc_msgSend(v45, "objectAtIndexedSubscript:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v47 + 1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("topUploadError%d"), v47 + 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, v50);

      -[HMDCloudSyncAnalysisResultLogEvent uploadErrorCountMap](v46, "uploadErrorCountMap");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "objectAtIndexedSubscript:", v47);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "objectForKeyedSubscript:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "unsignedIntegerValue");

      +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "intervalIndexForValue:", v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("topUploadErrorCount%d"), v49);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, v57);

      v45 = v101;
      v47 = v49;
    }
    while (objc_msgSend(v101, "count") > v49);
  }
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "intervalIndexForValue:", -[HMDCloudSyncAnalysisResultLogEvent legacyUploadErrorCount](v46, "legacyUploadErrorCount"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("legacyUploadErrorCount"));

  -[HMDCloudSyncAnalysisResultLogEvent legacyUploadErrorCountMap](v46, "legacyUploadErrorCountMap");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "keysSortedByValueUsingComparator:", &__block_literal_global_84_135491);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = objc_msgSend(v61, "count");
  if (v62 >= 3)
    v63 = 3;
  else
    v63 = v62;
  objc_msgSend(v61, "subarrayWithRange:", 0, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v64, "count"))
  {
    p_superclass = HMDDoorbellChimeNotificationLogEvent.superclass;
    v66 = 0;
    do
    {
      objc_msgSend(v64, "objectAtIndexedSubscript:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v66 + 1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("topLegacyUploadError%d"), v66 + 1);
      v69 = p_superclass;
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, v70);

      -[HMDCloudSyncAnalysisResultLogEvent legacyUploadErrorCountMap](v46, "legacyUploadErrorCountMap");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectAtIndexedSubscript:", v66);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "objectForKeyedSubscript:", v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "unsignedIntegerValue");

      p_superclass = v69;
      objc_msgSend(v69 + 59, "lowVolumeHistogram");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "intervalIndexForValue:", v74);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("topLegacyUploadErrorCount%d"), v68);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, v77);

      v66 = v68;
    }
    while (objc_msgSend(v64, "count") > v68);
  }
  v78 = -[HMDCloudSyncAnalysisResultLogEvent bytesFetched](v46, "bytesFetched");
  v79 = (void *)MEMORY[0x1E0CB37E8];
  v80 = -[HMDCloudSyncAnalysisResultLogEvent bytesFetched](v46, "bytesFetched");
  if (v78 >> 21 <= 2)
    v81 = v80 >> 20;
  else
    v81 = v80 / 0x500000 + 5;
  objc_msgSend(v79, "numberWithUnsignedInteger:", v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v82, CFSTR("bytesFetched"));

  v83 = -[HMDCloudSyncAnalysisResultLogEvent bytesPushed](v46, "bytesPushed");
  v84 = (void *)MEMORY[0x1E0CB37E8];
  v85 = -[HMDCloudSyncAnalysisResultLogEvent bytesPushed](v46, "bytesPushed");
  if (v83 > 0x5FFFFF)
    v86 = v85 / 0x500000 + 5;
  else
    v86 = v85 >> 20;
  objc_msgSend(v84, "numberWithUnsignedInteger:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v87, CFSTR("bytesPushed"));

  v88 = -[HMDCloudSyncAnalysisResultLogEvent legacyBytesFetched](v46, "legacyBytesFetched");
  v89 = (void *)MEMORY[0x1E0CB37E8];
  v90 = -[HMDCloudSyncAnalysisResultLogEvent legacyBytesFetched](v46, "legacyBytesFetched");
  if (v88 > 0x5FFFFF)
    v91 = v90 / 0x500000 + 5;
  else
    v91 = v90 >> 20;
  objc_msgSend(v89, "numberWithUnsignedInteger:", v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v92, CFSTR("legacyBytesFetched"));

  v93 = -[HMDCloudSyncAnalysisResultLogEvent legacyBytesPushed](v46, "legacyBytesPushed");
  v94 = (void *)MEMORY[0x1E0CB37E8];
  v95 = -[HMDCloudSyncAnalysisResultLogEvent legacyBytesPushed](v46, "legacyBytesPushed");
  if (v93 > 0x5FFFFF)
    v96 = v95 / 0x500000 + 5;
  else
    v96 = v95 >> 20;
  objc_msgSend(v94, "numberWithUnsignedInteger:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v97, CFSTR("legacyBytesPushed"));

  v98 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v98;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (BOOL)uploadMaximumDelayReached
{
  return self->_uploadMaximumDelayReached;
}

- (void)setUploadMaximumDelayReached:(BOOL)a3
{
  self->_uploadMaximumDelayReached = a3;
}

- (BOOL)lastDecryptionFailed
{
  return self->_lastDecryptionFailed;
}

- (void)setLastDecryptionFailed:(BOOL)a3
{
  self->_lastDecryptionFailed = a3;
}

- (unint64_t)incomingPushCount
{
  return self->_incomingPushCount;
}

- (void)setIncomingPushCount:(unint64_t)a3
{
  self->_incomingPushCount = a3;
}

- (unint64_t)fetchCount
{
  return self->_fetchCount;
}

- (void)setFetchCount:(unint64_t)a3
{
  self->_fetchCount = a3;
}

- (unint64_t)legacyFetchCount
{
  return self->_legacyFetchCount;
}

- (void)setLegacyFetchCount:(unint64_t)a3
{
  self->_legacyFetchCount = a3;
}

- (unint64_t)fetchErrorCount
{
  return self->_fetchErrorCount;
}

- (void)setFetchErrorCount:(unint64_t)a3
{
  self->_fetchErrorCount = a3;
}

- (unint64_t)legacyFetchErrorCount
{
  return self->_legacyFetchErrorCount;
}

- (void)setLegacyFetchErrorCount:(unint64_t)a3
{
  self->_legacyFetchErrorCount = a3;
}

- (unint64_t)uploadCount
{
  return self->_uploadCount;
}

- (void)setUploadCount:(unint64_t)a3
{
  self->_uploadCount = a3;
}

- (unint64_t)legacyUploadCount
{
  return self->_legacyUploadCount;
}

- (void)setLegacyUploadCount:(unint64_t)a3
{
  self->_legacyUploadCount = a3;
}

- (unint64_t)uploadErrorCount
{
  return self->_uploadErrorCount;
}

- (void)setUploadErrorCount:(unint64_t)a3
{
  self->_uploadErrorCount = a3;
}

- (unint64_t)legacyUploadErrorCount
{
  return self->_legacyUploadErrorCount;
}

- (void)setLegacyUploadErrorCount:(unint64_t)a3
{
  self->_legacyUploadErrorCount = a3;
}

- (unint64_t)decryptionFailedCount
{
  return self->_decryptionFailedCount;
}

- (void)setDecryptionFailedCount:(unint64_t)a3
{
  self->_decryptionFailedCount = a3;
}

- (unint64_t)bytesFetched
{
  return self->_bytesFetched;
}

- (void)setBytesFetched:(unint64_t)a3
{
  self->_bytesFetched = a3;
}

- (unint64_t)bytesPushed
{
  return self->_bytesPushed;
}

- (void)setBytesPushed:(unint64_t)a3
{
  self->_bytesPushed = a3;
}

- (unint64_t)legacyBytesFetched
{
  return self->_legacyBytesFetched;
}

- (void)setLegacyBytesFetched:(unint64_t)a3
{
  self->_legacyBytesFetched = a3;
}

- (unint64_t)legacyBytesPushed
{
  return self->_legacyBytesPushed;
}

- (void)setLegacyBytesPushed:(unint64_t)a3
{
  self->_legacyBytesPushed = a3;
}

- (NSDictionary)legacyUploadReasonCountMap
{
  return self->_legacyUploadReasonCountMap;
}

- (void)setLegacyUploadReasonCountMap:(id)a3
{
  objc_storeStrong((id *)&self->_legacyUploadReasonCountMap, a3);
}

- (NSDictionary)uploadErrorCountMap
{
  return self->_uploadErrorCountMap;
}

- (void)setUploadErrorCountMap:(id)a3
{
  objc_storeStrong((id *)&self->_uploadErrorCountMap, a3);
}

- (NSDictionary)legacyUploadErrorCountMap
{
  return self->_legacyUploadErrorCountMap;
}

- (void)setLegacyUploadErrorCountMap:(id)a3
{
  objc_storeStrong((id *)&self->_legacyUploadErrorCountMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyUploadErrorCountMap, 0);
  objc_storeStrong((id *)&self->_uploadErrorCountMap, 0);
  objc_storeStrong((id *)&self->_legacyUploadReasonCountMap, 0);
}

uint64_t __66__HMDCloudSyncAnalysisResultLogEvent_coreAnalyticsEventDictionary__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __66__HMDCloudSyncAnalysisResultLogEvent_coreAnalyticsEventDictionary__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __66__HMDCloudSyncAnalysisResultLogEvent_coreAnalyticsEventDictionary__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

@end
