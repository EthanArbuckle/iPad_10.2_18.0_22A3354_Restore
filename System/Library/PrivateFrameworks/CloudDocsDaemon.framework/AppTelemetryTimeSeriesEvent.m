@implementation AppTelemetryTimeSeriesEvent

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a4;
  -[AppTelemetryTimeSeriesEvent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sqliteBind:index:", a3, v4);

}

+ (id)newFromSqliteValue:(sqlite3_value *)a3
{
  id v4;
  void *v5;
  void *v6;

  if (sqlite3_value_type(a3) != 4)
    return 0;
  v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "newFromSqliteValue:", a3);
  v6 = (void *)objc_msgSend(v4, "initWithData:", v5);

  return v6;
}

+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  if (sqlite3_column_type(a3, a4) != 4)
    return 0;
  v6 = objc_alloc((Class)objc_opt_class());
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "newFromSqliteStatement:atIndex:", a3, v4);
  v8 = (void *)objc_msgSend(v6, "initWithData:", v7);

  return v8;
}

+ (id)newTelemetryEventInZoneWithMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4
{
  return (id)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", a3, a4, 0, 0, 0);
}

+ (id)newTelemetryEventInZoneWithMangledID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", v4, objc_msgSend(v5, "supportsEnhancedDrivePrivacy"), 0, 0, 0);

  return v6;
}

+ (id)newTelemetryEventInZoneWithMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 fromError:(id)a5 errorDescription:(id)a6 itemIDString:(id)a7
{
  _BOOL8 v9;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v9 = a4;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a3;
  objc_msgSend(v12, "numberWithBool:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(a1, "_newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:error:errorDescription:itemIDString:", v16, v17, v15, v14, v13);

  return v18;
}

+ (id)_newTelemetryEventInZoneWithMangledID:(id)a3 enhancedDrivePrivacyEnabled:(id)a4 error:(id)a5 errorDescription:(id)a6 itemIDString:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  AppTelemetryTimeSeriesEvent *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_alloc_init(AppTelemetryTimeSeriesEvent);
  -[AppTelemetryTimeSeriesEvent setTimestamp:](v16, "setTimestamp:", time(0));
  if (!v11 && !v13 && !v14)
  {
    v17 = 0;
    v18 = 0;
    if (!v15)
      goto LABEL_18;
  }
  v18 = (void *)objc_opt_new();
  -[AppTelemetryTimeSeriesEvent setInvestigation:](v16, "setInvestigation:", v18);
  if (v11)
  {
    objc_msgSend(v11, "appLibraryOrZoneName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dataUsingEncoding:", 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setZoneName:", v20);

    objc_msgSend(v18, "setSharedZone:", objc_msgSend(v11, "isShared"));
  }
  if (v13)
  {
    objc_msgSend(v13, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setErrorDomain:", v21);

    objc_msgSend(v18, "setErrorCode:", objc_msgSend(v13, "code"));
    if (v14)
      goto LABEL_14;
    objc_msgSend(v13, "brc_cloudKitErrorMessage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24 = v22;
    }
    else
    {
      objc_msgSend(v13, "br_errorDescription");
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v24;

  }
  if (v14)
  {
LABEL_14:
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "telemetryErrorDescriptionMaxLength");

    if (objc_msgSend(v14, "length") > v26)
    {
      objc_msgSend(v14, "substringToIndex:", v26);
      v27 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v27;
    }
    objc_msgSend(v18, "setErrorDescription:", v14);
    v17 = v14;
    if (v15)
      goto LABEL_17;
    goto LABEL_18;
  }
  v17 = 0;
  if (v15)
LABEL_17:
    objc_msgSend(v18, "setItemID:", v15);
LABEL_18:
  if (v12)
    objc_msgSend(v18, "setIsEnhancedDrivePrivacyEnabled:", objc_msgSend(v12, "BOOLValue"));

  return v16;
}

+ (id)newSyncUpBackoffRatioSummaryEventWithNumberOfFailedZones:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 30);
  objc_msgSend(v4, "setMagnitudeInt:", v3);
  return v4;
}

+ (id)newSyncUpBackoffDelaySummaryEventWithNumberOfFailedZones:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 31);
  objc_msgSend(v4, "setMagnitudeInt:", v3);
  return v4;
}

+ (id)newFolderSharingCountMismatchEventWithCount:(int)a3 zoneMangledID:(id)a4 enhancedDrivePrivacyEnabled:(BOOL)a5
{
  uint64_t v5;
  void *v6;

  v5 = *(_QWORD *)&a3;
  v6 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:", a4, a5);
  objc_msgSend(v6, "setTelemetrySchema:", 2);
  objc_msgSend(v6, "setMagnitudeInt:", v5);
  return v6;
}

+ (id)newMissingPushEventWithNumberOutOfSync:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 3);
  objc_msgSend(v4, "setMagnitudeInt:", v3);
  return v4;
}

+ (id)newPermanentlyInconsistentEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:", a3, a4);
  objc_msgSend(v4, "setTelemetrySchema:", 4);
  objc_msgSend(v4, "setMagnitudeBool:", 1);
  return v4;
}

+ (id)newTestMetricEventWithMagnitude:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc(MEMORY[0x1E0D10E88]);
  v6 = (void *)objc_msgSend(v5, "initWithZoneName:ownerName:", CFSTR("com.apple.testZone"), *MEMORY[0x1E0C94730]);
  v7 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", v6);
  objc_msgSend(v7, "setTelemetrySchema:", 6);
  objc_msgSend(v7, "setMagnitudeInt:", v3);

  return v7;
}

+ (id)newShareAliasInSharedFolderEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:", a3, a4);
  objc_msgSend(v4, "setTelemetrySchema:", 7);
  objc_msgSend(v4, "setMagnitudeBool:", 1);
  return v4;
}

+ (id)newZoneResetEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 lastSyncDate:(id)a5 error:(id)a6 errorDescription:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;

  v9 = a4;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  v15 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", v14, v9, a6, v12, 0);
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "benignTelemetryErrorDescriptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v12 && (objc_msgSend(v17, "containsObject:", v12) & 1) != 0)
    v19 = 9;
  else
    v19 = 8;
  objc_msgSend(v15, "setTelemetrySchema:", v19);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceDate:", v13);
  v22 = v21;

  objc_msgSend(v15, "setMagnitudeDouble:", v22);
  return v15;
}

+ (id)newDBResetEventWithError:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", 0, objc_msgSend(v8, "supportsEnhancedDrivePrivacy"), v7, v6, 0);

  objc_msgSend(v9, "setTelemetrySchema:", 10);
  objc_msgSend(v9, "setMagnitudeInt:", 1);
  return v9;
}

+ (id)newMissingApplyJobEventWithNumberMissing:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 11);
  objc_msgSend(v4, "setMagnitudeInt:", v3);
  return v4;
}

+ (id)newMissingSyncUpJobEventWithNumberMissing:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 12);
  objc_msgSend(v4, "setMagnitudeInt:", v3);
  return v4;
}

+ (id)newMissingUploaderJobEventWithNumberMissing:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 14);
  objc_msgSend(v4, "setMagnitudeInt:", v3);
  return v4;
}

+ (id)newMissingReaderJobEventWithNumberMissing:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 13);
  objc_msgSend(v4, "setMagnitudeInt:", v3);
  return v4;
}

+ (id)newMissingDownloaderJobEventWithNumberMissing:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 15);
  objc_msgSend(v4, "setMagnitudeInt:", v3);
  return v4;
}

+ (id)newCorruptPackageDownloadEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 error:(id)a5 itemIDString:(id)a6
{
  void *v6;

  v6 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", a3, a4, a5, 0, a6);
  objc_msgSend(v6, "setTelemetrySchema:", 21);
  objc_msgSend(v6, "setMagnitudeInt:", 1);
  return v6;
}

+ (id)newChainedDirectoryMissingChainPCSEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5
{
  void *v5;

  v5 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", a3, a4, 0, 0, a5);
  objc_msgSend(v5, "setTelemetrySchema:", 22);
  objc_msgSend(v5, "setMagnitudeInt:", 1);
  return v5;
}

+ (id)newFolderSharePCSChainingEventWithTime:(double)a3 zoneMangledID:(id)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 itemIDString:(id)a6 error:(id)a7 errorDescription:(id)a8
{
  void *v9;

  v9 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", a4, a5, a7, a8, a6);
  objc_msgSend(v9, "setTelemetrySchema:", 17);
  objc_msgSend(v9, "setMagnitudeDouble:", a3);
  return v9;
}

+ (id)newShareAcceptationEventWithLastStep:(id)a3 zoneMangledID:(id)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 itemIDString:(id)a6 error:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a5;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v12, "brc_cloudKitErrorMessage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", v14, v8, v12, v16, v13);

  objc_msgSend(v17, "setTelemetrySchema:", 18);
  objc_msgSend(v17, "investigation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLastStep:", v15);

  objc_msgSend(v17, "setMagnitudeInt:", 1);
  return v17;
}

+ (id)newSyncBoostingProblemCountWithProblemCount:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 23);
  objc_msgSend(v4, "setMagnitudeInt:", v3);
  return v4;
}

+ (id)newCorruptSharingOptionsProblemWithProblemCount:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 34);
  objc_msgSend(v4, "setMagnitudeInt:", v3);
  return v4;
}

+ (id)newContentPolicyProblemCountWithProblemCount:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 35);
  objc_msgSend(v4, "setMagnitudeInt:", v3);
  return v4;
}

+ (id)newBasehashSaltingProblemCountWithProblemCount:(int)a3 mangledID:(id)a4 itemIDString:(id)a5
{
  uint64_t v5;
  void *v6;

  v5 = *(_QWORD *)&a3;
  v6 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", a4, 1, 0, 0, a5);
  objc_msgSend(v6, "setTelemetrySchema:", 36);
  objc_msgSend(v6, "setMagnitudeInt:", v5);
  return v6;
}

+ (id)newEDPKeysMismatchForRecordID:(id)a3 mangledID:(id)a4
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", a4, 1, 0, 0, a3);
  objc_msgSend(v4, "setTelemetrySchema:", 37);
  return v4;
}

+ (id)newDanglingZombieProblemCountWithProblemCount:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 40);
  objc_msgSend(v4, "setMagnitudeInt:", v3);
  return v4;
}

+ (id)newFSEventToSyncUpEventWithDuration:(double)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 19);
  objc_msgSend(v4, "setMagnitudeDouble:", a3);
  return v4;
}

+ (id)newUserDownloadEventWithDuration:(double)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 20);
  objc_msgSend(v4, "setMagnitudeDouble:", a3);
  return v4;
}

+ (id)newDeepScanEventWithReason:(id)a3 appLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v8, "setTelemetrySchema:", 24);
  objc_msgSend(v8, "setMagnitudeInt:", 1);
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "investigation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setZoneName:", v9);

  objc_msgSend(v8, "investigation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setReason:", v7);

  return v8;
}

+ (id)newOperationTimedOutEventWithTime:(double)a3 type:(id)a4 nonDiscretionary:(BOOL)a5 hasForegroundClients:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v11, "setTelemetrySchema:", 25);
  objc_msgSend(v11, "setMagnitudeDouble:", a3);
  objc_msgSend(v11, "investigation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setOperationType:", v10);

  objc_msgSend(v11, "investigation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNonDiscretionary:", v7);

  objc_msgSend(v11, "investigation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHasForegroundClients:", v6);

  return v11;
}

+ (id)newQBSOperationPrformanceEventWithTime:(double)a3 type:(id)a4 recordsFetched:(unint64_t)a5 recordsFetchedTotalMetadataSize:(unint64_t)a6 xattrsFetchedTotalSize:(unint64_t)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v12 = a4;
  v13 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v13, "setTelemetrySchema:", 32);
  objc_msgSend(v13, "setMagnitudeDouble:", (double)(a7 + a6) / a3);
  objc_msgSend(v13, "investigation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "qbsPerformance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setOperationType:", v12);

  objc_msgSend(v13, "investigation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "qbsPerformance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRecordsFetched:", a5);

  objc_msgSend(v13, "investigation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "qbsPerformance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setRecordsFetchedTotalMetadataSize:", a6);

  objc_msgSend(v13, "investigation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "qbsPerformance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setXattrsFetchedTotalSize:", a7);

  return v13;
}

+ (id)newFileBouncedManyTimes
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v2, "setTelemetrySchema:", 29);
  objc_msgSend(v2, "setMagnitudeInt:", 1);
  return v2;
}

+ (id)newFullyConsistentEvent
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v2, "setTelemetrySchema:", 100);
  objc_msgSend(v2, "setMagnitudeInt:", 1);
  return v2;
}

+ (id)newFileChecksumMismatchEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5
{
  void *v5;

  v5 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", a3, a4, 0, 0, a5);
  objc_msgSend(v5, "setTelemetrySchema:", 101);
  objc_msgSend(v5, "setMagnitudeInt:", 1);
  return v5;
}

+ (id)newPackageChecksumMismatchEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5
{
  void *v5;

  v5 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", a3, a4, 0, 0, a5);
  objc_msgSend(v5, "setTelemetrySchema:", 102);
  objc_msgSend(v5, "setMagnitudeInt:", 1);
  return v5;
}

+ (id)newFileReadErrorWithError:(id)a3 zoneMangledID:(id)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 itemIDString:(id)a6
{
  void *v6;

  v6 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", a4, a5, a3, 0, a6);
  objc_msgSend(v6, "setTelemetrySchema:", 108);
  objc_msgSend(v6, "setMagnitudeInt:", 1);
  return v6;
}

+ (id)newChildCountMismatchEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5 magnitude:(int)a6
{
  uint64_t v6;
  void *v7;

  v6 = *(_QWORD *)&a6;
  v7 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", a3, a4, 0, 0, a5);
  objc_msgSend(v7, "setTelemetrySchema:", 103);
  objc_msgSend(v7, "setMagnitudeInt:", v6);
  return v7;
}

+ (id)newRecursiveItemCountMismatchEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5 magnitude:(int)a6
{
  uint64_t v6;
  void *v7;

  v6 = *(_QWORD *)&a6;
  v7 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", a3, a4, 0, 0, a5);
  objc_msgSend(v7, "setTelemetrySchema:", 104);
  objc_msgSend(v7, "setMagnitudeInt:", v6);
  return v7;
}

+ (id)newShareAliasCountMismatchEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5 magnitude:(int)a6
{
  uint64_t v6;
  void *v7;

  v6 = *(_QWORD *)&a6;
  v7 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", a3, a4, 0, 0, a5);
  objc_msgSend(v7, "setTelemetrySchema:", 105);
  objc_msgSend(v7, "setMagnitudeInt:", v6);
  return v7;
}

+ (id)newShareCountMismatchEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5 magnitude:(int)a6
{
  uint64_t v6;
  void *v7;

  v6 = *(_QWORD *)&a6;
  v7 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", a3, a4, 0, 0, a5);
  objc_msgSend(v7, "setTelemetrySchema:", 106);
  objc_msgSend(v7, "setMagnitudeInt:", v6);
  return v7;
}

+ (id)newMissingShareAliasEventWithZoneMangledID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 itemIDString:(id)a5
{
  void *v5;

  v5 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", a3, a4, 0, 0, a5);
  objc_msgSend(v5, "setTelemetrySchema:", 26);
  objc_msgSend(v5, "setMagnitudeInt:", 1);
  return v5;
}

+ (id)newConsistencyCheckerFailedEvent
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v2, "setTelemetrySchema:", 107);
  objc_msgSend(v2, "setMagnitudeInt:", 1);
  return v2;
}

+ (id)newCATotalErrorCountEventWithCount:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 200);
  objc_msgSend(v4, "setMagnitudeInt:", v3);
  return v4;
}

+ (id)newCASyncUpZoneErrorCountEventWithCount:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 204);
  objc_msgSend(v4, "setMagnitudeInt:", v3);
  return v4;
}

+ (id)newCASyncDownErrorCountEventWithCount:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 205);
  objc_msgSend(v4, "setMagnitudeInt:", v3);
  return v4;
}

+ (id)newCASyncUpItemErrorCountEventWithCount:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 203);
  objc_msgSend(v4, "setMagnitudeInt:", v3);
  return v4;
}

+ (id)newCAUploadErrorCountEventWithCount:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 201);
  objc_msgSend(v4, "setMagnitudeInt:", v3);
  return v4;
}

+ (id)newCADownloadErrorCountEventWithCount:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:", 0);
  objc_msgSend(v4, "setTelemetrySchema:", 202);
  objc_msgSend(v4, "setMagnitudeInt:", v3);
  return v4;
}

+ (id)newCASyncUpZoneErrorEventWithError:(id)a3 pcsChained:(BOOL)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 zoneMangledID:(id)a6
{
  _BOOL8 v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", a6, a5, a3, 0, 0);
  objc_msgSend(v7, "setTelemetrySchema:", 213);
  objc_msgSend(v7, "setMagnitudeInt:", 1);
  objc_msgSend(v7, "investigation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsPCSChained:", v6);

  return v7;
}

+ (id)newCASyncDownErrorEventWithError:(id)a3 pcsChained:(BOOL)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 zoneMangledID:(id)a6
{
  _BOOL8 v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", a6, a5, a3, 0, 0);
  objc_msgSend(v7, "setTelemetrySchema:", 214);
  objc_msgSend(v7, "setMagnitudeInt:", 1);
  objc_msgSend(v7, "investigation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsPCSChained:", v6);

  return v7;
}

+ (id)newCAUploadErrorEventWithError:(id)a3 pcsChained:(BOOL)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 sharedZone:(BOOL)a6 count:(int)a7
{
  uint64_t v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = *(_QWORD *)&a7;
  v8 = a6;
  v9 = a4;
  v10 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", 0, a5, a3, 0, 0);
  objc_msgSend(v10, "setTelemetrySchema:", 210);
  objc_msgSend(v10, "setMagnitudeInt:", v7);
  objc_msgSend(v10, "investigation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsPCSChained:", v9);

  objc_msgSend(v10, "investigation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSharedZone:", v8);

  return v10;
}

+ (id)newCADownloadErrorEventWithError:(id)a3 pcsChained:(BOOL)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 sharedZone:(BOOL)a6 count:(int)a7
{
  uint64_t v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = *(_QWORD *)&a7;
  v8 = a6;
  v9 = a4;
  v10 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", 0, a5, a3, 0, 0);
  objc_msgSend(v10, "setTelemetrySchema:", 211);
  objc_msgSend(v10, "setMagnitudeInt:", v7);
  objc_msgSend(v10, "investigation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsPCSChained:", v9);

  objc_msgSend(v10, "investigation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSharedZone:", v8);

  return v10;
}

+ (id)newCASyncUpItemErrorEventWithError:(id)a3 pcsChained:(BOOL)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 sharedZone:(BOOL)a6 count:(int)a7
{
  uint64_t v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = *(_QWORD *)&a7;
  v8 = a6;
  v9 = a4;
  v10 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", 0, a5, a3, 0, 0);
  objc_msgSend(v10, "setTelemetrySchema:", 212);
  objc_msgSend(v10, "setMagnitudeInt:", v7);
  objc_msgSend(v10, "investigation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsPCSChained:", v9);

  objc_msgSend(v10, "investigation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSharedZone:", v8);

  return v10;
}

+ (id)newMissingAssetContentEventWithRecordID:(id)a3 enhancedDrivePrivacyEnabled:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E0D10E88];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v7, "zoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithRecordZoneID:", v9);

  objc_msgSend(v7, "recordName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(a1, "newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:fromError:errorDescription:itemIDString:", v10, v4, 0, 0, v11);
  objc_msgSend(v12, "setTelemetrySchema:", 27);
  objc_msgSend(v12, "setMagnitudeInt:", 1);

  return v12;
}

+ (id)newQBSDirFaultsCountEvent:(unint64_t)a3 serverTruthDirFaultCount:(unint64_t)a4 serverTruthDirCount:(unint64_t)a5 timeSinceLogin:(unint64_t)a6 serverTruthTotalItemsCount:(unint64_t)a7 zonesNeverFullSync:(unint64_t)a8
{
  AppTelemetryTimeSeriesEvent *v14;
  AppTelemetryInvestigation *v15;
  AppTelemetryQBSInvestigation *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;

  v14 = objc_alloc_init(AppTelemetryTimeSeriesEvent);
  v15 = objc_alloc_init(AppTelemetryInvestigation);
  -[AppTelemetryTimeSeriesEvent setInvestigation:](v14, "setInvestigation:", v15);

  v16 = objc_alloc_init(AppTelemetryQBSInvestigation);
  -[AppTelemetryTimeSeriesEvent investigation](v14, "investigation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setQbsInvestigation:", v16);

  -[AppTelemetryTimeSeriesEvent setTelemetrySchema:](v14, "setTelemetrySchema:", 28);
  -[AppTelemetryTimeSeriesEvent setTimestamp:](v14, "setTimestamp:", time(0));
  -[AppTelemetryTimeSeriesEvent investigation](v14, "investigation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "qbsInvestigation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setClientTruthDirFaultCount:", a3);

  -[AppTelemetryTimeSeriesEvent investigation](v14, "investigation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "qbsInvestigation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setServerTruthDirFaultCount:", a4);

  -[AppTelemetryTimeSeriesEvent investigation](v14, "investigation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "qbsInvestigation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setServerTruthDirCount:", a5);

  -[AppTelemetryTimeSeriesEvent investigation](v14, "investigation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "qbsInvestigation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTimeSinceLogin:", a6);

  -[AppTelemetryTimeSeriesEvent investigation](v14, "investigation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "qbsInvestigation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setServerTruthTotalItemsCount:", a7);

  if (a8)
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "qbsExpectedItemsFetchedPerInterval");
    objc_msgSend(v28, "qbsExpectedItemsFetchedCheckInterval");
    if (v29 * (unint64_t)((double)a6 / v30) > a7)
      v31 = a8;
    else
      v31 = -(int)a8;
    -[AppTelemetryTimeSeriesEvent setMagnitudeInt:](v14, "setMagnitudeInt:", v31);

  }
  else
  {
    -[AppTelemetryTimeSeriesEvent setMagnitudeInt:](v14, "setMagnitudeInt:", 0);
  }
  return v14;
}

- (void)_populateUUID:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = -[AppTelemetryTimeSeriesEvent telemetrySchema](self, "telemetrySchema");
  -[AppTelemetryTimeSeriesEvent investigation](self, "investigation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 < 0x190)
    objc_msgSend(v6, "setEventGroupUUID:", v4);
  else
    objc_msgSend(v6, "setMigrationUUID:", v4);

}

+ (id)newIntEvent:(int)a3 UUID:(id)a4 value:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  AppTelemetryTimeSeriesEvent *v8;
  AppTelemetryInvestigation *v9;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = objc_alloc_init(AppTelemetryTimeSeriesEvent);
  v9 = objc_alloc_init(AppTelemetryInvestigation);
  -[AppTelemetryTimeSeriesEvent setInvestigation:](v8, "setInvestigation:", v9);

  -[AppTelemetryTimeSeriesEvent setTelemetrySchema:](v8, "setTelemetrySchema:", v6);
  -[AppTelemetryTimeSeriesEvent setMagnitudeInt:](v8, "setMagnitudeInt:", v5);
  -[AppTelemetryTimeSeriesEvent setTimestamp:](v8, "setTimestamp:", time(0));
  -[AppTelemetryTimeSeriesEvent _populateUUID:](v8, "_populateUUID:", v7);

  return v8;
}

+ (id)newLongEvent:(int)a3 UUID:(id)a4 value:(int64_t)a5
{
  uint64_t v6;
  id v7;
  void *v8;

  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = (void *)objc_msgSend((id)objc_opt_class(), "newLongEvent:UUID:value:round:", v6, v7, a5, 0);

  return v8;
}

+ (id)newLongEvent:(int)a3 UUID:(id)a4 value:(int64_t)a5 round:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v8;
  id v9;
  void *v10;
  AppTelemetryTimeSeriesEvent *v11;
  AppTelemetryInvestigation *v12;

  v6 = a6;
  v8 = *(_QWORD *)&a3;
  v9 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    a5 = objc_msgSend(v10, "br_roundedLongLongValue");

  }
  v11 = objc_alloc_init(AppTelemetryTimeSeriesEvent);
  v12 = objc_alloc_init(AppTelemetryInvestigation);
  -[AppTelemetryTimeSeriesEvent setInvestigation:](v11, "setInvestigation:", v12);

  -[AppTelemetryTimeSeriesEvent setTelemetrySchema:](v11, "setTelemetrySchema:", v8);
  -[AppTelemetryTimeSeriesEvent setMagnitudeLong:](v11, "setMagnitudeLong:", a5);
  -[AppTelemetryTimeSeriesEvent setTimestamp:](v11, "setTimestamp:", time(0));
  -[AppTelemetryTimeSeriesEvent _populateUUID:](v11, "_populateUUID:", v9);

  return v11;
}

+ (id)newDoubleEvent:(int)a3 eventGroupUUID:(id)a4 value:(double)a5
{
  uint64_t v6;
  id v7;
  AppTelemetryTimeSeriesEvent *v8;
  AppTelemetryInvestigation *v9;
  void *v10;

  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = objc_alloc_init(AppTelemetryTimeSeriesEvent);
  v9 = objc_alloc_init(AppTelemetryInvestigation);
  -[AppTelemetryTimeSeriesEvent setInvestigation:](v8, "setInvestigation:", v9);

  -[AppTelemetryTimeSeriesEvent setTelemetrySchema:](v8, "setTelemetrySchema:", v6);
  -[AppTelemetryTimeSeriesEvent setMagnitudeDouble:](v8, "setMagnitudeDouble:", a5);
  -[AppTelemetryTimeSeriesEvent setTimestamp:](v8, "setTimestamp:", time(0));
  -[AppTelemetryTimeSeriesEvent investigation](v8, "investigation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEventGroupUUID:", v7);

  return v8;
}

+ (id)newBoolEvent:(int)a3 eventGroupUUID:(id)a4 value:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v7;
  AppTelemetryTimeSeriesEvent *v8;
  AppTelemetryInvestigation *v9;
  void *v10;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = objc_alloc_init(AppTelemetryTimeSeriesEvent);
  v9 = objc_alloc_init(AppTelemetryInvestigation);
  -[AppTelemetryTimeSeriesEvent setInvestigation:](v8, "setInvestigation:", v9);

  -[AppTelemetryTimeSeriesEvent setTelemetrySchema:](v8, "setTelemetrySchema:", v6);
  -[AppTelemetryTimeSeriesEvent setMagnitudeBool:](v8, "setMagnitudeBool:", v5);
  -[AppTelemetryTimeSeriesEvent setTimestamp:](v8, "setTimestamp:", time(0));
  -[AppTelemetryTimeSeriesEvent investigation](v8, "investigation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEventGroupUUID:", v7);

  return v8;
}

+ (id)newNSErrorEvent:(int)a3 eventGroupUUID:(id)a4 value:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  AppTelemetryTimeSeriesEvent *v9;
  AppTelemetryInvestigation *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = *(_QWORD *)&a3;
  v7 = a5;
  v8 = a4;
  v9 = objc_alloc_init(AppTelemetryTimeSeriesEvent);
  v10 = objc_alloc_init(AppTelemetryInvestigation);
  -[AppTelemetryTimeSeriesEvent setInvestigation:](v9, "setInvestigation:", v10);

  -[AppTelemetryTimeSeriesEvent setTelemetrySchema:](v9, "setTelemetrySchema:", v6);
  -[AppTelemetryTimeSeriesEvent setMagnitudeInt:](v9, "setMagnitudeInt:", 1);
  -[AppTelemetryTimeSeriesEvent setTimestamp:](v9, "setTimestamp:", time(0));
  objc_msgSend(v7, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryTimeSeriesEvent investigation](v9, "investigation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setErrorDomain:", v11);

  v13 = objc_msgSend(v7, "code");
  -[AppTelemetryTimeSeriesEvent investigation](v9, "investigation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setErrorCode:", v13);

  objc_msgSend(v7, "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[AppTelemetryTimeSeriesEvent investigation](v9, "investigation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setErrorDescription:", v15);

  -[AppTelemetryTimeSeriesEvent investigation](v9, "investigation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEventGroupUUID:", v8);

  return v9;
}

+ (id)newTimestampEvent:(int)a3 eventGroupUUID:(id)a4 value:(unint64_t)a5
{
  uint64_t v6;
  id v7;
  AppTelemetryTimeSeriesEvent *v8;
  AppTelemetryInvestigation *v9;
  void *v10;

  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = objc_alloc_init(AppTelemetryTimeSeriesEvent);
  v9 = objc_alloc_init(AppTelemetryInvestigation);
  -[AppTelemetryTimeSeriesEvent setInvestigation:](v8, "setInvestigation:", v9);

  -[AppTelemetryTimeSeriesEvent setTelemetrySchema:](v8, "setTelemetrySchema:", v6);
  -[AppTelemetryTimeSeriesEvent setMagnitudeInt:](v8, "setMagnitudeInt:", 1);
  -[AppTelemetryTimeSeriesEvent setTimestamp:](v8, "setTimestamp:", a5);
  -[AppTelemetryTimeSeriesEvent investigation](v8, "investigation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEventGroupUUID:", v7);

  return v8;
}

+ (id)nonMigratedItemInvestigationWithFoundInfo:(id)a3
{
  id v3;
  AppTelemetryFPFSMigrationNonMigratedItemInvestigation *v4;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  AppTelemetryFPFSMigrationNonMigratedItemInvestigation *v135;

  v3 = a3;
  v4 = objc_alloc_init(AppTelemetryFPFSMigrationNonMigratedItemInvestigation);
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA868]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setItemNumber:](v4, "setItemNumber:", objc_msgSend(v5, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA8A0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setStMode:](v4, "setStMode:", objc_msgSend(v7, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA830]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setStFlags:](v4, "setStFlags:", objc_msgSend(v9, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA880]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setHasMoreLinks:](v4, "setHasMoreLinks:", objc_msgSend(v11, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA890]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setHasAcls:](v4, "setHasAcls:", objc_msgSend(v13, "BOOLValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA8B0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setParentHasAcls:](v4, "setParentHasAcls:", objc_msgSend(v15, "BOOLValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA850]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDataProtectionClass:](v4, "setDataProtectionClass:", objc_msgSend(v17, "intValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA888]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setIsUnderDirStatFolder:](v4, "setIsUnderDirStatFolder:", objc_msgSend(v19, "BOOLValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA860]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setStatDocID:](v4, "setStatDocID:", objc_msgSend(v21, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA898]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setStatLogicalSize:](v4, "setStatLogicalSize:", objc_msgSend(v23, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA8B8]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setStatPhysicalSize:](v4, "setStatPhysicalSize:", objc_msgSend(v25, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA858]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setStatDirEntryCount:](v4, "setStatDirEntryCount:", objc_msgSend(v27, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA8C8]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setIsOwnedByLoggedInUser:](v4, "setIsOwnedByLoggedInUser:", objc_msgSend(v29, "unsignedIntValue") == 0);
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setIsOwnedByRoot:](v4, "setIsOwnedByRoot:", objc_msgSend(v30, "unsignedIntValue") == 1);
  }
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA870]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v31, "intValue"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringValue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setFinderInfoFlagsBase64:](v4, "setFinderInfoFlagsBase64:", v34);

  }
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA8C0]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setIsResourceFork:](v4, "setIsResourceFork:", objc_msgSend(v35, "BOOLValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA848]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setSyncRootEnum:](v4, "setSyncRootEnum:", objc_msgSend(v37, "intValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA838]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setBTime:](v4, "setBTime:", objc_msgSend(v39, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA840]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setBTimeIsBusy:](v4, "setBTimeIsBusy:", objc_msgSend(v41, "BOOLValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA8A8]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setMTime:](v4, "setMTime:", objc_msgSend(v43, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA8F8]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (v45)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setXattrCount:](v4, "setXattrCount:", objc_msgSend(v45, "intValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA8F0]);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v47)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setCompressionType:](v4, "setCompressionType:", objc_msgSend(v47, "intValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA918]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (v49)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setIsQuarantined:](v4, "setIsQuarantined:", objc_msgSend(v49, "BOOLValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA908]);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (v51)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setXattrHasDemotion:](v4, "setXattrHasDemotion:", objc_msgSend(v51, "BOOLValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA910]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v53;
  if (v53)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setXattrHasPromotion:](v4, "setXattrHasPromotion:", objc_msgSend(v53, "BOOLValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA900]);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v55)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setXattrHasBeforeBounce:](v4, "setXattrHasBeforeBounce:", objc_msgSend(v55, "BOOLValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA800]);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setUtType:](v4, "setUtType:", v57);
  }

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA7E8]);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (v58)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setFileNameLength:](v4, "setFileNameLength:", objc_msgSend(v58, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA7F8]);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v60;
  if (v60)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setPathLength:](v4, "setPathLength:", objc_msgSend(v60, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA7D8]);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v62;
  if (v62)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setIsAppleDouble:](v4, "setIsAppleDouble:", objc_msgSend(v62, "BOOLValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA7F0]);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64;
  if (v64)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setPathDepth:](v4, "setPathDepth:", objc_msgSend(v64, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA7D0]);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setFileNameExtension:](v4, "setFileNameExtension:", v66);
  }

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA808]);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setNameUnicodeNorm:](v4, "setNameUnicodeNorm:", v67);
  }

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA7E0]);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v68;
  if (v68)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setNameIsTrashed:](v4, "setNameIsTrashed:", objc_msgSend(v68, "BOOLValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA8E0]);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v70;
  if (v70)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setReadErrorCode:](v4, "setReadErrorCode:", objc_msgSend(v70, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA8D8]);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v72;
  if (v72)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setSysPageSize:](v4, "setSysPageSize:", objc_msgSend(v72, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA8E8]);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v74;
  if (v74)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setSysUID:](v4, "setSysUID:", objc_msgSend(v74, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA8D0]);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v76;
  if (v76)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setSysDocIDResolutionOK:](v4, "setSysDocIDResolutionOK:", objc_msgSend(v76, "BOOLValue"));

  v78 = *MEMORY[0x1E0CAA818];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA818]);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v79;
  if (v79)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setIsPurgable:](v4, "setIsPurgable:", objc_msgSend(v79, "BOOLValue"));

  objc_msgSend(v3, "objectForKey:", v78);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA820]);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v82;
  if (v82)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setPurgeGenCount:](v4, "setPurgeGenCount:", objc_msgSend(v82, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA810]);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v84;
  if (v84)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setPurgeATime:](v4, "setPurgeATime:", objc_msgSend(v84, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA828]);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v86;
  if (v86)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setPurgeSyncRoot:](v4, "setPurgeSyncRoot:", objc_msgSend(v86, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA878]);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v88;
  if (v88)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setFsGenCount:](v4, "setFsGenCount:", objc_msgSend(v88, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA748]);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v90;
  if (v90)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDbErrorCode:](v4, "setDbErrorCode:", objc_msgSend(v90, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA750]);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDbErrorDomain:](v4, "setDbErrorDomain:", v92);
  }

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA738]);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v93;
  if (v93)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDbCapabilities:](v4, "setDbCapabilities:", objc_msgSend(v93, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA7A0]);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v95;
  if (v95)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDbTransferState:](v4, "setDbTransferState:", objc_msgSend(v95, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA798]);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v97;
  if (v97)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDbSharingState:](v4, "setDbSharingState:", objc_msgSend(v97, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA788]);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v99;
  if (v99)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDbIsApplibrary:](v4, "setDbIsApplibrary:", objc_msgSend(v99, "BOOLValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA740]);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v101;
  if (v101)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDbEffectiveContentPolicy:](v4, "setDbEffectiveContentPolicy:", objc_msgSend(v101, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA790]);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v103;
  if (v103)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDbIsPackage:](v4, "setDbIsPackage:", objc_msgSend(v103, "BOOLValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA770]);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v105;
  if (v105)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDbFsContentStatus:](v4, "setDbFsContentStatus:", objc_msgSend(v105, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA758]);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v107;
  if (v107)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDbFpContentStatus:](v4, "setDbFpContentStatus:", objc_msgSend(v107, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA780]);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v109;
  if (v109)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDbFsImportStatus:](v4, "setDbFsImportStatus:", objc_msgSend(v109, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA768]);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v111;
  if (v111)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDbFpImportStatus:](v4, "setDbFpImportStatus:", objc_msgSend(v111, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA778]);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v113;
  if (v113)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDbFsDeletionStatus:](v4, "setDbFsDeletionStatus:", objc_msgSend(v113, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA760]);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v115;
  if (v115)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDbFpDeletionStatus:](v4, "setDbFpDeletionStatus:", objc_msgSend(v115, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA7B8]);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v117;
  if (v117)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDiagFailuresBitmap:](v4, "setDiagFailuresBitmap:", objc_msgSend(v117, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA7A8]);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v119;
  if (v119)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDiagErrorCode:](v4, "setDiagErrorCode:", objc_msgSend(v119, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA7C0]);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v121;
  if (v121)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDiagUnderlyingErrorCode:](v4, "setDiagUnderlyingErrorCode:", objc_msgSend(v121, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA7B0]);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  if (v123)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDiagErrorDomain:](v4, "setDiagErrorDomain:", v123);
  }

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA7C8]);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  if (v124)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setDiagUnderlyingErrorDomain:](v4, "setDiagUnderlyingErrorDomain:", v124);
  }

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA710]);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v125;
  if (v125)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setApfsAvailableSpace:](v4, "setApfsAvailableSpace:", objc_msgSend(v125, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA728]);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v127;
  if (v127)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setApfsFlags:](v4, "setApfsFlags:", objc_msgSend(v127, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA718]);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v129;
  if (v129)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setApfsBlockSize:](v4, "setApfsBlockSize:", objc_msgSend(v129, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA730]);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v131;
  if (v131)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setApfsRole:](v4, "setApfsRole:", objc_msgSend(v131, "longLongValue"));

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CAA720]);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v133;
  if (v133)
    -[AppTelemetryFPFSMigrationNonMigratedItemInvestigation setApfsEncrypted:](v4, "setApfsEncrypted:", objc_msgSend(v133, "BOOLValue"));

  v135 = v4;
  return v135;
}

+ (id)newNonMigratedItemEvent:(id)a3 foundInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = +[AppTelemetryTimeSeriesEvent newIntEvent:UUID:value:](AppTelemetryTimeSeriesEvent, "newIntEvent:UUID:value:", 403, a3, 1);
  +[AppTelemetryTimeSeriesEvent nonMigratedItemInvestigationWithFoundInfo:](AppTelemetryTimeSeriesEvent, "nonMigratedItemInvestigationWithFoundInfo:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "investigation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFpfsMigrationNonMigratedItemInvestigation:", v7);

  return v6;
}

+ (id)newDatabaseIDMismatchEventWithFPDatabaseID:(id)a3 cloudDocsDatabaseID:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = +[AppTelemetryTimeSeriesEvent newIntEvent:UUID:value:](AppTelemetryTimeSeriesEvent, "newIntEvent:UUID:value:", 38, a3, 1);
  objc_msgSend(v6, "investigation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMigrationUUID:", v5);

  return v6;
}

+ (id)newAggregatedEventWithIdentifier:(int)a3 recordID:(id)a4 zoneMangledID:(id)a5 enhancedDrivePrivacyEnabled:(id)a6 error:(id)a7 count:(int64_t)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;

  v12 = *(_QWORD *)&a3;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  objc_msgSend(v14, "br_errorDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(a1, "_newTelemetryEventInZoneWithMangledID:enhancedDrivePrivacyEnabled:error:errorDescription:itemIDString:", v16, v15, v14, v18, v17);

  objc_msgSend(v19, "setMagnitudeLong:", a8);
  objc_msgSend(v19, "setTelemetrySchema:", v12);
  return v19;
}

- (void)setMagnitudeFloat:(float)a3
{
  -[AppTelemetryTimeSeriesEvent clearOneofValuesForMagnitude](self, "clearOneofValuesForMagnitude");
  *(_BYTE *)&self->_has |= 8u;
  self->_magnitude = 1;
  *(_BYTE *)&self->_has |= 0x10u;
  self->_magnitudeFloat = a3;
}

- (void)setHasMagnitudeFloat:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMagnitudeFloat
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setMagnitudeDouble:(double)a3
{
  -[AppTelemetryTimeSeriesEvent clearOneofValuesForMagnitude](self, "clearOneofValuesForMagnitude");
  *(_BYTE *)&self->_has |= 8u;
  self->_magnitude = 2;
  *(_BYTE *)&self->_has |= 1u;
  self->_magnitudeDouble = a3;
}

- (void)setHasMagnitudeDouble:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMagnitudeDouble
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMagnitudeInt:(int)a3
{
  -[AppTelemetryTimeSeriesEvent clearOneofValuesForMagnitude](self, "clearOneofValuesForMagnitude");
  *(_BYTE *)&self->_has |= 8u;
  self->_magnitude = 3;
  *(_BYTE *)&self->_has |= 0x20u;
  self->_magnitudeInt = a3;
}

- (void)setHasMagnitudeInt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasMagnitudeInt
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setMagnitudeBool:(BOOL)a3
{
  -[AppTelemetryTimeSeriesEvent clearOneofValuesForMagnitude](self, "clearOneofValuesForMagnitude");
  *(_BYTE *)&self->_has |= 8u;
  self->_magnitude = 4;
  *(_BYTE *)&self->_has |= 0x40u;
  self->_magnitudeBool = a3;
}

- (void)setHasMagnitudeBool:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasMagnitudeBool
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setMagnitudeLong:(int64_t)a3
{
  -[AppTelemetryTimeSeriesEvent clearOneofValuesForMagnitude](self, "clearOneofValuesForMagnitude");
  *(_BYTE *)&self->_has |= 8u;
  self->_magnitude = 5;
  *(_BYTE *)&self->_has |= 2u;
  self->_magnitudeLong = a3;
}

- (void)setHasMagnitudeLong:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMagnitudeLong
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)magnitude
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_magnitude;
  else
    return 0;
}

- (void)setMagnitude:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_magnitude = a3;
}

- (void)setHasMagnitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMagnitude
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)magnitudeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E8765DB8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMagnitude:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PBUNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("magnitude_float")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("magnitude_double")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("magnitude_int")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("magnitude_BOOL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("magnitude_long")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForMagnitude
{
  *(_BYTE *)&self->_has &= ~8u;
  self->_magnitude = 0;
  *(_BYTE *)&self->_has &= ~0x10u;
  self->_magnitudeFloat = 0.0;
  *(_BYTE *)&self->_has &= ~1u;
  self->_magnitudeDouble = 0.0;
  *(_BYTE *)&self->_has &= ~0x20u;
  self->_magnitudeInt = 0;
  *(_BYTE *)&self->_has &= ~0x40u;
  self->_magnitudeBool = 0;
  *(_BYTE *)&self->_has &= ~2u;
  self->_magnitudeLong = 0;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasInvestigation
{
  return self->_investigation != 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AppTelemetryTimeSeriesEvent;
  -[AppTelemetryTimeSeriesEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryTimeSeriesEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  double v5;
  char has;
  void *v7;
  AppTelemetryInvestigation *investigation;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t magnitude;
  __CFString *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_telemetrySchema);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("telemetrySchema"));

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(float *)&v5 = self->_magnitudeFloat;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("magnitude_float"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_magnitudeDouble);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("magnitude_double"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_magnitudeInt);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("magnitude_int"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_magnitudeBool);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("magnitude_BOOL"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_magnitudeLong);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("magnitude_long"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  magnitude = self->_magnitude;
  if (magnitude >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_magnitude);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_1E8765DB8[magnitude];
  }
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("magnitude"));

  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

LABEL_9:
  investigation = self->_investigation;
  if (investigation)
  {
    -[AppTelemetryInvestigation dictionaryRepresentation](investigation, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("investigation"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AppTelemetryTimeSeriesEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  id v6;

  v6 = a3;
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  v5 = v6;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = v6;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  v5 = v6;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteInt64Field();
  v5 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_9:
    PBDataWriterWriteUint64Field();
    v5 = v6;
  }
LABEL_10:
  if (self->_investigation)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4[10] = self->_magnitude;
    *((_BYTE *)v4 + 60) |= 8u;
  }
  v4[13] = self->_telemetrySchema;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[11] = LODWORD(self->_magnitudeFloat);
    *((_BYTE *)v4 + 60) |= 0x10u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_magnitudeDouble;
  *((_BYTE *)v4 + 60) |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v4[12] = self->_magnitudeInt;
  *((_BYTE *)v4 + 60) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_BYTE *)v4 + 56) = self->_magnitudeBool;
  *((_BYTE *)v4 + 60) |= 0x40u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_17:
  *((_QWORD *)v4 + 2) = self->_magnitudeLong;
  *((_BYTE *)v4 + 60) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_9:
    *((_QWORD *)v4 + 3) = self->_timestamp;
    *((_BYTE *)v4 + 60) |= 4u;
  }
LABEL_10:
  if (self->_investigation)
  {
    v6 = v4;
    objc_msgSend(v4, "setInvestigation:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_magnitude;
    *(_BYTE *)(v5 + 60) |= 8u;
  }
  *(_DWORD *)(v5 + 52) = self->_telemetrySchema;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(float *)(v5 + 44) = self->_magnitudeFloat;
    *(_BYTE *)(v5 + 60) |= 0x10u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 8) = self->_magnitudeDouble;
  *(_BYTE *)(v5 + 60) |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v5 + 48) = self->_magnitudeInt;
  *(_BYTE *)(v5 + 60) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
LABEL_15:
    *(_QWORD *)(v5 + 16) = self->_magnitudeLong;
    *(_BYTE *)(v5 + 60) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_14:
  *(_BYTE *)(v5 + 56) = self->_magnitudeBool;
  *(_BYTE *)(v5 + 60) |= 0x40u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_15;
LABEL_8:
  if ((has & 4) != 0)
  {
LABEL_9:
    *(_QWORD *)(v5 + 24) = self->_timestamp;
    *(_BYTE *)(v5 + 60) |= 4u;
  }
LABEL_10:
  v8 = -[AppTelemetryInvestigation copyWithZone:](self->_investigation, "copyWithZone:", a3);
  v9 = (void *)v6[4];
  v6[4] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  AppTelemetryInvestigation *investigation;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_43;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_magnitude != *((_DWORD *)v4 + 10))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    goto LABEL_43;
  }
  if (self->_telemetrySchema != *((_DWORD *)v4 + 13))
    goto LABEL_43;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x10) == 0 || self->_magnitudeFloat != *((float *)v4 + 11))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_magnitudeDouble != *((double *)v4 + 1))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x20) == 0 || self->_magnitudeInt != *((_DWORD *)v4 + 12))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 60) & 0x20) != 0)
  {
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x40) != 0)
    {
      if (self->_magnitudeBool)
      {
        if (!*((_BYTE *)v4 + 56))
          goto LABEL_43;
        goto LABEL_31;
      }
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_31;
    }
LABEL_43:
    v6 = 0;
    goto LABEL_44;
  }
  if ((*((_BYTE *)v4 + 60) & 0x40) != 0)
    goto LABEL_43;
LABEL_31:
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_magnitudeLong != *((_QWORD *)v4 + 2))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_timestamp != *((_QWORD *)v4 + 3))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_43;
  }
  investigation = self->_investigation;
  if ((unint64_t)investigation | *((_QWORD *)v4 + 4))
    v6 = -[AppTelemetryInvestigation isEqual:](investigation, "isEqual:");
  else
    v6 = 1;
LABEL_44:

  return v6;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  unsigned int telemetrySchema;
  unint64_t v6;
  float magnitudeFloat;
  float v8;
  float v9;
  float v10;
  unint64_t v11;
  double magnitudeDouble;
  double v13;
  long double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  has = (char)self->_has;
  if ((has & 8) != 0)
    v4 = 2654435761 * self->_magnitude;
  else
    v4 = 0;
  telemetrySchema = self->_telemetrySchema;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    magnitudeFloat = self->_magnitudeFloat;
    v8 = -magnitudeFloat;
    if (magnitudeFloat >= 0.0)
      v8 = self->_magnitudeFloat;
    v9 = floorf(v8 + 0.5);
    v10 = (float)(v8 - v9) * 1.8447e19;
    v6 = 2654435761u * (unint64_t)fmodf(v9, 1.8447e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabsf(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 1) != 0)
  {
    magnitudeDouble = self->_magnitudeDouble;
    v13 = -magnitudeDouble;
    if (magnitudeDouble >= 0.0)
      v13 = self->_magnitudeDouble;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  if ((has & 0x20) != 0)
  {
    v16 = 2654435761 * self->_magnitudeInt;
    if ((has & 0x40) != 0)
    {
LABEL_22:
      v17 = 2654435761 * self->_magnitudeBool;
      if ((has & 2) != 0)
        goto LABEL_23;
LABEL_27:
      v18 = 0;
      if ((has & 4) != 0)
        goto LABEL_24;
LABEL_28:
      v19 = 0;
      return (2654435761 * telemetrySchema) ^ v4 ^ v6 ^ v11 ^ v16 ^ v17 ^ v18 ^ v19 ^ -[AppTelemetryInvestigation hash](self->_investigation, "hash");
    }
  }
  else
  {
    v16 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_22;
  }
  v17 = 0;
  if ((has & 2) == 0)
    goto LABEL_27;
LABEL_23:
  v18 = 2654435761 * self->_magnitudeLong;
  if ((has & 4) == 0)
    goto LABEL_28;
LABEL_24:
  v19 = 2654435761u * self->_timestamp;
  return (2654435761 * telemetrySchema) ^ v4 ^ v6 ^ v11 ^ v16 ^ v17 ^ v18 ^ v19 ^ -[AppTelemetryInvestigation hash](self->_investigation, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  AppTelemetryInvestigation *investigation;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    self->_magnitude = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 8u;
  }
  self->_telemetrySchema = *((_DWORD *)v4 + 13);
  v6 = *((_BYTE *)v4 + 60);
  if ((v6 & 0x10) != 0)
  {
    self->_magnitudeFloat = *((float *)v4 + 11);
    *(_BYTE *)&self->_has |= 0x10u;
    v6 = *((_BYTE *)v4 + 60);
    if ((v6 & 1) == 0)
    {
LABEL_5:
      if ((v6 & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_magnitudeDouble = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v6 = *((_BYTE *)v4 + 60);
  if ((v6 & 0x20) == 0)
  {
LABEL_6:
    if ((v6 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  self->_magnitudeInt = *((_DWORD *)v4 + 12);
  *(_BYTE *)&self->_has |= 0x20u;
  v6 = *((_BYTE *)v4 + 60);
  if ((v6 & 0x40) == 0)
  {
LABEL_7:
    if ((v6 & 2) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  self->_magnitudeBool = *((_BYTE *)v4 + 56);
  *(_BYTE *)&self->_has |= 0x40u;
  v6 = *((_BYTE *)v4 + 60);
  if ((v6 & 2) == 0)
  {
LABEL_8:
    if ((v6 & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_17:
  self->_magnitudeLong = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
LABEL_9:
    self->_timestamp = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_10:
  investigation = self->_investigation;
  v8 = v5[4];
  if (investigation)
  {
    if (v8)
    {
      v9 = v5;
      -[AppTelemetryInvestigation mergeFrom:](investigation, "mergeFrom:");
LABEL_21:
      v5 = v9;
    }
  }
  else if (v8)
  {
    v9 = v5;
    -[AppTelemetryTimeSeriesEvent setInvestigation:](self, "setInvestigation:");
    goto LABEL_21;
  }

}

- (unsigned)telemetrySchema
{
  return self->_telemetrySchema;
}

- (void)setTelemetrySchema:(unsigned int)a3
{
  self->_telemetrySchema = a3;
}

- (float)magnitudeFloat
{
  return self->_magnitudeFloat;
}

- (double)magnitudeDouble
{
  return self->_magnitudeDouble;
}

- (int)magnitudeInt
{
  return self->_magnitudeInt;
}

- (BOOL)magnitudeBool
{
  return self->_magnitudeBool;
}

- (int64_t)magnitudeLong
{
  return self->_magnitudeLong;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AppTelemetryInvestigation)investigation
{
  return self->_investigation;
}

- (void)setInvestigation:(id)a3
{
  objc_storeStrong((id *)&self->_investigation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_investigation, 0);
}

@end
