@implementation HDInsertRacingClustersOperation

- (HDInsertRacingClustersOperation)initWithClusters:(id)a3 provenance:(int64_t)a4
{
  id v6;
  HDInsertRacingClustersOperation *v7;
  uint64_t v8;
  NSArray *clusters;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDInsertRacingClustersOperation;
  v7 = -[HDInsertRacingClustersOperation init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    clusters = v7->_clusters;
    v7->_clusters = (NSArray *)v8;

    v7->_provenance = a4;
  }

  return v7;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  NSArray *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  int64_t provenance;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  __int128 v36;
  id *v37;
  NSArray *v38;
  uint64_t v39;
  id v40;
  HDInsertRacingClustersOperation *v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  HDInsertRacingClustersOperation *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v8 = a4;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v41 = self;
  v9 = self->_clusters;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v48;
    *(_QWORD *)&v11 = 138543362;
    v36 = v11;
    v37 = a5;
    v38 = v9;
    v39 = *(_QWORD *)v48;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v48 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v14);
      objc_msgSend(v15, "eligibleClusterUUIDs", v36);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17)
      {
        objc_msgSend(v15, "eligibleClusterUUIDs");
        v18 = objc_claimAutoreleasedReturnValue();
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __72__HDInsertRacingClustersOperation_performWithProfile_transaction_error___block_invoke;
        v44[3] = &unk_1E6CFC988;
        v19 = v8;
        v45 = v19;
        v46 = v41;
        objc_msgSend((id)v18, "hk_map:", v44);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v18) = +[HDRaceRouteClusterEntity pruneRaceRouteClustersWithEligibleEntities:transaction:error:](HDRaceRouteClusterEntity, "pruneRaceRouteClustersWithEligibleEntities:transaction:error:", v20, v19, a5);
        if ((v18 & 1) == 0)
        {
          LOBYTE(v34) = 0;
          goto LABEL_26;
        }
        goto LABEL_22;
      }
      objc_msgSend(v40, "syncIdentityManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "legacySyncIdentity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v15, "hasSyncIdentity"))
        goto LABEL_13;
      v23 = v8;
      objc_msgSend(v15, "syncIdentity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0;
      +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v24, &v43);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v43;

      if (v25)
      {
        objc_msgSend(v40, "syncIdentityManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v26;
        objc_msgSend(v27, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v25, 1, v23, &v42);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v42;

        if (v28)
        {

          v22 = (void *)v28;
          v8 = v23;
          a5 = v37;
LABEL_13:
          provenance = v41->_provenance;
          objc_msgSend(v22, "entity");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          +[HDRaceRouteClusterEntity insertCodableCluster:syncProvenance:syncIdentity:transaction:error:](HDRaceRouteClusterEntity, "insertCodableCluster:syncProvenance:syncIdentity:transaction:error:", v15, provenance, objc_msgSend(v31, "persistentID"), v8, a5);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v34)
          {

            v9 = v38;
            goto LABEL_26;
          }
          v9 = v38;
          goto LABEL_21;
        }
        _HKInitializeLogging();
        v33 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v36;
          v52 = v29;
          _os_log_fault_impl(&dword_1B7802000, v33, OS_LOG_TYPE_FAULT, "ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
        }
        v22 = 0;
        v26 = v29;
        v9 = v38;
      }
      else
      {
        _HKInitializeLogging();
        v32 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v36;
          v52 = v26;
          _os_log_fault_impl(&dword_1B7802000, v32, OS_LOG_TYPE_FAULT, "SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
        }
      }

      v8 = v23;
      a5 = v37;
LABEL_21:

      v13 = v39;
LABEL_22:
      if (v12 == ++v14)
      {
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }
  LOBYTE(v34) = 1;
LABEL_26:

  return (char)v34;
}

id __72__HDInsertRacingClustersOperation_performWithProfile_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v12 = 0;
  +[HDRaceRouteClusterEntity entityForClusterUUID:transaction:error:](HDRaceRouteClusterEntity, "entityForClusterUUID:transaction:error:", v3, v4, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (!v5)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_FAULT))
    {
      v9 = v7;
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v14 = v10;
      v15 = 2114;
      v16 = v3;
      v17 = 2114;
      v18 = v6;
      v11 = v10;
      _os_log_fault_impl(&dword_1B7802000, v9, OS_LOG_TYPE_FAULT, "%{public}@: Failed to find eligible cluster (%{public}@) during pruning: %{public}@", buf, 0x20u);

    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertRacingClustersOperation)initWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HDInsertRacingClustersOperation *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = [v4 alloc];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("clusters"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("provenance"));

  v11 = -[HDInsertRacingClustersOperation initWithClusters:provenance:](self, "initWithClusters:provenance:", v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *clusters;
  id v5;

  clusters = self->_clusters;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", clusters, CFSTR("clusters"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_provenance, CFSTR("provenance"));

}

- (NSArray)clusters
{
  return self->_clusters;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusters, 0);
}

@end
