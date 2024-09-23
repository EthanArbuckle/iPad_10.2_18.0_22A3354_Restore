@implementation BRCMigrationReport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t ciconiaVersion;
  id v5;

  ciconiaVersion = self->ciconiaVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", ciconiaVersion, CFSTR("ciconiaVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->lastError, CFSTR("lastError"));
  objc_msgSend(v5, "encodeObject:forKey:", self->crashReporterKey, CFSTR("crashReporterKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->errorOverriden, CFSTR("errorOverriden"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("duration"), self->duration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("cloningDuration"), self->cloningDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("importDuration"), self->importDuration);
  objc_msgSend(v5, "encodeBool:forKey:", self->manuallyTriggered, CFSTR("manuallyTriggered"));
  objc_msgSend(v5, "encodeObject:forKey:", self->migrationUUID, CFSTR("migrationUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->domainID, CFSTR("domainID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->sideFaultsBelowThreshold, CFSTR("sideFaultsBelowThreshold"));
  objc_msgSend(v5, "encodeBool:forKey:", self->nonSideFaultsCompletelyMigrated, CFSTR("nonSideFaultsCompletelyMigrated"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->expectedAmountOfItemsMigrated, CFSTR("expectedAmountOfItemsMigrated"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->itemsThatAreNotMigrated, CFSTR("itemsThatAreNotMigrated"));
  objc_msgSend(v5, "encodeInt:forKey:", self->typeOfMigrated.var0.var0, CFSTR("typeOfMigrated"));
  objc_msgSend(v5, "encodeInt:forKey:", self->typeOfNotMigrated.var0.var0, CFSTR("typeOfNotMigrated"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->materialisedCountOnICD, CFSTR("materialisedCountOnICD"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->materialisedCountOnFPFS, CFSTR("materialisedCountOnFPFS"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->totalItemCount, CFSTR("totalItemCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->itemsNotFoundInDB, CFSTR("itemsNotFoundInDB"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->itemsChangedDuringCloning, CFSTR("itemsChangedDuringCloning"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->ignoredContentProtectedItems, CFSTR("ignoredContentProtectedItems"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->packagesWithoutBundleBit, CFSTR("packagesWithoutBundleBit"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->bouncedDocumentsFolders, CFSTR("bouncedDocumentsFolders"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->symlinkedDocumentsFolders, CFSTR("symlinkedDocumentsFolders"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->documentsFoldersWithoutItemID, CFSTR("documentsFoldersWithoutItemID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->datalessItems, CFSTR("datalessItems"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->unexpectedCreations, CFSTR("unexpectedCreations"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->bouncedItems, CFSTR("bouncedItems"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->bouncedItemsMatrix.var0.var0, CFSTR("bouncedItemsMatrix"));
  objc_msgSend(v5, "encodeObject:forKey:", self->bounceReport, CFSTR("bounceReport"));
  objc_msgSend(v5, "encodeObject:forKey:", self->eaccessReport, CFSTR("eaccessReport"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->errorOriginatorId, CFSTR("errorOriginatorId"));

}

- (BRCMigrationReport)initWithCoder:(id)a3
{
  id v4;
  BRCMigrationReport *v5;
  uint64_t v6;
  NSError *lastError;
  uint64_t v8;
  NSString *crashReporterKey;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  NSUUID *migrationUUID;
  uint64_t v15;
  NSString *domainID;
  uint64_t v17;
  BRCBouncingReport *bounceReport;
  uint64_t v19;
  BRCEAccessReport *eaccessReport;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BRCMigrationReport;
  v5 = -[BRCMigrationReport init](&v22, sel_init);
  if (v5)
  {
    v5->ciconiaVersion = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ciconiaVersion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastError"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastError = v5->lastError;
    v5->lastError = (NSError *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("crashReporterKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    crashReporterKey = v5->crashReporterKey;
    v5->crashReporterKey = (NSString *)v8;

    v5->errorOverriden = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("errorOverriden"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v5->duration = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cloningDuration"));
    v5->cloningDuration = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("importDuration"));
    v5->importDuration = v12;
    v5->manuallyTriggered = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("manuallyTriggered"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("migrationUUID"));
    v13 = objc_claimAutoreleasedReturnValue();
    migrationUUID = v5->migrationUUID;
    v5->migrationUUID = (NSUUID *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domainID"));
    v15 = objc_claimAutoreleasedReturnValue();
    domainID = v5->domainID;
    v5->domainID = (NSString *)v15;

    v5->sideFaultsBelowThreshold = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sideFaultsBelowThreshold"));
    v5->nonSideFaultsCompletelyMigrated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("nonSideFaultsCompletelyMigrated"));
    v5->expectedAmountOfItemsMigrated = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("expectedAmountOfItemsMigrated"));
    v5->itemsThatAreNotMigrated = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("itemsThatAreNotMigrated"));
    v5->typeOfMigrated.var0.var0 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("typeOfMigrated"));
    v5->typeOfNotMigrated.var0.var0 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("typeOfNotMigrated"));
    v5->materialisedCountOnICD = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("materialisedCountOnICD"));
    v5->materialisedCountOnFPFS = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("materialisedCountOnFPFS"));
    v5->totalItemCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalItemCount"));
    v5->itemsNotFoundInDB = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("itemsNotFoundInDB"));
    v5->itemsChangedDuringCloning = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("itemsChangedDuringCloning"));
    v5->ignoredContentProtectedItems = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ignoredContentProtectedItems"));
    v5->packagesWithoutBundleBit = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("packagesWithoutBundleBit"));
    v5->bouncedDocumentsFolders = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("bouncedDocumentsFolders"));
    v5->symlinkedDocumentsFolders = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("symlinkedDocumentsFolders"));
    v5->documentsFoldersWithoutItemID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("documentsFoldersWithoutItemID"));
    v5->datalessItems = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("datalessItems"));
    v5->unexpectedCreations = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("unexpectedCreations"));
    v5->bouncedItems = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("bouncedItems"));
    v5->bouncedItemsMatrix.var0.var0 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("bouncedItemsMatrix"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bounceReport"));
    v17 = objc_claimAutoreleasedReturnValue();
    bounceReport = v5->bounceReport;
    v5->bounceReport = (BRCBouncingReport *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eaccessReport"));
    v19 = objc_claimAutoreleasedReturnValue();
    eaccessReport = v5->eaccessReport;
    v5->eaccessReport = (BRCEAccessReport *)v19;

    v5->errorOriginatorId = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("errorOriginatorId"));
  }

  return v5;
}

- (id)convertToData
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

+ (id)migrationReportFromData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3710];
  v4 = a3;
  v11 = 0;
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v11;
  if (!v5)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "fp_prettyDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed restoring migration report: %@%@", buf, 0x16u);

    }
  }

  return v5;
}

+ (id)cleanupStateURL
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "brc_ciconiaWorkDirForCurrentPersona");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("cleanup.state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[BRCMigrationReport ciconiaVersion](self, "ciconiaVersion");
  -[BRCMigrationReport migrationUUID](self, "migrationUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BRCMigrationReport errorOverriden](self, "errorOverriden"))
    v7 = CFSTR(" ‼️ ");
  else
    v7 = CFSTR(" ");
  -[BRCMigrationReport lastError](self, "lastError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fp_prettyDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p v:%llu u:%@%@e:%@ o:%llu>"), v4, self, v5, v6, v7, v9, -[BRCMigrationReport errorOriginatorId](self, "errorOriginatorId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)ciconiaVersion
{
  return self->ciconiaVersion;
}

- (void)setCiconiaVersion:(unint64_t)a3
{
  self->ciconiaVersion = a3;
}

- (NSError)lastError
{
  return self->lastError;
}

- (void)setLastError:(id)a3
{
  objc_storeStrong((id *)&self->lastError, a3);
}

- (NSString)crashReporterKey
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCrashReporterKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)errorOverriden
{
  return self->errorOverriden;
}

- (void)setErrorOverriden:(BOOL)a3
{
  self->errorOverriden = a3;
}

- (double)duration
{
  return self->duration;
}

- (void)setDuration:(double)a3
{
  self->duration = a3;
}

- (double)cloningDuration
{
  return self->cloningDuration;
}

- (void)setCloningDuration:(double)a3
{
  self->cloningDuration = a3;
}

- (double)importDuration
{
  return self->importDuration;
}

- (void)setImportDuration:(double)a3
{
  self->importDuration = a3;
}

- (BOOL)manuallyTriggered
{
  return self->manuallyTriggered;
}

- (void)setManuallyTriggered:(BOOL)a3
{
  self->manuallyTriggered = a3;
}

- (NSUUID)migrationUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMigrationUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)domainID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDomainID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)sideFaultsBelowThreshold
{
  return self->sideFaultsBelowThreshold;
}

- (void)setSideFaultsBelowThreshold:(BOOL)a3
{
  self->sideFaultsBelowThreshold = a3;
}

- (BOOL)nonSideFaultsCompletelyMigrated
{
  return self->nonSideFaultsCompletelyMigrated;
}

- (void)setNonSideFaultsCompletelyMigrated:(BOOL)a3
{
  self->nonSideFaultsCompletelyMigrated = a3;
}

- (unint64_t)expectedAmountOfItemsMigrated
{
  return self->expectedAmountOfItemsMigrated;
}

- (void)setExpectedAmountOfItemsMigrated:(unint64_t)a3
{
  self->expectedAmountOfItemsMigrated = a3;
}

- (unint64_t)itemsThatAreNotMigrated
{
  return self->itemsThatAreNotMigrated;
}

- (void)setItemsThatAreNotMigrated:(unint64_t)a3
{
  self->itemsThatAreNotMigrated = a3;
}

- (BRTypesField)typeOfNotMigrated
{
  return self->typeOfNotMigrated;
}

- (void)setTypeOfNotMigrated:(BRTypesField)a3
{
  self->typeOfNotMigrated = a3;
}

- (unint64_t)materialisedCountOnICD
{
  return self->materialisedCountOnICD;
}

- (void)setMaterialisedCountOnICD:(unint64_t)a3
{
  self->materialisedCountOnICD = a3;
}

- (unint64_t)materialisedCountOnFPFS
{
  return self->materialisedCountOnFPFS;
}

- (void)setMaterialisedCountOnFPFS:(unint64_t)a3
{
  self->materialisedCountOnFPFS = a3;
}

- (unint64_t)totalItemCount
{
  return self->totalItemCount;
}

- (void)setTotalItemCount:(unint64_t)a3
{
  self->totalItemCount = a3;
}

- (BRTypesField)typeOfMigrated
{
  return self->typeOfMigrated;
}

- (void)setTypeOfMigrated:(BRTypesField)a3
{
  self->typeOfMigrated = a3;
}

- (unint64_t)errorOriginatorId
{
  return self->errorOriginatorId;
}

- (void)setErrorOriginatorId:(unint64_t)a3
{
  self->errorOriginatorId = a3;
}

- (unint64_t)itemsNotFoundInDB
{
  return self->itemsNotFoundInDB;
}

- (void)setItemsNotFoundInDB:(unint64_t)a3
{
  self->itemsNotFoundInDB = a3;
}

- (unint64_t)itemsChangedDuringCloning
{
  return self->itemsChangedDuringCloning;
}

- (void)setItemsChangedDuringCloning:(unint64_t)a3
{
  self->itemsChangedDuringCloning = a3;
}

- (unint64_t)ignoredContentProtectedItems
{
  return self->ignoredContentProtectedItems;
}

- (void)setIgnoredContentProtectedItems:(unint64_t)a3
{
  self->ignoredContentProtectedItems = a3;
}

- (unint64_t)packagesWithoutBundleBit
{
  return self->packagesWithoutBundleBit;
}

- (void)setPackagesWithoutBundleBit:(unint64_t)a3
{
  self->packagesWithoutBundleBit = a3;
}

- (unint64_t)bouncedDocumentsFolders
{
  return self->bouncedDocumentsFolders;
}

- (void)setBouncedDocumentsFolders:(unint64_t)a3
{
  self->bouncedDocumentsFolders = a3;
}

- (unint64_t)symlinkedDocumentsFolders
{
  return self->symlinkedDocumentsFolders;
}

- (void)setSymlinkedDocumentsFolders:(unint64_t)a3
{
  self->symlinkedDocumentsFolders = a3;
}

- (unint64_t)documentsFoldersWithoutItemID
{
  return self->documentsFoldersWithoutItemID;
}

- (void)setDocumentsFoldersWithoutItemID:(unint64_t)a3
{
  self->documentsFoldersWithoutItemID = a3;
}

- (unint64_t)datalessItems
{
  return self->datalessItems;
}

- (void)setDatalessItems:(unint64_t)a3
{
  self->datalessItems = a3;
}

- (int64_t)unexpectedCreations
{
  return self->unexpectedCreations;
}

- (void)setUnexpectedCreations:(int64_t)a3
{
  self->unexpectedCreations = a3;
}

- (unint64_t)bouncedItems
{
  return self->bouncedItems;
}

- (void)setBouncedItems:(unint64_t)a3
{
  self->bouncedItems = a3;
}

- (BRBouncesTypesMatrix)bouncedItemsMatrix
{
  return self->bouncedItemsMatrix;
}

- (void)setBouncedItemsMatrix:(BRBouncesTypesMatrix)a3
{
  self->bouncedItemsMatrix = a3;
}

- (BRCBouncingReport)bounceReport
{
  return (BRCBouncingReport *)objc_getProperty(self, a2, 224, 1);
}

- (void)setBounceReport:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (BRCEAccessReport)eaccessReport
{
  return (BRCEAccessReport *)objc_getProperty(self, a2, 232, 1);
}

- (void)setEaccessReport:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->eaccessReport, 0);
  objc_storeStrong((id *)&self->bounceReport, 0);
  objc_storeStrong((id *)&self->domainID, 0);
  objc_storeStrong((id *)&self->migrationUUID, 0);
  objc_storeStrong((id *)&self->crashReporterKey, 0);
  objc_storeStrong((id *)&self->lastError, 0);
}

@end
