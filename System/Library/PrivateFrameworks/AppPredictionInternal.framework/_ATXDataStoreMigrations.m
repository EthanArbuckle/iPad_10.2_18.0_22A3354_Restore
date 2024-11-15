@implementation _ATXDataStoreMigrations

+ (id)migrations
{
  if (migrations_onceToken != -1)
    dispatch_once(&migrations_onceToken, &__block_literal_global_110);
  return (id)migrations_migrationPlan;
}

+ (id)skipFromZeroSchema:(unint64_t *)a3
{
  void *v3;
  void *v4;
  _QWORD v6[38];

  v6[37] = *MEMORY[0x1E0C80C00];
  *a3 = 92;
  v6[0] = CFSTR("CREATE TABLE IF NOT EXISTS app (bundleId TEXT PRIMARY KEY, data BLOB NOT NULL) WITHOUT ROWID");
  v6[1] = CFSTR("CREATE TABLE IF NOT EXISTS appInfo (bundleId TEXT PRIMARY KEY, installDate INT, lastLaunchDate INT, lastSpotlightLaunchDate INT, subsequentLaunchCounts BLOB, genreId INT, subGenreIds BLOB, isExtension INTEGER, app2VecCluster INT, averageSecondsBetweenLaunches INT, medianSecondsBetweenLaunches INT, subsequentAppActionLaunchCounts BLOB, isEnterpriseApp INTEGER) WITHOUT ROWID");
  v6[2] = CFSTR("CREATE TABLE IF NOT EXISTS appActionInfo (appAction TEXT PRIMARY KEY, lastAppActionLaunchDate INT, subsequentAppActionLaunchCounts BLOB, averageSecondsBetweenAppActions INT, medianSecondsBetweenAppActions INT) WITHOUT ROWID");
  v6[3] = CFSTR("CREATE TABLE IF NOT EXISTS meta (id INTEGER PRIMARY KEY, version INT, data BLOB)");
  v6[4] = CFSTR("CREATE TABLE IF NOT EXISTS histograms (histogramType INT PRIMARY KEY, histogramData BLOB NOT NULL)");
  v6[5] = CFSTR("CREATE TABLE IF NOT EXISTS categoricalHistograms (histogramType INT PRIMARY KEY, histogramData BLOB NOT NULL)");
  v6[6] = CFSTR("CREATE TABLE IF NOT EXISTS blobs (blobType INTEGER PRIMARY KEY, data BLOB, expirationDate INT)");
  v6[7] = CFSTR("CREATE TABLE IF NOT EXISTS appLaunchSequence (launchDate INT PRIMARY KEY, bundleId TEXT)");
  v6[8] = CFSTR("CREATE TABLE IF NOT EXISTS alogBundleId (id INTEGER PRIMARY KEY, bundleId TEXT UNIQUE NOT NULL)");
  v6[9] = CFSTR("CREATE TABLE IF NOT EXISTS alogAction (id INTEGER PRIMARY KEY, actionType TEXT UNIQUE NOT NULL)");
  v6[10] = CFSTR("CREATE TABLE IF NOT EXISTS alog (id INTEGER PRIMARY KEY, bundleId INT NOT NULL, actionType INT NOT NULL, slots BLOB, date INT NOT NULL, timeOfDay INT NOT NULL, dayOfWeek INT NOT NULL, location BLOB, weight REAL, actionUUID BLOB, prevLocation BLOB, motionType INT NOT NULL, appSessionStartDate INT, appSessionEndDate INT, creationDateInMilliseconds INT, geohash INT NOT NULL, coarseGeohash INT NOT NULL)");
  v6[11] = CFSTR("CREATE INDEX IF NOT EXISTS ix_alog_appAndAction ON alog(bundleId, actionType)");
  v6[12] = CFSTR("CREATE TABLE IF NOT EXISTS afeedback (id INTEGER PRIMARY KEY, bundleId INT NOT NULL, actionType INT NOT NULL, slots BLOB, confirms REAL, rejects REAL, actionUUID BLOB, date INT, consumerSubType TEXT NOT NULL DEFAULT SpotlightPullDnHome, feedbackType TEXT NOT NULL DEFAULT ATXActionFeedbackTypeImplicit, geohash INT NOT NULL, coarseGeohash INT NOT NULL)");
  v6[13] = CFSTR("CREATE INDEX IF NOT EXISTS ix_afeedback_appAndAction ON afeedback(bundleId, actionType)");
  v6[14] = CFSTR("CREATE TABLE IF NOT EXISTS predictionFeedbackInfo (appAction TEXT NOT NULL, predictionsCount INT, feedbackCount INT, uiType TEXT NOT NULL, PRIMARY KEY (appAction, uiType))");
  v6[15] = CFSTR("CREATE INDEX IF NOT EXISTS ix_lastAppActionLaunchDate ON appActionInfo(lastAppActionLaunchDate)");
  v6[16] = CFSTR("CREATE TABLE IF NOT EXISTS messageRecipients (recipientName TEXT PRIMARY KEY, lastDateMessaged INT)");
  v6[17] = CFSTR("CREATE TABLE IF NOT EXISTS slotSetKey (alogId INT NOT NULL, uuid BLOB PRIMARY KEY NOT NULL, paramHash INT NOT NULL, slotHash INT NOT NULL, paramCount INT NOT NULL)");
  v6[18] = CFSTR("CREATE INDEX IF NOT EXISTS ix_slotSetKeyUuid on slotSetKey(uuid)");
  v6[19] = CFSTR("CREATE INDEX IF NOT EXISTS ix_slotSetKeyId on slotSetKey(alogId)");
  v6[20] = CFSTR("CREATE INDEX IF NOT EXISTS ix_slotSetKeyParamHash on slotSetKey(paramHash)");
  v6[21] = CFSTR("CREATE TABLE IF NOT EXISTS anchorModelTrainingData (id INTEGER PRIMARY KEY, anchorType TEXT NOT NULL, anchorDate INTEGER NOT NULL, candidateType TEXT NOT NULL, candidateId TEXT NOT NULL, candidateOccurrencesInLast12Hours INTEGER, candidateOccurrencesInLast24Hours INTEGER, candidateOccurrencesInLast48Hours INTEGER, candidateOccurrencesInLast7Days INTEGER, candidateOccurrencesInLast14Days INTEGER, candidateOccurrencesInLast28Days INTEGER, candidatePerformed INTEGER NOT NULL, candidateEngaged INTEGER NOT NULL, secondsSinceAnchor INTEGER NOT NULL, candidateLocation TEXT, candidateOccurrenceId INTEGER)");
  v6[22] = CFSTR("CREATE TABLE IF NOT EXISTS anchorOccurrence (anchorType TEXT NOT NULL, anchorDate INTEGER NOT NULL, anchorLocalHour INTEGER NOT NULL, anchorLocalDoW INTEGER NOT NULL, anchorLocalIsWeekend INTEGER NOT NULL, anchorLocation TEXT, anchorEventIdentifier TEXT, PRIMARY KEY(anchorType, anchorDate))");
  v6[23] = CFSTR("CREATE TABLE IF NOT EXISTS anchorType (name TEXT PRIMARY KEY, description TEXT NOT NULL)");
  v6[24] = CFSTR("CREATE INDEX IF NOT EXISTS ix_anchorTrainingData_anchorTypeAndCandidate ON anchorModelTrainingData(anchorType, candidateId, candidatePerformed)");
  v6[25] = CFSTR("CREATE TABLE IF NOT EXISTS locations (uuid TEXT PRIMARY KEY, type TEXT, description TEXT, lat REAL, long REAL)");
  v6[26] = CFSTR("CREATE TABLE IF NOT EXISTS intentCache (cacheKey TEXT PRIMARY KEY, bundleId TEXT NOT NULL, paramCombinationsWithSchema BLOB, backgroundExecution INTEGER, eligibleForWidgets INTEGER, title TEXT, subtitle TEXT)");
  v6[27] = CFSTR("CREATE TABLE IF NOT EXISTS webClipForAppClip (webClipBundleId TEXT PRIMARY KEY, appClipBundleId TEXT NOT NULL)");
  v6[28] = CFSTR("CREATE TABLE IF NOT EXISTS anchorModelTrainingResults (id INTEGER PRIMARY KEY, trainingDate INTEGER NOT NULL, anchorType TEXT NOT NULL, anchorEventIdentifier TEXT NOT NULL, candidateType TEXT NOT NULL, candidateId TEXT NOT NULL, numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence INTEGER DEFAULT 0, posteriorProbability REAL DEFAULT 0.0, classConditionalProbability REAL DEFAULT 0.0, classifierType INTEGER NOT NULL, trainedClassifier BLOB NOT NULL, classifierDescription TEXT NOT NULL, startSecondsAfterAnchor REAL NOT NULL, endSecondsAfterAnchor REAL NOT NULL, standardDeviationOfOffsetFromAnchor REAL DEFAULT 99999.0, launchesInLast28Days INTEGER, launchesInLast14Days INTEGER, launchesInLast7Days INTEGER, launchesInLast48Hours INTEGER, launchesInLast24Hours INTEGER, launchesInLast12Hours INTEGER, launchesInLast2Hours INTEGER, anchorPopularity REAL DEFAULT 0.0, globalPopularity REAL DEFAULT 0.0)");
  v6[29] = CFSTR("migration_populateModeCaches");
  v6[30] = CFSTR("CREATE TABLE IF NOT EXISTS relevanceCandidates (id INTEGER PRIMARY KEY, candidateType TEXT NOT NULL, candidateIdentifier TEXT NOT NULL, candidateData BLOB NOT NULL, UNIQUE(candidateType, candidateIdentifier))");
  v6[31] = CFSTR("CREATE TABLE IF NOT EXISTS relevanceFeaturizationManagers (id INTEGER PRIMARY KEY, featurizationManagerData BLOB NOT NULL UNIQUE)");
  v6[32] = CFSTR("CREATE TABLE IF NOT EXISTS relevanceDatasetMetadata (id INTEGER PRIMARY KEY, numberOfPositiveSamples INT NOT NULL, numberOfSamples INT NOT NULL, numberOfDaysWithPositiveSamples INT NOT NULL, numberOfDaysWithSamples INT NOT NULL, startDate INTEGER NOT NULL, endDate INTEGER NOT NULL, UNIQUE(numberOfPositiveSamples, numberOfSamples, numberOfDaysWithPositiveSamples, numberOfDaysWithSamples, startDate, endDate))");
  v6[33] = CFSTR("CREATE TABLE IF NOT EXISTS relevanceCandidateModels (id INTEGER PRIMARY KEY, modelUUID TEXT NOT NULL, clientModelName TEXT NOT NULL, candidateId INTEGER NOT NULL, candidateModelData BLOB NOT NULL, featurizationManagerId INTEGER NOT NULL, trainDate INTEGER NOT NULL, datasetMetadataId INTEGER NOT NULL, isVerified INT)");
  v6[34] = CFSTR("CREATE TABLE IF NOT EXISTS anchorModelSuggestionOutcomes (id INTEGER PRIMARY KEY, date INTEGER NOT NULL, anchorType TEXT NOT NULL, anchorEventIdentifier TEXT, candidateId TEXT NOT NULL, outcome INTEGER NOT NULL)");
  v6[35] = CFSTR("CREATE TABLE IF NOT EXISTS relevanceCandidateCache (modelId TEXT PRIMARY KEY, date INTEGER NOT NULL, candidateList BLOB NOT NULL, featurizationManager BLOB NOT NULL)");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR IGNORE INTO meta (id, version) VALUES (1, %lu)"), 92);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[36] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 37);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
