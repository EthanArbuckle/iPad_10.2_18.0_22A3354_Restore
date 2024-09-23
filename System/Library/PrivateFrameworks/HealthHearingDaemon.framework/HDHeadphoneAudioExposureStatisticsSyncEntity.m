@implementation HDHeadphoneAudioExposureStatisticsSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return (HDSyncEntityIdentifier *)objc_msgSend(MEMORY[0x24BE40C70], "identifierWithSchema:entity:", CFSTR("com.apple.healthd.hearing.sync-schema"), 2);
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDHeadphoneAudioExposureStatisticsSyncEntity.m"), 32, CFSTR("%@ does not support decoding sync object data"), objc_opt_class());

  return 0;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  return 0;
}

+ (id)pruneSyncedObjectsThroughAnchor:(id)a3 limit:(unint64_t)a4 nowDate:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = *MEMORY[0x24BE45688];
  v11 = a5;
  objc_msgSend(a6, "profileExtensionWithIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "headphoneDoseManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_pruneWithNowDate:limit:error:", v11, a4, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  return 0;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  return a4;
}

@end
