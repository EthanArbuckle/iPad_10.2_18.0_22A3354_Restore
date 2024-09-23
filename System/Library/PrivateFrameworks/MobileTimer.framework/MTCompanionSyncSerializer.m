@implementation MTCompanionSyncSerializer

- (id)dataFromChange:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE3E22F8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTCompanionSyncSerializer.m"), 25, CFSTR("%@ not protobuffer serializable"), v5);

  }
  objc_msgSend(v5, "serialize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  id v4;
  MTPBSyncMessage *v5;
  __objc2_class *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  v5 = -[MTPBSyncMessage initWithData:]([MTPBSyncMessage alloc], "initWithData:", v4);

  if (-[MTPBSyncMessage hasDismissAction](v5, "hasDismissAction"))
  {
    v6 = MTSyncDismiss;
LABEL_5:
    -[__objc2_class deserialize:](v6, "deserialize:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (-[MTPBSyncMessage hasSnoozeAction](v5, "hasSnoozeAction"))
  {
    v6 = MTSyncSnooze;
    goto LABEL_5;
  }
  MTLogForCategory(6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MTCompanionSyncSerializer changeFromData:ofType:].cold.1(v8);

  v7 = 0;
LABEL_9:

  return v7;
}

- (void)changeFromData:(NSObject *)a1 ofType:.cold.1(NSObject *a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[MTPairedDeviceListener sharedListener](MTPairedDeviceListener, "sharedListener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairedDeviceVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_19AC4E000, a1, OS_LOG_TYPE_ERROR, "Dropping undecodeable sync data from %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
