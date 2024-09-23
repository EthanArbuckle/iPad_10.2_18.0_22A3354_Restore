@implementation _GEOServiceURLsActiveTileGroupMigrationTask

- (_GEOServiceURLsActiveTileGroupMigrationTask)init
{
  _GEOServiceURLsActiveTileGroupMigrationTask *result;

  result = (_GEOServiceURLsActiveTileGroupMigrationTask *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (_GEOServiceURLsActiveTileGroupMigrationTask)initWithMigrator:(id)a3 manifestConfiguration:(id)a4 newTileGroup:(id)a5 inResourceManifest:(id)a6 oldTileGroup:(id)a7 dataSet:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  _GEOServiceURLsActiveTileGroupMigrationTask *v18;
  _GEOServiceURLsActiveTileGroupMigrationTask *v19;
  uint64_t v20;
  GEOReportedProgress *progress;
  _GEOServiceURLsActiveTileGroupMigrationTask *v22;
  id v24;
  id v25;
  objc_super v26;

  v14 = a3;
  v25 = a4;
  v24 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)_GEOServiceURLsActiveTileGroupMigrationTask;
  v18 = -[_GEOServiceURLsActiveTileGroupMigrationTask init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_migrator, v14);
    objc_storeStrong((id *)&v19->_manifestConfiguration, a4);
    objc_storeStrong((id *)&v19->_newTileGroup, a5);
    objc_storeStrong((id *)&v19->_resourceManifest, a6);
    objc_storeStrong((id *)&v19->_oldTileGroup, a7);
    objc_storeStrong((id *)&v19->_dataSetDescription, a8);
    +[GEOReportedProgress progressWithTotalUnitCount:](GEOReportedProgress, "progressWithTotalUnitCount:", -1, v24, v25);
    v20 = objc_claimAutoreleasedReturnValue();
    progress = v19->_progress;
    v19->_progress = (GEOReportedProgress *)v20;

    v22 = v19;
  }

  return v19;
}

- (int64_t)estimatedWeight
{
  return 0;
}

- (NSProgress)progress
{
  return -[GEOReportedProgress progress](self->_progress, "progress");
}

- (void)startWithCompletionHandler:(id)a3 callbackQueue:(id)a4
{
  id v6;
  GEOReportedProgress *progress;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;

  v6 = a3;
  progress = self->_progress;
  v8 = a4;
  -[GEOReportedProgress setTotalUnitCount:](progress, "setTotalUnitCount:", 1);
  -[GEOReportedProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", 1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88___GEOServiceURLsActiveTileGroupMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke;
  block[3] = &unk_1E1C01F48;
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, block);

}

- (void)populateTileGroup:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GEOResources preferedURLSetFor:](self->_resourceManifest, "preferedURLSetFor:", self->_dataSetDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "setUrlInfoSet:", v4);

}

- (GEOActiveTileGroupMigrationTaskOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSObject)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_dataSetDescription, 0);
  objc_storeStrong((id *)&self->_oldTileGroup, 0);
  objc_storeStrong((id *)&self->_resourceManifest, 0);
  objc_storeStrong((id *)&self->_newTileGroup, 0);
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);
  objc_destroyWeak((id *)&self->_migrator);
}

@end
