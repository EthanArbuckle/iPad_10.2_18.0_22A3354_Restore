@implementation NTPBPersonalizationLocalData(FCAdditions)

- (id)remoteRecord
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "remoteRecordData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3710];
    v4 = objc_opt_class();
    objc_msgSend(a1, "remoteRecordData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nf_securelyUnarchiveObjectOfClass:withData:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)openChangeGroupDeltasByFeatureKey
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "openChangeGroupDeltas");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fc_dictionaryWithKeyBlock:", &__block_literal_global_160);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA70];
  v4 = v2;

  return v4;
}

- (void)setRemoteRecord:()FCAdditions
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setRemoteRecordData:", v4);

  }
  else
  {
    objc_msgSend(a1, "setRemoteRecordData:");
  }
}

@end
