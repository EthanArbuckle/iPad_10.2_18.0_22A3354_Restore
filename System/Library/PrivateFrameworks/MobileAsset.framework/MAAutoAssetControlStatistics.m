@implementation MAAutoAssetControlStatistics

- (MAAutoAssetControlStatistics)init
{
  return -[MAAutoAssetControlStatistics initWithInitialValue:](self, "initWithInitialValue:", 0);
}

- (MAAutoAssetControlStatistics)initWithInitialValue:(int64_t)a3
{
  MAAutoAssetControlStatistics *v4;
  MAAutoAssetControlStatisticsByCommand *v5;
  MAAutoAssetControlStatisticsByCommand *totalClientRequests;
  MAAutoAssetControlStatisticsByCommand *v7;
  MAAutoAssetControlStatisticsByCommand *totalClientRepliesSuccess;
  MAAutoAssetControlStatisticsByCommand *v9;
  MAAutoAssetControlStatisticsByCommand *totalClientRepliesFailure;
  MAAutoAssetControlStatisticsByCommand *v11;
  MAAutoAssetControlStatisticsByCommand *totalQueuedClientRequests;
  MAAutoAssetControlStatisticsByCommand *v13;
  MAAutoAssetControlStatisticsByCommand *totalDequeuedClientRequests;
  MAAutoAssetControlStatisticsBySize *v15;
  MAAutoAssetControlStatisticsBySize *previouslyDownloaded;
  MAAutoAssetControlStatisticsBySize *v17;
  MAAutoAssetControlStatisticsBySize *totalDownloaded;
  MAAutoAssetControlStatisticsBySize *v19;
  MAAutoAssetControlStatisticsBySize *totalStaged;
  MAAutoAssetControlStatisticsBySize *v21;
  MAAutoAssetControlStatisticsBySize *totalUnstaged;
  MAAutoAssetControlStatisticsBySize *v23;
  MAAutoAssetControlStatisticsBySize *totalPromoted;
  MAAutoAssetControlStatisticsBySize *v25;
  MAAutoAssetControlStatisticsBySize *totalRemoved;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)MAAutoAssetControlStatistics;
  v4 = -[MAAutoAssetControlStatistics init](&v28, sel_init);
  if (v4)
  {
    v5 = -[MAAutoAssetControlStatisticsByCommand initWithInitialValue:]([MAAutoAssetControlStatisticsByCommand alloc], "initWithInitialValue:", a3);
    totalClientRequests = v4->_totalClientRequests;
    v4->_totalClientRequests = v5;

    v7 = -[MAAutoAssetControlStatisticsByCommand initWithInitialValue:]([MAAutoAssetControlStatisticsByCommand alloc], "initWithInitialValue:", a3);
    totalClientRepliesSuccess = v4->_totalClientRepliesSuccess;
    v4->_totalClientRepliesSuccess = v7;

    v9 = -[MAAutoAssetControlStatisticsByCommand initWithInitialValue:]([MAAutoAssetControlStatisticsByCommand alloc], "initWithInitialValue:", a3);
    totalClientRepliesFailure = v4->_totalClientRepliesFailure;
    v4->_totalClientRepliesFailure = v9;

    v11 = -[MAAutoAssetControlStatisticsByCommand initWithInitialValue:]([MAAutoAssetControlStatisticsByCommand alloc], "initWithInitialValue:", a3);
    totalQueuedClientRequests = v4->_totalQueuedClientRequests;
    v4->_totalQueuedClientRequests = v11;

    v13 = -[MAAutoAssetControlStatisticsByCommand initWithInitialValue:]([MAAutoAssetControlStatisticsByCommand alloc], "initWithInitialValue:", a3);
    totalDequeuedClientRequests = v4->_totalDequeuedClientRequests;
    v4->_totalDequeuedClientRequests = v13;

    v4->_totalAutoAssetJobsStarted = a3;
    v4->_totalAutoJobsFinished = a3;
    v4->_totalStagerDetermineJobsStarted = a3;
    v4->_totalStagerDetermineJobsFinished = a3;
    v4->_totalStagerDownloadJobsStarted = a3;
    v4->_totalStagerDownloadJobsFinished = a3;
    v4->_totalResumedInFlightJobs = a3;
    v4->_totalSchedulerTriggeredJobs = a3;
    v4->_totalFailuresToStartJobs = a3;
    v15 = -[MAAutoAssetControlStatisticsBySize initWithInitialValue:]([MAAutoAssetControlStatisticsBySize alloc], "initWithInitialValue:", a3);
    previouslyDownloaded = v4->_previouslyDownloaded;
    v4->_previouslyDownloaded = v15;

    v17 = -[MAAutoAssetControlStatisticsBySize initWithInitialValue:]([MAAutoAssetControlStatisticsBySize alloc], "initWithInitialValue:", a3);
    totalDownloaded = v4->_totalDownloaded;
    v4->_totalDownloaded = v17;

    v19 = -[MAAutoAssetControlStatisticsBySize initWithInitialValue:]([MAAutoAssetControlStatisticsBySize alloc], "initWithInitialValue:", a3);
    totalStaged = v4->_totalStaged;
    v4->_totalStaged = v19;

    v21 = -[MAAutoAssetControlStatisticsBySize initWithInitialValue:]([MAAutoAssetControlStatisticsBySize alloc], "initWithInitialValue:", a3);
    totalUnstaged = v4->_totalUnstaged;
    v4->_totalUnstaged = v21;

    v23 = -[MAAutoAssetControlStatisticsBySize initWithInitialValue:]([MAAutoAssetControlStatisticsBySize alloc], "initWithInitialValue:", a3);
    totalPromoted = v4->_totalPromoted;
    v4->_totalPromoted = v23;

    v25 = -[MAAutoAssetControlStatisticsBySize initWithInitialValue:]([MAAutoAssetControlStatisticsBySize alloc], "initWithInitialValue:", a3);
    totalRemoved = v4->_totalRemoved;
    v4->_totalRemoved = v25;

    v4->_finishedJobSchedulerNetworkFailure = a3;
    v4->_finishedJobSchedulerNotNetworkRelated = a3;
    v4->_finishedJobClientNetworkFailure = a3;
    v4->_finishedJobClientNotNetworkRelated = a3;
    *(_WORD *)&v4->_garbageCollectionPerformed = 0;
    *(_OWORD *)&v4->_garbageCollectionTotalReclaimedSpace = 0u;
    *(_OWORD *)&v4->_garbageCollectionReclaimedV2AssetSpace = 0u;
    *(_OWORD *)&v4->_garbageCollectionReclaimedUnlockedSpace = 0u;
    *(_OWORD *)&v4->_garbageCollectionReclaimedLockedOverridableSpace = 0u;
    *(_OWORD *)&v4->_garbageCollectionReclaimedLockedNeverRemoveSpace = 0u;
    *(_OWORD *)&v4->_garbageCollectionReclaimedStagedSpace = 0u;
    v4->_garbageCollectionReclaimedMetadataBlockedSpace = 0;
  }
  return v4;
}

- (MAAutoAssetControlStatistics)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetControlStatistics *v5;
  uint64_t v6;
  MAAutoAssetControlStatisticsByCommand *totalClientRequests;
  uint64_t v8;
  MAAutoAssetControlStatisticsByCommand *totalClientRepliesSuccess;
  uint64_t v10;
  MAAutoAssetControlStatisticsByCommand *totalClientRepliesFailure;
  uint64_t v12;
  MAAutoAssetControlStatisticsByCommand *totalQueuedClientRequests;
  uint64_t v14;
  MAAutoAssetControlStatisticsByCommand *totalDequeuedClientRequests;
  uint64_t v16;
  MAAutoAssetControlStatisticsBySize *previouslyDownloaded;
  uint64_t v18;
  MAAutoAssetControlStatisticsBySize *totalDownloaded;
  uint64_t v20;
  MAAutoAssetControlStatisticsBySize *totalStaged;
  uint64_t v22;
  MAAutoAssetControlStatisticsBySize *totalUnstaged;
  uint64_t v24;
  MAAutoAssetControlStatisticsBySize *totalPromoted;
  uint64_t v26;
  MAAutoAssetControlStatisticsBySize *totalRemoved;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MAAutoAssetControlStatistics;
  v5 = -[MAAutoAssetControlStatistics init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalClientRequests"));
    v6 = objc_claimAutoreleasedReturnValue();
    totalClientRequests = v5->_totalClientRequests;
    v5->_totalClientRequests = (MAAutoAssetControlStatisticsByCommand *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalClientRepliesSuccess"));
    v8 = objc_claimAutoreleasedReturnValue();
    totalClientRepliesSuccess = v5->_totalClientRepliesSuccess;
    v5->_totalClientRepliesSuccess = (MAAutoAssetControlStatisticsByCommand *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalClientRepliesFailure"));
    v10 = objc_claimAutoreleasedReturnValue();
    totalClientRepliesFailure = v5->_totalClientRepliesFailure;
    v5->_totalClientRepliesFailure = (MAAutoAssetControlStatisticsByCommand *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalQueuedClientRequests"));
    v12 = objc_claimAutoreleasedReturnValue();
    totalQueuedClientRequests = v5->_totalQueuedClientRequests;
    v5->_totalQueuedClientRequests = (MAAutoAssetControlStatisticsByCommand *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalDequeuedClientRequests"));
    v14 = objc_claimAutoreleasedReturnValue();
    totalDequeuedClientRequests = v5->_totalDequeuedClientRequests;
    v5->_totalDequeuedClientRequests = (MAAutoAssetControlStatisticsByCommand *)v14;

    v5->_totalAutoAssetJobsStarted = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalAutoAssetJobsStarted"));
    v5->_totalAutoJobsFinished = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalAutoJobsFinished"));
    v5->_totalStagerDetermineJobsStarted = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalStagerDetermineJobsStarted"));
    v5->_totalStagerDetermineJobsFinished = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalStagerDetermineJobsFinished"));
    v5->_totalStagerDownloadJobsStarted = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalStagerDownloadJobsStarted"));
    v5->_totalStagerDownloadJobsFinished = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalStagerDownloadJobsFinished"));
    v5->_totalResumedInFlightJobs = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalResumedInFlightJobs"));
    v5->_totalSchedulerTriggeredJobs = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalSchedulerTriggeredJobs"));
    v5->_totalFailuresToStartJobs = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalFailuresToStartJobs"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previouslyDownloaded"));
    v16 = objc_claimAutoreleasedReturnValue();
    previouslyDownloaded = v5->_previouslyDownloaded;
    v5->_previouslyDownloaded = (MAAutoAssetControlStatisticsBySize *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalDownloaded"));
    v18 = objc_claimAutoreleasedReturnValue();
    totalDownloaded = v5->_totalDownloaded;
    v5->_totalDownloaded = (MAAutoAssetControlStatisticsBySize *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalStaged"));
    v20 = objc_claimAutoreleasedReturnValue();
    totalStaged = v5->_totalStaged;
    v5->_totalStaged = (MAAutoAssetControlStatisticsBySize *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalUnstaged"));
    v22 = objc_claimAutoreleasedReturnValue();
    totalUnstaged = v5->_totalUnstaged;
    v5->_totalUnstaged = (MAAutoAssetControlStatisticsBySize *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalPromoted"));
    v24 = objc_claimAutoreleasedReturnValue();
    totalPromoted = v5->_totalPromoted;
    v5->_totalPromoted = (MAAutoAssetControlStatisticsBySize *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalRemoved"));
    v26 = objc_claimAutoreleasedReturnValue();
    totalRemoved = v5->_totalRemoved;
    v5->_totalRemoved = (MAAutoAssetControlStatisticsBySize *)v26;

    v5->_finishedJobSchedulerNetworkFailure = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("finishedJobSchedulerNetworkFailure"));
    v5->_finishedJobSchedulerNotNetworkRelated = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("finishedJobSchedulerNotNetworkRelated"));
    v5->_finishedJobClientNetworkFailure = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("finishedJobClientNetworkFailure"));
    v5->_finishedJobClientNotNetworkRelated = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("finishedJobClientNotNetworkRelated"));
    v5->_garbageCollectionPerformed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("garbageCollectionPerformed"));
    v5->_garbageCollectionReclaimSpace = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("garbageCollectionReclaimSpace"));
    v5->_garbageCollectionTotalReclaimedSpace = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("garbageCollectionTotalReclaimedSpace"));
    v5->_garbageCollectionReclaimedV2AssetCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("garbageCollectionReclaimedV2AssetCount"));
    v5->_garbageCollectionReclaimedV2AssetSpace = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("garbageCollectionReclaimedV2AssetSpace"));
    v5->_garbageCollectionReclaimedUnlockedCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("garbageCollectionReclaimedUnlockedCount"));
    v5->_garbageCollectionReclaimedUnlockedSpace = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("garbageCollectionReclaimedUnlockedSpace"));
    v5->_garbageCollectionReclaimedLockedOverridableCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("garbageCollectionReclaimedLockedOverridableCount"));
    v5->_garbageCollectionReclaimedLockedOverridableSpace = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("garbageCollectionReclaimedLockedOverridableSpace"));
    v5->_garbageCollectionReclaimedLockedNeverRemoveCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("garbageCollectionReclaimedLockedNeverRemoveCount"));
    v5->_garbageCollectionReclaimedLockedNeverRemoveSpace = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("garbageCollectionReclaimedLockedNeverRemoveSpace"));
    v5->_garbageCollectionReclaimedStagedCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("garbageCollectionReclaimedStagedCount"));
    v5->_garbageCollectionReclaimedStagedSpace = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("garbageCollectionReclaimedStagedSpace"));
    v5->_garbageCollectionReclaimedMetadataBlockedCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("garbageCollectionReclaimedMetadataBlockedCount"));
    v5->_garbageCollectionReclaimedMetadataBlockedSpace = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("garbageCollectionReclaimedMetadataBlockedSpace"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
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
  id v15;

  v15 = a3;
  -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v4, CFSTR("totalClientRequests"));

  -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v5, CFSTR("totalClientRepliesSuccess"));

  -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v6, CFSTR("totalClientRepliesFailure"));

  -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v7, CFSTR("totalQueuedClientRequests"));

  -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v8, CFSTR("totalDequeuedClientRequests"));

  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics totalAutoAssetJobsStarted](self, "totalAutoAssetJobsStarted"), CFSTR("totalAutoAssetJobsStarted"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics totalAutoJobsFinished](self, "totalAutoJobsFinished"), CFSTR("totalAutoJobsFinished"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics totalStagerDetermineJobsStarted](self, "totalStagerDetermineJobsStarted"), CFSTR("totalStagerDetermineJobsStarted"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics totalStagerDetermineJobsFinished](self, "totalStagerDetermineJobsFinished"), CFSTR("totalStagerDetermineJobsFinished"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics totalStagerDownloadJobsStarted](self, "totalStagerDownloadJobsStarted"), CFSTR("totalStagerDownloadJobsStarted"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics totalStagerDownloadJobsFinished](self, "totalStagerDownloadJobsFinished"), CFSTR("totalStagerDownloadJobsFinished"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics totalResumedInFlightJobs](self, "totalResumedInFlightJobs"), CFSTR("totalResumedInFlightJobs"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics totalSchedulerTriggeredJobs](self, "totalSchedulerTriggeredJobs"), CFSTR("totalSchedulerTriggeredJobs"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics totalFailuresToStartJobs](self, "totalFailuresToStartJobs"), CFSTR("totalFailuresToStartJobs"));
  -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v9, CFSTR("previouslyDownloaded"));

  -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v10, CFSTR("totalDownloaded"));

  -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v11, CFSTR("totalStaged"));

  -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v12, CFSTR("totalUnstaged"));

  -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v13, CFSTR("totalPromoted"));

  -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v14, CFSTR("totalRemoved"));

  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics finishedJobSchedulerNetworkFailure](self, "finishedJobSchedulerNetworkFailure"), CFSTR("finishedJobSchedulerNetworkFailure"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics finishedJobSchedulerNotNetworkRelated](self, "finishedJobSchedulerNotNetworkRelated"), CFSTR("finishedJobSchedulerNotNetworkRelated"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics finishedJobClientNetworkFailure](self, "finishedJobClientNetworkFailure"), CFSTR("finishedJobClientNetworkFailure"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics finishedJobClientNotNetworkRelated](self, "finishedJobClientNotNetworkRelated"), CFSTR("finishedJobClientNotNetworkRelated"));
  objc_msgSend(v15, "encodeBool:forKey:", -[MAAutoAssetControlStatistics garbageCollectionPerformed](self, "garbageCollectionPerformed"), CFSTR("garbageCollectionPerformed"));
  objc_msgSend(v15, "encodeBool:forKey:", -[MAAutoAssetControlStatistics garbageCollectionReclaimSpace](self, "garbageCollectionReclaimSpace"), CFSTR("garbageCollectionReclaimSpace"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics garbageCollectionTotalReclaimedSpace](self, "garbageCollectionTotalReclaimedSpace"), CFSTR("garbageCollectionTotalReclaimedSpace"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedV2AssetCount](self, "garbageCollectionReclaimedV2AssetCount"), CFSTR("garbageCollectionReclaimedV2AssetCount"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedV2AssetSpace](self, "garbageCollectionReclaimedV2AssetSpace"), CFSTR("garbageCollectionReclaimedV2AssetSpace"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedUnlockedCount](self, "garbageCollectionReclaimedUnlockedCount"), CFSTR("garbageCollectionReclaimedUnlockedCount"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedUnlockedSpace](self, "garbageCollectionReclaimedUnlockedSpace"), CFSTR("garbageCollectionReclaimedUnlockedSpace"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableCount](self, "garbageCollectionReclaimedLockedOverridableCount"), CFSTR("garbageCollectionReclaimedLockedOverridableCount"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableSpace](self, "garbageCollectionReclaimedLockedOverridableSpace"), CFSTR("garbageCollectionReclaimedLockedOverridableSpace"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveCount](self, "garbageCollectionReclaimedLockedNeverRemoveCount"), CFSTR("garbageCollectionReclaimedLockedNeverRemoveCount"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveSpace](self, "garbageCollectionReclaimedLockedNeverRemoveSpace"), CFSTR("garbageCollectionReclaimedLockedNeverRemoveSpace"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedStagedCount](self, "garbageCollectionReclaimedStagedCount"), CFSTR("garbageCollectionReclaimedStagedCount"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedStagedSpace](self, "garbageCollectionReclaimedStagedSpace"), CFSTR("garbageCollectionReclaimedStagedSpace"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedCount](self, "garbageCollectionReclaimedMetadataBlockedCount"), CFSTR("garbageCollectionReclaimedMetadataBlockedCount"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedSpace](self, "garbageCollectionReclaimedMetadataBlockedSpace"), CFSTR("garbageCollectionReclaimedMetadataBlockedSpace"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  MAAutoAssetControlStatistics *v3;
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
  void *v23;
  void *v24;
  void *v25;

  v3 = objc_alloc_init(MAAutoAssetControlStatistics);
  -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  -[MAAutoAssetControlStatistics setTotalClientRequests:](v3, "setTotalClientRequests:", v5);

  -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[MAAutoAssetControlStatistics setTotalClientRepliesSuccess:](v3, "setTotalClientRepliesSuccess:", v7);

  -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[MAAutoAssetControlStatistics setTotalClientRepliesFailure:](v3, "setTotalClientRepliesFailure:", v9);

  -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[MAAutoAssetControlStatistics setTotalQueuedClientRequests:](v3, "setTotalQueuedClientRequests:", v11);

  -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  -[MAAutoAssetControlStatistics setTotalDequeuedClientRequests:](v3, "setTotalDequeuedClientRequests:", v13);

  -[MAAutoAssetControlStatistics setTotalAutoAssetJobsStarted:](v3, "setTotalAutoAssetJobsStarted:", -[MAAutoAssetControlStatistics totalAutoAssetJobsStarted](self, "totalAutoAssetJobsStarted"));
  -[MAAutoAssetControlStatistics setTotalAutoJobsFinished:](v3, "setTotalAutoJobsFinished:", -[MAAutoAssetControlStatistics totalAutoJobsFinished](self, "totalAutoJobsFinished"));
  -[MAAutoAssetControlStatistics setTotalStagerDetermineJobsStarted:](v3, "setTotalStagerDetermineJobsStarted:", -[MAAutoAssetControlStatistics totalStagerDetermineJobsStarted](self, "totalStagerDetermineJobsStarted"));
  -[MAAutoAssetControlStatistics setTotalStagerDetermineJobsFinished:](v3, "setTotalStagerDetermineJobsFinished:", -[MAAutoAssetControlStatistics totalStagerDetermineJobsFinished](self, "totalStagerDetermineJobsFinished"));
  -[MAAutoAssetControlStatistics setTotalStagerDownloadJobsStarted:](v3, "setTotalStagerDownloadJobsStarted:", -[MAAutoAssetControlStatistics totalStagerDownloadJobsStarted](self, "totalStagerDownloadJobsStarted"));
  -[MAAutoAssetControlStatistics setTotalStagerDownloadJobsFinished:](v3, "setTotalStagerDownloadJobsFinished:", -[MAAutoAssetControlStatistics totalStagerDownloadJobsFinished](self, "totalStagerDownloadJobsFinished"));
  -[MAAutoAssetControlStatistics setTotalResumedInFlightJobs:](v3, "setTotalResumedInFlightJobs:", -[MAAutoAssetControlStatistics totalResumedInFlightJobs](self, "totalResumedInFlightJobs"));
  -[MAAutoAssetControlStatistics setTotalSchedulerTriggeredJobs:](v3, "setTotalSchedulerTriggeredJobs:", -[MAAutoAssetControlStatistics totalSchedulerTriggeredJobs](self, "totalSchedulerTriggeredJobs"));
  -[MAAutoAssetControlStatistics setTotalFailuresToStartJobs:](v3, "setTotalFailuresToStartJobs:", -[MAAutoAssetControlStatistics totalFailuresToStartJobs](self, "totalFailuresToStartJobs"));
  -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  -[MAAutoAssetControlStatistics setPreviouslyDownloaded:](v3, "setPreviouslyDownloaded:", v15);

  -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");
  -[MAAutoAssetControlStatistics setTotalDownloaded:](v3, "setTotalDownloaded:", v17);

  -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  -[MAAutoAssetControlStatistics setTotalStaged:](v3, "setTotalStaged:", v19);

  -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");
  -[MAAutoAssetControlStatistics setTotalUnstaged:](v3, "setTotalUnstaged:", v21);

  -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");
  -[MAAutoAssetControlStatistics setTotalPromoted:](v3, "setTotalPromoted:", v23);

  -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");
  -[MAAutoAssetControlStatistics setTotalRemoved:](v3, "setTotalRemoved:", v25);

  -[MAAutoAssetControlStatistics setFinishedJobSchedulerNetworkFailure:](v3, "setFinishedJobSchedulerNetworkFailure:", -[MAAutoAssetControlStatistics finishedJobSchedulerNetworkFailure](self, "finishedJobSchedulerNetworkFailure"));
  -[MAAutoAssetControlStatistics setFinishedJobSchedulerNotNetworkRelated:](v3, "setFinishedJobSchedulerNotNetworkRelated:", -[MAAutoAssetControlStatistics finishedJobSchedulerNotNetworkRelated](self, "finishedJobSchedulerNotNetworkRelated"));
  -[MAAutoAssetControlStatistics setFinishedJobClientNetworkFailure:](v3, "setFinishedJobClientNetworkFailure:", -[MAAutoAssetControlStatistics finishedJobClientNetworkFailure](self, "finishedJobClientNetworkFailure"));
  -[MAAutoAssetControlStatistics setFinishedJobClientNotNetworkRelated:](v3, "setFinishedJobClientNotNetworkRelated:", -[MAAutoAssetControlStatistics finishedJobClientNotNetworkRelated](self, "finishedJobClientNotNetworkRelated"));
  -[MAAutoAssetControlStatistics setGarbageCollectionPerformed:](v3, "setGarbageCollectionPerformed:", -[MAAutoAssetControlStatistics garbageCollectionPerformed](self, "garbageCollectionPerformed"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimSpace:](v3, "setGarbageCollectionReclaimSpace:", -[MAAutoAssetControlStatistics garbageCollectionReclaimSpace](self, "garbageCollectionReclaimSpace"));
  -[MAAutoAssetControlStatistics setGarbageCollectionTotalReclaimedSpace:](v3, "setGarbageCollectionTotalReclaimedSpace:", -[MAAutoAssetControlStatistics garbageCollectionTotalReclaimedSpace](self, "garbageCollectionTotalReclaimedSpace"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedV2AssetCount:](v3, "setGarbageCollectionReclaimedV2AssetCount:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedV2AssetCount](self, "garbageCollectionReclaimedV2AssetCount"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedV2AssetSpace:](v3, "setGarbageCollectionReclaimedV2AssetSpace:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedV2AssetSpace](self, "garbageCollectionReclaimedV2AssetSpace"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedUnlockedCount:](v3, "setGarbageCollectionReclaimedUnlockedCount:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedUnlockedCount](self, "garbageCollectionReclaimedUnlockedCount"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedUnlockedSpace:](v3, "setGarbageCollectionReclaimedUnlockedSpace:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedUnlockedSpace](self, "garbageCollectionReclaimedUnlockedSpace"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedLockedOverridableCount:](v3, "setGarbageCollectionReclaimedLockedOverridableCount:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableCount](self, "garbageCollectionReclaimedLockedOverridableCount"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedLockedOverridableSpace:](v3, "setGarbageCollectionReclaimedLockedOverridableSpace:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableSpace](self, "garbageCollectionReclaimedLockedOverridableSpace"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedLockedNeverRemoveCount:](v3, "setGarbageCollectionReclaimedLockedNeverRemoveCount:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveCount](self, "garbageCollectionReclaimedLockedNeverRemoveCount"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedLockedNeverRemoveSpace:](v3, "setGarbageCollectionReclaimedLockedNeverRemoveSpace:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveSpace](self, "garbageCollectionReclaimedLockedNeverRemoveSpace"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedStagedCount:](v3, "setGarbageCollectionReclaimedStagedCount:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedStagedCount](self, "garbageCollectionReclaimedStagedCount"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedStagedSpace:](v3, "setGarbageCollectionReclaimedStagedSpace:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedStagedSpace](self, "garbageCollectionReclaimedStagedSpace"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedMetadataBlockedCount:](v3, "setGarbageCollectionReclaimedMetadataBlockedCount:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedCount](self, "garbageCollectionReclaimedMetadataBlockedCount"));
  -[MAAutoAssetControlStatistics setGarbageCollectionReclaimedMetadataBlockedSpace:](v3, "setGarbageCollectionReclaimedMetadataBlockedSpace:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedSpace](self, "garbageCollectionReclaimedMetadataBlockedSpace"));
  return v3;
}

+ (id)allocStringForBytes:(int64_t)a3
{
  __CFString *v4;
  int64_t v5;
  __CFString *v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (!a3)
    return CFSTR("0 bytes");
  v4 = &stru_1E5D5F930;
  if (a3 >= 0)
  {
    v5 = a3;
  }
  else
  {
    v4 = CFSTR("NEGATIVE ");
    v5 = a3 + 0x3FFFFFFF;
  }
  v6 = v4;
  v7 = a3 - (v5 & 0xFFFFFFFFC0000000);
  if (a3 >= (uint64_t)(v5 & 0xFFFFFFFFC0000000))
    v8 = a3 - (v5 & 0xFFFFFFFFC0000000);
  else
    v8 = v7 + 0xFFFFF;
  v9 = v7 - (v8 & 0xFFFFFFFFFFF00000);
  if (v7 >= (uint64_t)(v8 & 0xFFFFFFFFFFF00000))
    v10 = v7 - (v8 & 0xFFFFFFFFFFF00000);
  else
    v10 = v9 + 1023;
  v11 = v9 - (v10 & 0xFFFFFFFFFFFFFC00);
  if (v11 == 1)
  {
    v12 = CFSTR(" 1 byte");
  }
  else if (v11 < 2)
  {
    v12 = &stru_1E5D5F930;
  }
  else
  {
    v12 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" %lld bytes"), v9 - (v10 & 0xFFFFFFFFFFFFFC00));
  }
  v14 = v8 >> 20;
  if (a3 < 0x40000000)
  {
    if (v7 < 0x100000)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (v9 < 1024)
        v15 = objc_msgSend(v16, "initWithFormat:", CFSTR("%@%lld bytes"), v6, a3, v18, v19, v20);
      else
        v15 = objc_msgSend(v16, "initWithFormat:", CFSTR("%@%lldKB%@"), v6, v10 >> 10, v12, v19, v20);
    }
    else
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%lldMB %lldKB%@"), v6, v14, v10 >> 10, v12, v20);
    }
  }
  else
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%lldGB %lldMB %lldKB%@"), v6, v5 >> 30, v14, v10 >> 10, v12);
  }
  v13 = (void *)v15;

  return v13;
}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
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
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;

  v131 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = objc_msgSend(v157, "interestInContent");
  -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = objc_msgSend(v156, "checkForNewer");
  -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = objc_msgSend(v155, "determineIfAvailable");
  -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = objc_msgSend(v154, "currentStatus");
  -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = objc_msgSend(v153, "lockContent");
  -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_msgSend(v152, "continueLockUsage");
  -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = objc_msgSend(v151, "endLockUsage");
  -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v150, "endPreviousLocks");
  -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v149, "endAllPreviousLocks");
  -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend(v148, "stageDetermineAllAvailable");
  -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v147, "stageDownloadAll");
  -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend(v146, "stagePurgeAll");
  -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v145, "stageEraseAll");
  -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = objc_msgSend(v144, "interestInContent");
  -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v143, "checkForNewer");
  -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v142, "determineIfAvailable");
  -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = objc_msgSend(v141, "currentStatus");
  -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v140, "lockContent");
  -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v139, "continueLockUsage");
  -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v138, "endLockUsage");
  -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v137, "endPreviousLocks");
  -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v136, "endAllPreviousLocks");
  -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v135, "stageDetermineAllAvailable");
  -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v134, "stageDownloadAll");
  -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v133, "stagePurgeAll");
  -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(v132, "interestInContent");
  -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v130, "checkForNewer");
  -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v128, "determineIfAvailable");
  -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v126, "currentStatus");
  -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v124, "lockContent");
  -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v121, "continueLockUsage");
  -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v119, "endLockUsage");
  -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v117, "endPreviousLocks");
  -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v115, "endAllPreviousLocks");
  -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v112, "stageDetermineAllAvailable");
  -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v110, "stageDownloadAll");
  -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v108, "stagePurgeAll");
  -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v106, "interestInContent");
  -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v103, "checkForNewer");
  -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v101, "determineIfAvailable");
  -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v99, "currentStatus");
  -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v96, "lockContent");
  -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v94, "continueLockUsage");
  -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v92, "endLockUsage");
  -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v90, "endPreviousLocks");
  -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v87, "endAllPreviousLocks");
  -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v85, "stageDetermineAllAvailable");
  -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v83, "stageDownloadAll");
  -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v81, "stagePurgeAll");
  -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v78, "interestInContent");
  -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v76, "checkForNewer");
  -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v75, "determineIfAvailable");
  -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v74, "currentStatus");
  -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v73, "lockContent");
  -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v72, "continueLockUsage");
  -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v70, "endLockUsage");
  -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v67, "endPreviousLocks");
  -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v65, "endAllPreviousLocks");
  -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v63, "stageDetermineAllAvailable");
  -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v60, "stageDownloadAll");
  -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "stagePurgeAll");
  -[MAAutoAssetControlStatistics totalAutoAssetJobsStarted](self, "totalAutoAssetJobsStarted");
  -[MAAutoAssetControlStatistics totalAutoJobsFinished](self, "totalAutoJobsFinished");
  -[MAAutoAssetControlStatistics totalStagerDetermineJobsStarted](self, "totalStagerDetermineJobsStarted");
  -[MAAutoAssetControlStatistics totalStagerDetermineJobsFinished](self, "totalStagerDetermineJobsFinished");
  -[MAAutoAssetControlStatistics totalStagerDownloadJobsStarted](self, "totalStagerDownloadJobsStarted");
  -[MAAutoAssetControlStatistics totalStagerDownloadJobsFinished](self, "totalStagerDownloadJobsFinished");
  -[MAAutoAssetControlStatistics totalResumedInFlightJobs](self, "totalResumedInFlightJobs");
  -[MAAutoAssetControlStatistics totalSchedulerTriggeredJobs](self, "totalSchedulerTriggeredJobs");
  -[MAAutoAssetControlStatistics totalFailuresToStartJobs](self, "totalFailuresToStartJobs");
  -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "patchedAssets");
  -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "patchedBytes");
  -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "fullAssets");
  -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "fullBytes");
  -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "patchedAssets");
  -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "patchedBytes");
  -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "fullAssets");
  -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "fullBytes");
  -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "patchedAssets");
  -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "patchedBytes");
  -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "fullAssets");
  -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "fullBytes");
  -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "patchedAssets");
  -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "patchedBytes");
  -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fullAssets");
  -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fullBytes");
  -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "patchedAssets");
  -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "patchedBytes");
  -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fullAssets");
  -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fullBytes");
  -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "patchedAssets");
  -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "patchedBytes");
  -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fullAssets");
  -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fullBytes");
  -[MAAutoAssetControlStatistics finishedJobSchedulerNetworkFailure](self, "finishedJobSchedulerNetworkFailure");
  -[MAAutoAssetControlStatistics finishedJobSchedulerNotNetworkRelated](self, "finishedJobSchedulerNotNetworkRelated");
  -[MAAutoAssetControlStatistics finishedJobClientNetworkFailure](self, "finishedJobClientNetworkFailure");
  -[MAAutoAssetControlStatistics finishedJobClientNotNetworkRelated](self, "finishedJobClientNotNetworkRelated");
  -[MAAutoAssetControlStatistics garbageCollectionPerformed](self, "garbageCollectionPerformed");
  -[MAAutoAssetControlStatistics garbageCollectionReclaimSpace](self, "garbageCollectionReclaimSpace");
  v11 = +[MAAutoAssetControlStatistics allocStringForBytes:](MAAutoAssetControlStatistics, "allocStringForBytes:", -[MAAutoAssetControlStatistics garbageCollectionTotalReclaimedSpace](self, "garbageCollectionTotalReclaimedSpace"));
  -[MAAutoAssetControlStatistics garbageCollectionReclaimedV2AssetCount](self, "garbageCollectionReclaimedV2AssetCount");
  v10 = +[MAAutoAssetControlStatistics allocStringForBytes:](MAAutoAssetControlStatistics, "allocStringForBytes:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedV2AssetSpace](self, "garbageCollectionReclaimedV2AssetSpace"));
  -[MAAutoAssetControlStatistics garbageCollectionReclaimedUnlockedCount](self, "garbageCollectionReclaimedUnlockedCount");
  v9 = +[MAAutoAssetControlStatistics allocStringForBytes:](MAAutoAssetControlStatistics, "allocStringForBytes:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedUnlockedSpace](self, "garbageCollectionReclaimedUnlockedSpace"));
  -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableCount](self, "garbageCollectionReclaimedLockedOverridableCount");
  v8 = +[MAAutoAssetControlStatistics allocStringForBytes:](MAAutoAssetControlStatistics, "allocStringForBytes:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableSpace](self, "garbageCollectionReclaimedLockedOverridableSpace"));
  -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveCount](self, "garbageCollectionReclaimedLockedNeverRemoveCount");
  v3 = +[MAAutoAssetControlStatistics allocStringForBytes:](MAAutoAssetControlStatistics, "allocStringForBytes:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveSpace](self, "garbageCollectionReclaimedLockedNeverRemoveSpace"));
  -[MAAutoAssetControlStatistics garbageCollectionReclaimedStagedCount](self, "garbageCollectionReclaimedStagedCount");
  v4 = +[MAAutoAssetControlStatistics allocStringForBytes:](MAAutoAssetControlStatistics, "allocStringForBytes:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedStagedSpace](self, "garbageCollectionReclaimedStagedSpace"));
  -[MAAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedCount](self, "garbageCollectionReclaimedMetadataBlockedCount");
  v7 = +[MAAutoAssetControlStatistics allocStringForBytes:](MAAutoAssetControlStatistics, "allocStringForBytes:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedSpace](self, "garbageCollectionReclaimedMetadataBlockedSpace"));
  objc_msgSend(v131, "stringWithFormat:", &cfstr_CategoryStatis, v129, v127, v125, v123, v122, v120, v118, v116, v114, v113, v111, v109, v107, v105, v104, v102,
    v100,
    v98,
    v97,
    v95,
    v93,
    v91,
    v89,
    v88,
    v86,
    v84,
    v82,
    v80,
    v79,
    v77,
    v71,
    v69,
    v68,
    v66,
    v64,
    v62,
    v61,
    v59,
    v57,
    v56,
    v55,
    v54,
    v53,
    v52,
    v50,
    v48,
    v47,
    v45,
    v43,
    v41,
    v40,
    v38,
    v36,
    v34,
    v33,
    v31,
    v29,
    v27,
    v26,
    v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)summary
{
  void *v3;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _UNKNOWN **v37;
  _BOOL4 v38;
  const __CFString *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  id v44;
  int64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  int64_t v49;
  int64_t v50;
  _UNKNOWN **v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int64_t v60;
  int64_t v61;
  id v62;
  int64_t v63;
  id v64;
  int64_t v65;
  id v66;
  int64_t v67;
  const __CFString *v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  __CFString *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int64_t v94;
  int64_t v95;
  int64_t v96;
  int64_t v97;
  int64_t v98;
  int64_t v99;
  void *v100;
  int64_t v101;
  int64_t v102;
  int64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;

  -[MAAutoAssetControlStatistics totalClientRequests](self, "totalClientRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend(v3, "total");

  -[MAAutoAssetControlStatistics totalClientRepliesSuccess](self, "totalClientRepliesSuccess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v4, "total");

  -[MAAutoAssetControlStatistics totalClientRepliesFailure](self, "totalClientRepliesFailure");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend(v5, "total");

  -[MAAutoAssetControlStatistics totalQueuedClientRequests](self, "totalQueuedClientRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = objc_msgSend(v6, "total");

  -[MAAutoAssetControlStatistics totalDequeuedClientRequests](self, "totalDequeuedClientRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v7, "total");

  v99 = -[MAAutoAssetControlStatistics totalAutoAssetJobsStarted](self, "totalAutoAssetJobsStarted");
  v98 = -[MAAutoAssetControlStatistics totalStagerDetermineJobsStarted](self, "totalStagerDetermineJobsStarted");
  v97 = -[MAAutoAssetControlStatistics totalStagerDownloadJobsStarted](self, "totalStagerDownloadJobsStarted");
  v96 = -[MAAutoAssetControlStatistics totalAutoJobsFinished](self, "totalAutoJobsFinished");
  v95 = -[MAAutoAssetControlStatistics totalStagerDetermineJobsFinished](self, "totalStagerDetermineJobsFinished");
  v94 = -[MAAutoAssetControlStatistics totalStagerDownloadJobsFinished](self, "totalStagerDownloadJobsFinished");
  v103 = -[MAAutoAssetControlStatistics totalResumedInFlightJobs](self, "totalResumedInFlightJobs");
  v102 = -[MAAutoAssetControlStatistics totalSchedulerTriggeredJobs](self, "totalSchedulerTriggeredJobs");
  v101 = -[MAAutoAssetControlStatistics totalFailuresToStartJobs](self, "totalFailuresToStartJobs");
  -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v8, "patchedAssets");
  -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v9, "fullAssets");

  -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v10, "patchedBytes");
  -[MAAutoAssetControlStatistics previouslyDownloaded](self, "previouslyDownloaded");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v11, "fullBytes");

  -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v12, "patchedAssets");
  -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v13, "fullAssets");

  -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v14, "patchedBytes");
  -[MAAutoAssetControlStatistics totalDownloaded](self, "totalDownloaded");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v15, "fullBytes");

  -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "patchedAssets");
  -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v18, "fullAssets");

  -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(v19, "patchedBytes");
  -[MAAutoAssetControlStatistics totalStaged](self, "totalStaged");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v20, "fullBytes");

  -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v21, "patchedAssets");
  -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v22, "fullAssets");

  -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "patchedBytes");
  -[MAAutoAssetControlStatistics totalUnstaged](self, "totalUnstaged");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v25, "fullBytes");

  -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "patchedAssets");
  -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v28, "fullAssets");

  -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "patchedBytes");
  -[MAAutoAssetControlStatistics totalPromoted](self, "totalPromoted");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v31, "fullBytes");

  -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v32, "patchedAssets");
  -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v33, "fullAssets");

  -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "patchedBytes");
  -[MAAutoAssetControlStatistics totalRemoved](self, "totalRemoved");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v36, "fullBytes");

  v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("|jobFinished schedNWFail:%lld,schedOther:%lld,clientNWFail:%lld,clientOther:%lld"), -[MAAutoAssetControlStatistics finishedJobSchedulerNetworkFailure](self, "finishedJobSchedulerNetworkFailure"), -[MAAutoAssetControlStatistics finishedJobSchedulerNotNetworkRelated](self, "finishedJobSchedulerNotNetworkRelated"), -[MAAutoAssetControlStatistics finishedJobClientNetworkFailure](self, "finishedJobClientNetworkFailure"), -[MAAutoAssetControlStatistics finishedJobClientNotNetworkRelated](self, "finishedJobClientNotNetworkRelated"));
  v37 = &off_1E5D5C000;
  if (-[MAAutoAssetControlStatistics garbageCollectionPerformed](self, "garbageCollectionPerformed"))
  {
    v71 = objc_alloc(MEMORY[0x1E0CB3940]);
    v38 = -[MAAutoAssetControlStatistics garbageCollectionReclaimSpace](self, "garbageCollectionReclaimSpace");
    v39 = CFSTR("garbageDetermined");
    if (v38)
      v39 = CFSTR("garbageReclaimed");
    v68 = v39;
    v67 = -[MAAutoAssetControlStatistics garbageCollectionReclaimedV2AssetCount](self, "garbageCollectionReclaimedV2AssetCount");
    v66 = +[MAAutoAssetControlStatistics allocStringForBytes:](MAAutoAssetControlStatistics, "allocStringForBytes:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedV2AssetSpace](self, "garbageCollectionReclaimedV2AssetSpace"));
    v65 = -[MAAutoAssetControlStatistics garbageCollectionReclaimedUnlockedCount](self, "garbageCollectionReclaimedUnlockedCount");
    v64 = +[MAAutoAssetControlStatistics allocStringForBytes:](MAAutoAssetControlStatistics, "allocStringForBytes:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedUnlockedSpace](self, "garbageCollectionReclaimedUnlockedSpace"));
    v63 = -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableCount](self, "garbageCollectionReclaimedLockedOverridableCount");
    v70 = v24;
    v62 = +[MAAutoAssetControlStatistics allocStringForBytes:](MAAutoAssetControlStatistics, "allocStringForBytes:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedOverridableSpace](self, "garbageCollectionReclaimedLockedOverridableSpace"));
    v61 = -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveCount](self, "garbageCollectionReclaimedLockedNeverRemoveCount");
    v40 = +[MAAutoAssetControlStatistics allocStringForBytes:](MAAutoAssetControlStatistics, "allocStringForBytes:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedLockedNeverRemoveSpace](self, "garbageCollectionReclaimedLockedNeverRemoveSpace"));
    v41 = v27;
    v42 = v17;
    v43 = -[MAAutoAssetControlStatistics garbageCollectionReclaimedStagedCount](self, "garbageCollectionReclaimedStagedCount");
    v44 = +[MAAutoAssetControlStatistics allocStringForBytes:](MAAutoAssetControlStatistics, "allocStringForBytes:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedStagedSpace](self, "garbageCollectionReclaimedStagedSpace"));
    v45 = -[MAAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedCount](self, "garbageCollectionReclaimedMetadataBlockedCount");
    v69 = v35;
    v46 = +[MAAutoAssetControlStatistics allocStringForBytes:](MAAutoAssetControlStatistics, "allocStringForBytes:", -[MAAutoAssetControlStatistics garbageCollectionReclaimedMetadataBlockedSpace](self, "garbageCollectionReclaimedMetadataBlockedSpace"));
    v47 = v30;
    v48 = +[MAAutoAssetControlStatistics allocStringForBytes:](MAAutoAssetControlStatistics, "allocStringForBytes:", -[MAAutoAssetControlStatistics garbageCollectionTotalReclaimedSpace](self, "garbageCollectionTotalReclaimedSpace"));
    v60 = v43;
    v17 = v42;
    v27 = v41;
    v72 = (__CFString *)objc_msgSend(v71, "initWithFormat:", CFSTR("|%@ v2Assets:%ld(%@),unlocked:%ld(%@),lockedOverridable:%ld(%@),lockedNeverRemove:%ld(%@),staged:%ld(%@),metadataBlocked:%ld(%@),totalSpace:%@"), v68, v67, v66, v65, v64, v63, v62, v61, v40, v60, v44, v45, v46, v48);

    v30 = v47;
    v35 = v69;

    v37 = &off_1E5D5C000;
    v24 = v70;

  }
  else
  {
    v72 = &stru_1E5D5F930;
  }
  v79 = v78 + v27;
  v49 = v98 + v99;
  v100 = (void *)MEMORY[0x1E0CB3940];
  v50 = v49 + v97;
  v51 = v37;
  v52 = (void *)objc_msgSend(v37[46], "allocStringForBytes:", v90 + v91);
  v53 = (void *)objc_msgSend(v51[46], "allocStringForBytes:", v86 + v87);
  v54 = (void *)objc_msgSend(v51[46], "allocStringForBytes:", v83 + v84);
  v55 = (void *)objc_msgSend(v51[46], "allocStringForBytes:", v80 + v24);
  v56 = (void *)objc_msgSend(v51[46], "allocStringForBytes:", v76 + v30);
  v57 = (void *)objc_msgSend(v51[46], "allocStringForBytes:", v73 + v35);
  objc_msgSend(v100, "stringWithFormat:", CFSTR("[totalClient requests:%lld,success:%lld,failure:%lld,queued:%lld,dequeued:%lld|totalJobs started:%lld,finished:%lld|totalInFlight:%lld|totalScheduler:%lld|totalFailuresToStart:%lld|previouslyDownloaded assets:%lld(%@)|totalDownloaded assets:%lld(%@)|totalStaged assets:%lld(%@)|totalUnstaged assets:%lld(%@)|totalPromoted assets:%lld(%@)|totalRemoved assets:%lld(%@)%@%@]"), v108, v107, v106, v105, v104, v50, v95 + v96 + v94, v103, v102, v101, v92 + v93, v52, v88 + v89, v53, v85 + v17, v54,
    v81 + v82,
    v55,
    v79,
    v56,
    v74 + v75,
    v57,
    v77,
    v72);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  return v58;
}

- (MAAutoAssetControlStatisticsByCommand)totalClientRequests
{
  return self->_totalClientRequests;
}

- (void)setTotalClientRequests:(id)a3
{
  objc_storeStrong((id *)&self->_totalClientRequests, a3);
}

- (MAAutoAssetControlStatisticsByCommand)totalClientRepliesSuccess
{
  return self->_totalClientRepliesSuccess;
}

- (void)setTotalClientRepliesSuccess:(id)a3
{
  objc_storeStrong((id *)&self->_totalClientRepliesSuccess, a3);
}

- (MAAutoAssetControlStatisticsByCommand)totalClientRepliesFailure
{
  return self->_totalClientRepliesFailure;
}

- (void)setTotalClientRepliesFailure:(id)a3
{
  objc_storeStrong((id *)&self->_totalClientRepliesFailure, a3);
}

- (MAAutoAssetControlStatisticsByCommand)totalQueuedClientRequests
{
  return self->_totalQueuedClientRequests;
}

- (void)setTotalQueuedClientRequests:(id)a3
{
  objc_storeStrong((id *)&self->_totalQueuedClientRequests, a3);
}

- (MAAutoAssetControlStatisticsByCommand)totalDequeuedClientRequests
{
  return self->_totalDequeuedClientRequests;
}

- (void)setTotalDequeuedClientRequests:(id)a3
{
  objc_storeStrong((id *)&self->_totalDequeuedClientRequests, a3);
}

- (int64_t)totalAutoAssetJobsStarted
{
  return self->_totalAutoAssetJobsStarted;
}

- (void)setTotalAutoAssetJobsStarted:(int64_t)a3
{
  self->_totalAutoAssetJobsStarted = a3;
}

- (int64_t)totalAutoJobsFinished
{
  return self->_totalAutoJobsFinished;
}

- (void)setTotalAutoJobsFinished:(int64_t)a3
{
  self->_totalAutoJobsFinished = a3;
}

- (int64_t)totalStagerDetermineJobsStarted
{
  return self->_totalStagerDetermineJobsStarted;
}

- (void)setTotalStagerDetermineJobsStarted:(int64_t)a3
{
  self->_totalStagerDetermineJobsStarted = a3;
}

- (int64_t)totalStagerDetermineJobsFinished
{
  return self->_totalStagerDetermineJobsFinished;
}

- (void)setTotalStagerDetermineJobsFinished:(int64_t)a3
{
  self->_totalStagerDetermineJobsFinished = a3;
}

- (int64_t)totalStagerDownloadJobsStarted
{
  return self->_totalStagerDownloadJobsStarted;
}

- (void)setTotalStagerDownloadJobsStarted:(int64_t)a3
{
  self->_totalStagerDownloadJobsStarted = a3;
}

- (int64_t)totalStagerDownloadJobsFinished
{
  return self->_totalStagerDownloadJobsFinished;
}

- (void)setTotalStagerDownloadJobsFinished:(int64_t)a3
{
  self->_totalStagerDownloadJobsFinished = a3;
}

- (int64_t)totalResumedInFlightJobs
{
  return self->_totalResumedInFlightJobs;
}

- (void)setTotalResumedInFlightJobs:(int64_t)a3
{
  self->_totalResumedInFlightJobs = a3;
}

- (int64_t)totalSchedulerTriggeredJobs
{
  return self->_totalSchedulerTriggeredJobs;
}

- (void)setTotalSchedulerTriggeredJobs:(int64_t)a3
{
  self->_totalSchedulerTriggeredJobs = a3;
}

- (int64_t)totalFailuresToStartJobs
{
  return self->_totalFailuresToStartJobs;
}

- (void)setTotalFailuresToStartJobs:(int64_t)a3
{
  self->_totalFailuresToStartJobs = a3;
}

- (MAAutoAssetControlStatisticsBySize)previouslyDownloaded
{
  return self->_previouslyDownloaded;
}

- (void)setPreviouslyDownloaded:(id)a3
{
  objc_storeStrong((id *)&self->_previouslyDownloaded, a3);
}

- (MAAutoAssetControlStatisticsBySize)totalDownloaded
{
  return self->_totalDownloaded;
}

- (void)setTotalDownloaded:(id)a3
{
  objc_storeStrong((id *)&self->_totalDownloaded, a3);
}

- (MAAutoAssetControlStatisticsBySize)totalStaged
{
  return self->_totalStaged;
}

- (void)setTotalStaged:(id)a3
{
  objc_storeStrong((id *)&self->_totalStaged, a3);
}

- (MAAutoAssetControlStatisticsBySize)totalUnstaged
{
  return self->_totalUnstaged;
}

- (void)setTotalUnstaged:(id)a3
{
  objc_storeStrong((id *)&self->_totalUnstaged, a3);
}

- (MAAutoAssetControlStatisticsBySize)totalPromoted
{
  return self->_totalPromoted;
}

- (void)setTotalPromoted:(id)a3
{
  objc_storeStrong((id *)&self->_totalPromoted, a3);
}

- (MAAutoAssetControlStatisticsBySize)totalRemoved
{
  return self->_totalRemoved;
}

- (void)setTotalRemoved:(id)a3
{
  objc_storeStrong((id *)&self->_totalRemoved, a3);
}

- (int64_t)finishedJobSchedulerNetworkFailure
{
  return self->_finishedJobSchedulerNetworkFailure;
}

- (void)setFinishedJobSchedulerNetworkFailure:(int64_t)a3
{
  self->_finishedJobSchedulerNetworkFailure = a3;
}

- (int64_t)finishedJobSchedulerNotNetworkRelated
{
  return self->_finishedJobSchedulerNotNetworkRelated;
}

- (void)setFinishedJobSchedulerNotNetworkRelated:(int64_t)a3
{
  self->_finishedJobSchedulerNotNetworkRelated = a3;
}

- (int64_t)finishedJobClientNetworkFailure
{
  return self->_finishedJobClientNetworkFailure;
}

- (void)setFinishedJobClientNetworkFailure:(int64_t)a3
{
  self->_finishedJobClientNetworkFailure = a3;
}

- (int64_t)finishedJobClientNotNetworkRelated
{
  return self->_finishedJobClientNotNetworkRelated;
}

- (void)setFinishedJobClientNotNetworkRelated:(int64_t)a3
{
  self->_finishedJobClientNotNetworkRelated = a3;
}

- (BOOL)garbageCollectionPerformed
{
  return self->_garbageCollectionPerformed;
}

- (void)setGarbageCollectionPerformed:(BOOL)a3
{
  self->_garbageCollectionPerformed = a3;
}

- (BOOL)garbageCollectionReclaimSpace
{
  return self->_garbageCollectionReclaimSpace;
}

- (void)setGarbageCollectionReclaimSpace:(BOOL)a3
{
  self->_garbageCollectionReclaimSpace = a3;
}

- (int64_t)garbageCollectionTotalReclaimedSpace
{
  return self->_garbageCollectionTotalReclaimedSpace;
}

- (void)setGarbageCollectionTotalReclaimedSpace:(int64_t)a3
{
  self->_garbageCollectionTotalReclaimedSpace = a3;
}

- (int64_t)garbageCollectionReclaimedV2AssetCount
{
  return self->_garbageCollectionReclaimedV2AssetCount;
}

- (void)setGarbageCollectionReclaimedV2AssetCount:(int64_t)a3
{
  self->_garbageCollectionReclaimedV2AssetCount = a3;
}

- (int64_t)garbageCollectionReclaimedV2AssetSpace
{
  return self->_garbageCollectionReclaimedV2AssetSpace;
}

- (void)setGarbageCollectionReclaimedV2AssetSpace:(int64_t)a3
{
  self->_garbageCollectionReclaimedV2AssetSpace = a3;
}

- (int64_t)garbageCollectionReclaimedUnlockedCount
{
  return self->_garbageCollectionReclaimedUnlockedCount;
}

- (void)setGarbageCollectionReclaimedUnlockedCount:(int64_t)a3
{
  self->_garbageCollectionReclaimedUnlockedCount = a3;
}

- (int64_t)garbageCollectionReclaimedUnlockedSpace
{
  return self->_garbageCollectionReclaimedUnlockedSpace;
}

- (void)setGarbageCollectionReclaimedUnlockedSpace:(int64_t)a3
{
  self->_garbageCollectionReclaimedUnlockedSpace = a3;
}

- (int64_t)garbageCollectionReclaimedLockedOverridableCount
{
  return self->_garbageCollectionReclaimedLockedOverridableCount;
}

- (void)setGarbageCollectionReclaimedLockedOverridableCount:(int64_t)a3
{
  self->_garbageCollectionReclaimedLockedOverridableCount = a3;
}

- (int64_t)garbageCollectionReclaimedLockedOverridableSpace
{
  return self->_garbageCollectionReclaimedLockedOverridableSpace;
}

- (void)setGarbageCollectionReclaimedLockedOverridableSpace:(int64_t)a3
{
  self->_garbageCollectionReclaimedLockedOverridableSpace = a3;
}

- (int64_t)garbageCollectionReclaimedLockedNeverRemoveCount
{
  return self->_garbageCollectionReclaimedLockedNeverRemoveCount;
}

- (void)setGarbageCollectionReclaimedLockedNeverRemoveCount:(int64_t)a3
{
  self->_garbageCollectionReclaimedLockedNeverRemoveCount = a3;
}

- (int64_t)garbageCollectionReclaimedLockedNeverRemoveSpace
{
  return self->_garbageCollectionReclaimedLockedNeverRemoveSpace;
}

- (void)setGarbageCollectionReclaimedLockedNeverRemoveSpace:(int64_t)a3
{
  self->_garbageCollectionReclaimedLockedNeverRemoveSpace = a3;
}

- (int64_t)garbageCollectionReclaimedStagedCount
{
  return self->_garbageCollectionReclaimedStagedCount;
}

- (void)setGarbageCollectionReclaimedStagedCount:(int64_t)a3
{
  self->_garbageCollectionReclaimedStagedCount = a3;
}

- (int64_t)garbageCollectionReclaimedStagedSpace
{
  return self->_garbageCollectionReclaimedStagedSpace;
}

- (void)setGarbageCollectionReclaimedStagedSpace:(int64_t)a3
{
  self->_garbageCollectionReclaimedStagedSpace = a3;
}

- (int64_t)garbageCollectionReclaimedMetadataBlockedCount
{
  return self->_garbageCollectionReclaimedMetadataBlockedCount;
}

- (void)setGarbageCollectionReclaimedMetadataBlockedCount:(int64_t)a3
{
  self->_garbageCollectionReclaimedMetadataBlockedCount = a3;
}

- (int64_t)garbageCollectionReclaimedMetadataBlockedSpace
{
  return self->_garbageCollectionReclaimedMetadataBlockedSpace;
}

- (void)setGarbageCollectionReclaimedMetadataBlockedSpace:(int64_t)a3
{
  self->_garbageCollectionReclaimedMetadataBlockedSpace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalRemoved, 0);
  objc_storeStrong((id *)&self->_totalPromoted, 0);
  objc_storeStrong((id *)&self->_totalUnstaged, 0);
  objc_storeStrong((id *)&self->_totalStaged, 0);
  objc_storeStrong((id *)&self->_totalDownloaded, 0);
  objc_storeStrong((id *)&self->_previouslyDownloaded, 0);
  objc_storeStrong((id *)&self->_totalDequeuedClientRequests, 0);
  objc_storeStrong((id *)&self->_totalQueuedClientRequests, 0);
  objc_storeStrong((id *)&self->_totalClientRepliesFailure, 0);
  objc_storeStrong((id *)&self->_totalClientRepliesSuccess, 0);
  objc_storeStrong((id *)&self->_totalClientRequests, 0);
}

@end
