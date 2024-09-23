@implementation CKOperationGroup(BRAdditions)

+ (id)br_syncDown
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Sync down"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_syncDownPeriodic
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Sync down (periodic)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_syncDownInitial
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Sync down (initial)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_syncDownPushTriggered
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Sync down (push triggered)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_syncDownAppLaunch
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Sync down (app launch)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_syncDownAppLibraryMetadata
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Sync down (app library metadata)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_syncDownZoneHealth
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Sync down (zone health)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_listDirectoryContents
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("List directory"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_fetchParentChain
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Fetch parent chain"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_locateRecord
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Locate record"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_fetchRecents
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Fetch recent documents"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_syncUp
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Sync up"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_syncUpAppLibraryMetadata
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Sync up (app library metadata)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_syncUpZoneHealth
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Sync up (zone health)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_downloadThumbnails
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Download (thumbnails)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_downloadThumbnailsUserInitiated
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Download (thumbnails user initiated)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_downloadUserInitiated
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Download (user initiated)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_downloadOpportunistic
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Download (opportunistic)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_downloadOptimizeStorageOff
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Download (optimize storage off)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_downloadUpdatedDocuments
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Download (updated documents)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_downloadConflictingVersions
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Download (conflicting versions)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_downloadSpeculative
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Download (speculative)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_upload
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Upload"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_collaborationUpload
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Collaboration upload"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_quotaUpdateUploader
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Quota update (uploader)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_quotaUpdateXPC
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Quota update (xpc request)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_quotaUpdateTelemetry
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Quota update (telemetry)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_zoneConsolidation
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Zone consolidation"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_zoneConsolidationManual
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Zone consolidation (manual)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_zoneHealthSimulation
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Zone health simulation"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_publishingRequest
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Publishing request"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_syncUpAndDownShareDB
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Sync up & down (shared db)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_sharingMisc
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Sharing misc."), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_fetchIdentityXPC
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Fetch identity (xpc request)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_purge
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Purge"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_fetchNonLocalVersions
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Fetch non local versions"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_osUpgradeMigration
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("OS upgrade migration"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_aggressiveChaining
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Aggressive PCS Chaining"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_partialSaltingCompletion
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Aggressive salting (partially salted)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_logout
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Logout"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_testTrigger
{
  id v0;
  void *v1;
  int v2;
  const char *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v3 = "";
  if (v2)
    v3 = " (SB)";
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%s"), CFSTR("Test Trigger"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  return v0;
}

+ (id)br_operationGroupWithName:()BRAdditions
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  int v7;
  const char *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0C94F88];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_msgSend(MEMORY[0x1E0DC5EE8], "br_isInSyncBubble");
  v8 = "";
  if (v7)
    v8 = " (SB)";
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%s"), v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setName:", v9);
  return v5;
}

@end
